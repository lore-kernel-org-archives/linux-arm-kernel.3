Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0988FD3774
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OjAZugVPCx8r/+dS+ND9M3tTcf9QCbsN8AjDXYD3Wo=; b=3U1dH/+L7ByOblZ6pnK7PRSPnx
	dTKHX36L8S3kRcXWIGSOCc+7PU+wdN1VnpS1wajIi3QlTc6rrevkDB+UfTJnU1C2YLnGZcW1ajt5F
	k+IrSopZH18JeFhNvMHfsFxekZclsH8KZ1yoAXZ82FsmzEZTZEpYMFMbKrW7Mbr1ijD7jKC9qiHcQ
	soTYAJJ/F3NOzvslNgmWcj2kGqYOcvTrqnnU5oFshMI2nYEVjP10v1MzghkzcA5MXmrDYZQFIkld0
	HZPvJyiE9BxM+hAwzIgSJWh8WfYAdwnxCgZ1c9PuGtw2CUszHurzvjDEJhT+kI1q6cDmreJgjss79
	8ec+lgWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHWj-00000004TZk-3lWV;
	Wed, 25 Feb 2026 16:14:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHWh-00000004TY0-08hN;
	Wed, 25 Feb 2026 16:14:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 605B644274;
	Wed, 25 Feb 2026 16:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9970C2BC87;
	Wed, 25 Feb 2026 16:14:10 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/5] mm: Introduce vm_mmap_shadow_stack() as a helper for VM_SHADOW_STACK mappings
Date: Wed, 25 Feb 2026 16:13:58 +0000
Message-ID: <20260225161404.3157851-2-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225161404.3157851-1-catalin.marinas@arm.com>
References: <20260225161404.3157851-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_081415_133974_AC069784 
X-CRM114-Status: GOOD (  16.52  )
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

arm64, riscv and x86 use a similar pattern for mapping the user shadow
stack (cloned from x86). Extract this into a helper to facilitate code
reuse.

The call to do_mmap() from the new helper uses PROT_READ|PROT_WRITE prot
bits instead of the PROT_READ with an explicit VM_WRITE vm_flag. The
x86 intent was to avoid PROT_WRITE implying normal write since the
shadow stack is not writable by normal stores. However, from a kernel
perspective, the vma is writeable. Functionally there is no difference.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Tested-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/mm.h |  2 ++
 mm/util.c          | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5be3d8a8f806..61071dd72eb6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3908,6 +3908,8 @@ extern int vm_munmap(unsigned long, size_t);
 extern unsigned long __must_check vm_mmap(struct file *, unsigned long,
         unsigned long, unsigned long,
         unsigned long, unsigned long);
+extern unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
+		unsigned long len, unsigned long flags);
 
 struct vm_unmapped_area_info {
 #define VM_UNMAPPED_AREA_TOPDOWN 1
diff --git a/mm/util.c b/mm/util.c
index b05ab6f97e11..51f7f417e91f 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -618,6 +618,31 @@ unsigned long vm_mmap(struct file *file, unsigned long addr,
 }
 EXPORT_SYMBOL(vm_mmap);
 
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
+/*
+ * Perform a userland memory mapping for a shadow stack into the current
+ * process address space. This is intended to be used by architectures that
+ * support user shadow stacks.
+ */
+unsigned long vm_mmap_shadow_stack(unsigned long addr, unsigned long len,
+		unsigned long flags)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long ret, unused;
+
+	flags |= MAP_ANONYMOUS | MAP_PRIVATE;
+	if (addr)
+		flags |= MAP_FIXED_NOREPLACE;
+
+	mmap_write_lock(mm);
+	ret = do_mmap(NULL, addr, len, PROT_READ | PROT_WRITE, flags,
+		      VM_SHADOW_STACK, 0, &unused, NULL);
+	mmap_write_unlock(mm);
+
+	return ret;
+}
+#endif /* CONFIG_ARCH_HAS_USER_SHADOW_STACK */
+
 /**
  * __vmalloc_array - allocate memory for a virtually contiguous array.
  * @n: number of elements.

