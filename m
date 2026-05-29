Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ABBCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t7wHe8cUBszAu4Jk+iNBrvxNAlxvv8/648AM+0ijng=; b=SSKx3anPcIznolJ+++0q8sXVQa
	wX3IxiLUUDY7PcP45jDccYb2SiN8mQ48u9WFVtloSBRUaM8StQyrjgaDapr2EZQ+jXFisQQDDVz+S
	BMfGAaMQGABmwGmv2y15HGi+894aFQGLBJCzyVIaA3X7URswi+W2HVHRZiM18WKWnHhR3x8nLQ0Pr
	7Xh2Itk9HTgS5LRphTJDekW8tvcAhFNxP//oYXT/szvSL1UF84++cF0g8MbI8AMRL3KeKgscKBTAR
	VagmNq0kqfRcHXdYq5nRijKXJoVcmLngejY2lD3FH3TabS5fr602XEmOluh5QjXeXQKMxFxSChd2l
	Bb+sbXRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz1J-00000007enm-3GZQ;
	Fri, 29 May 2026 15:21:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz1H-00000007en8-15FS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 15:21:08 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wSz16-0002oU-Rc; Fri, 29 May 2026 17:20:56 +0200
Message-ID: <7ca82ce17e772bfe3b12c5c82ace96386eaff387.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] drm: lcdif: FIFO underrun/solid color bug fix
From: Lucas Stach <l.stach@pengutronix.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, Paul Kocialkowski	
 <paulk@sys-base.io>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer	 <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Marco Felsch	
 <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
Date: Fri, 29 May 2026 17:20:54 +0200
In-Reply-To: <01c33cda-e6ac-44a8-b1eb-8a8d7118175e@kontron.de>
References: <20260402183351.3281123-1-paulk@sys-base.io>
	 <01c33cda-e6ac-44a8-b1eb-8a8d7118175e@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_082107_297205_A735FDEC 
X-CRM114-Status: GOOD (  11.14  )
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

Am Mittwoch, dem 27.05.2026 um 12:35 +0200 schrieb Frieder Schrempf:
> On 02.04.26 20:33, Paul Kocialkowski wrote:
> > This series brings a fix for the FIFO underrun/solid color bug (in the
> > last commit) and two other changes that may help with reliability.
> >=20
> > Paul Kocialkowski (2):
> >   drm: lcdif: Set undocumented bit to clear FIFO at vsync
> >   drm: lcdif: Wait for vblank before disabling DMA
> >=20
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 18 ++++++++++++++----
> >  drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> >=20
>=20
> Can this series be applied, please?
>=20
Applied to drm-misc-next.

Regards,
Lucas

