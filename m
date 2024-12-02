Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D088AD7830F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBij3S2Db6TpeAasi6u+D2Un+7FBH6xbpvP+21jQAU0=; b=ecp0Yn+HAVFLIOX7qet3VR9Mr7
	NFb7s+vw9hK+ETn9cGvKZ+QAdS9GGw+2pE0/Xxntrngk+CigmpIgj2ydcTaDQcAlgAku3yQJ6i2aV
	574FFR/8EhuueRvj2JuN5Wz5AbfvtGfBPj4FdpPjThTEtsQ40E/XWBDVRbVdWUiGZMJzOo1HU4P9l
	+JbZeCKVvPrfibZgBmVOmaEcdes84Rn4pDgA+pQ8NmqNWzPDalUT6fJ4bmAQ15gdDqfjlXgTHSJV8
	cl6VkBA9sJIk+UB89Nb3Jkig9x8sVmxpeSety4XWpCiEJQ/li7h961aT1gWxhbMhgyBE4UevLYXLf
	MQqI0s+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4ni-00000005wZ1-31BH;
	Mon, 02 Dec 2024 11:41:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4lE-00000005w1w-18vt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:38:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF6E91063;
	Mon,  2 Dec 2024 03:39:05 -0800 (PST)
Received: from [10.57.93.76] (unknown [10.57.93.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 183063F71E;
	Mon,  2 Dec 2024 03:38:35 -0800 (PST)
Message-ID: <3050a0b3-95f6-48aa-8850-e921bd848f85@arm.com>
Date: Mon, 2 Dec 2024 11:38:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Drop INIT_MM_CONTEXT()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org
References: <20241202043553.29592-1-anshuman.khandual@arm.com>
Content-Language: en-GB
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241202043553.29592-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_033840_360174_69E75233 
X-CRM114-Status: GOOD (  14.54  )
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

On 02/12/2024 04:35, Anshuman Khandual wrote:
> Platform override for INIT_MM_CONTEXT() is redundant because swapper_pg_dir
> always gets assigned as the pgd during init_mm initialization. So just drop
> this override on arm64.
> 
> Originally this override was added via the 'commit 2b5548b68199 ("arm64/mm:
> Separate boot-time page tables from swapper_pg_dir")' because non standard
> init_pg_dir was assigned as the pgd. Subsequently it was changed as default
> swapper_pg_dir by the 'commit ba5b0333a847 ("arm64: mm: omit redundant
> remap of kernel image")', which might have also just dropped this override.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
> This patch applies on v6.13-rc1
> 
>  arch/arm64/include/asm/mmu.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 2ec96d91acc6..662471cfc536 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -109,8 +109,5 @@ static inline bool kaslr_requires_kpti(void)
>  	return true;
>  }
>  
> -#define INIT_MM_CONTEXT(name)	\
> -	.pgd = swapper_pg_dir,
> -
>  #endif	/* !__ASSEMBLY__ */
>  #endif


