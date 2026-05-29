Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28403CD6E54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3M5oeXK8/HvvH8AIJsdSiaYNNCDui2bO7UvB9DCeHA=; b=fWlLYUL7ODbyeGq60p1flgt5J4
	r7AEsXp3pQNQ/bLSV8kq4XpyCksmOPun53CEVbCvOh1k20Olr5kLvq7huN3pJ6Krhowuyhh4yQ3vO
	FbOWBDsdwQoR1Jil+8Nj95bXjlMpnw/lYA2TwG0LaNNXMfM8lkALgwrdXMDZ6Oq4rVfPk48giCZkL
	qygByGUOZvZ6sSh9qFCqys4+eSDbl6Hw9KmNSX96HnlzayVGr+J2xTxD9/63jEoMlhDkZL66AotDp
	H9sRS5IbCweKT7rytVa1YFYbHhD5rVJbMFEFIx2JOJwmC+vRbD9HaurYkIZWZux/XK7p+UktFIHFI
	dco1IJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZy-00000007mqP-1ilO;
	Fri, 29 May 2026 15:56:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZb-00000007mRh-3ks5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 May 2026 15:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=e3M5oeXK8/HvvH8AIJsdSiaYNNCDui2bO7UvB9DCeHA=; b=i7sJv6peTl7lDxBtjbVp1p751f
	2CWVZ7OyTFjW/DdZ9q92JIRotd52n+qo6ydnoIYuBR6KdsBOo89gd2qkqmHlKIEpTijYad+t5jE4i
	p/chbDZm7BGNXcEfpdCb+h6ca/a4B3IiDyPm0MZIyl94wsXQZHIu0JC5h6/OTxU3B5ox76Ix/W+tE
	wJnjmAkWN+CmN27AjEe54HoIsl2QPC/Ou0Qegf4AGy8TvqreGzJWddCE5e+EbjY6NDvdyBPk126Q2
	p3uAfvQZaogpqLq6mx7Y6nET8shkOI7tW9OhpkVbHkUY0MB4kwjcDyI0mwgKTBRoniKyQx5wZLTgy
	f17q36OQ==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzZX-00000001nGk-3BqB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:56:34 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TFEloI1687341;
	Fri, 29 May 2026 15:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=e3M5oeXK8/HvvH8AI
	JsdSiaYNNCDui2bO7UvB9DCeHA=; b=i6RMln5/jJlE9sRYdUs19yeO3qgElHN75
	w1OYoFfHfGoHKbqwXGHgxcRg7zGPauhY5bO7zvnJWXSnSjk83Kc2KFDrfYLcRnJq
	LTbZERCSq0zDuiueEEBqMNFrhgaRGIbISlU3KCr2eCVVMHqcza9PVP7RfK9+d4Xl
	90p6xPYL6zeGLIcd27eYB1NdK5iQk7vIWwEDUivFo0UpifnchKNysEGphyclpb9u
	PRCZ6Ta6FKyky8lzqEdhG0oJbC3ULQ+YkRi5x0pfn7SxG8o6sziuIdEYUP8Z+w4E
	8QTN+b7M4KRyGQvq8WbnaCm6/jwYZ0O6Ba2AgmCzTIE/xBT1nZEHA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee884mh72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TFs6O9016985;
	Fri, 29 May 2026 15:56:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4edjrbgjpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:14 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TFu8Kp30212444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:56:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40F1B20040;
	Fri, 29 May 2026 15:56:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6FFB2004D;
	Fri, 29 May 2026 15:56:07 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 May 2026 15:56:07 +0000 (GMT)
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
        Friedrich Welter <fritz@linux.ibm.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v1 16/26] KVM: s390: arm64: Add sysreg related functions and definitions
Date: Fri, 29 May 2026 17:55:49 +0200
Message-ID: <20260529155601.2927240-17-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529155601.2927240-1-seiden@linux.ibm.com>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=fIYJG5ae c=1 sm=1 tr=0 ts=6a19b71f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8 a=MsWRDpXVTiI-Ka77MfMA:9
X-Proofpoint-ORIG-GUID: 59SpjLFTUJAUYtbHRDBRyeo-pxmJMK2j
X-Proofpoint-GUID: 59SpjLFTUJAUYtbHRDBRyeo-pxmJMK2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1NiBTYWx0ZWRfXxHpZFV9dBMdY
 maZ4wn1wka7bBZQJPfQGGkbJ+DdOlFxGM5Q8fB8ATc430t4I2iLPXu7w0nqbnG5xtNNVb1UWlAt
 B7W1FnC51ffdKIzio9Ejid7scvtLtfOes//jH2NU63b8rd5WXNW6nrNYr6gR+B6X0NR/Fp+Jvqg
 awXd6NKhIe+R8u1B1/5uC0HzyiQk/p0XRm4ED1TsRHhedo+8vQIcTJZPSTC5J0E8eZGhL/Reepr
 JsAntrgqoFy8XUw88bDx2S9D5uMUTRVSj8xcG9O35p4MfMCZkemBEXkCafIE94OypLjDezgCfFD
 F3+B79bWhV3Oj63VS9fjghDNUJgBI81BhxNW4X5kTNc5rSUXQvm2eZGQgmTYjq0HeEnMo9cQWQi
 D3huPyi/X4TUH++KGY9NmDl3ZhfMWRuM3aCUbsw6sMBa1GUEa7R2mANkgtB1KyIIxLvAlfau8UM
 L+cJAriTG89JsQQm/lA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_165632_488596_D9C065F0 
X-CRM114-Status: GOOD (  17.97  )
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

Add guest sysreg access macros in asm/kvm_host_arm64.h using
easr()/sasr()-based helpers for sysregs that map to the SAE save area.

Also add the guest-visible sysreg enum and per-vCPU/per-VM storage for
state that is not directly covered by the save area, such as CLIDR_EL1,
CSSELR_EL1, MPIDR_EL1, and VM-wide ID register state.

This lays out the header-side definitions needed to ensure compilation
success during for the share-code-patches and later sysreg handling
during vCPU setup and runtime.

Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 arch/s390/include/asm/kvm_host_arm64.h | 165 +++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/s390/include/asm/kvm_host_arm64.h b/arch/s390/include/asm/kvm_host_arm64.h
index 8c3214c5b004..d6d9e3ad7a8e 100644
--- a/arch/s390/include/asm/kvm_host_arm64.h
+++ b/arch/s390/include/asm/kvm_host_arm64.h
@@ -44,10 +44,19 @@ struct kvm_vcpu_arch {
 	struct kvm_sae_save_area save_area;
 	struct kvm_cpu_context ctxt;
 
+	/* Guest system registers not part of save area or ID registers */
+	u64 sys_reg_clidr_el1;
+	u64 sys_reg_csselr_el1;
+	/* Per-vcpu CCSIDR override or NULL */
+	u32 *ccsidr;
+
 	u32 host_acrs[NUM_ACRS];
 
 	/* Hypervisor Configuration Register */
 	u64 hcr_elz;
+	u64 hcrx_elz;
+
+	u64 mpidr;
 
 	/* Configuration flags, set once and for all before the vcpu can run */
 	u8 cflags;
@@ -209,4 +218,160 @@ static inline void kvm_arch_async_page_present_queued(struct kvm_vcpu *vcpu)
 
 #define kvm_supports_32bit_el0() false
 
+#define vcpu_read_sys_reg(_v, _r) 0xbad1234bad
+#define vcpu_write_sys_reg(_v, _p, _r) ((void)0)
+
+#define __vcpu_sys_reg(__vcpu, __reg) \
+	vcpu_read_sys_reg(__vcpu, __reg)
+
+#define __vcpu_assign_sys_reg(__vcpu, __reg, __val) \
+	vcpu_write_sys_reg(__vcpu, __val, __reg)
+
+/* Read, modify and write system register
+ *
+ */
+#define _vcpu_rmw_sys_reg(C, V, OP, R) \
+({ \
+	u64 __val = vcpu_read_sys_reg(C, R); \
+	__val OP V; \
+	vcpu_write_sys_reg(C, __val, R); \
+})
+
+/**
+ * _vcpu_read_sys_reg() - read a guest sysreg with easr
+ * - R - sysreg id; must be readable by easr; must be compile time constant
+ *
+ *   if SYSREGS_ON_CPU: proceed with flags = 0
+ *   otherwise:         proceed with either
+ *                         read:  flags = EASR_FLAG_SA
+ *                         write: flags = SASR_FLAG_INITIALIZED
+ *
+ */
+#define _vcpu_read_sys_reg(C, R) \
+	({	BUILD_BUG_ON(!__builtin_constant_p((R))); \
+		BUG_ON(vcpu_is_loaded(C) && smp_processor_id() != (C)->cpu); \
+		(vcpu_is_loaded(C)) \
+			? __vcpu_read_sr((C), (R), 0) \
+			: __vcpu_read_sr((C), (R), EASR_FLAG_SA); })
+
+/**
+ * _vcpu_write_sys_reg() - write a guest sysreg with sasr
+ * - R - sysreg id; must be readable by sasr; must be compile time constant
+
+ *   if SYSREGS_ON_CPU: proceed with flags = 0
+ *   otherwise:         proceed with either
+ *                         read:  flags = EASR_FLAG_SA
+ *                         write: flags = SASR_FLAG_INITIALIZED
+ */
+#define _vcpu_write_sys_reg(C, V, R) \
+	({	BUILD_BUG_ON(!__builtin_constant_p((R))); \
+		BUG_ON(vcpu_is_loaded(C) && smp_processor_id() != (C)->cpu); \
+		(vcpu_is_loaded(C)) \
+			? __vcpu_write_sr((C), (V), (R), 0) \
+			: __vcpu_write_sr((C), (V), (R), SASR_FLAG_INITIALIZED); })
+
+/* Forward to easr / sasr
+ * assert that F and R are constant
+ */
+#define __vcpu_read_sr(C, R, F) \
+	({	BUILD_BUG_ON(!__builtin_constant_p((R))); \
+		BUILD_BUG_ON(!__builtin_constant_p((F))); \
+		easr((R), &(C)->arch.save_area, (F)); })
+
+#define __vcpu_write_sr(C, V, R, F) \
+	({	BUILD_BUG_ON(!__builtin_constant_p((R))); \
+		BUILD_BUG_ON(!__builtin_constant_p((F))); \
+		sasr((R), (V), &(C)->arch.save_area, (F)); })
+
+#define SR_GROUP(NAME, ...)	\
+	__##NAME##_BEGIN__,	\
+	__VA_ARGS__		\
+	__##NAME##_END__
+
+/** enum vcpu_sysreg - available guest sysregs
+ *
+ * Contains all arm64 guest-syregs supported by s390.
+ */
+enum vcpu_sysreg {
+	__INVALID_SYSREG__, /* 0 is reserved as an invalid value */
+
+	/* EL 0,1 Register from state description in order of appearance */
+	SR_GROUP(STATE_DESC,
+	CNTP_CTL_EL0,
+	CNTV_CTL_EL0,
+	CONTEXTIDR_EL1,
+	SP_EL1,
+	),
+
+	/* EL 0,1 Register requiring special handling. */
+	SR_GROUP(SPECIAL,
+	CSSELR_EL1,
+	CLIDR_EL1,
+	MPIDR_EL1,
+	),
+
+	/* EL 0,1 register from save area in order of appearance */
+	SR_GROUP(SAVE_AREA,
+	ACTLR_EL1,
+	AFSR0_EL1,
+	AFSR1_EL1,
+	CNTFRQ_EL0,
+	CNTP_CVAL_EL0,
+	CNTV_CVAL_EL0,
+	DISR_EL1,
+	MIDR_EL1,
+	OSLSR_EL1,
+	PAR_EL1,
+	OSLAR_EL1,
+	SCTLR_EL1,
+	CPACR_EL1,
+	VBAR_EL1,
+	SPSR_EL1,
+	ELR_EL1,
+	ESR_EL1,
+	TCR_EL1,
+	MAIR_EL1,
+	TTBR0_EL1,
+	TTBR1_EL1,
+	FAR_EL1,
+	TPIDR_EL0,
+	TPIDR_EL1,
+	TPIDRRO_EL0,
+	CNTKCTL_EL1,
+	ZCR_EL1,
+	SCXTNUM_EL0,
+	SCXTNUM_EL1,
+	APIBKEYLO_EL1,
+	APIBKEYHI_EL1,
+	APIAKEYLO_EL1,
+	APIAKEYHI_EL1,
+	APGAKEYLO_EL1,
+	APGAKEYHI_EL1,
+	APDBKEYLO_EL1,
+	APDBKEYHI_EL1,
+	APDAKEYLO_EL1,
+	APDAKEYHI_EL1,
+	MDSCR_EL1,
+	),
+
+	NR_SYS_REGS /* Nothing after this line! */
+};
+
+void vcpu_write_host_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg);
+u64 vcpu_read_host_sys_reg(const struct kvm_vcpu *vcpu, int reg);
+
+#define kvm_debug_handle_oslar(_v, _val) /* debug not implemented yet*/
+
+static inline u8 kvm_arm_pmu_get_pmuver_limit(void)
+{
+	return 0;
+}
+
+int __init kvm_sys_reg_table_init(void);
+
+static inline u64 kvm_sanitised_host_ftr_reg(u32 id)
+{
+	return 0xbad1234bad;
+}
+
 #endif /* ASM_KVM_HOST_ARM64_H */
-- 
2.53.0


