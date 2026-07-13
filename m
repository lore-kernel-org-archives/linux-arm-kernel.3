Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF326C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQE/wiW/jclgg495wpQG3v/oHjWmW6CVrfT4f354tFE=; b=KQKDWMKvQu6svOK8IOqlPocKSr
	FRGp358JBZpQBSM0bhrLKrwupFfTmlGx3yqrppJxijFsdIxnGkuFn9R1aW5ZFkXADT9ST1HfmnCYb
	wHL3NE3rLZ29z9I1Y2ZwgEVcADmTklRQLqmvxDc9rTUskCXZYHYn5vV/wiGPOjDqc5FNaJh2YdeMS
	o44J88DO51+oQdszKHFCHur95/E571W+Jn+ZuUlknjN8KxTpV5pbBEKwJWT19vPCvqoDk0HIvak+y
	yGq/kM57k9Fmj7kAhqTSDk+UF0+LvFOR+jV9Z1JFk1I0ItHMfL/sUAqbDF7zzxgJDxbZJ2BUI34rC
	A6XqtYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBGZ-00000008T8f-0brI;
	Mon, 13 Jul 2026 07:39:51 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBGV-00000008T5z-2BVk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lQE/wiW/jclgg495wpQG3v/oHjWmW6CVrfT4f354tFE=; b=OAftTB7UCaDl2mOYVvY5EzVa16
	k3ucxR6uZJp2FKYnsFqkvb/2f0jqWt+msIBCkx9ZBDuYKeY72RNe5UMGLC9dVXvDeO7Wp+QLvv9vL
	NL2DaKvFEB8hykhV7wRWmMLnpy/PiXeRMrJ76tMnq7mkAOxkhgvY2Pg+4N+pEEwlS8JLn9RZ9Ggku
	3aUMopvFodI4sfNgC+z/benIdjIW48PPZmu76cb4U7Ujk3A6NY7yZ5WlRRL68lQQKQjnIGbxSbw+W
	Fsd5JrCnQG9IizjZnC4Cv5D2g++BV3vuKzh6h3HQZA2cFLCVRI3DwhFXPjVqfistMtoLjb0ZTBGW4
	RfoBftfg==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjBGD-000Ezk-2W;
	Mon, 13 Jul 2026 09:39:29 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjBGD-000BRr-0n;
	Mon, 13 Jul 2026 09:39:29 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Esben Haabendal <esben@geanix.com>, Esben Haabendal <esben@geanix.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mq: Add DCSS node
Date: Mon, 13 Jul 2026 09:39:27 +0200
Message-ID: <2849825.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260711-imx8mq-dcss-device-tree-node-v2-1-037026d45c21@geanix.com>
References: <20260711-imx8mq-dcss-device-tree-node-v2-1-037026d45c21@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28058/Sun Jul 12 08:25:26 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_003947_667760_45A70313 
X-CRM114-Status: GOOD (  21.91  )
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

Am Samstag, 11. Juli 2026, 12:18:42 CEST schrieb Esben Haabendal:
> Add node for iMX8MQ Display Controller Subsystem.
>=20
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
> This is basically a resend of a patch from 2020 [1], which seems to have
> fallen through the cracks.
>=20
> I did not notice that patch before sending my v1. As of v2, this patch is
> identical to the old patch, so I have added the Reviewed-by tag from that.
> If that is not proper, please remove it before merging it.
>=20
> [1] https://lore.kernel.org/all/20201125103909.16548-1-laurentiu.palcu@os=
s.nxp.com/

Looks okay so far, similar to the one I was using for tests.
Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Unfortunately the DP/HDMI output driver is still work in progress and last
time I tried (v17 IIRC), it didn't work on my platform.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20260519-dcss-hdmi-upstreaming-v23-0-561552=
4a9c63@oss.nxp.com/

> ---
> Changes in v2:
> - Moved dcss node under aips4 bus.
> - Link to v1: https://patch.msgid.link/20260710-imx8mq-dcss-device-tree-n=
ode-v1-1-fc724dfd574e@geanix.com
>=20
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi
> index e60872aeeb49..d75710cdb5b4 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -1598,6 +1598,29 @@ aips4: bus@32c00000 { /* AIPS4 */
>  			#size-cells =3D <1>;
>  			ranges =3D <0x32c00000 0x32c00000 0x400000>;
> =20
> +			dcss: display-controller@32e00000 {
> +				compatible =3D "nxp,imx8mq-dcss";
> +				reg =3D <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
> +				interrupts =3D <6>, <8>, <9>;
> +				interrupt-names =3D "ctxld", "ctxld_kick", "vblank";
> +				interrupt-parent =3D <&irqsteer>;
> +				clocks =3D <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
> +					 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
> +					 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
> +					 <&clk IMX8MQ_VIDEO2_PLL_OUT>,
> +					 <&clk IMX8MQ_CLK_DISP_DTRC>;
> +				clock-names =3D "apb", "axi", "rtrm", "pix", "dtrc";
> +				assigned-clocks =3D <&clk IMX8MQ_CLK_DISP_AXI>,
> +						  <&clk IMX8MQ_CLK_DISP_RTRM>,
> +						  <&clk IMX8MQ_VIDEO2_PLL1_REF_SEL>;
> +				assigned-clock-parents =3D <&clk IMX8MQ_SYS1_PLL_800M>,
> +							 <&clk IMX8MQ_SYS1_PLL_800M>,
> +							 <&clk IMX8MQ_CLK_27M>;
> +				assigned-clock-rates =3D <800000000>,
> +						       <400000000>;
> +				status =3D "disabled";
> +			};
> +
>  			irqsteer: interrupt-controller@32e2d000 {
>  				compatible =3D "fsl,imx8m-irqsteer", "fsl,imx-irqsteer";
>  				reg =3D <0x32e2d000 0x1000>;
>=20
> ---
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> change-id: 20260710-imx8mq-dcss-device-tree-node-9df58de085ea
>=20
> Best regards,
> -- =20
> Esben Haabendal <esben@geanix.com>
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



