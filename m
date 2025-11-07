Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517D0CCFA1C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I90Qp1tCDyEXLzkeDxdqAGYtJ4yTuvKJaN/1jzkCikA=; b=IG3pxs2ETTtCtq/uCzYwuybVWU
	MFiYEP+C75BuYP8NMU9owkt3y0ZXWPjaucQDI5MdZmavD3w7qanz2U/FTR9DPbeE3AB78rTZoQ9vz
	ntMJh/3HSM72p97FAq4WGXhHGMw58hGSXISHo2g7XAvDijumlVTAa8g28BYMUcK00xzWmV0tZDQzZ
	2CZJL6A+2pGDmzsGU41z+Aj59beo07cRn4fhc3xl//livX9VEQdB1gkjLEVBo7cjc+Hz8txLorwog
	ICV4Ecy9Sq9ZQ3L1sVSRejI53/OuyW0Z5iHHk3LcPGiM9VVdPD6R5MSmophVeEYNaBAQmC4qKxhkL
	9r0QIUdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGnn-0000000Gmbw-0SwK;
	Fri, 07 Nov 2025 07:22:31 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHGnh-0000000GmY5-0pTv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 07:22:28 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4d2r7X6gPtzmV7X;
	Fri,  7 Nov 2025 15:20:40 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 792551A016C;
	Fri,  7 Nov 2025 15:22:17 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 7 Nov 2025 15:22:17 +0800
Received: from huawei.com (10.90.31.46) by kwepemq200004.china.huawei.com
 (7.202.195.237) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 7 Nov
 2025 15:22:16 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<yangyccccc@gmail.com>, <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v7 1/7] KVM: arm64: Add exit to userspace on {LD,ST}64B* outside of memslots
Date: Fri, 7 Nov 2025 15:21:21 +0800
Message-ID: <20251107072127.448953-2-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20251107072127.448953-1-wangzhou1@hisilicon.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_232225_561456_198BF479 
X-CRM114-Status: GOOD (  21.16  )
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
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 arch/arm64/kvm/mmio.c    | 27 ++++++++++++++++++++++++++-
 include/uapi/linux/kvm.h |  3 ++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
index 54f9358c9e0e..2a6261abb647 100644
--- a/arch/arm64/kvm/mmio.c
+++ b/arch/arm64/kvm/mmio.c
@@ -159,6 +159,9 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	bool is_write;
 	int len;
 	u8 data_buf[8];
+	u64 esr;
+
+	esr = kvm_vcpu_get_esr(vcpu);
 
 	/*
 	 * No valid syndrome? Ask userspace for help if it has
@@ -168,7 +171,7 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	 * though, so directly deliver an exception to the guest.
 	 */
 	if (!kvm_vcpu_dabt_isvalid(vcpu)) {
-		trace_kvm_mmio_nisv(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
+		trace_kvm_mmio_nisv(*vcpu_pc(vcpu), esr,
 				    kvm_vcpu_get_hfar(vcpu), fault_ipa);
 
 		if (vcpu_is_protected(vcpu))
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
index 52f6000ab020..d219946b96be 100644
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
2.33.0


