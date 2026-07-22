Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6597C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUB9M22I6lR5cIA4XgQ8HOaVa6MjFO6+CCyfQOO+5Dc=; b=qK/FgtWwPF8yidaY0ZSKr/9iIo
	BuOKI+ucgXUa94hOYWeCa8I5oBQQPDwMa+EsVlipIw/F+522ko3xcCsWn1KoI64Z56lY94RvIOcI2
	uf8lxB//8EVtcU7s0Q7sFdLSCu5b24YIlPoOfbDoAlB4g5ZzPJ0DMFMnfx1uSStW56id8le6062PC
	to9ozTdnwTexrcN61o3Twh1RWoNHblUOSFRjtcH1JSFgQihFspBbFVbR2TXElj0MF+5v4x4/r7ok6
	DzqY2fGZCC51nAsjhNLlv3fkC8lhEogdM+hIKKMn99IHUNOAAmX1tT39JGaRe6mYtl7oZx0TKm1T4
	/71kfgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbW-0000000B6h8-2j6V;
	Wed, 22 Jul 2026 07:42:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRbV-0000000B6fr-0Hw9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 07:42:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9DF043F1D;
	Wed, 22 Jul 2026 07:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4E01F00A3E;
	Wed, 22 Jul 2026 07:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706176;
	bh=NUB9M22I6lR5cIA4XgQ8HOaVa6MjFO6+CCyfQOO+5Dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YGXWfeH65qo8S0vJpI8aSz6wdBn5ctl9HqUq7XwSb0wdxMVw9eqUpzK9rMdq2oTY+
	 OV7NM0ubWod5uiAfy5Tt6mMeOATcT01M2k0YfTBzeuJOmSKsqU9MEk18+6BjzeEteS
	 M30u5ZOG6Qh0AeOQ9BpdYvnEHmc7Q0dFygBXgoPm57jR6r1Gkk+LnuiVaQJn1NXZGD
	 gx+JkJ3ffybIEYCVH8Dry8ZKwL/RdyQ3jZpSrcMJArUutNhEZyMW+NswgcUx8s6eT7
	 vvftP4Dz7z6w1XMUXD7Wpf70r1xXyenhfX2/CFxLSAD5GejNCUCDOLwx6hbTnBgRHV
	 F+l2OnxAm6zfw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wmRbS-00000007VfN-3UI4;
	Wed, 22 Jul 2026 07:42:54 +0000
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
Subject: [PATCH v3 03/28] KVM: arm64: Merge guest's HCRX_EL2 using NV_HCRX_GUEST_EXCLUDE
Date: Wed, 22 Jul 2026 08:42:09 +0100
Message-ID: <20260722074234.3330999-4-maz@kernel.org>
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

The way we merge the guest-provided HCRX_EL2 value with the host's
is bonkers. We try to make it look like the FGT registers by using
positive and negative polarities for traps, but most of these bits
are not strictly about trapping, as they actively change the way
some architectural state is managed.

It would be far better to deal with these bits like we do for
HCR_EL2, by enumerating the list of bits we don't allow the guest
to override. This is simplified by the fact that HCRX_EL2 only
affects EL1, and not EL2.

Re-jig the HCRX_EL2 handling with a macro that list the bits excluded
from the merge (TMEA, PTTWI, EnIDCP128).

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 4bf624a49591d..8e5f492f39086 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -325,6 +325,24 @@ static inline void __deactivate_traps_mpam(void)
 		write_sysreg_s(MPAMHCR_HOST_FLAGS, SYS_MPAMHCR_EL2);
 }
 
+/*
+ * Just like for HCR_EL2, we can't let the guest mess with some of the
+ * basics we rely on in HCRX_EL2. However, the major difference is that
+ * HCRX_EL2 only affects EL1, and never EL2 (sudden outburst of sanity, I
+ * guess). So it is always the guest inflicting it on its own guestx.
+ *
+ * Things we don't want to let the guest control are:
+ *
+ * - TMEA: That's for us to decide how an SEA is routed, not the guest.
+ *
+ * - PTTWI: Similarly, it is for us to decide whether Reduced Coherency for
+ *   the PTW is a thing. It really isn't.
+ *
+ * - EnIDCP128: We don't allow IMPDEF sysregs -- full stop.
+ */
+#define NV_HCRX_GUEST_EXCLUDE	(HCRX_EL2_TMEA	    | HCRX_EL2_PTTWI | \
+				 HCRX_EL2_EnIDCP128)
+
 static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
@@ -350,8 +368,8 @@ static inline void __activate_traps_common(struct kvm_vcpu *vcpu)
 		u64 hcrx = vcpu->arch.hcrx_el2;
 		if (is_nested_ctxt(vcpu)) {
 			u64 val = __vcpu_sys_reg(vcpu, HCRX_EL2);
-			hcrx |= val & __HCRX_EL2_MASK;
-			hcrx &= ~(~val & __HCRX_EL2_nMASK);
+			hcrx |= (val & ~NV_HCRX_GUEST_EXCLUDE);
+			hcrx &= ~(~val & ~NV_HCRX_GUEST_EXCLUDE);
 		}
 
 		ctxt_sys_reg(hctxt, HCRX_EL2) = read_sysreg_s(SYS_HCRX_EL2);
-- 
2.47.3


