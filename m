Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5ACD0D142
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 16:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9pSGC/oLaDuML1ifdt7/iThN7wpM2Uqsbh75Zxu46w=; b=uuzJ2EGIxG9Od033ouYSQsDXyC
	lz4AO7Xbj9Q0ye/GDjzYU4AKx0FYQv4xLwjHWjt5lxbCa1Bu7sVAjoMiTn1mypUJ2g4/Rjrur91rB
	y6RY/S+7+mCdbJGnL70EpArP+ToRu4yaUt8JCJEKWRmQQIkRqzIhLyMN+lLpEnfbMKwPAlPiQr8hy
	+GChV6wQJoPnxc0/ClzSRMgM8RRqiS4/K/WakZsY04bwGieDLuhe6TiEH1G8AG7+sQBbCgV2HdoYt
	XUaZVsTGhauMMsQJpWYwG4Vf/dJQAut0+wLOed7AkcStW8QGuJV9k51E76l4pHEoJU9/NbYbhga1j
	338E/zGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWkf-0000000FKpa-0i2O;
	Wed, 07 Jan 2026 16:51:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWkd-0000000FKoy-2SKD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 07 Jan 2026 16:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M9pSGC/oLaDuML1ifdt7/iThN7wpM2Uqsbh75Zxu46w=; b=PmSdrDEfyU9v/axywPWvklUErU
	8DXFNlCUStj75Y5MDm+xXrw6jn6sVL9JwZGq/lERbD7nGjwXBSaMY7ztnzMNwH99WSUWZvNEoyJvL
	FS/TkqDDd8WhRVD6Ia2zBWMZqxG0O90FGftxYtaLvA5xozkqUkkwb48nRjjQPt952a5PF3aCAzph3
	nt6MYze+SQiehaoUrFU9EUncwWyfo+0rIojAMgIBNprEVBQZNuauEnuuLVJpdxP3IUjXrmdq+LdMY
	ZI6L0xn3fICKHz8RcbmL860HX4viMoS/MOplwrFhrpl2b6SKy+0lpqIyRisdJhqaPb6eZY/C4L3Nw
	ArHDvMNA==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdWkZ-0000000Bin0-3l0d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 16:51:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C8B231A26DF;
	Wed,  7 Jan 2026 16:51:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A87F606F8;
	Wed,  7 Jan 2026 16:51:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E688E103C87CB;
	Wed,  7 Jan 2026 17:51:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767804668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=M9pSGC/oLaDuML1ifdt7/iThN7wpM2Uqsbh75Zxu46w=;
	b=b2MEexUcepyZzHGVNE1lLP45R9wV1vnWcS+VCUC3+WdY5OqnHVlfTORSBz5Zvai1fxlruG
	VXE6vRSu5xGXRhsAAVUptZqfUJin3dG0YbPXgwwUhVVmiY8YhE8wQlSfgB65p/JLiRTgfw
	PjiVphcfS5luAkkFOhvw4l5O78R4FZ30VoeN0FS+85CXFnEN/9iSPifdjnLMMPnKL01lS1
	4qUAB52aZ6ev+P1eIY+u+zeQM2vEd4f4rcg6sR9ScJAmz1Djml5TWh/z/o7EtQaZzFYO4D
	Rtq/1SEw9VD5oxWJW3qrvyUyMadCvOWjVavin5C0/hUFR/AbTtPWATUkChWz2A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: change regulator-gpio to
 regulator-fixed
In-Reply-To: <20260105194653.3189515-1-robh@kernel.org>
References: <20260105194653.3189515-1-robh@kernel.org>
Date: Wed, 07 Jan 2026 17:51:07 +0100
Message-ID: <878qe9qsck.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_165112_117314_89B79CE1 
X-CRM114-Status: GOOD (  13.25  )
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

"Rob Herring (Arm)" <robh@kernel.org> writes:

> A "regulator-gpio" must have a GPIO control, hence the name. There's no
> GPIO on a couple of Marvell platforms at least as far as the DT is
> defined, so change the regulator type from GPIO to fixed.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts | 9 ++-------
>  arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi | 3 ++-
>  2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts b/arch=
/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
> index 9f4bafeddd82..a881a3326dba 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
> @@ -26,16 +26,11 @@ memory@0 {
>  	};
>=20=20
>  	vcc_sd_reg1: regulator {
> -		compatible =3D "regulator-gpio";
> +		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_sd1";
> -		regulator-min-microvolt =3D <1800000>;
> +		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
>  		regulator-boot-on;
> -
> -		gpios-states =3D <0>;
> -		states =3D <1800000 0x1
> -			3300000 0x0>;
> -		enable-active-high;
>  	};
>=20=20
>  	keys {
> diff --git a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi b/arch=
/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
> index 6f3914bcfd01..71c225221617 100644
> --- a/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9131-db-comexpress.dtsi
> @@ -15,8 +15,9 @@ / {
>  };
>=20=20
>  &ap0_reg_sd_vccq {
> +	compatible =3D "regulator-fixed";
>  	regulator-max-microvolt =3D <1800000>;
> -	states =3D <1800000 0x1 1800000 0x0>;
> +	/delete-property/ states;
>  	/delete-property/ gpios;
>  };
>=20=20
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

