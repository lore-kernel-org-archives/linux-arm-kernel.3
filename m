Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F11ACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBXXUhb2BmggesthHwWGiC3WVEvKONX11k5/N5kirYY=; b=fHqHu+fiyXAgm/RdJZuWR/Tkp/
	WtZ2WyyqcgK+VSpZo/HEH9C0mq8VA/ghkcEgr1Xl1usNse/lc3oH2AZ/7BXNFhqT9JxuNaEG9vZ4h
	AGZPQ5HrVcAPX5S675ysqMPQrIfDn/llvaEd41w9dC6/DiSOEFHU8Zk24LwcPNH2BWJm7Lp9derru
	hhLUaoUnsafoi+1nawBKJHthuiV+b0OT8gEcXPEssuqcBxCn/pEP8fMuOSLq0is4etr71abFVnFVC
	UHdiktgLglFXcGMsjsjum+eaKI4O61QNoUFhGf68lMpQADes0blXvUrnL9yhY4xzEdQfh+7/abCVK
	v2PUPKPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvg9b-00000001NI9-0vHp;
	Mon, 08 Sep 2025 17:59:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvd7H-00000000CBL-2NGc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:45:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-45cb5492350so29100825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757342710; x=1757947510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBXXUhb2BmggesthHwWGiC3WVEvKONX11k5/N5kirYY=;
        b=aXBqvPANw0IoHFyywpOX8sQD/2h1m1ZhWrjcoO8vYBNXkPH8DAJKcfif6TP3ktF4Qt
         msouphvk0T/+VJdC6IhTkXKrczX7fCEMUs0rPmq3aYSJakMpw1poG1DUnpIOTAT3/I9v
         rWzroZc9EaTCuBIXqLviVnxrxmcFaqk1zeHKeHwI7AUofnrVhnChCaOCz889tSv1CSj7
         oEiucDpvS4mH8+K6uEO7NqpLxtVMkbaVs8E2GoLOocyA7eptQeUAWjeCYNdAER/yGvWY
         E945jJqI084fsHvYkwbOe55Mhsoos3U+OXz7Iq702Q3S6/oIjDeBAm5paNLs2gX/Bu29
         Fw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757342710; x=1757947510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBXXUhb2BmggesthHwWGiC3WVEvKONX11k5/N5kirYY=;
        b=hPbTUtor+HA+Mubyz7Or6u3S0QxrxRaiEm3n4XCvNlItd+SERVs5N6mABUSqK43d3Y
         QSWryvC3XQLvvnBbL2VAVqRnLu+G4sFoiH6+iYCDvmwbmfuHbl6mt5COdmZ/yjdE4AXl
         Ja8EWGzc/crQ6JqjZPzUOgZIt6zDZO33QtEn8HVSgWXsQmRaJV975xFDtqHa66DFtjsG
         iCk1PJBa/V+xrB9KCfbvah8GZhyh6pA7Dw7qvnUCFBBXbMQ3DqUouJiGSsPdOEhls2OC
         1Bm1Iwk671PN2MraWZ70wlp3/K9vmGhPk5TTX6W7fLaM0OvduVqeAIeRC4dydbwDC6pe
         BGMg==
X-Forwarded-Encrypted: i=1; AJvYcCUIaH1bRbi8X1MEZUwJDNWyiCbFA90lH1Pbeyk5VSJg2yFK5FjS3SnAhAjebSEtq5RIo98IS9ur30rq61FXO1of@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6LTYUmiFyai0PfGTGCuVWCYQwwEEVylQXLw459CmvzQn2T7gs
	7DHecu8tr/fSa+5izyhv8ZgEllMiUJHOWjddeHjejgMp5LQYi5/WDcEj
X-Gm-Gg: ASbGncsfa9GfDhlIBgH6O5fIE5XBNAMuPJtrYlhuwc9N+OP+VoVx1j9Z7jkDqTwiE+x
	vay2iWHiFxBeY+mJtZSO86wSxDRl0DemoOAT8jQFv9dr2y8CZ998ZbsEnltT8A+ZRYB4kR5rQjW
	HZG/wcD3Pk4tyj98hBETdxySLwIJzVJSs30+QWZe4vQvWYwzsSysh2lgiRrS5k8s0378NyB0hx1
	8l1P4+61KgJhF95VYMjCz1GnYHcVY2/xtJmR9uSnOuhUAQ6uuRqgh9M7gOru9PAuRaRnid4GlCk
	cKhNSUcHeXeiq/9Y6sHMiieJoQXvzH/v48nkWLXzD0eUY50Ri4PiXYtSmcyNcrBHfo64CYeCsSg
	/8NSivgxzzd33NQJc4Cd67P5mU05CxcRWDKO9ElaBLQxHViK52q4NkNragvV7BOYB9vSZHBTjmL
	I=
X-Google-Smtp-Source: AGHT+IHoH/kzU+cENxZgae4niFxHNIBgU2yBvIXmO8kprk/rkDniF9PtdgAaS1TlIlleNmcUNrw0ug==
X-Received: by 2002:a05:600c:5249:b0:45d:d68c:2a43 with SMTP id 5b1f17b1804b1-45de3c66dd3mr52823045e9.33.1757342709588;
        Mon, 08 Sep 2025 07:45:09 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddb779eb6sm130993655e9.8.2025.09.08.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 07:45:09 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: Re: [PATCH] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Mon, 08 Sep 2025 16:45:07 +0200
Message-ID: <2012341.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20250818163520.1004528-1-olek2@wp.pl>
References: <20250818163520.1004528-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_074511_605652_B119458F 
X-CRM114-Status: GOOD (  15.24  )
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

Dne ponedeljek, 18. avgust 2025 ob 18:35:13 Srednjeevropski poletni =C4=8Da=
s je Aleksander Jan Bajkowski napisal(a):
> This patch adds support for Ethernet LEDs.

How did you tested this? According to linux-sunxi wiki, this board has
RTL8211E, while LED control is supported only with RTL8211F driver.

>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> index 0f29da7d51e6..7688f565ec9b 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
> =20
>  / {
> @@ -132,6 +133,25 @@ &external_mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
> +
> +		leds {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			led@0 {
> +				reg =3D <0>;
> +				color =3D <LED_COLOR_ID_GREEN>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +			};
> +
> +			led@1 {
> +				reg =3D <1>;
> +				color =3D <LED_COLOR_ID_AMBER>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +			};

Schematic says LED0 is "Yellow" or Amber in this DT. So LED1 should be gree=
n.

Also, I'm not sure if trigger really needs to be added, since PHY network
will set it as such.

Best regards,
Jernej

> +		};
>  	};
>  };
> =20
>=20





