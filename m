Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B45CEFCE5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 17:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/AnOxE8dPitvquxyJXMpWqkeRDH1CG/MSwHwPpKBzc=; b=ZPfllElLAy1yeWyeyknloEdlIm
	6PkeHw8ENcRyCYMOa+rBPc1M0Lq7ZdbC/M4J9cACNVxgtvYxh8jm9xAfYXq1TC8U5kvfr10xrNn+2
	woImZelP/is68ynkBcRH4RtpU3Zk+qGfBxt7zjgjx42oniwyr09bAA8cDLc5uxi8+ZOluMjPieHaW
	Dm1kDEqW1ODt3OP1lXPI0aUBUwioqsziSCsm1/W93FjpwQyVKgQ6ShNb3HpdS6b0J7nBDBdH2bgDe
	uK7GyksaUYrWMTGMYUFZYkLD8MpQJKTpjA+C1DOgoSWGkvMtpkgRJyIV/NKyyM7fgs7a3pNbHcuDY
	ozAMLinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAzo-0000000Da5b-474l;
	Tue, 06 Jan 2026 17:37:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdAzm-0000000Da4H-1i5P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 17:37:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F2611596;
	Tue,  6 Jan 2026 09:37:18 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80AA43F5A1;
	Tue,  6 Jan 2026 09:37:23 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 2/3] KVM: arm64: Shuffle KVM_HOST_DATA_FLAG_* indices
Date: Tue,  6 Jan 2026 17:37:06 +0000
Message-Id: <20260106173707.3292074-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260106173707.3292074-1-mark.rutland@arm.com>
References: <20260106173707.3292074-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_093726_485837_1160B3D4 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

There's a gap in the KVM_HOST_DATA_FLAG_* indices since the removal of
KVM_HOST_DATA_FLAG_HOST_SVE_ENABLED and
KVM_HOST_DATA_FLAG_HOST_SME_ENABLED in commits:

* 459f059be702 ("KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN")
* 407a99c4654e ("KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN")

Shuffle the indices to remove the gap, as Oliver requested at the time of
the removals:

  https://lore.kernel.org/linux-arm-kernel/Z6qC4qn47ONfDCSH@linux.dev/

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ac7f970c78830..4c8b4274f669e 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -710,11 +710,11 @@ struct cpu_sve_state {
 struct kvm_host_data {
 #define KVM_HOST_DATA_FLAG_HAS_SPE			0
 #define KVM_HOST_DATA_FLAG_HAS_TRBE			1
-#define KVM_HOST_DATA_FLAG_TRBE_ENABLED			4
-#define KVM_HOST_DATA_FLAG_EL1_TRACING_CONFIGURED	5
-#define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT		6
-#define KVM_HOST_DATA_FLAG_L1_VNCR_MAPPED		7
-#define KVM_HOST_DATA_FLAG_HAS_BRBE			8
+#define KVM_HOST_DATA_FLAG_TRBE_ENABLED			2
+#define KVM_HOST_DATA_FLAG_EL1_TRACING_CONFIGURED	3
+#define KVM_HOST_DATA_FLAG_VCPU_IN_HYP_CONTEXT		4
+#define KVM_HOST_DATA_FLAG_L1_VNCR_MAPPED		5
+#define KVM_HOST_DATA_FLAG_HAS_BRBE			6
 	unsigned long flags;
 
 	struct kvm_cpu_context host_ctxt;
-- 
2.30.2


