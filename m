Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B443FC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 21:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Vd37vlqPgoR34jGq+5SarCAahPWAWe4kwjRPQidlrk=; b=wb0iYlPRLJG7CIPfgU0nmpCRw0
	r0KgG2fpYctYE/x7L23oox87EOmN/GwVj7QomGU9qlWXueLXz0GAiAx7NcHTl6uUs7iSEAPSABh8o
	FL4ZT6fczSjOtLTro8yFS0pRtS9i1uw2UwLqShRSghmKkIeWKp6EV5jL3mOWahHfbSPxFlPUe3RFZ
	CKvCWuQZIEUyoFrcqtRowzixCDIdzqW5h5z32c2ygFcRVVIICdUYiNkUoVaSbxAho0jkyuxR9AEpT
	O1RBXCsrPztJsYbzpMxsDvMrFNnLC/EIrIF4+upJ3WmPqkP+a0MtLQf1Isq/4MJstYoitN9wlOwNM
	0gS7aGxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Js3-0000000CZig-2Lsv;
	Thu, 17 Sep 2026 21:42:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Js2-0000000CZia-2UO3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 21:42:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8F9A44507
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8B31F00902
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789681337;
	bh=+Vd37vlqPgoR34jGq+5SarCAahPWAWe4kwjRPQidlrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BtJsgdiv4lMiFIQVgmdR8uPTGBE3SksCFUE0VRGf/7plR5BsKss0wk44kg/IGESuy
	 5o+jLQ+1nk25fhFU9JgEkagFuLHUQ8UYBIQQX/A5gtdGuybvyN6BKeNY1tB+Qos5n/
	 nGQbSEqmvaOlUery2nP3gouw25q/6al1JCWu3lbTAgXC+ezfwSYIy0IPnOSUBIcIsC
	 7HGmzNbbxOTFkYectDy6svosEuc4md1omiI9N8nRk0Ji7lc/KSfNfeuBrdx/80t0Gr
	 7NEdQOOCzJWxZ08qaZHCoePZWUF1GKnLJHqiDEdXlhu+8H2B8syRuqxpDHTKVGx5gz
	 vtOhO9zii+3zA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1651bso74046e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 14:42:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzUQksfEIJNPyVUwrFjMShVvrfe9EGATHIm29Vh1Uksbp6xhdRhFD8ynKNlkxoaIyreOhuUZHlcycK2BHZPOz8k@lists.infradead.org
X-Gm-Message-State: AFuF++kmOah/ftd9k/6olW1zb9EqY8taPLFv9DWKscJvO+Vk88vAWiFk
	zHlED7MOsQhPG3Avz02s2yFAJNwnW35YAbnSFxdETvhM5BsyUU2DQBugngxr/BZOcqalvgFqqnl
	TgP/5CZkC5BuyXVk/5CyViYdp0FRWLIM=
X-Received: by 2002:a05:6512:3baa:b0:5b6:4ae:3ff7 with SMTP id
 2adb3069b0e04-5b8c18449abmr61087e87.31.1789681336165; Thu, 17 Sep 2026
 14:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260917204240.1284796-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260917204240.1284796-1-Frank.Li@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 17 Sep 2026 23:42:04 +0200
X-Gmail-Original-Message-ID: <CAD++jL=uWFLWB_8T_q9UwbY1KzB+tcjJwOo4GheRF-72eU59Sg@mail.gmail.com>
X-Gm-Features: AcwNN1UfNjWV7KrU9iWOWhdNsDlRn7O6RazPK4CNMASiCssILCbrQZDav7Nv7A0
Message-ID: <CAD++jL=uWFLWB_8T_q9UwbY1KzB+tcjJwOo4GheRF-72eU59Sg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mmc: use dmaengine_get_dma_device() instead of chan->device->dev
To: Frank.Li@oss.nxp.com
Cc: Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson <ulfh@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Russell King <linux@armlinux.org.uk>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Fan Wu <fanwu01@zju.edu.cn>, Frank Li <Frank.Li@nxp.com>, 
	Rosen Penev <rosenp@gmail.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Zhan Xusheng <zhanxusheng1024@gmail.com>, Pan Chuang <panchuang@vivo.com>, 
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rakuram Eswaran <rakuram.e96@gmail.com>, Khalid Aziz <khalid@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	"open list:MULTIMEDIA CARD (MMC), SECURE DIGITAL (SD) AND..." <linux-mmc@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:INGENIC JZ47xx SoCs" <linux-mips@vger.kernel.org>, 
	"open list:OMAP HS MMC SUPPORT" <linux-omap@vger.kernel.org>, 
	"open list:TMIO/SDHI MMC DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/ARTPEC MACHINE SUPPORT" <linux-arm-kernel@axis.com>, imx@lists.linux.dev, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Sep 17, 2026 at 10:42=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:

> Replace direct dma_chan::device::dev access with the proper
> dmaengine_get_dma_device() for consumer API
>
> chan->device->dev is not always the device used for DMA mapping.
> Some DMA engines support per-channel IOMMU mappings, so different
> channels may use different DMA devices.  dmaengine_get_dma_device()
> returns the correct device for each channel.
>
> This also prepares for making the DMA engine provider data structures
> private. DMA consumers should not access DMA engine internals directly.
>
> Assisted-by: LLM
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

This looks good to me. Thanks for fixing all the sites!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

