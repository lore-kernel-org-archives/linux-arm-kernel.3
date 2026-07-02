Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5727FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4i3a3SA0E4D8pxClJTF3Hke40ERPur3j2IbFmT5XNDA=; b=usRhpitVsdmpZJec4S+uZU2u24
	N+wRNY517Lp9IDlbE6lt1g+a6i+uZ/ud+EL7pHbJfm0J0kTXRYpy2sXVwyS/ceKHtUu1BTfvXGYij
	gTV/J3ot5kyFoU5F2jBukN33KlK8hQ8Ayskaw7SPQP5155p3dqnpAe7Ih0qy6pjDfgzPMpNODPoaY
	OX4CI1ui7kQMlmfGx90d+8zXuzLNsrZV005Qlf9WqZsI3yiu1IH/GsRr9KA5qe2S59cnzdSFVPkK5
	TUqThg1eXEis0/4voDjFN2uI87NIof7h+4eHf2FlNggCJlgNsuQjh/mzl9+fKSYlscuR5nLfyxVkd
	PSYAKctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJse-00000004uVE-0rRt;
	Thu, 02 Jul 2026 16:03:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsV-00000004uFf-2sUd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FA1F43F41;
	Thu,  2 Jul 2026 16:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506761F00ACA;
	Thu,  2 Jul 2026 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008183;
	bh=4i3a3SA0E4D8pxClJTF3Hke40ERPur3j2IbFmT5XNDA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DUy1tjS50IcEg3DWDkAEEMAvhqE0HdiMjqpp/tLYlfimTRzzXkIGrbCaycHbJHAVM
	 OQCOdAx8ipSAJMy75Gf0af9bC1SSXYugQATSEGUJ8GPoUdqpY7+4OBnDLlxMdkhc9Q
	 qd/tWyz2zs1jVETICwIZxO5KIU3UziIGJLzEdbZg7xb9HhQKxIILV6S9z1KWpBfPfh
	 6dcSYvi/t5yyzy2nYFypruj+ZTHN7SF6GTRLEfSIYb7H+++tkBDTO43pKKNr6jk/+u
	 0cI/I2mrmQa6Ra50zAiWYbl31T83aQJDX6a2GC+xDp0RspzhDdsrR6zw9YGAxIyvJ/
	 tlkAtAMZN6McA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsT-00000000ojd-2JhU;
	Thu, 02 Jul 2026 16:03:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 17/28] KVM: arm64: Add NV3 control bits to HCRX_EL2 sanitisation
Date: Thu,  2 Jul 2026 17:02:37 +0100
Message-ID: <20260702160248.1377250-18-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
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
index 8d5e4aacf49c4..b9a9d65b973e6 100644
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


