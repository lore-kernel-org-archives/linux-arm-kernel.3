Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12AACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjwjt3DsDgfJ3MLyjJ1nUTNZ0pKxHQjCJeYigc/PpbA=; b=oqdHY9k1qOKTZdiTevnyskEKrI
	IzdKHvJ3Wekke/7a6lgvZ6J5kHN8494bKUuh/R4WW4eki1yPN6MS3bzfjHw+5ph6bSD2fGKrKa5BL
	DmZbYSz5/ipvJ/9BT1Jk7shYVmj3GsN0EMq/1cZfhBr1QQxbGtnXbtD9+tEqTSmU50Bp/B+nlgTPt
	sWMa/EWDeQzroCMn+Z1DGfAZ6tqURmGPYyIQcjAaAWCfU8gHfRcDMRtjdRiUQwxzDpSsyPi4FjtPX
	t6lOL1by2CWK6im4O2ryjtbJbaRS9P+OtQWHxRrDNkjY2T8X6RVkgvs4L2ASOcZJu7jTbmk7M2z/4
	m1xJnhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7e2-00000003xvv-40l5;
	Mon, 15 Sep 2025 11:45:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dj-00000003xeO-0TwQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7852660223;
	Mon, 15 Sep 2025 11:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C81C4CEF5;
	Mon, 15 Sep 2025 11:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936698;
	bh=RIeEnuw/2CAAw6lbd+FSBlwmDg9JXCUTkPlzLWpDftg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ViKDYxt9KbtK0QeJblxeHTOBI2Awxv5lcWeduiYv1Xs7f6n7rO9pQP5TqI8K4dn8l
	 qoqm67gJJ9vlU3tvVt9VvAIQPQqo89Sx9p0fC8klW3jywY75jIV7AicfgHJjp5gXdg
	 XlCp8ayIlpEh8Vozsp6QVY2j7o+iKixF017x4K470zAKBCNbrwAIxaFiqxrqaC96PZ
	 6ClwFEI+A4A4yewNvdrER+mRcVW7wVzR3E6ABrZpk4w/CJFxeLhqGTvpwp0O+2cW8f
	 Qd9sgByVW5ZXP5r4NK4uTPyISnVWtsmaatVsKrYONVPc2Lj24UBVI9OlHmoBEsGbMk
	 8JOAoVGMwAg2A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7dg-00000006MDw-23kS;
	Mon, 15 Sep 2025 11:44:56 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 08/16] KVM: arm64: Expand valid block mappings to FEAT_LPA/LPA2 support
Date: Mon, 15 Sep 2025 12:44:43 +0100
Message-Id: <20250915114451.660351-9-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

With 52bit PAs, block mappings can exist at different levels (such
as level 0 for 4kB pages, or level 1 for 16kB and 64kB pages).

Account for this in walk_s1().

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 1c2f7719b6cbb..fad9d7828d7b6 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -448,11 +448,11 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 
 		switch (BIT(wi->pgshift)) {
 		case SZ_4K:
-			valid_block = level == 1 || level == 2;
+			valid_block = level == 1 || level == 2 || (wi->pa52bit && level == 0);
 			break;
 		case SZ_16K:
 		case SZ_64K:
-			valid_block = level == 2;
+			valid_block = level == 2 || (wi->pa52bit && level == 1);
 			break;
 		}
 
-- 
2.39.2


