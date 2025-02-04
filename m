Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34E1C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 11:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsrDa9YoA5Nn5RlLQQud6vMRYIzkeKKYbgADSnk1Qfo=; b=ApG/B4VFfLIBzwhXLC6fACXALc
	1MePHXJkV5zitPy6HK9FcHFeVAwFWcnCMxUJGPuh7q9gYZf3ZLHqwTyr9Aj7TneFiw82UkYx83Wla
	6Pp8BXFp6wSOmAuXewl2YqubZenySqXxtJxckdXHd+7/x9W4C7sRmP6quurJfs7KczOPh/Wlogd/I
	GvHL/FW7Wt8mCVGnuON5Qas+4w2t0XWLSZh5kjmBO4dvtdzu7xgy8S0djoUzq9ZmR4NLnaDvywmfs
	4b/i09kSdXYMERq2VIdTZ4GDgEb/TSPU0Zc1Eg2CFrQj1y91HvFK2M3xCwZ1yrrUBO3lbc2UXwEle
	k1cGL+9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHX1-00000000JsF-37jS;
	Tue, 04 Feb 2025 11:55:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHVh-00000000JfL-3Dxp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 11:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 54EAF5C4A07;
	Tue,  4 Feb 2025 11:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57E3C4CEE4;
	Tue,  4 Feb 2025 11:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738670072;
	bh=cT2RxHJJvfh2ykj3Hm8+RhZNJZwL1VMP4Vlog4g2ZdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csyVMxbTBOzapoMihhQvE3yBB8ppc3ebVwM/lxds5TbEb0QskmNEuc5MVFo6Xx+P5
	 GOKGaVz6BDEjZ/op7qMjXlQDHZC4ZANHFYoGmF4fAmyqejfrps2lzmH4uL2R3ZfF3h
	 530fpeFMTxa6u5klDBJ7K8PpMknYVepim2CnzVVrga7vONzOJl7DZIhORsTIchBZBh
	 UjxCk8o65nAOIhrYdYArgTKr370ez30ggERV9Gx5ezQvtxHHLk3H2uxcRM0Tbb9nqi
	 dcv4lN+OIJuQkx38F6IUBGMSX7u8RoAPeIdGog3AzZusfSP49GoSHYB9HsCU6MqDk4
	 hCCLR03KTdAwg==
Date: Tue, 4 Feb 2025 11:54:28 +0000
From: Will Deacon <will@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Handle .ARM.attributes section in linker scripts
Message-ID: <20250204115427.GE893@willie-the-truck>
References: <20250124-arm64-handle-arm-attributes-in-linker-script-v1-1-74135b6cf349@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-arm64-handle-arm-attributes-in-linker-script-v1-1-74135b6cf349@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_035433_886792_FBE1717E 
X-CRM114-Status: GOOD (  18.87  )
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

On Fri, Jan 24, 2025 at 06:31:57AM -0700, Nathan Chancellor wrote:
> A recent LLVM commit [1] started generating an .ARM.attributes section
> similar to the one that exists for 32-bit, which results in orphan
> section warnings (or errors if CONFIG_WERROR is enabled) from the linker
> because it is not handled in the arm64 linker scripts.
> 
>   ld.lld: error: arch/arm64/kernel/vdso/vgettimeofday.o:(.ARM.attributes) is being placed in '.ARM.attributes'
>   ld.lld: error: arch/arm64/kernel/vdso/vgetrandom.o:(.ARM.attributes) is being placed in '.ARM.attributes'
> 
>   ld.lld: error: vmlinux.a(lib/vsprintf.o):(.ARM.attributes) is being placed in '.ARM.attributes'
>   ld.lld: error: vmlinux.a(lib/win_minmax.o):(.ARM.attributes) is being placed in '.ARM.attributes'
>   ld.lld: error: vmlinux.a(lib/xarray.o):(.ARM.attributes) is being placed in '.ARM.attributes'
> 
> Add this new section to the necessary linker scripts to resolve the warnings.
> 
> Cc: stable@vger.kernel.org
> Fixes: b3e5d80d0c48 ("arm64/build: Warn on orphan section placement")
> Link: https://github.com/llvm/llvm-project/commit/ee99c4d4845db66c4daa2373352133f4b237c942 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/arm64/kernel/vdso/vdso.lds.S | 1 +
>  arch/arm64/kernel/vmlinux.lds.S   | 1 +
>  2 files changed, 2 insertions(+)

Hmm. I wonder what this new attributes section is for and how it will
co-exist with .note.gnu.property in future? For example, the spec linked
form the above commit:

https://github.com/ARM-software/abi-aa/pull/230

has references to GCS, which I don't think has a corresponding feature
bit for the ELF note (at least, Linux doesn't know about it if it does).

> diff --git a/arch/arm64/kernel/vdso/vdso.lds.S b/arch/arm64/kernel/vdso/vdso.lds.S
> index 4ec32e86a8da..f8418a3a2758 100644
> --- a/arch/arm64/kernel/vdso/vdso.lds.S
> +++ b/arch/arm64/kernel/vdso/vdso.lds.S
> @@ -75,6 +75,7 @@ SECTIONS
>  
>  	DWARF_DEBUG
>  	ELF_DETAILS
> +	.ARM.attributes 0 : { *(.ARM.attributes) }

Let's just add this to the /DISCARD/ section higher up, where we chuck
away .note.gnu.property.

> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index f84c71f04d9e..c94942e9eb46 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -335,6 +335,7 @@ SECTIONS
>  	STABS_DEBUG
>  	DWARF_DEBUG
>  	ELF_DETAILS
> +	.ARM.attributes 0 : { *(.ARM.attributes) }

I think we should discard this too (afaict, RO_DATA() discards
.note.gnu.property via NOTES()).

Will

