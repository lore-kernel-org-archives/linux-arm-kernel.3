Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EC4C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdHlnZ98+ZVsmpjhh1EatY5FQnyPvSy7oQ52FgoL3AU=; b=SvEuE1+pekJB0XA2DLSmbRao3n
	W0jB4BwQqN2TlgYXQnfIov6KWz5DmevUPhe4yCGQa+AQ62ItX1OR4p23qYlge1wTW+ZE/pJDhcjm/
	FXB7teC5kvbrj79YTkRmFkL73JFoRs1ZZZpnLoTQsIXWrVjqH6DZ4Rrifw4u7vAAcUoyvhpvbH2MT
	J7Nuw/7ljOqF4F68XKQ1wmt7y2EUpInzNUxfpjO7v/Byt0sp6lRQA+ABnGoJ6eIE92ncCqTMiXGzT
	dtaIcNR33jUdDXmEvlbsXDYj8oITTuFGfXAzThIfH1BBTG5R9JLmcM0zGCi95JhqkGB71OvgCToy0
	BR/4URFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqH9-0000000Hayg-2GjD;
	Tue, 29 Jul 2025 19:46:15 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugq5B-0000000HYwS-1N7d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 19:33:54 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31f2a98d91eso142943a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 12:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753817632; x=1754422432; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdHlnZ98+ZVsmpjhh1EatY5FQnyPvSy7oQ52FgoL3AU=;
        b=UKy05YcInxbvkwMlpFBXu5qAD9KG0aAnwVlHmPyUKMdXFfgNFgYccmI2CQS4LkE0KH
         /F+QnSfQ8+xynN6+J4tYuN+rv7QL1cPbOBilpFQV1diSr8ecR1Y4TieCRxE+FWDdKtGB
         N8yDtaT03lTYvYUHo9Rxts4XOTvvA4nnJawLkaQu4bAv5HuFMYIgf6Buq+mM+Cy6XdE+
         RfttYL3fxeWFN1SQORMn+5iMnhGDROzao3Lv/EIuIoWfOWMopQ2vTDNOYUJXzSuJ3uXW
         S2dWasp+oFDDXn4yKl9ssGudC808q5eqZHkWOEzGS32RVwn6ec7KMWbP1twof9hdyw1Y
         5ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753817632; x=1754422432;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZdHlnZ98+ZVsmpjhh1EatY5FQnyPvSy7oQ52FgoL3AU=;
        b=EvBVHPbU/AImssxpiVYWcyzYdWE43QuDhIPhKniBB6FA7aIIcgFjfU5EvaaidIxh5f
         ItIPKmpG8kyMvRXPAiiBUCN26LL6IAKPgvMVFTam/YNsWymv2EeVUBNLgriOw8IkoMci
         Lp5C2K0nekpsoom5rpe610qk9fZJYPzDTFlGJ7Pd0zwksfxlwp86B5zpG49biBI4scZ5
         Xdt+q9TLLynVZwCOCe0FGxcs9UJSIQtEshKLk/6AL/X/+SX+3KA5KdI7UsMxn82xP1VH
         PtrKUGSq80Ix7pGVxqeG2Xg+bxmUaQSLbKDQS3OB/0HP/LbujA6mKot+HlZ3zc6/fdcj
         sLqQ==
X-Gm-Message-State: AOJu0YxpRqX3Jn3iNN0vL+WWYCtiZBtyR2jC30V86oAWVFFfNtoAVAr3
	5QXQcVec47ftYQYSjzJ6Je+7CnIRTMvMvbaiIjO3Nlwf/wJwcGMVh9r2rmZu9J2zn2nTS2DF1Ng
	22ffMMQ==
X-Google-Smtp-Source: AGHT+IFFe8P3g6K0zh0qtvZDIKe8VSkXT7Rqbzi2+TCDvK005OkWz+Mz8UVq7jUspvUvHpMWKrpsZ+VbdgQ=
X-Received: from pjbqc14.prod.google.com ([2002:a17:90b:288e:b0:31c:32f8:3f88])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c2:b0:313:b1a:3939
 with SMTP id 98e67ed59e1d1-31f5ddcd3c6mr813328a91.15.1753817631999; Tue, 29
 Jul 2025 12:33:51 -0700 (PDT)
Date: Tue, 29 Jul 2025 12:33:38 -0700
In-Reply-To: <20250729193341.621487-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729193341.621487-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729193341.621487-4-seanjc@google.com>
Subject: [PATCH 3/5] KVM: Reject ioctls only if the VM is bugged, not simply
 marked dead
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Nikolay Borisov <nik.borisov@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_123353_364493_D47725F0 
X-CRM114-Status: GOOD (  16.62  )
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

Relax the protection against interacting with a buggy KVM to only reject
ioctls if the VM is bugged, i.e. allow userspace to invoke ioctls if KVM
deliberately terminated the VM.  Drop kvm.vm_dead as there are no longer
any readers, and KVM shouldn't rely on vm_dead for functional correctness.
The only functional guarantees provided by kvm_vm_dead() come by way of
KVM_REQ_VM_DEAD, which ensures that vCPU won't re-enter the guest.

Practically speaking, this only affects x86, which uses kvm_vm_dead() to
prevent running a VM whose resources have been partially freed or has run
one or more of its vCPUs into an architecturally defined state.  In these
cases, there is no (known) danger to KVM, the goal is purely to prevent
entering the guest.

As evidenced by commit ecf371f8b02d ("KVM: SVM: Reject SEV{-ES} intra host
migration if vCPU creation is in-flight"), the restriction on invoking
ioctls only blocks _new_ ioctls.  I.e. KVM mustn't rely on blocking ioctls
for functional safety (whereas KVM_REQ_VM_DEAD is guaranteed to prevent
vCPUs from entering the guest).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/vgic/vgic-init.c                     |  2 +-
 include/linux/kvm_host.h                            |  2 --
 tools/testing/selftests/kvm/x86/sev_migrate_tests.c |  5 +----
 virt/kvm/kvm_main.c                                 | 10 +++++-----
 4 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index eb1205654ac8..c2033bae73b2 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -612,7 +612,7 @@ int kvm_vgic_map_resources(struct kvm *kvm)
 	mutex_unlock(&kvm->arch.config_lock);
 out_slots:
 	if (ret)
-		kvm_vm_dead(kvm);
+		kvm_vm_bugged(kvm);
 
 	mutex_unlock(&kvm->slots_lock);
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 627054d27222..fa97d71577b5 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -854,7 +854,6 @@ struct kvm {
 	u32 dirty_ring_size;
 	bool dirty_ring_with_bitmap;
 	bool vm_bugged;
-	bool vm_dead;
 
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 	struct notifier_block pm_notifier;
@@ -894,7 +893,6 @@ struct kvm {
 
 static inline void kvm_vm_dead(struct kvm *kvm)
 {
-	kvm->vm_dead = true;
 	kvm_make_all_cpus_request(kvm, KVM_REQ_VM_DEAD);
 }
 
diff --git a/tools/testing/selftests/kvm/x86/sev_migrate_tests.c b/tools/testing/selftests/kvm/x86/sev_migrate_tests.c
index 0a6dfba3905b..0580bee5888e 100644
--- a/tools/testing/selftests/kvm/x86/sev_migrate_tests.c
+++ b/tools/testing/selftests/kvm/x86/sev_migrate_tests.c
@@ -87,10 +87,7 @@ static void test_sev_migrate_from(bool es)
 		sev_migrate_from(dst_vms[i], dst_vms[i - 1]);
 
 	/* Migrate the guest back to the original VM. */
-	ret = __sev_migrate_from(src_vm, dst_vms[NR_MIGRATE_TEST_VMS - 1]);
-	TEST_ASSERT(ret == -1 && errno == EIO,
-		    "VM that was migrated from should be dead. ret %d, errno: %d", ret,
-		    errno);
+	sev_migrate_from(src_vm, dst_vms[NR_MIGRATE_TEST_VMS - 1]);
 
 	kvm_vm_free(src_vm);
 	for (i = 0; i < NR_MIGRATE_TEST_VMS; ++i)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6c07dd423458..f1f69e10a371 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4408,7 +4408,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 	struct kvm_fpu *fpu = NULL;
 	struct kvm_sregs *kvm_sregs = NULL;
 
-	if (vcpu->kvm->mm != current->mm || vcpu->kvm->vm_dead)
+	if (vcpu->kvm->mm != current->mm || vcpu->kvm->vm_bugged)
 		return -EIO;
 
 	if (unlikely(_IOC_TYPE(ioctl) != KVMIO))
@@ -4651,7 +4651,7 @@ static long kvm_vcpu_compat_ioctl(struct file *filp,
 	void __user *argp = compat_ptr(arg);
 	int r;
 
-	if (vcpu->kvm->mm != current->mm || vcpu->kvm->vm_dead)
+	if (vcpu->kvm->mm != current->mm || vcpu->kvm->vm_bugged)
 		return -EIO;
 
 	switch (ioctl) {
@@ -4717,7 +4717,7 @@ static long kvm_device_ioctl(struct file *filp, unsigned int ioctl,
 {
 	struct kvm_device *dev = filp->private_data;
 
-	if (dev->kvm->mm != current->mm || dev->kvm->vm_dead)
+	if (dev->kvm->mm != current->mm || dev->kvm->vm_bugged)
 		return -EIO;
 
 	switch (ioctl) {
@@ -5139,7 +5139,7 @@ static long kvm_vm_ioctl(struct file *filp,
 	void __user *argp = (void __user *)arg;
 	int r;
 
-	if (kvm->mm != current->mm || kvm->vm_dead)
+	if (kvm->mm != current->mm || kvm->vm_bugged)
 		return -EIO;
 	switch (ioctl) {
 	case KVM_CREATE_VCPU:
@@ -5403,7 +5403,7 @@ static long kvm_vm_compat_ioctl(struct file *filp,
 	struct kvm *kvm = filp->private_data;
 	int r;
 
-	if (kvm->mm != current->mm || kvm->vm_dead)
+	if (kvm->mm != current->mm || kvm->vm_bugged)
 		return -EIO;
 
 	r = kvm_arch_vm_compat_ioctl(filp, ioctl, arg);
-- 
2.50.1.552.g942d659e1b-goog


