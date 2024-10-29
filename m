Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FA8D3A678
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITwLgLplkyYtweutGU3Gs54aDJPJu4TJIeTe2P24k/U=; b=BznoGeQ5/ZvoZhHk3fB+yQ2auT
	8NT4JAS7kfNAMAI2j8AwZRKAgyDnLm+OMPaQazG/mZ1pNijrHoF8KEuoEyz9nDhmryPAkSXp8rxza
	dxTcEpgpIHSVTot+XMeri96/v210FAp7wZvEwQgWN8KGu+jbQgFH0KV0geQw6cUHS6MH8yOi5YGZa
	dla+IFkm7OyAjq0y7HDJDupaFk3DrHdL+O0Z6Q5AsabMDp4Lb5bqcjJp17kEt7XfSLfpiYL/q7OTW
	EqBO9i5FTUQjrcLrmLCZSoJfyDMFtRAcm0N30ewobgrgBTfwSyjdFGVJcAI/9QYoBqBTtdaxPNnJP
	GqC20+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qGC-0000000FN7U-2cB5;
	Tue, 29 Oct 2024 17:44:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5pbx-0000000FCWq-2ZmI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 17:02:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 463C95C014A;
	Tue, 29 Oct 2024 17:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAC5C4CECD;
	Tue, 29 Oct 2024 17:02:25 +0000 (UTC)
Date: Tue, 29 Oct 2024 17:02:23 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region()
 error path behaviour
Message-ID: <ZyEVHy-767RfFwh_@arm.com>
References: <bea02efe-a695-49e0-b15c-2270a82cadbf@lucifer.local>
 <CAHk-=whpXVBNvd0NJpw9=FGcuTuThwtfcKeM3Ug=Uk6kpChCPA@mail.gmail.com>
 <0b64edb9-491e-4dcd-8dc1-d3c8a336a49b@suse.cz>
 <CAHk-=wgE8410gu3EabjNEHhOYh1dyYwt23J62S4a9SYcwZUFhw@mail.gmail.com>
 <1608957a-d138-4401-98ef-7fbe5fb7c387@suse.cz>
 <cf1deb9b-c5c4-4e85-891d-62ecf9a04e0f@lucifer.local>
 <ZyD5iXikMzotl9mU@arm.com>
 <da15a72b-c1de-427b-a764-0ebbdd3f6a8e@lucifer.local>
 <ZyEL0s_qiyAYURR2@arm.com>
 <a050599e-6d43-4759-b08c-d37c0d28ce0e@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a050599e-6d43-4759-b08c-d37c0d28ce0e@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_100229_785441_36248B4E 
X-CRM114-Status: GOOD (  49.44  )
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

On Tue, Oct 29, 2024 at 04:36:32PM +0000, Lorenzo Stoakes wrote:
> On Tue, Oct 29, 2024 at 04:22:42PM +0000, Catalin Marinas wrote:
> > On Tue, Oct 29, 2024 at 03:16:00PM +0000, Lorenzo Stoakes wrote:
> > > On Tue, Oct 29, 2024 at 03:04:41PM +0000, Catalin Marinas wrote:
> > > > On Mon, Oct 28, 2024 at 10:14:50PM +0000, Lorenzo Stoakes wrote:
> > > > > So continue to check VM_MTE_ALLOWED which arch_calc_vm_flag_bits() sets if
> > > > > MAP_ANON.
> > > > [...]
> > > > > diff --git a/mm/shmem.c b/mm/shmem.c
> > > > > index 4ba1d00fabda..e87f5d6799a7 100644
> > > > > --- a/mm/shmem.c
> > > > > +++ b/mm/shmem.c
> > > > > @@ -2733,9 +2733,6 @@ static int shmem_mmap(struct file *file, struct vm_area_struct *vma)
> > > > >  	if (ret)
> > > > >  		return ret;
> > > > >
> > > > > -	/* arm64 - allow memory tagging on RAM-based files */
> > > > > -	vm_flags_set(vma, VM_MTE_ALLOWED);
> > > >
> > > > This breaks arm64 KVM if the VMM uses shared mappings for the memory
> > > > slots (which is possible). We have kvm_vma_mte_allowed() that checks for
> > > > the VM_MTE_ALLOWED flag as the VMM may not use PROT_MTE/VM_MTE directly.
> > >
> > > Ugh yup missed that thanks.
> > >
> > > > I need to read this thread properly but why not pass the file argument
> > > > to arch_calc_vm_flag_bits() and set VM_MTE_ALLOWED in there?
> > >
> > > Can't really do that as it is entangled in a bunch of other stuff,
> > > e.g. calc_vm_prot_bits() would have to pass file and that's used in a bunch
> > > of places including arch code and... etc. etc.
> >
> > Not calc_vm_prot_bits() but calc_vm_flag_bits().
> > arch_calc_vm_flag_bits() is only implemented by two architectures -
> > arm64 and parisc and calc_vm_flag_bits() is only called from do_mmap().
> >
> > Basically we want to set VM_MTE_ALLOWED early during the mmap() call
> > and, at the time, my thinking was to do it in calc_vm_flag_bits(). The
> > calc_vm_prot_bits() OTOH is also called on the mprotect() path and is
> > responsible for translating PROT_MTE into a VM_MTE flag without any
> > checks. arch_validate_flags() would check if VM_MTE comes together with
> > VM_MTE_ALLOWED. But, as in the KVM case, that's not the only function
> > checking VM_MTE_ALLOWED.
> >
> > Since calc_vm_flag_bits() did not take a file argument, the lazy
> > approach was to add the flag explicitly for shmem (and hugetlbfs in
> > -next). But I think it would be easier to just add the file argument to
> > calc_vm_flag_bits() and do the check in the arch code to return
> > VM_MTE_ALLOWED. AFAICT, this is called before mmap_region() and
> > arch_validate_flags() (unless I missed something in the recent
> > reworking).
> 
> I mean I totally get why you're suggesting it

Not sure ;)

> - it's the right _place_ but...
> It would require changes to a ton of code which is no good for a backport
> and we don't _need_ to do it.
> 
> I'd rather do the smallest delta at this point, as I am not a huge fan of
> sticking it in here (I mean your point is wholly valid - it's at a better
> place to do so and we can change flags here, it's just - it's not where you
> expect to do this obviously).
> 
> I mean for instance in arch/x86/kernel/cpu/sgx/encl.c (a file I'd _really_
> like us not to touch here by the way) we'd have to what pass NULL?

That's calc_vm_prot_bits(). I suggested calc_vm_flag_bits() (I know,
confusing names and total lack of inspiration when we added MTE
support). The latter is only called in one place - do_mmap().

That's what I meant (untested, on top of -next as it has a MAP_HUGETLB
check in there). I don't think it's much worse than your proposal,
assuming that it works:

diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
index 1dbfb56cb313..358bbaaafd41 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -6,6 +6,8 @@

 #ifndef BUILD_VDSO
 #include <linux/compiler.h>
+#include <linux/fs.h>
+#include <linux/shmem_fs.h>
 #include <linux/types.h>

 static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
@@ -31,7 +33,7 @@ static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
 }
 #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)

-static inline unsigned long arch_calc_vm_flag_bits(unsigned long flags)
+static inline unsigned long arch_calc_vm_flag_bits(struct file *file, unsigned long flags)
 {
 	/*
 	 * Only allow MTE on anonymous mappings as these are guaranteed to be
@@ -39,12 +41,12 @@ static inline unsigned long arch_calc_vm_flag_bits(unsigned long flags)
 	 * filesystem supporting MTE (RAM-based).
 	 */
 	if (system_supports_mte() &&
-	    (flags & (MAP_ANONYMOUS | MAP_HUGETLB)))
+	    (flags & (MAP_ANONYMOUS | MAP_HUGETLB) || shmem_file(file)))
 		return VM_MTE_ALLOWED;

 	return 0;
 }
-#define arch_calc_vm_flag_bits(flags) arch_calc_vm_flag_bits(flags)
+#define arch_calc_vm_flag_bits(file, flags) arch_calc_vm_flag_bits(file, flags)

 static inline bool arch_validate_prot(unsigned long prot,
 	unsigned long addr __always_unused)
diff --git a/arch/parisc/include/asm/mman.h b/arch/parisc/include/asm/mman.h
index 89b6beeda0b8..663f587dc789 100644
--- a/arch/parisc/include/asm/mman.h
+++ b/arch/parisc/include/asm/mman.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_MMAN_H__
 #define __ASM_MMAN_H__

+#include <linux/fs.h>
 #include <uapi/asm/mman.h>

 /* PARISC cannot allow mdwe as it needs writable stacks */
@@ -11,7 +12,7 @@ static inline bool arch_memory_deny_write_exec_supported(void)
 }
 #define arch_memory_deny_write_exec_supported arch_memory_deny_write_exec_supported

-static inline unsigned long arch_calc_vm_flag_bits(unsigned long flags)
+static inline unsigned long arch_calc_vm_flag_bits(struct file *file, unsigned long flags)
 {
 	/*
 	 * The stack on parisc grows upwards, so if userspace requests memory
@@ -23,6 +24,6 @@ static inline unsigned long arch_calc_vm_flag_bits(unsigned long flags)

 	return 0;
 }
-#define arch_calc_vm_flag_bits(flags) arch_calc_vm_flag_bits(flags)
+#define arch_calc_vm_flag_bits(file, flags) arch_calc_vm_flag_bits(file, flags)

 #endif /* __ASM_MMAN_H__ */
diff --git a/include/linux/mman.h b/include/linux/mman.h
index 8ddca62d6460..a842783ffa62 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_MMAN_H
 #define _LINUX_MMAN_H

+#include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/percpu_counter.h>

@@ -94,7 +95,7 @@ static inline void vm_unacct_memory(long pages)
 #endif

 #ifndef arch_calc_vm_flag_bits
-#define arch_calc_vm_flag_bits(flags) 0
+#define arch_calc_vm_flag_bits(file, flags) 0
 #endif

 #ifndef arch_validate_prot
@@ -151,13 +152,13 @@ calc_vm_prot_bits(unsigned long prot, unsigned long pkey)
  * Combine the mmap "flags" argument into "vm_flags" used internally.
  */
 static inline unsigned long
-calc_vm_flag_bits(unsigned long flags)
+calc_vm_flag_bits(struct file *file, unsigned long flags)
 {
 	return _calc_vm_trans(flags, MAP_GROWSDOWN,  VM_GROWSDOWN ) |
 	       _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
 	       _calc_vm_trans(flags, MAP_SYNC,	     VM_SYNC      ) |
 	       _calc_vm_trans(flags, MAP_STACK,	     VM_NOHUGEPAGE) |
-	       arch_calc_vm_flag_bits(flags);
+	       arch_calc_vm_flag_bits(file, flags);
 }

 unsigned long vm_commit_limit(void);
diff --git a/mm/mmap.c b/mm/mmap.c
index f102314bb500..f904b3bba962 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -344,7 +344,7 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
 	 * to. we assume access permissions have been handled by the open
 	 * of the memory object, so we don't do any here.
 	 */
-	vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(flags) |
+	vm_flags |= calc_vm_prot_bits(prot, pkey) | calc_vm_flag_bits(file, flags) |
 			mm->def_flags | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC;

 	/* Obtain the address to map to. we verify (or select) it and ensure
diff --git a/mm/nommu.c b/mm/nommu.c
index 635d028d647b..e9b5f527ab5b 100644
--- a/mm/nommu.c
+++ b/mm/nommu.c
@@ -842,7 +842,7 @@ static unsigned long determine_vm_flags(struct file *file,
 {
 	unsigned long vm_flags;

-	vm_flags = calc_vm_prot_bits(prot, 0) | calc_vm_flag_bits(flags);
+	vm_flags = calc_vm_prot_bits(prot, 0) | calc_vm_flag_bits(file, flags);

 	if (!file) {
 		/*
diff --git a/mm/shmem.c b/mm/shmem.c
index f24a0f34723e..ff194341fddb 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2737,9 +2737,6 @@ static int shmem_mmap(struct file *file, struct vm_area_struct *vma)
 	if (ret)
 		return ret;

-	/* arm64 - allow memory tagging on RAM-based files */
-	vm_flags_set(vma, VM_MTE_ALLOWED);
-
 	file_accessed(file);
 	/* This is anonymous shared memory if it is unlinked at the time of mmap */
 	if (inode->i_nlink)

-- 
Catalin

