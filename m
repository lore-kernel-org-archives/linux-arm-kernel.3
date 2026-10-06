Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A15ECA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 23:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cIiO4Q0ssDJyTXwlk+4PxB5WXHAZtmW2h48B8nNaGPg=; b=Tggm1bywsT4tyQ+O8lFgj6gZcp
	nj5zQvr2N9+q2xxfaRou8PuWll9Wr3LnQbzVuC0Kt8Y/dkGQZtAdBT3yhUbd59HV1pfz25+gWeM1S
	qDaZCNqivmYh74rQ8koawsOjIJMj76B3z/4zwJpR6guopdMvSBDkmg9dxF3TGXRPEUrcZrQquZVjc
	jtxVyzhdydFqD/c/YvvbbNot75ueya3fD3XQohUZHttYyWHwU13jRmqco9Ki38Uw43wIaep4u6w+v
	d+SbQ1NVdciuDmrNwTKFGaZGdfqfiqvUZh3WJHQEp0BFg/2eaRlmlFGW1rZ7wXw4ceIFw2IeTxsCG
	J7j0FWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEVg-00000001UHH-1AvS;
	Tue, 06 Oct 2026 23:23:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEEVc-00000001UGv-3igo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 23:23:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DC63152B;
	Tue,  6 Oct 2026 16:23:39 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00D1B3F763;
	Tue,  6 Oct 2026 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791329022; bh=aCf+ecADbpzZJB4b2Abbl4SbvxENP8Hj3uwHBY5Y/2g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pvSidUC1OjgIh52WAADE1kQvxGBSINL9WVgf6mcIrbC1OnU0w/KAbTE2G8jnpcQq6
	 XqBPHRzVa6qVBjNd071DFriJEpI+r0sDcZg8lNcslFrPmSzcQolMjEzLLCpF7uC4z+
	 ZuZ0ShU4AHBNWB9AiZcps9b0WFIECbmsoDSO9oSA=
Date: Wed, 7 Oct 2026 01:23:37 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: dt: do not accumulate npins across
 probe attempts
Message-ID: <20261007012337.6765eae7@ryzen.lan>
In-Reply-To: <20261006210313.43163-1-pmazzini@gmail.com>
References: <20261006210313.43163-1-pmazzini@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_162345_083100_E953E988 
X-CRM114-Status: GOOD (  20.39  )
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

On Tue,  6 Oct 2026 22:03:13 +0100
Pablo Mazzini <pmazzini@gmail.com> wrote:

Hi Pablo,

> init_pins_table() adds to npins in the driver's static descriptor, so
> after a probe deferral the count doubles and the next probe fails with
> "pin 0 already registered". Count into a local instead.

Can't we just initialise desc->npins to 0, at the beginning of
init_pins_table? I think Sashiko suggested that even...

Cheers,
Andre

> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> index 50a16f3bd131..1c1888394cf1 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
> @@ -75,7 +75,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
>  					      struct sunxi_pinctrl_desc *desc)
>  {
>  	struct sunxi_desc_pin *pins, *cur_pin;
> -	int name_size = 0;
> +	int name_size = 0, npins = 0;
>  	int port_base = desc->pin_base / PINS_PER_BANK;
>  	char *pin_names, *cur_name;
>  	int i, j;
> @@ -85,7 +85,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
>  	 * Also work out how much memory we need to store all the pin names.
>  	 */
>  	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
> -		desc->npins += pins_per_bank[i];
> +		npins += pins_per_bank[i];
>  		if (pins_per_bank[i] < 10) {
>  			/* 4 bytes for "PXy\0" */
>  			name_size += pins_per_bank[i] * 4;
> @@ -98,12 +98,14 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
>  		}
>  	}
>  
> -	if (desc->npins == 0) {
> +	if (npins == 0) {
>  		dev_err(dev, "no ports defined\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
> +	desc->npins = npins;
> +
> +	pins = devm_kcalloc(dev, npins, sizeof(*pins), GFP_KERNEL);
>  	if (!pins)
>  		return ERR_PTR(-ENOMEM);
>  


