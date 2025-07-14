Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27418C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RxpxYJPsgrQItP5VVIYeSSkaLjeffkUAaKKhO4O1nI=; b=TjFJMSCcppEQL5TENcav1Zjzr3
	hgwQ+x6jESs4wsO68AOsN7apPhvDSJ4i/w/tb3ZcYi5vQJCDIpdYqEcuWya8RodDeCWIKs3lTO72g
	jg/uSqmWn1m9uDRF1lBFv/UdvB8zuCh9sL9W24nLyoQcIaqYy3BpV7s4HcHcQTUdYB7sgwc4y8Wtb
	nB21454sDIULPvPsVeH1VsZmbeVc6hzZm80L2lK/FEtrT35AyfLzpS8d4Cx/JsajmBR/5kIn30uIV
	45yLsGzIfl6mWzUE+2quA3qkNYhXzr2fgJq8q+KqZKp+zjEIc9tv9jJOCU4guTWLYoUS9MWc13b8H
	Kz2Ev9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFBA-00000001j4r-2ewV;
	Mon, 14 Jul 2025 09:08:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubF8i-00000001inC-2hB2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:06:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC5E31764;
	Mon, 14 Jul 2025 02:06:14 -0700 (PDT)
Received: from [10.57.83.2] (unknown [10.57.83.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 84CD53F694;
	Mon, 14 Jul 2025 02:06:22 -0700 (PDT)
Message-ID: <663e10b2-5f66-4db1-9e7d-6d7538f5f58a@arm.com>
Date: Mon, 14 Jul 2025 10:06:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] arm64: mm: Simplify __TLBI_RANGE_NUM() macro
Content-Language: en-GB
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
References: <20250711161732.384-1-will@kernel.org>
 <20250711161732.384-7-will@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250711161732.384-7-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_020624_729664_935F7035 
X-CRM114-Status: GOOD (  13.63  )
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

On 11/07/2025 17:17, Will Deacon wrote:
> Since commit e2768b798a19 ("arm64/mm: Modify range-based tlbi to
> decrement scale"), we don't need to clamp the 'pages' argument to fit
> the range for the specified 'scale' as we know that the upper bits will
> have been processed in a prior iteration.
> 
> Drop the clamping and simplify the __TLBI_RANGE_NUM() macro.
> 
> Signed-off-by: Will Deacon <will@kernel.org>

Seems reasonable:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/include/asm/tlbflush.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index ddd77e92b268..a8d21e52ef3a 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -205,11 +205,7 @@ static __always_inline void __tlbi_level(const enum tlbi_op op, u64 addr, u32 le
>   * range.
>   */
>  #define __TLBI_RANGE_NUM(pages, scale)					\
> -	({								\
> -		int __pages = min((pages),				\
> -				  __TLBI_RANGE_PAGES(31, (scale)));	\
> -		(__pages >> (5 * (scale) + 1)) - 1;			\
> -	})
> +	(((pages) >> (5 * (scale) + 1)) - 1)
>  
>  /*
>   *	TLB Invalidation


