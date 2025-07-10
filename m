Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB8BC83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 01:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDObvEJ/jIdbBg5ZxcRmtzlW2/cKEzrqP8L22Qd6WsY=; b=AFRRLZtpVTWecagutOwGZ27vbq
	/tevwKUuF0qMrDTqjnweLY6kWwgqlILISUpoVlEMK3OUqD56yVZi+Bobkf1QQTHo9gi/YYJlCQrwV
	jX4CP97OX5eCF9Hl4FwIPU4iDcmzizwhcqEMbwevOkUfgHo1I30aiOO5Q/A6l3qAxiGME6PTOSibQ
	HLFkGbQ/YTlgljr9e7hAHNf8SY4W3a2tScGbAFZrqfXKG8t+JkCNenHRzSAEzLu9jAgfH443khaYm
	aUJNF2sjWXMCcrVB/DH/CO+cZAGdSvKrL0/RIkZ+o48go9ehI8/cAAiQgMHI1CZgieaczbAAqhXDJ
	lmOVBVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZgZL-0000000ARxu-3dpm;
	Thu, 10 Jul 2025 01:59:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZgX1-0000000ARlq-0pCc;
	Thu, 10 Jul 2025 01:57:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CBA65C6B8A;
	Thu, 10 Jul 2025 01:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5A6C4CEEF;
	Thu, 10 Jul 2025 01:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752112621;
	bh=V5+0JeybGuGj3hNbNrffhOaKN4FNKIUQicNKhhV6M9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s36gQ67r+HzmWOakvqjLN2Bi+cxAqgCf9b1jm8CeVANKXagOyi4qRCxno997vOt7I
	 npTW9Sqm4fAIHoISBPWcX7vjQIgal5suR6GEB+4EiYf2hwAgwibu53TlZdekzLZBEQ
	 9ABBQhGaRUZwnPIix2Qtgh30B7PYqrpPimSO1KfrR0HfIEongwbMYk/1onz4hpDV26
	 GuIsiO8b8UJiiZ9KWrmQ80LhTJRWiOT9thCwXfahXz+KypMzoUnp19aAp8cABbtMDx
	 gSq60cIssEQ+9AYdxjTLFvnKp8xU42OaucaV/Fz2aUcFFHry0HoCkWdrBfNWJs8YVU
	 kLmHPK8kS1RBw==
Date: Wed, 9 Jul 2025 18:57:00 -0700
From: Kees Cook <kees@kernel.org>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 08/14] powerpc: Handle KCOV __init vs inline mismatches
Message-ID: <202507091856.C6510D809A@keescook>
References: <20250523043251.it.550-kees@kernel.org>
 <20250523043935.2009972-8-kees@kernel.org>
 <87jz662ssp.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz662ssp.fsf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_185703_321208_6E09D3FD 
X-CRM114-Status: GOOD (  23.04  )
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

On Sat, May 24, 2025 at 04:13:02PM +0530, Ritesh Harjani wrote:
> Kees Cook <kees@kernel.org> writes:
> 
> > When KCOV is enabled all functions get instrumented, unless
> > the __no_sanitize_coverage attribute is used. To prepare for
> > __no_sanitize_coverage being applied to __init functions, we have to
> > handle differences in how GCC's inline optimizations get resolved. For
> > s390 this requires forcing a couple functions to be inline with
> > __always_inline.
> >
> > Signed-off-by: Kees Cook <kees@kernel.org>
> > ---
> > Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: Naveen N Rao <naveen@kernel.org>
> > Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
> > Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: <linuxppc-dev@lists.ozlabs.org>
> > ---
> >  arch/powerpc/mm/book3s64/hash_utils.c    | 2 +-
> >  arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> > index 5158aefe4873..93f1e1eb5ea6 100644
> > --- a/arch/powerpc/mm/book3s64/hash_utils.c
> > +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> > @@ -409,7 +409,7 @@ static DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
> >  
> >  static phys_addr_t kfence_pool;
> >  
> > -static inline void hash_kfence_alloc_pool(void)
> > +static __always_inline void hash_kfence_alloc_pool(void)
> >  {
> >  	if (!kfence_early_init_enabled())
> >  		goto err;
> > diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > index 9f764bc42b8c..3238e9ed46b5 100644
> > --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > @@ -363,7 +363,7 @@ static int __meminit create_physical_mapping(unsigned long start,
> >  }
> >  
> >  #ifdef CONFIG_KFENCE
> > -static inline phys_addr_t alloc_kfence_pool(void)
> > +static __always_inline phys_addr_t alloc_kfence_pool(void)
> >  {
> >  	phys_addr_t kfence_pool;
> >  
> 
> I remember seeing a warning msg around .init.text section. Let me dig
> that...
> 
> ... Here it is: https://lore.kernel.org/oe-kbuild-all/202504190552.mnFGs5sj-lkp@intel.com/
> 
> I am not sure why it only complains for hash_debug_pagealloc_alloc_slots().
> I believe there should me more functions to mark with __init here.
> Anyways, here is the patch of what I had in mind.. I am not a compiler expert,
> so please let me know your thoughts on this.

Yeah, this looks good. I'll snag your patch and drop mine. :)

-Kees

-- 
Kees Cook

