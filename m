Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416E9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 18:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtMngJOY2Vd46+zgSz43H1lWYmc+1U4CZ4NVaAOk+MI=; b=LEeQFFe9VQSS1bGfhLyjW7S2Qk
	5SQo5sc0+aCN+DSpx9/AIk+Uq3AfBEXHEIpI8QyQHaiatU+o+5PBH9Spw9A95fVGdgeJ/xk3MdnYw
	4bHPXMfzW4Yb1JRrNca1QFC1xL3PSrthe5+XhQA6ZzPkvG6/ToS+f2DXY9XkIp0H3r+mklOG8FMkA
	tEm3qdpnjppUzRsXN/+Anfxy3YY3B1uACF9xCmTyI76LITV8c88G94dYGdMF9Bh1BUCO0SscMV45u
	55ee658tKKHq4cKUdDlTjQnuE7kD1nhdZGt1eo38EXHA6455rrBlSexi79xBV7EYB8Hu8wmDmTgvO
	A7Wjdzkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmzU5-00000000sca-2mE7;
	Tue, 25 Feb 2025 18:16:45 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmykd-00000000eAh-3zdU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:29:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 708E9612CD;
	Tue, 25 Feb 2025 17:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BA41C4CEDD;
	Tue, 25 Feb 2025 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504587;
	bh=e8LpeF2ClqwJ/XkkP8Drhi20EQrQ3/FY1EIo8+fWROY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rAlW4o2raaxriI+YB9CwkVCitPQrYeKwufttCbnCpIrX6/v/lpIrsqobrp3/2LPCP
	 tZUhTOo7Vmfhgz5+1vMdZ2Qk6+ErQdI5E36M+9FDG67B4w6yhqG3hu25xMldbnMJam
	 iKzF/DI/Ddvs1HQCD6Ypq7kEw9g8OrPfJXOICum8O9O0bio+Nc5e1k0APt4teUEcn5
	 g45S5Y6eQ/29qrrqwxdjqStDczxByz5WgRRyB+t4aSlJqp1pI3Uimm9A331cUz6/4S
	 o5OuQBZ0QHm2nbOGEkmNY/yGReTlalyNEved9vU5uZClDNswXTFvTd2ck8axaqnFWu
	 5ox7cbA4i2aKA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tmykb-007rKs-4t;
	Tue, 25 Feb 2025 17:29:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v4 07/16] KVM: arm64: nv: Sanitise ICH_HCR_EL2 accesses
Date: Tue, 25 Feb 2025 17:29:21 +0000
Message-Id: <20250225172930.1850838-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250225172930.1850838-1-maz@kernel.org>
References: <20250225172930.1850838-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
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

As ICH_HCR_EL2 is a VNCR accessor when runnintg NV, add some
sanitising to what gets written. Crucially, mark TDIR as RES0
if the HW doesn't support it (unlikely, but hey...), as well
as anything GICv4 related, since we only expose a GICv3 to the
uest.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 0c9387d2f5070..7c8f39070a503 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1290,6 +1290,15 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		res0 |= GENMASK(11, 8);
 	set_sysreg_masks(kvm, CNTHCTL_EL2, res0, res1);
 
+	/* ICH_HCR_EL2 */
+	res0 = ICH_HCR_EL2_RES0;
+	res1 = ICH_HCR_EL2_RES1;
+	if (!(kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_EL2_TDS))
+		res0 |= ICH_HCR_EL2_TDIR;
+	/* No GICv4 is presented to the guest */
+	res0 |= ICH_HCR_EL2_DVIM | ICH_HCR_EL2_vSGIEOICount;
+	set_sysreg_masks(kvm, ICH_HCR_EL2, res0, res1);
+
 out:
 	for (enum vcpu_sysreg sr = __SANITISED_REG_START__; sr < NR_SYS_REGS; sr++)
 		(void)__vcpu_sys_reg(vcpu, sr);
-- 
2.39.2


