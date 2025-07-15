Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30704C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 08:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KR5RivNa8SSFZsT0CQ2PC5s0g3tpRtFsRnrPdrzwP+E=; b=d6vZlj7zJ+BPE58z2fbm0B8Uq3
	SADu3mh69THBeMHcRcSsU4XsAijQt36lm9Fq0+ad3hVYKUdBwHpQYxuwV04B51FIBaqhC81Pn4LJC
	bDKYnwj6juqasNBEAU5MrUMqo/r39nbWz5MPAuGpebBlV6nBvyXEG9GTwWNcIj0n6PtNYYoNizkqQ
	oVGP08vHZTgv2ro/FPzaLLRiQXNjBEDFABsNnEy0fCSVVp4NRHxZw/aa3/zNx9MdDDowuN/WEs/u1
	+pFG+hLvcGWhc2srfZoqxQrUuMAGa52YQxsbwmto9GfMNbXQiuMw8z8PtmHwJhGsE1gSK9CHRnsu7
	wkEIPQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubayU-00000004VzW-3Zyk;
	Tue, 15 Jul 2025 08:25:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubao2-00000004Tfg-2CoW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:14:31 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bhBjM1krcz13MlX;
	Tue, 15 Jul 2025 16:11:35 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id BF08A180B63;
	Tue, 15 Jul 2025 16:14:21 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Jul 2025 16:14:21 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Jul 2025 16:14:20 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<tangchengchang@huawei.com>, <wangzhou1@hisilicon.com>
Subject: [PATCH v4 1/7] KVM: arm64: Add exit to userspace on {LD,ST}64B* outside of memslots
Date: Tue, 15 Jul 2025 16:13:50 +0800
Message-ID: <20250715081356.12442-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250715081356.12442-1-yangyicong@huawei.com>
References: <20250715081356.12442-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_011430_875585_8B05F3E6 
X-CRM114-Status: GOOD (  22.10  )
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

From: Marc Zyngier <maz@kernel.org>

The main use of {LD,ST}64B* is to talk to a device, which is hopefully
directly assigned to the guest and requires no additional handling.

However, this does not preclude a VMM from exposing a virtual device
to the guest, and to allow 64 byte accesses as part of the programming
interface. A direct consequence of this is that we need to be able
to forward such access to userspace.

Given that such a contraption is very unlikely to ever exist, we choose
to offer a limited service: userspace gets (as part of a new exit reason)
the ESR, the IPA, and that's it. It is fully expected to handle the full
semantics of the instructions, deal with ACCDATA, the return values and
increment PC. Much fun.

A canonical implementation can also simply inject an abort and be done
with it. Frankly, don't try to do anything else unless you have time
to waste.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kvm/mmio.c    | 27 ++++++++++++++++++++++++++-
 include/uapi/linux/kvm.h |  3 ++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
index ab365e839874..04520f2f6010 100644
--- a/arch/arm64/kvm/mmio.c
+++ b/arch/arm64/kvm/mmio.c
@@ -157,6 +157,9 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	bool is_write;
 	int len;
 	u8 data_buf[8];
+	u64 esr;
+
+	esr = kvm_vcpu_get_esr(vcpu);
 
 	/*
 	 * No valid syndrome? Ask userspace for help if it has
@@ -166,7 +169,7 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	 * though, so directly deliver an exception to the guest.
 	 */
 	if (!kvm_vcpu_dabt_isvalid(vcpu)) {
-		trace_kvm_mmio_nisv(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
+		trace_kvm_mmio_nisv(*vcpu_pc(vcpu), esr,
 				    kvm_vcpu_get_hfar(vcpu), fault_ipa);
 
 		if (vcpu_is_protected(vcpu)) {
@@ -185,6 +188,28 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 		return -ENOSYS;
 	}
 
+	/*
+	 * When (DFSC == 0b00xxxx || DFSC == 0b10101x) && DFSC != 0b0000xx
+	 * ESR_EL2[12:11] describe the Load/Store Type. This allows us to
+	 * punt the LD64B/ST64B/ST64BV/ST64BV0 instructions to luserspace,
+	 * which will have to provide a full emulation of these 4
+	 * instructions.  No, we don't expect this do be fast.
+	 *
+	 * We rely on traps being set if the corresponding features are not
+	 * enabled, so if we get here, userspace has promised us to handle
+	 * it already.
+	 */
+	switch (kvm_vcpu_trap_get_fault(vcpu)) {
+	case 0b000100 ... 0b001111:
+	case 0b101010 ... 0b101011:
+		if (FIELD_GET(GENMASK(12, 11), esr)) {
+			run->exit_reason = KVM_EXIT_ARM_LDST64B;
+			run->arm_nisv.esr_iss = esr & ~(u64)ESR_ELx_FSC;
+			run->arm_nisv.fault_ipa = fault_ipa;
+			return 0;
+		}
+	}
+
 	/*
 	 * Prepare MMIO operation. First decode the syndrome data we get
 	 * from the CPU. Then try if some in-kernel emulation feels
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 7a4c35ff03fe..7169d955c3ec 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -179,6 +179,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_LOONGARCH_IOCSR  38
 #define KVM_EXIT_MEMORY_FAULT     39
 #define KVM_EXIT_TDX              40
+#define KVM_EXIT_ARM_LDST64B      41
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
@@ -401,7 +402,7 @@ struct kvm_run {
 		} eoi;
 		/* KVM_EXIT_HYPERV */
 		struct kvm_hyperv_exit hyperv;
-		/* KVM_EXIT_ARM_NISV */
+		/* KVM_EXIT_ARM_NISV / KVM_EXIT_ARM_LDST64B */
 		struct {
 			__u64 esr_iss;
 			__u64 fault_ipa;
-- 
2.24.0


