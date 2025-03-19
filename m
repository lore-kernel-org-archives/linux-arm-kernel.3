Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6361BC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlT/C20cWGKRSDi1pjWsYB6aiO4zGZT8fzSlsIsRNJs=; b=HSM+lOK4UbtH8GOg53J6THE7vQ
	5x4nOGNQYxv2HURtWmPKB632yqCBrkf9r+9Zqrc4RRJPlKCsykKTAfhARwjvQ16kwrF4F4VzEQvfQ
	FW02fUWmwGoCqbQXiJGFjoWLCbLuu3j9yR1r9FAJl9XBkan/B9SsXKz9if/JPAjMr16Pz6wyANQGG
	Q/J6lRn5qq3ukfuJoYV0k6x/oz/r/+3tKiITYjrNCxQFLHEctHhA4xrihEPWiZdixNZwqm6CblFJZ
	OFTHrs0GfrJ9a4H2pKOvYWyXEKt3P0hBUWT354wIP+8Yg5mjIIesuo3edvfGNgxWaOwzrzu6if3Pr
	2DGb/noA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqHn-00000008bwm-3E8v;
	Wed, 19 Mar 2025 10:04:31 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqD5-00000008bHN-2SML
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742378379; x=1773914379;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GlT/C20cWGKRSDi1pjWsYB6aiO4zGZT8fzSlsIsRNJs=;
  b=gs3crE0wRSUOmcw6+9dj6mzyOihRJ/oDtC7SCECsSGzf5slu6STRlzyr
   7kzyTTeMmcVAoy9IqIpJl9RQ4xNbXthcFOyPvSyKrTw7rXR1+ekMsTY8Q
   1oMZgte5p+dOvd1P1VhgC+yDQPZOr4Q1zae+tlqPhvimG2lulemf34E/3
   Bh0N3ZxYoINQDXLDCpOlaQpTVX7D8Xjxn7DW6Qtkxc/hajoWI3F9YS1SE
   2yE5nlMtR/AwKEQ4GoDZp9xJnLrXjlKyrWfexZaKCRvZlhs+Z/qqu6lcX
   PDyYtM85ip2RjxqdfXm9IPWq6DKlnhknYbi+LqOHew3qEu6KDohQyv2FZ
   A==;
X-CSE-ConnectionGUID: xLtByYCFRwm1Mpj9OTlMyg==
X-CSE-MsgGUID: xhT83+S8RHS7Vf1VWKmArA==
X-IronPort-AV: E=Sophos;i="6.14,259,1736809200"; 
   d="scan'208";a="43041375"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Mar 2025 10:59:35 +0100
X-CheckPoint: {67DA9587-18-7141A0B0-E6EDEC14}
X-MAIL-CPID: B0D1A9EB8A7FE01E6C3F0B58B214D668_3
X-Control-Analysis: str=0001.0A00639D.67DA957C.0053,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 695011609D3;
	Wed, 19 Mar 2025 10:59:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742378370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlT/C20cWGKRSDi1pjWsYB6aiO4zGZT8fzSlsIsRNJs=;
	b=XTsKLwFytC12f2y9DCUDnDU+amWCWgwRNDRiqQi5I4Bsc4+JxbzXJfuaHE1in7liXkSSNr
	57rK2Q+kycs4U5FtJNk0kZO0Z9gl9cWEqa1ePkJX7V8vLrtrlR4CjrrKIME9oS1H6ezQGT
	PYNwhJb5SKVHoB6uU+t/DZ3BSpogTvdEGezueBbqfnOuVOerS1QmJ/iTLgk0uw8Zd9K/Gr
	1EbJvqeWMsPNMMKd2cAOwY9DJ8e4CIyBgXpqVFxyPApeyMItEMHfebPRBtSRGViDsSmed7
	FN4cwFtkkLO7GipfLuEAM4vtFz6YI9gfqJCNdgC2be1h0r7rFAN3T6fT239+Pw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: shawnguo@kernel.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, krzk+dt@kernel.org,
 conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, frank.li@nxp.com, aisheng.dong@nxp.com,
 daniel.baluta@gmail.com, laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com,
 iuliana.prodan@nxp.com, a.fatoum@pengutronix.de, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v6 2/5] arm64: dts: imx8mp: Add mu2 root clock
Date: Wed, 19 Mar 2025 10:59:28 +0100
Message-ID: <4999695.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250319094621.2353442-3-daniel.baluta@nxp.com>
References: <20250319094621.2353442-1-daniel.baluta@nxp.com>
 <20250319094621.2353442-3-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_025940_116235_16725FC9 
X-CRM114-Status: GOOD (  14.72  )
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

Am Mittwoch, 19. M=E4rz 2025, 10:46:18 CET schrieb Daniel Baluta:
> Enable MU2 node and add mu2 root clock.
> MU2 is used to communicate with DSP core.
>=20
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 1 +
>  2 files changed, 5 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-evk.dts
> index c26954e5a605..d2fdb420f2d3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -690,6 +690,10 @@ dsi_out: endpoint {
>  	};
>  };
> =20
> +&mu2 {
> +	status =3D "okay";
> +};
> +

I think this is supposed to be part of patch 5.

>  &pcie_phy {
>  	fsl,refclk-pad-mode =3D <IMX8_PCIE_REFCLK_PAD_INPUT>;
>  	clocks =3D <&pcie0_refclk>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 3b725fe442d0..deb98f03180a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1254,6 +1254,7 @@ mu2: mailbox@30e60000 {
>  				interrupts =3D <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
>  				#mbox-cells =3D <2>;
>  				status =3D "disabled";
> +				clocks =3D <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_MU2_ROOT>;

Please keep status as the last property.

Best regards
Alexander

>  			};
> =20
>  			i2c5: i2c@30ad0000 {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



