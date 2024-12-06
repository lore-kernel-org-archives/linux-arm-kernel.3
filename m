Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7FBE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YIfUdq9OR5ROGXG2tbL8UIVwnPsC3GbJ9XOwhsQXWg=; b=Xlx/u/h9ivvPzzhN4cker96irS
	hcJkFAKM+/S/ercofKVzBQUSVS/cH050GyMFvpAOYSTcpbESJfACXaaiBUjGZJ3Fsq3I2rEzWfeJ3
	StCIRoDv5CKEte1AROyfNek56OBGL+BlCwDdKh7EaTe/nBFs+G3lHxM3UZqMeHtyg6mFi7byiLEUz
	wF2k63L9xJNijWLw5lXRNDCsSVH+hXUI1bc7wMNNCMutWmFu8brbs4kHNOwVXQ5GsXseK42KeiI2h
	+K3tn0mdk2znsC3Ok0sQuI9fzK/lCwLEv00SDBZxLxAw/fc1q3nf8CmbMY7oJvYsdVPitoXJfoghi
	H4yAMM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUIv-000000011eb-3dmH;
	Fri, 06 Dec 2024 09:07:17 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUHa-000000011Kt-2fLV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:05:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1733475954; x=1765011954;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+YIfUdq9OR5ROGXG2tbL8UIVwnPsC3GbJ9XOwhsQXWg=;
  b=kmLyHciVtsAXUywT7Eu5uyGdOMbOQ7ut2HF5VbwBPhhJhnOju0MmFUOk
   rejlQcw2ALh5DJPxwhW7PkmyzpCMnFpByXtWaxicPclgMBFML24emSUlr
   9x2BkJnzeofrdM7LDXr4i1rM4LjL7bHu+qfMaX/NyhI8jKZBxurm/jAq3
   6P92y9Q0saqB46dv3vCMv4S9MPOlCOQr+5s7cGWj5ral61O4lBQ9R460m
   NHoo5lGaexE7rccPF0eAR5yXpPkFl56tS9Z10fXZ6/cjp+bEoa8JKW7mt
   Yrzy1q+uAr+i0Xd8HIEmz6Xp8zEbZZBFLn9oyPxv2+tTYnH//mKeQcOwX
   g==;
X-CSE-ConnectionGUID: oVbENiJ4R3iM76QGjQUZbw==
X-CSE-MsgGUID: YnhpYHKDRjOcgqB0ukZk4Q==
X-IronPort-AV: E=Sophos;i="6.12,213,1728943200"; 
   d="scan'208";a="40449387"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 06 Dec 2024 10:05:52 +0100
X-CheckPoint: {6752BE70-2-1E10F2A5-CC0651E5}
X-MAIL-CPID: 313663F2906B776E37CF64B963F0996B_4
X-Control-Analysis: str=0001.0A682F17.6752BE70.0064,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 786FF163AD6;
	Fri,  6 Dec 2024 10:05:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1733475947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+YIfUdq9OR5ROGXG2tbL8UIVwnPsC3GbJ9XOwhsQXWg=;
	b=rm6Ic1fZRlZmgzFL/7eQp1nhcTTvMsgpS9iWRkPgv1JDg/Ns2sYSxwQf/bZezXw447Kzki
	1F8E5iNQtQQbMxiZPX1HgsO/xVUJLzMbprmisfvvnxy+2IE3Ubw4alQO5wjgMiWiPN8r9U
	3hajrS3sEQPb7Z4c2fierSy9XjVNo0tcxmvxEK02C3JH64DEFXpwM9IO/hCGLtLn/Zn4PC
	oVc8aRcUXK2gVwX3wqAwKgNiTKpoVzktaroRC6jt/6uBW6jFdRiM8bdXxNmtzDAF19mGzV
	2vPwZLMeb/8y6NyicmynZBd6CT2hydwBNuzmMTPw/NdQ7VbJgOlePcy5WxCNpg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengfei Li <pengfei.li_1@nxp.com>, "open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>, "open list:NXP i.MX CLOCK DRIVERS" <imx@lists.linux.dev>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: Re: [PATCH] clk: imx: Enable IMX93_CLK_LVDS_GATE only for i.MX93
Date: Fri, 06 Dec 2024 10:05:46 +0100
Message-ID: <4615625.LvFx2qVVIh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20241203130530.1206526-1-peng.fan@oss.nxp.com>
References: <20241203130530.1206526-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_010555_164004_FA2193DB 
X-CRM114-Status: GOOD (  11.90  )
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

Am Dienstag, 3. Dezember 2024, 14:05:29 CET schrieb Peng Fan (OSS):
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Enable the LVDS gate only for i.MX93, because i.MX91 does not support
> LVDS.
>=20
> Fixes: a27bfff88dd2 ("clk: imx: add i.MX91 clk")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/imx/clk-imx93.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
> index 58a516dd385b..a0d2972ba9cd 100644
> --- a/drivers/clk/imx/clk-imx93.c
> +++ b/drivers/clk/imx/clk-imx93.c
> @@ -239,7 +239,7 @@ static const struct imx93_clk_ccgr {
>  	{ IMX93_CLK_SAI3_IPG,		"sai3_ipg_clk", "bus_wakeup_root",	0x94c0, 0, &s=
hare_count_sai3},
>  	{ IMX93_CLK_MIPI_CSI_GATE,	"mipi_csi",	"media_apb_root",	0x9580, },
>  	{ IMX93_CLK_MIPI_DSI_GATE,	"mipi_dsi",	"media_apb_root",	0x95c0, },

mipi_csi and mipi_dsi are also only PLAT_IMX93.

> -	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, },
> +	{ IMX93_CLK_LVDS_GATE,		"lvds",		"media_ldb_root",	0x9600, 0, NULL, PLA=
T_IMX93 },
>  	{ IMX93_CLK_LCDIF_GATE,		"lcdif",	"media_apb_root",	0x9640, },
>  	{ IMX93_CLK_PXP_GATE,		"pxp",		"media_apb_root",	0x9680, },

pxp is also only PLAT_IMX93.

>  	{ IMX93_CLK_ISI_GATE,		"isi",		"media_apb_root",	0x96c0, },
>=20

Not visible in this diff, but also only PLAT_IMX93:
* flexio1
* flexio2
* cm33

An most probably also mu*_a and mu*_b, even though they are listed in
i.MX91 RM, but AFAIK this SoC lacks MU.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



