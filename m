Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5087FCC6B1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlzwCwx4ql6NOlkNlY21CroQHyCKN5/qj9HvQI6owl8=; b=1RBeN5FIEGIhwmOYrZrApft8py
	90xLqpImhzH8bOlE9mCTPXXXzhi6FNIF6/vl8kFywmf5MDKItuNH0gBnxwbbgwoHbGtjFCcjJm8iB
	L3vI3KBWr26H9qSXQ896q1oS+qluB1GHnUJC1rOOPq8d6qR1VfE1lC64wa9PYhw7lODkYVd8mpOJ5
	VWX8Zoflc5rwTfE8zDG3kSjNVpI6EVW8IJNlUQreqX58m30p3XitjM4/LG97VUHFpxVjbz12reUlE
	/OILN9cNIsbVbnFkSA+T/ZkQh80ZDFLCYqagB0wJe+C2w8mPQACGxKIRhy0Ih0Q6kv5ifC8SrCPwX
	gchKyfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvDY-0000000F1Lz-0729;
	Wed, 14 Oct 2026 09:24:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvDW-0000000F1LO-3Z0x
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nlzwCwx4ql6NOlkNlY21CroQHyCKN5/qj9HvQI6owl8=; b=GSubY3DSzmDwX8UkzrX/CWq/d2
	lpyQHZG72ettmFDL7xdd4cKRmQsBNjesMhb0RVgrX1RHFh4GJSlbMndNvACpOqA0EVvafs8WtyhOe
	E+c8sx4zmAt1GsVykXIepRXQFulc/X1lUXuN80wTVuiHgaWhBTuYEk5ZahZIAM0W+TutpELxvgi4w
	HjDiPhRDEqKxBPhGDjvAvcqZnGqbtidAcS8kTYA5h4VfsRETFtOo8fpdaWKWo6eKY+vrkQWX9fhuT
	nv9Kx99wwkQ0M4s2UzJ3pRmDPoRPMG9RYCZoZ85tEVIpaAX475pr5dMbWU/2+R05a5uZ996PaFYuj
	v/gCUdNw==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvDT-0000000GYYX-1LkC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:24:09 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DNURQt148965;
	Wed, 14 Oct 2026 09:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=nlzwCwx4ql6NOlkNlY21CroQHyCKN5
	/qj9HvQI6owl8=; b=tFlCqFLixuCc+nomUmxHluajIpWcA4rM4nSU+S8sPED4sg
	tL/V0Ly8kaPN4hDRQDyLmhfa8NjoDalK+wHzSj9gSL7VkKoBbN57VF/RfncRSQJs
	JGAq6sVwwdEy63QKv8myN41mbuvg58pdNIEzsYVMiMQxgqkRgLHHC46Kq+82NiZd
	Gjg2ZW2vWnzj0OEnn8kulM6JjiS9sLaQ0ULQ6wL6Cya3ejISGSGpBB3lsODdT5vv
	NEafvP6/6PS9jp2wmT+blk6v4GSy6PEIX4SIQD1betFEeORj/OlVV/oq3wH1sSSN
	bnr0I8VhkV8wKaujAdOQwGO/4Bzplf48bYT92p8Q==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwhkhj5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 09:23:49 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6tVue3303962;
	Wed, 14 Oct 2026 09:23:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h9qb6v2s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Oct 2026 09:23:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69E9NiZh48431392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Oct 2026 09:23:45 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDD5F20043;
	Wed, 14 Oct 2026 09:23:44 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D62820040;
	Wed, 14 Oct 2026 09:23:44 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 14 Oct 2026 09:23:44 +0000 (GMT)
Date: Wed, 14 Oct 2026 11:23:43 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
Subject: Re: [PATCH v9 00/24] KVM: s390: Introduce arm64 KVM
Message-ID: <20261014092343.715112-C-seiden@linux.ibm.com>
References: <20260930173441.66762-1-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930173441.66762-1-seiden@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX6zvCKCl1Xo0o
 U3Wb7W5df0dBrRUxyfZtBdSiI5a6ybpnRpm0yb7nXjDoqQLgbqypH/+oK4vGn+FOebKu/8XgWZe
 NmS5bezW2VNzWf5cpHsWA97gXJXk9TE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNiBTYWx0ZWRfX8jDBFbdmQFqh
 bZTmCK7YKKElMaDyWWM6jK7Y0wcrVEhYTmJssXigkbl3yL23+l6lTLVs3w3Q5cYqh4J/7eQCs7/
 ovpeuOdL96IzX611tAHsLBgeHVe4et4+Cz0HINH5Qiq6Rku6/Mc40TgOIPq7Mn/bgKLTQ27OQTS
 Ezi+W/+5D3YC0iFaqnOk3dzNogJDI66Ush62CVTA+KWUBeiSgto0yaVWHN3x9500ducK1kW8hqr
 GjurzTURoTaVceUlrOiosK1iyKUKcPzjJSFGjVSXBU20d7oOgHhU7b4fXDd7dUs4O2BysbVoHBV
 09WwJ31SpA9tv7rnu28wi8GWi1V+2ySWNFPAajmxTCMsQ7cSf5T6jPsmqXZ+9DULW+XSLpjzUxj
 atAZokyFJ7ouOzw1n4ANwIZV6KkJBFoFL5q24ohooo1dmGNl1lnQU8XemQUg2gx5u3K3AJUnB70
 xpW7lg+jgmzdM0fubxw==
X-Proofpoint-GUID: eLe3nlx4Jgpr8bJoduCbpHOWOCaMCYP4
X-Authority-Analysis: v=2.4 cv=RoFQvymK c=1 sm=1 tr=0 ts=6acf4a26 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=mNgubmSHTQ3tbvP6NXUA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: HbY21kkeNkxF9so9KZPoocD5Mmj9irlb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_102407_997927_8F6611FA 
X-CRM114-Status: GOOD (  25.30  )
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

On Wed, Sep 30, 2026 at 07:34:15PM +0200, Steffen Eiden wrote:
> Introduce arm-on-s390. Enable KVM-accelerated ARM CPU virtualisation on s390.
> 

....

The s390 patches (12..) of this series currently have 3 **build**
conflicts with linux-next / armkvm-next. But git will apply them clean.

Triggered by:
a467f39afc2a ("KVM: arm64: Prevent unsupported vcpu features for VM types")

eb2eb48c8d72 ("arm64: Add ESR fault helpers")
caa63620f9e3 ("KVM: Allow architectures to disallow pre-fault")

They can be solved by applying the following patches while merging.
Fix is below the patch they fixup.
> 
> Hendrik Brueckner (1):
>   s390/hwcaps: Report SAE support as hwcap
> 
> Steffen Eiden (23):
>   KVM: Make device name configurable
>   KVM: Move architecture capability Kconfigs to header defines
>   KVM: Replace CONFIG_KVM_MMIO with KVM_NO_MMIO
>   arm64: Use proper include variant
>   arm64: ptrace: Use constants for compat register numbers
>   arm64: sysreg: Convert SPSR_ELx to automatic register generation
>   KVM: arm64: Access elements of vcpu_gp_regs individually
>   KVM: arm64: Use accessor functions for core regs
>   arm64: Prepare sharing arm64 headers with s390
>   arm64: Share arm64 headers with s390
>   KVM: arm64: Share arm64 code with s390
>   s390/Kconfig: remove PCI dependency from HAS_IOMEM
>   KVM: s390: Use dedicated function for migration mode
>   s390/tools: Use arm64 headers
>   KVM: s390: Use arm64 code
>   s390: Introduce Start Arm Execution instruction
>   KVM: s390: arm64: Introduce host definitions
>   KVM: s390: Add basic arm64 kvm module
diff --git a/arch/s390/kvm/arm64/arm.c b/arch/s390/kvm/arm64/arm.c
index 803325fc3d55..bd9d85235f43 100644
--- a/arch/s390/kvm/arm64/arm.c
+++ b/arch/s390/kvm/arm64/arm.c
@@ -23,7 +23,7 @@
 #define CREATE_TRACE_POINTS
 #include "trace.h"
 
-static unsigned long system_supported_vcpu_features(void);
+static unsigned long system_supported_vcpu_features(struct kvm_vcpu *vcpu);
 
 #define __INCL_GEN_ARM_FILE
 #include "generated/arm.inc"
@@ -242,7 +242,7 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 	return 0;
 }
 
-static unsigned long system_supported_vcpu_features(void)
+static unsigned long system_supported_vcpu_features(struct kvm_vcpu *vcpu)
 {
 	unsigned long features = KVM_S390_ARM64_IMPL_FEATURES;


>   KVM: s390: arm64: Implement required functions
>   KVM: s390: arm64: Implement vm/vcpu create destroy
>   KVM: s390: arm64: Implement vCPU IOCTLs
>   KVM: s390: arm64: Implement basic page fault handler
diff --git a/arch/s390/kvm/arm64/mmu.c b/arch/s390/kvm/arm64/mmu.c
index 3c1c8a2def73..31e0d036896f 100644
--- a/arch/s390/kvm/arm64/mmu.c
+++ b/arch/s390/kvm/arm64/mmu.c
@@ -76,6 +76,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	bool translation = false;
 	phys_addr_t fault_ipa;
 	unsigned long hva;
+	unsigned long esr;
 	bool write_fault;
 	bool guest_size_err;
 	bool writable;
@@ -83,6 +84,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 	int ret;
 	gfn_t gfn;
 
+	esr = kvm_vcpu_get_esr(vcpu);
 	fault_ipa = kvm_vcpu_get_fault_ipa(vcpu);
 	is_iabt = kvm_vcpu_trap_is_iabt(vcpu);
 	guest_size_err = vcpu->arch.sae_block.icptr == SAE_ICPTR_GUEST_ADDRESS_SIZE;
@@ -143,7 +145,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		 * Check for a cache maintenance operation. Assume the guest is
 		 * cautious and skip instruction
 		 */
-		if (kvm_is_error_hva(hva) && kvm_vcpu_dabt_is_cm(vcpu)) {
+		if (kvm_is_error_hva(hva) && esr_dabt_is_cm(esr)) {
 			kvm_incr_pc(vcpu);
 			ret = 1;
 			goto out_unlock;
@@ -198,3 +200,11 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu, struct kvm_pre_fault_
 	end = ALIGN(range->gpa + PAGE_SIZE, f.crste_region3 ? _REGION3_SIZE : HPAGE_SIZE);
 	return min(range->size, end - range->gpa);
 }
+
+int kvm_arch_pre_fault_allowed(struct kvm_vcpu *vcpu)
+{
+	if (!kvm_vcpu_initialized(vcpu))
+		return -ENOEXEC;
+
+	return 0;
+}


>   KVM: s390: arm64: Integrate arm on s390
> 

	Steffen
>  MAINTAINERS                                  |   1 +
>  arch/arm64/Makefile                          |   3 +
>  arch/arm64/include/asm/brk-imm.h             |   1 +
>  arch/arm64/include/asm/esr.h                 |   5 +-
>  arch/arm64/include/asm/kvm_arm.h             |   6 +-
>  arch/arm64/include/asm/kvm_emulate.h         |  64 +-
>  arch/arm64/include/asm/kvm_host.h            | 120 +--
>  arch/arm64/include/asm/ptrace.h              |  64 +-
>  arch/arm64/include/asm/sysreg.h              |  22 +-
>  arch/arm64/kvm/Kconfig                       |   4 -
>  arch/arm64/kvm/arm.c                         |   3 +
>  arch/arm64/kvm/guest.c                       |  22 +-
>  arch/arm64/kvm/hyp/exception.c               |   4 +-
>  arch/arm64/kvm/hyp/include/hyp/adjust_pc.h   |   4 +-
>  arch/arm64/kvm/hyp/include/hyp/switch.h      |   4 +-
>  arch/arm64/kvm/mmio.c                        |   2 +
>  arch/arm64/tools/sysreg                      |  51 ++
>  arch/loongarch/include/asm/kvm_host.h        |   2 +
>  arch/loongarch/kvm/Kconfig                   |   3 -
>  arch/mips/include/asm/kvm_host.h             |   1 +
>  arch/mips/kvm/Kconfig                        |   2 -
>  arch/powerpc/include/asm/kvm_host.h          |  10 +
>  arch/powerpc/kvm/Kconfig                     |   5 -
>  arch/riscv/include/asm/kvm_host.h            |   2 +
>  arch/riscv/kvm/Kconfig                       |   3 -
>  arch/s390/Kconfig                            |   5 +-
>  arch/s390/include/arm64/kvm_emulate.h        | 130 ++++
>  arch/s390/include/arm64/kvm_nested.h         |  11 +
>  arch/s390/include/arm64/ptrace.h             |  11 +
>  arch/s390/include/arm64/sysreg.h             |  13 +
>  arch/s390/include/asm/asm-prototypes.h       |   1 +
>  arch/s390/include/asm/elf.h                  |   2 +
>  arch/s390/include/asm/io.h                   |  12 +-
>  arch/s390/include/asm/kvm.h                  |   6 +
>  arch/s390/include/asm/kvm_host.h             |   4 +
>  arch/s390/include/asm/kvm_host_arm64.h       | 209 +++++
>  arch/s390/include/asm/kvm_host_arm64_types.h | 124 +++
>  arch/s390/include/asm/kvm_host_s390.h        |   5 +
>  arch/s390/include/asm/kvm_host_types.h       |   4 +
>  arch/s390/include/asm/sae.h                  |  49 ++
>  arch/s390/include/asm/sclp.h                 |   5 +-
>  arch/s390/include/asm/stacktrace.h           |   5 +
>  arch/s390/include/uapi/Kbuild                |   6 +
>  arch/s390/kernel/asm-offsets.c               |   1 +
>  arch/s390/kernel/entry.S                     |  22 +
>  arch/s390/kernel/processor.c                 |   3 +
>  arch/s390/kvm/Kconfig                        |  27 +-
>  arch/s390/kvm/Makefile                       |   1 +
>  arch/s390/kvm/arm64/.gitignore               |   2 +
>  arch/s390/kvm/arm64/Makefile                 | 110 +++
>  arch/s390/kvm/arm64/Makefile.gen             |  28 +
>  arch/s390/kvm/arm64/arm.c                    | 754 +++++++++++++++++++
>  arch/s390/kvm/arm64/arm.h                    |  58 ++
>  arch/s390/kvm/arm64/copy-arm64c.awk          |  82 ++
>  arch/s390/kvm/arm64/guest.c                  | 135 ++++
>  arch/s390/kvm/arm64/handle_exit.c            | 161 ++++
>  arch/s390/kvm/arm64/handle_exit.h            |   9 +
>  arch/s390/kvm/arm64/inject_fault.c           |  21 +
>  arch/s390/kvm/arm64/mmio.c                   |  15 +
>  arch/s390/kvm/arm64/mmu.c                    | 200 +++++
>  arch/s390/kvm/arm64/reset.c                  |  71 ++
>  arch/s390/kvm/arm64/trace.h                  | 101 +++
>  arch/s390/kvm/gmap/faultin.c                 |   5 +
>  arch/s390/kvm/gmap/gmap.c                    |   4 +
>  arch/s390/kvm/gmap/kvm_mmu.c                 |   6 +-
>  arch/s390/kvm/gmap/trace_gmap.h              |  17 +-
>  arch/s390/kvm/s390/Makefile                  |   2 +-
>  arch/s390/tools/Makefile                     |   6 +-
>  arch/s390/tools/Makefile.arm64h              |  55 ++
>  arch/s390/tools/copy-arm64h-full.awk         |  50 ++
>  arch/s390/tools/copy-arm64h.awk              |  83 ++
>  arch/s390/tools/opcodes.txt                  |   3 +
>  arch/x86/include/asm/kvm_host.h              |   3 +
>  arch/x86/kvm/Kconfig                         |   4 -
>  drivers/s390/char/sclp_early.c               |   1 +
>  include/linux/kvm_host.h                     |  24 +-
>  include/trace/events/kvm.h                   |   8 +-
>  virt/kvm/Kconfig                             |  18 -
>  virt/kvm/Makefile.kvm                        |   9 +-
>  virt/kvm/async_pf.c                          |   5 +-
>  virt/kvm/coalesced_mmio.c                    |   4 +
>  virt/kvm/coalesced_mmio.h                    |   2 +-
>  virt/kvm/eventfd.c                           |   3 +-
>  virt/kvm/kvm_main.c                          |  44 +-
>  84 files changed, 2968 insertions(+), 199 deletions(-)
>  create mode 100644 arch/s390/include/arm64/kvm_emulate.h
>  create mode 100644 arch/s390/include/arm64/kvm_nested.h
>  create mode 100644 arch/s390/include/arm64/ptrace.h
>  create mode 100644 arch/s390/include/arm64/sysreg.h
>  create mode 100644 arch/s390/include/asm/kvm.h
>  create mode 100644 arch/s390/include/asm/kvm_host_arm64.h
>  create mode 100644 arch/s390/include/asm/kvm_host_arm64_types.h
>  create mode 100644 arch/s390/include/asm/sae.h
>  create mode 100644 arch/s390/include/uapi/Kbuild
>  create mode 100644 arch/s390/kvm/arm64/.gitignore
>  create mode 100644 arch/s390/kvm/arm64/Makefile
>  create mode 100644 arch/s390/kvm/arm64/Makefile.gen
>  create mode 100644 arch/s390/kvm/arm64/arm.c
>  create mode 100644 arch/s390/kvm/arm64/arm.h
>  create mode 100644 arch/s390/kvm/arm64/copy-arm64c.awk
>  create mode 100644 arch/s390/kvm/arm64/guest.c
>  create mode 100644 arch/s390/kvm/arm64/handle_exit.c
>  create mode 100644 arch/s390/kvm/arm64/handle_exit.h
>  create mode 100644 arch/s390/kvm/arm64/inject_fault.c
>  create mode 100644 arch/s390/kvm/arm64/mmio.c
>  create mode 100644 arch/s390/kvm/arm64/mmu.c
>  create mode 100644 arch/s390/kvm/arm64/reset.c
>  create mode 100644 arch/s390/kvm/arm64/trace.h
>  create mode 100644 arch/s390/tools/Makefile.arm64h
>  create mode 100644 arch/s390/tools/copy-arm64h-full.awk
>  create mode 100644 arch/s390/tools/copy-arm64h.awk
> 
> 
> base-commit: 16096aadaa3d15c11d37bbea750bad0917e8eadf
> -- 
> 2.53.0
> 

