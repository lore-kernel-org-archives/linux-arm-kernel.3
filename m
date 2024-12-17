Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF48E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9idV19gXA8JkUDickvfvx0vTW3usv3OBF/gTIq+FKLM=; b=SZ+eCCkVnkHJIbD7wcl94if1R1
	/MvL27AF9Qj86QSvZoCK+il0iR3PvHtZbv6w+xzyoCE4vu2I1ibNFCFyZX/TXsDVkxIVusVXT/iBo
	WE8yylvWvvZ6GWiOPCOju5/3+1fJi3l3zgNc7XK8epySUQX5P4cxgGR6r2A2LuxsjQF67aw4tD2ya
	jDuTX+jHJYryUYbQisO5b1DJA0sGJKp3yznW+joS1fneMf4n3I1/kDDjBJI9bH1idlrfRouqmcXtq
	9XMwYs97gtevlregpJJWmsgby0GihGlJigEX2KoyeEoqG1V+/puj7fWVNq3fs0yf4bMgiMmUD89vw
	ac79wEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNTBg-0000000CkLC-2bP1;
	Tue, 17 Dec 2024 08:44:16 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNT9s-0000000Cjv4-41TC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 08:42:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B074C0006;
	Tue, 17 Dec 2024 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734424942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9idV19gXA8JkUDickvfvx0vTW3usv3OBF/gTIq+FKLM=;
	b=mfWapWyIqX5dLd37tsSruDGdVACdKSyEgu+qHatAIIebotStGtezb0J0kR0njEcDdomv9N
	6JhXtoibG8DYOCSpBLjbSI4ddc4QxbDoltB3dIGSNgl1NfNX6tcMDuD2O1I61wIt98sZM6
	rz73PJwPg1PEW05vbAZJ/zv4K+MHw4SCZN6pb33t0WKYMMziB5TvJSmvYxlF74yXKLQk4c
	Ky2lBg1l/T1DRk84cN9B1ayq5cRi0aZmABlagrScipjqpanqREWQG+86EajEC6B7+Voy6N
	epO+2nfmNHT6k+hRHGGY+syC0ZhrTHuKCoEiaet/iVRFdQ2q+e8PpeOopGk0ng==
Date: Tue, 17 Dec 2024 09:42:19 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Marek Vasut
 <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Lucas Stach <l.stach@pengutronix.de>,
 Jindong  Yue <jindong.yue@nxp.com>, Benjamin Gaignard 
 <benjamin.gaignard@collabora.com>, Paul Elder 
 <paul.elder@ideasonboard.com>, =?UTF-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>
Subject: Re: imx8m-blk-ctrl: WARNING, no release() function
Message-ID: <20241217094219.788cad88@booty>
In-Reply-To: <PAXPR04MB8459AB53B142CB43782757D988042@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20241212141003.GA44219@francesco-nb>
	<PAXPR04MB8459AB53B142CB43782757D988042@PAXPR04MB8459.eurprd04.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_004225_135509_6578E695 
X-CRM114-Status: UNSURE (   9.76  )
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

Hello Peng,

On Tue, 17 Dec 2024 01:39:09 +0000
Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: imx8m-blk-ctrl: WARNING, no release() function  
> 
> Please try this patch.
> https://lore.kernel.org/all/20241206112731.98244-1-peng.fan@oss.nxp.com/

I cherry-picked the two patches from linux-next:

  e1a875703470 ("pmdomain: imx-gpcv2: Suppress bind attrs")
  afb2a86f002b ("pmdomain: imx8m[p]-blk-ctrl: Suppress bind attrs")

but I still have the same warnings:

[    5.427038] Device 'mediablk-mipi-csi2-1' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
[    6.464219] Device 'mediablk-mipi-dsi-1' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
[    6.752903] Device 'mediablk-mipi-csi2-1' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
[    7.303529] Device 'mediablk-mipi-dsi-1' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
[    8.006575] Device 'mediablk-mipi-csi2-1' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
[    8.598453] Device 'mediablk-mipi-dsi-1' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.

This is with 6.13-rc3 on a imx8mp.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

