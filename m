Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC435CA1003
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPTmezv4ztjq755LBsOhfuJF64uuVwleVo/XqzQlilo=; b=jL9hlse38bt1HCNflKMyvKpRU+
	M3a7dMAfPD9nPb4r+ON0mbsNZfhxI62b4NsLWl35phjRdUtI3FkkYCuuNT/BlYtRQuHtcpAzqQd8m
	Dj8defwKCxr0m2Ut9R3qqEd07gbzmQXcgNRRXW3R6KIoOkPN1xFoti6PNvfGwVzkTioq0PT/Mmzun
	CGf3qBzoUmXBCssLNhZHDi5GphKNtPfAg1wMy3d0lNzTHkMNgp05WGtPLasOAyD0TpiCQgK7TIm0p
	gQGndnOfKuJk0GC2HUz8Ax7V2MhneH2oP/8owx4qZB/tt+mjQUJBAzUMLClzmjPOTmZLd6n+ge82b
	PsVMsm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbt-0000000GZDj-000I;
	Wed, 27 Aug 2025 19:15:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIja-0000000G8nc-1YYA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FC0544ACC;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AFFC4CEF6;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311050;
	bh=lgdNfr9Ctbja/+iOstmhMjxKvrUxzqnUDnlTgWFyWRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LxjaFNfOyfmwNuoVx2quiKdqClhQKFNqr6ZdAQtPl1313bNOaC2fB/e+a1m6e2qm8
	 LqQNLbh2QqnKZlg1/WLYk9Em5rz/y0C7Mr/YWDekEXEzUkIUntLQ31ZRdVNRwPc915
	 DHVn2L+j1Km4JpTmdjVIhyaDGiK+AeKzmOYn+hAf6UmeZ9brohtcFKI70N9l1Vg7oM
	 ADd6Jc5BvuCB9dj/6cgyYxHpftj7q5wzmICrb/RkcuHMDaHHdH3LAZOYa1MDSDYTQm
	 ImStEJrsGztKM03ESCMEJNbYtDMQwRI6A/vELFZH/giEON8lN1TIRbL4pqxjOnyaMF
	 1EzI2vW67rMEA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjY-00000000yGc-0QiW;
	Wed, 27 Aug 2025 16:10:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 08/16] KVM: arm64: Expand valid block mappings to FEAT_LPA/LPA2 support
Date: Wed, 27 Aug 2025 17:10:30 +0100
Message-Id: <20250827161039.938958-9-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091050_430485_5A7891B6 
X-CRM114-Status: GOOD (  11.92  )
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
index 4d97a734e0f50..f58dfbb4df891 100644
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


