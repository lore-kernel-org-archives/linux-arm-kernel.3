Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE27C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGrWmC6A9Nhih8ZTJSzTmy0J1ibD+sCtemBTxAnvdUg=; b=mfnAF0RQQ3oJWOAYTeHVMIjnZU
	Yc48cyonR3NRSiqdt+0+Wyh9fhks/BahbX1GQ99KSplOo1JTb1qOlY/Uq5UMpT0Ql9TZxdvxcm1xZ
	4yDMXDNxnDFDExsOjfqApbr5RG7IFoouLcfjck9SJn4ABLXV5O4x6afXRNS4CVoc4HoIJzSNDsjrT
	WQ0Qr9V7bV7JuJJPoT2Ft0j6YaqZkpnfazAGmpW+p5KF/fvOxaG8yDJTYiclnutc7drGenMDGnvdn
	V5Nbjl5DHAbyijSwtoXUM1fU+2pJ7nFjJFYmjeLNg3mksgYsSNyjHmFeDF217fGWXf7W+PVLiZVrf
	h6r7wu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgo-0000000DWVg-3ZUK;
	Tue, 06 May 2025 22:23:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOu-0000000CiLP-2lO5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4E355C58D6;
	Tue,  6 May 2025 16:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA381C4CEEF;
	Tue,  6 May 2025 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549851;
	bh=ohsYi+kvjMSI4poweV2cgJnJXOURgOMhmV8B0dFFsc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KmBhs+jk5Y0q+IOP18jdtP5RJBFdB3624m9uJ49JlQC+pOdwoI6yevWQMThteMh7a
	 yUeb1bL5gzKlTlQIMo6gvRZoxlp+cZ19HWm4W+6MJyKemIAsGPcZIcXIh5dlnTQQGs
	 QJ9nGbCQnTQf8Y2xk1AiDdx+9Gjc++uJqiA35hgoIIcURzXEzxuXnEFJHlPK+SWMYf
	 ohMwQ6sHOb1AasjhWa5Yp/hWYHpiq8Ruvv2IgZHNoae9bYyu2EhK57XqKsQFGiD4Cl
	 CsywOXVimua93inebs8S220cFZ8lHn1wsWnOcLuUCDEsSOC4lxIBCM8pB8JSHerwf9
	 H+BDeoYz6Ir/Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOs-00CJkN-5B;
	Tue, 06 May 2025 17:44:10 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 18/43] KVM: arm64: Handle trapping of FEAT_LS64* instructions
Date: Tue,  6 May 2025 17:43:23 +0100
Message-Id: <20250506164348.346001-19-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094412_824972_6BD07905 
X-CRM114-Status: GOOD (  15.62  )
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

We generally don't expect FEAT_LS64* instructions to trap, unless
they are trapped by a guest hypervisor.

Otherwise, this is just the guest playing tricks on us by using
an instruction that isn't advertised, which we handle with a well
deserved UNDEF.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index b73dc26bc44b4..ff75695fb8c96 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -298,6 +298,61 @@ static int handle_svc(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+static int handle_other(struct kvm_vcpu *vcpu)
+{
+	bool is_l2 = vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu);
+	u64 hcrx = __vcpu_sys_reg(vcpu, HCRX_EL2);
+	u64 esr = kvm_vcpu_get_esr(vcpu);
+	u64 iss = ESR_ELx_ISS(esr);
+	struct kvm *kvm = vcpu->kvm;
+	bool allowed, fwd = false;
+
+	/*
+	 * We only trap for two reasons:
+	 *
+	 * - the feature is disabled, and the only outcome is to
+	 *   generate an UNDEF.
+	 *
+	 * - the feature is enabled, but a NV guest wants to trap the
+	 *   feature used by its L2 guest. We forward the exception in
+	 *   this case.
+	 *
+	 * What we don't expect is to end-up here if the guest is
+	 * expected be be able to directly use the feature, hence the
+	 * WARN_ON below.
+	 */
+	switch (iss) {
+	case ESR_ELx_ISS_OTHER_ST64BV:
+		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V);
+		if (is_l2)
+			fwd = !(hcrx & HCRX_EL2_EnASR);
+		break;
+	case ESR_ELx_ISS_OTHER_ST64BV0:
+		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA);
+		if (is_l2)
+			fwd = !(hcrx & HCRX_EL2_EnAS0);
+		break;
+	case ESR_ELx_ISS_OTHER_LDST64B:
+		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64);
+		if (is_l2)
+			fwd = !(hcrx & HCRX_EL2_EnALS);
+		break;
+	default:
+		/* Clearly, we're missing something. */
+		WARN_ON_ONCE(1);
+		allowed = false;
+	}
+
+	WARN_ON_ONCE(allowed && !fwd);
+
+	if (allowed && fwd)
+		kvm_inject_nested_sync(vcpu, esr);
+	else
+		kvm_inject_undefined(vcpu);
+
+	return 1;
+}
+
 static exit_handle_fn arm_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]	= kvm_handle_unknown_ec,
 	[ESR_ELx_EC_WFx]	= kvm_handle_wfx,
@@ -307,6 +362,7 @@ static exit_handle_fn arm_exit_handlers[] = {
 	[ESR_ELx_EC_CP14_LS]	= kvm_handle_cp14_load_store,
 	[ESR_ELx_EC_CP10_ID]	= kvm_handle_cp10_id,
 	[ESR_ELx_EC_CP14_64]	= kvm_handle_cp14_64,
+	[ESR_ELx_EC_OTHER]	= handle_other,
 	[ESR_ELx_EC_HVC32]	= handle_hvc,
 	[ESR_ELx_EC_SMC32]	= handle_smc,
 	[ESR_ELx_EC_HVC64]	= handle_hvc,
-- 
2.39.2


