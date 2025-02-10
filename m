Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57082C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5Zipbgwa7d3CHqvlSPNv1XmueDzqzI7rgtCnBI8lE8=; b=tDQQv3i/haPaTRyNNblIrJrX4S
	q/cfGGi22aKef2xU2Gh50iyOalC8lKih2c4IZLJd4ixTWqOEoXp0RB1ffmastkWa/L0ov0E2re+Ss
	ExTDYCQ9ycyTOwUZhVSF9WuhnKG5BY7stw7BZAVJTn5wtRaDmu0VdBIQr3tPR0T4zObWwKbn30AsL
	8V1Qq8KqTbrMUbi2WacGdbz1lROqSYUfkyE7SC3u2fQ9gM+ioawJ5IBwZ1JwpuY5+n0xHwr4h2Chb
	mxg4UsS1YYkV6rF5lrFQVRF2ctC5cwTg9wUw+xlu90JQP2A5cFN1qWAb2dKwKAg2iZxWfviaaDzjw
	eGrb7Wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYV-000000016Xa-3eyA;
	Mon, 10 Feb 2025 19:34:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYjI-00000000yrx-3hPS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C831E5C5DED;
	Mon, 10 Feb 2025 18:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D171C4CEE8;
	Mon, 10 Feb 2025 18:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212920;
	bh=Wi2tx+wpbCR4WtycbeYLZhI3AsgEkM8AXxOTe1vY7yU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UuIENE/6RVcsxFzRVQL2ldgYzZPpnFVWpmdBtuN4lS/qbsrAXpE6wXAUhstvPAkEz
	 qg/IYjlYwLfoFIGcANHmCNNwKpo/IFityJ+0WZJ3ugr5P2YQQQuFHFYGiJhIsNuQ22
	 1iv91cixOaLkDTjHfUM5P/Va0FdX/dbhbcaIf/LNnEsnKWRMa5fH9JAgylZKz7hgxb
	 iaLEmjc8hDqNfIYs/9JjbJHnoKPqZZMlkhdzOG/9UpLxZgO1x6cZnyp3LolcXr9c9w
	 Ij/KHAFcfiSDCJ5Q9DkM0SRJ5vuCmzlkiHdpbhRaFRggiVSnCNA9d1gsIvSbGhNFfQ
	 OJS3w0RCjDZ6g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thYjF-002g2I-S7;
	Mon, 10 Feb 2025 18:41:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 03/18] KVM: arm64: Handle trapping of FEAT_LS64* instructions
Date: Mon, 10 Feb 2025 18:41:34 +0000
Message-Id: <20250210184150.2145093-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250210184150.2145093-1-maz@kernel.org>
References: <20250210184150.2145093-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104201_017903_A3320A9C 
X-CRM114-Status: GOOD (  13.34  )
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

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/handle_exit.c | 64 ++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 512d152233ff2..4f8354bf7dc5f 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -294,6 +294,69 @@ static int handle_svc(struct kvm_vcpu *vcpu)
 	return 1;
 }
 
+static int handle_ls64b(struct kvm_vcpu *vcpu)
+{
+	struct kvm *kvm = vcpu->kvm;
+	u64 esr = kvm_vcpu_get_esr(vcpu);
+	u64 iss = ESR_ELx_ISS(esr);
+	bool allowed;
+
+	switch (iss) {
+	case ESR_ELx_ISS_ST64BV:
+		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_V);
+		break;
+	case ESR_ELx_ISS_ST64BV0:
+		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA);
+		break;
+	case ESR_ELx_ISS_LDST64B:
+		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64);
+		break;
+	default:
+		/* Clearly, we're missing something. */
+		goto unknown_trap;
+	}
+
+	if (!allowed)
+		goto undef;
+
+	if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) {
+		u64 hcrx = __vcpu_sys_reg(vcpu, HCRX_EL2);
+		bool fwd;
+
+		switch (iss) {
+		case ESR_ELx_ISS_ST64BV:
+			fwd = !(hcrx & HCRX_EL2_EnASR);
+			break;
+		case ESR_ELx_ISS_ST64BV0:
+			fwd = !(hcrx & HCRX_EL2_EnAS0);
+			break;
+		case ESR_ELx_ISS_LDST64B:
+			fwd = !(hcrx & HCRX_EL2_EnALS);
+			break;
+		default:
+			/* We don't expect to be here */
+			fwd = false;
+		}
+
+		if (fwd) {
+			kvm_inject_nested_sync(vcpu, esr);
+			return 1;
+		}
+	}
+
+unknown_trap:
+	/*
+	 * If we land here, something must be very wrong, because we
+	 * have no idea why we trapped at all. Warn and undef as a
+	 * fallback.
+	 */
+	WARN_ON(1);
+
+undef:
+	kvm_inject_undefined(vcpu);
+	return 1;
+}
+
 static exit_handle_fn arm_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]	= kvm_handle_unknown_ec,
 	[ESR_ELx_EC_WFx]	= kvm_handle_wfx,
@@ -303,6 +366,7 @@ static exit_handle_fn arm_exit_handlers[] = {
 	[ESR_ELx_EC_CP14_LS]	= kvm_handle_cp14_load_store,
 	[ESR_ELx_EC_CP10_ID]	= kvm_handle_cp10_id,
 	[ESR_ELx_EC_CP14_64]	= kvm_handle_cp14_64,
+	[ESR_ELx_EC_LS64B]	= handle_ls64b,
 	[ESR_ELx_EC_HVC32]	= handle_hvc,
 	[ESR_ELx_EC_SMC32]	= handle_smc,
 	[ESR_ELx_EC_HVC64]	= handle_hvc,
-- 
2.39.2


