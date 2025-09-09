Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029D2CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qx11gj8wugh91DQHrF/zFIF/LGk3OrIBY2Reh4u6c8=; b=SypmcaQebu07J1tfJ9IQWDNOVY
	1caGJFTVSPmpy/O2mCf7txGynp+DAPQT0WVknYL2f9g72jgRi+C4Rlmor4IILUpnxYfD0IOc8Hm21
	8TzZRNQmOmVuxl+DHRt1eF+cIFHLSuBUCfYFncZE5YiRbfyQKHHiOquGc549YLnkfEsp+IHJC5c8X
	5DR6OlnVSmQLrd9Sq7KJKzuClsoGo8OtLnW2JHRBv0eIICQPdShrhb/Oo0t+OrLaZBAT4HfZiHrbA
	QyBVtx7Tjk2A2aA8YgQOmyfwjnWv0t0iqlVnKPI7mUUvUuZvuMzGJWapnjKnWLyWXRz/iTdn+ly8C
	Nzw15stA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuHP-00000005n4P-3yq8;
	Tue, 09 Sep 2025 09:04:47 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsiY-000000058tB-0kKH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:24:43 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3e751508f3aso250378f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402680; x=1758007480; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4qx11gj8wugh91DQHrF/zFIF/LGk3OrIBY2Reh4u6c8=;
        b=lJif92Scd9eby4IgkcQwHLqYkvo3Fw/T4VjrZF8+ksramuwTu3r2wuDpgrqGMuY3o9
         htZhUoZwyyp5RBPmrsNdeUh9/bZmeneWaa5awC/4Fml13AM1rQgM7ZEA6jC2N9LG2mvC
         ZDIphJFVvB+prsn7IAeZI4ygJwK7aI2SiFfdBaPMtH8yXrQa/F9BZe6O2Wf1xHmDe7QF
         LTb5DLABCTcD8oyRtFdaw5TwHURRK2K4Nkx1eMsaEQS7J7m1IJSYbA3hNCmqKCGUVqG0
         Vn1V+HFxwyB6CkVJsHJkXQ9UaqsdX+5Jfo/1Sd0wyEGF5OpOoyOKFGK/i12qPFyqCTYL
         DaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402680; x=1758007480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4qx11gj8wugh91DQHrF/zFIF/LGk3OrIBY2Reh4u6c8=;
        b=PS+TdJQDzEN/bCADQ/nkKZuj/DvulhVE7eMo+9bxahALky2OG0sq4XNg7rtjWI90Na
         fVxEApgZn/RwRmkSptMpA6YVSUoBvbaJJtLRcP2NPmASNwbSv//Q0rC2lQ8BkS23macZ
         COs9SNcKC0Vk4cXAHafg5QKMH0Nyptp6rdqV0kDffvUCJ+jjyh+7i3AXLd0UugWwZUwq
         qrcXEXyXApKVXNvlNj07rjWpp9c0nw28gh25X3mV7cWQhe9Qf8fZmAi9HQAdAOYEy8Ei
         RThbspY8qZRW1/whiwjfS+rNXIfuvzml1mFJ3XvddmR1XZPRPnE+KRmDhQ60VT+NPWZY
         yvtw==
X-Forwarded-Encrypted: i=1; AJvYcCVYG6WSbHsQplK/93wGPqH5UKB5Mf9QW6s0WMVqspLimlptH2l1gMKF4Xy3lzbRu1PFi7BpSFuWwEdnIBAOEVvz@lists.infradead.org
X-Gm-Message-State: AOJu0YzAK+8fhvP6psOQL26hPuPaJYg+a9IHdG+q9x7mKYFfLcJE2j4p
	WmfVjy40zk8llcAfpGoOdxa78Lllra6TRNsIq4IPpFCbMGtEaZCHUiNxD9rBHhYfqIn2K+oW4kk
	zAw==
X-Google-Smtp-Source: AGHT+IHPFTrhjpZ2wM5zdNNqDPRxoK6n1iwyDwhPpVI5CSZEiJBq43M7y3dJyiWMrNeF1p7tcW/REefapg==
X-Received: from wmc24.prod.google.com ([2002:a05:600c:6018:b0:45b:79d1:abcb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:3101:b0:3de:8806:ed08
 with SMTP id ffacd0b85a97d-3e64c87e270mr9061946f8f.61.1757402679776; Tue, 09
 Sep 2025 00:24:39 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:24:29 +0100
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
Mime-Version: 1.0
References: <20250909072437.4110547-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072437.4110547-3-tabba@google.com>
Subject: [PATCH v4 2/9] KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002442_224451_437859FE 
X-CRM114-Status: GOOD (  15.10  )
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
index 2b07f0a27a7d..7ad997dabddb 100644
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
@@ -1441,7 +1441,7 @@ struct kvm *kvm_arch_alloc_vm(void);
 
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
2.51.0.384.g4c02a37b29-goog


