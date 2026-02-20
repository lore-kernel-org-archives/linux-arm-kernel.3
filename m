Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BF4C56206
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4t2Ka0SbHG63zjWPLvLJWeUxrHZFHF4lTvo3C3qyPco=; b=B0g6oxBn6sg8VgEx7Mq475pJXw
	PoZ8Yswz9df5rCgpsZ8jKqc8tV0+ymlQEkD2HSvU8rIfIdyZ/mGMzcTHAIoNZBBPQt6rCbIv0uqs2
	hsvduQo9xXNmP/FBZB2UhV25Rztif4r3KbmRMH3Wl1EWRkVwOHl7/cRIABBVA7T/mpu3ZOd4tYkOT
	FwQwGw8oHmZefU1uhjpbf2vdS0Z3+S3uz4Kx9VoIff+dVWnzvWp3BEcgMHLgSLEgs6ymU5+gWK5qs
	UZhrSRXYOpadci/t2kMlzV1WGc9kUlm8TT3R6HSvUBp4Gt+dJhMztvfRrEC39xT/+2ydt44Bm/3X8
	FxwWhLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSCi-0000000EyJu-3VX9;
	Fri, 20 Feb 2026 15:14:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtSCg-0000000EyHc-1doY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 15:14:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F83D339;
	Fri, 20 Feb 2026 07:13:53 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74C1E3F7D8;
	Fri, 20 Feb 2026 07:13:58 -0800 (PST)
Date: Fri, 20 Feb 2026 15:13:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/3] arm64: gcs: Do not map the guarded control stack as
 THP
Message-ID: <aZh6LzXGY1MfASlo@arm.com>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
 <20260220140532.285011-4-catalin.marinas@arm.com>
 <18352353-8760-404b-a981-b0a5ac067b6c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18352353-8760-404b-a981-b0a5ac067b6c@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_071402_542412_D08F4938 
X-CRM114-Status: GOOD (  28.85  )
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

On Fri, Feb 20, 2026 at 02:34:08PM +0000, Mark Brown wrote:
> On Fri, Feb 20, 2026 at 02:05:31PM +0000, Catalin Marinas wrote:
> > The default GCS size allocated on first prctl() for the main thread or
> > subsequently on clone() is either half of RLIMIT_STACK or half of a
> > thread's stack size. Both of these are likely to be suitable for a THP
> > allocation and the kernel is more aggressive in creating such mappings.
> > However, it does not make much sense to use a huge page as it didn't
> > make sense for the normal stacks either. See commit c4608d1bf7c6 ("mm:
> > mmap: map MAP_STACK to VM_NOHUGEPAGE").
> 
> > Force VM_NOHUGEPAGE when allocating/mapping the GCS. As per commit
> > 7190b3c8bd2b ("mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is
> > enabled"), only pass this flag if TRANSPARENT_HUGEPAGE is enabled as not
> > to confuse CRIU tools.
> 
> I agree that this is sensible however I'm fairly sure this will also
> apply to the other shadow stack implementations so I think it would be
> better to either do it cross architecture (ideally factoring this out of
> the arch code entirely) or put a note in the commit log that it's likely 
> going to apply to other architectures.  There's a bunch of stuff that we
> should start factoring out into common code now that RISC-V landed and
> it looks like the clone3() stuff ran it's course, we should make it as
> easy as possible to understand why any divergences we're adding.

Something like below (not tested yet and not addressing riscv, waiting
for -rc1):

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index bbdb62ae47cd..21ed78d129de 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -12,23 +12,7 @@

 static unsigned long alloc_gcs(unsigned long addr, unsigned long size)
 {
-	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
-	vm_flags_t vm_flags = VM_SHADOW_STACK;
-	struct mm_struct *mm = current->mm;
-	unsigned long mapped_addr, unused;
-
-	if (addr)
-		flags |= MAP_FIXED_NOREPLACE;
-
-	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
-		vm_flags |= VM_NOHUGEPAGE;
-
-	mmap_write_lock(mm);
-	mapped_addr = do_mmap(NULL, addr, size, PROT_READ | PROT_WRITE,
-			      flags, vm_flags, 0, &unused, NULL);
-	mmap_write_unlock(mm);
-
-	return mapped_addr;
+	return vm_mmap_shadow_stack(addr, size, 0);
 }

 static unsigned long gcs_size(unsigned long size)
diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index 978232b6d48d..9725e7d89b1e 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -100,17 +100,9 @@ static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
 static unsigned long alloc_shstk(unsigned long addr, unsigned long size,
 				 unsigned long token_offset, bool set_res_tok)
 {
-	int flags = MAP_ANONYMOUS | MAP_PRIVATE | MAP_ABOVE4G;
-	struct mm_struct *mm = current->mm;
-	unsigned long mapped_addr, unused;
+	unsigned long mapped_addr;

-	if (addr)
-		flags |= MAP_FIXED_NOREPLACE;
-
-	mmap_write_lock(mm);
-	mapped_addr = do_mmap(NULL, addr, size, PROT_READ, flags,
-			      VM_SHADOW_STACK | VM_WRITE, 0, &unused, NULL);
-	mmap_write_unlock(mm);
+	mapped_addr = vm_mmap_shadow_stack(addr, size, MAP_ABOVE4G);

 	if (!set_res_tok || IS_ERR_VALUE(mapped_addr))
 		goto out;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index f0d5be9dc736..4bde7539adc8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3711,6 +3711,8 @@ static inline void mm_populate(unsigned long addr, unsigned long len) {}
 /* This takes the mm semaphore itself */
 extern int __must_check vm_brk_flags(unsigned long, unsigned long, unsigned long);
 extern int vm_munmap(unsigned long, size_t);
+extern unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
+	unsigned long len, unsigned long flags);
 extern unsigned long __must_check vm_mmap(struct file *, unsigned long,
         unsigned long, unsigned long,
         unsigned long, unsigned long);
diff --git a/mm/util.c b/mm/util.c
index 97cae40c0209..5c0d92f52157 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -588,6 +588,24 @@ unsigned long vm_mmap_pgoff(struct file *file, unsigned long addr,
 	return ret;
 }

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
+		      VM_SHADOW_STACK | VM_NOHUGEPAGE, 0, &unused, NULL);
+	mmap_write_unlock(mm);
+
+	return ret;
+}
+
 /*
  * Perform a userland memory mapping into the current process address space. See
  * the comment for do_mmap() for more details on this operation in general.

-- 
Catalin

