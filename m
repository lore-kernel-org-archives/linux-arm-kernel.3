Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61144C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 20:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRgH8+d7aznA4MQghmGW1XETNNC6iKcuwGWHKJaLMaY=; b=IgRK4j/yE8Kc10e66sQCMu/4mi
	aYd6BQwg/9PDyimQ2NJidhI0TC9Ir0R7rf6a1XdlQce1j8GcORQ8MfyW/tXjlVb77C1C3D7Ues9zs
	4UZPxhuxth80euQhJL3ELK6klTyBHE8sDXp4pyQ5kkft1EOMqGwzweQ2a5OiVVX/+qmvMuq1SaK3C
	OLtSFy5Ogn3dc46UiVciLfAq+jR9C1ZIyFWiD7KJHBwdGJk4EqUC0vMVfZYkjVZ0/0mQLSDGG0O/z
	TfT3g6gx4ktd2Ey+xFU85eqOaH97mywuni/u1is9uQUDNBs+t5X3tUjRTGXYmAZnFKjvtIS24xAOY
	cREyTI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzdK-0000000BM3N-28tg;
	Wed, 18 Jun 2025 20:43:46 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzaz-0000000BLaH-27w2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 20:41:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2363e973db1so600725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 13:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750279280; x=1750884080; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FRgH8+d7aznA4MQghmGW1XETNNC6iKcuwGWHKJaLMaY=;
        b=SCZKi5hEcjpKzUB75qdJrpI07XQ5yG90skdYzDex0f2CSzxnOQhmPvSkr9u5q/+AdS
         Ovp9fPQZV3iWgTfkICDoAUdtea8c/TLjGxYdACe9X2xEdcKUWWU6UB8+qEMYTW+LIKZW
         QJhCpoImDGUeZFRQ+vYeQshOV7FFl6xpK0n03YZyr/UT1bbQV5vPzNhDINYsqn4QYBIL
         QlNY2SLeGicQLezC3zyBQuQtFsCNxw64nEaX05RLLilQT5050m169DHW4JqeJyaLjScK
         lkjkG1reu8PyUrMdiEduXc1syhYU0jl14YtYrA5GnA1M6/7MbPpod8B3DbrPr8zmfOJV
         cqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279280; x=1750884080;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRgH8+d7aznA4MQghmGW1XETNNC6iKcuwGWHKJaLMaY=;
        b=AWuHsp7xUVhNwUIf1OB/FttCT2w+r47/0ICBajUiZqfCrjLjaIqhDsT3SkiSukSL6O
         uJ/etdW6pmOGHR9gBh6w3ncBA/luqNSnBjuEsYNaSd2SEsI7Q32HdjiyE8KtlGNyb6KT
         NfGjALvw9q3g0FdX4F+OLlgSSUHkXFid75xhI9WxmIGhXyMFq13Fb1WB6YjftUR7x8W5
         WihK2qMcAGA4QbC+dP7hBCJYaU17k8s1RfQe6nJmZi5T8rO3Bg4YHXkU6BtYh++BL2Fi
         8oJW7jDSBqDa90jvaoyvmTIkvzG/uYKcKNHo258igRucrnONW3VRkBWS7Fp5KHOOAWw8
         sKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsCwLGEml4rSONxJlZo7NaBtFfZuLCYr79jJxQhXYQyt6jzjhkjL8dDZvHQdJ1VrDKzDKXGyOy4O9EhjK/aOpt@lists.infradead.org
X-Gm-Message-State: AOJu0YxY9dBUEUqS6s9kPOU9ZmnK/01FsgmHRIJq/bkJUWNrsWj2Ozea
	+GInVHQW56gLd3NFIiz03UyjQW6ldhMoVV8BonjBlzxYzb4tOnEfcd9OQNZDEwAP+hQ=
X-Gm-Gg: ASbGnctaPEEyj1qLkbrEYb/lyQeRwsLqt46/dKSVN5WCWcz4PZHeUHEkgMt63WYC7Re
	GXtod9C8O3f8Scuz0JOfkNiZO6pCiryiFoJ4lPGe+Gz/8+yClfeID90Wil3eW9ufVmfnzK3Gx+K
	JGu1YUwOO9Hbhnb7jwwQe3/EsE4OjLYf84XnrzG4oF4GSZqmkkYKlzowUTTjLvKisEQV/o6ZRyE
	P9qoTAKbazSXGJnyVpJ00URXt+V2Lxj0BcuuviPVP3Vy+9k8fYhXHHxFbb+5S4n+JDp5KDRk+4g
	uOxmUEsoDh30nkVxp9YxwTziWf6aJAmPE2L3g4XRw0+AIh0UN8ht1hvy68Oe
X-Google-Smtp-Source: AGHT+IE2M4wu8ONpX/IiaC9ZvenKuU3UdWNHV2TzBZwcoAY9dPpuZfPN3dnzzwJJvIJDvRrlPVMKzw==
X-Received: by 2002:a17:902:da90:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-237cbf35959mr12925525ad.15.1750279280168;
        Wed, 18 Jun 2025 13:41:20 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88d921sm105355355ad.40.2025.06.18.13.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:41:19 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, Roger
 Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Paul
 Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>
Cc: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, Bajjuri
 Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Kory Maincent
 <kory.maincent@bootlin.com>
Subject: Re: [PATCH v4 2/7] arm: dts: omap: Remove incorrect compatible
 strings from device trees
In-Reply-To: <20250617-bbg-v4-2-827cbd606db6@bootlin.com>
References: <20250617-bbg-v4-0-827cbd606db6@bootlin.com>
 <20250617-bbg-v4-2-827cbd606db6@bootlin.com>
Date: Wed, 18 Jun 2025 13:41:19 -0700
Message-ID: <7hzfe4ok9c.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_134121_656232_FCD07643 
X-CRM114-Status: GOOD (  26.20  )
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

Kory Maincent <kory.maincent@bootlin.com> writes:

> Several device trees incorrectly included extraneous compatible strings
> in their compatible property lists. The policy is to only describe the
> specific board name and SoC name to avoid confusion.
>
> Remove these incorrect compatible strings to fix the inconsistency.
>
> Also fix board vendor prefixes for BeagleBoard variants that were
> incorrectly using "ti" instead of "beagle" or "seeed".
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

While I agree with adding the new compatibles for clarity, I question
removing the old ones after so much time in the kernel. 

As mentioned in earlier reviews, there is other tooling outside the
kernel that has been built around these strings.  The one that I have in
mind is KernelCI based tooling that tracks boards based on compatible
strings.

While the KernelCI tooling does evolve with these kinds of kernel
changes, it also still builds and tests older kernels.  So if we want
these tools to know that "beagle,am335x-bone" on a new kernel and
"ti,am335x-bone" on an older stable kernel are actually the same board,
the tools will need to keep track of that mapping as these change.

So instead of removing them, can't we just make the new ones higher prio
than the old ones?  That way the tools can see both, and also see which
one is higher prio.

I fully realize this is not necessarily the best technical argument to
keeping the old and wrong names, so I will defer to DT maintainers on
this one.  But since it's been wrong for a long time, I'm a bit
reluctant to remove them completely knowing there will be external tools
breakage.

Kevin

> ---
> Changes in v4:
> - Rename ti,am335x-shc to bosch,am335x-shc
> - Drop model value change to avoid conflict with script based on this
>   value like:
>   https://salsa.debian.org/installer-team/flash-kernel/-/blob/master/db/all.db?ref_type=heads
>
> Changes in v3:
> - Remove extraneous compatible strings.
> - Replace BeagleBone board name vendor.
>
> Changes in v2:
> - New patch
> ---
>  arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-bone.dts                       | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts         | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-boneblack.dts                  | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts         | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts                  | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 | 3 +--
>  arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 5 +----
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 5 +----
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts               | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-shc.dts                        | 2 +-
>  15 files changed, 15 insertions(+), 22 deletions(-)
>
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> index 46078af4b7a3..176de29de2a6 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> @@ -9,7 +9,7 @@
>  
>  / {
>  	model = "IGEP COM AM335x on AQUILA Expansion";
> -	compatible = "isee,am335x-base0033", "isee,am335x-igep0033", "ti,am33xx";
> +	compatible = "isee,am335x-base0033", "ti,am33xx";
>  
>  	hdmi {
>  		compatible = "ti,tilcdc,slave";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone.dts b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> index b5d85ef51a02..08616d449f95 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> @@ -9,7 +9,7 @@
>  
>  / {
>  	model = "TI AM335x BeagleBone";
> -	compatible = "ti,am335x-bone", "ti,am33xx";
> +	compatible = "beagle,am335x-bone", "ti,am33xx";
>  };
>  
>  &ldo3_reg {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
> index b4b4b80df08c..aa668dfa1c6a 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
> @@ -12,7 +12,7 @@
>  
>  / {
>  	model = "TI AM335x BeagleBone Black Wireless";
> -	compatible = "ti,am335x-bone-black-wireless", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "beagle,am335x-bone-black-wireless", "ti,am33xx";
>  
>  	wlan_en_reg: fixedregulator@2 {
>  		compatible = "regulator-fixed";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
> index 16b567e3cb47..476fb6677203 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
> @@ -11,7 +11,7 @@
>  
>  / {
>  	model = "TI AM335x BeagleBone Black";
> -	compatible = "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "beagle,am335x-bone-black", "ti,am33xx";
>  };
>  
>  &cpu0_opp_table {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> index f579df4c2c54..56f9042a5bfb 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> @@ -10,7 +10,7 @@
>  
>  / {
>  	model = "TI AM335x BeagleBone Blue";
> -	compatible = "ti,am335x-bone-blue", "ti,am33xx";
> +	compatible = "beagle,am335x-bone-blue", "ti,am33xx";
>  
>  	chosen {
>  		stdout-path = &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> index a4f5b5262645..37d4d5a3edf6 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> @@ -11,7 +11,7 @@
>  
>  / {
>  	model = "TI AM335x BeagleBone Green Wireless";
> -	compatible = "ti,am335x-bone-green-wireless", "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "seeed,am335x-bone-green-wireless", "ti,am33xx";
>  
>  	wlan_en_reg: fixedregulator@2 {
>  		compatible = "regulator-fixed";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
> index 18cc0f49e999..3d6404653816 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
> @@ -10,5 +10,5 @@
>  
>  / {
>  	model = "TI AM335x BeagleBone Green";
> -	compatible = "ti,am335x-bone-green", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "seeed,am335x-bone-green", "ti,am33xx";
>  };
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
> index 648e97fe1dfd..224095304ef3 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
> @@ -8,8 +8,7 @@
>  
>  / {
>  	model = "AM335x Chiliboard";
> -	compatible = "grinn,am335x-chiliboard", "grinn,am335x-chilisom",
> -		     "ti,am33xx";
> +	compatible = "grinn,am335x-chiliboard", "ti,am33xx";
>  
>  	chosen {
>  		stdout-path = &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
> index fd91a3c01a63..55a454f51148 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
> @@ -12,7 +12,7 @@
>  
>  / {
>  	model = "MYIR MYD-AM335X";
> -	compatible = "myir,myd-am335x", "myir,myc-am335x", "ti,am33xx";
> +	compatible = "myir,myd-am335x", "ti,am33xx";
>  
>  	chosen {
>  		stdout-path = &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
> index d28d39728847..d87ac31a16a9 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
> @@ -16,7 +16,7 @@
>  
>  / {
>  	model = "Octavo Systems OSD3358-SM-RED";
> -	compatible = "oct,osd3358-sm-refdesign", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "oct,osd3358-sm-refdesign", "ti,am33xx";
>  };
>  
>  &ldo3_reg {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
> index 78ce860e59b3..908203fd9190 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
> @@ -12,7 +12,7 @@
>  
>  / {
>  	model = "TI AM335x PocketBeagle";
> -	compatible = "ti,am335x-pocketbeagle", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "beagle,am335x-pocketbeagle", "ti,am33xx";
>  
>  	chosen {
>  		stdout-path = &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> index 7c9f65126c63..61210f975542 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> @@ -13,10 +13,7 @@
>  
>  / {
>  	model = "SanCloud BeagleBone Enhanced Extended WiFi";
> -	compatible = "sancloud,am335x-boneenhanced",
> -		     "ti,am335x-bone-black",
> -		     "ti,am335x-bone",
> -		     "ti,am33xx";
> +	compatible = "sancloud,am335x-boneenhanced", "ti,am33xx";
>  
>  	wlan_en_reg: fixedregulator@2 {
>  		compatible = "regulator-fixed";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
> index c6c96f6182a8..10488b55689c 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
> @@ -12,10 +12,7 @@
>  
>  / {
>  	model = "SanCloud BeagleBone Enhanced Lite";
> -	compatible = "sancloud,am335x-boneenhanced",
> -		     "ti,am335x-bone-black",
> -		     "ti,am335x-bone",
> -		     "ti,am33xx";
> +	compatible = "sancloud,am335x-boneenhanced", "ti,am33xx";
>  };
>  
>  &am33xx_pinmux {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
> index 32669346cefe..f1bdbf053fb2 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
> @@ -13,7 +13,7 @@
>  
>  / {
>  	model = "SanCloud BeagleBone Enhanced";
> -	compatible = "sancloud,am335x-boneenhanced", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "sancloud,am335x-boneenhanced", "ti,am33xx";
>  };
>  
>  &am33xx_pinmux {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-shc.dts b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
> index 597482822608..47b1db476cf3 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
> @@ -12,7 +12,7 @@
>  
>  / {
>  	model = "Bosch SHC";
> -	compatible = "ti,am335x-shc", "ti,am335x-bone", "ti,am33xx";
> +	compatible = "bosch,am335x-shc", "ti,am33xx";
>  
>  	aliases {
>  		mmcblk0 = &mmc1;
>
> -- 
> 2.43.0

