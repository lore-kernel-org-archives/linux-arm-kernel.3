Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93184D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FSHAdi8qXXJjWhIdVkFc1e+f+aeG5BUvV35EH1fXOE=; b=ub4Vp5ImNE9mYIaFc3WSbwIw14
	7zyl4wB6IrKUySVC3Xxqf7eq6rige9VnfPl+sytyngZQoq1AzijX3MM+tFNbQm9vsHCVRCiCXgdLP
	8wPRoQZMHR7DHFFdfbNcRCn2QFX0gwcjSPwLkbyUhzg1kfm8l7e8e4XTZW0Spofy7jb5/8c1aIyky
	7gvINexABx6ejUo2/hv9CixSj7HyhYMaw+BIQvFr+7UodEkKC+rUhp+vnETQBXDcJsK5LKt0NMDHD
	aIOX4aKh1IrEyl+dZiIlPiPJ2KOyuVZNBnjomTZHjGVGz3ylSBokSj8fxXThlMjeHyfRbfe15moOL
	xeuHeV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhtI-0000000ED1O-3cLs;
	Tue, 27 Jan 2026 12:09:52 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhtG-0000000ED02-0TCg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:09:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3FSHAdi8qXXJjWhIdVkFc1e+f+aeG5BUvV35EH1fXOE=;
	b=G0/ZLQPgWYWTIakxxFFMnhY6UaMvHtTmD0P5Ah6BaWsBAqAtU48w6TLPgp0Ik+L0xuLn7/S4s
	I3zdeE9PE9+5uIM/WNQTb4OJ8rGIQ/J2lwbmlphR7E4k8NgFcEwVV/1SvgWAq2cfYRWuTjT3ksz
	aM6E7zqk9uhFdG69pjCIoW0=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f0kfr3XNmz1P7JJ;
	Tue, 27 Jan 2026 20:07:16 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0khz27tMzJ46ZP;
	Tue, 27 Jan 2026 20:09:07 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 2DD3140569;
	Tue, 27 Jan 2026 20:09:43 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 12:09:42 +0000
Date: Tue, 27 Jan 2026 12:09:41 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 07/13] arm64: mm: Simplify __TLBI_RANGE_NUM() macro
Message-ID: <20260127120941.00000090@huawei.com>
In-Reply-To: <20260119172202.1681510-8-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-8-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_040950_374703_D923A5B0 
X-CRM114-Status: GOOD (  15.27  )
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

On Mon, 19 Jan 2026 17:21:54 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> From: Will Deacon <will@kernel.org>
> 
> Since commit e2768b798a19 ("arm64/mm: Modify range-based tlbi to
> decrement scale"), we don't need to clamp the 'pages' argument to fit
> the range for the specified 'scale' as we know that the upper bits will
> have been processed in a prior iteration.
> 
> Drop the clamping and simplify the __TLBI_RANGE_NUM() macro.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  arch/arm64/include/asm/tlbflush.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> index a8513b649fe5..cac7768f3483 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -207,11 +207,7 @@ static inline void __tlbi_level(tlbi_op op, u64 addr, u32 level)
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


