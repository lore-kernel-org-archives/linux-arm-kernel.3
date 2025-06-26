Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA7FFC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 00:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIDgjwUm8CjgtXg9AIcmlFZZ7eZmoPHxzXcxCBew1V0=; b=qFnX8l2KgZ2PgP0CJvG8gg+zm9
	o3iRQtGo8h9nDQsbbXYa95qJLLoZWZQ/59IITgjW+eP7QU1tGPilcMlnTAjIKRJZNUQuS5G/f+aYQ
	YtNLfDKMq3HUQVLi6pRubxRoMoIAbzvMg7I8et2FHnT4Ia3YXtpCXQapBWW+nQ1bXFbVE3IeFkAyX
	u0jGJM/JFs1Z5U/wE+zGmK2xUqSBlTK4qEdopqqWck+4+JEw0/3Ov8WMZiO542yjI5cZGtiFGOESS
	uBYNHtD7P394hV578CVoddoZQo7EILkbpCzUBfC9eB9ucOw0nirk4Aby18RsE7RjR+5trpnOa5eJk
	u7YtYGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaIr-0000000AKCg-3ZTd;
	Thu, 26 Jun 2025 00:17:21 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaEB-0000000AJhB-2PJf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 00:12:33 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311e98ee3fcso1414993a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 17:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750896750; x=1751501550; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XIDgjwUm8CjgtXg9AIcmlFZZ7eZmoPHxzXcxCBew1V0=;
        b=0o4RljdKXNlx/lD8K1Ui0H13xLWVV3Sc7n7DhMW8XVKuui8RwRATRrbQrvcuDsvGB5
         kfdjXTTuAGKVklfkGU8auZ3JO5keWOS1QZDL2vjuHbpOZ7EC+WDC1emx7BIX0BqB5EXR
         9Fa5/7pe8ClGn4Rdwv7aifwjpsTirzAUvCh6TJ8FjGHaqhXV1HpsrU4ENMpF/m9D+0r6
         CKMpzwMgVUE9Ql7Z2L03MkKXDMN6KpUMrdDVPLFTRBZQue2IKGlQ8xH8RRjxe089mjwF
         50ea+sjqvwXB7T1avrTVBPPRN/jICNYyYagXo3hmXbuWalqgOVqh7IJe8E/GkLfTiIFH
         yTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896750; x=1751501550;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIDgjwUm8CjgtXg9AIcmlFZZ7eZmoPHxzXcxCBew1V0=;
        b=Oq+Iw6AS5AbnC6q0GF5IlQTEHI94ko4XWhSjiDUEg43KZveH/kCGyqYQFcoEj7GqPV
         8V1SxpVbbcSH2EHmc1XuuCpVu2Mw6PquWL6+JtlfKiVWxfsbIxgDm+E692aWKOS2gzzV
         hWQpKELk4xYPG/TzeOCG3/PjEx4quQKeNEKav3QSZyQdIv6LaCWDorgPodqjqqMwmASd
         5JmGhpL33wHpDElYIh/t0VDznWyl1nZ5zhVyP0c9lRwfyI+beCetaISLKavz5XWuFz6f
         HzgAZO06kscpgvndjlkwfHKmMO23V893cj+oucddQ+avP1SlvsKXdnfbX5tolMIrzzH2
         EEgg==
X-Forwarded-Encrypted: i=1; AJvYcCVbnhMSV2WxCFZzk0z2i8AEVUgMzngNN4KNr8ujYF5zHGuL9Z3fOmGSlwEZjYiKUsQAFM5lrk6aNafMQtOZcjex@lists.infradead.org
X-Gm-Message-State: AOJu0Yye+8oP8TBJjZMii8mxkVqy9VnUn6e11xu/ybmnJS6dPW1iJcg7
	kS0TKPyfI0NFmIkg1yRUuNQARAniexKUnYAWk5dPA3PMtn9aiS9uvy9nYKGYv0Bbv56OaC15CQK
	C7N3O7g==
X-Google-Smtp-Source: AGHT+IFxqzI3I7qPfHhdkJFEVHE7dAj1xtEraHFWyog88QsjEjNsPNLon63KPUv4mv/v10Bg3S343op+M7c=
X-Received: from pjvf13.prod.google.com ([2002:a17:90a:da8d:b0:2fe:800f:23a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5345:b0:311:1617:5bc4
 with SMTP id 98e67ed59e1d1-316ed3a99d5mr1851989a91.12.1750896750459; Wed, 25
 Jun 2025 17:12:30 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:12:21 -0700
In-Reply-To: <20250626001225.744268-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250626001225.744268-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626001225.744268-2-seanjc@google.com>
Subject: [PATCH v5 1/5] KVM: x86: Replace growing set of *_in_guest bools with
 a u64
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_171231_623015_ABBF3607 
X-CRM114-Status: GOOD (  12.33  )
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

From: Jim Mattson <jmattson@google.com>

Store each "disabled exit" boolean in a single bit rather than a byte.

No functional change intended.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Jim Mattson <jmattson@google.com>
Link: https://lore.kernel.org/r/20250530185239.2335185-2-jmattson@google.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  5 +----
 arch/x86/kvm/svm/svm.c          |  2 +-
 arch/x86/kvm/vmx/vmx.c          |  2 +-
 arch/x86/kvm/x86.c              |  9 +--------
 arch/x86/kvm/x86.h              | 13 +++++++++----
 5 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index bf26dfb5416d..6fdeeb5870b3 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1407,10 +1407,7 @@ struct kvm_arch {
 
 	gpa_t wall_clock;
 
-	bool mwait_in_guest;
-	bool hlt_in_guest;
-	bool pause_in_guest;
-	bool cstate_in_guest;
+	u64 disabled_exits;
 
 	s64 kvmclock_offset;
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index ab11d1d0ec51..5ad54640314f 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5015,7 +5015,7 @@ static int svm_vm_init(struct kvm *kvm)
 	}
 
 	if (!pause_filter_count || !pause_filter_thresh)
-		kvm->arch.pause_in_guest = true;
+		kvm_disable_exits(kvm, KVM_X86_DISABLE_EXITS_PAUSE);
 
 	if (enable_apicv) {
 		int ret = avic_vm_init(kvm);
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 65949882afa9..702486e7511c 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7519,7 +7519,7 @@ int vmx_vcpu_create(struct kvm_vcpu *vcpu)
 int vmx_vm_init(struct kvm *kvm)
 {
 	if (!ple_gap)
-		kvm->arch.pause_in_guest = true;
+		kvm_disable_exits(kvm, KVM_X86_DISABLE_EXITS_PAUSE);
 
 	if (boot_cpu_has(X86_BUG_L1TF) && enable_ept) {
 		switch (l1tf_mitigation) {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2806f7104295..2d893993262b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6481,14 +6481,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		    (cap->args[0] & ~KVM_X86_DISABLE_EXITS_PAUSE))
 			pr_warn_once(SMT_RSB_MSG);
 
-		if (cap->args[0] & KVM_X86_DISABLE_EXITS_PAUSE)
-			kvm->arch.pause_in_guest = true;
-		if (cap->args[0] & KVM_X86_DISABLE_EXITS_MWAIT)
-			kvm->arch.mwait_in_guest = true;
-		if (cap->args[0] & KVM_X86_DISABLE_EXITS_HLT)
-			kvm->arch.hlt_in_guest = true;
-		if (cap->args[0] & KVM_X86_DISABLE_EXITS_CSTATE)
-			kvm->arch.cstate_in_guest = true;
+		kvm_disable_exits(kvm, cap->args[0]);
 		r = 0;
 disable_exits_unlock:
 		mutex_unlock(&kvm->lock);
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index db4e6a90e83d..31ae58b765f3 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -521,24 +521,29 @@ static inline u64 nsec_to_cycles(struct kvm_vcpu *vcpu, u64 nsec)
 	    __rem;						\
 	 })
 
+static inline void kvm_disable_exits(struct kvm *kvm, u64 mask)
+{
+	kvm->arch.disabled_exits |= mask;
+}
+
 static inline bool kvm_mwait_in_guest(struct kvm *kvm)
 {
-	return kvm->arch.mwait_in_guest;
+	return kvm->arch.disabled_exits & KVM_X86_DISABLE_EXITS_MWAIT;
 }
 
 static inline bool kvm_hlt_in_guest(struct kvm *kvm)
 {
-	return kvm->arch.hlt_in_guest;
+	return kvm->arch.disabled_exits & KVM_X86_DISABLE_EXITS_HLT;
 }
 
 static inline bool kvm_pause_in_guest(struct kvm *kvm)
 {
-	return kvm->arch.pause_in_guest;
+	return kvm->arch.disabled_exits & KVM_X86_DISABLE_EXITS_PAUSE;
 }
 
 static inline bool kvm_cstate_in_guest(struct kvm *kvm)
 {
-	return kvm->arch.cstate_in_guest;
+	return kvm->arch.disabled_exits & KVM_X86_DISABLE_EXITS_CSTATE;
 }
 
 static inline bool kvm_notify_vmexit_enabled(struct kvm *kvm)
-- 
2.50.0.727.gbf7dc18ff4-goog


