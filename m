Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58655C87FDB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaD4jeVNpWYFjq2A4qFeAKzDOAXMWpA17YYRVKNwrsc=; b=jFeaROovUvMkEiaF5Ld/2F+lE9
	ZliaChDeqpjF6epKEzaU4zU4k3hO6pm0BQS9ZklQ3UCz7eLpd6/BKSUhQ0DE032iJD1NLHF/zHCxC
	Aj9hyydxZMGpy1KuJJrJXJz0E/fu4q6P9m3sQ4HUmxh2vCQ3YY8ykoLv6emM3LnAwZGGA0ykMon84
	kngka5iflwaH0nJNjmZ/Q29onE1IiDYSMvKkU9hIQbsw0lD828cRmBc3ERTbbBeKwgNcBbtmSpyQx
	I+35wLaZzjCgl3HfjXidFbCsxzSTKKP+fBpMsbWB1AAhydY14+G6rFU1jWFxafMpi/dcZbaBePuWX
	Bf/+AChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulQ0Z-00000007NLa-00ia;
	Mon, 11 Aug 2025 10:44:03 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPdH-00000007IoT-0OE3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:20:00 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-456106b7c4aso19535915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754907597; x=1755512397; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yaD4jeVNpWYFjq2A4qFeAKzDOAXMWpA17YYRVKNwrsc=;
        b=FtP8jSxt0DelAMjuqbFNhLELnr9k4GmyIbK2xdSRpZTPcOI/MNMj6tmsf/lTR7hiun
         DVgnxblRKmli5AT6S+N8A0+pR4DaIt5M73HXt+zizo0Cayuoj+JSYO6x0w1Mn2npAU33
         /a+MuBcQsgnqaR2BEATZgKfCrQhaFzztmqjKCZCrFXLjpp8YJ2h/IFwi9SBQbrqkKRq2
         VoMjs74SOI026Jm259QrHY6KPCTrUmZeLaeaOAYfZ/wSMfHqKXzXuvLqCWVhg5SPPvmd
         cSpGO6DkZbkwG5zcf2ETwcPuJOJSGe6E1SwjHWra9xxkH/7I0LdVQIjHN0Tlfy5kQigt
         8BoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907597; x=1755512397;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yaD4jeVNpWYFjq2A4qFeAKzDOAXMWpA17YYRVKNwrsc=;
        b=eEZl8BRaC9auWJghzRZKEExPOfVsiksr4Jy4RbmDqJQqjNShj/ex7HeDdGCOjYsHme
         6VC0vTgB4J1PZPTNnRnIGe1sdlrw/1i/C9JLtb6CndWAvQQ4/nAI4qfhO4BhYWoG4Iu2
         QkW8mNeZLmU4+ZA0vkf9s9toct3YHyPOZpYunSrxDvY8yb9XSuWeIznH+923gcGzxFK1
         QvOARfvQKO0ziB9FpSgcbqAsU0XEfF1b2X5+OW2a+65CUUF65GhoeNzBalaF8b6YKZ2P
         acmdJ0CR4OnMO9pk8etWONeFOGnkVYXfIw+/F+sqIVuFc4s71Ie48aNehb5W5PFVlUxa
         iPHA==
X-Forwarded-Encrypted: i=1; AJvYcCV/lKTCizivwf9ESz0sYWu+b4kvndm2wL5iqZ+rEqnQSM4BGF5cDXWP2O0JNPzUk/x3T9bUkNG9Wexxq1ZhPjez@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0/Ip9zhH7OBzQ+Io32mcfMaJAHQmJFTAODbu3VM/67m4Y5a7U
	dJ/MnfYPfZLPv1zAR91L208AE4BFklGNzfNPyEoTM38D1e+/Fgk3KuWzooyYs16PlBNaIt8mi7j
	8rg==
X-Google-Smtp-Source: AGHT+IFipUgUa7LKvrcYC+2VEEmZ9gCItoCPzDiG6XR8wPDrdCYY2snSght6oq/lyyVF2mg5llIkCBWIog==
X-Received: from wmbes9.prod.google.com ([2002:a05:600c:8109:b0:458:be13:ea6d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4f4c:b0:439:4b23:9e8e
 with SMTP id 5b1f17b1804b1-459f5181aabmr114050575e9.3.1754907597102; Mon, 11
 Aug 2025 03:19:57 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:19:47 +0100
In-Reply-To: <20250811101947.3637632-1-tabba@google.com>
Mime-Version: 1.0
References: <20250811101947.3637632-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250811101947.3637632-9-tabba@google.com>
Subject: [PATCH v2 8/8] KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_031959_217326_52031B56 
X-CRM114-Status: GOOD (  21.43  )
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

When a pKVM guest is active, TLB invalidations triggered by host MMU
notifiers require a valid hypervisor handle. Currently, this handle is
only allocated when the first vCPU is run.

However, the guest's memory is associated with the host MMU much
earlier, during kvm_arch_init_vm(). This creates a window where an MMU
invalidation could occur after the kvm_pgtable pointer checked by the
notifiers is set but before the pKVM handle has been created.

Fix this by reserving the pKVM handle when the host VM is first set up.
Move the call to the __pkvm_reserve_vm hypercall from the first-vCPU-run
path into pkvm_init_host_vm(), which is called during initial VM setup.
This ensures the handle is available before any subsystem can trigger an
MMU notification for the VM.

The VM destruction path is updated to call __pkvm_unreserve_vm for cases
where a VM was reserved but never fully created at the hypervisor,
ensuring the handle is properly released.

This fix leverages the two-stage reservation/initialization hypercall
interface introduced in preceding patches.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/arm.c  | 12 ++++++++----
 arch/arm64/kvm/pkvm.c | 33 +++++++++++++++++++++++----------
 2 files changed, 31 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 888f7c7abf54..7f9ebe38fdd2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -170,10 +170,6 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	if (ret)
 		return ret;
 
-	ret = pkvm_init_host_vm(kvm);
-	if (ret)
-		goto err_unshare_kvm;
-
 	if (!zalloc_cpumask_var(&kvm->arch.supported_cpus, GFP_KERNEL_ACCOUNT)) {
 		ret = -ENOMEM;
 		goto err_unshare_kvm;
@@ -184,6 +180,14 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	if (ret)
 		goto err_free_cpumask;
 
+	/*
+	 * If any failures occur after this is successful, make sure to call
+	 * __pkvm_unreserve_vm to unreserve the VM in the hypervisor.
+	 */
+	ret = pkvm_init_host_vm(kvm);
+	if (ret)
+		goto err_free_cpumask;
+
 	kvm_vgic_early_init(kvm);
 
 	kvm_timer_init_vm(kvm);
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 082bc15f436c..24f0f8a8c943 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -90,6 +90,12 @@ static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 	if (pkvm_hyp_vm_is_created(kvm)) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_vm,
 					  kvm->arch.pkvm.handle));
+	} else if (kvm->arch.pkvm.handle) {
+		/*
+		 * The VM could have been reserved but hyp initialization has
+		 * failed. Make sure to unreserve it.
+		 */
+		kvm_call_hyp_nvhe(__pkvm_unreserve_vm, kvm->arch.pkvm.handle);
 	}
 
 	kvm->arch.pkvm.handle = 0;
@@ -160,25 +166,16 @@ static int __pkvm_create_hyp_vm(struct kvm *kvm)
 		goto free_pgd;
 	}
 
-	/* Reserve the VM in hyp and obtain a hyp handle for the VM. */
-	ret = kvm_call_hyp_nvhe(__pkvm_reserve_vm);
-	if (ret < 0)
-		goto free_vm;
-
-	kvm->arch.pkvm.handle = ret;
-
 	/* Donate the VM memory to hyp and let hyp initialize it. */
 	ret = kvm_call_hyp_nvhe(__pkvm_init_vm, kvm, hyp_vm, pgd);
 	if (ret)
-		goto unreserve_vm;
+		goto free_vm;
 
 	kvm->arch.pkvm.is_created = true;
 	kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
 	return 0;
-unreserve_vm:
-	kvm_call_hyp_nvhe(__pkvm_unreserve_vm, kvm->arch.pkvm.handle);
 free_vm:
 	free_pages_exact(hyp_vm, hyp_vm_sz);
 free_pgd:
@@ -224,6 +221,22 @@ void pkvm_destroy_hyp_vm(struct kvm *kvm)
 
 int pkvm_init_host_vm(struct kvm *kvm)
 {
+	int ret;
+
+	if (pkvm_hyp_vm_is_created(kvm))
+		return -EINVAL;
+
+	/* VM is already reserved, no need to proceed. */
+	if (kvm->arch.pkvm.handle)
+		return 0;
+
+	/* Reserve the VM in hyp and obtain a hyp handle for the VM. */
+	ret = kvm_call_hyp_nvhe(__pkvm_reserve_vm);
+	if (ret < 0)
+		return ret;
+
+	kvm->arch.pkvm.handle = ret;
+
 	return 0;
 }
 
-- 
2.50.1.703.g449372360f-goog


