Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A0ACCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33cozUgZY2qVcRUHL7b8tITs99/x6FMYwOKO1Eer8GQ=; b=BCNDWFgXKvF2cO9hP6Zrt5JKli
	WpIx21uLd/fWSVYlhdHUP1R3izTvqU9xRZoRzrz1B9ZspecqYA0d5KNDAQ8+Jg2PfRCB77sAfOn3J
	XS0z948LAlroMEcpH8x2AGhB5TTD+YzxEv/CFVvLARgeCqBcd4262j75TT3FgAsudSDVBPFHbm8VD
	4Ds7ze1Icj2PxamrJztzalG4jA91oMun0N4ZXPJzJHigdL0gXjJiTZqMBBP5510zKqfbbNMJUjfgL
	u9rYAtHGzweajcYy+n4JGKWpeCu2D1PeLjIhb4/FMt63eLUoEcE1IOMMYqMan+sl9o2Ea5IQZc96X
	p5aJ+tzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YOx-00000006CfA-3Iyl;
	Fri, 17 Oct 2025 00:32:59 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YOr-00000006CWV-1bMC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 00:32:55 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-334b0876195so1510556a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 17:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661172; x=1761265972; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=33cozUgZY2qVcRUHL7b8tITs99/x6FMYwOKO1Eer8GQ=;
        b=poP3TdRixJLISvqC6fMbTz3kCn4I0y2yzRcegStp882Rd9GYIE7zXgkpSFFBINizCj
         ipUOiCmtRBpCzQbrEQsDFc1TzjGhvrTtxW2vloREHcS8ebgd1ZfntwJ+JzN8VqatPweQ
         +n6vVJuixChymK13l2tHMfr32/D86Nc3ttF6u7kzfmPL47tzB5mV8dVM9UiuI/xGJClw
         FfCmqqbrn1B8dEUi0kvSETTFsSxx9bkvVCW4XPLaxg46oUUrfj8/J5IpAv4qO4r7Jgk6
         uITIFUig8ODcmCi6OsBFclEqJG+VbYswpSN1cTgTW7NUZS3uspD2bfCDDiaNDE1i/Gxh
         O+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661172; x=1761265972;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33cozUgZY2qVcRUHL7b8tITs99/x6FMYwOKO1Eer8GQ=;
        b=whdsEpUkxAZS5rJOidxcgVGeB8rrKEgp+DuqwAYbhL6t/JA4tABgd9qoMAZaQoLLI8
         74ItYsP+p4Q0IMW3G0kIe9cdkR+bHraw4PB/U5G3Rx3X9VGDFz5Vboe5v9W47JTgz3ld
         DwAYeBqROTKKu7as165vazgNeMtxW8ZMLF+K4Vxi1RIx+V3M7l5u6vGsXf9EWWVpYdUP
         UbIBmzmC6Sbmvj170ithKK2OjHiOSfQDVhQwkgR4HNKDZ7O0Jw1hf3G9SePT4bLQEuxJ
         ey4mnnS9LX2ptvphxewPM4mcfje47AbS3r5JbRDyi2E1kBF+HnRv0K/6SHrBjkgtQ2/z
         K0aA==
X-Gm-Message-State: AOJu0Yy+y84zheSzfH77i26QhL793L0Z7qmBjxpLNfgSgO05C3FYrRod
	ohpMjP+SK6rHpIl2yTlsWFhs4Se+D6nBs/5EVPQDF5tLF58W5mEqli0/zvyCf4NtGKr/deK5jA+
	dS8jmlA==
X-Google-Smtp-Source: AGHT+IHi1bmDhBVE/1dfVFfxtUsGZvUIPpndhcsCAkXUuWnb62NCix+r2iPcIxi5145AtUHJ60DhAmmul/g=
X-Received: from pjut11.prod.google.com ([2002:a17:90a:d50b:b0:33b:beb0:be7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:380f:b0:32e:8931:b59c
 with SMTP id 98e67ed59e1d1-33bcf90c0cdmr1921084a91.27.1760661171886; Thu, 16
 Oct 2025 17:32:51 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:20 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-3-seanjc@google.com>
Subject: [PATCH v3 02/25] KVM: Rename kvm_arch_vcpu_async_ioctl() to kvm_arch_vcpu_unlocked_ioctl()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_173253_427988_EC095FD8 
X-CRM114-Status: GOOD (  14.54  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Rename the "async" ioctl API to "unlocked" so that upcoming usage in x86's
TDX code doesn't result in a massive misnomer.  To avoid having to retry
SEAMCALLs, TDX needs to acquire kvm->lock *and* all vcpu->mutex locks, and
acquiring all of those locks after/inside the current vCPU's mutex is a
non-starter.  However, TDX also needs to acquire the vCPU's mutex and load
the vCPU, i.e. the handling is very much not async to the vCPU.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c       | 4 ++--
 arch/loongarch/kvm/vcpu.c  | 4 ++--
 arch/mips/kvm/mips.c       | 4 ++--
 arch/powerpc/kvm/powerpc.c | 4 ++--
 arch/riscv/kvm/vcpu.c      | 4 ++--
 arch/s390/kvm/kvm-s390.c   | 4 ++--
 arch/x86/kvm/x86.c         | 4 ++--
 include/linux/kvm_host.h   | 4 ++--
 virt/kvm/kvm_main.c        | 6 +++---
 9 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 785aaaee6a5d..e8d654024608 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1828,8 +1828,8 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
 	return r;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
-			       unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	return -ENOIOCTLCMD;
 }
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 30e3b089a596..9a5844e85fd3 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1471,8 +1471,8 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
 	return 0;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	void __user *argp = (void __user *)arg;
 	struct kvm_vcpu *vcpu = filp->private_data;
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index a75587018f44..b0fb92fda4d4 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -895,8 +895,8 @@ static int kvm_vcpu_ioctl_enable_cap(struct kvm_vcpu *vcpu,
 	return r;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
-			       unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	struct kvm_vcpu *vcpu = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 2ba057171ebe..9a89a6d98f97 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -2028,8 +2028,8 @@ int kvm_arch_vcpu_ioctl_set_mpstate(struct kvm_vcpu *vcpu,
 	return -EINVAL;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	struct kvm_vcpu *vcpu = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index bccb919ca615..a4bd6077eecc 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -238,8 +238,8 @@ vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
 	return VM_FAULT_SIGBUS;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	struct kvm_vcpu *vcpu = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 16ba04062854..8c4caa5f2fcd 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -5730,8 +5730,8 @@ static long kvm_s390_vcpu_memsida_op(struct kvm_vcpu *vcpu,
 	return r;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	struct kvm_vcpu *vcpu = filp->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ca5ba2caf314..b85cb213a336 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7240,8 +7240,8 @@ static int kvm_vm_ioctl_set_clock(struct kvm *kvm, void __user *argp)
 	return 0;
 }
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp, unsigned int ioctl,
-			       unsigned long arg)
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp, unsigned int ioctl,
+				  unsigned long arg)
 {
 	return -ENOIOCTLCMD;
 }
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7186b2ae4b57..d93f75b05ae2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1557,6 +1557,8 @@ long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg);
 long kvm_arch_vcpu_ioctl(struct file *filp,
 			 unsigned int ioctl, unsigned long arg);
+long kvm_arch_vcpu_unlocked_ioctl(struct file *filp,
+				  unsigned int ioctl, unsigned long arg);
 vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf);
 
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext);
@@ -2437,8 +2439,6 @@ static inline bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 }
 #endif /* CONFIG_HAVE_KVM_NO_POLL */
 
-long kvm_arch_vcpu_async_ioctl(struct file *filp,
-			       unsigned int ioctl, unsigned long arg);
 void kvm_arch_guest_memory_reclaimed(struct kvm *kvm);
 
 #ifdef CONFIG_HAVE_KVM_VCPU_RUN_PID_CHANGE
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b7a0ae2a7b20..b7db1d5f71a8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4434,10 +4434,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		return r;
 
 	/*
-	 * Some architectures have vcpu ioctls that are asynchronous to vcpu
-	 * execution; mutex_lock() would break them.
+	 * Let arch code handle select vCPU ioctls without holding vcpu->mutex,
+	 * e.g. to support ioctls that can run asynchronous to vCPU execution.
 	 */
-	r = kvm_arch_vcpu_async_ioctl(filp, ioctl, arg);
+	r = kvm_arch_vcpu_unlocked_ioctl(filp, ioctl, arg);
 	if (r != -ENOIOCTLCMD)
 		return r;
 
-- 
2.51.0.858.gf9c4a03a3a-goog


