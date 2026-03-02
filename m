Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAF0EA4E23
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GjRcmd2N1iD/j57hFFXaD6th41deMj02/OYvYpEwHs=; b=NVFCA3n8tMLG13I6lOjFMYHxUN
	73xPvh4mcHLfHinJtHgTi/TCzbCihQ0c+T2LVLhMnedLnv8S4IiOpDq4qkaet1QJHNlPfhBJVAqOs
	5qaiyK0do/60uGARe2N8fpbDpMGZlGAe4QzwZhAeJMeicK6+1Z3cc/9PDX2//wdpMqueeYrLgdjlJ
	iLEwGrBaWkWLxsE7oem96pt8vuIwaDYPPFvOEMwGKEZTqttn9zuY2GhSoOmNPPNQJzQZhF/BWlWgJ
	X6OXsEztC7yyc6lIZlcXLnfL0KFvKQHZZP/vR3CVB63sNFiiuN1YrG1LtqrIKh96DfCJHTujGBPmy
	R9XSR0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BU-0000000DMYK-1Td5;
	Mon, 02 Mar 2026 15:27:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BT-0000000DMWA-0GZ8
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1GjRcmd2N1iD/j57hFFXaD6th41deMj02/OYvYpEwHs=; b=KVxdjLTR/uI8ag4fds0sJD4jDY
	7vwPSeld5p6KFSFNcf0Yg9Mbn4a6Fi0CZ8LXO7BfLK8Vqvf6uumx30YFbNNlgdn3qqAnJaqNzCRVY
	PtrgyJGcB6X9o7PBSqtFj8GuLyx+eRHsrBl9TpfpyZthRMrsSFkdPdyTZN/o5+YCmg5CxLRn1Qt/E
	f/whb9b2F0dyq0SGXwHhuMXK8oU5W1nWSLiDjIHS4I9Qv8leNVOSoqnPNPYGt3XXEwWJGrpz0QDRQ
	zUttDgeCQAKCRa1Srrcn3atDhSRYzx6/X/S6bUDTBMjzquHfBeYIxcBm+aR2g+Qq5zEqAlgLYKGDL
	nPQXU2UQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5BP-00000009gVJ-2K95
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:27:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3AE4F4E424D9;
	Mon,  2 Mar 2026 15:27:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0E0195FE89;
	Mon,  2 Mar 2026 15:27:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F2D11036959A;
	Mon,  2 Mar 2026 16:27:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772465258; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1GjRcmd2N1iD/j57hFFXaD6th41deMj02/OYvYpEwHs=;
	b=fv7lIBiFrbCktvUOwf0ivICHAgDzgwIDfQeP757nQejg6+Oi+oTMmiUHB/mPzORVQNrfzM
	GffOoQ/G3MYr75aTxULWg2uDqjhZ4p6Wy/TJMexkbIjF5oa18xFnSQMqTrxdFeZRaHrcNA
	sE4A1FvGAtBunq2H8+SGHJOmcExH90p3WUcRRiioHXlJLFiLoNf5HuUibgHg/7I/v/mbtr
	xZDgYKIUMArYToMFD+5eqaboW71UakSKKaWk1xfWE0yL8lJCAGLbWjXfhBukAtXpEKWQte
	ZTSB/pqW4NXm99JykrWfYSqymqSRRXuEwSE4+JN2d/RGzYUShLq+mgam0fWurw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH] arm64: dts: marvell: armada-3720: drop
 'marvell,xenon-emmc' properties
In-Reply-To: <20260221-armada-37xx-drop-xenon-emmc-v1-1-3110e83091b8@gmail.com>
References: <20260221-armada-37xx-drop-xenon-emmc-v1-1-3110e83091b8@gmail.com>
Date: Mon, 02 Mar 2026 16:27:36 +0100
Message-ID: <87pl5mfdzr.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_152743_664658_E19A94C0 
X-CRM114-Status: GOOD (  15.25  )
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

Gabor Juhos <j4g8y7@gmail.com> writes:

> The 'marvell,xenon-emmc' property used in some device trees of Armada 3720
> based boards is not documented. Due to this dtbs_check throws warnings:
>
>   .../armada-3720-atlas-v5.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Un=
evaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
>   .../armada-3720-espressobin-emmc.dtb: mmc@d8000 (marvell,armada-3700-sd=
hci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unex=
pected)
>
> Apart from the warnings, 'git grep' says that the property is used in
> device trees only:
>
>   $ git grep -n 'marvell,xenon-emmc'
>   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts:85:        marvell=
,xenon-emmc;
>   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi:81:    marvell=
,xenon-emmc;
>
> Although handling of the property was there in an early version of
> the 'sdhci-xenon' driver during the initial submission [1], but that
> part has been removed in later versions.
>
> Drop the property from the affected device trees due to the reasons
> mentioned above.
>
> No functional changes intended, compile tested only.
>
> Link: https://lore.kernel.org/r/0390e7a05b6163deabb545f93729ea615eeaaee2.=
1477911954.git-series.gregory.clement@free-electrons.com # [1]
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts     | 1 -
>  arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts b/arch/=
arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
> index 070d10a705bbdf74cd63f6229f214b945fc78699..a313d5687789e349a1a25d69a=
b4bfbd0927dd060 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts
> @@ -82,7 +82,6 @@ &sdhci0 {
>  	mmc-ddr-1_8v;
>  	mmc-hs400-1_8v;
>  	sd-uhs-sdr104;
> -	marvell,xenon-emmc;
>  	marvell,xenon-tun-count =3D <9>;
>  	marvell,pad-type =3D "fixed-1-8v";
>  	vqmmc-supply =3D <&vsdc_reg>;
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi b/a=
rch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
> index fed2dcecb323f0541d076988164f12e68ed37fcc..37e16fb3a3832292484d602c3=
86ec7ffec1f55bd 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi
> @@ -78,7 +78,6 @@ &sdhci0 {
>  	bus-width =3D <8>;
>  	mmc-ddr-1_8v;
>  	mmc-hs400-1_8v;
> -	marvell,xenon-emmc;
>  	marvell,xenon-tun-count =3D <9>;
>  	marvell,pad-type =3D "fixed-1-8v";
>=20=20
>
> ---
> base-commit: fcaf733ca526b69595ed1d227e2cc59ddd24eff7
> change-id: 20260221-armada-37xx-drop-xenon-emmc-9514c385e766
>
> Best regards,
> --=20
> Gabor Juhos <j4g8y7@gmail.com>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

