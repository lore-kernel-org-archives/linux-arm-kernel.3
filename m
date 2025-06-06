Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591C0C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrNLlBdEeyxxEjyzkEFz2p6yzNiSqD/MeQoKqXc0L6E=; b=DHdlxie3GgDpQzZ7s0fW1L+HAn
	Q5Ey3fymcJbrC0peexGkHuPNwgBacxqNrQ9yQHwqUT7TlnDPjzVg44/tz3BbugKKbOWM3/RAJNJ7B
	vEU3tkj0MLSg7+UMG26r0Cdoa4eLOGdMifKDW7V44P5uTwwN+Hjk16wDX1/JYKO9JSrFv20TYui+F
	YO7Yw4BAv7nwy7VH6EGuawVwKjWizuQg6m6FX2tX4llxqBQkC3oDr8E5veLyPmLEOB13ylP50Z+YW
	Po9P+JizRyUwZhCf/Sc7apYwIe5GWuLCOBwfmpk3tuTFRNyS2yz5BxB5sdYncOJz05tBsfjcIZg/V
	txKwM1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZNm-00000000aIr-2LoI;
	Fri, 06 Jun 2025 15:53:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNZHi-00000000ZCk-1TV2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 15:47:11 +0000
Received: from isaac-ThinkPad-T16-Gen-2.localdomain (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A74A8DB;
	Fri,  6 Jun 2025 17:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749224824;
	bh=RdiDBtVhuf4nlhpFoArx/0tGuceAeEnMRGYWVVGgEW8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GphpJ9ocRRaSKmBGaMe0GY9T6CO1Vr1c30fqd1NVudiCktufhnnq7f2rRPh2/hAxF
	 8DvNnG5L25nYfAg8FnDOBMJXOQGZy9iAs6aoMq0rfQZIYt+XYxoJk9T+MMkiXM004e
	 +R3mMgu+29H29kJnrlqV3LEhgSd8rdxh2HOlEZqQ=
Message-ID: <8e950dd3c54a363d8e2d7252e3f3d93301076b50.camel@ideasonboard.com>
Subject: Re: [PATCH 1/2] media: platform: Refactor interrupt status registers
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, laurent.pinchart@ideasonboard.com
Cc: kieran.bingham@ideasonboard.com, martink@posteo.de, kernel@puri.sm, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Jun 2025 16:47:04 +0100
In-Reply-To: <DAFI37JD827I.KWPZ7XCTWPBD@linaro.com>
References: <20250606121403.498153-1-isaac.scott@ideasonboard.com>
	 <20250606121403.498153-2-isaac.scott@ideasonboard.com>
	 <DAFI37JD827I.KWPZ7XCTWPBD@linaro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (by Flathub.org) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_084710_669493_EE024609 
X-CRM114-Status: GOOD (  25.93  )
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

Hi Rui,

On Fri, 2025-06-06 at 14:56 +0100, Rui Miguel Silva wrote:
> Hey Isaac,
> Thanks for the patch.
>=20
> On Fri Jun 6, 2025 at 1:14 PM WEST, Isaac Scott wrote:
>=20
> > The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and
> > debug
> > status sources which span multiple registers. The driver currently
> > supports two interrupt source registers, and attributes the
> > mipi_csis_event event entries to those registers through a boolean
> > debug
> > field that indicate if the event relates to the main interrupt
> > status
> > (false) or debug interrupt status (true) register. To make it
> > easier to
> > add new event fields, replace the debug bool with a 'status index'
> > integer than indicates the index of the corresponding status
> > register.
> >=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> > =C2=A0drivers/media/platform/nxp/imx-mipi-csis.c | 64 +++++++++++------=
-
> > ----
> > =C2=A01 file changed, 31 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c
> > b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index d060eadebc7a..bbc549c22aff 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -249,7 +249,7 @@
> > =C2=A0#define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
> > =C2=A0
> > =C2=A0struct mipi_csis_event {
> > -	bool debug;
> > +	unsigned int status_index;
> > =C2=A0	u32 mask;
> > =C2=A0	const char * const name;
> > =C2=A0	unsigned int counter;
> > @@ -257,30 +257,30 @@ struct mipi_csis_event {
> > =C2=A0
> > =C2=A0static const struct mipi_csis_event mipi_csis_events[] =3D {
> > =C2=A0	/* Errors */
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT
> > Error" },
> > -	{ false,
> > MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
> > -	{ false,
> > MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO
> > Overflow Error" },
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong
> > Configuration Error" },
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC
> > Error" },
> > -	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC
> > Error" },
> > -	{ false,
> > MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type
> > Not Supported" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type
> > Ignored" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame
> > Size Error" },
> > -	{ true,
> > MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early
> > Frame End" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early
> > Frame Start" },
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT
> > Error"},
>=20
> Maybe instead of 0,1,2 (magic indexes)... we could give a meaningful
> index
> enums names, don't know, like: main, debug, user??? or something that
> you think is better.

Thanks for the review! I have updated v2 to include an enum instead of
magic numbers.

Best wishes,

Isaac

>=20
> Cheers,
> =C2=A0=C2=A0=C2=A0 Rui
>=20
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost
> > Frame Start Error"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost
> > Frame End Error"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO
> > Overflow Error"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong
> > Configuration Error"},
> > +	{ 0,
> > MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error"},
> > +	{ 0,
> > MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown
> > Error"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type
> > Not Supported"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type
> > Ignored"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame
> > Size Error"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated
> > Frame"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early
> > Frame End"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early
> > Frame Start"},
> > =C2=A0	/* Non-image data receive events */
> > -	{ false,
> > MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
> > -	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image
> > data after even frame" },
> > -	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image
> > data before odd frame" },
> > -	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image
> > data after odd frame" },
> > +	{ 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image
> > data before even frame"},
> > +	{ 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image
> > data after even frame"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image
> > data before odd frame"},
> > +	{ 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image
> > data after odd frame"},
> > =C2=A0	/* Frame start/end */
> > -	{ false,
> > MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
> > -	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame
> > End" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC
> > Falling Edge" },
> > -	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC
> > Rising Edge" },
> > +	{ 0, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame
> > Start"},
> > +	{ 0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame
> > End"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC
> > Falling Edge"},
> > +	{ 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC
> > Rising Edge"},
> > =C2=A0};
> > =C2=A0
> > =C2=A0#define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
> > @@ -765,32 +765,30 @@ static irqreturn_t mipi_csis_irq_handler(int
> > irq, void *dev_id)
> > =C2=A0	struct mipi_csis_device *csis =3D dev_id;
> > =C2=A0	unsigned long flags;
> > =C2=A0	unsigned int i;
> > -	u32 status;
> > -	u32 dbg_status;
> > +	u32 status[2];
> > =C2=A0
> > -	status =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> > -	dbg_status =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> > +	status[0] =3D mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
> > +	status[1] =3D mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
> > =C2=A0
> > =C2=A0	spin_lock_irqsave(&csis->slock, flags);
> > =C2=A0
> > =C2=A0	/* Update the event/error counters */
> > -	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis-
> > >debug.enable) {
> > +	if ((status[0] & MIPI_CSIS_INT_SRC_ERRORS) || csis-
> > >debug.enable) {
> > =C2=A0		for (i =3D 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
> > =C2=A0			struct mipi_csis_event *event =3D &csis-
> > >events[i];
> > =C2=A0
> > -			if ((!event->debug && (status & event-
> > >mask)) ||
> > -			=C2=A0=C2=A0=C2=A0 (event->debug && (dbg_status & event-
> > >mask)))
> > +			if (status[event->status_index] & event-
> > >mask)
> > =C2=A0				event->counter++;
> > =C2=A0		}
> > =C2=A0	}
> > =C2=A0
> > -	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
> > +	if (status[0] & MIPI_CSIS_INT_SRC_FRAME_START)
> > =C2=A0		mipi_csis_queue_event_sof(csis);
> > =C2=A0
> > =C2=A0	spin_unlock_irqrestore(&csis->slock, flags);
> > =C2=A0
> > -	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
> > -	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
> > +	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status[0]);
> > +	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, status[1]);
> > =C2=A0
> > =C2=A0	return IRQ_HANDLED;
> > =C2=A0}
> > --=20
> > 2.43.0
>=20
>=20

