Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB40D606EE88
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HkQiat7t;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Te7IK0u9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W8xCoWoLLQfSq8i5Qi+fm11gUA6qTjPeDx6DMi+PVBo=; b=HkQiat7to6siZoLF3mCypUC0H4
	NMXQzsvSJ4le7wIo43X7rydl10grjHwrHcbWvdvbImPNAFGAXh8yZvTw8h8HXnUyrXBtijRLHp1IG
	VIvZMHSBEyTpagkAu7mZd2QBShVz6EJE6QFD670xys5iQYWZ20KYTdTzwXIkQF3yrMyA9jV24YzKn
	mXwNks1ggxUX70CitTetmP1W/1Pl5OA/x3pfqk5u/IiM6wC0ePZEB4E4n2zY4ffsFJwHR7rD1BdBm
	NhBhAHcpDTs0XJMC//Up87zhu+dSg0vC0OMgStAVQuwLBbhymdF0hNzS7DvCDb/CHl2GLwFdkLUQQ
	kFrD+mtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHc2-00000003CGF-0FgV;
	Tue, 03 Nov 2026 16:43:54 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHby-00000003CF1-3wjI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=W8xC
	oWoLLQfSq8i5Qi+fm11gUA6qTjPeDx6DMi+PVBo=; b=Te7IK0u9c1h6hR0DRAlT
	FHjZyxJ1laoT4G8FkfVwZjVlHMu50gT88cv110WjLlQ44adjFxv1ha0DI274kN6z
	bS1xF6dxbHI7u9hB3i45B/hgOSt+hEJWF/fUt1hHfpJFts5v++IlTs+6EjKtcaiN
	uE7bzFTOVNRxgPJwAe9ZU3K6YQVWbSTe8ewEv3cEEtQishyVYT6Ab37Z9wZfM3Oy
	kzvQMMF3hxCxWoT28eo+kzdCZlJRLmFMLNvZVLYw9k6CmArdhYIShEIJuMDtLNyu
	L0m3E/KJXnZ8MPGcWyUxMv0essagc9gDJ/MloPUwbiiNjFU2QN5WDBOpKChAvr0u
	NA==
Received: (qmail 357587 invoked from network); 3 Nov 2026 17:43:45 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2026 17:43:45 +0100
X-UD-Smtp-Session: l3s3148p1@jzFJ92FfgJTAwtcC
Date: Tue, 3 Nov 2026 18:43:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank.Li@oss.nxp.com
Cc: Aubin Constans <aubin.constans@microchip.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Shawn Lin <shawn.lin@rock-chips.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	John Garry <john.garry@linux.dev>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Rosen Penev <rosenp@gmail.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Pan Chuang <panchuang@vivo.com>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>,
	Rakuram Eswaran <rakuram.e96@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>,
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>,
	"open list:OMAP MMC SUPPORT" <linux-omap@vger.kernel.org>,
	"moderated list:ARM/ACTIONS SEMI ARCHITECTURE" <linux-actions@lists.infradead.org>,
	"open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>,
	vkoul@kernel.org
Subject: Re: [PATCH 1/1] mmc: use dmaengine_desc_set_callback()
Message-ID: <auoPQVa1LMvluoYM@shikoro>
References: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102172126.3890568-1-Frank.Li@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_084351_263569_302D9DF7 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 6 ++----
>  drivers/mmc/host/sdhci.c                 | 3 +--
>  drivers/mmc/host/sh_mmcif.c              | 6 ++----
>  drivers/mmc/host/uniphier-sd.c           | 3 +--
>  drivers/mmc/host/usdhi6rol0.c            | 3 +--

For those:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # Renesas related drivers


