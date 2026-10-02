Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CE5CA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 19:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekKUYOby3c2j+NEGwfq/n/16hDsQN2mSgzvQPgHiWWI=; b=NKKOU/ODZzn4bj7jBJmo5B2n8N
	vsLIft1teF9PFOc0P0dNfh/K4OiiF1W0Xt+7151QlK6JrZuY4jUcoovuC9Ooig29c0SffWn1q2Xge
	gHRA46HJVBEnK4pz57ZouuAl75jdoAZwrILCbobE+B6KG6ZuykKzg3pWLlj2+Ez6FDxPb3AIV9LgM
	uqSq6sh04clvtV+41Hb0MY2O+q0A3cm3KTUv50lKKz/PCk7bV9gXrJ6vq9TglHeequ7axdcECLI2P
	tYpmJH7dQtVWLiasz3sKX4lRByj8pwuNOUJMnohxuoX4fqXVNRtN+QS8YOtT88Y3dIBX1pHnBU49F
	zdMozuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCiy0-0000000COqo-1FVG;
	Fri, 02 Oct 2026 19:30:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCixz-0000000COqZ-21qV;
	Fri, 02 Oct 2026 19:30:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CF3360D77;
	Fri,  2 Oct 2026 19:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748A01F000FF;
	Fri,  2 Oct 2026 19:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790969446;
	bh=ekKUYOby3c2j+NEGwfq/n/16hDsQN2mSgzvQPgHiWWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d2r2hK5kCljTlCYwbBufk/wivX4jkvPY5GtMgJLcUIUGT4ktspgfRBivcG57guSh0
	 hmkWr9NCuIzN8DuY1j8dpdZ4MIgpfoMkhqfwhFne9TUTm7tvkDIkyqcyp6gifsaedU
	 mNrCV965QKAOpjo5mT0u9456Q2feFcLsrcpn4yK2t79qy6ksjZH9IjiJABakb9YbL5
	 heJGGdWiGwwTNHAPJgbj/idVxDZSAeMzL3J8SODqqJovLo/2+7RpFWIqHOSOxNi79y
	 Uw9DHbuSk9BoX3hzMhPL2bfOom2XjyLWZ7KwO9IQVaU87sthIFLqZfHTTSxGRCaWc8
	 PWPWsigErZcDg==
From: Barry Song <baohua@kernel.org>
To: willy@infradead.org
Cc: agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	baohua@kernel.org,
	borntraeger@linux.ibm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	chenhuacai@kernel.org,
	chleroy@kernel.org,
	dave.hansen@linux.intel.com,
	david@kernel.org,
	gerald.schaefer@linux.ibm.com,
	gor@linux.ibm.com,
	hca@linux.ibm.com,
	hpa@zytor.com,
	kernel@xen0n.name,
	liam@infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	ljs@kernel.org,
	loongarch@lists.linux.dev,
	luto@kernel.org,
	maddy@linux.ibm.com,
	mark.rutland@arm.com,
	mhocko@suse.com,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	palmer@dabbelt.com,
	peterz@infradead.org,
	pjw@kernel.org,
	rppt@kernel.org,
	shakeel.butt@linux.dev,
	surenb@google.com,
	svens@linux.ibm.com,
	tglx@kernel.org,
	vbabka@kernel.org,
	will@kernel.org,
	x86@kernel.org,
	zhanghongru06@gmail.com,
	zhanghongru@xiaomi.com,
	zhaonanzhe@xiaomi.com
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
Date: Sat,  3 Oct 2026 03:30:34 +0800
Message-Id: <20261002193034.86218-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <ar7MsOb6IJLt4eLo@casper.infradead.org>
References: <ar7MsOb6IJLt4eLo@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

On Fri, Oct 2, 2026 at 5:12 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Sep 28, 2026 at 10:48:41AM +0800, Barry Song wrote:
> > On Mon, Sep 28, 2026 at 6:55 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > So while doing my slides, I realised that what we need to avoid doing
> > > is (a) sleeping while holding the mmap_lock (b) returning RETRY while
> > > holding the VMA lock
> > >
> > > And that turns out to be as simple as this patch:
> > >
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index dd09c438fa23..94ed2333f8d8 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -723,6 +723,8 @@ enum {
> > >   */
> > >  static inline bool fault_flag_allow_retry_first(enum fault_flag flags)
> > >  {
> > > +       if (flags & FAULT_FLAG_VMA_LOCK)
> > > +               return false;
> > >         return (flags & FAULT_FLAG_ALLOW_RETRY) &&
> > >             (!(flags & FAULT_FLAG_TRIED));
> > >  }
> > >
> > > OK, this is a hack.  The function is spectacularly badly named, and
> > > needs to be renamed before a patch can go upstream.  But this should
> > > fix the contention on mmap_lock.
> >
> > Thanks for your suggestion.
> > This is exactly what we did in Android Common Kernel before we had
> > Lorenzo's proposal (bypassing `fault_flag_allow_retry_first()`):
> >
> > https://android.googlesource.com/kernel/common/+/1b9b045a586245cc1c29b2747c6586234c7f5bad%5E%21/#F2
>
> Looks like that one didn't cover __folio_lock_or_retry(), but that
> doesn't invalidate your point.
Yep. `__folio_lock_or_retry()` will make the same thing true for anon
VMAs, so we intentionally made the hook valid only for file VMAs.Only touching the file retry path seems to involve less VMA
contention.

>
> > Note that Lorenzo's proposal avoids mmap_lock contention without
> > introducing any new VMA lock contention. It also doesn't require a new
> > flag that would break KMI. So this is clearly the preferred approach.
>
> But it does retry multiple times in cases where we know the fault
> will always fail (eg the fault is on a device-private VMA)
>
Right now, these might require a single extra retry for device-private
and `__vmf_anon_prepare()` cases. The commit log also mentions this.

"Some faults may
retry unnecessarily, for example, those in __vmf_anon_prepare() or
device-private fault handling, which require the mmap_lock. However,
these cases are expected to be infrequent and only add one cheap
per-VMA lock attempt."

If we do want to remove the extra VMA lock attempt, we might still
need an additional flag such as VM_FAULT_NEED_MMAP_LOCK:

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 2cecf6ba6df7..2821e3bd7462 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -620,6 +620,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	struct vm_area_struct *vma;
 	int si_code;
 	int pkey = -1;
+	bool vma_lock_retried = false;
 
 	if (kprobe_page_fault(regs, esr))
 		return 0;
@@ -688,6 +689,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	if (!(mm_flags & FAULT_FLAG_USER))
 		goto lock_mmap;
 
+lock_vma:
 	vma = lock_vma_under_rcu(mm, addr);
 	if (!vma)
 		goto lock_mmap;
@@ -734,6 +736,12 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 			goto no_context;
 		return 0;
 	}
+
+	if (!vma_lock_retried && !(fault & VM_FAULT_NEED_MMAP_LOCK)) {
+		vma_lock_retried = true;
+		goto lock_vma;
+	}
+
 lock_mmap:
 
 retry:
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 6141160ec652..baadab598d98 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -1734,10 +1734,11 @@ enum vm_fault_reason {
 	VM_FAULT_NOPAGE         = (__force vm_fault_t)0x000100,
 	VM_FAULT_LOCKED         = (__force vm_fault_t)0x000200,
 	VM_FAULT_RETRY          = (__force vm_fault_t)0x000400,
-	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x000800,
-	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x001000,
-	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x002000,
-	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x004000,
+	VM_FAULT_NEED_MMAP_LOCK     = (__force vm_fault_t)0x000800,
+	VM_FAULT_FALLBACK       = (__force vm_fault_t)0x001000,
+	VM_FAULT_DONE_COW       = (__force vm_fault_t)0x002000,
+	VM_FAULT_NEEDDSYNC      = (__force vm_fault_t)0x004000,
+	VM_FAULT_COMPLETED      = (__force vm_fault_t)0x008000,
 	VM_FAULT_HINDEX_MASK    = (__force vm_fault_t)0x0f0000,
 };
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ddc631a388b9..64e08c6153cf 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1480,7 +1480,7 @@ vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
 
 	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
 		vma_end_read(vma);
-		return VM_FAULT_RETRY;
+		return VM_FAULT_RETRY | VM_FAULT_NEED_MMAP_LOCK;
 	}
 
 	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
diff --git a/mm/memory.c b/mm/memory.c
index 1f83a26f8733..89c8c8a52c16 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3980,7 +3980,7 @@ vm_fault_t __vmf_anon_prepare(struct vm_fault *vmf)
 		return 0;
 	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
 		if (!mmap_read_trylock(vma->vm_mm))
-			return VM_FAULT_RETRY;
+			return VM_FAULT_RETRY | VM_FAULT_NEED_MMAP_LOCK;
 	}
 	if (__anon_vma_prepare(vma))
 		ret = VM_FAULT_OOM;
@@ -4937,7 +4937,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 				 * under VMA lock.
 				 */
 				vma_end_read(vma);
-				ret = VM_FAULT_RETRY;
+				ret = VM_FAULT_RETRY | VM_FAULT_NEED_MMAP_LOCK;
 				goto out;
 			}
 
-- 
2.39.3 (Apple Git-146)


