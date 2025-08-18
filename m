Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24C1CA0EF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 07:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSG3eX4i7GO3vy1bEPlQZuSiQSHxyRZHB0qmOT0ddJw=; b=K4Tz2SsKHk0W/GyO7N7R5q39rL
	KAyElEnaQVSPlhdaSnHQV/llfJUiY6Q4cJ4ik89Jd5MqCC+cBGdbyad8jvIiRAdYtpcXJQhSfJ/uq
	4tZKaOp+TE0XS0I3F1sdhiu6fvm7l7RdhpKk9lPf1RVEaEXcJuQmFWgjHwYfcw9lVorHBUixUJOoO
	0XTWecLzgJBegY/3If6j8UvUV6rhrOQEFyW7z/AOeH5kMGRbxtCC6aaw1KcJ8Zjpmu0xQ5PwdaVSu
	DpcLOOmJ5PHcR73ecssQjrfu/gJTGaJA95T+vgfT87rDpxig7ieFkWb7W97c8K6bbYS8JbXNwzTYT
	A4pkAg6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unueB-00000006pBk-1LfA;
	Mon, 18 Aug 2025 07:51:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untfR-00000006hvt-2pkJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 06:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FSG3eX4i7GO3vy1bEPlQZuSiQSHxyRZHB0qmOT0ddJw=; b=NrH/YYMmC2/kiAtGakBB9a2R2C
	5JakwlNyCbFEbsWe3CS+jI44H+uJ/ddakS7McedEc7y256/kx+WCq8mbSKcOeuKNR/pCxgOfFaNBM
	qPbUNopE12LblJTA7Ru4qG8X/RitxX4YxDpfNgMnFupTOttPOoHgSvZfzp3XFrKJbTLdBGT4rwdcX
	Sligx9yz0FzOp8Sv5edENfCGicyURrn9JkobjFLhwBAamQeB8QSBiyBkzoEee6pc6UD3Rx7HNTrjg
	TOOAMqzuvBrmSs5/yXIzGL63ERsy9vttfk0t3/CwoyDkYYKJwdiGdtcTSHEZ/6D/WwKMQP/eVvpsG
	Z3Ybuedw==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1untfN-0000000HI22-0wAa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 06:48:28 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4c53865zr7zFrlM;
	Mon, 18 Aug 2025 14:43:34 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 98EEC1402F2;
	Mon, 18 Aug 2025 14:48:10 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 14:48:10 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 14:48:09 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerkolothum@gmail.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<tangchengchang@huawei.com>, <wangzhou1@hisilicon.com>
Subject: [PATCH v5 3/7] KVM: arm64: Handle DABT caused by LS64* instructions on unsupported memory
Date: Mon, 18 Aug 2025 14:48:02 +0800
Message-ID: <20250818064806.25417-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250818064806.25417-1-yangyicong@huawei.com>
References: <20250818064806.25417-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_074826_160648_0AF354FA 
X-CRM114-Status: GOOD (  17.07  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

If FEAT_LS64WB not supported, FEAT_LS64* instructions only support
to access Device/Uncacheable memory, otherwise a data abort for
unsupported Exclusive or atomic access (0x35, UAoEF) is generated
per spec. It's implementation defined whether the target exception
level is routed and is possible to implemented as route to EL2 on a
VHE VM according to DDI0487L.b Section C3.2.6 Single-copy atomic
64-byte load/store.

If it's implemented as generate the DABT to the final enabled stage
(stage-2), inject the UAoEF back to the guest after checking the
memslot is valid.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/include/asm/esr.h         |  8 ++++++++
 arch/arm64/include/asm/kvm_emulate.h |  1 +
 arch/arm64/kvm/inject_fault.c        | 22 ++++++++++++++++++++++
 arch/arm64/kvm/mmu.c                 | 14 +++++++++++++-
 4 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index e1deed824464..63cd17f830da 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -124,6 +124,7 @@
 #define ESR_ELx_FSC_SEA_TTW(n)	(0x14 + (n))
 #define ESR_ELx_FSC_SECC	(0x18)
 #define ESR_ELx_FSC_SECC_TTW(n)	(0x1c + (n))
+#define ESR_ELx_FSC_EXCL_ATOMIC	(0x35)
 #define ESR_ELx_FSC_ADDRSZ	(0x00)
 
 /*
@@ -488,6 +489,13 @@ static inline bool esr_fsc_is_access_flag_fault(unsigned long esr)
 	       (esr == ESR_ELx_FSC_ACCESS_L(0));
 }
 
+static inline bool esr_fsc_is_excl_atomic_fault(unsigned long esr)
+{
+	esr = esr & ESR_ELx_FSC;
+
+	return esr == ESR_ELx_FSC_EXCL_ATOMIC;
+}
+
 static inline bool esr_fsc_is_addr_sz_fault(unsigned long esr)
 {
 	esr &= ESR_ELx_FSC;
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index fa8a08a1ccd5..075ddde6c626 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -47,6 +47,7 @@ void kvm_skip_instr32(struct kvm_vcpu *vcpu);
 void kvm_inject_undefined(struct kvm_vcpu *vcpu);
 int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr);
 int kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr);
+void kvm_inject_dabt_excl_atomic(struct kvm_vcpu *vcpu, u64 addr);
 void kvm_inject_size_fault(struct kvm_vcpu *vcpu);
 
 static inline int kvm_inject_sea_dabt(struct kvm_vcpu *vcpu, u64 addr)
diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 6745f38b64f9..47f9a5354bb7 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -230,6 +230,28 @@ int kvm_inject_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr)
 	return 1;
 }
 
+/**
+ * kvm_inject_dabt_excl_atomic - inject a data abort for unsupported exclusive
+ *				 or atomic access
+ * @vcpu: The VCPU to receive the data abort
+ * @addr: The address to report in the DFAR
+ *
+ * It is assumed that this code is called from the VCPU thread and that the
+ * VCPU therefore is not currently executing guest code.
+ */
+void kvm_inject_dabt_excl_atomic(struct kvm_vcpu *vcpu, u64 addr)
+{
+	u64 esr;
+
+	/* Reuse the general DABT injection routine and modify the DFSC */
+	kvm_inject_sea(vcpu, false, addr);
+
+	esr = vcpu_read_sys_reg(vcpu, exception_esr_elx(vcpu));
+	esr &= ~ESR_ELx_FSC;
+	esr |= ESR_ELx_FSC_EXCL_ATOMIC;
+	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
+}
+
 void kvm_inject_size_fault(struct kvm_vcpu *vcpu)
 {
 	unsigned long addr, esr;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 1c78864767c5..471ef6747952 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1698,6 +1698,17 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (exec_fault && s2_force_noncacheable)
 		return -ENOEXEC;
 
+	/*
+	 * Guest performs atomic/exclusive operations on memory with unsupported
+	 * attributes (e.g. ld64b/st64b on normal memory when no FEAT_LS64WB)
+	 * and trigger the exception here. Since the memslot is valid, inject
+	 * the fault back to the guest.
+	 */
+	if (esr_fsc_is_excl_atomic_fault(kvm_vcpu_get_esr(vcpu))) {
+		kvm_inject_dabt_excl_atomic(vcpu, kvm_vcpu_get_hfar(vcpu));
+		return 1;
+	}
+
 	/*
 	 * Potentially reduce shadow S2 permissions to match the guest's own
 	 * S2. For exec faults, we'd only reach this point if the guest
@@ -1879,7 +1890,8 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	/* Check the stage-2 fault is trans. fault or write fault */
 	if (!esr_fsc_is_translation_fault(esr) &&
 	    !esr_fsc_is_permission_fault(esr) &&
-	    !esr_fsc_is_access_flag_fault(esr)) {
+	    !esr_fsc_is_access_flag_fault(esr) &&
+	    !esr_fsc_is_excl_atomic_fault(esr)) {
 		kvm_err("Unsupported FSC: EC=%#x xFSC=%#lx ESR_EL2=%#lx\n",
 			kvm_vcpu_trap_get_class(vcpu),
 			(unsigned long)kvm_vcpu_trap_get_fault(vcpu),
-- 
2.24.0


