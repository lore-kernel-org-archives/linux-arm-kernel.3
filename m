Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54505C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 09:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSAVklH3/DZC+dEEajSN7smRFSqHoX6/7i0eooVPPZ0=; b=xKWS+3LJaXycXNjRZYcGpMYqZ9
	RYDbuIZaU7AiHCsPX5O8Xqw68/HDC5xULyY5zbQ8VT+qvKFXwS9Ova3KEsCC81hnvnldiicsPs2tL
	nnRJ4IPnI0NybAp8mCz3+g4Cx13h87HV+vdjeumSTapTSsmaQNUbm4VwSUouULw8kYbaDddjGc83C
	jXKJakQ7CTv37yFW7VjDOp2bOfdb7QprNqiwNO6RJfkE8FN/xFUoQ0hHFkhoK/qBqttehK/dHj/Ei
	TVGTDFOLAE5vJg/4dwIJCVPoeF0jFvIhN5kOxqbI1joqTkCOyfJmiZgEXJTjZAg/YPgmEOZBJ92N7
	goxJiQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ynT-000000094VK-0aUw;
	Mon, 31 Aug 2026 09:59:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ynP-000000094U0-2F0f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 09:59:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 52FAF1A18EF;
	Mon, 31 Aug 2026 09:59:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24BAE60231;
	Mon, 31 Aug 2026 09:59:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72D3B11C78ACF;
	Mon, 31 Aug 2026 11:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788170353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lSAVklH3/DZC+dEEajSN7smRFSqHoX6/7i0eooVPPZ0=;
	b=jOUGKThJq/zryo31e7uyzVfE+Olxc7XCn+ReLMQZYc/gfXZQR2ifcEGH+p0DuyKoZ6ipVs
	mkcV/gZPWCZ22nBBj3USFou+i0mddLS/efvyFjyFMuwpq3xAQ6BghHJR3oHAQu1daSiTXS
	RPEsGEp7M0U1xAZ2ZVfa6rnMlwrhsJVvxVWY5NKkiPN4BylixeZPNtMLxKhAXijXMb7UO7
	hlJ27mS/YbNX1Uvkda2UndZnW117miGI3OqhhCS4aJ3pdZI8wRktz26cmP7jlG8uj8+xIT
	kBEEIC5uig0iVfoPBeL6pa13TuL1kqrwyPxXmFjo2whARdDOPsJV8nMO2r81Wg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dennis Gilmore <dennis@ausil.us>, "moderated
 list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..."
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: fix vbus-supply for USB2 PHY
In-Reply-To: <20260829021103.332384-1-rosenp@gmail.com>
References: <20260829021103.332384-1-rosenp@gmail.com>
Date: Mon, 31 Aug 2026 11:59:10 +0200
Message-ID: <87bjaipq4x.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_025919_736035_54D280C9 
X-CRM114-Status: GOOD (  13.30  )
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

Rosen Penev <rosenp@gmail.com> writes:

> The usb-nop-xceiv binding and driver use "vbus-supply"; the driver
> acquires the VBUS regulator via devm_regulator_get_exclusive("vbus")
> (phy-generic.c). The stale "vbus-regulator" name is never read by
> the driver and dtbs_check rejects it as an unknown property. Rename
> the property so reg_5p0v_usb is honored.
>
> Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index b8576ca0de1c..9de9a8a4267c 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -140,7 +140,7 @@ fan2: j17-pwm {
>=20=20
>  	usb2_phy: usb2-phy {
>  		compatible =3D "usb-nop-xceiv";
> -		vbus-regulator =3D <&reg_5p0v_usb>;
> +		vbus-supply =3D <&reg_5p0v_usb>;
>  	};
>=20=20
>  	usb3_phy: usb3-phy {
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

