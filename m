Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D762EC3ABA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 12:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXYhJv9QurGI954q1kSCFNaSa9/5t0vZZozJo6/Wkes=; b=pkFE3HlScBx67MlfT7os1nO52l
	TP4mHbxQ02mpU/eauq+LBHuLdFs/uG/kTVz4jP+uEIrtpff6y+NecT6qN3jp4kJrqZtZrJHqNFDr7
	993ydlCfW9sKnz90WPitS/PhfZ93C5oHEcTcgyVkqbYlTOzaQ+eGD7XuNn2g55kCliWuKr+PvcN65
	ZKNyaazpOwiCQgsIawo6GnLXIjsstbi6iD6ZWp6ywOX/Hc7N26nSVg2ICUYkWJK24djNViJwijoPR
	csDwelAfIvvIWxaEhkt299UBNB1eXRj76RcTwN8UrzpCBIj/j6AzNDVtnyvEaYbqh/iCsXCVN/ia8
	0vH2MZcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kLk-00000009g5V-02qL;
	Tue, 29 Apr 2025 12:46:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jL2-00000009VZH-1ahb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADCE05C5A08;
	Tue, 29 Apr 2025 11:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAB5C4CEEF;
	Tue, 29 Apr 2025 11:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745926883;
	bh=Pk4WX/VQ6r0BfN7MRXOMFVphZW9NidsGpywyMc+Scuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DR+k33+jqAvaz9y6c+cN7D9lqRgJHjrPPeWPerRAI2F8O/omz5u4CxIe+hDKfCQC1
	 HtS9mOt7owGCJ184IMosP+DN31siHnl9ULRTElzSkV1VNEFjGY7YkfJQXO1iLOhZhG
	 BWVqbu9MQiRfFeD+tKM6iDr8OMLRkAeHqYrjJZgO/1PItL0sNEJ2MHfIEDbs36PF+/
	 SAUWrm4FXWACGZDA9Y+8hk7aJqpc3RusUuEAWaErCGwwSFdarXDmUVIcWJNVl5uTAi
	 JoH+YdO+7QBciOH2nIgluvj1SfQLVbTmhNWkDUEK0BgVEBAInCRM3QPUgoPY/u5dq0
	 /Q0ze7z3pl55Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u9jKz-009t0f-Ki;
	Tue, 29 Apr 2025 12:41:21 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH 2/2] KVM: arm64: selftest: Don't try to disable AArch64 support
Date: Tue, 29 Apr 2025 12:41:17 +0100
Message-Id: <20250429114117.3618800-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250429114117.3618800-1-maz@kernel.org>
References: <20250429114117.3618800-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_044124_473692_F082F45D 
X-CRM114-Status: GOOD (  11.32  )
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

Trying to cut the branch you are sat on is pretty dumb. And so is
trying to disable the instruction set you are executing on.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 322b9d3b01255..57708de2075df 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -129,10 +129,10 @@ static const struct reg_ftr_bits ftr_id_aa64pfr0_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, DIT, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, SEL2, 0),
 	REG_FTR_BITS(FTR_EXACT, ID_AA64PFR0_EL1, GIC, 0),
-	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, EL3, 0),
-	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, EL2, 0),
-	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, EL1, 0),
-	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, EL0, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, EL3, 1),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, EL2, 1),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, EL1, 1),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR0_EL1, EL0, 1),
 	REG_FTR_END,
 };
 
-- 
2.39.2


