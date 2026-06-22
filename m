Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5F6CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgvQzYjbMrpc1MMyior1P3ZPdYtIuPkBiGx7cWNFLN4=; b=L/bBT+kv8JLrwrlZi4h9d3E3+s
	MC070fwrTrzLm4JKCB/m1y1dX5mRbI4E2O1+UKd4qgW7nHkty/CxfvVDIzGNSswR8VkPD4LAJA7B5
	PIEkpV3++OaJauk3h0cKODGW+mN5Ls0ev/1B7wOJJnlOXeNScRd9GDdZnzMO+6DoU1pnvuHYg68N3
	HqjGo7PGz6oVVLSCWexuk0qsJrQYftzRt6Rp1ecouQMFa9K0UY9PSbiHZgz6Tc/xxDcqDuRn4bWEo
	L7rmgup7RTRPFhEVKqD3gDIsn2kt/hEZLRS6fSlArWRpVa/jGtGWlwPv9jFRGZ6cVEnSSuFg4V/hB
	mYF6Pjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeVh-000000050hZ-432h;
	Mon, 22 Jun 2026 13:16:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeVg-000000050hL-2tFZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 13:16:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75BB5601F6;
	Mon, 22 Jun 2026 13:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC02A1F00A3E;
	Mon, 22 Jun 2026 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782134179;
	bh=lgvQzYjbMrpc1MMyior1P3ZPdYtIuPkBiGx7cWNFLN4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LVFFHQd1hVV3xyaHdbvqy1IUptTyefGIMhFmpKHheR2hHi6h8Pupkh+49sWuI7kTB
	 PRd5VH4p0hJ8/a+656aexGPb9vnMnVEhMzYMigNWoV/vj/BFqdF/hmRFySwJJcj+ix
	 TxzLge8swBRCE3yYyAyZ7mSR16RlNyj6gb04oPEb02rgmljsIcP3fU+hgoQLycwk7y
	 38rtzXCtQk/nPDAW1c+OaHFUfiOotUYFisfnzyk46xCBG3mSBC6r97s9nCD0U40zNa
	 tQEOsfzjDo5uayhGH/KCENJxRX+DngaoamEa08AwIJ0JlqEVCOaNIE+BbmJJPHEUoj
	 eDeFxlZqAgW/Q==
Message-ID: <e334c595-92ab-4eb9-a096-35602d57ae6d@kernel.org>
Date: Mon, 22 Jun 2026 15:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v8 04/24] arm64: Introduce por_elx_set_pkey_perms()
 helper
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-hardening@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>,
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org, Lorenzo Stoakes <ljs@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
 <20260526-kpkeys-v8-4-eaaacdacc67c@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260526-kpkeys-v8-4-eaaacdacc67c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 5/26/26 13:15, Kevin Brodsky wrote:
> Introduce a helper that sets the permissions of a given pkey
> (POIndex) in the POR_ELx format, and make use of it in
> arch_set_user_pkey_access().
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/por.h |  7 +++++++
>  arch/arm64/mm/mmu.c          | 26 ++++++++++----------------
>  2 files changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
> index d913d5b529e4..bffb4d2b1246 100644
> --- a/arch/arm64/include/asm/por.h
> +++ b/arch/arm64/include/asm/por.h
> @@ -31,4 +31,11 @@ static inline bool por_elx_allows_exec(u64 por, u8 pkey)
>  	return perm & POE_X;
>  }
>  
> +static inline u64 por_elx_set_pkey_perms(u64 por, u8 pkey, u64 perms)
> +{
> +	u64 shift = POR_ELx_PERM_SHIFT(pkey);
> +
> +	return (por & ~(POE_MASK << shift)) | (perms << shift);
> +}
> +
>  #endif /* _ASM_ARM64_POR_H */
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index dd85e093ffdb..493310cf0486 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -2339,8 +2339,8 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
>  #ifdef CONFIG_ARCH_HAS_PKEYS
>  int arch_set_user_pkey_access(int pkey, unsigned long init_val)
>  {
> -	u64 new_por;
> -	u64 old_por;
> +	u64 new_perms;

You should spell out the renaming of the variable.

Given that perms is 4bit per key, should we use a u8 for it instead?

> +	u64 por;
>  
>  	if (!system_supports_poe())
>  		return -ENOSPC;
> @@ -2354,25 +2354,19 @@ int arch_set_user_pkey_access(int pkey, unsigned long init_val)
>  		return -EINVAL;
>  
>  	/* Set the bits we need in POR:  */
> -	new_por = POE_RWX;
> +	new_perms = POE_RWX;
>  	if (init_val & PKEY_DISABLE_WRITE)
> -		new_por &= ~POE_W;
> +		new_perms &= ~POE_W;
>  	if (init_val & PKEY_DISABLE_ACCESS)
> -		new_por &= ~POE_RW;
> +		new_perms &= ~POE_RW;
>  	if (init_val & PKEY_DISABLE_READ)
> -		new_por &= ~POE_R;
> +		new_perms &= ~POE_R;
>  	if (init_val & PKEY_DISABLE_EXECUTE)
> -		new_por &= ~POE_X;
> +		new_perms &= ~POE_X;
>  
> -	/* Shift the bits in to the correct place in POR for pkey: */
> -	new_por = POR_ELx_PERM_PREP(pkey, new_por);
> -
> -	/* Get old POR and mask off any old bits in place: */
> -	old_por = read_sysreg_s(SYS_POR_EL0);
> -	old_por &= ~(POE_MASK << POR_ELx_PERM_SHIFT(pkey));
> -
> -	/* Write old part along with new part: */
> -	write_sysreg_s(old_por | new_por, SYS_POR_EL0);
> +	por = read_sysreg_s(SYS_POR_EL0);
> +	por = por_elx_set_pkey_perms(por, pkey, new_perms);
> +	write_sysreg_s(por, SYS_POR_EL0);

Was wondering whether to move reading+writing of the register into the same
helper, but you cannot reuse this exactly the same way for SYS_POR_EL1 as it seems.

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David

