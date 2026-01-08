Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37762D1D482
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZB0thUUPDLaoG5DEASqzSNe+RzehGutR2AoA6QHduA=; b=BcqTkpuSrx/+vXOWqzd4QIt+MP
	2LPaOe/xnrEyrnjHwKw97H4saPzT3RIfIcCzajugr4sKa8iXN53rRWIfTFCIVDB7nJVWZEMrTIzsY
	NXPCEYHYT/bYm3HpLaerefuNFe1CYoqetUnOrW1rFvSk5GLmH497umabP0XtBykZXrgAypj190Xun
	NZnTROWiz4/Iu4Xr6HQlf1w8qWwjo4ccP8P/Ozh82OGrncLx0nJQiEXph2ML/zVmyzQWZeLjXpSG3
	ARmb5jRNOkbLJnBkKWvWSzjKWUx69BVn5PV/PKnMXzoiDzXAclaUVwzAPl8dkK2FWXGnEHZOIgDyH
	tFD4zjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsL-00000000PUz-2Pp4;
	Thu, 08 Jan 2026 17:32:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsG-00000000POw-1jOk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B131440DB;
	Thu,  8 Jan 2026 17:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C0AC19425;
	Thu,  8 Jan 2026 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893559;
	bh=v78Ho1jfctKksx+ghNDA5fnROsXHxo8/3r+Q1Sd63M0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=liNKre/p2z+wYybw/l2XQ6GEjPKMs7/OgykCUAmBFiLjkPk3Pfx7fn8Ak2evkVWSp
	 QhgdGKQcwxmwdN+q/GAJlPK9LyaAbtgvHQ8Ne8IJBkpSelJC2pH5CEccPG5fX2vCRS
	 o1GK3piAYfK/EhXFOeEof0h1FsabSfUuTtMoADmEQf6dL4hq2lFL7J0RnAyO4dWlQJ
	 rJVt4XDXpC6TgSxM6cCLUmi27acEQyjuyoCTNtqv/nqXEdmC2E54oA7Pp4M4LoRcfm
	 Fdu1BpI45sAcnH3REVfvF1wstLCz9jImiyR9UxumuN/RgMVJjlxU01EfiTw5ILoUDm
	 QC9S/CB9kNuBQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdtsD-00000000W9F-16BJ;
	Thu, 08 Jan 2026 17:32:37 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v4 4/9] KVM: arm64: Handle FEAT_IDST for sysregs without specific handlers
Date: Thu,  8 Jan 2026 17:32:28 +0000
Message-ID: <20260108173233.2911955-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108173233.2911955-1-maz@kernel.org>
References: <20260108173233.2911955-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093240_494935_BB6B7404 
X-CRM114-Status: GOOD (  14.10  )
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

Add a bit of infrastrtcture to triage_sysreg_trap() to handle the
case of registers falling into the Feature ID space that do not
have a local handler.

For these, we can directly apply the FEAT_IDST semantics and inject
an EC=0x18 exception. Otherwise, an UNDEF will do.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 13 +++++++++++++
 arch/arm64/kvm/sys_regs.h       | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 616eb6ad68701..4aabd624c4be5 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2588,6 +2588,19 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 
 		params = esr_sys64_to_params(esr);
 
+		/*
+		 * This implements the pseudocode UnimplementedIDRegister()
+		 * helper for the purpose of dealing with FEAT_IDST.
+		 */
+		if (in_feat_id_space(&params)) {
+			if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, IMP))
+				kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
+			else
+				kvm_inject_undefined(vcpu);
+
+			return true;
+		}
+
 		/*
 		 * Check for the IMPDEF range, as per DDI0487 J.a,
 		 * D18.3.2 Reserved encodings for IMPLEMENTATION
diff --git a/arch/arm64/kvm/sys_regs.h b/arch/arm64/kvm/sys_regs.h
index b3f904472fac5..2a983664220ce 100644
--- a/arch/arm64/kvm/sys_regs.h
+++ b/arch/arm64/kvm/sys_regs.h
@@ -49,6 +49,16 @@ struct sys_reg_params {
 				  .Op2 = ((esr) >> 17) & 0x7,			\
 				  .is_write = !((esr) & 1) })
 
+/*
+ * The Feature ID space is defined as the System register space in AArch64
+ * with op0==3, op1=={0, 1, 3}, CRn==0, CRm=={0-7}, op2=={0-7}.
+ */
+static inline bool in_feat_id_space(struct sys_reg_params *p)
+{
+	return (p->Op0 == 3 && !(p->Op1 & 0b100) && p->Op1 != 2 &&
+		p->CRn == 0 && !(p->CRm & 0b1000));
+}
+
 struct sys_reg_desc {
 	/* Sysreg string for debug */
 	const char *name;
-- 
2.47.3


