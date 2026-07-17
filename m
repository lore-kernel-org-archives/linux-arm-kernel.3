Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC13DC4450F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 03:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qfsfSM7+v1WClc9BxhjMt2YlMxMtKRK2E8WppuykZI=; b=jGxp9dgbdIxnqdYEUfzeQT7yTx
	ASoT9xSviy5gbUMkNAOYYYv9WYvZQ6vCh83K3mtw+BY+gBP/Gdh1TTG9XWaI/KYkVRPp00eEW2pE9
	LMJNO3Q6vCtCusLAKB74jer664YEdj3rFkfAw7hAK/mMG7uIH9k0SGHVRsrDMuzYJ0lzR4XQzpB5a
	wgBplMT8efIejpobmBeQYEZiEFdqEcSomcsnW/nAQINJ58OJToyPVDyGYBHfcZtbVMaEcetiMeEO+
	hEJF3rdKwM5Ci3HQZTz7b6yENeSB/2t9lmmFHVXWEyRyibRaCoa9Fsbc0hWispZeiQoDmPRQp9hcV
	gvTp48Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZXO-000000014AD-2SCw;
	Fri, 17 Jul 2026 03:46:58 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZXL-0000000149i-3war
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 03:46:57 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7ec49608332so1349638a34.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 20:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784260014; cv=none;
        d=google.com; s=arc-20260327;
        b=Kw+MC3VSDk/l/emjCr3///7rFLZ2ozTW1Cjo5WPK3A5zmwghph5SsDBMz1t2O3HT9w
         f2y79iSUda7/vcIUXU6aXaLwgGwCZ+nM9i1HNscdA8SDiGUa7bnY4wn0f0VlCI3YxUee
         q9ZlFbDGVlqtit0YBWvrJO7/pEnJrY14wiql5CZ6YEJqa91SdHN80JDY5e6o7uC7Misr
         w9uqaGqLtJcVelkF+FnHtk1vKgy3COt0RwcchK0x6e1SqcsxPOxHENUgjlpXOmSMz07+
         kPf76Tt8doHHPyr+qJiwnWQtGFyhr26LZIUdkfZLld/HRzvjPEC6ZIw7jlODRK5z7PHN
         Vb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+qfsfSM7+v1WClc9BxhjMt2YlMxMtKRK2E8WppuykZI=;
        fh=bbOTOZsQ+8Kp5OCyPQNs1rjyMoXKyhoJXbk7reJsSFw=;
        b=bIMJ4jDB5zfvQn6Vh5ZR4aly6u4nYyusnnv5o8wNIaYA7iTIL4KRpFg1yae/LCGzY6
         2sV0HKJNUK1/b4BZg+/c91ITSlJHg7WWv42FzCC6mkvkDafC+vW44inZ21HG36Yiy9Px
         4H3ebrMDwci/ckpjokCUEGrfvg3jPhModXjfFQumrtRG+1d7/VvkoAMzJ7FbgkZKTpwW
         4RW9l0B7x500w3JAhsPUSwwfBNuXPR3bgjZ9fSjkPA5LKGDopeUmq7S3fnUk8qJnRNoT
         Zujwdc7pcAFYkTZjJi6j7RsXTCQNdHLtRkw/+6ijlMLZckF6l+zUG4cdTXLpUuu61ZkG
         hJ6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784260014; x=1784864814; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+qfsfSM7+v1WClc9BxhjMt2YlMxMtKRK2E8WppuykZI=;
        b=oEH8Qo2Neh0rOypoihAEZbR49hwZK9qstjJatds/XOE9l/bhUashSP5+OjAlEJlxO4
         chkcoIUXp2qvO0wh47oweK3hGfJ7DWafNAvKWd/cHg2vhYBQkXBSOUOGKnKGpTW1Wc+j
         WZ9mHAn4Fv+bJ+n3Wq4fD5I4L096mKJ1Mv7p0q/PWwG6scBnGlkYjPVByGjstMk6LPvL
         V6uoSh7dAQmErxllTMGSuhhp9X6vB18PXCv9+LXmiQ6Mi8xCTX6z47ZhzjpkH0zH7Tdc
         t1qraoLW0HHcuiMsGWWqdHzRpmfOCGRVjdp/fhpHtsyUT5NSHYsSolMlxhMX+luexX5s
         useQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260014; x=1784864814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+qfsfSM7+v1WClc9BxhjMt2YlMxMtKRK2E8WppuykZI=;
        b=Z/8KfWPRoAdvhHi+icmKBMu4LPyXnFWyQ1TfH7jUdFN69DyIxgt4ZeCL0Q71f8ehnw
         KD0i9NRuQBd0KKuDVB5sG1SKM2581O6k4CHLPni7zuY5iDKy9DrZN+MPuU0yJl/XxkPX
         uTUmCqcWW5oZ4PmCkSVuObDoTC5fvcw1bQL7ECDKQafEoHBfvaWruMBu54YK5yTkuRWq
         oUGcS6RTWGRlcJILJ/Ed7FuWZ8Tnb1CU5NFj8L+pEN1ukej09XkOFZXwiBPo2PH4kua2
         pKA1Tf02x19PHUA9BNcS6RZX6VvYYqlAjmIPJdaNWJycnLxyJqiUnzAQ9ZrkG/lRrWCs
         OezQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHNz2JNhk4jTCGoUSk+1Yz7n+RtL6BaQ+OR13T+AnR5rPD2MjNDjpdMEa5pnStNn4OLrawbEZFeLDR72eACP9W@lists.infradead.org
X-Gm-Message-State: AOJu0YxZR3Ws59j4VWJiRuL+RCGYqyFalNk6WnqGWc6bHehBnLxMaDPQ
	3pRGVDpPwI6Trg8+lHufGZDXIpmAOHKZTay6xm9vshg8oBXU24ExoprUziAduDYIlIytRVR56n8
	wV3RY0uYsgTaiNMykwO6P/DHycbc4otwtl0oa
X-Gm-Gg: AfdE7clhAyUCLhdXbDWHKjNOdOmTtKN3zXYgyYqiVP5gPi1srvV9l5ZqptsrB4dwHyM
	H5g8XMjYrlqFvv7tH9LvRxYtr3JOJLlWOEsWFEzdoIB/y5AkQKZXBFUYZTYTeIUxslAhNUDf9XY
	aHovyvz6S1Zh9yljpC78FPdyogyb6dm68GtBRB4ykn30FRwBbpaYN+DoR2rDI9FuQeXQH/HiUke
	3dzRakiH1CgwOnQsn1Mm85DcFa5vNDgVMddgFBDEg9qiRe/xsGgBv/W1qV2gak1FCkCczir0WYZ
	oZT77XiqoEcJJDKG
X-Received: by 2002:a05:6808:14c6:b0:4a4:a693:9d8f with SMTP id
 5614622812f47-4a4d03063fdmr419990b6e.6.1784260013937; Thu, 16 Jul 2026
 20:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260716-series-vmap-race-fix-v4-0-8c108c4317df@kernel.org> <20260716-series-vmap-race-fix-v4-2-8c108c4317df@kernel.org>
In-Reply-To: <20260716-series-vmap-race-fix-v4-2-8c108c4317df@kernel.org>
From: David CARLIER <devnexen@gmail.com>
Date: Fri, 17 Jul 2026 04:46:42 +0100
X-Gm-Features: AUfX_mxBLT37KrDyrNbP0EYWC50r_QKOrJ4iSaMj1OT4QL3-liPKJMNfSVRy2ow
Message-ID: <CA+XhMqzUO49FiC-Oa6VYUt7Wm9RZLH30DhUH2kVn_PBodyZ6dg@mail.gmail.com>
Subject: Re: [PATCH mm-hotfixes v4 2/4] x86/mm/pat: acquire init_mm write lock
 to avoid UAF
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Toshi Kani <toshi.kani@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dev Jain <dev.jain@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"Denis V. Lunev" <den@virtuozzo.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_204655_998721_6D09C8E4 
X-CRM114-Status: GOOD (  31.29  )
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

On Thu, 16 Jul 2026 at 22:31, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
>
> x86 implements page attribute modification using its Change Page
> Attributes (CPA) mechanism.
>
> This tracks properties of ranges such as cache mode through x86 page
> attributes, and as part of that logic manipulates kernel page tables.
>
> Since commit 41d88484c71c ("x86/mm/pat: restore large ROX pages after
> fragmentation") ranges of kernel page table entries can be collapsed into
> huge page table entries as part of this logic.
>
> As part of this collapse, it frees the page tables which the collapsed
> entries previously pointed to, and it does so without any relevant locks
> being held to preclude concurrent kernel page table walkers.
>
> The only way this code can be reached is if CPA_COLLAPSE is specified, and
> this is only set in set_memory_rox() via:
>
> set_memory_rox()
> -> change_page_attr_set_clr()
> -> cpa_flush()
> -> cpa_collapse_large_pages()
>
> Notable users of this are execmem and bpf when manipulating executable
> mappings.
>
> However, this is problematic for ptdump as it walks ranges it does not own
> and thus runs the risk of a use-after-free on page tables freed underneath
> it.
>
> In addition, concurrent CPA collapse operations are possible which can also
> cause races.
>
> Resolve the issue by acquiring the mmap write lock on init_mm across the
> whole operation.
>
> It is safe to acquire a sleeping lock as all the callers invoke
> set_memory_rox() from process context and in any case,
> change_page_attr_set_clr() calls vm_unmap_alias() which ultimately takes a
> mutex, disallowing atomic context here.
>
> Fixes: 41d88484c71c ("x86/mm/pat: restore large ROX pages after fragmentation")
> Cc: stable@vger.kernel.org
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
>  arch/x86/mm/pat/set_memory.c | 15 ++++++++++++++-
>  include/linux/mmap_lock.h    |  2 ++
>  2 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index d023a40a1e03..d1e63f7d267f 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -22,6 +22,7 @@
>  #include <linux/cc_platform.h>
>  #include <linux/set_memory.h>
>  #include <linux/memregion.h>
> +#include <linux/cleanup.h>
>
>  #include <asm/e820/api.h>
>  #include <asm/processor.h>
> @@ -410,7 +411,7 @@ static void __cpa_flush_tlb(void *data)
>
>  static int collapse_large_pages(unsigned long addr, struct list_head *pgtables);
>
> -static void cpa_collapse_large_pages(struct cpa_data *cpa)
> +static void __cpa_collapse_large_pages(struct cpa_data *cpa)
>  {
>         unsigned long start, addr, end;
>         struct ptdesc *ptdesc, *tmp;
> @@ -442,6 +443,18 @@ static void cpa_collapse_large_pages(struct cpa_data *cpa)
>         }
>  }
>
> +static void cpa_collapse_large_pages(struct cpa_data *cpa)
> +{
> +       /*
> +        * Take the mmap write lock on init_mm to:
> +        * - Avoid a use-after-free if raced by ptdump (which takes its own
> +        *   write lock on init_mm).
> +        * - Serialise concurrent CPA walkers.
> +        */
> +       scoped_guard(mmap_write_lock, &init_mm)
> +               __cpa_collapse_large_pages(cpa);
> +}
> +
>  static void cpa_flush(struct cpa_data *cpa, int cache)
>  {
>         unsigned int i;
> diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> index 6b5c2390cc30..047f5f5e2c34 100644
> --- a/include/linux/mmap_lock.h
> +++ b/include/linux/mmap_lock.h
> @@ -621,6 +621,8 @@ static inline void mmap_read_unlock(struct mm_struct *mm)
>
>  DEFINE_GUARD(mmap_read_lock, struct mm_struct *,
>              mmap_read_lock(_T), mmap_read_unlock(_T))
> +DEFINE_GUARD(mmap_write_lock, struct mm_struct *,
> +            mmap_write_lock(_T), mmap_write_unlock(_T))
>  DEFINE_GUARD_COND(mmap_read_lock, _try, mmap_read_trylock(_T))
>
>  static inline void mmap_read_unlock_non_owner(struct mm_struct *mm)
>
> --
> 2.55.0
>

Hi,

This bullet confuses me. __change_page_attr() and friends are serialised by
cpa_lock/pgd_lock and never take init_mm's mmap lock, so this doesn't
exclude them.

Collapse vs collapse looks covered already: collapse_large_pages() holds
pgd_lock across the walk and both collapse_pmd_page()/collapse_pud_page()
calls, and the pmd_leaf()/pud_leaf() early-outs stop a second CPU
re-queueing a collapsed table. I couldn't build the interleaving behind the
cover letter's "could result in memory corruption". Can you spell it out?

If the reason is really Will's v3 point - collapse rounds up to PMD/PUD and
frees tables outside its caller's range, so it has to exclude
walk_kernel_page_table_range() walkers holding the read lock - then say
that. It's a UAF independent of ptdump, and it's why v3's read lock wasn't
enough.

Also: patch 1 justifies the trylock fallback on ptdump being rare, but this
takes the write lock on every set_memory_rox() (BPF JIT, module load,
execmem), even when nothing collapsed. vmap_try_huge_*() then loses the
trylock and quietly falls back to PTEs on every BPF load. No counter, no
trace. Not a blocker and I've no better idea, but fa93b45fd397 was about
getting vmalloc-huge on by default, so it's worth calling out.

Rest looks right. 4/4 restores pud_free_pmd_page() exactly as it was before
fa93b45fd397, and 3/4 builds the same walk init_mm got via
walk_kernel_page_table_range_lockless().

Reviewed-by: David Carlier <devnexen@gmail.com>

Cheers !

