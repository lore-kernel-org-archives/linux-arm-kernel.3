Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8F3EF06E1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoJGcHFv/oYgr8ufHtoFHRJgFzkCO5vheTSp69h1m2U=; b=w9VnrJI/KJ7gEq3cvcqLjd5iJo
	r53S9pRKHKbcvia4mgsuyLf3tUZ7hbAQJHmvECRVWGgpezcYhv+PAjs8XjfZMzMUbIRKHsoAm98is
	30zyvPdi8mqIseuv3+r7XdrW+9BFLMUcldTD+J7i1w1o+ByYUhCAFyZfcKcACOVb3JemLQcwwNUfA
	6Dm83gFwcgpGRpmh7ZiLIuwpFeFAxUS6byk8GGK4XvohztmepwktUccH162GZjmOVWq3HW+csI8AE
	oHrqMD++Mslsqyp4IDgc4XKOhMnsu77GEJBINarBQKim+PWnpQwoG5/Ae7Cik/xMlDKc0RZm/Ytt4
	huAhMsqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp9q2-0000000DYxo-0xFo;
	Sun, 08 Feb 2026 18:48:54 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vp9py-0000000DYxT-31eC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 18:48:52 +0000
Message-ID: <8d17a56c-63b5-4d5c-836c-dfc150dcbfc8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770576526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hoJGcHFv/oYgr8ufHtoFHRJgFzkCO5vheTSp69h1m2U=;
	b=AS1C9oKMelaYyhQD/dVCPvXRT8zQHMc4yG3Ce9ZPm/JO/DpKkhVEVb/nvOEts836Fi23oE
	hXkTg4vKtFXjbnjq7JNZLi0ed3+MwcpyQRP2R7jL3YmsJbp7WT8OBzhANfW5MpEM5UJ6e1
	ksSPr9TGlawPOVBXz0zhLOJAg8eE5p8=
Date: Mon, 9 Feb 2026 02:48:41 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] irqchip/gic-v3-its: Limit number of per-device MSIs to
 the range the ITS supports
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Gleixner <tglx@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 stable@vger.kernel.org
References: <20260206154816.3582887-1-maz@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260206154816.3582887-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_104850_984678_DE14B65A 
X-CRM114-Status: GOOD (  18.26  )
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

On 2/6/26 11:48 PM, Marc Zyngier wrote:
> The ITS driver blindly assumes that EventIDs are in abundant supply,
> to the point where it never checks how many the HW actually supports.
> 
> It turns out that some pretty esoteric integrations make it so that
> only a few bits are available, all the way down to a. single. bit.
> 
> Enforce the advertised limitation at the point of allocating the
> device structure, and hope that the endpoint driver can deal with
> such limitation.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>  drivers/irqchip/irq-gic-v3-its.c   | 4 ++++
>  include/linux/irqchip/arm-gic-v3.h | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 2988def30972b..a51e8e6a81819 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3475,6 +3475,7 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
>  	int lpi_base;
>  	int nr_lpis;
>  	int nr_ites;
> +	int id_bits;
>  	int sz;
>  
>  	if (!its_alloc_device_table(its, dev_id))
> @@ -3486,7 +3487,10 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
>  	/*
>  	 * Even if the device wants a single LPI, the ITT must be
>  	 * sized as a power of two (and you need at least one bit...).
> +	 * Also honor the ITS's own EID limit.
>  	 */
> +	id_bits = FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
> +	nvecs = min_t(unsigned int, nvecs, BIT(id_bits));
>  	nr_ites = max(2, nvecs);
>  	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
>  	sz = max(sz, ITS_ITT_ALIGN);
> diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
> index 70c0948f978eb..0225121f30138 100644
> --- a/include/linux/irqchip/arm-gic-v3.h
> +++ b/include/linux/irqchip/arm-gic-v3.h
> @@ -394,6 +394,7 @@
>  #define GITS_TYPER_VLPIS		(1UL << 1)
>  #define GITS_TYPER_ITT_ENTRY_SIZE_SHIFT	4
>  #define GITS_TYPER_ITT_ENTRY_SIZE	GENMASK_ULL(7, 4)
> +#define GITS_TYPER_IDBITS		GENMASK_ULL(12, 8)
>  #define GITS_TYPER_IDBITS_SHIFT		8
>  #define GITS_TYPER_DEVBITS_SHIFT	13
>  #define GITS_TYPER_DEVBITS		GENMASK_ULL(17, 13)

Reviewed-by: Zenghui Yu <zenghui.yu@linux.dev>

Thanks,
Zenghui

