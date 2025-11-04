Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78DECCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 11:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gcR9x9yjnH5mbm0Y42BtMv0Ob7csNznvvqxMnGrFks=; b=i/rSIHyd88Jhzirhoj5RIUP8Pp
	RbV+F+Xn7h2aJtDpY3dVdwwoVoe1OH4sGOjMtxHOowhfBIqqox7Vv2bNfUjlip3pdTwcUoX1sm7Wy
	h5oMUqo/kxxi2ccIBAS/UxLE38LvAEmwNotqt7mIuYOx50mP4Nfw9CvwKSH8RCKxI6/NNHgdPPACq
	oYDxg9aYX4SgCQBbidjws+yMFoCznzAlMXG4mB+cMUK+AwLttJ63J4vPNlkIfMMHrOn5+CKRmNmr2
	oFBpYkpHye85PgQkei2Qo/SKYioGrzCuu1T4y6Pg6nGYcXTWB6kwSCsdIWmU5xyevM0DJOgdmEELB
	IBTT9DSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFbx-0000000Bk7N-2gFX;
	Tue, 04 Nov 2025 11:54:05 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFbv-0000000Bk6O-0wsb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 11:54:04 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7a9c64dfa6eso2100306b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 03:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257242; x=1762862042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gcR9x9yjnH5mbm0Y42BtMv0Ob7csNznvvqxMnGrFks=;
        b=U/K0FEeqq0jSiYTq32vweRRc49jB6z3vO5AMAFCyaUitS+rOpvODs+YAu4Sd0HTh6h
         peULqsptXje7GjOMEKYySgzxDqnJcDlVqxZAn3GuiLSxECw1KeOtlPMO/lWykPlYBefF
         uUq3nd5APoso23vicJljDylDvNSYoC3625O1YBJWrt91zVzkLQT7+7cPdFXHjJEYEkah
         U1vOL9SdvW23MmEoKxFNUh7p+8v0IitPrlLDCjmL5fq923H9kt0Jyda09ucYut3Z/fdL
         9ZsmNOah/41aReb3SSNZpUnMuXPtVwpcpVj5kp1UoUjVry6OTfF5XCfNqOC49uOR3wTc
         PQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257242; x=1762862042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gcR9x9yjnH5mbm0Y42BtMv0Ob7csNznvvqxMnGrFks=;
        b=TFL7m162ehle5JUVP8yLA54y/dlkixAN4DgsU3Vykcn6Cfin986AuyXaY1Lh5wplXJ
         3rpJ0VlZDZ+HUugype+XI5MPOzAkl9Tfh+/X94TsQSH4EtLJQcj6x4ZmwyY4NeJw4xSt
         9ruCw3hytTFO5nO8aGbzucj11h1WX1rjvs0oPC0UbZpqBlIfR+1hNgo19L+gQq8gdjq4
         HDYeRZevN2aAo4FVfOOjvBJ6ydLGRPn7FnaakGeOUjPXxKB/ReFZgGAmQbBktrOj3X3I
         IZX9f4yh4LeoJloZNGLQMd48GnumkH2SY5Q0ubSpE37XPVkLBwJWrz9Tag3dDuQeJry1
         2THw==
X-Forwarded-Encrypted: i=1; AJvYcCWiEECfPYCNi77H1CSB18ngjMVSNww2cdYn00EdAFDUVrs8pRgfaOKr/pKw2TQB4yuIeTsgmXvAPO1TYrjhFmT4@lists.infradead.org
X-Gm-Message-State: AOJu0YyIj4BEPVs7xl5Sc2m587n507Vx0ewmSFnclxD7zEhGMMAB0Xdx
	1s/0p4z/LLhUoJdk6AzZ5JfyJ2ji6H3Vw1G4XWAfb22wHsZX/V4eERMq
X-Gm-Gg: ASbGnctNFIZ3X0ZrUaFaqjNeYRLpbNUpdXb/eDsaZpyaG95+hmef20RY+ZPsq28xirq
	4K5au3y8rzYDChmn0XxYXXeF6TWu/+bbugsgNxbdIgcDxXmjUCjIELz2DeqybKLZAfiRIN6gmOc
	cum96ELQNYvLejJwab4ajQdhahmQjPKzCkbBBBGv9cu+adKGvAEHJe447z59x48XYgAKxWQC0UC
	vp03HouXhKh9N4bh8Mlhg5+7DshuclqG9jFu8qR4QLyTLhhb+UkhWQ/Xru+EeBfms0FjfKVw0Xu
	nVvk+XO/hjRezvxYdMpBWL8eQPkAKJidYotrpLR73A7N9D7VJT1XicgVt3WRAc9yLX+odkR1dw0
	vgoEf/0K8AFMu3dwArg0LSsIASPDU04KG5lbZMRXZTgVp2EZndoFONAw1eXCUfiBCJsefa506zf
	pVoRUAML8=
X-Google-Smtp-Source: AGHT+IEEmYPvHXD/1GaBM0T48zfd0bHyE1BQO9tVpVf2qvxRGanElD1UBTD4a/VVOvfsMgw8C8+/5w==
X-Received: by 2002:a05:6300:210f:b0:341:84ee:7597 with SMTP id adf61e73a8af0-348cc2db7afmr20230517637.47.1762257241996;
        Tue, 04 Nov 2025 03:54:01 -0800 (PST)
Received: from EBJ9932692.tcent.cn ([124.156.216.125])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f765f148sm2215372a12.24.2025.11.04.03.53.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Nov 2025 03:54:01 -0800 (PST)
From: Lance Yang <ioworker0@gmail.com>
To: catalin.marinas@arm.com
Cc: Aishwarya.TCV@arm.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	david@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	will@kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH] mm/huge_memory: Initialise the tags of the huge zero
Date: Tue,  4 Nov 2025 19:53:53 +0800
Message-ID: <20251104115353.98851-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aQi8dA_QpXM8XqrE@arm.com>
References: <aQi8dA_QpXM8XqrE@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_035403_274531_8046778D 
X-CRM114-Status: GOOD (  31.08  )
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

From: Lance Yang <lance.yang@linux.dev>


On Mon, 3 Nov 2025 14:30:12 +0000, Catalin Marinas wrote:
> On Mon, Nov 03, 2025 at 01:32:42PM +0000, Mark Brown wrote:
> > On Fri, Oct 31, 2025 at 04:57:50PM +0000, Catalin Marinas wrote:
> > 
> > > On arm64 with MTE enabled, a page mapped as Normal Tagged (PROT_MTE) in
> > > user space will need to have its allocation tags initialised. This is
> > > normally done in the arm64 set_pte_at() after checking the memory
> > > attributes. Such page is also marked with the PG_mte_tagged flag to
> > > avoid subsequent clearing. Since this relies on having a struct page,
> > > pte_special() mappings are ignored.
> > 
> > We are seeing breakage in userspace on a range of arm64 platforms which
> > bisects to this commit in -next.  We see traces like:
> > 
> > [   59.746701] Internal error: Oops - Undefined instruction: 0000000002000000 [#1]  SMP
> > 
> > ...
> > 
> > [   59.819007] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [   59.826055] pc : mte_zero_clear_page_tags+0x1c/0x40
> > [   59.830980] lr : tag_clear_highpage+0x68/0x118
> > 
> > ...
> > 
> > [   59.911874] Call trace:
> > [   59.914333]  mte_zero_clear_page_tags+0x1c/0x40 (P)
> > [   59.919278]  get_page_from_freelist+0x1a60/0x1c80
> > [   59.924042]  __alloc_frozen_pages_noprof+0x178/0xd20
> > [   59.929068]  alloc_pages_mpol+0xb4/0x1a4
> > [   59.933022]  alloc_frozen_pages_noprof+0x48/0xc0
> > [   59.937683]  folio_alloc_noprof+0x14/0x68
> > [   59.941718]  mm_get_huge_zero_folio+0xf4/0x30c
> > [   59.946200]  do_huge_pmd_anonymous_page+0x278/0x6a0
> > [   59.951119]  __handle_mm_fault+0x700/0x1834
> > [   59.955332]  handle_mm_fault+0x8c/0x2a0
> > [   59.959190]  do_page_fault+0x108/0x75c
> > [   59.962964]  do_translation_fault+0x5c/0x6c
> > [   59.967181]  do_mem_abort+0x40/0x90
> 
> Thanks for the report. I missed the fact that the arch
> mte_zero_clear_page_tags() arch code issues MTE instructions
> irrespective of whether the hardware supports it. We got away with this
> so far since we check the VM_MTE flag and that's only set if the
> hardware supports MTE.
> 
> > Looking at the codes:
> > 
> > > -       zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO) & ~__GFP_MOVABLE,
> > > +       zero_folio = folio_alloc((GFP_TRANSHUGE | __GFP_ZERO | __GFP_ZEROTAGS) &
> > > +                                ~__GFP_MOVABLE,
> > >                         HPAGE_PMD_ORDER);
> > 
> > This adds an unonditional __GFP_ZEROTAGS - from a quick scan it looks
> > like this was previously only enabled by vma_alloc_zeroed_movable_folio()
> > when the VMA has VM_MTE, I think we need a similar test here.
> 
> We can't do this for the huge zero page since this will be shared by
> other vmas and not all would have VM_MTE set. I'll fix it in the arch
> code:
> 
> -----------8<---------------------------------------------
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index d816ff44faff..125dfa6c613b 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -969,6 +969,16 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>  
>  void tag_clear_highpage(struct page *page)
>  {
> +	/*
> +	 * Check if MTE is supported and fall back to clear_highpage().
> +	 * get_huge_zero_folio() unconditionally passes __GFP_ZEROTAGS and
> +	 * post_alloc_hook() will invoke tag_clear_highpage().
> +	 */
> +	if (!system_supports_mte()) {
> +		clear_highpage(page);
> +		return;
> +	}
> +
>  	/* Newly allocated page, shouldn't have been tagged yet */
>  	WARN_ON_ONCE(!try_page_mte_tagging(page));
>  	mte_zero_clear_page_tags(page_address(page));
> ------------------8<------------------------------------------
> 
> Testing now.
> 

Good catch! LGTM, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>


