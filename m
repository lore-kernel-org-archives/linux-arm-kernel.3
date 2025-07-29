Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED0FC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WkUQXWRsg/hj2cUnIOQ3CPsmYSv39SsVW0PkY7cjuos=; b=VDpnNYo0d2T7d1WfnOI1J9mx3a
	3QxQHvnjh1OImAHnhj+dRJLv4dJHT0+niFVxPJicKwjRTY8CwofpukWgHj0w5WBx0NAAPAGrAzenh
	5rKybPzQHa7d66sHT65MhFvE22ZvYtVn1v3+VSirow8ZiS5CQGdueLAZdZPotVIlPMkgWcJjoy5lI
	1XbkH7MCFq3eNYKT4WUSHb5URWF5xX8bTDPI7R51k+Jr2tNKs1dvDVJ9c/5erFvRw4gsN5FUi3Wqu
	JQDNB3PHWzMxDBVDrn66te6FjeUusx/w7E0Pjnf1noMIU8tKQJrOn7Vjw4SMzaMKSm5oEk9Ry/Ts6
	PvwSP0yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj57-0000000GgYk-14dl;
	Tue, 29 Jul 2025 12:05:21 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugj0E-0000000Gfuy-2eGZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 12:00:19 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3b785aee904so1349991f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 05:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753790416; x=1754395216; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WkUQXWRsg/hj2cUnIOQ3CPsmYSv39SsVW0PkY7cjuos=;
        b=RT846vt+ixgJGLhHneGwNuUqwWxNK2U2mc2Ic6LbtdWyvjbIrABknWpcRlsas9ALq/
         OQyl2A2MJb1iulvkGyfi/VZPZLMjwG1J/2RcoL3gPhRHn40s9owloqm4mCoMGG5U6e9F
         EecsNBgWaZfo2YbbnWaY1VBEr+F8zCA8w0wFaVItJAIbkRNM5ZSyp+KUWpn35iejTUdQ
         k3Rn8uL4ejxcjxl0jO74c/Hg61zFbQ7MFX4xl4tqN+K66SGckOQfgJdymE57euZuhj2c
         AGaQ9JzmXssxsHP5hmqTWVznVJHz9e7MS3anAQvYSfz0kTXYeJRZFvVglX+gg9NlGohk
         eQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790416; x=1754395216;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WkUQXWRsg/hj2cUnIOQ3CPsmYSv39SsVW0PkY7cjuos=;
        b=o1qSo9pm271g+iQo4Knr4mqz4/sqzUXXTmK5jJclczw0prQ6V1sAktcYd2ZGP89GQ6
         AGuLMj79Si0JeUeB5RH3RkDsr2cs/AsiQaITc/k8VeneT5y9pxTLs19q2Y4C9+VqJrYO
         VYCZm220J16XL1HvrSzZddkWEF149CdG8wQKea2+l3wAQahCC+xRDosQoVHim/TWB4iJ
         nGwWy5QUAr0AbLqbA2OCG1Mdl6Mk9zlI4ggrgfWLHr/4IBH/lzIySNEkDFsIvzBttIBj
         iGl61YbEG3mJQfGmBB5Sp99vb1lhSV+ukMiY0HTVL5V1K80tkBihfS3IxOqbQ50VOQV0
         +E/w==
X-Forwarded-Encrypted: i=1; AJvYcCUKBX/IFod7jjrOe2gOBTk3ACMhGEx+y2LuKEEI70HjsxLhvndL6fBeLRZf5easj7Zey8o2DniSbFgd+ieF7AyO@lists.infradead.org
X-Gm-Message-State: AOJu0YyppttYcZ3fntO9Wo5zmOhBfdpPpth9NqUe+cg3zaeOP7OBs0kH
	WDrXZcuGd8y3xJPuNI5akdvFZUuseJyjHjuXR17QzPDcyqqKfLgI4YzR2afxF0fnA6Hdte7Y+x1
	wqw==
X-Google-Smtp-Source: AGHT+IFK+h6V0iKGcdXFeEkcJRc+B2xhFU7NeOBM4sPEr+OvNorrq6EQfBL3mvvXROKHMZwSy2cgZ9e3Kg==
X-Received: from wmsp14.prod.google.com ([2002:a05:600c:1d8e:b0:456:c7c:3165])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:adf:a115:0:b0:3b7:942c:5450
 with SMTP id ffacd0b85a97d-3b7942c574bmr358163f8f.9.1753790415805; Tue, 29
 Jul 2025 05:00:15 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:00:06 +0100
In-Reply-To: <20250729120014.2799359-1-tabba@google.com>
Mime-Version: 1.0
References: <20250729120014.2799359-1-tabba@google.com>
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729120014.2799359-2-tabba@google.com>
Subject: [PATCH v1 1/8] KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_050018_668962_A3044C8B 
X-CRM114-Status: GOOD (  14.74  )
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

The 'pkvm.enabled' field in struct kvm_protected_vm is confusingly named.
Its purpose is to indicate whether a VM is a pKVM protected VM, not
whether the VM itself is enabled or running.

For a non-protected VM, the VM can be fully active, yet this field would
be false. This ambiguity can lead to incorrect assumptions about the VM's
operational state and makes the code harder to reason about.

Rename the field to 'is_protected' to make it unambiguous that the flag
tracks the protected status of the VM.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 4 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 3e41a880b062..55dc7cd83e40 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -252,7 +252,7 @@ struct kvm_protected_vm {
 	pkvm_handle_t handle;
 	struct kvm_hyp_memcache teardown_mc;
 	struct kvm_hyp_memcache stage2_teardown_mc;
-	bool enabled;
+	bool is_protected;
 };
 
 struct kvm_mpidr_data {
@@ -1522,7 +1522,7 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
 
-#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.enabled)
+#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.is_protected)
 
 #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
 
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 338505cb0171..6198c1d27b5b 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -406,7 +406,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
 	hyp_vm->host_kvm = host_kvm;
 	hyp_vm->kvm.created_vcpus = nr_vcpus;
 	hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
-	hyp_vm->kvm.arch.pkvm.enabled = READ_ONCE(host_kvm->arch.pkvm.enabled);
+	hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
 	hyp_vm->kvm.arch.flags = 0;
 	pkvm_init_features_from_host(hyp_vm, host_kvm);
 }
-- 
2.50.1.487.gc89ff58d15-goog


