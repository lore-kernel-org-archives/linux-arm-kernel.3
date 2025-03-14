Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBAFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 11:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82vwVg0CBFLxNk1y97bWD8aRM0sls0IM+3B5nN7emI4=; b=kWu1msA8xTqtsT9NwrsQGJvAiF
	PKawi/ROlKeeKGpN132Jn6iddHTsRwq1m5Pn0XS0SxiTkdIZ27iyhy+FtzUN3Td6sowqxD+ipatzZ
	TZdfgltxSqYYSRkSQh1fnGY44aIMmHyKlndZygGMWTeMXNwKk5L+Hd8h/n9tUZTUdb5YKgcG+5ZK0
	bwIl81YM8bQiReQLidZfyLDpbYugQHGTDlza0++IoTlaOZAHiq8Ut5ZEgWWIDR63/Fbf8F3uKSYj4
	sHLNsSMvQX7GrnvKedkz0nT0fv53zWXtiZeN4TpvDnLIP57xqF0gdxhybU8uP6GipnFkcdRq+Q697
	OwLMkmAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3Bc-0000000DzqU-2oc3;
	Fri, 14 Mar 2025 11:26:44 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt33s-0000000Dydd-0DnD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 11:18:45 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43bd0586b86so15294045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 04:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741951122; x=1742555922; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=82vwVg0CBFLxNk1y97bWD8aRM0sls0IM+3B5nN7emI4=;
        b=RspgiEGXD4hgk6EdknSEKQI16VgnEd8veeoMbH2YQjDRAZis2snzXNP486zaTvYl+V
         Rd+66uUx95IUiY/g/ty7oOh9OwXVyYFa9noOFTfpGO3q/TxNtPEgLnjRgRrSVSw54j9N
         vKHuovDRTSoCoh5zB4noSufVOTjt7emOOBXVt/WcQZ4K8qj0HoGorJIAfxaR/x88f9NG
         T+SPv2eGurMeOclzE20VrTVV6mTPStx+ccBo2NH8vjdG/KaUPayioxyoSqfXfBNrnClq
         GCYqP5KBl5fBuULkQhI+1TATXGmVbD0AInFYP5OnF5Gt0xkvb/PzwdQYK2poawp9uh8a
         3/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951122; x=1742555922;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82vwVg0CBFLxNk1y97bWD8aRM0sls0IM+3B5nN7emI4=;
        b=LHVrBd1xr3cKLbKf+tz52iWo3IckPqkrI2yRxHdazsjr9sDQUxsfgPUl8co5Ub1B5h
         biYDKIu0LOGrsL6nYRoHEXwPJJBCh4d4CMCojcAkP9hmm1lQyntk0MDQxahoUQl1NnKr
         T5cxvuFOG9mvbqP06ApH844xbzcoIQqQFEiY9pXFUumEzZy5NCoD9gAYMXum/Qph33yq
         Hi5x6t1cG1IMGXPdpBu87SMBDZZqONRc0a/eYaa11cejZvjJZhF8XFTMlIH9sJba8ktf
         UwAFH0Hc446+/StrbNh4XMEFaktNxtDellIJIbNFPmyyoiA0qL+9OUi1aMTC7TdGQwG+
         uw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXT5BIHyNckbeDEod718cPwb3lPKAf37uXL3to0K12ojg8DmRxw7hxC9IhUyN7WGbyuIrRr/P81+qz0YfjkJ4V9@lists.infradead.org
X-Gm-Message-State: AOJu0YxuzXeymcLXHkkGoM3p0fREcM+d8KcDiymrxMnqEGB4mL8WE3eu
	MiX9mYvatNrdW4K9CS1LulrTX8wiXJemseZB3TY3jCzoBURwpMi9E6GqkVBN4ywv1lbWJ+Zyng=
	=
X-Google-Smtp-Source: AGHT+IFgy0IRKYEui6JFldvaggSnbklu2RRtgsoq5WhXW+8cqly4bSvIDl1pRV1tvV13ltYjlwnhY564FA==
X-Received: from wmbep16.prod.google.com ([2002:a05:600c:8410:b0:43c:f122:1874])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:e:b0:43c:ec28:d303
 with SMTP id 5b1f17b1804b1-43d1f0a4287mr27609165e9.5.1741951122171; Fri, 14
 Mar 2025 04:18:42 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:18:31 +0000
In-Reply-To: <20250314111832.4137161-1-tabba@google.com>
Mime-Version: 1.0
References: <20250314111832.4137161-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250314111832.4137161-4-tabba@google.com>
Subject: [PATCH v3 3/4] KVM: arm64: Factor out pKVM hyp vcpu creation to
 separate function
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_041844_090149_19541AFE 
X-CRM114-Status: GOOD (  13.88  )
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

Acked-by: Will Deacon <will@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/pkvm.c | 48 ++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 930b677eb9b0..74cf5d87e77b 100644
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
+	host_kvm->arch.pkvm.handle = ret;
 
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
2.49.0.rc1.451.g8f38331e32-goog


