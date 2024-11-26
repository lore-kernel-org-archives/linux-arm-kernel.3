Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3344D5A6DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 06:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0HFEsuDlWi/Eg7oXAgpA2QS7cQzjnu66xyyAT+NukA=; b=iUqI93uP99oLkw4Irkm5q3PA1I
	v8qL1vKFKnrKiHDWlODdGi51/Z8tTNgR+qqrVFuei/8uyg09zUeeh0pZPQgBK/r1+BBCGCt+/dpr3
	suZaugKdYL/dQ0v8Rpr2PgM1nP3B/qyHRgUs2c1iU3YfNghnId+3xTfdE7qoOmNPyWlUJf/V2FB5h
	GkbNRi84ULFpWMWlGVIfV+8B3wVVRM3C+HNmi79F4QnYUg/VgTlsYwC1WnTWLK4+3YOb/Jux3fI7Y
	iR3w+VutLoQUhxqb2OOkSn7DBfSFZfpxFy9NFHK5FeIUImWj4mPiATU+c4vPTjNnRmwoVohc7kUKS
	tlElSwEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFp3l-00000009kWN-0ALu;
	Tue, 26 Nov 2024 06:28:29 +0000
Received: from guitar.tkos.co.il ([84.110.109.230] helo=mail.tkos.co.il)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFp2l-00000009kJm-0Zo6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 06:27:29 +0000
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id EE487441037;
	Tue, 26 Nov 2024 08:23:33 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1732602214;
	bh=udoK2qW83uXeBOCAIZ44JnfDHyuvD0+EsOfZ541mR6E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=vM8eFXd3nNwLJ8ZpNyfsru415A8oDTaFWKjBfHADSHIC+BTsvqynp6XC+UaDS/dJy
	 ey/oagwRLiTq6cR2MpOXLS52XKovgga+T091fC60LrKZ3E1U3qRJxmraIAvFsTOCfo
	 //7yf4kC08/45gHQvQ2PjRHoznOZRbez0YJyZjcI/hjVVqh3FrGqF+r5f0PL1VV4gD
	 vVuezGRLbsqheA/zG/36tLjijOKXpDOqjka2wjPMf5vz3xOttWOtYNbuRv4Zqp+evU
	 Tde2QbddyL3b14tZzttIilm0a1RddJnazsQRMmtBFntdLjaUWGMn/Y0IwXALs3sIkj
	 2Wrod0Wmq6LYw==
From: Baruch Siach <baruch@tkos.co.il>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com,  will@kernel.org,  ptesarik@suse.com,
  hch@lst.de,  jiangyutang@os.amperecomputing.com,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: fix zone_dma_limit calculation
In-Reply-To: <20241125171650.77424-1-yang@os.amperecomputing.com> (Yang Shi's
	message of "Mon, 25 Nov 2024 09:16:50 -0800")
References: <20241125171650.77424-1-yang@os.amperecomputing.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 26 Nov 2024 08:27:19 +0200
Message-ID: <87ttbu8q7s.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_222727_887926_BBE06581 
X-CRM114-Status: GOOD (  20.04  )
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

Hi Yang,

On Mon, Nov 25 2024, Yang Shi wrote:
> The commit ba0fb44aed47 ("dma-mapping: replace zone_dma_bits by
> zone_dma_limit") changed how zone_dma_limit was calculated.  Now it
> returns the memsize limit in IORT or device tree instead of U32_MAX if
> the memsize limit is greater than U32_MAX.

Can you give a concrete example of memory layout and dma-ranges that
demonstrates this issue?

> This resulted in DMA allocations may use GFP_DMA even though the devices
> don't require it.  It caused regression on our two sockets systems due
> to excessive remote memory access.

That is, DMA zone used to cover all memory before commit ba0fb44aed47,
but now DMA zone is limited to the smallest dma-ranges. Is that correct?

Thanks,
baruch

> Fixes: ba0fb44aed47 ("dma-mapping: replace zone_dma_bits by zone_dma_limit")
> Cc: <stable@vger.kernel.org>    [6.12+]
> Reported-by: Yutang Jiang <jiangyutang@os.amperecomputing.com>
> Tested-by: Yutang Jiang <jiangyutang@os.amperecomputing.com>
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/mm/init.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index d21f67d67cf5..ccdef53872a0 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -117,15 +117,6 @@ static void __init arch_reserve_crashkernel(void)
>  
>  static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
>  {
> -	/**
> -	 * Information we get from firmware (e.g. DT dma-ranges) describe DMA
> -	 * bus constraints. Devices using DMA might have their own limitations.
> -	 * Some of them rely on DMA zone in low 32-bit memory. Keep low RAM
> -	 * DMA zone on platforms that have RAM there.
> -	 */
> -	if (memblock_start_of_DRAM() < U32_MAX)
> -		zone_limit = min(zone_limit, U32_MAX);
> -
>  	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
>  }
>  
> @@ -141,6 +132,14 @@ static void __init zone_sizes_init(void)
>  	acpi_zone_dma_limit = acpi_iort_dma_get_max_cpu_address();
>  	dt_zone_dma_limit = of_dma_get_max_cpu_address(NULL);
>  	zone_dma_limit = min(dt_zone_dma_limit, acpi_zone_dma_limit);
> +	/*
> +	 * Information we get from firmware (e.g. DT dma-ranges) describe DMA
> +	 * bus constraints. Devices using DMA might have their own limitations.
> +	 * Some of them rely on DMA zone in low 32-bit memory. Keep low RAM
> +	 * DMA zone on platforms that have RAM there.
> +	 */
> +	if (memblock_start_of_DRAM() < U32_MAX)
> +		zone_dma_limit = min(zone_dma_limit, U32_MAX);
>  	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
>  	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
>  #endif

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

