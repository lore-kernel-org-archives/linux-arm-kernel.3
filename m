Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C49CE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Iz7V7ak97UfUzyYFft2r6fuqmg7b5+bJqXj2G5o5Hc=; b=1hlnaa2qCWbBQbVMxnjNQRxzbF
	FAVe9NSDM/un3Q1qX9jk6UVDtf4t469rXyY/f0oSfISTOOGtSPkKvuh47siCDxXTHa2fZZhJNMamY
	BfZUU2fYq63aSUIjOphTEUwTdugV+CkRP+ZSGR/MFdzuDE8h83Nspmf14lvueg2HzE9ndCOCMf8Em
	aRCgmPlSBXUoY4NROlxZRQSvtiqUFt1YvCPiKecgqEMpPl/oeYwbuKp9HMotW2ZQFyhNicmsLSzzx
	qlnNp8BkBmyU/AOGViR4GjXybtvnSroWTG9EQtrJ/mBlAQyD9N5nI7hongN6f+yMB88vfo1q/HPnk
	O6hD0FxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwM6-0000000CgFv-0FL1;
	Fri, 14 Nov 2025 16:08:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwLo-0000000Cfpf-1GRY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:08:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A9FD1BCA;
	Fri, 14 Nov 2025 08:08:32 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFD5D3F5A1;
	Fri, 14 Nov 2025 08:08:37 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 26/35] KVM: arm64: Add comment to explain how trapped SPE registers are handled
Date: Fri, 14 Nov 2025 16:07:07 +0000
Message-ID: <20251114160717.163230-27-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080840_978640_26F820D1 
X-CRM114-Status: GOOD (  15.81  )
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

The SPE buffer registers are trapped, while the sampling control registers
are directly accessed by the guest. The in-memory value of PMBSR_EL1 can be
modified by both the guest, following a direct write, and the hardware,
following a hardware maintenence interrupt. The in-memory value is never
written to the hardware.

The rest of the buffer register are written to the hardware at different
times in the VCPU run loop.

Add a comment explaining all of this.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/spe.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index 6e8e0068e7e4..b138b564413b 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -126,6 +126,46 @@ u8 kvm_spe_get_pmsver_limit(void)
 	return min(pmsver, ID_AA64DFR0_EL1_PMSVer_V1P5);
 }
 
+/*
+ * Note on register handling:
+ *
+ * - Only the buffer registers (this includes PMBIDR_EL1) and PMSIDR_EL1 are
+ *   trapped, the rest of the registers the guest can access directly.
+ *
+ *  - PMBIDR_EL1 is trapped so KVM can advertise to the guest the maximum buffer
+ *  size set by userspace.
+ *
+ *  - PMSIDR_EL1 is trapped to hide the presence of features which the VM does
+ *  not have, but the hardware implements.
+ *
+ * - PMBLIMITR_EL1:
+ *   * Guest value is written to hardware only when
+ *   kvm_spe_profiling_buffer_enabled() is true. This is done after KVM enables
+ *   stage 2.
+ *   * KVM always disables the buffer (PMBLIMITR_EL1.E=0) when exiting the
+ *   guest. This is done before stage 2 is disabled.
+ *   * In-memory value of the register is updated following a direct write to
+ *   the register by the guest.
+ *
+ * - PMBSR_EL1:
+ *   * In-memory value of the register is never written to hardware.
+ *   * The hardware value of the register is cleared on guest exit if KVM
+ *   detects that the service bit is set.
+ *   * In-memory value of the register is updated in the following situations:
+ *     - Following a direct write to the register by the guest.
+ *     - When the buffer has been misprogrammed.
+ *     - When the hardware asserts the management event interrupt.
+ *
+ * - PMBPTR_EL1:
+ *   * Guest value is written to hardware:
+ *     - Before entering the guest, if kvm_spe_profiling_buffer_enabled() is
+ *     true.
+ *   * In-memory value of the register is updated:
+ *     - Following a direct write to the register by the guest.
+ *     - On each exit from the guest, if kvm_spe_profiling_buffer_enabled() was
+ *     true when the guest was entered.
+ */
+
 /* Implements OtherSPEManagementEvent() from ARM DDI0487L.b */
 static void kvm_spe_inject_other_event(struct kvm_vcpu *vcpu, u8 bsc)
 {
-- 
2.51.2


