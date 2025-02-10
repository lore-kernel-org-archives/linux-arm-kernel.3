Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CDAC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oqfc5O5VRPMRPcAs/UgM+wyPwrJh+/G/LNS2bq2JgI=; b=njMTs0sI8HtAJK817lfTWGEIdn
	RfTHB/DnmxvUBhAgFbJ71ce++n1cE9ZJ18N3zLYRpP6rJPcYttbW1zp6MLpgnagKl1+i/RpUGpBjB
	Jh4EnRWrLiUauVe1dmcmy6J3TqcZVYo8duPyLPd/hsk4fQnyFGL7VGq9F+fJdkPH5VHmu4XMYEl7G
	xN4UQam5wv6y4VUKyBpHhxGtOfNzPXgAICKUcqP2Dh7GKFCDEwMKnTvn2MaeIDyP5b3TtfA1vIQqU
	sCvZur45tKzQ053A60Ied6q2DWlhcUK0ZAOqUBkti3FVcqYdCtR0bSe4UfsaNaZMEFgFcxVmobXg1
	LlZJVuUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYc-000000016lY-3dPh;
	Mon, 10 Feb 2025 19:35:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYjL-00000000yvr-1vKV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40F685C5E10;
	Mon, 10 Feb 2025 18:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3AFC4CEE6;
	Mon, 10 Feb 2025 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212922;
	bh=rCCQOaOFN6L1aTPnMEf01pftfE+jukzHN9wFhmMuPL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P+rZIkzzETiOiBHtMor4h464bwov7Puzrb/UcYmzW1U1HKcHt68Ca9wW4EEo7KVmX
	 2QHw0P56JAnYY0rMrJfi/vvUKhFD4CNS7+jK9H3w/yTbLHD08xYXBBPTX8yP82whzO
	 cLVXh3fyJQ9j8lfcLA35/MEc7H2ByA89PxfJHQgTEhFMGABIQ3Nk/kdssSOYImoHtm
	 o06Gk3669uLqkZzxlQdl1bgAiXai6/bGf+yU1kOG/BxgEumMBmET/T8KOkBUgjF28X
	 pQFg/LGCN7EE6I+0OhVgel2RYcX5aSeO0IAU134Rus6ixqNNpCiKdyftDxOYXPv0GM
	 P2TSr0CfncOQQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thYjI-002g2I-QP;
	Mon, 10 Feb 2025 18:42:00 +0000
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
Subject: [PATCH 15/18] KVM: arm64: Handle PSB CSYNC traps
Date: Mon, 10 Feb 2025 18:41:46 +0000
Message-Id: <20250210184150.2145093-16-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250210_104203_583330_A5163FD4 
X-CRM114-Status: GOOD (  13.67  )
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

Bizarrely, the architecture introduces a trap for PSB CSYNC that
has the same EC as LS64. Let's deal with this oddity and add
specific handling for it.

It's not that we expect this to be useful any time soon anyway.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/esr.h    | 3 ++-
 arch/arm64/kvm/emulate-nested.c | 1 +
 arch/arm64/kvm/handle_exit.c    | 6 ++++++
 arch/arm64/tools/sysreg         | 2 +-
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index d5c2fac21a16c..3c283cf6a9c43 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -175,10 +175,11 @@
 #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
 #define ESR_ELx_xVC_IMM_MASK	((UL(1) << 16) - 1)
 
-/* ISS definitions for LD64B/ST64B instructions */
+/* ISS definitions for LD64B/ST64B/PSBCSYNC instructions */
 #define ESR_ELx_ISS_ST64BV	(0)
 #define ESR_ELx_ISS_ST64BV0	(1)
 #define ESR_ELx_ISS_LDST64B	(2)
+#define ESR_ELx_ISS_PSBCSYNC	(3)
 
 #define DISR_EL1_IDS		(UL(1) << 24)
 /*
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index f6c7331c21ca4..ebfb2805f716b 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1996,6 +1996,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
 
 /* Additional FGTs that do not fire with ESR_EL2.EC==0x18 */
 static const union trap_config non_0x18_fgt[] __initconst = {
+	FGT(HFGITR, PSBCSYNC, 1),
 	FGT(HFGITR, nGCSSTR_EL1, 0),
 	FGT(HFGITR, SVC_EL1, 1),
 	FGT(HFGITR, SVC_EL0, 1),
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 624a78a99e38a..d0e35e9a1c48f 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -321,6 +321,9 @@ static int handle_ls64b(struct kvm_vcpu *vcpu)
 	case ESR_ELx_ISS_LDST64B:
 		allowed = kvm_has_feat(kvm, ID_AA64ISAR1_EL1, LS64, LS64);
 		break;
+	case ESR_ELx_ISS_PSBCSYNC:
+		allowed = kvm_has_feat(kvm, ID_AA64DFR0_EL1, PMSVer, V1P5);
+		break;
 	default:
 		/* Clearly, we're missing something. */
 		goto unknown_trap;
@@ -343,6 +346,9 @@ static int handle_ls64b(struct kvm_vcpu *vcpu)
 		case ESR_ELx_ISS_LDST64B:
 			fwd = !(hcrx & HCRX_EL2_EnALS);
 			break;
+		case ESR_ELx_ISS_PSBCSYNC:
+			fwd = (__vcpu_sys_reg(vcpu, HFGITR_EL2) & HFGITR_EL2_PSBCSYNC);
+			break;
 		default:
 			/* We don't expect to be here */
 			fwd = false;
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8c4229b34840f..b4fe211934410 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2560,7 +2560,7 @@ Fields	HFGxTR_EL2
 EndSysreg
 
 Sysreg HFGITR_EL2	3	4	1	1	6
-Res0	63
+Field   63	PSBCSYNC
 Field	62	ATS1E1A
 Res0	61
 Field	60	COSPRCTX
-- 
2.39.2


