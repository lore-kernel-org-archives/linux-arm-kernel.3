Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B4ECAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 20:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vJNpPsdQklqfKtuRWABGJHNN5kI2pylvrPJggCRG4l0=; b=oh+24RXdVBZ5yLMDTY49T4u8ag
	yqULZvQiHw0AJqty806EjISCJvB8R1rrpsAB600XyIZpTCRYe/ZtNdhVBHYIw0TbAtodFPEiYiNS3
	FUUZnFH9Q1XWP7Mg6HMQYnbBbgTHRcUazq79zuyzSY8cTApFlIGJ2WuOkDpR8ATZQLGZDCprbuPVC
	Izu7nNErBQaC0CzCE9OywFig+FIye0W7uJq3IKyjdPE8JW9oqFL3B5qSrYOhC98Y6V1u8ClufS8cB
	HFali6530ig9hym/e54ZFET9qcc9a1ZhdY6JppGbxS/VAshLr/XA0BxX3ZsVa+YfPaG0+GjKNEuwd
	sGN/kMAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6aeT-00000004cTW-0ny6;
	Wed, 08 Oct 2025 20:20:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6aeQ-00000004cRs-1QRU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 20:20:44 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e47cca387so2244215e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 13:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1759954840; x=1760559640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJNpPsdQklqfKtuRWABGJHNN5kI2pylvrPJggCRG4l0=;
        b=dK0Ha5CI5+qAWSSam3senEHl+GKZrCy/+VByfwgafShGrLCGtbaMsCkIb57yUufxBX
         iEJm+9/fodQXFI4QdrNkIGMfAYrxP2p5YfoJLKw1/+zUafUUIcUqNxeqbq6z+3y9i8ez
         qqFt/9eiCYWTpUGq7IZfOmC06FHJNA+KQ0ZweLxWTk6wjOeIxfmpXz2HYIVGQqWVG/ax
         XGF2UESv+pak+RUpCQO7I9EydompnfXxKx96bV5MJzLQ91fkwkXpibLjXx3lCgDbAH5Y
         jfJQstO58BR9N5n5X+cZlID6DaQbrkvDuQTK/lZ46OD2flGqVz5M3ajmbFRMcyix5ih7
         fkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759954840; x=1760559640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJNpPsdQklqfKtuRWABGJHNN5kI2pylvrPJggCRG4l0=;
        b=DaGDG5Q5iO0EUHKqWVfyPGU1V8yvyDkYF0SnKKWC2iQKhq9VfhgBaqCjIbqc0sCj0V
         c1sGLyZ3qwcLIkq7tk5u54kjlApqH9EpWoRnnCsWLodYiGyZ3oWfX/Imp8ZvQ0lgI4d8
         QRwAPWy1sWH3XhlqchkvcottO0YNo87bYkm5Z1T5G8e85UUSefs4hDTnZZ2OuoogAKRf
         Av2ceNf99jFaWJ8T92UVbJdxXKqMwBWu77fVJForhCj11jU8vae3nZOIO0q5guUOX+R+
         rDEV4zztoZoGzw7q5K7qUIPc3Nb42Gg62hU39DRq/SkmrxA4qMaI65NIod+YFmgoca87
         N4yw==
X-Forwarded-Encrypted: i=1; AJvYcCVbKTD1IphRTHYvY0fSOSSWGG8+xeZMS3s39xWYr5cppLjBHDjzZ6+dPnKHcJwnYeTAFThk4mwnSYrHKczd2Jpe@lists.infradead.org
X-Gm-Message-State: AOJu0YyCE790dnYVYqY8rh7fSyx9lZ7i1NxfQ98xT8Ja9+ve0fYYP0BE
	ETQu4nzyGKS/9QJ7VHFRdIqe4y9lJP9syvUoWUZ7mDuOeLvxYNGdl09it7p8mYv1OY8=
X-Gm-Gg: ASbGncuhrS7qEfDHd2Jv4MltQjLZ+dEJd3HjexBcpvq05G2SWXWgB9UCGmK/Z7BTsjN
	MfOyotXa5E0haScE3DjkYAyy9fO4lOJvmFWZj4oNzjJDApnSDnj7Q0ymtQapxwhM69dpX9kWL+j
	wzHchvklPfZEDLMyQ0Fzdjv4swHvRYQ30eyw4SVnEDJ2J9srK8DCijxWBeK886ykB0wXzeyq4Zy
	E3zE0ytPXwaAw8bukPs0xoprx+e60f+fhwbdw61QqGQO6iffT8n8V+o9tfOAPOOSWJpoGAheOBz
	tVDDCCMy3HmnnAz2jb/yC2LRcziFjqX4jYfOARDjYe6m1aWxqx1QmrXijMJ7cqg0C6tjCnk+Psc
	Fgd0ZpAZjGCTQBkKhN3I2/RQQk55Gst8NsOjtXCgz8Fo4vu0XWEuuRrD7tD9/ikMHCDmWxlYuCa
	0hkfDfVreH9JLXxd2FV9c0Nh6KNU/Dv3/GaT16e8E3obc=
X-Google-Smtp-Source: AGHT+IFM4K7XP4z2AGieVbbR2IlzDu8DLCDL4uKG4v9Kaas6lvil6rTJOq2Qsk2XBXTkAez+pnL+vQ==
X-Received: by 2002:a05:600c:c162:b0:45f:2cb5:ecff with SMTP id 5b1f17b1804b1-46fa9b02fa3mr40867845e9.31.1759954839949;
        Wed, 08 Oct 2025 13:20:39 -0700 (PDT)
Received: from localhost.localdomain ([90.209.204.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab64aed8sm20124745e9.10.2025.10.08.13.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:20:39 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: salil.mehta@huawei.com,
	jonathan.cameron@huawei.com,
	maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	james.morse@arm.com,
	sudeep.holla@arm.com,
	lpieralisi@kernel.org,
	jean-philippe@linaro.org,
	tglx@linutronix.de,
	oliver.upton@linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	andrew.jones@linux.dev,
	mst@redhat.com,
	david@redhat.com,
	philmd@linaro.org,
	ardb@kernel.org,
	borntraeger@linux.ibm.com,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org,
	npiggin@gmail.com,
	linux@armlinux.org.uk,
	karl.heubaum@oracle.com,
	miguel.luis@oracle.com,
	darren@os.amperecomputing.com,
	ilkka@os.amperecomputing.com,
	vishnu@os.amperecomputing.com,
	gankulkarni@os.amperecomputing.com,
	salil.mehta@opnsrc.net,
	wangyanan55@huawei.com,
	wangzhou1@hisilicon.com,
	linuxarm@huawei.com
Subject: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow lockless read when ready
Date: Wed,  8 Oct 2025 20:19:55 +0000
Message-Id: <20251008201955.3919537-1-salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_132042_522206_BA502A08 
X-CRM114-Status: GOOD (  23.82  )
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

From: Salil Mehta <salil.mehta@huawei.com>

[A rough illustration of the problem and the probable solution]

Userspace reads of ICC_CTLR_EL1 via KVM device attributes currently takes a slow
path that may acquire all vCPU locks. Under workloads that exercise userspace
PSCI CPU_ON flows or frequent vCPU resets, this can cause vCPU lock contention
in KVM and, in the worst cases, -EBUSY returns to userspace.

When PSCI CPU_ON and CPU_OFF calls are handled entirely in KVM, these operations
are executed under KVM vCPU locks in the host kernel (EL1) and appear atomic to
other vCPU threads. In this context, system register accesses are serialized
under KVM vCPU locks, ensuring atomicity with respect to other vCPUs. After
SMCCC filtering was introduced, PSCI CPU_ON and CPU_OFF calls can now exit to
userspace (QEMU). During the handling of PSCI CPU_ON call in userspace, a
cpu_reset() is exerted which reads ICC_CTLR_EL1 through KVM device attribute
IOCTLs. To avoid transient inconsistency and -EBUSY errors, QEMU is forced to
pause all vCPUs before issuing these IOCTLs. Later operation should be avoided
as it ends up in freezing VM till the entire KVM device IOCTL operation is
completed (and this could happen every time when PSCI CPU_ON is requested by
the Guest user). There are also known issues with the implementaiton of the
{pause, resume}_all_vcpus() in the QEMU which can lead to race conditions.

Introduce a per-vCPU shadow of ICC_CTLR_EL1 that allows userspace to read this
register without taking any vCPU-wide locks once the VGIC has been initialized.
The new helper vgic_v3_try_icc_ctlr_el1_lockless_access() attempts a fast,
lockless read of the per-vCPU shadow and returns -EBUSY if the VGIC is not yet
initialized, allowing the caller to fall back to the existing contended path.
This reduces cross-vCPU contention and prevents spurious -EBUSY errors during
userspace-driven CPU_ON sequences, without changing architectural behaviour.

The shadow is updated in set_gic_ctlr(): after VMCR fields are written, we
recompute ICC_CTLR_EL1 via get_gic_ctlr(). Writes remain unchanged and continue
to use the existing synchronized path.

Without this change, QEMU must cache ICC_CTLR_EL1 itself to avoid racy
pause_all_vcpus() usage during cpu_reset(), as described in:
https://lore.kernel.org/qemu-devel/20251001010127.3092631-22-salil.mehta@opnsrc.net/

RFC Discussion (Architectural Considerations):
=============================================

It might have been helpful if the ARM architecture were to have clearer
boundaries between dynamic and static (or pseudo-static) system registers(?)
Registers such as ICC_CTLR_EL1 contain configuration fields that are effectively
static once the VM is initialized (even the EOIMode, CBPR & PMHE are guest
GICv3 driver configured constants), yet the architecture allows them to coexist
with other more dynamic runtime fields of the ICH_ VMCR_EL2. If these
configuration registers had been architecturally immutable after VM
initialization, their accesses could have avoided expensive all-vCPU locking
otherwise required to guarantee atomic visibility across vCPUs.

ICC_CTLR_EL1 [63:0]

  63                                                                       32
 +---------------------------------------------------------------------------+
 |                                   RES0                                    |
 +---------------------------------------------------------------------------+
  31        20 19 18 17 16 15 14 13 12 11 10   9   8  7  6   5  4  3  2  1  0
 +------------+--+--+--+--+--+--+--+--+--+---+---+---+--+--+--+--+--+--+--+--+
 |    RES0    |Ex|RS|RES0 |A3|SE| IDbits |  PRIbits  |R0|PM|  RES0     |EO|CB|
 +------------+--+--+--+--+--+--+--+--+--+---+---+---+--+--+--+--+--+--+--+--+
              |  |        |  |                       |   |             |  |
              |  |        |  |                       |   |             |  +CBPR
              |  |        |  |                       |   |             +EOImode
              |  |        |  |                       |   +-PMHE
              |  |        |  |                       +----RES0
              |  |        |  +--SEIS
              |  |        +-----A3V
              |  +--------------RSS
              +-----------------ExtRange

 Access: {Ex, RS, A3, SE, IDbits, PRIbits} = RO;
         {PMHE} = RW*;
         {EO, CB} = RW**;
	 others = RES0.
 Notes : * impl-def (may be RO when DS=0)
         ** CB may be RO when DS=0 (EO stays RW)

 Source: Arm GIC Architecture Specification (IHI 0069H.b),
         §12.2.6 “ICC_CTLR_EL1”, pp. 12-233…12-237

Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
---
 arch/arm64/kvm/vgic-sys-reg-v3.c      | 14 ++++++++++++
 arch/arm64/kvm/vgic/vgic-kvm-device.c | 32 +++++++++++++++++++++++++++
 include/kvm/arm_vgic.h                |  3 +++
 3 files changed, 49 insertions(+)

diff --git a/arch/arm64/kvm/vgic-sys-reg-v3.c b/arch/arm64/kvm/vgic-sys-reg-v3.c
index bdc2d57370b2..80d6e38b4aa7 100644
--- a/arch/arm64/kvm/vgic-sys-reg-v3.c
+++ b/arch/arm64/kvm/vgic-sys-reg-v3.c
@@ -10,12 +10,17 @@
 #include "vgic/vgic.h"
 #include "sys_regs.h"
 
+static int get_gic_ctlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
+			u64 *valp);
+
 static int set_gic_ctlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 			u64 val)
 {
 	u32 host_pri_bits, host_id_bits, host_seis, host_a3v, seis, a3v;
+	struct vgic_v3_cpu_if *cif = &vcpu->arch.vgic_cpu.vgic_v3;
 	struct vgic_cpu *vgic_v3_cpu = &vcpu->arch.vgic_cpu;
 	struct vgic_vmcr vmcr;
+	u64 sysreg;
 
 	vgic_get_vmcr(vcpu, &vmcr);
 
@@ -53,6 +58,15 @@ static int set_gic_ctlr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	vmcr.eoim = FIELD_GET(ICC_CTLR_EL1_EOImode_MASK, val);
 	vgic_set_vmcr(vcpu, &vmcr);
 
+	/* update the ICC_CTLR_EL1 shadow, if required */
+	get_gic_ctlr(vcpu, r, &sysreg);
+
+	/*
+	 * Update the ICC_CTLR_EL1 shadow to allow lock free access of static
+	 * or pesudo static register fields from KVM device IOCTLs
+	 */
+	cif->icc_ctlr_el1_shadow = (u32)sysreg;
+
 	return 0;
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-kvm-device.c b/arch/arm64/kvm/vgic/vgic-kvm-device.c
index 3d1a776b716d..4a2971525c1a 100644
--- a/arch/arm64/kvm/vgic/vgic-kvm-device.c
+++ b/arch/arm64/kvm/vgic/vgic-kvm-device.c
@@ -522,6 +522,29 @@ static bool reg_allowed_pre_init(struct kvm_device_attr *attr)
 	}
 }
 
+/*
+ * Fast, lockless read of ICC_CTLR_EL1 for userspace ioctl. Saves calls from
+ * -EBUSY due to inability to acquire vCPU mutexes for all the vCPUs
+ */
+static inline int
+vgic_v3_try_icc_ctlr_el1_lockless_access(struct kvm_device *dev,
+                                         const struct kvm_device_attr *attr,
+                                         struct kvm_vcpu *vcpu)
+{
+	struct vgic_v3_cpu_if *vgic_cpu_if = &vcpu->arch.vgic_cpu.vgic_v3;
+	u32 __user *uaddr;
+	u32 shadow;
+
+	/* pathological check, in case we are here too early */
+	if (!vgic_initialized(dev->kvm))
+		return -EBUSY;
+
+	shadow = vgic_cpu_if->icc_ctlr_el1_shadow;
+	uaddr = (u32 __user *)(unsigned long)attr->addr;
+
+	return put_user(shadow, uaddr) ? -EFAULT : 0;
+}
+
 /*
  * vgic_v3_attr_regs_access - allows user space to access VGIC v3 state
  *
@@ -533,6 +556,7 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 				    struct kvm_device_attr *attr,
 				    bool is_write)
 {
+	u32 sysreg = attr->attr & ~KVM_DEV_ARM_VGIC_CPUID_MASK;
 	struct vgic_reg_attr reg_attr;
 	gpa_t addr;
 	struct kvm_vcpu *vcpu;
@@ -549,6 +573,14 @@ static int vgic_v3_attr_regs_access(struct kvm_device *dev,
 
 	switch (attr->group) {
 	case KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS:
+		/* Try lockless ICC_CTLR_EL1 read first */
+		if (!is_write && sysreg == SYS_ICC_CTLR_EL1) {
+			ret = vgic_v3_try_icc_ctlr_el1_lockless_access(dev,
+				 attr, vcpu);
+			if(!ret)
+				return ret;
+		}
+
 		/* Sysregs uaccess is performed by the sysreg handling code */
 		uaccess = false;
 		break;
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 4000ff16f295..42c767c62291 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -334,6 +334,9 @@ struct vgic_v3_cpu_if {
 	struct its_vpe	its_vpe;
 
 	unsigned int used_lrs;
+
+	/* ICC_CTLR_EL1 shadow (published to readers) */
+	u32 icc_ctlr_el1_shadow; /* upper 32 bits of this reg are reserved */
 };
 
 struct vgic_cpu {
-- 
2.34.1


