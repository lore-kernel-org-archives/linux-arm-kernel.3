Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0B5CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwKQpCHKFhcaUaYAWcgeYUDcs0tyuQzK5tp06tZh3no=; b=FLt0KGTlLFv/qWqZa8UbPZwjR3
	NpcDo2gSeXnzfeG8Ez84GNJti36tHdFXhcaRllXfsqC4wqlnJC71qZ3rKdEkDgvNqdjxTZcJ9retC
	6DP9mY3q51lZ0z6PZBpGrXcHV2+dABSmys8KVA95MUgapdQhgl0HjjpHofdBTAGCrSAimXVmBJ9my
	wtf55lJs3ItUBXQUuEC6BqF1I1tY8G7rx9lomjIedQKlqBIJc+M0YOPPhkfek2CXd7whXNN7agy0z
	iXsSraJGRCl8rrmLARauWXInFdZ6zxETCs/H0xBlVi8GLfnoUPKc7LYkJTCdYdGd97vTbKBW224wF
	HuEyo4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7z8-0000000659j-1YHD;
	Fri, 09 Oct 2026 10:37:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7z5-0000000658v-2qwa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:37:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6137A1570;
	Fri,  9 Oct 2026 03:37:45 -0700 (PDT)
Received: from [10.0.152.148] (e121487-lin.cambridge.arm.com [10.0.152.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B9F73F66F;
	Fri,  9 Oct 2026 03:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791542268; bh=P0YngHHkpFDgj6eBIszFEX3wwImCVB5t7vQvhGgdx5E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GLjhLkKXIELjuG7JmuuJLI97v3hzk5qGmYuRebJqkBCc6UKPs7S3kgVDZHvptf8o6
	 o7yVoaozrCuy5ffdQTnj2w5BoRh2+BgiTNC2vHaOWtGJnPh3mMR5tipZGTMu+kxjqd
	 wzGXL+5f1hwhkpuTSII5bHSnANQV0W9ooZapKI1U=
Message-ID: <c53b373b-9f70-42f0-affc-6978f0508b87@arm.com>
Date: Fri, 9 Oct 2026 11:37:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: entry: drop the unused tmp2 argument of
 mte_set_kernel_gcr()
To: Bradley Morgan <brads@mainlining.org>, catalin.marinas@arm.com,
 will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261007185512.2.mte-tmp2@mainlining.org>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261007185512.2.mte-tmp2@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_033751_774040_2AF47FAF 
X-CRM114-Status: GOOD (  16.21  )
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

On 10/7/26 18:45, Bradley Morgan wrote:
> mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
> used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
> commit 82868247897b ("arm64: kasan: mte: use a constant kernel
> GCR_EL1 value") swapped that for
> 
>     mov     \tmp, KERNEL_GCR_EL1
> 
> and tmp2 stayed in the declaration and in the one caller, which
> passes x23 for it.
> 
> Drop it, both places.
> 
> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> ---
> Resending, the first send's body got mangled.
> 
>  arch/arm64/kernel/entry.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
> index f63049ac32dc..c3106dee61e1 100644
> --- a/arch/arm64/kernel/entry.S
> +++ b/arch/arm64/kernel/entry.S
> @@ -171,7 +171,7 @@ alternative_else_nop_endif
>  #endif
>  	.endm
>  
> -	.macro mte_set_kernel_gcr, tmp, tmp2
> +	.macro mte_set_kernel_gcr, tmp
>  #ifdef CONFIG_KASAN_HW_TAGS
>  alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
>  	b	1f
> @@ -258,7 +258,7 @@ alternative_else_nop_endif
>  
>  	apply_ssbd 1, x22, x23
>  
> -	mte_set_kernel_gcr x22, x23
> +	mte_set_kernel_gcr x22
>  
>  	/*
>  	 * Any non-self-synchronizing system register updates required for
> -- 2.53.0
> 

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

