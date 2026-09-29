Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79592CA5FB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yrcv1tQpjgIhLK4FLW0aKahTYp0KRxC0JD0vGXJZB4c=; b=0w6ZK0ckz85QBUb/sw4sB5DWpi
	Jx9lJgPl5PpMpaAF5ji+ODhbysonIfk7rMo1CLCVB/zaznHM/Qd14/T8xawPGoNa2hFqD6TigdRar
	yuEX8kqYQ6u2ueBRvT0ye1Ayis6BSe/BMja+QzhwPdWNKf0k2bKAsyOc9acapz4TkzaVDk6zTKL1L
	k2WqU72FrZRCxjiQntsnBW1WhUdRpIrA5JSCITPYNps4SH6OKmUnQSIptbplEqdI25z72PKDzcump
	IsIjiw5yKBejAzJOZ17xUuei5wFnltrNPscww1bJIvF1Q05Moq3vXKzgxUPcChRKHzpZyM+S0QLv4
	03eDdVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDn-00000003H3V-2j1L;
	Tue, 29 Sep 2026 10:38:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDF-00000003GmR-2o7s
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Yrcv1tQpjgIhLK4FLW0aKahTYp0KRxC0JD0vGXJZB4c=; b=dE9LFBGT8aJgq8vxtSAJeAjQQJ
	jl1pN+csyc/Wd+cArXnfOw02/TH8qqCnWqK+H5YjwG3qK7kGyfh4utZ8eRqafRSYWXEz8Atq3Dl/V
	mZsTYNnojkLghY4f7bo42I2pvJBXbUvZgy+mxVeTGYRFrTo3IwcpmcCl4dz1pNZ7UEC9O0unMZWOn
	pbGNOEHHK2hIR3M/EFom9eBfjRTul0+F2T9Ca2/WsAQXSrF3gvJQsz5d21iySkzLUa4qTROJBQCjc
	9hZvHLj47JhJmAokBPXz5GFO3CbUJ3hDi+8bagtjKFnk4ry9sYH5AOFlI8acVOxvZI2a2/xoTD5cG
	aGAa85nQ==;
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVCz-00000002VFA-0sTn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Yrcv1tQpjgIhLK4FLW0aKahTYp0KRxC0JD0vGXJZB4c=;
	b=FJn8bMvFIt5OHiANxsyr2y8qjm22EHDhXs8/Y4rtH54EMF7gRXebgSNGcRGaGhQjwYt/nFOsr
	LKmBnonCabBTlKwTXlQDJtf6/7P0DE6sEMLGov7F3SilgXt8uSUCuDpLdAbsosPPxGnt/QVSnUU
	bN2xdOjCYNIWoTyojnfQ5gE=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hvDpJ2nmGzcb4j;
	Tue, 29 Sep 2026 18:25:28 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id AC3654056D;
	Tue, 29 Sep 2026 18:37:03 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 18:37:02 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<zhengtian10@huawei.com>, <leo.bras@arm.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <tangchengchang@huawei.com>,
	<yezhenyu2@huawei.com>, <yubihong@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>,
	<mark.rutland@arm.com>, <seanjc@google.com>, <rdunlap@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<skhan@linuxfoundation.org>
Subject: [PATCH v5 09/15] KVM: arm64: Handle HDBSS faults
Date: Tue, 29 Sep 2026 18:36:49 +0800
Message-ID: <20260929103655.85107-10-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260929103655.85107-1-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113714_096773_99A7A0FA 
X-CRM114-Status: GOOD (  15.76  )
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

From: Eillon <yezhenyu2@huawei.com>

Once the buffer is full, hardware stops promoting writable-clean
descriptors and raises a stage-2 Permission fault with
ESR_EL2.ISS2.HDBSSF instead. Failed HDBSS accesses, such as external
aborts and granule protection faults, are reported the same way.

Dispatch from kvm_handle_guest_abort() via the new esr_iss2_is_hdbssf()
helper. FSC == OK means the exit path already flushed, so resume the
guest; any other FSC is an error - clear it and report -EFAULT.

Signed-off-by: Eillon <yezhenyu2@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/include/asm/esr.h           |  5 +++++
 arch/arm64/include/asm/kvm_dirty_bit.h |  1 +
 arch/arm64/kvm/dirty_bit.c             | 29 ++++++++++++++++++++++++++
 arch/arm64/kvm/mmu.c                   |  4 ++++
 4 files changed, 39 insertions(+)

diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index f816f5d77f1a..4b3ccd407faa 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -437,6 +437,11 @@
 #ifndef __ASSEMBLER__
 #include <asm/types.h>

+static inline bool esr_iss2_is_hdbssf(unsigned long esr)
+{
+	return !!(ESR_ELx_ISS2(esr) & ESR_ELx_HDBSSF);
+}
+
 static inline unsigned long esr_brk_comment(unsigned long esr)
 {
 	return esr & ESR_ELx_BRK64_ISS_COMMENT_MASK;
diff --git a/arch/arm64/include/asm/kvm_dirty_bit.h b/arch/arm64/include/asm/kvm_dirty_bit.h
index d828e6b43fe9..eb2039820777 100644
--- a/arch/arm64/include/asm/kvm_dirty_bit.h
+++ b/arch/arm64/include/asm/kvm_dirty_bit.h
@@ -39,5 +39,6 @@ static inline bool vcpu_hdbss_enabled(struct kvm_vcpu *vcpu)
 int kvm_arm_vcpu_alloc_hdbss(struct kvm_vcpu *vcpu);
 void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu);
 void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu);
+int kvm_handle_hdbss_fault(struct kvm_vcpu *vcpu);

 #endif /* __ARM64_KVM_DIRTY_BIT_H__ */
diff --git a/arch/arm64/kvm/dirty_bit.c b/arch/arm64/kvm/dirty_bit.c
index be0d12555c84..893a8c4248bc 100644
--- a/arch/arm64/kvm/dirty_bit.c
+++ b/arch/arm64/kvm/dirty_bit.c
@@ -98,3 +98,32 @@ void kvm_flush_hdbss_buffer(struct kvm_vcpu *vcpu)
 	vcpu->arch.hdbss.hdbssprod_el2 = prod;
 	isb();
 }
+
+int kvm_handle_hdbss_fault(struct kvm_vcpu *vcpu)
+{
+	u64 prod;
+	u64 fsc;
+
+	if (WARN_ON_ONCE(!system_supports_hdbss()))
+		return -EFAULT;
+
+	if (WARN_ON_ONCE(!vcpu_hdbss_enabled(vcpu)))
+		return -EFAULT;
+
+	prod = read_sysreg_s(SYS_HDBSSPROD_EL2);
+	fsc = FIELD_GET(HDBSSPROD_EL2_FSC_MASK, prod);
+
+	if (fsc == HDBSSPROD_EL2_FSC_OK)
+		/* Buffer full: the exit path drained it before handle_exit. */
+		return 1;
+
+	if (fsc != HDBSSPROD_EL2_FSC_ExternalAbort &&
+	    fsc != HDBSSPROD_EL2_FSC_GPF)
+		WARN_ONCE(1,
+			  "Unexpected HDBSS fault type, FSC: 0x%llx (prod=0x%llx, vcpu=%d)\n",
+			  fsc, prod, vcpu->vcpu_id);
+
+	/* Clear FSC so hardware dirty state updates can resume. */
+	write_sysreg_s(prod & ~HDBSSPROD_EL2_FSC_MASK, SYS_HDBSSPROD_EL2);
+	return -EFAULT;
+}
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 85a98d2c23a9..7bf82d65041c 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -15,6 +15,7 @@
 #include <asm/pgalloc.h>
 #include <asm/cacheflush.h>
 #include <asm/kvm_arm.h>
+#include <asm/kvm_dirty_bit.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_pgtable.h>
 #include <asm/kvm_pkvm.h>
@@ -2315,6 +2316,9 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)

 	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);

+	if (esr_iss2_is_hdbssf(esr))
+		return kvm_handle_hdbss_fault(vcpu);
+
 	if (esr_fsc_is_translation_fault(esr)) {
 		/* Beyond sanitised PARange (which is the IPA limit) */
 		if (fault_ipa >= BIT_ULL(get_kvm_ipa_limit())) {
--
2.43.0


