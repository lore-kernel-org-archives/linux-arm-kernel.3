Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02A8CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZUv8cR1VqrVbTl3mHf0T1bCgGPWY+ZTuBptjqVPGvU=; b=gtEmZQv+JuqDVSGE9ZfINOrlO0
	/wf0pcINx/MnBA3giuUKc1d2aOy61zpoDdcIYkWMNs2mlL+UyoKoLyd/LqWA+DMPwvBeykj2cfhH5
	5tue6wA3lV3uuoORJtIzDV355SZ37t/b646CB1TQW+bns3nmObmxkkm+06eYJ0GcjGoZry/8kvft2
	wqNgjRBJh+bL7WxNYPpbja1GUTKJLU3kBaw9gYrVgXYtOQ8wYaN8wT1azLUhwvt1PVjkkDRWVY3LU
	HrITxfAVRV7Jq6e0fJCi1uirAkLFd63sEdcfRb8Ltru2TWY8UlPsiszACR1C4yJs/+VAqFy3mZsix
	NpIbXVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeQ-00000007oVe-1zMx;
	Fri, 29 May 2026 16:01:34 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeL-00000007oR3-0OHO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:01:30 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TFn8hn1467755;
	Fri, 29 May 2026 15:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+ZUv8cR1VqrVbTl3m
	Hf0T1bCgGPWY+ZTuBptjqVPGvU=; b=KjBCfBcDQDSaiBO0bgNBLT02rP+uhMES5
	PE6oUpDzmJbapm1dT7iRxJxinaU6UbcawKYy3pSH4oWeCvRVrkHJkb5hbr8LQgbL
	fRRhM/t3MVRya13fFr7lBEBNuJkW2bhXGG9TYXCJ9iAoOrogpZz40aQkaN4OytJh
	4q5uPmP/ldgr6fN56+quEzfANkmAmg0mMk87EwzVeGilYvw2GnUrx9hgNjEuiRS9
	n+w6Ds8ztAlKLtcMk0dK/QN2wWMhe++ZLRa6iWVxlSPjC6YpAp09oSs7f27c5DGj
	Nk0pTsqIpyXWvRlxyWSfFqSzL7BCIJgjNV+gsFxSTN0kUc7FX87EA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee886mgkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64TFs56d016943;
	Fri, 29 May 2026 15:56:19 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4edjrbgjrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 15:56:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64TFuAMr49414438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 15:56:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACD8320040;
	Fri, 29 May 2026 15:56:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60B8E2004B;
	Fri, 29 May 2026 15:56:10 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 May 2026 15:56:10 +0000 (GMT)
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
Subject: [PATCH v1 22/26] KVM: arm64: Refactor core reg handling
Date: Fri, 29 May 2026 17:55:55 +0200
Message-ID: <20260529155601.2927240-23-seiden@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529155601.2927240-1-seiden@linux.ibm.com>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 31vsPhmURQS40ov7PA3eSqLGauBwurqn
X-Authority-Analysis: v=2.4 cv=Z8Dc2nRA c=1 sm=1 tr=0 ts=6a19b724 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=zUXWKsC1zW_jSfsg-zQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE1NiBTYWx0ZWRfXy/4faeW9qaEW
 jHrAgLdULeegCw7f465TqGT2M//Q02j4eP+f1UPT34tgcBZyAGXhkJA35zCnXUQQ075gAW5WvKr
 bdoEyvU3qt6QALFYzfu6Ou5pOduHPVHsKuGkC6DyQdSfAhqD8VU57Hc4BPVfxrQRwId9ujp57Z0
 1T+Od+20RwqJhNP25TcqC4kq2QYQExp+bZ9yd8HxkOAsabIw0X3DdljGY+QiLr6KYCVrdV6FNGT
 PR5xCeNPCE0L4gVVJcW2SgfhxaKNVVTOSfDpzKsW6iDjYTpRu3hkFTv88PIDWIeAWtwrKxFhw87
 IMd/aM7JMcYSnzZd5vmHj0Xe0OONeSv/hujVHoU6daTqI+wZCLwg1GDBe1JZj5m+i2/Y2YAZpcA
 5WfN7tgJyFxSxvs/rFTfyLTXqHuki8TVGpqgFvixSUzLiz54gMp7C8qnTNXHlMNH0QAJvGroBjs
 jHp/i8NDAU+rUa70kpg==
X-Proofpoint-ORIG-GUID: 31vsPhmURQS40ov7PA3eSqLGauBwurqn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090129_138584_9FE6E23A 
X-CRM114-Status: GOOD (  17.64  )
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

Refactor sysreg core handling. Before this all core regs are identified
with a memory address and reading/writing happened through accessing the
data at this address. However, for arm64 on s390 not all core registers
have a dedicated memory address.

Refactor such that the address function does not return an address but
actually does the read/write request. ELR_EL1 and SPSR_EL1 now use
vcpu_read_sys_reg/vcpu_write_sys_reg accessor functions, allowing s390
to provide custom implementations.

Co-developed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
---
 virt/kvm/arm64/guest.c | 100 ++++++++++++++++++++++++++---------------
 1 file changed, 64 insertions(+), 36 deletions(-)

diff --git a/virt/kvm/arm64/guest.c b/virt/kvm/arm64/guest.c
index 35ba03033b4c..11509382d594 100644
--- a/virt/kvm/arm64/guest.c
+++ b/virt/kvm/arm64/guest.c
@@ -65,69 +65,96 @@ static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
 	return size;
 }
 
-static void *core_reg_addr(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
+static int core_reg_rw(struct kvm_vcpu *vcpu, u64 reg_id, void *valp, bool read)
 {
-	u64 off = core_reg_offset_from_id(reg->id);
+	u64 off = core_reg_offset_from_id(reg_id);
 	int size = core_reg_size_from_offset(vcpu, off);
+	void *addr;
 
-	if (size < 0)
-		return NULL;
+	if (size < 0 || (KVM_REG_SIZE(reg_id) != size))
+		return -EINVAL;
 
-	if (KVM_REG_SIZE(reg->id) != size)
-		return NULL;
+	switch (off) {
+	case KVM_REG_ARM_CORE_REG(elr_el1):
+		if (read)
+			*(u64 *)valp = vcpu_read_sys_reg(vcpu, ELR_EL1);
+		else
+			vcpu_write_sys_reg(vcpu, *(u64 *)valp, ELR_EL1);
+		return 0;
+
+	case KVM_REG_ARM_CORE_REG(spsr[KVM_SPSR_EL1]):
+		if (read)
+			*(u64 *)valp = vcpu_read_sys_reg(vcpu, SPSR_EL1);
+		else
+			vcpu_write_sys_reg(vcpu, *(u64 *)valp, SPSR_EL1);
+		return 0;
+	}
 
 	switch (off) {
 	case KVM_REG_ARM_CORE_REG(regs.regs[0]) ...
 	     KVM_REG_ARM_CORE_REG(regs.regs[30]):
 		off -= KVM_REG_ARM_CORE_REG(regs.regs[0]);
 		off /= 2;
-		return &vcpu_gp_regs(vcpu)[off];
+		addr = &vcpu_gp_regs(vcpu)[off];
+		break;
 
 	case KVM_REG_ARM_CORE_REG(regs.sp):
-		return vcpu_sp_el0(vcpu);
+		addr = vcpu_sp_el0(vcpu);
+		break;
 
 	case KVM_REG_ARM_CORE_REG(regs.pc):
-		return vcpu_pc(vcpu);
+		addr = vcpu_pc(vcpu);
+		break;
 
 	case KVM_REG_ARM_CORE_REG(regs.pstate):
-		return vcpu_cpsr(vcpu);
+		addr = vcpu_cpsr(vcpu);
+		break;
 
 	case KVM_REG_ARM_CORE_REG(sp_el1):
-		return kvm_vcpu_get_sp_el1(vcpu);
-
-	case KVM_REG_ARM_CORE_REG(elr_el1):
-		return __ctxt_sys_reg(&vcpu->arch.ctxt, ELR_EL1);
-
-	case KVM_REG_ARM_CORE_REG(spsr[KVM_SPSR_EL1]):
-		return __ctxt_sys_reg(&vcpu->arch.ctxt, SPSR_EL1);
+		addr = kvm_vcpu_get_sp_el1(vcpu);
+		break;
 
 	case KVM_REG_ARM_CORE_REG(spsr[KVM_SPSR_ABT]):
-		return &vcpu->arch.ctxt.spsr_abt;
+		addr = &vcpu->arch.ctxt.spsr_abt;
+		break;
 
 	case KVM_REG_ARM_CORE_REG(spsr[KVM_SPSR_UND]):
-		return &vcpu->arch.ctxt.spsr_und;
+		addr = &vcpu->arch.ctxt.spsr_und;
+		break;
 
 	case KVM_REG_ARM_CORE_REG(spsr[KVM_SPSR_IRQ]):
-		return &vcpu->arch.ctxt.spsr_irq;
+		addr = &vcpu->arch.ctxt.spsr_irq;
+		break;
 
 	case KVM_REG_ARM_CORE_REG(spsr[KVM_SPSR_FIQ]):
-		return &vcpu->arch.ctxt.spsr_fiq;
+		addr = &vcpu->arch.ctxt.spsr_fiq;
+		break;
 
 	case KVM_REG_ARM_CORE_REG(fp_regs.vregs[0]) ...
 	     KVM_REG_ARM_CORE_REG(fp_regs.vregs[31]):
 		off -= KVM_REG_ARM_CORE_REG(fp_regs.vregs[0]);
 		off /= 4;
-		return kvm_vcpu_get_vreg(vcpu, off);
+		addr = kvm_vcpu_get_vreg(vcpu, off);
+		break;
 
 	case KVM_REG_ARM_CORE_REG(fp_regs.fpsr):
-		return  kvm_vcpu_get_fpsr(vcpu);
+		addr = kvm_vcpu_get_fpsr(vcpu);
+		break;
 
 	case KVM_REG_ARM_CORE_REG(fp_regs.fpcr):
-		return  kvm_vcpu_get_fpcr(vcpu);
+		addr = kvm_vcpu_get_fpcr(vcpu);
+		break;
 
 	default:
-		return NULL;
+		return -EINVAL;
 	}
+
+	if (read)
+		memcpy(valp, addr, size);
+	else
+		memcpy(addr, valp, size);
+
+	return 0;
 }
 
 int get_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
@@ -140,7 +167,9 @@ int get_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	 */
 	__u32 __user *uaddr = (__u32 __user *)(unsigned long)reg->addr;
 	int nr_regs = sizeof(struct kvm_regs) / sizeof(__u32);
-	void *addr;
+	__uint128_t tmp;
+	void *valp = &tmp;
+	int ret;
 	u32 off;
 
 	/* Our ID is an index into the kvm_regs struct. */
@@ -149,11 +178,12 @@ int get_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	    (off + (KVM_REG_SIZE(reg->id) / sizeof(__u32))) >= nr_regs)
 		return -ENOENT;
 
-	addr = core_reg_addr(vcpu, reg);
-	if (!addr)
-		return -EINVAL;
 
-	if (copy_to_user(uaddr, addr, KVM_REG_SIZE(reg->id)))
+	ret = core_reg_rw(vcpu, reg->id, valp, true);
+	if (ret)
+		return ret;
+
+	if (copy_to_user(uaddr, valp, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
 
 	return 0;
@@ -164,7 +194,7 @@ int set_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	__u32 __user *uaddr = (__u32 __user *)(unsigned long)reg->addr;
 	int nr_regs = sizeof(struct kvm_regs) / sizeof(__u32);
 	__uint128_t tmp;
-	void *valp = &tmp, *addr;
+	void *valp = &tmp;
 	u64 off;
 	int err = 0;
 
@@ -174,10 +204,6 @@ int set_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	    (off + (KVM_REG_SIZE(reg->id) / sizeof(__u32))) >= nr_regs)
 		return -ENOENT;
 
-	addr = core_reg_addr(vcpu, reg);
-	if (!addr)
-		return -EINVAL;
-
 	if (KVM_REG_SIZE(reg->id) > sizeof(tmp))
 		return -EINVAL;
 
@@ -220,7 +246,9 @@ int set_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 		}
 	}
 
-	memcpy(addr, valp, KVM_REG_SIZE(reg->id));
+	err = core_reg_rw(vcpu, reg->id, valp, false);
+	if (err)
+		goto out;
 
 	if (*vcpu_cpsr(vcpu) & PSR_MODE32_BIT) {
 		int i, nr_reg;
-- 
2.53.0


