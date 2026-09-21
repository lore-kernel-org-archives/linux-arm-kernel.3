Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0435C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+k41I23EnF+ywwJVp5opoab61DziI9GqC7O+IBIQuY=; b=29f3ULSODwHVDpFazL+/uKgYI2
	9tKRzs1gn5wVTO5Sf8hZG/g+nySW9AK0I2trwD/43GNwidwWL1fXIB/sBkqRP0EcABeq4P+lbi24g
	XBwr6I86/OAa/bJyaF3L0b4wAO9jEaKPdGrki1vOmrnccCyxkFNqMKzkC2OsMRajreHVMmHHYHRea
	4hrTv2/o1zXOO4D7DCE4v2TdBiEHd1RXVFr5heTsMu0nB+OfIDa18eoYvlDgQM4BCWckMCaK52X4H
	DNEHm8w7R7EGsquvgu6FjKi0ConsOcBLx4j4ngi6VkRC5k+3tiq1J1UeXphlVUYvTF0HGYn9teDQY
	hUB/gy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fX3-00000002WdP-3ODL;
	Mon, 21 Sep 2026 15:02:13 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fX0-00000002WXk-1AvW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=q+k4
	1I23EnF+ywwJVp5opoab61DziI9GqC7O+IBIQuY=; b=Llj3tjyabc9jD3ygIy0d
	v6IykIHu4O7+DHsAEWfmUSj+SVvqYH+b3iih7E5eG/2oyo1RGWJAllD89u0M+rqQ
	QB/9TpXWDY1+AQlo1U4gDfNBNEOkflOdGtk7EEI00ghECrjUX5WlXF2M0GtaOePj
	oZnbTeyYtdjorLwxhj4u8ZtyNFmEg7eKnXTh9x+jtERUdGtzfghvglst+/f4gh3C
	Law6933BB31Wpnc6c2FbSI1zCra8md3JZNMeTnzDhUy/Ixvg90UIcdrlFoaFnpAu
	FhDheS9iwK4JLAzWYiHEDOHTvJ3XVk43FDTxLJx4fKR5mvd7g7TxUMzZ1uYpJIDB
	rw==
Received: (qmail 3690923 invoked from network); 21 Sep 2026 17:02:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2026 17:02:02 +0200
X-UD-Smtp-Session: l3s3148p1@1sZMiP9boMJQT+F6
Date: Mon, 21 Sep 2026 17:02:01 +0200
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
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Linus Walleij <linusw@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>,
	Vinod Koul <vkoul@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Rosen Penev <rosenp@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>,
	Pan Chuang <panchuang@vivo.com>, Khalid Aziz <khalid@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rakuram Eswaran <rakuram.e96@gmail.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>,
	"open list:OMAP MMC SUPPORT" <linux-omap@vger.kernel.org>,
	"moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
	"open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>
Subject: Re: [PATCH v3 1/1] mmc: use dmaengine_get_dma_device() instead of
 chan->device->dev
Message-ID: <arFG6UHs3VRifkBq@shikoro>
References: <20260921144426.1083196-1-Frank.Li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921144426.1083196-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_080211_309880_141E248B 
X-CRM114-Status: UNSURE (   6.82  )
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


> eviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Missing 'R' at the beginning. checkpatch would have reported this,
please put it in your loop.


