Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D222C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsUJ7ZFybSscOwB+F/7yDFweXn/Ii9vNr67NR9vaee0=; b=DPipbzA3Dbq1fs65RXYkdt0ZTl
	FHJdMmzZq554XJXLIX5BV7i1rB5+Trh8fLUMX/9jbMVs0cKcLVawsLGxEYJSvpeQyZeFiaRYqrW0n
	2d89mtfITY0NmOvPP/qBmer6zY/AsRcHdT3iXb/Kii9XJl09sPORP7vVtS9pgKne5u5bklZjjdiUn
	07UGJtMlpCpT1/rDPtP16kw2rEMlqNJoPDNb1fZ3/wTmdiyae+q24a+Rz/fOSHh0JzWMdb5ZO7Cvv
	6sb+iJNTwjBmRf8DOtZ0l0I/4ie3XiPJ1xf8KHfjgAIZca8PKTAEWdyC6GWaYNWLMWGqRiTdAMgv6
	ATMIHNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtvV-00000000Jdz-0dMz;
	Tue, 29 Jul 2025 23:40:09 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEm-00000000DtK-1Dz6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:56:01 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-313d346dc8dso10559660a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829759; x=1754434559; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=zsUJ7ZFybSscOwB+F/7yDFweXn/Ii9vNr67NR9vaee0=;
        b=Y6G+JtzjiiRtUflKyKUvv4GF2Sc1XUUMvATrqhvI5ZbgBdruM6Pd5n/Y6ASCxPvsvA
         jTek99yefF5XmVkqgpSFgTS37XY5Dj+OhNsxzGN4cyt/orB+pIjmU+lDA6eyzlQwNKqz
         rdhXSk2TplmVqOGV7nntBfSvMU4BVAohtV1zVS+cFSlP7fpwZ1u6OXMf1tf8WocOqzWP
         P7JzxOy5wmSjws/w4sGzIit0qwLzajpIATtZc20TQBnLyO9UrpRCPkvT9g04F8Ir29kq
         h9/dMnC8yLM8plasXMl+VmnpvL7kRZAPUMqhG8fuO4EH2s+r4lSbPePIzGxUjeWWpz0k
         HMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829759; x=1754434559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsUJ7ZFybSscOwB+F/7yDFweXn/Ii9vNr67NR9vaee0=;
        b=WGSM1M4lPk2g3TiyzzO5b6J9WU1zU0cEgUxU9d/TQrSpt5fg5Fiqf6NS1E8BFvFJ8y
         ZQLcQqv+f5SOk8MHW6o/0ysCG/ILzHav8YZf5at+wtAkHQT+YEFWtg0b4TJwJ12pHgSa
         BaydE8ZkArIc22YeACReqoZaVrJdVtbbbw4jCg6Ce7vhoxWfAJ1fh3ROo4GBBlB21RTT
         CbrUmjhl7CNdqOjD54SlZWmfAup4GfoOeVv1woJOlUDtVMRARuubtimmq6FtbQML3P4Q
         1nEzinAmAMlTTvvlQZeXCXxXGqO1bEwShJNdNgeJEJLyPdaj6m9pKsxx2QFOmMx8O45A
         pFBA==
X-Forwarded-Encrypted: i=1; AJvYcCUwpySmmIctfvJj3/QAESd4IERj/ua7MfyxI9Jv+wFAk+egco+zY+au4qRd7zKCGBHOMO91AEfPRv0s3ioxz3Rk@lists.infradead.org
X-Gm-Message-State: AOJu0YyFoyRAxHpgI2mFhudTcd5GgZlNo4E0dOlUjY6fXoZIwxEvK+iJ
	Q1r377Kgw17N1tGVwYKvuHgb157sLPkHRJMyYF1K8zuNvQ3IkVVvJL/fiGBjqhk9+j6xEZuLVhO
	WFG7rfg==
X-Google-Smtp-Source: AGHT+IEUawy8XEGsXpdKDRLNNEWp47UfSJOlj3wwR4Kg29zUXO4HT9ko5KQTWasgzc65ODEqhN4o5kIR7eM=
X-Received: from pjsk9.prod.google.com ([2002:a17:90a:62c9:b0:311:462d:cb60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d604:b0:31f:3029:8854
 with SMTP id 98e67ed59e1d1-31f5de5561dmr1600493a91.27.1753829758931; Tue, 29
 Jul 2025 15:55:58 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:47 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-17-seanjc@google.com>
Subject: [PATCH v17 16/24] KVM: x86/mmu: Handle guest page faults for
 guest_memfd with shared memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155600_331709_1C3444EB 
X-CRM114-Status: GOOD (  12.83  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Ackerley Tng <ackerleytng@google.com>

Update the KVM MMU fault handler to service guest page faults
for memory slots backed by guest_memfd with mmap support. For such
slots, the MMU must always fault in pages directly from guest_memfd,
bypassing the host's userspace_addr.

This ensures that guest_memfd-backed memory is always handled through
the guest_memfd specific faulting path, regardless of whether it's for
private or non-private (shared) use cases.

Additionally, rename kvm_mmu_faultin_pfn_private() to
kvm_mmu_faultin_pfn_gmem(), as this function is now used to fault in
pages from guest_memfd for both private and non-private memory,
accommodating the new use cases.

Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
[sean: drop the helper]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index e83d666f32ad..56c80588efa0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4561,8 +4561,8 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				 r == RET_PF_RETRY, fault->map_writable);
 }
 
-static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
-				       struct kvm_page_fault *fault)
+static int kvm_mmu_faultin_pfn_gmem(struct kvm_vcpu *vcpu,
+				    struct kvm_page_fault *fault)
 {
 	int max_order, r;
 
@@ -4589,8 +4589,8 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 {
 	unsigned int foll = fault->write ? FOLL_WRITE : 0;
 
-	if (fault->is_private)
-		return kvm_mmu_faultin_pfn_private(vcpu, fault);
+	if (fault->is_private || kvm_memslot_is_gmem_only(fault->slot))
+		return kvm_mmu_faultin_pfn_gmem(vcpu, fault);
 
 	foll |= FOLL_NOWAIT;
 	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
-- 
2.50.1.552.g942d659e1b-goog


