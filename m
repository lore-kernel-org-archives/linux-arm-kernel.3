Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C01C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HY+eQdd/nLDovMCXUcK3sJZavohA3et9/rmOJ7S8mw=; b=QeJox1Hf9t8Yy7FgnPdhSDOtax
	mANdxXbXa9lg6UIXVTL3SST9bMR9PEZt/JXce+swQzcGTIzYesSHJ+3E0yeLHDsj34FqxBhnHl7dV
	5jIdsbRT6pC2wkB5rjBN+RvY3hnZHTDnIjs/tOdPQ4sIcomkwK7qHBLpxckGv7BmFpypeHejQfLlP
	IuuFt3WDUsSBKJ2+jefb1iV/E9Bac7G90+ZKNVOMWsKG/Mb8Bc/sjSGxpLagvqokPET+3i8l9eggU
	CQJi/XImgmQtdetFDje52JgDudNsP6P/B41cpbZxiP8+IQlMeEA6Te3Ifzg8PifENX43VtRPGF7Cf
	SYnlFF/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtjL-00000000IKI-18im;
	Tue, 29 Jul 2025 23:27:35 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEb-00000000Doy-3Om4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:50 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31f4d0f60caso700658a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829749; x=1754434549; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4HY+eQdd/nLDovMCXUcK3sJZavohA3et9/rmOJ7S8mw=;
        b=TT4D5gpc1g49n1DiFb+qf6iqnh4nQ+7QexGqZCCEjTM/n+rvxKO9qMT6068wsq4gfn
         0NHKUlgdTZL0Rc1AZLp0xTOetWE4nq8PFHhSYHczbsK/2ixBnCXk4vXlknN7CnOCZSF7
         IlPdh1LCPMO0l96mKnaKOoyHR0QL9M2aoNokptD/xoeMSYobd9XtOD7kJMXnyFcSqFpd
         zUGyuGLlQZH+lKmeTFBcJucr4GyXs433tuoCTbhSioSOgOGdthiWxoFfxg72vZoaTSGM
         3wDZT5JvFWYITb9WuAtW9wM69XhZqLgmhoWdxmk91jpwBcvsLx0fFPWM4pWL7dKMoUtj
         QcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829749; x=1754434549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HY+eQdd/nLDovMCXUcK3sJZavohA3et9/rmOJ7S8mw=;
        b=UvyOyDE3L6j4B1leot1LPC5GxNvDqiJm+hQqbQKuyB6v6DQUWJodDvcR/HQTeZn46e
         MhTnAm52bLxuJtQpry+qyuE8KKk/qFHp09rb5i6vG5QMOBznCh16vVEoZozk7HPlIgAj
         glQWrrcUsRymfgZsA8tqsPEiHNtducBRB+DQrz9vqjt0/3IIfruM8jOQeazR6SXhCYZ/
         b8PAkLNCgSCh4Y+XmNVtrMMdDQwB77M/Vr3OvCR4GfkwlrpNah2cvdxD5spbsOSZyhbU
         JV39HcqVRDFSVSBkt0iwu/36hr4cz1wqjk9EWT89nIV+yq1TnGG9IDlYCbzuNZda2fp6
         Eplw==
X-Forwarded-Encrypted: i=1; AJvYcCVo0t5dPkHKBShtQeF3yjAMQIuZGj4XFuKqE/0sIUlWU4q2Q4077RezCjHG/EjzLGpN8MlC0GqG2C9hxAhoUUD0@lists.infradead.org
X-Gm-Message-State: AOJu0YxO7JjY+Fw0ooSTRZInxtXwNxOeROXh9sskSkH8Zzy64sWcgevR
	lWtT7Ybol7R1zCbYR0/g40U8JF890hq4IdDvsMHS66ZaBliHvS6HaXSNZlRwoW83IjAaOpJrmkw
	KdZlOIA==
X-Google-Smtp-Source: AGHT+IFhotmaClkAB7rg0QKOA9E4cmIDk69xmBeYfpjr1LTJA+UVvMJehEkVmJzu9WDpMq0oubFS0TPkvpU=
X-Received: from pjxx8.prod.google.com ([2002:a17:90b:58c8:b0:31c:4a51:8b75])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:47:b0:31f:42cd:690d
 with SMTP id 98e67ed59e1d1-31f5dd9e0d8mr1649821a91.13.1753829748835; Tue, 29
 Jul 2025 15:55:48 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:42 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-12-seanjc@google.com>
Subject: [PATCH v17 11/24] KVM: guest_memfd: Track guest_memfd mmap support in memslot
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
X-CRM114-CacheID: sfid-20250729_155549_854380_4997A2A5 
X-CRM114-Status: GOOD (  13.21  )
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

From: Fuad Tabba <tabba@google.com>

Add a new internal flag, KVM_MEMSLOT_GMEM_ONLY, to the top half of
memslot->flags (which makes it strictly for KVM's internal use). This
flag tracks when a guest_memfd-backed memory slot supports host
userspace mmap operations, which implies that all memory, not just
private memory for CoCo VMs, is consumed through guest_memfd: "gmem
only".

This optimization avoids repeatedly checking the underlying guest_memfd
file for mmap support, which would otherwise require taking and
releasing a reference on the file for each check. By caching this
information directly in the memslot, we reduce overhead and simplify the
logic involved in handling guest_memfd-backed pages for host mappings.

Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Acked-by: David Hildenbrand <david@redhat.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 11 ++++++++++-
 virt/kvm/guest_memfd.c   |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 26bad600f9fa..8b47891adca1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -54,7 +54,8 @@
  * used in kvm, other bits are visible for userspace which are defined in
  * include/uapi/linux/kvm.h.
  */
-#define KVM_MEMSLOT_INVALID	(1UL << 16)
+#define KVM_MEMSLOT_INVALID			(1UL << 16)
+#define KVM_MEMSLOT_GMEM_ONLY			(1UL << 17)
 
 /*
  * Bit 63 of the memslot generation number is an "update in-progress flag",
@@ -2490,6 +2491,14 @@ static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
 		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
 }
 
+static inline bool kvm_memslot_is_gmem_only(const struct kvm_memory_slot *slot)
+{
+	if (!IS_ENABLED(CONFIG_KVM_GUEST_MEMFD))
+		return false;
+
+	return slot->flags & KVM_MEMSLOT_GMEM_ONLY;
+}
+
 #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
 static inline unsigned long kvm_get_memory_attributes(struct kvm *kvm, gfn_t gfn)
 {
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 67e7cd7210ef..d5b445548af4 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -578,6 +578,8 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 */
 	WRITE_ONCE(slot->gmem.file, file);
 	slot->gmem.pgoff = start;
+	if (kvm_gmem_supports_mmap(inode))
+		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
 
 	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
 	filemap_invalidate_unlock(inode->i_mapping);
-- 
2.50.1.552.g942d659e1b-goog


