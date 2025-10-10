Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C811CCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CavR6COX1l6UoVKhIW/R2rFsujYvUixt41QyKiVVER0=; b=UMCzaMs97c4ggpBI9cdnJ4KchX
	RPS+d+0/WAKLuky2/qmcF1GobAA9QCPglcw4BRMOQJavDAbCoYfoCuTQiholbhMKUFz8oI9zBPcti
	hLQWALgDG7KVF4FnmfHAhAZF+pYIGnf4lLjjeph12CAvncO5G00MWi8aNM3JqAQBnoKUxg1+PIPw3
	uqa/SHnH17yyDMQJNi2MZ9rNaE4ZokD0NnZOFc9F93q+67BXUhRIZb2dQd/78SCOtt/9jGdlelo2F
	aInLPTamy+Ynwv4AEu6eEG/6H4qvT65LMFmvnHe7YLWYqBIgq0CS0ThDRjZTPWkcUZc7YbAYby1q6
	nITEWwew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78O2-00000007yOq-3JQR;
	Fri, 10 Oct 2025 08:22:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78Nz-00000007yMB-2DMU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:22:00 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 496105B3;
	Fri, 10 Oct 2025 10:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760084419;
	bh=YSQNJr2oYKk3qMOODi3stI1a6DzS4lkkF0P3amUMrSI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=wh+SrsUzNEIBibEeDhQhc1qqGwwHfMb0P91qH4PQjEOeo2y92dpRU3qb8lSxIM+ZK
	 pSh8HHZg0ZlJ3FC2XjO/lHGbgIFqcbukSrVU/O9LCrMj79vYrK/H6sDVQ03LnNFNu6
	 MElInC2i8+egIqm6SC68AU0whL2i6oGUB4EGP4sE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7b861236-8317-4435-8582-bd97f545e322@linaro.org>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com> <7b861236-8317-4435-8582-bd97f545e322@linaro.org>
Subject: Re: [PATCH 00/18] media: microchip-isc: Color correction and histogram stats
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Chas Williams <3chas3@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Balakrishnan Sambath <balakrishnan.s@microchip.com>, Hans Verkuil <hverkuil@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally+renesas@ideasonboard.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>, Eugen Hristev <eugen.hristev@linaro.org>
Date: Fri, 10 Oct 2025 09:21:51 +0100
Message-ID: <176008451125.756374.6436397947711705101@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_012159_697828_19683B4E 
X-CRM114-Status: GOOD (  21.52  )
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

Quoting Eugen Hristev (2025-10-09 21:11:17)
> Hi Bala,
>=20
> On 10/9/25 18:52, Balamanikandan Gunasundar wrote:
> > Hi,
> >=20
> > This patch series has a set of enhancements to the Microchip Image Sens=
or
> > Controller driver. The objective is to expand its image processing
> > capabilities and to improve the colors.
> >=20
> > This series also introduces a new stats driver that exposes the histogr=
am
> > data to userspace via v4l2 controls. This allows applications such as
> > libcamera to access real time image statistics for advanced image
> > processing like automatic exposure, white balance adjustments etc.

How much data do you anticipate to be passing through controls? (What
can the hardware provide in total if we look at the bigger picture to
support the full device?)

For all other ISPs we've been working towards using structured parameter
buffers to pass data - and we've been making that format extensible,
which I think could also be a design that can apply to statistics.

This would greatly reduce the overhead of managing 'one control per
value' ... or things like passing large tables (like a lens shading
table perhaps) through controls.

--
Kieran

> >=20
> > Balakrishnan Sambath (11):
> >   media: microchip-isc: Enable GDC and CBC module flags for RGB formats
> >   media: microchip-isc: Improve histogram calculation with outlier
> >     rejection
> >   media: microchip-isc: Use channel averages for Grey World AWB
> >   media: microchip-isc: Add range based black level correction
> >   media: platform: microchip: Extend gamma table and control range
> >   media: platform: microchip: Add new histogram submodule
> >   media: microchip-isc: Register and unregister statistics device
> >   media: microchip-isc: Always enable histogram for all RAW formats
> >   media: microchip-isc: fix histogram state initialization order
> >   media: microchip-isc: decouple histogram cycling from AWB mode
> >   media: microchip-isc: enable userspace histogram statistics export
> >=20
> > Balamanikandan Gunasundar (7):
> >   media: platform: microchip: set maximum resolution for sam9x7
> >   media: platform: microchip: Include DPC modules flags in pipeline
> >   media: microchip-isc: expose hue and saturation as v4l2 controls
> >   media: microchip-isc: Rename CBC to CBHS
> >   media: microchip-isc: Store histogram data of all channels
> >   media: videodev2.h, v4l2-ioctl: Add microchip statistics format
> >   media: microchip-isc: expose color correction registers as v4l2
> >     controls
> >=20
> >  drivers/media/platform/microchip/Kconfig      |   2 +
> >  drivers/media/platform/microchip/Makefile     |   2 +-
> >  .../platform/microchip/microchip-isc-base.c   | 373 ++++++++++--
> >  .../platform/microchip/microchip-isc-regs.h   |   3 +
> >  .../platform/microchip/microchip-isc-stats.c  | 549 ++++++++++++++++++
> >  .../media/platform/microchip/microchip-isc.h  |  44 +-
> >  .../microchip/microchip-sama5d2-isc.c         |   2 +-
> >  .../microchip/microchip-sama7g5-isc.c         |  73 ++-
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> >  include/linux/atmel-isc-media.h               |  13 +
> >  include/uapi/linux/videodev2.h                |   3 +
> >  11 files changed, 1001 insertions(+), 64 deletions(-)
> >  create mode 100644 drivers/media/platform/microchip/microchip-isc-stat=
s.c
> >=20
>=20
> This looks interesting.
> I would like to see the compliance tool output for more platforms
> (sama7g5, sama5d2, and the new sam9x7), also the media-ctl -p , to see
> the topology with your new driver.
>=20
> Thanks,
> Eugen

