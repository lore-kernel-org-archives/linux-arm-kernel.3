Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5EBCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=El5T7YDofdY2oxL2jCvDRau4w0+KfiOKmcQ3rCTkH2Q=; b=qXS8yi6uRcQD3+K/2iC426FtWw
	uyMMv/x1UKwQVwbtUp5uGtqpZtMnmztC5lJEcLBzssrubuUJabbZ0vB0D6na6/rJiswaSCWaZt1q5
	i10049rg9w6tagivxt3lSyfmcguh3eLeJIZVTcx603QqF8MBZrHCtNGz+R7FLD1dK7gVyAqXNttLc
	mDiL+RrHtZ3Ow+tC9iPzmD2SaP9lWf70Cxd8y2btvkpSLyWK8PIDzUiX7joreUIpFfwgwlXcQbwnN
	jNxkdhgrEddyCNDiX1P6MmUgffdSSVrwQJ6irmNxxkB26ZbsF+bqYi2MGV4whm3p5MQpOZJKENb2u
	9p5XNbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1M-0000000FCDv-32r0;
	Wed, 27 Aug 2025 11:08:52 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDFy-0000000F2Yt-48JJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:19:56 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45b71eef08eso2668765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756289993; x=1756894793; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=El5T7YDofdY2oxL2jCvDRau4w0+KfiOKmcQ3rCTkH2Q=;
        b=VBRkMuzNRvB+i14rnIhbN+mDrU3GPngx3t3cOS13TRZo34ZWckpILH46LEvY91jEdo
         KTqRXsQx7YIiExuvJltqFQdUNpnP+vI05xUCXmW2zBR0FHp2/PeECbEfkDid2Wlos0eI
         STCzKjruztxgze/O53pcVnHYozSVDuWzl43GZj49NZTzMrBvWshYl68XxE3mQ4EvSRWv
         Qv+B336HYcHMujR6cgEXZ92EyOb28SXHqvDYlSRlConRw6+bbxKBXVIIV7UoDBJgS+i9
         ZucSZ7TdvjIBkT2iSf4ecGRy/4PuQsCPkbs8tHKdmixd8nMZKZqPBXn0ZfDUyyQJgjvp
         T2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289993; x=1756894793;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=El5T7YDofdY2oxL2jCvDRau4w0+KfiOKmcQ3rCTkH2Q=;
        b=xBxIpinqhp047wAXACXRUjY2DjsWjnu8EyZa1F7RPwVHxkjmrk4LykbgweVugeBUCU
         1yqSu9gsOPEz0gVZTkVieqZEXYpG4c2Qy8wH703PQdA3WathO12Z7xZAPdQrLumcf/ya
         GxQywuN1oMagicj3/EzP0xTH5qOPDuwmHTAoa82vhrSQ1IZqhgS0lvTH3sA5IUxiYrjs
         M0MXFtF+EkNsUKF/ENNBkOVjddHmxqE1Li0DBbBPQj6pbyfentGKWkr5NVcDitXI2guz
         x3ZgvIqS5TQg6hnPgmQHNQE1okm8ONj2rmVUVn+2eOce0KvGl5VdTIP+cD3B40CSEtN9
         F+hQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgkoaCzgjEOEXX/p7rcAjXhEZfkS5+7wRTTStzMoCS9HSsxrz+G8obI5wK9kUrTR/a/LmWg19UD48EqJn2QkWM@lists.infradead.org
X-Gm-Message-State: AOJu0YzY8vX27/izocVxP2etOfmgsTPAbCOPgvGt6RdfJBSiSCtAVseD
	ybxiLY5/OFAjNiGVLYBTh8/Ter3M9VIYucgNrK2VxMAlfSYm/NviIrOuGckIPokpOKoB3G4SKNG
	klg==
X-Google-Smtp-Source: AGHT+IF5cUPVetsmWfFly/EvAcRj6qwSYa5775m956gdBFEdvtZGfSwsFmHU9STnt5zjg0/yqs7MsoVc1A==
X-Received: from wmth7.prod.google.com ([2002:a05:600c:8b67:b0:458:b662:fbc4])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1388:b0:459:d451:3364
 with SMTP id 5b1f17b1804b1-45b517d40f2mr185527105e9.24.1756289993104; Wed, 27
 Aug 2025 03:19:53 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:42 +0100
In-Reply-To: <20250827101949.4089456-1-tabba@google.com>
Mime-Version: 1.0
References: <20250827101949.4089456-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250827101949.4089456-3-tabba@google.com>
Subject: [PATCH v3 2/9] KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031955_027889_9C15E949 
X-CRM114-Status: GOOD (  14.87  )
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

The 'pkvm.enabled' field in struct kvm_protected_vm is confusingly
named. Its purpose is to indicate whether a VM is a _protected_ VM under
pKVM, and not whether the VM itself is enabled or running.

For a non-protected VM, the VM can be fully active and running, yet this
field would be false. This ambiguity can lead to incorrect assumptions
about the VM's operational state and makes the code harder to reason
about.

Rename the field to 'is_protected' to make it unambiguous that the flag
tracks the protected status of the VM.

No functional change intended.

Reviewed-by: Kunwu Chan <kunwu.chan@linux.dev>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 4 ++--
 arch/arm64/kvm/hyp/nvhe/pkvm.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 2f2394cce24e..a4289c2f13f5 100644
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
@@ -1548,7 +1548,7 @@ struct kvm *kvm_arch_alloc_vm(void);
 
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
2.51.0.261.g7ce5a0a67e-goog


