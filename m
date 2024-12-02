Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D95D7830F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNoMiiEy4DrUJZ8If85LEN0M8p96fHJ0oT4oIepUtXw=; b=uC0WKHEyCdlEC9Mz+qeVdZVOcw
	CxNABtbU866svrP9B860FnoZdvkc9GiSGSIv2KEJg4eFsRhKJUOAgg8BsJ5xpwNWdx3a0/NzC2aAr
	CviJxWSL73M9BjT7AW323Qc7sjrx9UqXk+UBRv6XXxi2kW4lQD7u+OI/U126y+Pe4AegH1bP8VRo6
	pOFiq0TOLmyHmpIP4WmDg/jTMJvs+eueCeGMVQbno/3fh7CVmQoXSfuvCwQBGixrb9W2lVk6EX1xK
	OGFHH22fuKHBAWUnUIUyUaRKFf3Nz6XvAzJhqIrmU+HJC2Vr0kTSNO1hU+zh4Ha9TkcXVUihEKZdC
	j9gPOGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4pd-00000005wpt-3lMa;
	Mon, 02 Dec 2024 11:43:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4oc-00000005wg9-12Dp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:42:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 972BE1063;
	Mon,  2 Dec 2024 03:42:37 -0800 (PST)
Received: from [10.57.93.76] (unknown [10.57.93.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2A873F71E;
	Mon,  2 Dec 2024 03:42:07 -0800 (PST)
Message-ID: <85b1bf12-54cc-4d17-9aa1-ab496cb04d36@arm.com>
Date: Mon, 2 Dec 2024 11:42:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Replace open encodings with PXD_TABLE_BIT
Content-Language: en-GB
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org
References: <20241202083850.73207-1-anshuman.khandual@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241202083850.73207-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_034210_330507_D36FC8FD 
X-CRM114-Status: GOOD (  12.65  )
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

On 02/12/2024 08:38, Anshuman Khandual wrote:
> [pgd|p4d]_bad() helpers have open encodings for their respective table bits
> which can be replaced with corresponding macros. This makes things clearer,
> thus improving their readability as well.
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
>  arch/arm64/include/asm/pgtable.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 6986345b537a..e20b80229910 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -896,7 +896,7 @@ static inline bool mm_pud_folded(const struct mm_struct *mm)
>  	pr_err("%s:%d: bad pud %016llx.\n", __FILE__, __LINE__, pud_val(e))
>  
>  #define p4d_none(p4d)		(pgtable_l4_enabled() && !p4d_val(p4d))
> -#define p4d_bad(p4d)		(pgtable_l4_enabled() && !(p4d_val(p4d) & 2))
> +#define p4d_bad(p4d)		(pgtable_l4_enabled() && !(p4d_val(p4d) & P4D_TABLE_BIT))
>  #define p4d_present(p4d)	(!p4d_none(p4d))
>  
>  static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
> @@ -1023,7 +1023,7 @@ static inline bool mm_p4d_folded(const struct mm_struct *mm)
>  	pr_err("%s:%d: bad p4d %016llx.\n", __FILE__, __LINE__, p4d_val(e))
>  
>  #define pgd_none(pgd)		(pgtable_l5_enabled() && !pgd_val(pgd))
> -#define pgd_bad(pgd)		(pgtable_l5_enabled() && !(pgd_val(pgd) & 2))
> +#define pgd_bad(pgd)		(pgtable_l5_enabled() && !(pgd_val(pgd) & PGD_TABLE_BIT))
>  #define pgd_present(pgd)	(!pgd_none(pgd))
>  
>  static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)


