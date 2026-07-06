Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B83CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+msO2PWgDlQXt9g2yg/b9J1El+V+LtPBdFDy0rxh0Ng=; b=JKtOCdBAgigIBaRUvMyvCowoK+
	44UQNKVPPSRDRqxAYaiLoLvI1InwdSi6mmBARtmoBZOFT/pEsk9Elblb54AKX2hb0qvRUNK85+J1U
	GplIPOzena0C5wf3Ummsid2qOV5eFR/vflKRhS8dzCyH+UefHyZazmO4JsRjxiH7z3N7QfikY5LGk
	uAVig8pTsUMNRBvUApMzBknkv+7R036OlxIq1HCKHTgDmj4vD/k8cv3Mc7Of2sjc3fdK+kp1hpfyG
	zETtW8A2RI1E++OTsBMGVKGHNBMiG8An47AXuf/VU4/p9IdjRP+/4/etPF6cXFLwD3PzXtS0epiyL
	jM4LE20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWZ-0000000DFbj-2af4;
	Mon, 06 Jul 2026 17:54:31 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWU-0000000DFYO-3Znz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:28 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-69848bef5c7so3031568a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360464; x=1783965264; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+msO2PWgDlQXt9g2yg/b9J1El+V+LtPBdFDy0rxh0Ng=;
        b=qX4gPqUvVIPx9PmLhys3vFQUm9NOOqfVe/2peDgPi12z3G42jx65LBAKwQxWJeXZ96
         kI+ya27cq3LMRNnYU2+lxv2UT/4fqtz6xFmumij/YKwA+5Zan5CVM8KnO8X5mX/3L+xm
         XBDLaESVlCLlLpuzX4CPEiNPq53Jde8Oga/d2VjOW6t+baQiPLJ8OPnw/QJWl/HTlHe9
         c2qEEk2TBlO8SlifQEGRX2KMfuUDAnvk3MEEk7D8rpAoQ2uihbp0ad1hxKIFZf556r/r
         3AbYAOV+GCcvzYC/4VYfez3iKlsor1w38ZB95KQJH5lqXyiEHQ/lMO3vmZzCvQCKP0QU
         mzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360464; x=1783965264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+msO2PWgDlQXt9g2yg/b9J1El+V+LtPBdFDy0rxh0Ng=;
        b=fkfLsCmqxupNKRuyqfMDZ5iqTwx6YfuXV1AA+4HDC+G9KAI1b/fR1enTepchhsQzuM
         OnqamtrdYqu4uRv2q2y6lWx2ywA6Hn9/1e9xgfPtRuXRk+RCrQoUtTbxlGfQj6ancYnM
         MDe09drahatRuwXnW2xnZRzH3dVofkcZ9bVwn1lteWNJrJd21Onkuxai/C4cnrUbmQuH
         uKTeUPyEe6OW9FkLswgAOAhSI3n4nv7yRUOeSD3ObXJEx9TbG1c2jUvfYJwBuCWduP8v
         oQKLnbUfJeOKpoh3sngNUUXegyCppRsfvfqOSfYk7hxBptaPxASaf70ahpd8xuxM3oZr
         nRPQ==
X-Gm-Message-State: AOJu0YwyAM2bAKGWPLJsVuMiIf+IsdgniM443CKXUlkMrYuCXOl6UV+C
	JyOzlzebet8UTzaDND5OGTgoj3C/W+eI4TbfoPcDPc5cXDaMfCPdGodg44LjfO1UUaZXB+1fOzu
	H8CYlIxXIpiwf5MckCBBNWA==
X-Received: from edsr22.prod.google.com ([2002:aa7:da16:0:b0:699:839b:3e61])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:13ca:b0:698:6084:db7f with SMTP id 4fb4d7f45d1cf-69a85a8d0bdmr922862a12.10.1783360464030;
 Mon, 06 Jul 2026 10:54:24 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:53:59 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-3-vdonnefort@google.com>
Subject: [PATCH v2 02/18] KVM: arm64: Add pkvm_remove_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105426_894093_F5E5522E 
X-CRM114-Status: UNSURE (   7.92  )
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

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index d3137c16b632..725bb0fb941d 100644
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
index 773426a68d2d..ec59da1322a7 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -146,6 +146,20 @@ int pkvm_create_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 	return ret;
 }
 
+void pkvm_remove_mappings(void *from, void *to)
+{
+	u64 size;
+
+	to = PTR_ALIGN(to, PAGE_SIZE);
+	from = PTR_ALIGN_DOWN(from, PAGE_SIZE);
+	size = (u64)to - (u64)from;
+	WARN_ON(from > to);
+
+	hyp_spin_lock(&pkvm_pgd_lock);
+	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, (u64)from, size) != size);
+	hyp_spin_unlock(&pkvm_pgd_lock);
+}
+
 int hyp_back_vmemmap(phys_addr_t back)
 {
 	unsigned long i, start, size, end = 0;
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


