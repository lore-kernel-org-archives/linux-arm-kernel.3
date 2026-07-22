Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9816C4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvPddLwq+3E5BpZogpvn3U5ADhW+cJYX5/jH9oxoba8=; b=Ox1brSd5CHCZyoEWIicVGcOaNO
	GK+1RWlNu4MAg5CY6G2PaCxcQU0fRgnAiDSIVhuPBpV+6AhkCfoppcJ7eirDglTgposw1/q/Q2IZt
	bS7InQZ8N1+bs0NZCTY+71ESzXDNB5tOxx4eHVh28P6uSVrPNdPDY+FiPt5ZH4LId6rOlT7CIcFrd
	cQCB6A8u+NfVlFMuZG8qdFsJNkoaMy2l9gcnW6ZD12oXoyu8tiqzIpkTCvML4nX1H2SUcX9l8QszL
	HugnAkmtp/nYVFYE0xAf99YyUGU0kJjY6nP73kE2F1xjpTXvIOqOm/aly0fR1qYCxnRU2H2dxOmwf
	fqgvd9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRc2-0000000B77U-0GaI;
	Wed, 22 Jul 2026 07:43:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbY-0000000B6jT-0JJm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:43:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD8BC43B7D;
	Wed, 22 Jul 2026 07:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F621F01558;
	Wed, 22 Jul 2026 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706179;
	bh=nvPddLwq+3E5BpZogpvn3U5ADhW+cJYX5/jH9oxoba8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fUS8dFaWapkl2GmY1GKbEVvw9mOTvLaIv9BN3zhNOrM94Ij+Q43Lhaxtr1tGuWNoz
	 AduxNOuBWF+ofP7Xu49HCi0cPHAN6wmbJKYWhbUzgUvHPYSn/Yh+aAJZq3ZXiZqZoQ
	 cP9/ay5XZe1ycN55vMtISdgd97JPaU8pr/z/cqda829XUq2haIuOLyTABJAeSxJF24
	 u81TZdimBGeshoedxz9ifxMLgzHpuVnqmq1RI+8I6kz/plUcF9kqBDS/sOTyTondm1
	 WH3A8+4e5+HW6FvfLFsXh6EmgCNLTR2dmTQ+2/x9mnwdwptsdhGe+A58syYTatZJ/V
	 XaWHglDssb0aA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbW-00000007VfN-0F6R;
	Wed, 22 Jul 2026 07:42:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v3 17/28] KVM: arm64: Add NV3 control bits to HCRX_EL2 sanitisation
Date: Wed, 22 Jul 2026 08:42:23 +0100
Message-ID: <20260722074234.3330999-18-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722074234.3330999-1-maz@kernel.org>
References: <20260722074234.3330999-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com
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


