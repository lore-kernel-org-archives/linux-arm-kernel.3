Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF838C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ntuubx8ETsO6TTIOT42EyExqJBNP9f2/d8qVb4BOX4=; b=O0RvSctVbf4hIPVz5S/4O9Mf5A
	Fm1z3nIUbM5wfl3xFzPmPQur3gLiVGwTo1ZvXKPP7gs4W9khChidLBdZW6pqYb/9XAkhEEtinlTdi
	Pw67w6UL/NgP2drFufLEZT3B82lQYaBDs9iVCmjEW+FiGK8qW3joRvPhW7NKHcL16FneoLawKTPhD
	9v0yplKxyIyAlbzktQ3uUu27hLd84e0rSA1JkRJ7RTSM3V6gRiY9ZKDOpeT5y9WK9D99yYJILCmdB
	rypujQtt1yhf+3USMAF8Kg2W8MEYPzb07AulfqfrqE/U4Pm0UiKmpl1BwxHGzljln8nnlIBPAJMMF
	DXXMbx4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqW4V-0000000E4yh-47ny;
	Fri, 07 Mar 2025 11:40:55 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqVyD-0000000E43I-2nt1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 11:34:26 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43bd92233acso15657665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 03:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741347263; x=1741952063; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ntuubx8ETsO6TTIOT42EyExqJBNP9f2/d8qVb4BOX4=;
        b=n5lwLByW+NRqn5OCdvG6aycwgEabUTEfN/Oq4lXXBvEk1sQv4A26sjtWqZVV/rcHdY
         aECXKAkxHKqbmzM5Py65hkWmofA9JunStiVS0DDHquT2BCfQobi+bIrRjl3ubSGssmbP
         gPDelOmFWHtjbOAB4H3fTYTUon/FzRJ/ULMEHgR/Gn6dmJOsm5UVOIGjC5YUGO8V3IDh
         uscj/t5j5j6Ygrblt3jrjOfX6GfWZ6yVW8scMuQq18Hub13F7n/RZgLzpXW2xRLi8HoO
         VWb6vvBTmiQDPrEzbJSm/aMYrxfiViNLPvn2565jk8h78FppWjqegYmk9koCAPsY+CTC
         BGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741347263; x=1741952063;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ntuubx8ETsO6TTIOT42EyExqJBNP9f2/d8qVb4BOX4=;
        b=xKsM6NNlc86anpDdPV+qGZX1m9PxLp5Wbwo8wcV1KZnZEl2b4F17UkWhqkYSLMKkLY
         2zoVZGdwHWoKnbfV8J23uem++9KP9XkzQAeyEXBxHV71ozJTTv6RPEV3jR9AUpj/428Q
         Nfh0q/M1ejnIqHRPiC40atOhD0AZFire1eHOayMJfALdaz8/Q1dlFJLFFYc2e49Ofsof
         9knh8jt6Xr/T3qHUS7w7j5uBQBSyq06p5fseNLd4FNjg0dJjw+QZX2keygeh+d3rztSD
         oNww86Z+vFMphgWraem5uRLA4SbCYHSK7DnvFl84lYIF35rBXD//JkUB+XvaBOdmtgyK
         lMQw==
X-Forwarded-Encrypted: i=1; AJvYcCWgkSyq1YuK5fD6UnT+itVyV4939v86BUv3TYjKFnR6H4x3ujUBJCUJYkpicCE5iJRxCZNJppHchoGqUBncZOJl@lists.infradead.org
X-Gm-Message-State: AOJu0YyppKXI01eYkat58g9PEsT/8Zaab6Nf/B7jZAVScEGocjESBXb+
	GlAacfD2e66HMakmwAOC6q+TQn8Y9dxhMCjjk//Xnxn+dD0JuAYfhtVJnnpbFJdBKZAUacxjyHo
	HOlKSZUuEdni9+WV7vw==
X-Google-Smtp-Source: AGHT+IHklc9pmH21U3YbDQ5Gwc1RGIuSlYKt8XLy0tqeyn/MaP9krs7wUaI3Q0qrAvYZEPn9BnOr0sZM8eUcQbxr
X-Received: from wmbja12.prod.google.com ([2002:a05:600c:556c:b0:43b:d8f9:568a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:310c:b0:43b:d72d:368 with SMTP id 5b1f17b1804b1-43c5a630260mr27416035e9.2.1741347263644;
 Fri, 07 Mar 2025 03:34:23 -0800 (PST)
Date: Fri,  7 Mar 2025 11:34:11 +0000
In-Reply-To: <20250307113411.469018-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250307113411.469018-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250307113411.469018-4-vdonnefort@google.com>
Subject: [PATCH v3 3/3] KVM: arm64: Count pKVM stage-2 usage in secondary
 pagetable stats
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_033425_707692_841A455C 
X-CRM114-Status: GOOD (  13.64  )
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

Count the pages used by pKVM for the guest stage-2 in memory stats under
secondary pagetable, similarly to what the VHE mode does.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ace3969e8106..51754a354b7a 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -86,6 +86,8 @@ struct kvm_hyp_memcache {
 	phys_addr_t head;
 	unsigned long nr_pages;
 	struct pkvm_mapping *mapping; /* only used from EL1 */
+
+#define	HYP_MEMCACHE_ACCOUNT_STAGE2	BIT(1)
 	unsigned long flags;
 };
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index c01ad4430729..73b44f1200c7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1088,12 +1088,24 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 
 static void hyp_mc_free_fn(void *addr, void *mc)
 {
+	struct kvm_hyp_memcache *memcache = mc;
+
+	if (memcache->flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
+		kvm_account_pgtable_pages(addr, -1);
+
 	free_page((unsigned long)addr);
 }
 
 static void *hyp_mc_alloc_fn(void *mc)
 {
-	return (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	struct kvm_hyp_memcache *memcache = mc;
+	void *addr;
+
+	addr = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	if (addr && memcache->flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
+		kvm_account_pgtable_pages(addr, 1);
+
+	return addr;
 }
 
 void free_hyp_memcache(struct kvm_hyp_memcache *mc)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 19921ca407c6..7e6e3b0518f8 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -165,12 +165,16 @@ static int __pkvm_create_hyp_vm(struct kvm *host_kvm)
 	handle = ret;
 
 	host_kvm->arch.pkvm.handle = handle;
+	host_kvm->arch.pkvm.stage2_teardown_mc.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+	kvm_account_pgtable_pages(pgd, PAGE_ALIGN(pgd_sz) >> PAGE_SHIFT);
 
 	/* Donate memory for the vcpus at hyp and initialize it. */
 	hyp_vcpu_sz = PAGE_ALIGN(PKVM_HYP_VCPU_SIZE);
 	kvm_for_each_vcpu(idx, host_vcpu, host_kvm) {
 		void *hyp_vcpu;
 
+		host_vcpu->arch.pkvm_memcache.flags |= HYP_MEMCACHE_ACCOUNT_STAGE2;
+
 		/* Indexing of the vcpus to be sequential starting at 0. */
 		if (WARN_ON(host_vcpu->vcpu_idx != idx)) {
 			ret = -EINVAL;
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


