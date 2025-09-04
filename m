Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA0BCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaUu8yXIfUVX4+XiuOu2bdl7lNOKQ5Py35yboYhpyqE=; b=z/PiTKGCL5UWqvnicSiqqJ7ABt
	YM6BCpLJ/svE1L4ugXPpcoipWMQIFA8VD7O8tHrs4mjm52kbPZX0uA9a8iEOsZAMcfyKy438mhVw8
	I/WIpQEcFp4CPuXBwYT8DlJTLQuFzX9jl0aqwfvqFqaBbRXf375lxBT5sRzV7gIQV3MkRXB9vuHP4
	85bXMWTmns4St/i9EXsa7vV5SfJcRsbCiA4BWP31at1As/tKNI0gAZz2ZC7V1hRTVJT3EoJt4QBpv
	ph1PIZ4h7M07GhWymSZaQpgOtvjomRXG0Pyd5H4HJ3LwS20E7TPg+Ogxe0GW3K7QZ3tvVo6J7zNzU
	Fvd7oabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCl6-0000000CqMt-3125;
	Thu, 04 Sep 2025 16:24:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8Ul-0000000BMZ2-2ujD;
	Thu, 04 Sep 2025 11:51:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B905860212;
	Thu,  4 Sep 2025 11:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 620D2C4CEF0;
	Thu,  4 Sep 2025 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756986674;
	bh=ayu+VFEFtlDXiKEZkYUc99UQyXAFV18iajSKbdBa3uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ONZrZBBCpuGwxh7arUAFmUebG80sJLxBC4MYYjuLVToYlzCW6RgNeQ07liMrV5F0N
	 s/GiABu8diRs9Wt/8jy4v4GdTRk7UaVeB2bU3bZzobOKQryEy6GqMFzq3t2S1nPhmy
	 MYYXXmjZa+R/jKyVAYEHCunJx2vEG8gVEeWMRqTlPy2r3VPODqu98SYt3INH8q6udv
	 shoDQchLJ25xZPDhxEmUrOQCrsuE8Ft+HRhKOkDAURhrzQw8cQ9kMaWmoI2beur7nq
	 TLvA7seUnmO3BltYWiXoiXISFP+iXNO3ejHGJ8SKbLXn7BVURmvpmM9/uaf0fTxflh
	 /lCPuv3tqRbcA==
Date: Thu, 4 Sep 2025 14:51:06 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 3/7] x86: Stop calling page_address() in free_pages()
Message-ID: <aLl9KneqOYTujcCh@kernel.org>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-4-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903185921.1785167-4-vishal.moola@gmail.com>
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

On Wed, Sep 03, 2025 at 11:59:17AM -0700, Vishal Moola (Oracle) wrote:
> free_pages() should be used when we only have a virtual address. We
> should call __free_pages() directly on our page instead.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---
>  arch/x86/mm/init_64.c          | 2 +-
>  arch/x86/platform/efi/memmap.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index b9426fce5f3e..0e4270e20fad 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1031,7 +1031,7 @@ static void __meminit free_pagetable(struct page *page, int order)
>  		free_reserved_pages(page, nr_pages);
>  #endif
>  	} else {
> -		free_pages((unsigned long)page_address(page), order);
> +		__free_pages(page, order);
>  	}
>  }
>  
> diff --git a/arch/x86/platform/efi/memmap.c b/arch/x86/platform/efi/memmap.c
> index 061b8ecc71a1..023697c88910 100644
> --- a/arch/x86/platform/efi/memmap.c
> +++ b/arch/x86/platform/efi/memmap.c
> @@ -42,7 +42,7 @@ void __init __efi_memmap_free(u64 phys, unsigned long size, unsigned long flags)
>  		struct page *p = pfn_to_page(PHYS_PFN(phys));
>  		unsigned int order = get_order(size);
>  
> -		free_pages((unsigned long) page_address(p), order);

Could be just free_pages((unsigned long)phys_to_virt(phys), order), then
the page is not needed at all.

> +		__free_pages(p, order);
>  	}
>  }
>  
> -- 
> 2.51.0
> 
> 

-- 
Sincerely yours,
Mike.

