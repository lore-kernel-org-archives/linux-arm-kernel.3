Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CDFC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJwR7NM7qgJyDoaMyIjmipwZ0p8zhJtFWoNDi35Q6UY=; b=C6EJ3lS716eifYWu/LpmzyP9pa
	TiPWYE4RKLC2Zaio5KI++w+CUsOsF4gLgPBdSR0xT2Ttc0GIMN8pc/k+OnhNQ1K80iO+I3ggDwV7I
	/cPULfExG6hQxakGBPykn3fBmJsWnNW0x3qZfBkVXfSQW9FJ+YcaiRpG564mJNBnC7wmMB62CZZ8R
	hsjY83sIZB7j8KpccN/tlm5j9XnWmpA2WtxveeQA6SrRSoTPh7gu33+Z84d08S7Y0U/y+6BGRwC3n
	Fg9onWDWy2eC5+/4OjzGPWyZZ56hgXgXx8WbBedZw8LvIz7jJUr6ED95pXge2FQriUbw9PhbXVfL5
	E1n5URQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSdX-00000004q0v-1C0n;
	Tue, 04 Mar 2025 13:48:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSYv-00000004p3R-1Imp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:43:58 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43bcddbe609so5578575e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 05:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741095835; x=1741700635; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aJwR7NM7qgJyDoaMyIjmipwZ0p8zhJtFWoNDi35Q6UY=;
        b=PkQRy1vQUqygP0c7qDDxBKJeBCq8JltPyyyGBroJDp1tZuilQWd9AviseGmrqIK9OH
         lqDu6BFZmjG4DSRPfjSTS1v0o4/4Y5HB8i9tP8GIDwDNJh+SlqhjGpzGR5ZKL77m+l3x
         NBnaAQEKVCnk2atS5HpiF/00I0AOQtuTOfnXaLNzZWhSGOEmrUvA3w48mFDsQLyVdv3F
         WxrSxCuXyF7h+kRYE7QR/Ny0qlrRPxsn/dYN29NXamR67BYGvqiaC8Cqq3AHC+usYr9L
         Kw82jUBOmyMGxrzq4vM3lE3FPBSSLoP7avBsffQ601UGdj5fy4Wh9GNWiXkp2n9jj1Ke
         aasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741095835; x=1741700635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJwR7NM7qgJyDoaMyIjmipwZ0p8zhJtFWoNDi35Q6UY=;
        b=tkVopfGd8PBcB9ACcDzV4pZUSqkCcb+fLnTRGVEOv3ofXXnzijB+avBVyT4po3XlHj
         jHlpWndm/JZTKnqnQfd1RkozoTH4W3tZ6YW163KXifwD1uINoRe05Wl6rhgYdJ2KA49w
         oLH2ze2uwtLCOmGyeRBSSOwUSqN8GaLNkMiwwPaJvYx3nUuBHYwgg3NIeLmFOv+obEeD
         fITYyn/5UoFA+1xERimJC7WaeW7Bfh6Vrep1Ol2lqDSAgx+j7AGKIHhZ6VqNSI6FkRKH
         bTF/+6CedGZowl35ubOTVWo3dO75HEblZmI2nbS9OhnSqaZwOMasVOj3CZg/41ZWACWB
         1iUw==
X-Forwarded-Encrypted: i=1; AJvYcCX5Odm3q9NPTi+kibmurN6EyE9zzU14JGFN0nX2BHHEZzqVzp8E5eFQawrdwwbOmrcxavxxKUCWaxRSfhN1ILUK@lists.infradead.org
X-Gm-Message-State: AOJu0YyA42fPUj6+gc/0xkwVecyQi6c62h2IX4nr3PkmJuZbi6y17ye4
	GQxo8XpsIQgbx1lKZXl0TdTR6sPRI5/46K89o9Sksqik1PWY63CK06s327iQX3e/znIG9M0yrtS
	OC6U/ANOg6VcemhkTnw==
X-Google-Smtp-Source: AGHT+IHuciObnyTqS58fROBaIT+QoD8DEu2FY6Ra9IE8fIz0oz/Si6xHw1earUtEBbeoC9ZyaeZgeRKxDyWAOb/F
X-Received: from wmbay1.prod.google.com ([2002:a05:600c:1e01:b0:43b:c9a4:5137])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba0:b0:43b:cbe2:ebeb with SMTP id 5b1f17b1804b1-43bcbe2ef02mr21962745e9.24.1741095835455;
 Tue, 04 Mar 2025 05:43:55 -0800 (PST)
Date: Tue,  4 Mar 2025 13:43:45 +0000
In-Reply-To: <20250304134347.369854-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250304134347.369854-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304134347.369854-3-vdonnefort@google.com>
Subject: [PATCH v2 2/3] KVM: arm64: Distinct pKVM teardown memcache for stage-2
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_054357_347148_00484F27 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

In order to account for memory dedicated to the stage-2 page-tables, use
a separated memcache when tearing down the VM.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 12691ae23d4c..ace3969e8106 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -246,6 +246,7 @@ typedef unsigned int pkvm_handle_t;
 struct kvm_protected_vm {
 	pkvm_handle_t handle;
 	struct kvm_hyp_memcache teardown_mc;
+	struct kvm_hyp_memcache stage2_teardown_mc;
 	bool enabled;
 };
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3927fe52a3dd..15f8d5315959 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -678,7 +678,7 @@ teardown_donated_memory(struct kvm_hyp_memcache *mc, void *addr, size_t size)
 
 int __pkvm_teardown_vm(pkvm_handle_t handle)
 {
-	struct kvm_hyp_memcache *mc;
+	struct kvm_hyp_memcache *mc, *stage2_mc;
 	struct pkvm_hyp_vm *hyp_vm;
 	struct kvm *host_kvm;
 	unsigned int idx;
@@ -706,7 +706,8 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 
 	/* Reclaim guest pages (including page-table pages) */
 	mc = &host_kvm->arch.pkvm.teardown_mc;
-	reclaim_guest_pages(hyp_vm, mc);
+	stage2_mc = &host_kvm->arch.pkvm.stage2_teardown_mc;
+	reclaim_guest_pages(hyp_vm, stage2_mc);
 	unpin_host_vcpus(hyp_vm->vcpus, hyp_vm->nr_vcpus);
 
 	/* Push the metadata pages to the teardown memcache */
@@ -717,7 +718,7 @@ int __pkvm_teardown_vm(pkvm_handle_t handle)
 		while (vcpu_mc->nr_pages) {
 			void *addr = pop_hyp_memcache(vcpu_mc, hyp_phys_to_virt);
 
-			push_hyp_memcache(mc, addr, hyp_virt_to_phys);
+			push_hyp_memcache(stage2_mc, addr, hyp_virt_to_phys);
 			unmap_donated_memory_noclear(addr, PAGE_SIZE);
 		}
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 930b677eb9b0..19921ca407c6 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -111,6 +111,7 @@ static void __pkvm_destroy_hyp_vm(struct kvm *host_kvm)
 
 	host_kvm->arch.pkvm.handle = 0;
 	free_hyp_memcache(&host_kvm->arch.pkvm.teardown_mc);
+	free_hyp_memcache(&host_kvm->arch.pkvm.stage2_teardown_mc);
 }
 
 /*
-- 
2.48.1.711.g2feabab25a-goog


