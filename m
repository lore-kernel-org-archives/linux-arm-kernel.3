Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B1BC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcQ0zZYFtOWbyNLllffwwJ/lu4ZJG+97VXa6lE7SnM0=; b=gl34Rlynvxig7RbR2MDlBCxaDw
	qJhJL5W55YG0TZaQrfY7XJn1lJHpKz7cmxSuV5ko21HxAIP2ArJR15CsSNehjwqvLQon2qWEZ9yW9
	b1XLNurWLt3/5rw6H2Oor92yYhloXuIh6t4uK/tZvh98E1gui/8nN+h0/fAZP+eNx77qXYpsIvWsV
	j7cFM5y7tQZg3srOuZKkNEJoa8qhHe78gotEO1vDM9ZNNNg4+5cp7s0qBs3/h3jnIqKtvUGxIWKEA
	DlJ/ZfR6pAz0paPj/Lu4tEigNHgfw9hPWMIRWDeo+7IlfUaL49MIWgMt5XUg+BJj+97hsmQ0UAU4b
	xb4JmniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SFU-00000009IK6-2BJO;
	Wed, 23 Sep 2026 19:03:20 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9SFQ-00000009IIV-1sQV;
	Wed, 23 Sep 2026 19:03:18 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id F2F641301215;
	Wed, 23 Sep 2026 15:01:03 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 23 Sep 2026 15:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790190063;
	 x=1790197263; bh=hcQ0zZYFtOWbyNLllffwwJ/lu4ZJG+97VXa6lE7SnM0=; b=
	IDRkDSoJ0PsJcN0kahnvE1FolgvnKt82Ru7o65AFx38GmCSpgcfQ/O7Yp2Eh8hdY
	ldddrR8ECxO2BGN1U3h2eEvq+eCaPtOwY8mqGFXQGLV9LSroKU31zTNNYFrg0yrp
	4ogATQBj6iq/DqQUwXGo73m7DbsTBRV9nFP+cT+ppv6p9XHBPkMOU7J4TO3vL2NX
	rBAR/pL9H96xrJPCUgvYqs2DXnNFsexccBOxrneUubThrfvncrE7KLd4ze+XWjau
	vnQCzYQxfU1hg3K6QoePzENxk6oGfc1qAqdozeb6Z0ny5mvVFUZWK6gO6fS+6Dv0
	ftVbpxeXpVAUSNm7UPNLwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790190063; x=1790197263; bh=h
	cQ0zZYFtOWbyNLllffwwJ/lu4ZJG+97VXa6lE7SnM0=; b=nD4RaA0fiigl8oPUu
	U5nViYsdzXJwxIW1IxdXujRi6W/kJVkK2V8Ow5XlJ+ndbNP3AkdsBqiMLzWrdAD6
	1Ji+ORk1NmH3VnqIsGSMCmjtXm3MqVLRQ0fU4QWg4MU2cfXdGxc82piTpl9OB0I3
	IE9HwyWwscVh8y5OQzyn40CseQQVYa/j2D9yjUWawWL9T4+4WLJzjpZv6lS2TrPv
	dfuUBzmLUNLhTTDzpdH4Sb3YTc5qXiRupi6unu10r5vczg1jimg1HrHdO1s7gzk6
	veXmdNt9cuLuiqpwRReDOBEuVt4voarH3gAPaNkgO/6zD0KTbOJ+su4kkyzxtgkK
	M7svQ==
X-ME-Sender: <xms:2yG0alZ50BYR_r0sz7fnTMFA_3B6_O34h-7MDfKDru8Dmeig5ztTMw>
    <xme:2yG0anPBnU6_DSCQgPmXXoUMrtAfavMurSyaO0jZrAiShTpdySgd04rqz23dsEoGN
    1pnxEEwYi9lFBZdEI10hwSjAIfnNguubTi4RZR14woIY8H3SH_3V5Zp>
X-ME-Proxy-Cause: dmFkZTF5vzQ5F/0RiBISLP5Lbl3Sev9i6TdoIZvw8erxqaoyTywLbMHgcUY8elqXtV34xH
    qmkdS1AQCbTLGhICpeDlpu2qBQRmSQI3rpCZDlfJUgeUeMfAInrSyh8wqmZCQemkgeYWBA
    E9k1kJv0R9XvRbF2AfysPR0H8QMrK23PQ4l3smKVsUbLjANEwjrJUNa3mElGtSzUOQIs+G
    v5CNzka35ypQqEId8xIig2v28UzaNGzxso9y45lOkNQRn6VqNv8cDtwCDcR+azcq8Gl1T/
    eW02P8hyCbpbWhJc51sNJEGlIjQqXiTPH8juj0WL6gn4bjiwea0UVWI2qAfzwcM0C7WgNq
    Whwe9NQ62/g2YNE2nx4vpLCbqSBDNvnlpo63TzWNeD8UTB9WWbq1IBQ3/0/nXPi3UIRzRn
    QGl+K8j8yFqjDukdyj11t2QUjWpUUDXZJLw79Zx6oSU53bz55M7iIaAUJRoYp6vcig/+si
    6wnQvGunknjGYI73+10hTN1hsUlDEc6SHuu1HyFPlq0tiC3VvexxmVbaBk/NrJoYjnDz5r
    BfYrszuSVeu4GnPhYPnsmJyjba2fmhf4iNlGZo8KaPgQlaIUiLrCP3WmexLNIMq0vYIkRx
    xSshkUyrGSwzmIIF8uGrjyh78SP77fnQRwsuE+z358/nfTt8QcCbNNJ9Glww
X-ME-Proxy: <xmx:4yG0agL59bxWuppHYsUKnPlC44-lqlBFHyC3d2JdZ6uWMe_V2Nv1Ew>
    <xmx:4yG0aiPuLt7iYqBkqJB6GjrxJlMzsulxiU4obdn4oSNI-1EexLSxtg>
    <xmx:4yG0ahOM1HB8N5yrKJyUcbPWszL2TCN68Tddc3CHw_Jvwl4oTafFqg>
    <xmx:4yG0aiJpCxZujGK0WG4nSUqdZdyjz6ILmAHhen7jDoHa9XFF0RnPHA>
    <xmx:7yG0anUuvv93AHS7q9Im3hwhcnP55GfFiJf1fNS1mgtO74jxlfyHwFST>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BCB2732A0087; Wed, 23 Sep 2026 15:00:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARoswzXc42gB
Date: Wed, 23 Sep 2026 20:57:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Frank Li" <Frank.Li@oss.nxp.com>, "Ulf Hansson" <ulfh@kernel.org>,
 "Aubin Constans" <aubin.constans@microchip.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Paul Cercueil" <paul@crapouillou.net>,
 "Russell King" <linux@armlinux.org.uk>, "Frank Li" <Frank.Li@nxp.com>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 "Manivannan Sadhasivam" <mani@kernel.org>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Jesper Nilsson" <jesper.nilsson@axis.com>,
 "Lars Persson" <lars.persson@axis.com>,
 "Johan Hovold" <johan@kernel.org>, "gordon.ge" <gordon.ge@bst.ai>,
 "Vinod Koul" <vkoul@kernel.org>,
 "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>,
 "Jared Kangas" <jkangas@redhat.com>, "Brian Masney" <bmasney@redhat.com>,
 "Martin Blumenstingl" <martin.blumenstingl@googlemail.com>,
 "Linus Walleij" <linusw@kernel.org>, "Fan Wu" <fanwu01@zju.edu.cn>,
 "Rosen Penev" <rosenp@gmail.com>, "Pengpeng Hou" <pengpeng@iscas.ac.cn>,
 "Marco Crivellari" <marco.crivellari@suse.com>,
 "Pedro Demarchi Gomes" <pedrodemargomes@gmail.com>,
 "Zhan Xusheng" <zhanxusheng1024@gmail.com>,
 "Pan Chuang" <panchuang@vivo.com>, "Khalid Aziz" <khalid@kernel.org>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Rakuram Eswaran" <rakuram.e96@gmail.com>,
 "Takashi Sakamoto" <o-takashi@sakamocchi.jp>,
 "Runyu Xiao" <runyu.xiao@seu.edu.cn>,
 "Matthew Wilcox" <willy@infradead.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..."
 <imx@lists.linux.dev>, Linux-OMAP <linux-omap@vger.kernel.org>,
 "moderated list:ARM/ACTIONS SEMI ARCHITECTURE"
 <linux-actions@lists.infradead.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>
Message-Id: <eebb66fa-12e2-4553-8edf-d131b84a8aba@app.fastmail.com>
In-Reply-To: <20260923184612.3583132-1-Frank.Li@oss.nxp.com>
References: <20260923184612.3583132-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH v4 1/1] mmc: use dmaengine_get_dma_device() instead of
 chan->device->dev
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_120316_953379_B6626B0B 
X-CRM114-Status: GOOD (  12.25  )
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

On Wed, Sep 23, 2026, at 20:45, Frank.Li@oss.nxp.com wrote:
> @@ -214,7 +214,7 @@ config MMC_SDHCI_OF_AT91
>  config MMC_SDHCI_OF_ESDHC
>  	tristate "SDHCI OF support for the Freescale eSDHC controller"
>  	depends on MMC_SDHCI_PLTFM
> -	depends on PPC || ARCH_MXC || ARCH_LAYERSCAPE || COMPILE_TEST
> +	depends on PPC || ARCHMXC || ARCH_LAYERSCAPE || COMPILE_TEST
>  	select MMC_SDHCI_IO_ACCESSORS
>  	select FSL_GUTS

This looks like an accidental bug that should be removed from the patch.

> @@ -961,7 +961,7 @@ static void atmci_dma_cleanup(struct atmel_mci *host)
>  	struct mmc_data                 *data = host->data;
> 
>  	if (data)
> -		dma_unmap_sg(host->dma.chan->device->dev,
> +		dma_unmap_sg(dmaengine_get_dma_device(host->dma.chan),
>  				data->sg, data->sg_len,
>  				mmc_get_dma_dir(data));

Since you have the exact construct in a lot of drivers, would
it make sense to take this one step further and introduce
a new set of helpers in drivers/dma/dmaengine.h, such as

unsigned int dmaengine_map_sg(struct dma_chan *chan, struct scatterlist *sg, ...);

      Arnd

