Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03851CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=34bWVVpcfIFV1+aBsQNWlTAT8wFaE3/yxrNCs42Ms9c=; b=iiAtkKYAenN3z1M93bazzPYA2P
	22XzQeCbjQy4Wabh+B0161qhbU0QtKKZsESr+fsyTePnqpgx+dkDBDprgTvcchXMtvHNM9uhS4Iwo
	XzN2hutHvhYJG3ZuWjv2Jgs+D4vuyEmG0XMdMpQ+aDw1CyFca2L8N2Xy5tbLsWTk5SjdtkVgNBbOV
	iFximpsmB+4Hv4hl3vvLOCLXmD9nKDCVb6rHD1MdTdVvNpfwql56V2FWJ4y2Rgr87pMewzbEwUdd7
	Uc0sm5OxeN3+FNRLGj7fcKRpNIepETpD4NCPp5/RHJAD1oTzdD2IEwSzpod5HiUIoXzrxpFco/xtd
	vcc/firQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuKC-00000005oWM-3dfl;
	Tue, 09 Sep 2025 09:07:40 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsiY-000000058tv-1ONm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 07:24:43 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3e753e78902so20944f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757402680; x=1758007480; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=34bWVVpcfIFV1+aBsQNWlTAT8wFaE3/yxrNCs42Ms9c=;
        b=G8lOsdf9/JDVFB/KDan+PTKO1tbzheeL4zp2hJlT5OIEVz4MQXX8xAw46zygEEaiQX
         6Jbr8BPpoLuAiSMFh/2tM1SWyOYB7wzHS0T7Su3tLNYFtAJ+1kWE60JvU//WHOW1Til/
         K1cBhdjvXW9tXypTUzRT8IkjJpdzpT5dN7z1bsp1aEkfr/M9S0ug3PTfhM/DPJOXuI5C
         sF4OVDtqTmkDT1MhJcatYADrwz8KTHKDFOmtGWx55cPi0nUzVlexZFyQU0pJ6BoJUs1L
         /l33LI2EuOMU0mrO/Ai3tnWpviKz/FOXpv4lNPPPQZQJLItqIdZ5KUn5PXtKJZpSlg7Z
         qsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757402680; x=1758007480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34bWVVpcfIFV1+aBsQNWlTAT8wFaE3/yxrNCs42Ms9c=;
        b=IOjuywyxBW2pEW5xHzJfFoa10NAIUQoU+b9fQfbX79POMAkvkVu/VZ59m3AiWGWied
         s/3ftcqZS1BLc1iJDrikrHPVN4Xh9R3fuYr+3yFYC2lhzaGHykTmPU6Ouch6PvdVvFFi
         nsB1hp4UP/xK+CikNm4RY2Y0pZURN9YtaWavzcHyLW9REqvAh9xvfKMCeoEWN8MQCDrb
         FezsGJx+HDgWqEwncWLGj9CNwSU7CLXUU2a7wQ7CEInBlBKUQBLemzKJio4Y177GQm2t
         cgEc6nvLjgnTKsw8Z0u+XPfH/AHTRaz5qN1HTGthyokinBQmj+SHoXTZboNEnLkpmS8p
         mmsw==
X-Forwarded-Encrypted: i=1; AJvYcCU+bmSg8zp2CGW1Tz0nSWu/t1BdyvMxmaFrHcyssvtfzH91WoN/Z2vwZ0QxX4UnOascQBjzPyggvrNaTq/YGkbh@lists.infradead.org
X-Gm-Message-State: AOJu0YxyN68pRWz4ujvK/8ZpXLzVe0ShRg9YgF+9dpib+w9cQQdYX/wi
	givxnUIT5BUbMZa0vE5I66lVzg7AZs71YxdC6Htlof5Jcp/HXdOaCdFEkniT6f6L098724j6n/T
	59Q==
X-Google-Smtp-Source: AGHT+IGOjKfjXWLT99zqYiYfu8ZoWSI57jP1W8PT7WvNSC/Kd2kRGmsJ5zeutnwGBNoebSP8RPCwvycUkQ==
X-Received: from wmbev15.prod.google.com ([2002:a05:600c:800f:b0:45b:4777:8063])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1884:b0:3e7:4719:a054
 with SMTP id ffacd0b85a97d-3e74719a711mr5301655f8f.7.1757402680602; Tue, 09
 Sep 2025 00:24:40 -0700 (PDT)
Date: Tue,  9 Sep 2025 08:24:30 +0100
In-Reply-To: <20250909072437.4110547-1-tabba@google.com>
Mime-Version: 1.0
References: <20250909072437.4110547-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909072437.4110547-4-tabba@google.com>
Subject: [PATCH v4 3/9] KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, 
	qperret@google.com, sebastianene@google.com, keirf@google.com, 
	smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_002442_375425_FE2626B1 
X-CRM114-Status: GOOD (  17.67  )
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

In hypervisor (EL2) code, it is important to distinguish between the
host's 'struct kvm' and a protected VM's 'struct kvm'. Using 'host_kvm'
as variable name in that context makes this distinction clear.

However, in the host kernel code (EL1), there is no such ambiguity. The
code is only ever concerned with the host's own 'struct kvm' instance.
The 'host_' prefix is therefore redundant and adds unnecessary
verbosity.

Simplify the code by renaming the 'host_kvm' parameter to 'kvm' in all
functions within host-side kernel code (EL1). This improves readability
and makes the naming consistent with other host-side kernel code.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/pkvm.c | 46 +++++++++++++++++++++----------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 61827cf6fea4..358168572482 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -85,16 +85,16 @@ void __init kvm_hyp_reserve(void)
 		 hyp_mem_base);
 }
 
-static void __pkvm_destroy_hyp_vm(struct kvm *host_kvm)
+static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
-	if (host_kvm->arch.pkvm.handle) {
+	if (kvm->arch.pkvm.handle) {
 		WARN_ON(kvm_call_hyp_nvhe(__pkvm_teardown_vm,
-					  host_kvm->arch.pkvm.handle));
+					  kvm->arch.pkvm.handle));
 	}
 
-	host_kvm->arch.pkvm.handle = 0;
-	free_hyp_memcache(&host_kvm->arch.pkvm.teardown_mc);
-	free_hyp_memcache(&host_kvm->arch.pkvm.stage2_teardown_mc);
+	kvm->arch.pkvm.handle = 0;
+	free_hyp_memcache(&kvm->arch.pkvm.teardown_mc);
+	free_hyp_memcache(&kvm->arch.pkvm.stage2_teardown_mc);
 }
 
 static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
@@ -129,16 +129,16 @@ static int __pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
  *
  * Return 0 on success, negative error code on failure.
  */
-static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
+static int __pkvm_create_hyp_vm(struct kvm *kvm)
 {
 	size_t pgd_sz, hyp_vm_sz;
 	void *pgd, *hyp_vm;
 	int ret;
 
-	if (host_kvm->created_vcpus < 1)
+	if (kvm->created_vcpus < 1)
 		return -EINVAL;
 
-	pgd_sz = kvm_pgtable_stage2_pgd_size(host_kvm->arch.mmu.vtcr);
+	pgd_sz = kvm_pgtable_stage2_pgd_size(kvm->arch.mmu.vtcr);
 
 	/*
 	 * The PGD pages will be reclaimed using a hyp_memcache which implies
@@ -152,7 +152,7 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	/* Allocate memory to donate to hyp for vm and vcpu pointers. */
 	hyp_vm_sz = PAGE_ALIGN(size_add(PKVM_HYP_VM_SIZE,
 					size_mul(sizeof(void *),
-						 host_kvm->created_vcpus)));
+						 kvm->created_vcpus)));
 	hyp_vm = alloc_pages_exact(hyp_vm_sz, GFP_KERNEL_ACCOUNT);
 	if (!hyp_vm) {
 		ret = -ENOMEM;
@@ -160,12 +160,12 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	}
 
 	/* Donate the VM memory to hyp and let hyp initialize it. */
-	ret = kvm_call_hyp_nvhe(__pkvm_init_vm, host_kvm, hyp_vm, pgd);
+	ret = kvm_call_hyp_nvhe(__pkvm_init_vm, kvm, hyp_vm, pgd);
 	if (ret < 0)
 		goto free_vm;
 
-	host_kvm->arch.pkvm.handle = ret;
-	host_kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+	kvm->arch.pkvm.handle = ret;
+	kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
 	kvm_account_pgtable_pages(pgd, pgd_sz / PAGE_SIZE);
 
 	return 0;
@@ -176,14 +176,14 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	return ret;
 }
 
-int pkvm_create_hyp_vm(struct kvm *host_kvm)
+int pkvm_create_hyp_vm(struct kvm *kvm)
 {
 	int ret = 0;
 
-	mutex_lock(&host_kvm->arch.config_lock);
-	if (!host_kvm->arch.pkvm.handle)
-		ret = __pkvm_create_hyp_vm(host_kvm);
-	mutex_unlock(&host_kvm->arch.config_lock);
+	mutex_lock(&kvm->arch.config_lock);
+	if (!kvm->arch.pkvm.handle)
+		ret = __pkvm_create_hyp_vm(kvm);
+	mutex_unlock(&kvm->arch.config_lock);
 
 	return ret;
 }
@@ -200,14 +200,14 @@ int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
-void pkvm_destroy_hyp_vm(struct kvm *host_kvm)
+void pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
-	mutex_lock(&host_kvm->arch.config_lock);
-	__pkvm_destroy_hyp_vm(host_kvm);
-	mutex_unlock(&host_kvm->arch.config_lock);
+	mutex_lock(&kvm->arch.config_lock);
+	__pkvm_destroy_hyp_vm(kvm);
+	mutex_unlock(&kvm->arch.config_lock);
 }
 
-int pkvm_init_host_vm(struct kvm *host_kvm)
+int pkvm_init_host_vm(struct kvm *kvm)
 {
 	return 0;
 }
-- 
2.51.0.384.g4c02a37b29-goog


