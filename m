Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C928BC5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKi6HMFpVp4U2L12wskEYdbDPkWmxhJhyzLsERSTZtQ=; b=xWIwT87SJ+hRWwCpeOSFWoU27n
	2q+J7fFO+Q6/Vsjth7DlzAkSuRdXBeb8lPsXLtmqM0BjDuGM5/Kybbg5HW0PBXSEHKW90OKl14Kbt
	kwz+j17+1beVvKlTO7RbVHCuw82kkCGYkkbeF5btFbMwyKVIiAqc9iRxatC4qvq69lrL37VhfSh7o
	wb1ZIzfp+EXGgVxKuPhwDQmKH3ofD8N2fIWs56T/PGWUry5zlMVnOgXRDa1hJWYEGc9t0Ml85y2sF
	Yyyxa3AVA7gaysNKbzd1wAbSTgfIYArU4lHXpccp0Vp1NOfo/CH/OSBYBYSCBVM7sqOzjBNs23HRk
	luXObSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLX-0000000CjdQ-2XmW;
	Fri, 31 Jul 2026 14:36:23 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoL9-0000000CjR9-155b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:00 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c16711b9473so96594166b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508557; x=1786113357; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKi6HMFpVp4U2L12wskEYdbDPkWmxhJhyzLsERSTZtQ=;
        b=ctXN5KehaJ9pHLDPXQL6FDfj3qSa4e7T+yBG/UNZMjsbcvneUlcO4eynQMO/PV3Znn
         PRU3R3A1fSV6cz3VhdtdAVJBQVHtfhcH3Pgp1Cg49Vyz/GuVv0FTeFCBbZZKZ82Kikvf
         X8SQQURgYL5IXLAXntTABWyUO0qIXqTwpuW20Hd24+BYZwB3OEJ04p5JR1mT473k2izN
         0n/cfT0ytTCLfHq6vv1AlnBmTCNdeCDfJvSstyAsrown9PrmQnmsrgSAaCGRDJVyPGM4
         62W0uNGi8/BxrIVP3YiMllJV7YIytnuAu2AkERa1rAd2hBZOcEoETzkMHcYvmcveTcPS
         Nmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508557; x=1786113357;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKi6HMFpVp4U2L12wskEYdbDPkWmxhJhyzLsERSTZtQ=;
        b=qhaX09getlqnQdz2jZ+PWStGPC/EZTYniL3Z3CZ7yxD2tMnChQSCL+r9lsHahux70S
         mvqMHoj3p/gIAJpskbc+M8pkXs5hxXBfQphPznWuJMxP4FTL5dhLwvXhPXnwUW+uv4QL
         C17RVjoELREwLL2PhtqLBm9HqKsB/G9StcjodIMl1CzCcIPCkTqZ2B78A7DxP90s5U+9
         DOpkjqkL0i+XcCPOC7CHQrlCa9EILQOcjQ+6BdLD6qH94hOg370nijRqxn9c2JAQYphA
         OOLlJpHv+lRCWGZK5+tZYy/4btBpFgulGQ/OBOpIHMrXmaijOr3w34K8cAKt1vwepG8L
         txrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrAhFkFEhHzwfsBX0Acdwj7AwlwAtpz72xGfgr3fvzgqSn+k5i3OE/1Lx9yRPQrJ6BCqzokLuoqUP6DcANZ3KbV@lists.infradead.org
X-Gm-Message-State: AOJu0YxslyRnDslEQqwMOEUMC3Ap+QDQxEIko+2hf3lXUsqEFLmb09vf
	Qw9PUdQOZr0kBTzN3MrNgvcQCWZUENvLWGPBlW9a8tgIMn9SPQzEkJPFpDyi120F7OknPnZsGvE
	tJ5prXU+G5UerFj99gyM/2A==
X-Received: from wmte19.prod.google.com ([2002:a05:600c:8b33:b0:495:59dd:24f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:8993:b0:c1f:5315:7334 with SMTP id a640c23a62f3a-c1fd2581a6bmr132672366b.48.1785508556775;
 Fri, 31 Jul 2026 07:35:56 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:26 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-3-vdonnefort@google.com>
Subject: [PATCH v4 02/17] KVM: arm64: Add pkvm_remove_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073559_310459_DCF653E0 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
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

Add the counterpart to pkvm_create_mappings(), allowing previously
mapped ranges to be removed. This will be useful for the upcoming pKVM
heap allocator to manage its private mappings.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 85f1e3c711d9..00cadd13ee5d 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -25,6 +25,7 @@ int hyp_back_vmemmap(phys_addr_t back);
 int pkvm_cpu_set_vector(enum arm64_hyp_spectre_vector slot);
 int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot);
 int pkvm_create_mappings_locked(void *from, void *to, enum kvm_pgtable_prot prot);
+void pkvm_remove_mappings(void *from, void *to);
 int __pkvm_create_private_mapping(phys_addr_t phys, size_t size,
 				  enum kvm_pgtable_prot prot,
 				  unsigned long *haddr);
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 755630c0d15e..9ab7f613fa36 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -164,6 +164,24 @@ int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 	return ret;
 }
 
+/**
+ * pkvm_remove_mappings - Remove mappings from the hypervisor page-table
+ * @from:	The starting virtual address of the range to remove
+ * @to:		The ending virtual address of the range to remove
+ */
+void pkvm_remove_mappings(void *from, void *to)
+{
+	u64 size;
+
+	WARN_ON(from > to);
+	to = PTR_ALIGN(to, PAGE_SIZE);
+	from = PTR_ALIGN_DOWN(from, PAGE_SIZE);
+	size = (u64)to - (u64)from;
+
+	guard(hyp_spinlock)(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)from, size) != size);
+}
+
 int hyp_back_vmemmap(phys_addr_t back)
 {
 	unsigned long i, start, size, end = 0;
-- 
2.55.0.508.g3f0d502094-goog


