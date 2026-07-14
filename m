Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89DDC4450B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvPddLwq+3E5BpZogpvn3U5ADhW+cJYX5/jH9oxoba8=; b=1495AlGY1HDkov8UErQ5ogh5QM
	SobgGKtxFrQUJaE5rDX1JDmDTXXnhqmHOUOxOK3+4saCAMQNLRqTkWR5ylJgpqz+j9/pLLzc5VBRV
	ffoL2i/Vzo67QqSfMkDIaO7cSV7b41P5DdNj1sGxO502Rov0VcN7aHevWdBa14EqfgL+695dDRd9y
	nuUufoiu4lU7oOYipvi8g/spyDUGxsmT+X9irvzdkpBNXSLYo94JF6Svov8gXTOk3tJneWB78RVqd
	quXP2EVc1nIWt6ngdTqJAzUvEDk3fo2UWzYd3AgoU61y7K/72lRSHA/kReUmtq7/n0Pb3YPpq+db7
	RitCbPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZGD-0000000BPIJ-0bDg;
	Tue, 14 Jul 2026 09:17:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjZG1-0000000BP4A-0GPg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 09:16:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 81AA16136C;
	Tue, 14 Jul 2026 09:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370C01F01560;
	Tue, 14 Jul 2026 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784020612;
	bh=nvPddLwq+3E5BpZogpvn3U5ADhW+cJYX5/jH9oxoba8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ACFwW+OCVkvlGYfr0cKseqHc/D36eWoZzGOVV/a12PmwrF1QCJivvrNeeVAYS30fz
	 VIARfmOEx4BfTNTVQbJhw1Y6PFeU1YripL+BTl0/5x3v/ihvaYMGYUj2+ZYcZ8BXqn
	 8WKSxHPaeMgjxvTGzWRfAtL3TuOevtVil6LS4HqVvUSs/sfmIinw1SswKGabqizo4J
	 uBow0SXVnDjLgg/NhT7s9pUEMYPIaU6qu11EVUeur0uc7KAPzippJPAOpE+9yRuXeB
	 Ga9ALwUzjc+3X4wdDce0G5n75nyFVJb7UT8xjzxw7QljXgiO0eTK6cL1Ug4/1eTgUq
	 8XlFDBsvlqg3A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjZFy-00000004ny1-2S0P;
	Tue, 14 Jul 2026 09:16:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 17/28] KVM: arm64: Add NV3 control bits to HCRX_EL2 sanitisation
Date: Tue, 14 Jul 2026 10:16:30 +0100
Message-ID: <20260714091641.1970822-18-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714091641.1970822-1-maz@kernel.org>
References: <20260714091641.1970822-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

Expose the FEAT_NV3 control bits to the sanitisation code so that
KVM stops moaning about the unattributed bits.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index c61d62b796023..467f57eb8e6bb 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -225,6 +225,7 @@ struct reg_feat_map_desc {
 #define FEAT_HCX		ID_AA64MMFR1_EL1, HCX, IMP
 #define FEAT_S2PIE		ID_AA64MMFR3_EL1, S2PIE, IMP
 #define FEAT_GCIE		ID_AA64PFR2_EL1, GCIE, IMP
+#define FEAT_NV3		ID_AA64MMFR4_EL1, NV_frac, NV3
 
 static bool not_feat_aa64el3(struct kvm *kvm)
 {
@@ -904,6 +905,11 @@ static const DECLARE_FEAT_MAP_FGT(hdfgwtr2_desc, hdfgwtr2_masks,
 
 
 static const struct reg_bits_to_feat_map hcrx_feat_map[] = {
+	NEEDS_FEAT(HCRX_EL2_NVTGE		|
+		   HCRX_EL2_NVnTTLB		|
+		   HCRX_EL2_NVnTTLBIS		|
+		   HCRX_EL2_NVnTTLBOS,
+		   FEAT_NV3),
 	NEEDS_FEAT(HCRX_EL2_SRMASKEn, FEAT_SRMASK),
 	NEEDS_FEAT(HCRX_EL2_PACMEn, feat_pauth_lr),
 	NEEDS_FEAT(HCRX_EL2_EnFPM, FEAT_FPMR),
-- 
2.47.3


