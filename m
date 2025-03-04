Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E41C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 13:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOQyJ57ni6L+J8E7B8owB1YjEi2kSEAuov44m6pse38=; b=mfvA66ur0r+65kyfVV0LUf4c0O
	vCKErHLyiTFu9kDrSRCDrV3D0menVW2poUVZXTrKht2FMIpdXkm/JOSe/Qq587SzF7H6AZmK6d8k+
	X7+M4hLfskSIRdIKWvUwVaJEYqPTNpBa8kN4FMi089LoxbWGY0qn2jr6GPbjXCBM3PjqBOOhGFODY
	wU8Zhci6ZltLWx+HQot7T9c/zRnVUc/0WwepXKKNXCGwEKE/Uhj8Wqm4dBD8cV3pgKf6YjGg3oz07
	VUcdDDreXrUpQ3Fkq4o117NfwJ3NTSuEP4rlT/iVRoyiJrU2dRH39PmqeMWl3dsb+bUo/z7iMZqsn
	8t2DAk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSf5-00000004qN8-0nQg;
	Tue, 04 Mar 2025 13:50:19 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSYx-00000004p3t-3yuP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 13:44:01 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-390e8df7ab6so2056821f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 05:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741095837; x=1741700637; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nOQyJ57ni6L+J8E7B8owB1YjEi2kSEAuov44m6pse38=;
        b=iFw6qx7fgts2RVKOE+2LtOddteL2hdkuTUyloy9sryBcpcnpgBlDXT21mq4r1Z+CIK
         WDF3DaKKbcWomUQ/WOD1NwWIzAJULAlojcfSfH7uhLvl4UlTjruffnLwCEZ0ONWzvsf9
         OVDLndce0DClNrbnJ4azB6dxiSUgu5XrXOjLPKStdGZW1eZBfxV0E5moamE5n9pzLzLd
         aLtAgHEIjD/ZQlTVphCbd/bN7SAm0jLoErXNA4D4dtN3RY7H+FUzm4VhDNw93dxbHgUy
         urWXhizuohJb5qdy09ElMheVaLusqbLgseRQoQ7AsllD6dwUbibZvfS2IdwALMwkEHuU
         Onsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741095837; x=1741700637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nOQyJ57ni6L+J8E7B8owB1YjEi2kSEAuov44m6pse38=;
        b=jPtbPrGJNaQ+rwPX8cWpJxRdOY5fEt9pRzQyM8R7wuhbZ/siWL0G4yddQNRpRohIhb
         KeE4V//cl1LhbPjlEZams2gSiuSh6khWn9GMsL04ls9F6mTsGIFbICNizU1GB/4ahLqe
         34PkPBQgNAgVONgHj8yl/C3oiuMEizJdLnoXp4obkV451k1aw8Q0cwDn64ylEUvXFuUe
         XRbX4RjzjFR6s+Q4DqWSPtuySrDyaMpAYjmPukBUk/0LuD477URu4rkgRak4osOTNl4S
         llmprFMZ03c5WobcPssUouz1nIgnkXW4T3j56tIuBuuT2M5eJGnGAf3TiTTSSyBYbSpH
         Rmjw==
X-Forwarded-Encrypted: i=1; AJvYcCUyC7hISLJrzXxzYC/JJOCdT3Y7j5Q2acgMckr04JCwFvKrI4d0L0KrRihqxV4LCJSIaBqeTW2cKCJ6eGNffVXi@lists.infradead.org
X-Gm-Message-State: AOJu0YwcWaJFvRg6kmNfmeCOUvXmINwuVWdEkRCSbqnkz38MiLS6HTdm
	1PtDuxSVnF4VIBFn2IqD6MOsIECSdDpsuuVtX2x/dHoAX88XeNqm9xAMac91gFGnLgLoC/O1sQ/
	J7ELNebNqXU5MbfILuQ==
X-Google-Smtp-Source: AGHT+IEFMhEaRI/rg8Se9LHpsnXPQyKb7X7zdX+0i//MGRw5LE5hwf7vaICZu9T6cB0TCPM/wkm9G80CRMo3IsJ2
X-Received: from wmbbe7.prod.google.com ([2002:a05:600c:1e87:b0:43b:c6a4:89a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:418a:b0:38f:32a7:b6f3 with SMTP id ffacd0b85a97d-390eca41867mr10968930f8f.40.1741095837446;
 Tue, 04 Mar 2025 05:43:57 -0800 (PST)
Date: Tue,  4 Mar 2025 13:43:46 +0000
In-Reply-To: <20250304134347.369854-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250304134347.369854-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250304134347.369854-4-vdonnefort@google.com>
Subject: [PATCH v2 3/3] KVM: arm64: Count pKVM stage-2 usage in secondary
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
X-CRM114-CacheID: sfid-20250304_054359_985706_F1CFC2BD 
X-CRM114-Status: GOOD (  13.00  )
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
secondary pagetable stats, similarly to what the VHE mode does.

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
index 68d99baa76c2..85d739fbddb8 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1088,12 +1088,20 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 
 static void hyp_mc_free_fn(void *addr, void *flags)
 {
+	if ((unsigned long)flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
+		kvm_account_pgtable_pages(addr, -1);
+
 	free_page((unsigned long)addr);
 }
 
 static void *hyp_mc_alloc_fn(void *flags)
 {
-	return (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+	void *addr = (void *)__get_free_page(GFP_KERNEL_ACCOUNT);
+
+	if (addr && (unsigned long)flags & HYP_MEMCACHE_ACCOUNT_STAGE2)
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
2.48.1.711.g2feabab25a-goog


