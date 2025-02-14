Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FA3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRj6n4bTixP89CvsI9ePKxiWL1iNoVj4jU65kUD8C5I=; b=NXoZIqaVXIJiVbZu/V1SJD5coW
	pU0xUaKYM7weAaZnU4lpz7Q6pFoPNaWffvw6yoRWIIv5N6MO/L0u2TF0i9LGM5MoYnWbwxXkkYPXX
	nxOJaLL5+kfVJk/+ZEcxnikvx9HYKO1g4WthHpkiIUme20fcDk0FmFiKod8ZyxcnbwsiyYgciHcZX
	JvvBTjd3y8J/u88AhPblNIYn78ciFqm0VO0tHwAFJahTp5Z7SdlEu/K7GY+B2SvISuTuWptGHP1FP
	41rdz3d+2Ob0snZT2JUqKN26svs5hJP8b/ifImAPYphNUhayI8Ootiz61NLRPLhQWv7FxLLzYtaH2
	k7jGnsgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixHs-0000000FFHq-0FqE;
	Fri, 14 Feb 2025 15:07:28 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixDd-0000000FEpB-2yz4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 15:03:06 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-438da39bb69so19472425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739545384; x=1740150184; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tRj6n4bTixP89CvsI9ePKxiWL1iNoVj4jU65kUD8C5I=;
        b=I4e2WaZcmjH8qh0CLki5SC/gdzZhJuV85PLFReui5NW1SiiQ1ksQ6d4+GccGCED+Aj
         KQFoH2MftG+YLEWcYpXa/jlB1J9M66vRpf+9tzJda7kHsf205yGY1mq8SY43cT505ylt
         yplSImUiR24UuNz51/1u6Laws4O+8V04vpwZKmq76wxVPB17zUOAYVjoPSAdoFXdIFSK
         BA9YMNYD5XGK/ylbj2cA5UGv4AIy3f3RIV2iCahJQJQV6D9LgaAkFEb214VwP8dK4cvF
         JsOsRH2iXWVknfuEVDb2vbxCouBlu5icI9s69afOyrnehcx934oN6PD7holAvwJ8UR5t
         PT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739545384; x=1740150184;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRj6n4bTixP89CvsI9ePKxiWL1iNoVj4jU65kUD8C5I=;
        b=F9dbt6kZWHLvjU6isnxPtfUb6DCpafo5LVJoDY1ciCf79qbWyWHLFxMIHz3m09yo9t
         FClfjBZxzzjYrFjNdmJ7l3yVOu4H2ElSY9TyJzT9jaCCKT4HgQJGv2EbZA6tWy/eQH/z
         YHKAqYdlu36+f6gwYXhSUrdtMCH+Ntd4X9j5yVO7S6zhK4LLGbeMxEN7K3LLxIwiVr42
         0udWh2NijPhYeG0dDcQIwiJhQAYplopj/5UcNLNOW869ixAIKdF65fYfH8UrQ+c7aqK6
         2uTks9n8s8p0M/MRLYXQVXPURBroKArNfqs2r5zGYckP+HvB5cdM7zbQUtS4HqxmVd7M
         +3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVFVe/aP79Bo26iJep4O61ongqdixi7Z4ZhXh+l4hDy6MblHQ5QaWAoUCgMGs1b8TfEzrx9vrW8fxb2IxUiDBnL@lists.infradead.org
X-Gm-Message-State: AOJu0YwDNGXNu7+zi4lPDSunLpyBfWXxjz6SdK++L476ycNAZxL7dnF5
	pAN1pj93ADGlqgL3Bl0x5P3ygd7CdL9vQMdWBAZxmr8OQFFQDKIkPn5s4PsWqcRq6yMSZxQMGw=
	=
X-Google-Smtp-Source: AGHT+IEglSW2EtsSFVf9fcOIM3+3aUm0nM7Eie3OCOuC5Vt/mpe6XmW6SWFeotwZzhcO5dPAfS5CWFuKYw==
X-Received: from wmbfk5.prod.google.com ([2002:a05:600c:cc5:b0:439:62f3:846e])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5489:b0:439:6dba:adfa
 with SMTP id 5b1f17b1804b1-4396dbaaf94mr4872045e9.19.1739545384118; Fri, 14
 Feb 2025 07:03:04 -0800 (PST)
Date: Fri, 14 Feb 2025 15:02:57 +0000
In-Reply-To: <20250214150258.464798-1-tabba@google.com>
Mime-Version: 1.0
References: <20250214150258.464798-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250214150258.464798-3-tabba@google.com>
Subject: [PATCH v1 2/3] KVM: arm64: Factor out pkvm hyp vcpu creation to
 separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_070305_748198_F2396C68 
X-CRM114-Status: GOOD (  14.09  )
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

Move the code that creates and initializes the hyp view of a vcpu
in pKVM to its own function. This is meant to make the transition
to initializing every vcpu individually clearer.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/pkvm.c | 48 ++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 930b677eb9b0..06665cf221bf 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -113,6 +113,24 @@ static void __pkvm_destroy_hyp_vm(struct kvm *host_kvm)
 	free_hyp_memcache(&host_kvm->arch.pkvm.teardown_mc);
 }
 
+static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
+{
+	size_t hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
+	pkvm_handle_t handle = vcpu->kvm->arch.pkvm.handle;
+	void *hyp_vcpu;
+	int ret;
+
+	hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
+	if (!hyp_vcpu)
+		return -ENOMEM;
+
+	ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, vcpu, hyp_vcpu);
+	if (ret)
+		free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
+
+	return ret;
+}
+
 /*
  * Allocates and donates memory for hypervisor VM structs at EL2.
  *
@@ -125,9 +143,8 @@ static void __pkvm_destroy_hyp_vm(struct kvm *host_kvm)
  */
 static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 {
-	size_t pgd_sz, hyp_vm_sz, hyp_vcpu_sz;
+	size_t pgd_sz, hyp_vm_sz;
 	struct kvm_vcpu *host_vcpu;
-	pkvm_handle_t handle;
 	void *pgd, *hyp_vm;
 	unsigned long idx;
 	int ret;
@@ -161,33 +178,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	if (ret < 0)
 		goto free_vm;
 
-	handle = ret;
+	WRITE_ONCE(host_kvm->arch.pkvm.handle, ret);
 
-	host_kvm->arch.pkvm.handle = handle;
-
-	/* Donate memory for the vcpus at hyp and initialize it. */
-	hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
 	kvm_for_each_vcpu(idx, host_vcpu, host_kvm) {
-		void *hyp_vcpu;
-
-		/* Indexing of the vcpus to be sequential starting at 0. */
-		if (WARN_ON(host_vcpu->vcpu_idx != idx)) {
-			ret = -EINVAL;
-			goto destroy_vm;
-		}
-
-		hyp_vcpu = alloc_pages_exact(hyp_vcpu_sz, GFP_KERNEL_ACCOUNT);
-		if (!hyp_vcpu) {
-			ret = -ENOMEM;
-			goto destroy_vm;
-		}
-
-		ret = kvm_call_hyp_nvhe(__pkvm_init_vcpu, handle, host_vcpu,
-					hyp_vcpu);
-		if (ret) {
-			free_pages_exact(hyp_vcpu, hyp_vcpu_sz);
+		ret = __pkvm_create_hyp_vcpu(host_vcpu);
+		if (ret)
 			goto destroy_vm;
-		}
 	}
 
 	return 0;
-- 
2.48.1.601.g30ceb7b040-goog


