Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75017C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KipOP6WZevqOmUSTSh474YO5ixrB7kPV1cCaZGSd0cc=; b=UJOotkPmdju5PRMzo6mWE18rZ3
	tmpDu1e7rxIdbZ78CqiR2cDR8Vbd2AjjIDBkUOR3H8mL/tHtrSxzRqXOKwSNGsjQ7+HQAKs1uWECs
	5YUn4bCCr6yvrWhDZvNP0A65kpEtcWH3nubsjfS8NOKvHlQfTSHzQ8NEmi5/PXxbBHSlyFWD5kglc
	vbj5Kl4aL6EXEyy9ZGzTZYo54HK8CT3xrc4G2RIj6nYScZ0vnJNMR9qnws5Q1wJ6yMHzxdmu4K8rH
	sZ7sa0i7BsagoFLJyfHmT08+lXg7BtGzF50PZqvJq2Cy+rLgXZW6SF0Dmruh2XO/bOIdgqGvD9uFY
	7/9GPmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCTv-00000003AFy-09a0;
	Mon, 17 Mar 2025 15:34:23 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCQc-000000039TO-0RdU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 15:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742225457; x=1773761457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KipOP6WZevqOmUSTSh474YO5ixrB7kPV1cCaZGSd0cc=;
  b=VsVHQIYbkrcd171jFdX+gvyzahQSPz/kdLCHHDsK+114AiLeWyButnEo
   kQcCJcarrgIFn21BN/I1Y0MIGLfNDNyfBQXo8/4hTFMjj8K+hxxPS1yV9
   +Kup7bLIVfLUvZbfj5yo73bnYYdOj4OCbIeITwryf1y5RGA//gf/VVsIo
   uDVl3e3qnlSd2bUEHFr/yptj0t0i88QSIm5gHhJvrceBWEg4Os5h3uSZK
   gTMvmOOWHwKci2xz2gfxCvOOVB1F1lSFYaRNGj0F+mbRALqEWbiWp3wcV
   pPIfTDTNzBha84QUbL1QHmaTSOSkz9vlZSfdqrHK5PLjGr5zVRDu9Zl6X
   g==;
X-CSE-ConnectionGUID: 8oKGuws+Tk+2dnMvWspdJQ==
X-CSE-MsgGUID: ZUbpwkqrR8O5ARb/CW7m0g==
X-IronPort-AV: E=Sophos;i="6.14,254,1736809200"; 
   d="scan'208";a="43000310"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 17 Mar 2025 16:30:52 +0100
X-CheckPoint: {67D8402D-3-903EAEAC-E04C76C8}
X-MAIL-CPID: D69F11ED0F4E03A24B6BC23DFFFEA6EF_5
X-Control-Analysis: str=0001.0A006397.67D84023.003C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B47A1648CF;
	Mon, 17 Mar 2025 16:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742225448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KipOP6WZevqOmUSTSh474YO5ixrB7kPV1cCaZGSd0cc=;
	b=Uq5zOxs0Q2Oh2zzZOxB4inAAzXeHVrTzt2nX709skPbcWUDR9LYBoiUiAYyf52iv2YweG5
	JkLN6VCZjNG8ALhUIQovwtDil5XYyo96mm4Yxbz1Z/LE9/s1fn6eFgm+MrMDIu+xriBYNn
	8f6sVJQ3EztaveLY8jMPucGHgQHW8GEmi7SOL/EWp972DQyRggo5MmHRUv/+YE0AEig3Ag
	BIK+aNKm9A/LxUAabR4O3mapr8jb0kyL3GTWJEgLDYpVURN8x05NjMBX4K72V2duHca+7p
	a9vaGfhs2e4JvYhdHosyBG4cdHddSLC1Avxty8JerPZw6RCV8C07fcF7zpkZpw==
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
Subject: Re: [PATCH v5 2/5] arm64: dts: imx8mp: Add mu2 root clock
Date: Mon, 17 Mar 2025 16:30:46 +0100
Message-ID: <5873285.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250317133306.2003909-3-daniel.baluta@nxp.com>
References: <20250317133306.2003909-1-daniel.baluta@nxp.com>
 <20250317133306.2003909-3-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_083058_633477_8029F575 
X-CRM114-Status: GOOD (  13.33  )
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

Am Montag, 17. M=E4rz 2025, 14:33:03 CET schrieb Daniel Baluta:
> Enable MU2 node and add mu2 root clock.
> MU2 is used to communicate with DSP core.
>=20
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index 3b725fe442d0..5b443fbeded8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1253,7 +1253,7 @@ mu2: mailbox@30e60000 {
>  				reg =3D <0x30e60000 0x10000>;
>  				interrupts =3D <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
>  				#mbox-cells =3D <2>;
> -				status =3D "disabled";

There is no need to enable MU2 if the DSP is disabled by default, no?

Best regards
Alexander

> +				clocks =3D <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_MU2_ROOT>;
>  			};
> =20
>  			i2c5: i2c@30ad0000 {
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



