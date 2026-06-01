Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EE1CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 06:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIIouX9atwC8TO7vo2wcLgAJzq/cTaHoTN8DO5/T+0Q=; b=GxdKcSh/a756YhOMwhmvN3Xw44
	Vcp+DpaokmHaDv+6V38egCRHR7tFafkbV01ALgS0DIlf1ctVyI+WgUtbsg6Sxzaq62bzl4rNWSD7c
	GZ8yg4OrV1wkOszbhJE8HBwna7VOwuuGIb16k4wQ2KUsTDLnmFTR2KDnWKp5yjLm7LhwdINEYlkIH
	dK4B+Jz2hJyBQRP5+szbzlWe7Xu7utixGCxoY3jNXdniQiaPIVi4pOHAQUxMCRx4tBG77cNG7o+8a
	WZLN3BozX5oQDk8DBzHdwXoJjqHd+zWZpjoBBwye6Ppg/PmM9FKXCcCBMCv4VDeWk97wjW+dbgOVd
	STuTuzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwc2-0000000AG4e-2p6A;
	Mon, 01 Jun 2026 06:59:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwbz-0000000AG48-1F2a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 06:59:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BFA4A4E42DCE;
	Mon,  1 Jun 2026 06:58:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D9CC602AB;
	Mon,  1 Jun 2026 06:58:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10E1110888CCD;
	Mon,  1 Jun 2026 08:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780297133; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mIIouX9atwC8TO7vo2wcLgAJzq/cTaHoTN8DO5/T+0Q=;
	b=HQBfHFbhqkjsF4pCV3oiBNQaeiPV0l/QdDp1DfBvD4+AlikHlQ0c1ENujAD7kqhbiXt15J
	KM0NSuc3onfrGwhRq2qpaIY1OCeASQkJMl29QvQ8eJLCab4THNCEzm9I78Hs4LTONYY9Ai
	440QtMOWoPVqQ7wOxY5TW0MIO+2RJ0NmUXhVKy8JSl17UmJGfWwmWx8VenwiCp5ESB915T
	6Rysm7UilOxHXF38ffSIzePeikeaqumzH5jT2U2FEwVDiPuy99pq4ACd5uSHFsHDPC1b/7
	C+jZQgL9Ry69ECOdwhNnAXHZIbJdVe8aeVsQiq6SlMDaNusrvR1gdQtmw7A4mA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jun Yan <jerrysteve1101@gmail.com>, linusw@kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, Lee Jones <lee@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
 Andre Przywara <andre.przywara@arm.com>, Baruch Siach <baruch@tkos.co.il>,
 Shawn Guo <shawnguo@kernel.org>, Paul Barker <paul.barker@sancloud.com>,
 Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Krzysztof Kozlowski <krzk@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Patrice Chotard
 <patrice.chotard@foss.st.com>, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: dts: marvell: armada-7040-mochabin: Fix
 is31fl3199 shutdown GPIO polarity
In-Reply-To: <20260525144629.498630-7-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
 <20260525144629.498630-7-jerrysteve1101@gmail.com>
Date: Mon, 01 Jun 2026 08:58:43 +0200
Message-ID: <8733z621cs.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_235859_484567_9FA2ACF7 
X-CRM114-Status: GOOD (  12.97  )
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

Hello,

> The is31fl3199 shutdown pin is active-low [1]. Correct the GPIO flags
> from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.
>
> [1] https://lumissil.com/assets/pdf/core/IS31FL3199_DS.pdf
>
> Fixes: 737929191283 ("arm64: dts: marvell: add Globalscale MOCHAbin")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

What happens if this patch is merged before the driver LED patch? Will
it break something?

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts b/arch/=
arm64/boot/dts/marvell/armada-7040-mochabin.dts
> index 6bdc4f1e6939..cf690a85cc2a 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts
> @@ -236,7 +236,7 @@ leds@64 {
>  		#size-cells =3D <0>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&is31_sdb_pins>;
> -		shutdown-gpios =3D <&cp0_gpio1 30 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios =3D <&cp0_gpio1 30 GPIO_ACTIVE_LOW>;
>  		reg =3D <0x64>;
>=20=20
>  		led1_red: led@1 {
> --=20
> 2.54.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

