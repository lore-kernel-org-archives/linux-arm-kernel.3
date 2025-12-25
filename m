Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9D5E7AD62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lwi/wOL9435JfspVqwNHJS0rgXD9DXGNHXUGNZoo1YM=; b=uN4FlB2i6o8tRiVtz6FOfVD93w
	X+W91orwAgvJpB66VYZrHbmHyY6I7j4Si8LImu2Zp355vvDTiknsoCB4xUaj1sWWoAh1qbLwBy17o
	kCKFw1hFokCecK35e4fOWek3In6ioJY6bhNADzrDtAOcJFnL+OGTHETGQMCVftHyDA0QJglIdM5A8
	NWQ38mLQ0dju8VfJdwqLQgjhzWyzLxayoPjn8dFFgCf+Hc69cE/EnSDrZ4SR7nrFmUND4SzCIB+gT
	hwPf5reHZDcpNrMA1rDQisETsSb8HCROEU94N4d8tSoXOuARY5C/x8JmjPjxPSXITrBNeo1xrvrB2
	FbJfz42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqP2-00000000cUa-3nns;
	Thu, 25 Dec 2025 18:49:36 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYqP0-00000000cUB-2fZ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 18:49:35 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b7ffa5d1b80so846520666b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 10:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766688573; x=1767293373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lwi/wOL9435JfspVqwNHJS0rgXD9DXGNHXUGNZoo1YM=;
        b=ZEnmg8yzZzbZ3Hd3q2ggTzMxn4VkNe5gYZlH1yaxt+T6iEDlaM1TGlsxjr0gWnatAs
         QMjGDpPgprb8p2Sf8B0SKGpepNeXndoLC7VHr8aqgmkiUcgl+gDWftqQdoB/aexOVCTZ
         MchLVlRCgTj0dMTxDEysNv3HoFCp6pMgWHq/W7z3l3rKubGvyqKPF5sVDafmhGuRFLnR
         5qPTLm+b0EtDsP0ALJEC8UfOdX7QXjWL67iEd6NXdXymO+vqcwjEvDBGb5Ue15Ksz5Y4
         5I6kLrB/ZkAlTj+iz58qzWmFlbw35z8IkqefUyHaz8wlFexpWvgQPIZkqV7ozRnJWu/d
         S0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766688573; x=1767293373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lwi/wOL9435JfspVqwNHJS0rgXD9DXGNHXUGNZoo1YM=;
        b=m6zHbr8ivWKwAA8h3RqrJ+FSs5zdOfh3ZUx0WIDrhOQdJnE/W/WBdCqkQLdXJEXaZE
         eO4QS6HNiXZpBJPWK6FdQPjm/D4Rk1vxT/4tEJuXoV2AhK5LmzNnLxMtoLVyCuTY5lGj
         lxzu3X+dSsuO8Ci+p0F/tarUsxEpsmzlscb7YK6vmRmFflsOBlfcOqM0a2fPVuSSU2P5
         R0/3MIjLgqkpcCHbIPcwDaDM7anrlU2qe/eQKL1WaXnSm2fwTytKmydCDssHEYWq8MRH
         07CwxXSHtGT8h3TCZnYb+Nt7Y0VqULmY6DzrxjdpQYjRZto2nPXfKDaR3SSrsJVeoa3J
         vstg==
X-Forwarded-Encrypted: i=1; AJvYcCU24wNcMEDVeunVTL5ifimCQ1c12EyYPQwKxtF7ek+XNQy3NUkA4jfIWxfP5FPrrhgBOvP2Wyu7SIlYty12JvKf@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+6/7bkJc8ObkxAjORTakjNVJE15ndbRlHBikYZnUB7QE6Mmn
	76aljBMFIbB4eoVMJO6FZ75W57yP5qiCtmJVaeulBKBJV/SZlGNdA6DJ
X-Gm-Gg: AY/fxX5TRX0nEbVQ5Jni+1bKMSRLL3FvJXR8/JeuaNtgj8udoM/780jQiyxm7DYfEcK
	S1Vq7b44hWKVEjs5m0UVS7rLgt7Zese1LRq7+pSYhQPfd0MHOLmUKQ9TtzsYDuBu2puYVMEyJ3v
	GY0Yqd6Ilgev6ImFBzDZHzOQldUgs2VK5SGE9hOWzv7aucODuW2+Ivtb0xFJCQFk0LmiOWerxid
	Ebpi1B3VAu/BAC6bAY9F7nb5tiymbUxQYLZwIrxprjCecXu7T71f4YHdBmbHIKtv8lUDiVAyUGq
	14n/+gqes9IP81ECDkgIJIi5iAtRevRGC1r1ku0G5C619Qa4928Ru93Hdh8OX/bDSZqUEFngaw2
	R2zKh//wlHdT6kd02UFKd0sBKoBXTiP0ssazI7i5dw+ZbL8rL0BUdLZGw8rz++CveqpsqYPyNSX
	RYsvDrtmcZia8E+rzoHMFDM/InJTvisfYxHovmH3JMQFM=
X-Google-Smtp-Source: AGHT+IHGj4ugPVsyxVEKdshMmhjzljqKZD5JHwjw22tMZO+csxcebOAuFJVgXAVvGwk2iqbs87W2hA==
X-Received: by 2002:a17:907:d8a:b0:b73:a2ce:540f with SMTP id a640c23a62f3a-b8036f55069mr2086910366b.17.1766688572432;
        Thu, 25 Dec 2025 10:49:32 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a614b7sm2164305466b.1.2025.12.25.10.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 10:49:32 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linusw@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: allwinner: Replace status "failed" with "fail"
Date: Thu, 25 Dec 2025 19:49:30 +0100
Message-ID: <13929653.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20251225103616.3203473-5-wens@kernel.org>
References: <20251225103616.3203473-1-wens@kernel.org>
 <20251225103616.3203473-5-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_104934_705661_3F78486B 
X-CRM114-Status: GOOD (  13.81  )
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

Dne =C4=8Detrtek, 25. december 2025 ob 11:36:15 Srednjeevropski standardni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> The device tree bindings specify using "fail", not "failed".
>=20
> Fix up all the ones that are wrong.

While patch indeed fixes the issue, I wonder if "fail" is proper value?
According to specs, it means that device needs repair. What about just
keep "disabled"?

Best regards,
Jernej

>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts | 2 +-
>  arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts      | 2 +-
>  arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts b=
/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> index 63e77c05bfda..f2413ba6a858 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-dserve-dsrv9703c.dts
> @@ -112,7 +112,7 @@ axp209: pmic@34 {
> =20
>  &i2c1 {
>  	/* pull-ups and devices require AXP209 LDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c2 {
> diff --git a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts b=
/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> index c32596947647..e0c7099015da 100644
> --- a/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> +++ b/arch/arm/boot/dts/allwinner/sun4i-a10-pov-protab2-ips9.dts
> @@ -96,7 +96,7 @@ axp209: pmic@34 {
> =20
>  &i2c1 {
>  	/* pull-ups and devices require AXP209 LDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c2 {
> diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts b/arch=
/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> index 5bce7a32651e..5dfd36e3a49d 100644
> --- a/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> +++ b/arch/arm/boot/dts/allwinner/sun6i-a31-hummingbird.dts
> @@ -170,7 +170,7 @@ hdmi_out_con: endpoint {
> =20
>  &i2c0 {
>  	/* pull-ups and devices require AXP221 DLDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c1 {
> diff --git a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts b/arch/ar=
m/boot/dts/allwinner/sun6i-a31s-primo81.dts
> index b32b70ada7fd..fefd887fbc39 100644
> --- a/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> +++ b/arch/arm/boot/dts/allwinner/sun6i-a31s-primo81.dts
> @@ -90,7 +90,7 @@ hdmi_out_con: endpoint {
> =20
>  &i2c0 {
>  	/* pull-ups and device VDDIO use AXP221 DLDO3 */
> -	status =3D "failed";
> +	status =3D "fail";
>  };
> =20
>  &i2c1 {
>=20





