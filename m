Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933BFC71135
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jG3O/Ud05MZx4jdqboGk4v0NA5OIKt/wUnoKzAyvNxg=; b=UXU+kCN0Xz4ND1l9rl2ccqNEjn
	27UXsu3lStrPMWfegcLUTC6hiaK9sivwU/PFNiOL8CuBsjAH8S05fgLs8707n5D28Ygj7QQup+mFV
	eFoitdC74toCXfQ2zK3VVSYZuSQQ9jIAdUiR35sa3vfqC+u0glYGIs5NtU+zPQ+WXoTfm3ViQWZt1
	RckNQXLnGZ1tTcpyk9o9t+kHPaxy3/WkYBC/8Au/RYgBY35lLH3LmP1Jo4WKVSdydIVs1bU2Vp4wp
	NQJl5e0lr/rw56IxMgSbYwZVvzLfQDnIYBp67YfKGTv2w6dxjw2eZSVOdf6rXTAjp11rfeYvjDeJ1
	xXNVkhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPz1D-0000000Fd60-0ayi;
	Fri, 13 Jun 2025 07:40:07 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyiH-0000000FaHy-0DCd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 07:20:34 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 650B91140176;
	Fri, 13 Jun 2025 03:20:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 13 Jun 2025 03:20:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1749799229; x=1749885629; bh=jG3O/Ud05M
	Zx4jdqboGk4v0NA5OIKt/wUnoKzAyvNxg=; b=P1vjmPIW2/wAUEeA7U/tXdD8iO
	X2gFnzTYmpSLkVbC09w7bT6bPL1TULq8W2sUytLHHqJJ4aI0qfqwkpBqqo7q6w+v
	a4ZHk6WXcFmwc2WPo9lyZCkx+u8Y/b+3YOlz1U1JWnCYeqPK9rF5mGZ4mzJYVWiF
	A1c0n+byiXnzx0u/cTlX4daS5hB61IqB5DzXn0pSZ0svhFE7jSCbiy1lYy0KsGI6
	nMMcRQ/Pi3oq7K89ZwjgmxFbeMhEhTJArNSb04t9Rd0AJSAYpwRQ1tGQsvvBj18f
	JS2eTa6EAZhrLgZ/mimYfOFD3ZLrXAEAtU/b1qiCUau14sMkRX9Xz+pp3StA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749799229; x=1749885629; bh=jG3O/Ud05MZx4jdqboGk4v0NA5OIKt/wUno
	KzAyvNxg=; b=aJDF6bH96UoECz7OWyAzTsE/qMXwjlqUqMqdgelSBR4u823P+lA
	OuIyyyna2iMtA+W+U5lFIt7HQwyx2w14Ve+gORg6fMrT/3ngWMY9mTAgrv2qgmAZ
	TmyPb2cFdF7DtNdUbvw8lnK2Kd5oQ38Czjg5XXt0ZbJxebF/yAXygAk6r/243gkv
	PQq+3hfhnC98ELI/3H19HjbTUm6s5YVUvYzt6D0uBT9Hp819sEFnFUcMVrX70PZ4
	HVO36Qv2TaL+S4uiExs0XvgWXgmHSS7mQcMHpfv0dREkGJDIC07yCJM5R4AWwTOj
	hQlV0rjzXHZKIj6cGNgjNUb7+Sz0ThOR6TQ==
X-ME-Sender: <xms:OtFLaFzKONTfZkXILH3XYzZEUfG55o5HOePR8cyOYqgjQEheeXElRA>
    <xme:OtFLaFTtwv46-jgC8eQlBk675fBDJDGwFoAGiEn6nElhmiFF-pJZg4bjG7pCyUo7P
    bifV4GMC71OkTG2vzs>
X-ME-Received: <xmr:OtFLaPXcCDMRRp9eE7KY1wBc1Thy0_u1RF6WWc0Bu6CQaDc08Ls5Xz72R7GZJoSuGa2FEalZSMpX0L-OqRD2ZTaK_VLLYkpSIjk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepgfdvffevleegudejfeefheehkeehleehfefgjefffeetudeg
    tefhuedufeehfeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedvvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtth
    hopeguvhhorhhkihhnsehtihgssghordgtohhmpdhrtghpthhtohepfigvlhhlshhluhht
    fiesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlih
    hnrghrohdrohhrghdprhgtphhtthhopehprghtrhhitggvrdgthhhothgrrhgusehfohhs
    shdrshhtrdgtohhmpdhrtghpthhtohepshhuphhpohhrthdrohhpvghnshhouhhrtggvse
    guihgrshgvmhhirdgtohhmpdhrtghpthhtohepsggrrhhutghhsehtkhhoshdrtghordhi
    lhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhi
    hsshgrsehrohhsvghniiifvghighdrihho
X-ME-Proxy: <xmx:OtFLaHieCR7i3mjNcCHPqOC39MqmdSV6LhCiKBfiFb-q64TIIB5YUQ>
    <xmx:OtFLaHANXNHonW-Il6-KF7ktKwZkTU5LCJT5a6FVkmtn9vomjsSZ3Q>
    <xmx:OtFLaAL1atxc5kXngDg_VktyWDUvEDvh4xA-SzMkDl8AkEhtXk3jhw>
    <xmx:OtFLaGCvH_4PXKngaqe3MEnUmB4JVoNxMqDElPwknNqXKyWeOim_ZA>
    <xmx:PdFLaHUFclZvZJTCtf0C2rxGbtX2fEn1ZeQ73ehog305zlAuCf063FOc>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Jun 2025 03:20:26 -0400 (EDT)
Date: Fri, 13 Jun 2025 09:20:24 +0200
From: Janne Grunau <j@jannau.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	soc@lists.linux.dev, linux-sunxi@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 10/16] pinctrl: apple: use new GPIO line value setter
 callbacks
Message-ID: <20250613072024.GE3141695@robin.jannau.net>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
 <20250612-gpiochip-set-rv-pinctrl-remaining-v1-10-556b0a530cd4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-10-556b0a530cd4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_002033_699517_F4712810 
X-CRM114-Status: GOOD (  18.46  )
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

On Thu, Jun 12, 2025 at 03:15:19PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/pinctrl/pinctrl-apple-gpio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
> index 0f551d67d482d96c7a1e4c28a6db580f0db6452e..dcf3a921b4df54250194403f06a3c1fb40110eaa 100644
> --- a/drivers/pinctrl/pinctrl-apple-gpio.c
> +++ b/drivers/pinctrl/pinctrl-apple-gpio.c
> @@ -217,11 +217,13 @@ static int apple_gpio_get(struct gpio_chip *chip, unsigned offset)
>  	return !!(reg & REG_GPIOx_DATA);
>  }
>  
> -static void apple_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
> +static int apple_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>  {
>  	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
>  
>  	apple_gpio_set_reg(pctl, offset, REG_GPIOx_DATA, value ? REG_GPIOx_DATA : 0);
> +
> +	return 0;
>  }
>  
>  static int apple_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
> @@ -376,7 +378,7 @@ static int apple_gpio_register(struct apple_gpio_pinctrl *pctl)
>  	pctl->gpio_chip.direction_input = apple_gpio_direction_input;
>  	pctl->gpio_chip.direction_output = apple_gpio_direction_output;
>  	pctl->gpio_chip.get = apple_gpio_get;
> -	pctl->gpio_chip.set = apple_gpio_set;
> +	pctl->gpio_chip.set_rv = apple_gpio_set;
>  	pctl->gpio_chip.base = -1;
>  	pctl->gpio_chip.ngpio = pctl->pinctrl_desc.npins;
>  	pctl->gpio_chip.parent = pctl->dev;

apple_gpio_set_reg() could pass the return value of regmap_update_bits()
but I suppose this change to switch to the new callback is ok on its
own.

Reviewed-by: Janne Grunau <j@jannau.net>

Janne 

