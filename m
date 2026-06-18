Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEF1CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 02:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTzc2XaLs1ayXYi9fOKXdA8l/VSZMq+FU1Cy1d7jE+E=; b=2vTXmWUEABZHAFvDH8oz5rT6XM
	QiWn21Jfxzc9gBrNQAYFd9f5ylQp4+Xt6Aqg2X9s/zGPb6egtKMdGS4wG3HC6bjsQzxCO2b3unHyy
	eUiW8qVzZzckex3bJD2c+uC6HM7u/SWZVJ9y1l5yE1KdbhQqqWF52FdjthRue7BOZ3es7ojz+Q2hw
	O2RFztU+UTRIg4YEQj/HvgEipP9V86h1bk2Fnanb3hYUYuo6vREVDwfQqdO5ysjUoANVxd7xRW9Zj
	oSVLVfSWYxvD3XPMbdbA5ACBoB/uGcr6/AViFD9dsR8OGu90wyLE57XkyBsqGE+HNwp9h9hbLLRv+
	5p7dvUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa2tM-00000000XFV-0JLx;
	Thu, 18 Jun 2026 02:54:08 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa2tJ-00000000XEj-0aXa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 02:54:06 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gglfz1VQXz9sqP;
	Thu, 18 Jun 2026 04:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTzc2XaLs1ayXYi9fOKXdA8l/VSZMq+FU1Cy1d7jE+E=;
	b=bpQfephE601H9ixHI6bk9OdkPQ1y3Yf0QbWWLCbZ5bIQP1OzX1uI535gcDIMihS2rXSmxa
	XdeGsYNUas3glXlKlVrzN/4NuyadHg/kjA0KwGeEIK1QbwFVkbK2yEi66vIHjV3QYyfWx7
	SxdTYBskQf3SSkmtgkdeLeq6O3Botmwt1xTdeOtx+vokSmZ7S91SeA8R+vIb0gzeGBwsR5
	HrSlzbHg/Jra2D8N0mGCaxys1Yeo+WBJ9JbQJP+fO3aAzrxRsjxvOzgg8MWczLU45TWl7k
	hyBIslFC8yEzrUn+y9s50V6jqGi/uGzPGBkFiL7mRRq8x0FVYBGPSod7syZi2A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=PYYu9Nfo;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <0935eb67-83d2-49ea-89ab-0d0aa51ead8a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781751242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CTzc2XaLs1ayXYi9fOKXdA8l/VSZMq+FU1Cy1d7jE+E=;
	b=PYYu9NfowJZvmdIJYqOGKcCdg0fsttqcG5kLsW6DZu1e1qQH7DZuCwurCDJfCekdj0wEuV
	xKJTc7zwWGl3won6j7z8Y/YqT+GZr+ejFDUS2BtGyuSeYuhEohKalm+vlbB8atSh5FSkBd
	/7uVgbVv47eevrAt0hVoHoSpFh9RDdulHZjFm2JxBI5v6jfs/JN1XZxpKfq0x9e3XXvrNC
	kEESgCMyCGJJl7an2PingR020k2mLeIgJnNFZeH6YEo5sJN8q4HwbMNRHe+fFG8a/Nm1lo
	dxjaXNyoubKlvzQk9AH/r8E7+Gpmgis809oYbrQOIO+ugp8aZtOEzeRV6Bif+Q==
Date: Thu, 18 Jun 2026 04:50:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum
 workaround
To: Marc Zyngier <maz@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
 <20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
 <864ij1tyrj.wl-maz@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <864ij1tyrj.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 9cmpjqt5o4muagzsg5hbdb75p7upd1q9
X-MBO-RS-ID: f72b41f21a98a9f46ed
X-Rspamd-Queue-Id: 4gglfz1VQXz9sqP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_195405_380583_13808B63 
X-CRM114-Status: GOOD (  27.14  )
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

On 6/17/26 9:24 AM, Marc Zyngier wrote:

Hello Marc,

>> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
>> or APB interface configured to 32 bit, it can therefore access only
>> the first 4 GiB of physical address space. This information comes from
>> R-Car V4H Interface Specification sheet, there is currently no technical
>> update number assigned to this limitation. Further input from hardware
>> engineer indicates that this limitation also applies to R-Car S4 and V4M.
>> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
>> limitation.

My concern is this ^ , I do not have an erratum number, because there 
isn't one. I am in touch with the hardware engineer and I did get a 
glimpse at internal details of the three SoC, which confirm the 
limitations. Is this sufficient ?

>> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
>> common for many ARM GICv3 implementations. Therefore, add an extra
> 
> Not quite. It designates GIC600 unambiguously.

What I am trying to communicate is, that the 0x0201743b ID is not ID of 
the Renesas GIC implementation, but it is a generic ARM GIC600 ID. That 
is why we cannot match the quirk on the ID (it is generic ARM GIC600 
ID), and instead we have to match the quirk on the [ ID combined with 
of_machine_is_compatible("renesas,...") ].

> It is just that GIC600
> is integrated in zillions of SoCs, most of which don't have this
> problem (the machine I'm typing this from has a GIC600 *and* 96GB of
> RAM).

Right.

Shall I reword this paragraph somehow to make it clearer ?

>> of_machine_is_compatible() check.
>>
>> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.
> 
> Is this relevant?

I included it for the sake of completeness and to provide all relevant 
information, based on previous discussions about similar limitations 
that I could find on lore.k.o

[...]

>> +#ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
>> +	{
>> +		.desc   = "ITS: Renesas R-Car Gen4 GIC600 32-bit limit",
>> +		.iidr   = 0x0201743b,
>> +		.mask   = 0xffffffff,
>> +		.init   = its_enable_renesas_gen4,
>> +	},
>>   #endif
>>   	{
>>   	}
> 
> 
> Honestly, that's a bit too much copy-paste for my taste. Just refactor
> the erratum handling to be more generic, something like this:
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 291d7668cc8da..380c4758647d2 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -4894,10 +4894,17 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
>   	return true;
>   }
>   
> -static bool __maybe_unused its_enable_rk3568002(void *data)
> +static const char * const dma_impaired_platforms[] = {
> +#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
> +	"rockchip,rk3566",
> +	"rockchip,rk3568",
> +#endif
> +	NULL,
> +};
> +
> +static bool __maybe_unused its_enable_dma32(void *data)
>   {
> -	if (!of_machine_is_compatible("rockchip,rk3566") &&
> -	    !of_machine_is_compatible("rockchip,rk3568"))
> +	if (!of_machine_compatible_match(dma_impaired_platforms))
>   		return false;
>   
>   	gfp_flags_quirk |= GFP_DMA32;
> @@ -4972,14 +4979,12 @@ static const struct gic_quirk its_quirks[] = {
>   		.property = "dma-noncoherent",
>   		.init   = its_set_non_coherent,
>   	},
> -#ifdef CONFIG_ROCKCHIP_ERRATUM_3568002
>   	{
> -		.desc   = "ITS: Rockchip erratum RK3568002",
> +		.desc   = "ITS: Broken GIC600 integration limited to 32bit PA",
>   		.iidr   = 0x0201743b,
>   		.mask   = 0xffffffff,
> -		.init   = its_enable_rk3568002,
> +		.init   = its_enable_dma32,
>   	},
> -#endif
>   	{
>   	}
>   };
> 
> Then add the two lines you need in a separate patch.

Will do in V2.

> In the future, please provide a cover letter when you have more than a
> single patch (git will happily generate one for you).
OK

