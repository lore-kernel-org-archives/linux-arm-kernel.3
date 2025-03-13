Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87CBC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 06:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fna2H3vwjdEZcl/b/bY1yvDSI46yeeVTssxA2eJJMgo=; b=due26wGx+RLTQu1hnpjZK8FOCc
	dTms0j6ivI5pkUzgxR1B+dderA1UMJznm/nX5f1l7qJUVK5NMMJmxfbinCR9n10W8WoiskSHUivK+
	N/vhVqoNr7fPG+HgCErumJcm0u2nJAFgmNwoOkH7r/POzmyT+zngRWnUEVAYTNPihinESA3IU+5Fv
	so5CY4VDbaatxqIATNz5myDzyd3H97L0r6qJmBreC9yZfSFay7Ll//vUFWm3xoD+aeVulooyi2qUo
	T6p0kUdtOzcjh7VX4ulWgt6dZbrWHQmD/bTnWtEZ/sOl+Hxk1m/UlNTihMb2fNtmTjXXlPl+chBUD
	v81BXBxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsbkn-0000000AC6f-2FPJ;
	Thu, 13 Mar 2025 06:09:13 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsbj7-0000000ABwW-3y8w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 06:07:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso125284766b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741846048; x=1742450848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fna2H3vwjdEZcl/b/bY1yvDSI46yeeVTssxA2eJJMgo=;
        b=TtkS/Z//hV4o3WdwpeOSyrgFKUGWNiE6WdrEAgM3yYWGuNX7Bd5sgnlxnTXGiktKmO
         +2IceG+GmsVVyoGr5Kn6/1XmWDwIn65pfp0UDr4zyNgei4xkVg0iFUVDbV+qJKz3VBVG
         moaiR9TiBmj8GDv4oiKorxM8u4+JyBwL5tbaDowgABpXZnPx+m7SaQDReGQf0db0aW2Z
         t1qoUjww6+W8lwbiSrSgJFUikkL8YBIPvWRJuWGe21Z9wNI4pOnhCwlErVMvWXxTYp5a
         rpSuq20IvLTWHgChDxAPYiWLO5LAYSJ0JP/V1CX9HVupOoILZewPe06EUQ5c0ppqf/eE
         y8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741846048; x=1742450848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fna2H3vwjdEZcl/b/bY1yvDSI46yeeVTssxA2eJJMgo=;
        b=f9Vk3YC5VOUfHWK76Q1jm8IIh5z1Ujy8UTNM9/sRqgxthAZsLjNGJr6SjiWzKVrG4X
         12+zLNXQvoVlXLPfFc3a4XhpGT/CIVYkGpbhDmdEKHVMHBANm365P+nsMhIOws0yMtnv
         LhY/wXf9kiFmtO3SylC635o0IVWRtFCiduziGHyFXn1BUzVBg1rOKs3H+/xTtHgUghMs
         bVfxTB+PBEJnkbqo53HyY4Uk+ML582tHdWdIIkq+TB0u7fNqiE/wvBpiMzYMAYOVd+aA
         rHQFISe45S5xp7SMKpIzz5Oql/hZu4LCKwZv5hSCQRvotwdzAa/41oUJso1TzXjrBxka
         Diig==
X-Forwarded-Encrypted: i=1; AJvYcCXW6h76uQ1+uFzDpP2nj6pqSDIgb5LpFnGvS2vpYnB1FICQ2Vcg1YtvJRLogp6BVzNgrd5NOHFoy/NJnBdR/J8R@lists.infradead.org
X-Gm-Message-State: AOJu0YxCh2HHLErLIkp1kV5lak5gAkNKd+PWCfRYeZJgAs6McdDiItLY
	iSVIp3U8cD0l6s2kg4RJxHpelhEmtEh2oxpv9pvwAH8DFrOOzXIr
X-Gm-Gg: ASbGncvLDG2U/Uuq4jh+QwWOFihXdq5C3MDrCKUa+iwGyIRVlmQ4awQVnPX4bmsLDdV
	g34+3T8yUcqZtywBRohbsJgjxxXvrviMNpFt6kevYjKzHBdmBB2gLoY2wauz3icf249C0kSlh7G
	VTw3J0LEcISDWZfzZCJyj5TGZnLQi/48y/2vx7Fc7b0+bcrqnA0jHefmtlKsXAD2d1bGtLPXjID
	hRZzB7wzqjkxR7q+JrmhgwihTpfI7JyeZoSGepx390cHW4QgPyuZfVVHi++e+Lzt1cPjkwB65zq
	ejb8u30Cb5Qqop8Eqf9DLp/JpKBtfEIvy+jPcRU9+PPVSmUzZSkkdn946ru7ENVkg2StAgcSCxi
	fLUpNHf5BhWdGaBay1ZpCA7ahQqibPFI=
X-Google-Smtp-Source: AGHT+IHhGz8J8Life4SG/qgqJ0ye1c0G+Al3baprNQ+dcPxYYmPbWk9QrWHvq7NPTGPL3KzA3Wv0eQ==
X-Received: by 2002:a17:907:c10:b0:ac2:7cf9:71a1 with SMTP id a640c23a62f3a-ac2b9ea16d2mr1529284566b.41.1741846047859;
        Wed, 12 Mar 2025 23:07:27 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aef85sm39791166b.20.2025.03.12.23.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 23:07:27 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Michael Klein <michael@fossekall.de>
Cc: Michael Klein <michael@fossekall.de>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dts: bananapi: add support for PHY LEDs
Date: Thu, 13 Mar 2025 07:07:24 +0100
Message-ID: <4637912.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250312193629.85417-2-michael@fossekall.de>
References: <20250312193629.85417-1-michael@fossekall.de>
 <20250312193629.85417-2-michael@fossekall.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_230730_014782_292D2CE6 
X-CRM114-Status: GOOD (  14.36  )
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

Hi,

Dne sreda, 12. marec 2025 ob 20:36:28 Srednjeevropski standardni =C4=8Das j=
e Michael Klein napisal(a):
> The Bananapi M1 has three LEDs connected to the RTL8211E ethernet PHY.
> Add the corresponding nodes to the device tree.
>=20
> Signed-off-by: Michael Klein <michael@fossekall.de>

This is patch 2/2. Which one is patch 1/2? I got only one.

Best regards,
Jernej

> ---
>  .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/ar=
m/boot/dts/allwinner/sun7i-a20-bananapi.dts
> index 46ecf9db2324..4976453ed192 100644
> --- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> +++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
> @@ -48,6 +48,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/leds/common.h>
> =20
>  / {
>  	model =3D "LeMaker Banana Pi";
> @@ -169,6 +170,32 @@ &ir0 {
>  &gmac_mdio {
>  	phy1: ethernet-phy@1 {
>  		reg =3D <1>;
> +
> +		leds {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			led@0 {
> +				reg =3D <0>;
> +				color =3D <LED_COLOR_ID_GREEN>;
> +				default-state =3D "keep";
> +				linux,default-trigger =3D "netdev";
> +			};
> +
> +			led@1 {
> +				reg =3D <1>;
> +				color =3D <LED_COLOR_ID_AMBER>;
> +				default-state =3D "keep";
> +				linux,default-trigger =3D "netdev";
> +			};
> +
> +			led@2 {
> +				reg =3D <2>;
> +				color =3D <LED_COLOR_ID_BLUE>;
> +				default-state =3D "keep";
> +				linux,default-trigger =3D "netdev";
> +			};
> +		};
>  	};
>  };
> =20
>=20





