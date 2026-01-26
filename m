Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B770CF65E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jdpk1tQ+f0MoBW2pGwqhhFCyA5Qe6gKLSogqDXSCkfg=; b=DaY3NJ4nUZliOLKDRfEXMA3ElT
	CyCq3R4pG+CJ8jpr8F0koEigs4J3e/jJegJaRSdkanzJiNo5Y/gDz9wAY25DU/+DLrEUMhJ0+DdlL
	0KjRUXdVf+XXo/B3w8nkayftxyMQd5rDqYiaOumXXh5Ph7Zlu+lKncCBDE/oHFOg4sQSEjdodE2lM
	0zWAIQgCrWRbxLKw0vtqf2spZ07bs0yKrEZtg7PRsRYp/w6DUNU/es6gUeyMPXxXfnuNhEolu+/qK
	F7gJbQLZebUz8JxY6yRL+d7fP1f/cUjmwbHHgQ619051vvaFivwwWmfEb/Eb6Mj26zoE2+kTUJMyn
	wCsCItSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXT-0000000CV3r-0TdR;
	Mon, 26 Jan 2026 12:17:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXE-0000000CUsR-25ut
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E9FE44468;
	Mon, 26 Jan 2026 12:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8112DC2BC86;
	Mon, 26 Jan 2026 12:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429855;
	bh=PTm8YLSVe/WgrlU0lr7yyZgygsqs+ZiX1K/HFlMRjgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bKeI1YGiUCHg53hwDL6qa8q11IrKaaJ7wzrHvlohWybi5vEbJr9A6Z1cCwBgWDq7O
	 mdFZ14MXOuF+q0nJibyQEMnAI2nxJ/R/Cu32SwT41fy6uw3hQRPEbqELiqZmpNNLrz
	 YwyQabzcoRux1N7Iand2Eejq1J1pdeoEcly3YDxZ3Ow0wsALWTn/1a12Ho3WfAZnKm
	 RHSidpZf06RP03dHJQTfimSXD4wWdrp2cWfWpY78W5ORLVikTkxtoJxz6+GwsSrkxi
	 lo+TDCRhRWaFrIHKvPq7gY6HdVWdqDA7KRpxaliYIA+2SfePkjn3UmP1v4INhNOBHP
	 nH8x3CREQZYqg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXB-00000005hx6-37fT;
	Mon, 26 Jan 2026 12:17:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 09/20] KVM: arm64: Convert HCR_EL2.RW to AS_RES1
Date: Mon, 26 Jan 2026 12:16:43 +0000
Message-ID: <20260126121655.1641736-10-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041736_596345_F9C79DB5 
X-CRM114-Status: GOOD (  10.69  )
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

Now that we have the AS_RES1 constraint, it becomes trivial to express
the HCR_EL2.RW behaviour.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 68ed5af2b4d53..39487182057a3 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -389,19 +389,6 @@ static bool feat_vmid16(struct kvm *kvm)
 	return kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16);
 }
 
-static bool compute_hcr_rw(struct kvm *kvm, u64 *bits)
-{
-	/* This is purely academic: AArch32 and NV are mutually exclusive */
-	if (bits) {
-		if (kvm_has_feat(kvm, FEAT_AA32EL1))
-			*bits &= ~HCR_EL2_RW;
-		else
-			*bits |= HCR_EL2_RW;
-	}
-
-	return true;
-}
-
 static bool compute_hcr_e2h(struct kvm *kvm, u64 *bits)
 {
 	if (bits) {
@@ -967,7 +954,7 @@ static const DECLARE_FEAT_MAP(hcrx_desc, __HCRX_EL2,
 
 static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 	NEEDS_FEAT(HCR_EL2_TID0, FEAT_AA32EL0),
-	NEEDS_FEAT_FIXED(HCR_EL2_RW, compute_hcr_rw),
+	NEEDS_FEAT_FLAG(HCR_EL2_RW, AS_RES1, FEAT_AA32EL1),
 	NEEDS_FEAT(HCR_EL2_HCD, not_feat_aa64el3),
 	NEEDS_FEAT(HCR_EL2_AMO		|
 		   HCR_EL2_BSU		|
-- 
2.47.3


