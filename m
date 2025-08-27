Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160A3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zEQqwcT97w0z8I5SOWtyA7yrJCXJDofviZgO0hF3uqc=; b=rSCaKq4kKywYXWovdmqJ0NCdmj
	36yHgtQRiT4JBT+kTPwmSgl4SXaYKy6SW8ZOrJL8uSiPrgQ2Sw9btLH5BPEiZ1pPgD17Zi0JhEoJK
	FTntTaRBdGSiao101C7mx4fZ8MoZmxtLaCPN/2CJTDj7wuoTwZv2eClZ0JQ6lvjzr/F+apmcfH7rQ
	1CMtyh1n9y+kuZGy2HogaywFym4mrUpv8WeoFkJZ/nvv/NGVSt3vTVGArEc1/IVaRjn59mpnc1qvl
	I4RNniI4a395n92hkYraCuSSIsp6Sa55Izd+D3jF1S7nVtZC2AxrGGztwN53MjxDHDeSgPDJHnDQ8
	Aor160Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE1P-0000000FCI1-3QX0;
	Wed, 27 Aug 2025 11:08:55 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDG0-0000000F2ZK-2HkI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:19:57 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-45a1b0cc989so47662015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756289994; x=1756894794; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zEQqwcT97w0z8I5SOWtyA7yrJCXJDofviZgO0hF3uqc=;
        b=W/bWyeWm2Qt61QApw+SItn19V097x84kV6e2kCqM+NdLlFZmlZj2SaGD3HoSx/OPXQ
         unI1zqLKUSx8skCl0zvc/xj80IJNmGZE0kQasY001OM//S7Pzi2V7erPShBcpDnnN1x6
         ngI/0Ta/dZaZCTSqLUvA9l62vHOU9vDTCU3YMjhX+IsYMh0yA75vXVqQeaA4JhnVLJA/
         Q62T+HaO78xa/aU8NM9m2S/pp+14YxESmziOU2RibLE+Jl1/krTRiiOFtXZ2JBpbHcpM
         vOF7Xkw9hzil/WSFEze4JlNFfbv4nW0E0ccHzFV4A4cO5QgZl8i9t6oYqhK06MYckNRI
         KNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289994; x=1756894794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zEQqwcT97w0z8I5SOWtyA7yrJCXJDofviZgO0hF3uqc=;
        b=iR+j3gaSPvPlcxxTd5groXms8/USdznwPyZP74iZF/8XDntbjVHXdxYABLSgHa0mgf
         gW6zKFHdwObOEEUch1GIxniXPgRFNZQ1ve/qDwhmahn7HBlEoNnuNRzo5HkiKXF5KdHm
         hwf73Goxke8GB+gas37nfnUC5YQwsLYtNqqlS1QjZVAtYwO9L4hkgRZ4wHrP6geYiSTc
         fx4o3ASN2t9wwLVXfAjB+5pEb3Kiq8GQenvvnkIVdSff/gsiLTBpGsQZI6CZruFlg02e
         QB9WTMEGVz/+BtHrfcz9E+YrXjBkFkIqQlw78nLbCLePywI29lmNWpD/waNjX4/ELF1O
         6hXg==
X-Forwarded-Encrypted: i=1; AJvYcCWRCIdfdALCaaQ+9rxoW1qRWbdFyiU8023LdSVmvygFTBLO6MQjPORn5IBPIZ8z6mq0CdQouwV+b0HEcPO5O/Tg@lists.infradead.org
X-Gm-Message-State: AOJu0YzQFsXlD9mGDUV9Wi1uB3GCQA9T5wQJS/+UQyOJq+qBcaKFPqSO
	2p2tp1Ue4039B4WzJ2eS3Y3kUfdUVfsE8FQRxnHo24pCZ5DDuas2gdXj+8diX7LvG3gMMi+Zq7j
	JsQ==
X-Google-Smtp-Source: AGHT+IEiDh/fn7CkNKdOfyZg3Aa0XfGGtFGJ1J2wMvbUhdBD/7OWpd1B72/rLsUyXcwASIaZmkTDklZqfg==
X-Received: from wmtg2.prod.google.com ([2002:a05:600c:8b52:b0:45b:6360:643f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:444f:b0:458:a847:671e
 with SMTP id 5b1f17b1804b1-45b517d402cmr167116105e9.23.1756289994396; Wed, 27
 Aug 2025 03:19:54 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:43 +0100
In-Reply-To: <20250827101949.4089456-1-tabba@google.com>
Mime-Version: 1.0
References: <20250827101949.4089456-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250827101949.4089456-4-tabba@google.com>
Subject: [PATCH v3 3/9] KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031956_584220_2648C58F 
X-CRM114-Status: GOOD (  17.35  )
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
index fcd70bfe44fb..7aaeb66e3f39 100644
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
2.51.0.261.g7ce5a0a67e-goog


