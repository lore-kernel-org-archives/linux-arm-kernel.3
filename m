Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976C0CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE/fIembj5za2Gj+q2dDwwOxtAdNg4E9YchXSzIxXo4=; b=SOdtdC/ztYg2B3phcWHsIE1PGk
	0lcXWeQdeoOhQ5D6/vNFrFGRpiQbOC2rY1WwFHZM5919sH+gschTkn7K9ucd6iZE9atT1zIV+bvA4
	9Cy6gFw9x1Itv7OSKbrKoOoa+Bq0sq0BUUvH8AKb+G6ko02E/n2PwXLyu/XnpSafCNPMby92cJ1F9
	rshz+o8YFZ/kk3TwCc52ORFWnmpv8xbIcyuAhXtHCg960nffalv0H1h1jUfc9Ua0HQPZ0BEqiVZ74
	p3nLe0xZ7g49ubvSvEOCQAfKaZMGxHWOy8JcrDfDUMCP/zefxMF7IBqJDIxCW2pZaeZx1USjiT1Yf
	GhOSvZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwDv-00000006VSx-0SHc;
	Wed, 30 Sep 2026 15:27:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwDL-00000006VLr-3DC1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sE/fIembj5za2Gj+q2dDwwOxtAdNg4E9YchXSzIxXo4=; b=L16Jp3U8IrMsS9LAkKMRUna/mN
	FysmthWoxj9r4QCbUvHb/nqbAiHjEfnFYCi6YfVA6r2iqf2+OxO+N0G17o1KiHoSc0G5l2Z2n1/La
	SA2JsHAj0170fKBwcljgRH6JT1yZzeGjttRFcRbqztNcaYSALAiVCv9AuaVHJr3K19l/Q/+a+gRrz
	MG3aVITq1vtP+BnxrSK+IhQHZvCuqJpL0Y4/DTrNgkWbvpbWFhIrI8Ii6hRWj5Qnmh6FFS7RW5K6y
	hoVR6HWY7nnbOrvIjQsAspVvqh00CSZZocECCNLp8YeSYrUBQaAnf+ffjI5avdwghZB5e3BVFuJYm
	XFz0Gb7g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwDI-00000003zpF-1IS5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:27:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FD5F497;
	Wed, 30 Sep 2026 08:27:13 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B8613F86F;
	Wed, 30 Sep 2026 08:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790782037; bh=BMxuuBMmXl1PbkW1d5zdKSxy6yBqqDoKYBJRc1IY+1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ufz6GsZaOrldhgHWcIdahvrycYQ9GDFBm3l+cT3+cMhONUG/0Rv/0az0MGzvP64f6
	 KTHAjTCiKEngiedp52jDkZJYi/hnC2/k4MYgWXNaMPJKwG035bteweSdmZsisjJQFE
	 bLQG4cHtgkx0P07s5PbauauhTJ3n/txuJPmeC15k=
Message-ID: <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
Date: Wed, 30 Sep 2026 17:27:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Pablo Mazzini <pmazzini@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260929203634.32998-1-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260929203634.32998-1-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_162720_760720_8B5D8BA0 
X-CRM114-Status: GOOD (  26.19  )
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

Hi Pablo,

thanks for sending a patch!

On 9/29/26 22:36, Pablo Mazzini wrote:
> prepare_function_table() assumes the first pin is in bank 0. On the
> A523, which has no PA pins, every IRQ bank is numbered one too high:
> the last bank writes past the end of irq_array, and interrupts are
> looked up at the wrong offsets.

Yes, this is a known issue, and I already provided a quite different fix 
for this[1]: the A523 manual actually lists a PortA GPIO interrupt, even 
though this is pretty likely not functional. But specifying this IRQ in 
the DT fixes the problem as well.
The DT binding does not say how the IRQs are assigned to the GPIO ports, 
so from that point of view my solution is similarly usable as yours - 
though admittedly yours looks a little better and more future proof.

I guess we now need to figure out how we want to handle this in the 
future, and add an explanation to the binding. The A733 has a similar 
problem: PortA does not exist. This time the manual does not explicitly 
specify a GPIO IRQ, but conspicuously leaves a gap before the PortB GPIO 
IRQ, so we can use that as well.

Linus, Chen-Yu, Jernej: what do you think?

Cheers,
Andre

[1] 
https://lore.kernel.org/linux-sunxi/20260327113006.3135663-4-andre.przywara@arm.com/

> 
> Count the IRQ banks from the first bank that has interrupts.
> 
> Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 50a16f3bd131..9c5eb21a86a5 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>   	 * The extra functions will be filled in later.
>   	 */
>   	irq_bank = 0;
> -	last_bank = 0;
> +	last_bank = -1;
>   	for (i = 0; i < npins; i++) {
>   		struct sunxi_desc_pin *pin = &pins[i];
>   		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
> @@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>   		func[1].muxval = 1;
>   
>   		if (irq_mux) {
> -			if (bank > last_bank)
> +			if (last_bank >= 0 && bank > last_bank)
>   				irq_bank++;
>   			func[lastfunc].muxval = irq_mux;
>   			func[lastfunc].irqbank = irq_bank;
>   			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
>   			func[lastfunc].name = "irq";
> -		}
> -
> -		if (bank > last_bank)
>   			last_bank = bank;
> +		}
>   
>   		pin->functions = func;
>   


