Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70000C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERVqXRTL7y1GGxMaoU0rAys8hfRqKfxsOWaRlkZ0eO4=; b=1+cwXSfKVY41E2FO6qs5LWdnew
	zAbwNEB8f8vqSCudIWGc8OhSkxGC2sbnW/kRhZvJ1n4aAYDQX8BCAi65+f+1WAXFfGMGiKG46Rfeu
	Kl6+IHK+zJVkudkhhdMhRksUxJ9wQyKgYIqgQCM7kDItAjq2XuXbcjfBKDGEjx/IRLIlIuhqPJ87D
	LvDlsBpY+bdACSkWfOvhIliBqPr5SzvqhWHiuZEi684HZvGtR182E1vLavmz0wQamNh40KqmI9h/6
	2BWYaTeNo5tyVBpDxhfjaU72L+2lILnDCwnxuNB2FzCi3ZMggV/N1cTvhlaM3p0gJND1YQVQ7W34M
	iGTT6hlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnElY-00000003JhM-2HAB;
	Wed, 26 Feb 2025 10:35:48 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEQe-00000003Fcf-1u5N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 10:14:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 665FF44369;
	Wed, 26 Feb 2025 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740564848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ERVqXRTL7y1GGxMaoU0rAys8hfRqKfxsOWaRlkZ0eO4=;
	b=cxHhfoDyxHTrxLtsq7eJGyif1RSW/hB6hu5P4rV6dLWzdFXrsgd3h2ApyCcqzokFwtTsnu
	NBVm82yKoLQDQ2SPK/zhvC/v8s3Ge1y703CKUtndr7CqLc1YV3+Omtfb4sVR3gOmrh80tI
	IGX9NAbqzG1FikedaFvhuLw9HA1GUoVjIg1rf68Toly+zgyOc25zpZtFDZnJRpewYGDHoK
	6KM9cB2ovGW96HlYSnudtM1VgiJSJrnp4ybgT0aw6jm9dazktgXfQtLsbB2qdmlbLourwx
	TXJ4A7eArKRtuEgB+jFB5vUU42DIsMJoB3MsUANHEqkl4Lpx46MIk3OAbCNzbA==
Date: Wed, 26 Feb 2025 11:14:06 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: <p.zabel@pengutronix.de>, <Steen.Hegelund@microchip.com>,
 <daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] reset: mchp: sparx5: Fix for lan966x
Message-ID: <20250226111406.2751ebce@bootlin.com>
In-Reply-To: <20250225105329.3037853-1-horatiu.vultur@microchip.com>
References: <20250225105329.3037853-1-horatiu.vultur@microchip.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeviefffeegiedtleelieeghfejleeuueevkeevteegffehledtkeegudeigffgvdenucfkphepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehhohhrrghtihhurdhvuhhlthhurhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehprdiirggsvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopefuthgvvghnrdfjvghgvghluhhnugesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhop
 egurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepfgfpiffnihhnuhigffhrihhvvghrsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_021412_648978_1C4020C7 
X-CRM114-Status: GOOD (  18.66  )
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

On Tue, 25 Feb 2025 11:53:29 +0100
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
> v1->v2:
> - make sure to use iounmap when driver is removed
> ---
>  drivers/reset/reset-microchip-sparx5.c | 40 +++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 11 deletions(-)
> 

...

>  static struct regmap *mchp_lan966x_syscon_to_regmap(struct device *dev,
> -						    struct device_node *syscon_np)
> +						    struct device_node *syscon_np,
> +						    struct mchp_reset_context *ctx)
>  {
>  	struct regmap_config regmap_config = mchp_lan966x_syscon_regmap_config;
> -	resource_size_t size;
> -	void __iomem *base;
> +	struct resource res;
>  
> -	base = devm_of_iomap(dev, syscon_np, 0, &size);
> -	if (IS_ERR(base))
> -		return ERR_CAST(base);
> +	if (of_address_to_resource(syscon_np, 0, &res))
> +		return ERR_PTR(-ENOMEM);

Why not forwarding the error returned by of_address_to_resource() ?

Other than that:

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Also, I tested the patch successfully on my LAN966x PCI device.

Tested-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

