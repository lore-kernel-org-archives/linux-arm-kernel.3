Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2028D606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 09:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z1jHBfOG;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cQBVG3Ux
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tvox01c/LdtBVnbijieWNltU+WV/o1xordbJtEhjTKQ=; b=Z1jHBfOGt563KX
	rToo2odKUgcot40KnvCRWJD6Y7/tFPFdyPI22FW8j9L8wtHP6NBmjIUM9A/pivkBwf39rrZ7cGGwi
	aNPsEndRDKZe68uG10+nEycVIGp3um/1ab7RIBxZK6DoVQAWObAi+f3VSz6s8guI6x2CwtjTxZxHE
	X7DDqBuhODA8YVKOARxRjICHi6DLkwX3ORZUPotqu1VGGbbaueTqoUM9YInKB9w5VnOs559gkT8AN
	ibTVsyHsPM1BM5v2S2cK7cR5ls3oKcU3fW3eSFpH1sGW0xouiSiLcVmuAjwCqcUCUUjx9CYkJRQhe
	/JsNKDkSWrk0TSC5mv0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtwV-00000008LCW-1MU4;
	Thu, 05 Nov 2026 09:39:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOtwQ-00000008LB7-1dPl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 09:39:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 341C319F6;
	Thu,  5 Nov 2026 01:39:26 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B15363F628;
	Thu,  5 Nov 2026 01:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793871569; bh=jLw5x/FRptMVvMRjQnGefDSs408NvBXTJ8hj0KuIrAA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cQBVG3UxH6xAs18O2apuMOrY9rPW8MkbyKg874xfoia2zPmzC0dS+S9O76+BnGm1/
	 K+5CnP3u9SRoE3WB1kb8dWR2aolZAoO8+kctuUuLRrRWCaFu38nviCqJ36+TVTXQuE
	 Kapu0jldllBYIlNs7XXD6BpQEVwZB/Fb0VSERY0s=
Message-ID: <e7cd2bf6-f9db-4a90-b11a-665f8219f7ce@arm.com>
Date: Thu, 5 Nov 2026 10:39:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] pinctrl: sunxi: Fix out-of-bounds irq_bank index
 when first bank has no IRQs
To: Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-2-lee@kernel.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261103213002.1673560-2-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_013933_090061_248ED214 
X-CRM114-Status: GOOD (  25.07  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lee,

On 11/3/26 22:29, Lee Jones wrote:
> In prepare_function_table(), irq_bank and last_bank are initialised to 0
> and last_bank is updated on every bank regardless of whether it supports
> interrupts.  On SoCs where bank 0 (PA) has no pins or does not support
> interrupts (such as Allwinner A523 and A733), the first IRQ-capable bank
> has bank > 0, which causes irq_bank to be incremented to 1 instead of
> starting at 0.  As a result, the final IRQ bank receives irq_bank equal
> to desc->irq_banks and writes out-of-bounds past pctl->irq_array during
> sunxi_pinctrl_build_state().
> 
> Initialise irq_bank and last_bank to -1 and only update last_bank when
> processing an IRQ-capable bank so that irq_bank always starts at 0 and
> increments sequentially across IRQ-capable banks.

Can we please hold back this patch for now? There are more issues around 
the IRQ bank usage on recent Allwinner SoCs, patches for which [1] are 
on the list. They should solve the out-of-bounds access, I think, though 
we might want to add explicit checks, maybe.

But taking just this patch here would torpedo the efforts in fixing the 
correctness issues that we see.

Cheers,
Andre

[1]
https://lore.kernel.org/linux-gpio/20261025142412.112216-1-pmazzini@gmail.com/

> 
> Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
> Closes: https://sashiko.dev/#/bug/linux-9c4dd832-02d4-4096-9e91-a03c1d4d85b3
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 8bcd566593ae..79ca1a7c4837 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -208,8 +208,8 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>   	 * Assign the function's memory and fill in GPIOs, IRQ and a sentinel.
>   	 * The extra functions will be filled in later.
>   	 */
> -	irq_bank = 0;
> -	last_bank = 0;
> +	irq_bank = -1;
> +	last_bank = -1;
>   	for (i = 0; i < npins; i++) {
>   		struct sunxi_desc_pin *pin = &pins[i];
>   		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
> @@ -222,17 +222,16 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
>   		func[1].muxval = 1;
>   
>   		if (irq_mux) {
> -			if (bank > last_bank)
> +			if (bank > last_bank) {
>   				irq_bank++;
> +				last_bank = bank;
> +			}
>   			func[lastfunc].muxval = irq_mux;
>   			func[lastfunc].irqbank = irq_bank;
>   			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
>   			func[lastfunc].name = "irq";
>   		}
>   
> -		if (bank > last_bank)
> -			last_bank = bank;
> -
>   		pin->functions = func;
>   
>   		/* Skip over the other needed functions and the sentinel. */


