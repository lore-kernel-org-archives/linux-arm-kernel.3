Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E984C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4+D9upuaenjWjZ0/dtM41htolecou62jNr6QYJiyhE=; b=GIfXZeaG9Chj5DNFMAsyXJyY4P
	Aa3YxuF0XVeqiy5+ZynSLM1MWMhnYSvUMI/ajqUeFXvilGqOfqQfRYF/EzaHpj9H0UPuHE3u7qSee
	bqknwWXLfoGH6cjxu/om4ZpNEvpfQOPtl+U0XFzucdthFDbpLTWGakyKkm2swUxrK50eYScqzqjZH
	+sHs2plvWcJouN73NRJGflWRrVfsjEUQjbVCGEsDlR6ydzd3klk6CnuuOmb0jZz3nj3Rf5SP5E/gy
	fJL7q7SOklEg58a0PweZfEZQivaR1gD+8eEmSr4A0NhE0Te9Uf5GVVtnT1gRIWH+EMHIqZH2c1DIx
	QT3ZFk9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dsM-0000000FNMg-40D9;
	Fri, 18 Sep 2026 19:03:58 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7dsI-0000000FNLS-26d2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 19:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=x4+D
	9upuaenjWjZ0/dtM41htolecou62jNr6QYJiyhE=; b=PtVookg5iQKTKvaqLg/V
	le9n4Ya6+P6oMAJIDLz7bwQHYOWPNA+2BRkNCTXsIkSwGLgpNiBURb38I31E11/v
	wyApEEHsdo1fn8cJKwT3btI/SLa9ITzwA+nuo3Wnpm2lp1XdBgpsiwQAenbKBIrM
	QG8Xc6p4pZ8059h82svBVX81BzDkOzmualYyeh1bukez1x+Lj8oR+hNVvnetHebd
	qm5aXERfgaHfZGipLKRi7Mzmpmd1dPZmUL6XhA3fWHbO3QPjSnRsKui0Phql/nit
	S6c5I0LjoAkrm47LrwHgp2QV5H/Ux0w6/9+KzOexRguOi8dpJZQEf8n8IpxP89o9
	WA==
Received: (qmail 2660367 invoked from network); 18 Sep 2026 21:03:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Sep 2026 21:03:46 +0200
X-UD-Smtp-Session: l3s3148p1@raRWj8ZbuqC57tsJ
Date: Fri, 18 Sep 2026 21:03:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank.Li@oss.nxp.com
Cc: Aubin Constans <aubin.constans@microchip.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Linus Walleij <linusw@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>,
	Rosen Penev <rosenp@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>,
	Pan Chuang <panchuang@vivo.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rakuram Eswaran <rakuram.e96@gmail.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>,
	"open list:OMAP HS MMC SUPPORT" <linux-omap@vger.kernel.org>,
	"moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
	"open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>,
	vkoul@kernel.org
Subject: Re: [PATCH v2 1/1] mmc: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-ID: <aq2LEtdAVJ58mpMr@shikoro>
References: <20260918152349.2101305-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918152349.2101305-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_120355_458872_0ABC77EA 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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


>  drivers/mmc/host/renesas_sdhi_sys_dmac.c |  8 ++++----
>  drivers/mmc/host/sh_mmcif.c              |  8 ++++----
>  drivers/mmc/host/usdhi6rol0.c            |  6 +++---

For these Renesas drivers:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


