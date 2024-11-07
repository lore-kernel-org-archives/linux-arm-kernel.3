Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B66D43341
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dQOg0Sw6qRW7DqW0Bld2bYeslqA3pVZzBKBipoBtkI=; b=UVeUin7sN50wogc/JGgHKAy+XR
	9IepW5wTH3Rr/9T0aVUQox0i3clu5KZRJeswM1amfS/zMGEvpn2gSNiXhYwSZmNLWytFhak5T2unR
	JXVYKgR4eJau9oah5+XgZAQIdb6cW6NRTAdvlgztsad4fir9i6Sh2J49kymVz4VVeWl+bho41tfhj
	FMZ3mEwd7a7SMeyrFLa2iZfdxPjr+fghWR6RO3OKhdl3D6Xeh0KRPMwCtnoCGFkLft4BeN2fElxuq
	xZfsDT5+9+HpCabYxm0A8x2J3McUZmzxLn5okTTvrYsjP+DWtb996LTjm6HY6/m7yiPRj1ujDjjyW
	iRuTolhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Xc-00000006foS-0NMt;
	Thu, 07 Nov 2024 11:19:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90U3-00000006esi-0FFH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 12EAEA43949;
	Thu,  7 Nov 2024 11:13:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11AB4C4CECC;
	Thu,  7 Nov 2024 11:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730978125;
	bh=wbS02V77scOYdGKZZz1iG3AkivFOp7wRJnAr5g/X2r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofwSPZyrIVv2/JfS6YW5WHoUJ1qQFBcQurfF9TymyF/NWJA+WRzcOzh/nFQAgY7er
	 v/jVE9IcDqxQrEpLIWTUQHwlTpX9G5MczYkmMCpZXDqnfF0KxNF7bnj/teErpIws4T
	 UHBWQUChXLhk3D/3VXIW2w3/1voxjX2dzMBPJ4UAvmzZwIcsFDV92Fe+ZlGWJQhARg
	 53PMl5+ICIdM6qg9UNdVJjiZ7CQwQD4SO9avwxwy9zoOkGmrJmF+yCAd36CFuGneiE
	 epKcETNUVi3UZandmbhLNlAT/DSUCT1iJhcsqVPkDVq5OZ0fB2UahGzs4N1jTYSH5a
	 YhLSK+S2MBCMw==
Date: Thu, 7 Nov 2024 11:15:20 +0000
From: Will Deacon <will@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
	linux-kbuild@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
	Ingo Molnar <mingo@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: fix .data.rel.ro size assertion when
 CONFIG_LTO_CLANG
Message-ID: <20241107111519.GA15424@willie-the-truck>
References: <20241106161843.189927-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106161843.189927-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_031527_298389_0FAA7F79 
X-CRM114-Status: GOOD (  16.57  )
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

On Thu, Nov 07, 2024 at 01:18:42AM +0900, Masahiro Yamada wrote:
> Commit be2881824ae9 ("arm64/build: Assert for unwanted sections")
> introduced an assertion to ensure that the .data.rel.ro section does
> not exist.
> 
> However, this check does not work when CONFIG_LTO_CLANG is enabled,
> because .data.rel.ro matches the .data.[0-9a-zA-Z_]* pattern in the
> DATA_MAIN macro.
> 
> Move the ASSERT() above the RW_DATA() line.
> 
> Fixes: be2881824ae9 ("arm64/build: Assert for unwanted sections")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/arm64/kernel/vmlinux.lds.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index 58d89d997d05..f84c71f04d9e 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -287,6 +287,9 @@ SECTIONS
>  	__initdata_end = .;
>  	__init_end = .;
>  
> +	.data.rel.ro : { *(.data.rel.ro) }
> +	ASSERT(SIZEOF(.data.rel.ro) == 0, "Unexpected RELRO detected!")
> +
>  	_data = .;
>  	_sdata = .;
>  	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_ALIGN)
> @@ -343,9 +346,6 @@ SECTIONS
>  		*(.plt) *(.plt.*) *(.iplt) *(.igot .igot.plt)
>  	}
>  	ASSERT(SIZEOF(.plt) == 0, "Unexpected run-time procedure linkages detected!")
> -
> -	.data.rel.ro : { *(.data.rel.ro) }
> -	ASSERT(SIZEOF(.data.rel.ro) == 0, "Unexpected RELRO detected!")
>  }
>  
>  #include "image-vars.h"

Acked-by: Will Deacon <will@kernel.org>

Catalin, please can you pick this up for 6.13?

Will

