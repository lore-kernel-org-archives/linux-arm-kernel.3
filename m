Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96321C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvrrbJTL90HdKfSM8IpDXKokn+aRKB1T3PPohkJWp6Y=; b=iWXWVLeFyW5wl+hzE4NJOEDfxY
	1l3y36ZmaMSYp6jrGMptowk1TN+A1i04boybd5eXoAZZ3DAu1VnkvAyamulQXBBKwKtNFdUwg2LXo
	iLDeAQjsz6qbn5Uf5ZNBbWkmGc7/jnfPSMtxlwBBpsKvgrLi2Ag1z3sZ1H/WcnZWtOJ8N6DfjlnQ/
	nctKrzt4D+eEpnnJ026L03CqHZW+gcaxigW0edz9LEM5GvwhJWDWPROruf0D2M4ODbq0u8OP6tPiS
	3Gd7RCgEdyVW7/qIuhVTQ2delC6HhWwHVkwoMH31scJzncJI6gTybRWx7n9XKrO9hP7GLSyKFCi/w
	EXSLlnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsU-00000004uDo-3FO8;
	Thu, 02 Jul 2026 16:03:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsS-00000004uBz-3V3j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98F3F43595;
	Thu,  2 Jul 2026 16:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D4C1F00A3E;
	Thu,  2 Jul 2026 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008180;
	bh=gvrrbJTL90HdKfSM8IpDXKokn+aRKB1T3PPohkJWp6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fnXqomTVwOsPxDPWwwRWthqmZoBpsg81HyJRcBI4Oo0rcTG2El9BqM2CctBdqzBg8
	 TN8bXDbshlLTRhPIU1eLTWDlALfCgZwW2EgMCYe/RoVpR4RTCi0t2/TUT3oKr6Xzy5
	 uGujHgaOitcRFc6G0LLsx0k8aIdORIq+wnb0XgDux3L8vHIatRjLPwWQzfVuIaj/MA
	 2LikL3AW5Q7+VPsBJLUBzXM6q/xmCxuVpGvHqskEYIEJfHRR9NZCeQKeqpjrNUgLm1
	 +K2Wr4x36pkDtnoWRcndO7Z7yQ31RFPiiYPaGLxXyQD0RXpRRuNV10XZbfVGT4fQgj
	 r+2tq/PDt5Pig==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsQ-00000000ojd-312O;
	Thu, 02 Jul 2026 16:02:58 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 03/28] KVM: arm64: Merge guest's HCRX_EL2 using NV_HCRX_GUEST_EXCLUDE
Date: Thu,  2 Jul 2026 17:02:23 +0100
Message-ID: <20260702160248.1377250-4-maz@kernel.org>
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


