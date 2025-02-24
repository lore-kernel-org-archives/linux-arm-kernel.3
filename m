Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4BFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roBH9oWEkyQyfNMu8ulIneLH8h7glRlD90iBFS/SXQU=; b=cDx0NkPncXqRdVTbmO/hfLPLvf
	cbEkKlsz2g3z31taBzfNafBsSfjkl9dT/u1c1hjd0Uwoy/osnsl6UL9lm9FJRYpwYF4IMvY2PxXhN
	LJ3mBY9PsTDPvANw6k1/AepmTsMkHu3Nfs4HXoEDj9w9BXtsqpGei/heshlM6C4b+9py8xwfL0H6B
	U+0g2twrUADVAG3OV5UJPnhlPcQzA/73SATriT9ul0tAaYig1DYhpa5VHH2i6mpAxFCUsF19glsyH
	yzZMDJNs7traIc/OhTRrpMqk5dJUbv3CJPoVfww2e5EbmGR4Q860Ql6NIpBB4hNr2Ap1ZXggORGM3
	aMul7OFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYIM-0000000Dp6n-2UWt;
	Mon, 24 Feb 2025 13:14:50 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmY8i-0000000DlwM-0R4h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:04:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CE27442EE;
	Mon, 24 Feb 2025 13:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740402287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roBH9oWEkyQyfNMu8ulIneLH8h7glRlD90iBFS/SXQU=;
	b=PooO8ZJYZ6z54HybfXhdt+nkx3hfoR41ANZDDPF62QwZ7rSa7AXfj4B4Fc6XWaEwPQwk6E
	lx943O9bT5ao1YQNdVk4kVPWeOFhEoZqUqfsXwdTeGHfmLipz0JJc4mQqsy2/AB1N4eyVh
	sV972Hqb2leXt+tgooxyCaKha9tZqf4YDj3+lfl9NHEZg4fFPpBYRQF98A4ZvS8+drxWhm
	jZYl/bwMVRAKjb6JV2xwSoHFYyWJWC8YyIOAOT7SZxJRZG9Yut/v0IfF2KwkRZejexCLef
	MkTR3mLrRqsd+caL8hGg3r2h7kgCN+sOmubPrUuWKpIkPHCPxy3WRwIC93f3Jw==
Date: Mon, 24 Feb 2025 14:04:43 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: <p.zabel@pengutronix.de>, <Steen.Hegelund@microchip.com>,
 <daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] reset: mchp: sparx5: Fix for lan966x
Message-ID: <20250224140443.42ddc57c@bootlin.com>
In-Reply-To: <20250224092923.2648680-1-horatiu.vultur@microchip.com>
References: <20250224092923.2648680-1-horatiu.vultur@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeekhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehhohhrrghtihhurdhvuhhlthhurhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopefuthgvvghnrdfjvghgvghluhhnugesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepfgfpiffnihhnuhigf
 fhrihhvvghrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_050452_711651_DE411518 
X-CRM114-Status: GOOD (  22.30  )
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

Hi Horatiu,

On Mon, 24 Feb 2025 10:29:23 +0100
Horatiu Vultur <horatiu.vultur@microchip.com> wrote:

> With the blamed commit it seems that lan966x doesn't seem to boot
> anymore when the internal CPU is used.
> The reason seems to be the usage of the devm_of_iomap, if we replace
> this with of_iomap, this seems to fix the issue as we use the same
> region also for other devices.
> 
> Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally in case of LAN966x")
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  drivers/reset/reset-microchip-sparx5.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
> index aa5464be7053b..5a75f9833a91a 100644
> --- a/drivers/reset/reset-microchip-sparx5.c
> +++ b/drivers/reset/reset-microchip-sparx5.c
> @@ -8,6 +8,7 @@
>   */
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
> @@ -72,14 +73,17 @@ static struct regmap *mchp_lan966x_syscon_to_regmap(struct device *dev,
>  						    struct device_node *syscon_np)
>  {
>  	struct regmap_config regmap_config = mchp_lan966x_syscon_regmap_config;
> -	resource_size_t size;
> +	struct resource res;
>  	void __iomem *base;
>  
> -	base = devm_of_iomap(dev, syscon_np, 0, &size);
> -	if (IS_ERR(base))
> -		return ERR_CAST(base);
> +	if (of_address_to_resource(syscon_np, 0, &res))
> +		return ERR_PTR(-ENOMEM);
>  
> -	regmap_config.max_register = size - 4;
> +	base = of_iomap(syscon_np, 0);
> +	if (!base)
> +		return ERR_PTR(-ENOMEM);
> +
> +	regmap_config.max_register =  resource_size(&res) - 4;
>  
>  	return devm_regmap_init_mmio(dev, base, &regmap_config);
>  }

In the Lan966x PCI device use case, the reset driver can be loaded, unloaded
and re-loaded.

When the driver is unloaded, resources have to be released and so with a
call to of_iomap(), a call to iounmap() is needed.

Maybe .remove() function in this driver should handle the needed iounmap()
call.

Best regards,
Hervé

