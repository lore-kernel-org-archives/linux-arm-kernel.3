Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BFECA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJeAt7Wf9A4rJLEAnEmxekFG9jjQvpCupEDV689AutQ=; b=FSwsBweazXcNofEUCVVr5aUNeE
	pRi2K79mYLPJ4uwkfvJtlv9rLCrsaxRmSXxv6LKnYLO43IeIk89JHfNlYlQpNK0Su7DnE68ebAaPb
	9Qkd0MD1mlJXJr5elpD3PuSgWfu7jGrhOk03bLcByU1H1ilLXbDcaAh4u2QS08yiglsmcZy4KUCi7
	A/hxMJvenlBbWMY2yx4Tta2I6+GL47JgJF4T2Ig4KzhIKAE0eflYg6AG+QI9JTUFHcaKKGXRFzSBY
	idJsPZu75lvpdUVC5QjSXu1xnF2+NgvMLOb5kLDEn5EwfxlKDnDbcxSgZZBpUprOv1PBxgPANWFmS
	GJhGcH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByDE-00000006rGr-3Vtl;
	Wed, 30 Sep 2026 17:35:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByD1-00000006r06-2WPX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 17:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MJeAt7Wf9A4rJLEAnEmxekFG9jjQvpCupEDV689AutQ=; b=MDn9eegitgls0aIpzZee9OYobf
	kT8chltF0h3q8ex5zGnV7AfmKlqqa860yy83cM6izqhQDoxXyYaqvGDsneKypOadevdZ9dL85EWYC
	Jo1f2itLVuvotx1SwYQbbcpsyGpSqhJA/qiufhPoqxhXj66yW1/aRHeIG4Ye1sGVMHcE5pKuwujJB
	J1/YfaIzwzcxpR+vpEp7ywetpT0+SxL90K5RrPYCX7q8N0tE2i3N5A0dubo0LtW6+PtJMLTvSmUoy
	MM3WGwee/FUFMYK+p+4lqm+NcJMGsDhaGFs1RZS7DEk69rJtPLfjBpnYQnWaag7+4wl4YbHR7GKpz
	YznRUv6w==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xByCx-000000049At-3itS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 17:35:10 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE5Tdo3203204;
	Wed, 30 Sep 2026 17:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=MJeAt7Wf9A4rJLEAn
	EmxekFG9jjQvpCupEDV689AutQ=; b=QlND1U6FCdF43RqeSKZzPy54gHyWHzGQ2
	69BSY6EMR1j+NxKOs8elfn/jcTP3D6t61scj7nrN2J0WXOhBGpybLOzTKVs1R4b8
	+/sDmf2ioI0DaiMZ1lfR1W+CVVKRsLNHeKNeOkOKeYJ5FawSgxPKy6qtDowrW2S7
	0amVfbqzUAgLGTrBVG/ApqPGdVkvFTkoxVhOXXRT0JhyWBs6qGEi51vmBCFhG5lk
	mJEl+wv+wX7nl6TfTlQhXBssdmaWRhWFesR298mW11XaLgA//9QOPPGVgoR49VrE
	jFDVr2X6SMSdjWB0D17zUTATvzVcYASZkwHFLoQN6eH11o9rKPrpg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5j5ep7y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:50 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE38lE2287793;
	Wed, 30 Sep 2026 17:34:49 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0q4pbmk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:34:49 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68UHYjUA51380588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 17:34:45 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE80C2004E;
	Wed, 30 Sep 2026 17:34:45 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56AF02004D;
	Wed, 30 Sep 2026 17:34:45 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 17:34:45 +0000 (GMT)
From: Steffen Eiden <seiden@linux.ibm.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v9 10/24] arm64: Share arm64 headers with s390
Date: Wed, 30 Sep 2026 19:34:25 +0200
Message-ID: <20260930173441.66762-11-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930173441.66762-1-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX81myDJCsHk+R
 VC1u0tMr6X44p6XGhK4CzUHVeiHCYmje+sGl3BawDbEThtiwhCK1/62KfBD/9OkB1azGbihJENd
 OOjpauIv2F8UGxRD1PoNEWysnomkKP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2OCBTYWx0ZWRfX3GLbP6hRae4i
 nwojdmicrMng+8+GEfter2tlxmnt/HXdgpXMhUgtw1NFFxdj8NvDgJbAi0iyeD3e85xG0oHp1B/
 vbD3pWf3oR+PR+EkaojxXWg6j3ppEA3CwAuXuZ7DcVi6JvtNRow5zqd3Vcgbays/NRJYmHIeflN
 swR32TxVtl9gmi6BvYphFEGWxVcBkPAs28rQafbi57JkcFzfpI8rOk5M95YA1IufbSSp1UZrFL+
 H+UsGGbvsvN4IIZTfoziIfiZY6C4DP81vGQh9x03eJKivVtW+HFC4nxFUSuoOA9JPmYHziwhrmr
 UoQqT9PZuQrto67aWGZM3EsnCczzPwngetOtA7PFcKfxGV1MneIvYkEAPLO23qDag6Jlj1awWZU
 wS16r3FcF85G60P9LEsZtC9ED0Yum1bfdcdDqxsRpJN9sVpFIeIAREqFxP1l9YVFj0xbKeAKEDw
 TDKJEVnH82uTpb+ElGg==
X-Proofpoint-GUID: ql-hDzixXkf-SKS6ogJiqNcAr-48Hgrz
X-Authority-Analysis: v=2.4 cv=RKcmjIi+ c=1 sm=1 tr=0 ts=6abd483b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=7CQSdrXTAAAA:8
 a=Em0hk0uDlT0e9a-ftI0A:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: LgzQ_XuAbGW7ynZRLBm80FXU20S-jDuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_183508_301527_9F9B9B14 
X-CRM114-Status: GOOD (  23.77  )
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

Allow sharing of arm64 headers with s390 by marking the shared regions
or by adding a comment that the whole file is shared.

The shared regions are marked with:

 #if ARM64_S390_COMMON == 1

 /* insert shared definitions here */

 #endif /* ARM64_S390_COMMON == 1 */

The preprocessor symbol ARM64_S390_COMMON is always defined to 1 for any
arm64 build. s390 later will generate its own view of arm64 headers
based on the content inside the #if/#endif block.

No functional change.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/arm64/Makefile                  |  3 +++
 arch/arm64/include/asm/brk-imm.h     |  1 +
 arch/arm64/include/asm/esr.h         |  1 +
 arch/arm64/include/asm/kvm_arm.h     |  1 +
 arch/arm64/include/asm/kvm_emulate.h | 18 ++++++++++++++++++
 arch/arm64/include/asm/kvm_host.h    | 13 +++++++++++++
 arch/arm64/include/asm/ptrace.h      |  4 ++++
 arch/arm64/include/asm/sysreg.h      | 15 +++++++++++++++
 8 files changed, 56 insertions(+)

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef70..a2ed76cfdc0a 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -45,6 +45,9 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)
 
+# Enable all code shared to s390
+KBUILD_CPPFLAGS	+= -DARM64_S390_COMMON=1
+
 ifeq ($(call rustc-min-version, 108500),y)
 KBUILD_RUSTFLAGS += --target=aarch64-unknown-none-softfloat
 else
diff --git a/arch/arm64/include/asm/brk-imm.h b/arch/arm64/include/asm/brk-imm.h
index beb42c62b6ac..dd2d153dc0d8 100644
--- a/arch/arm64/include/asm/brk-imm.h
+++ b/arch/arm64/include/asm/brk-imm.h
@@ -2,6 +2,7 @@
 /*
  * Copyright (C) 2012 ARM Ltd.
  */
+/* Whole file is shared with s390 */
 
 #ifndef __ASM_BRK_IMM_H
 #define __ASM_BRK_IMM_H
diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
index da085c83b57e..2cb73bde7346 100644
--- a/arch/arm64/include/asm/esr.h
+++ b/arch/arm64/include/asm/esr.h
@@ -3,6 +3,7 @@
  * Copyright (C) 2013 - ARM Ltd
  * Author: Marc Zyngier <marc.zyngier@arm.com>
  */
+/* Whole file is shared with s390 */
 
 #ifndef __ASM_ESR_H
 #define __ASM_ESR_H
diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 57edd8437200..678f0daed445 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -3,6 +3,7 @@
  * Copyright (C) 2012,2013 - ARM Ltd
  * Author: Marc Zyngier <marc.zyngier@arm.com>
  */
+/* Whole file is shared with s390 */
 
 #ifndef __ARM64_KVM_ARM_H__
 #define __ARM64_KVM_ARM_H__
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index b31d50bdf59e..e19d61f5ccd8 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -44,6 +44,7 @@ enum exception_type {
 bool kvm_condition_valid32(const struct kvm_vcpu *vcpu);
 void kvm_skip_instr32(struct kvm_vcpu *vcpu);
 
+#if ARM64_S390_COMMON == 1
 void kvm_inject_undefined(struct kvm_vcpu *vcpu);
 void kvm_inject_sync(struct kvm_vcpu *vcpu, u64 esr);
 int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u64 esr);
@@ -75,6 +76,8 @@ static inline int kvm_inject_serror(struct kvm_vcpu *vcpu)
 
 void kvm_vcpu_wfi(struct kvm_vcpu *vcpu);
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu);
 int kvm_inject_nested_sync(struct kvm_vcpu *vcpu, u64 esr_el2);
 int kvm_inject_nested_irq(struct kvm_vcpu *vcpu);
@@ -184,6 +187,7 @@ static inline void vcpu_set_thumb(struct kvm_vcpu *vcpu)
 	*vcpu_cpsr(vcpu) |= PSR_AA32_T_BIT;
 }
 
+#if ARM64_S390_COMMON == 1
 /*
  * vcpu_get_reg and vcpu_set_reg should always be passed a register number
  * coming from a read of ESR_EL2. Otherwise, it may give the wrong result on
@@ -202,6 +206,8 @@ static __always_inline void vcpu_set_reg(struct kvm_vcpu *vcpu, u8 reg_num,
 		vcpu_gp_regs(vcpu)[reg_num] = val;
 }
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 static inline bool vcpu_is_el2_ctxt(const struct kvm_cpu_context *ctxt)
 {
 	switch (ctxt->regs.pstate & (PSR_MODE32_BIT | PSR_MODE_MASK)) {
@@ -404,6 +410,7 @@ static inline u64 kvm_vcpu_get_disr(const struct kvm_vcpu *vcpu)
 	return vcpu->arch.fault.disr_el1;
 }
 
+#if ARM64_S390_COMMON == 1
 static inline u32 kvm_vcpu_hvc_get_imm(const struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_get_esr(vcpu) & ESR_ELx_xVC_IMM_MASK;
@@ -481,6 +488,8 @@ static __always_inline u8 kvm_vcpu_trap_get_fault(const struct kvm_vcpu *vcpu)
 	return kvm_vcpu_get_esr(vcpu) & ESR_ELx_FSC;
 }
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 static inline
 bool kvm_vcpu_trap_is_permission_fault(const struct kvm_vcpu *vcpu)
 {
@@ -521,6 +530,7 @@ static __always_inline int kvm_vcpu_sys_get_rt(struct kvm_vcpu *vcpu)
 	return ESR_ELx_SYS64_ISS_RT(esr);
 }
 
+#if ARM64_S390_COMMON == 1
 static inline bool kvm_is_write_fault(struct kvm_vcpu *vcpu)
 {
 	if (kvm_vcpu_abt_iss1tw(vcpu)) {
@@ -545,6 +555,8 @@ static inline bool kvm_is_write_fault(struct kvm_vcpu *vcpu)
 	return kvm_vcpu_dabt_iswrite(vcpu);
 }
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
 {
 	return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
@@ -586,6 +598,7 @@ static inline bool kvm_vcpu_is_be(struct kvm_vcpu *vcpu)
 	return vcpu_read_sys_reg(vcpu, r) & bit;
 }
 
+#if ARM64_S390_COMMON == 1
 static inline unsigned long vcpu_data_guest_to_host(struct kvm_vcpu *vcpu,
 						    unsigned long data,
 						    unsigned int len)
@@ -661,6 +674,8 @@ static __always_inline void kvm_incr_pc(struct kvm_vcpu *vcpu)
 		vcpu_set_flag((v), e);					\
 	} while (0)
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 /*
  * Returns a 'sanitised' view of CPTR_EL2, translating from nVHE to the VHE
  * format if E2H isn't set.
@@ -767,6 +782,7 @@ static inline void kvm_reset_fpsimd(struct kvm_vcpu *vcpu)
 	memset(&vcpu->arch.ctxt.fp_regs, 0, sizeof(vcpu->arch.ctxt.fp_regs));
 }
 
+#if ARM64_S390_COMMON == 1
 /* Reset a vcpu's core registers. */
 static inline void kvm_reset_vcpu_core(struct kvm_vcpu *vcpu)
 {
@@ -791,6 +807,8 @@ static inline void kvm_reset_vcpu_core(struct kvm_vcpu *vcpu)
 	*vcpu_cpsr(vcpu) = pstate;
 }
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 /* PSCI reset handling for a vcpu. */
 static inline void kvm_reset_vcpu_psci(struct kvm_vcpu *vcpu,
 				       struct vcpu_reset_state *reset_state)
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 55966decfeb6..b61d92c8c0ca 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -42,6 +42,7 @@
 
 #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
 
+#if ARM64_S390_COMMON == 1
 #define KVM_VCPU_MAX_FEATURES 10
 #define KVM_VCPU_VALID_FEATURES	(BIT(KVM_VCPU_MAX_FEATURES) - 1)
 
@@ -99,6 +100,8 @@ struct vcpu_reset_state {
 	bool		reset;
 };
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #define KVM_DIRTY_LOG_MANUAL_CAPS   (KVM_DIRTY_LOG_MANUAL_PROTECT_ENABLE | \
 				     KVM_DIRTY_LOG_INITIALLY_SET)
 
@@ -958,6 +961,7 @@ struct kvm_vcpu_arch {
 	pid_t pid;
 };
 
+#if ARM64_S390_COMMON == 1
 /*
  * Each 'flag' is composed of a comma-separated triplet:
  *
@@ -1116,6 +1120,8 @@ bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
 /* KVM is currently emulating an L2 to L1 exception */
 #define IN_NESTED_EXCEPTION	__vcpu_single_flag(sflags, BIT(9))
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #define vcpu_sve_max_vq(vcpu)	sve_vq_from_vl((vcpu)->arch.sve_max_vl)
 
 #define vcpu_sve_zcr_elx(vcpu)						\
@@ -1329,6 +1335,7 @@ int __init populate_nv_trap_config(void);
 
 void kvm_calculate_traps(struct kvm_vcpu *vcpu);
 
+#if ARM64_S390_COMMON == 1
 unsigned long kvm_arm_num_regs(struct kvm_vcpu *vcpu);
 int kvm_arm_copy_reg_indices(struct kvm_vcpu *vcpu, u64 __user *indices);
 int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg);
@@ -1344,6 +1351,8 @@ unsigned long kvm_mmio_read_buf(const void *buf, unsigned int len);
 int kvm_handle_mmio_return(struct kvm_vcpu *vcpu);
 int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 /*
  * Returns true if a Performance Monitoring Interrupt (PMI), a.k.a. perf event,
  * arrived in guest context.  For arm64, any event that arrives while a vCPU is
@@ -1536,11 +1545,15 @@ static inline bool __vcpu_has_feature(const struct kvm_arch *ka, int feature)
 	return test_bit(feature, ka->vcpu_features);
 }
 
+#if ARM64_S390_COMMON == 1
+
 #define kvm_vcpu_has_feature(k, f)	__vcpu_has_feature(&(k)->arch, (f))
 #define vcpu_has_feature(v, f)	__vcpu_has_feature(&(v)->kvm->arch, (f))
 
 #define kvm_vcpu_initialized(v) vcpu_get_flag(v, VCPU_INITIALIZED)
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 int kvm_trng_call(struct kvm_vcpu *vcpu);
 #ifdef CONFIG_KVM
 extern phys_addr_t hyp_mem_base;
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index 49a83a0636b9..4d88ed5cc425 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -26,6 +26,8 @@
 
 #define GIC_PRIO_PSR_I_SET	GICV3_PRIO_PSR_I_SET
 
+#if ARM64_S390_COMMON == 1
+
 /* Additional SPSR bits not exposed in the UABI */
 #define PSR_MODE_THREAD_BIT	(1 << 0)
 #define PSR_IL_BIT		(1 << 20)
@@ -66,6 +68,8 @@
 #define PSR_AA32_IT_MASK	0x0600fc00	/* If-Then execution state mask */
 #define PSR_AA32_GE_MASK	0x000f0000
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #ifdef CONFIG_CPU_BIG_ENDIAN
 #define PSR_AA32_ENDSTATE	PSR_AA32_E_BIT
 #else
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index ab205f9db94a..779e6587ed0f 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -16,6 +16,8 @@
 
 #include <asm/gpr-num.h>
 
+#if ARM64_S390_COMMON == 1
+
 /*
  * ARMv8 ARM reserves the following encoding for system registers:
  * (Ref: ARMv8 ARM, Section: "System instruction class encoding overview",
@@ -50,6 +52,8 @@
 #define sys_reg_CRm(id)	(((id) >> CRm_shift) & CRm_mask)
 #define sys_reg_Op2(id)	(((id) >> Op2_shift) & Op2_mask)
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #ifndef CONFIG_BROKEN_GAS_INST
 
 #ifdef __ASSEMBLER__
@@ -123,6 +127,8 @@
 #define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
 #define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
 
+#if ARM64_S390_COMMON == 1
+
 /* Data cache zero operations */
 #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
 #define SYS_DC_IGSW			sys_insn(1, 0, 7, 6, 4)
@@ -832,6 +838,8 @@
 #define SCTLR_ELx_A	 (BIT(1))
 #define SCTLR_ELx_M	 (BIT(0))
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #ifdef CONFIG_CPU_BIG_ENDIAN
 #define ENDIAN_SET_EL2		SCTLR_ELx_EE
 #else
@@ -866,6 +874,7 @@
 	 SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS   | \
 	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
 
+#if ARM64_S390_COMMON == 1
 /* MAIR_ELx memory attributes (used by Linux) */
 #define MAIR_ATTR_DEVICE_nGnRnE		UL(0x00)
 #define MAIR_ATTR_DEVICE_nGnRE		UL(0x04)
@@ -1102,6 +1111,8 @@
 #define GICV5_GICR_CDNMIA_TYPE_MASK	GENMASK_ULL(31, 29)
 #define GICV5_GICR_CDNMIA_ID_MASK	GENMASK_ULL(23, 0)
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
 #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
 
@@ -1251,6 +1262,8 @@
 	par;								\
 })
 
+#if ARM64_S390_COMMON == 1
+
 #define SYS_FIELD_VALUE(reg, field, val)	reg##_##field##_##val
 
 #define SYS_FIELD_GET(reg, field, val)		\
@@ -1263,6 +1276,8 @@
 		 FIELD_PREP(reg##_##field##_MASK,	\
 			    SYS_FIELD_VALUE(reg, field, val))
 
+#endif /* ARM64_S390_COMMON == 1 */
+
 #endif /* __ASSEMBLER__ */
 
 #endif	/* __ASM_SYSREG_H */
-- 
2.53.0


