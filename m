Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9EDF4BB6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKnrDzCUwa89CjqkQK+aELBLtJlIYA6cfH4PLt2AKb8=; b=x/ydrSkr7otKVat9EUyZkG/+sW
	nN2bKx574ofRZyekKS3xYQ1Fu6efolgmmGX6fQWfTc9YbF3NXTlc/mojWCRcSeguicFtBWtZY/Nx5
	YIvRAhXNm/NB8hq0BtdBMYLmQD0tpMQI/jkoaAmoMoBTtLAUcsFnmEZtp2Gy5NAYTsUrbWBzGosx8
	1er9K7N+nwS1nSeIavP/+SbRpTfzvdNPH/jU/K0PTvoE0RrGUCPkTS0czgpe72QeLG9NBjqbsvsjk
	C/6y0tZopIEzFCXIh26vBCZbURMCsWIl4AwgkQmL/nrOkYTWFJAuFIxF9YoKNO+UoRUbR7Ylqj1Kj
	UVTot2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfq-00000002Wv2-2KPa;
	Tue, 24 Feb 2026 17:58:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwfi-00000002Wl4-312P;
	Tue, 24 Feb 2026 17:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2439A60130;
	Tue, 24 Feb 2026 17:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCD0C116D0;
	Tue, 24 Feb 2026 17:58:06 +0000 (UTC)
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
Subject: [PATCH 1/5] mm: Introduce vm_mmap_shadow_stack() as a helper for VM_SHADOW_STACK mappings
Date: Tue, 24 Feb 2026 17:57:53 +0000
Message-ID: <20260224175800.2500729-2-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224175800.2500729-1-catalin.marinas@arm.com>
References: <20260224175800.2500729-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
---
 include/linux/mm.h |  4 ++++
 mm/util.c          | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 5be3d8a8f806..1f28be975f86 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3908,6 +3908,10 @@ extern int vm_munmap(unsigned long, size_t);
 extern unsigned long __must_check vm_mmap(struct file *, unsigned long,
         unsigned long, unsigned long,
         unsigned long, unsigned long);
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
+extern unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
+	unsigned long len, unsigned long flags);
+#endif
 
 struct vm_unmapped_area_info {
 #define VM_UNMAPPED_AREA_TOPDOWN 1
diff --git a/mm/util.c b/mm/util.c
index b05ab6f97e11..2592291948f0 100644
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
+				   unsigned long flags)
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

