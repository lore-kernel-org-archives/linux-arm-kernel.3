Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECA0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKTqAHrzTqK2etFjJsAwB8b24D1cRMcQiVtfJ6wvNcQ=; b=Bc6Oo+d1g4Usf72QCCSHJBpw8t
	v9KvkUz5n+9brb3IFP8aYdyaytYxwIEYBMfohlKgLuQIZWMRMKJnul1yaR83GPYbMqAbm6vAoSZUJ
	egsOkbVJzJ98srDLnEymmQ+a6u9Hsxu+fRxD0+xBURqQIOk0S7HRKhBziMcPTW7tuojhtXbY8jCEj
	uRfSzj/4yhTURtQq/O2FlUiEEwOmCr9m0smDalMledCqJIQUcWARC6Xyro2KK5pF9LQRFCtNZBb9P
	TwEW5Ui6vLdGlqaix9yaclbs/9D2Y0KLcgFQwrKuPFwQmU7UqRsWUBbG/axglrErTUgoOg9N+a+z1
	soDYCJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3LO-00000009OgP-0QFq;
	Fri, 12 Sep 2025 12:57:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux3LL-00000009OeC-3twU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:57:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3AC6B1A09F3;
	Fri, 12 Sep 2025 12:57:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0127260638;
	Fri, 12 Sep 2025 12:57:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 422FC102F2A70;
	Fri, 12 Sep 2025 14:57:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757681852; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AKTqAHrzTqK2etFjJsAwB8b24D1cRMcQiVtfJ6wvNcQ=;
	b=HxtNRvlXl7AgpEYwX4jV3sGSiMtCIrbcAJTzAaXRgI3+WvwtmJsxO65WY788GJnNyEYEsw
	uez+I/TI+as1jTGZhed28C/VnvTrMr63d5RWvmwRcQwbs5MLhNSFmab/LAyM4bfJ7gDD4j
	MPCdipnIWXWqhitAMHSjYDsaVuIxOZ/UMEjD63X2yUuxoO9yRqUGon+86cJ+2lqRIPZL4b
	9C1E5nf7cg0pO/qQzEr+NYNYCpg8EthAZ/eqYuiJh+gzvPIiiKVndlTyf4bUnWsDa1xTZB
	mjGf+MVTvdZharqWHgGztfa7cRPlMNzPjd4QFTia43/1HKImzdjhPF5oehP+cg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Josua Mayer <josua@solid-run.com>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Wunderlich <frank-w@public-files.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: marvell: cn9132-clearfog: disable
 eMMC high-speed modes
In-Reply-To: <20250911-cn913x-sr-fix-sata-v2-2-0d79319105f8@solid-run.com>
References: <20250911-cn913x-sr-fix-sata-v2-0-0d79319105f8@solid-run.com>
 <20250911-cn913x-sr-fix-sata-v2-2-0d79319105f8@solid-run.com>
Date: Fri, 12 Sep 2025 14:57:28 +0200
Message-ID: <87ldmjomkn.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_055736_100920_EF7DF56F 
X-CRM114-Status: GOOD (  11.24  )
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

Josua Mayer <josua@solid-run.com> writes:

> Similar to MacchiatoBIN the high-speed modes are unstable on the CN9132
> CEX-7 module, leading to failed transactions under normal use.
>
> Disable all high-speed modes including UHS.
>
> Additionally add no-sdio and non-removable properties as appropriate for
> eMMC.
>
> Fixes: e9ff907f4076 ("arm64: dts: add description for solidrun cn9132 cex=
7 module and clearfog board")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied on mvebu/fixes

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi b/arch/arm64=
/boot/dts/marvell/cn9132-sr-cex7.dtsi
> index afc041c1c448c3e49e1c35d817e91e75db6cfad6..bb2bb47fd77c12f1461b5b9f6=
ef5567a32cc0153 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
> @@ -137,6 +137,14 @@ &ap_sdhci0 {
>  	pinctrl-0 =3D <&ap_mmc0_pins>;
>  	pinctrl-names =3D "default";
>  	vqmmc-supply =3D <&v_1_8>;
> +	/*
> +	 * Not stable in HS modes - phy needs "more calibration", so disable
> +	 * UHS (by preventing voltage switch), SDR104, SDR50 and DDR50 modes.
> +	 */
> +	no-1-8-v;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
>  	status =3D "okay";
>  };
>=20=20
>
> --=20
> 2.51.0
>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

