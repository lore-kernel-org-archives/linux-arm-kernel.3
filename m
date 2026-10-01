Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2C3CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIZGQQshvUma/6DcqkuS/JxSHm+uvQgTCEKSqUG/nes=; b=LsXsJWEVLVaNLkYf3GpC+ULMTT
	tWosCjGZZoE0veTCADokG+q19kln/urcRAxtKlXxvPtyvTHzS83PuRWMTqVMSvZqVfJfUmRu6Bo+Y
	VEZJaTbzv+UNK6kSBc+HnHc4jyj4wvsyFWmmj9S0QQjDVLGWwgvfzEiwp0TKW0xTqxQdVaF5Y1dbR
	dF1BjmmWnISYisXEwC+Z719SgRZkTfDCbK199pGzTXEnpwUS9hw9JUgW5q/klLzSur0wARyxkPzGM
	UslKFf/QOug5UWfd5SE7btZjrsbiN/hsTWt0vyN2R8NQV+baqrKVOZdEbACrSk1C6CxcdETdzWpre
	y76ZkoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJNd-00000009fJt-0bOg;
	Thu, 01 Oct 2026 16:11:33 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJNZ-00000009fJ1-2ZvG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:11:32 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffed768deso18342475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790871087; x=1791475887; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIZGQQshvUma/6DcqkuS/JxSHm+uvQgTCEKSqUG/nes=;
        b=jc+Oo4gNl++YsME6YsWlxCHvR1ckGlQnv/XgeVVXdP+XTNsx6a+ARZN+MovC3zJ6it
         q4T2kpWzOLDDGaRKToKVQvwMQRpRcyhSVG1oO06obCgDhROnncoFnjPrxk/BNszV2pn0
         DwM5muCAuSWs/GuOsfTtCypvEqp164gzuWWn3+Uc37ibtUaarlVMq28yu+otfYDSBPKP
         ZVtOtntr40nO5byCEylm9bP/lTrjiMbga0V3+9v1Hz82uaBk2p7kRdclj8RLrV8Mpinp
         uqNkM6AjaMS43QYWo5/aUOXTOWm4RCIhSI9RePJOr6uznXpqVjiTss1vpsxtbabB6Rhd
         17uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871087; x=1791475887;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIZGQQshvUma/6DcqkuS/JxSHm+uvQgTCEKSqUG/nes=;
        b=SrGzC3BExGT0Iv38oRFIgwL4LxTMBtUFpAg9PIFv56qM/K9vdeSHqPW6Gmvi67eFCC
         Z/i3/ueRvTrBveTwEGSNGplx99dUwuVC/sIA+OgDSganDNPLguSID1/bvDk792Vdj8SV
         jj6mXqu+PWc0LUaafdPr6evdQER3pBa4L23kvjLF8IlTV28VA9mN3Zn1uQ2hyAmrlh5H
         pUPF2maYPB/tzkifH3pG7H+VN7wl08KvJB0o+cfNhnJvbmch+BxJNhohEocpHViwmEhx
         WwjH92IYhcF88SrTEq5/QLIHnPeEP2DodJsgFYsQVnMNTneBbSJRQCJNEk70t+vGq1WY
         59vg==
X-Forwarded-Encrypted: i=1; AKwUvBy6XAkV55rzNfLnh6eiPkS51a1a8q3BjVEjoeABoLE3AJ6eDzg2CA2Z2Y6ycJibfQqbhQMzH5+07sa940BWWo6l@lists.infradead.org
X-Gm-Message-State: AFuF++nNZJevuwZ8jGsxfstLNLYS6VoRPAtdYnjEDfEcroiGO9UWi0xl
	e22akueD7iV2aGLVAQb71tOQt5bot1H3/VFir+8RV0tX/ZXOuiWZRd3C
X-Gm-Gg: AYBFou3fjAdQFl+dnDON2nrkfggbGlsnu15EJxQzNXGvSSBTeHAp/CUKxhnpqnml5ir
	pzm5vVwOWKcLyG6ajoo9IDGIdxuJ/jkjaIG899/X1PvhxHO1UvfLr43Xi88Oeon+a35dHZFS2lE
	tKuZNYnp4cQ/Xqn5pcSmOlwF44Rd9x76N8Xj9Cgan8zDJiFpG8lYCHo5aYkdi4srdkqBFu3mvzn
	zfQG+doEsVsU9+qBv3Alue7rsDBzKoSTas4IvKAfoyBVybJrldp55Wg2ls58yHuCIV0E5tfr/tE
	YKfYvG3IARz5QCnbMyMH35EhNF5qcmlGdRuUchjCnlccUJc2CVCnBrRXTYKXPwjKPM3IDGAgVwQ
	bVcfW/U/nbUwsHq08jl1iSXOeDQBuLTILBCIUUkSPIrwUJgPVsEmwOPhtV39SxI7PDTgzFCp7IY
	nChmLpDCf2z9t2jFGF3SrFyIbRP79vNCMC4oTXbQ7TXrV3JLxSFUkKCyU0U4PyWv43v/cUNcvCE
	3bQlnP25Yqr9t4FiBR8AQ1HcIwncIQcQ+rAbgYYkDmfjn/7IX/nWYonIU8WH89k1BEdqZyNtek7
	mlRVKJegW4tdwNeNw7HYWdwmX9y1vSOlKkh05I2cENqXNOr5qsoc7pAhqUCRGpcmvxW9kpuzSsA
	pGKQ0cgCd8Mu/y/OhuIZlilxq1aMyVNJhzp4fidSQ9GJA82g1YxkJjgH4ALzVittpZxkksIlzvC
	vIko/iC5Q+VDGzyMenq12HrlkZ
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a027447475mr3271805e9.0.1790871087229;
        Thu, 01 Oct 2026 09:11:27 -0700 (PDT)
Received: from jernej-laptop.localnet (95-143-149-57.dynamic.telemach.net. [95.143.149.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de18sm3629464f8f.44.2026.10.01.09.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:11:26 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: Re: [PATCH v2] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Thu, 01 Oct 2026 18:11:25 +0200
Message-ID: <mSzGX1AcQ6yrkdDVueDg2Q@gmail.com>
In-Reply-To: <20260927200820.795348-1-olek2@wp.pl>
References: <20260927200820.795348-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_091129_677524_2EE01B6D 
X-CRM114-Status: GOOD (  13.92  )
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

you mispelled "allwinner:" in subject.

Dne nedelja, 27. september 2026 ob 21:38:18 Srednjeevropski poletni =C4=8Da=
s je Aleksander Jan Bajkowski napisal(a):
> This patch adds support for Ethernet LEDs. Keep the default LED settings.

Reword message. "This patch" should be removed. Check other commits for exa=
mples.

Other than that, it looks ok.

Best regards,
Jernej

>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> Changes iv v2:
> - add defaullt-state property. Previously, the LEDs were dark by default.
> ---
>  .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> index 6e57ee19e799..c23315994799 100644
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
> @@ -132,6 +133,27 @@ &external_mdio {
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
> +				default-state =3D "keep";
> +			};
> +
> +			led@1 {
> +				reg =3D <1>;
> +				color =3D <LED_COLOR_ID_AMBER>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +				default-state =3D "keep";
> +			};
> +		};
>  	};
>  };
> =20
>=20





