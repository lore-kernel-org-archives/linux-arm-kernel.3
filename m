Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFCBEE20B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 16:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8ZxvKqgcRl77EMB3Z+WNqFFj5eaixRZwWVfZtLwmSU=; b=rD4phNtXiHU1n+Y7BDHCmYDpsB
	INnEUau8/BCkOvOjA0GMjJpcdf4AE7TmNnAdl4HdGLBmkGhwIFisq8pd/yptTS2QXDcwSrgP+xd4a
	G/3/ZT/jCkEuGyxz601Q66JoWcXCBT9ZWwHL9tkbaDhSqz7ZKCYEYMp7ZQxcfWv9YXlPUwWHjkk+5
	5Xevh8rI/ibf0cmbH99bHrAfp/ljF6aY/rcbj99q9r/Fynu5Bbmy/MSnQMeJDOfIbBPhy5VPd5fgz
	ARB8xQ0hkA7nE8adRvAnBxRfuMvphpai0ole8Dv394li+mwCD249zHnNyGD1SCx4bN/6Ds1r9IvnE
	RiPP0eHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOH8-0000000BXGm-1xuG;
	Fri, 06 Feb 2026 16:01:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voOH5-0000000BXGC-2v7Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 16:01:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42C58339;
	Fri,  6 Feb 2026 08:01:29 -0800 (PST)
Received: from [10.57.54.83] (unknown [10.57.54.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C36A3F632;
	Fri,  6 Feb 2026 08:01:34 -0800 (PST)
Message-ID: <ea381264-5f8b-403d-85da-57a15ca944e5@arm.com>
Date: Fri, 6 Feb 2026 16:01:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/gic-v3-its: Limit number of per-device MSIs to
 the range the ITS supports
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@kernel.org>, stable@vger.kernel.org
References: <20260206154816.3582887-1-maz@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260206154816.3582887-1-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_080139_814947_84746D01 
X-CRM114-Status: GOOD (  17.51  )
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

On 2026-02-06 3:48 pm, Marc Zyngier wrote:
> The ITS driver blindly assumes that EventIDs are in abundant supply,
> to the point where it never checks how many the HW actually supports.
> 
> It turns out that some pretty esoteric integrations make it so that
> only a few bits are available, all the way down to a. single. bit.
> 
> Enforce the advertised limitation at the point of allocating the
> device structure, and hope that the endpoint driver can deal with
> such limitation.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Cc: stable@vger.kernel.org
> ---
>   drivers/irqchip/irq-gic-v3-its.c   | 4 ++++
>   include/linux/irqchip/arm-gic-v3.h | 1 +
>   2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 2988def30972b..a51e8e6a81819 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3475,6 +3475,7 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
>   	int lpi_base;
>   	int nr_lpis;
>   	int nr_ites;
> +	int id_bits;
>   	int sz;
>   
>   	if (!its_alloc_device_table(its, dev_id))
> @@ -3486,7 +3487,10 @@ static struct its_device *its_create_device(struct its_node *its, u32 dev_id,
>   	/*
>   	 * Even if the device wants a single LPI, the ITT must be
>   	 * sized as a power of two (and you need at least one bit...).
> +	 * Also honor the ITS's own EID limit.
>   	 */
> +	id_bits = FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
> +	nvecs = min_t(unsigned int, nvecs, BIT(id_bits));
>   	nr_ites = max(2, nvecs);
>   	sz = nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1);
>   	sz = max(sz, ITS_ITT_ALIGN);
> diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
> index 70c0948f978eb..0225121f30138 100644
> --- a/include/linux/irqchip/arm-gic-v3.h
> +++ b/include/linux/irqchip/arm-gic-v3.h
> @@ -394,6 +394,7 @@
>   #define GITS_TYPER_VLPIS		(1UL << 1)
>   #define GITS_TYPER_ITT_ENTRY_SIZE_SHIFT	4
>   #define GITS_TYPER_ITT_ENTRY_SIZE	GENMASK_ULL(7, 4)
> +#define GITS_TYPER_IDBITS		GENMASK_ULL(12, 8)
>   #define GITS_TYPER_IDBITS_SHIFT		8
>   #define GITS_TYPER_DEVBITS_SHIFT	13
>   #define GITS_TYPER_DEVBITS		GENMASK_ULL(17, 13)


