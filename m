Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8ACFF60EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxYAl5BsWusdG64Fir07L7pCY8Vhi/LSJytxIHRBpiA=; b=NB6AK/D1OROGwMP4Q2DUqoO/DG
	6URPuds57/0aOtceNGHmdwX3l8JbtvT3LPEUxw7NYFqLu1EUySqk5WscCqJPX2h4sazjvx3JKi2rL
	06XBdEONYAqSMH1DiasPDb7qOVmaKgxaK8DK1J4WydoUS1uF3DrVPnMIBNtBTvYeAzamWHIqoG+b8
	h9pGL1B53y0XxA+nSUCu+N9QsVXUo4j3b4ZTgyIAwDUFl065BwQtfx/mkiSjtjuRLFRSHirds59lh
	Q9Yacdc1IOOlKcFyEPb6DwBEjPBq/UhNortUAoNKUXD7d1JSjFW9crTbvUOjcT3zNn40P/acsBv0Z
	3OJjsSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V4q-0000000Ceem-07M1;
	Tue, 31 Mar 2026 09:08:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V4o-0000000CeeU-0F64
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 09:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vxYAl5BsWusdG64Fir07L7pCY8Vhi/LSJytxIHRBpiA=; b=bShDGlMU35CR0cf8ixmaLbOgRK
	D13BL/8rLckEewZXltWwuZcNf3ik1Tq839lzfwXThbs1wvrhmtIJogkBYPQ85xEuK0Ghy7RBvXIt3
	Si9LzNRzsO84GgtWB6fhEOcQOwkUmoM3l0wEfiAvbLUosGJwCb2GXfBkUN9GGa8O1zp4W/SxSfG79
	9lnws0SvobQtL1d3bnRL2ze753n2LHw/gEVzAo8BtPMaMaAoH9MiJ1VhWq68aDqS4QqG74NWIgoXj
	j6cIKqlxDlzHp+aRoOXMMS/7SKC/OfjgU47xZdPTO/xT47GFGYJOpnVVIYEXcpYP26T5ankwNTvt6
	rDdJfQHA==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7V4k-0000000FUce-1FyD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:07:56 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1w7V4Z-0004B8-8I; Tue, 31 Mar 2026 11:07:43 +0200
Message-ID: <79289b84c12ec32e8606f6fc2bd3d4dc8bd5a180.camel@pengutronix.de>
Subject: Re: [PATCH 1/3] drm: lcdif: Set undocumented bit to clear FIFO at
 vsync
From: Lucas Stach <l.stach@pengutronix.de>
To: Paul Kocialkowski <paulk@sys-base.io>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Marco Felsch
 <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
Date: Tue, 31 Mar 2026 11:07:40 +0200
In-Reply-To: <20260330224619.2620782-2-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
	 <20260330224619.2620782-2-paulk@sys-base.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_100755_338163_51A2FC0A 
X-CRM114-Status: GOOD (  15.69  )
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

Am Dienstag, dem 31.03.2026 um 00:46 +0200 schrieb Paul Kocialkowski:
> There is an undocumented bit used in the NXP BSP to clear the FIFO
> systematically at vsync. In normal operation, the FIFO should already
> be empty but it doesn't hurt to add it as an extra safety measure.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 3 ++-
>  drivers/gpu/drm/mxsfb/lcdif_regs.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index ef3250a5c54f..a00c4f6d63f4 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -338,7 +338,8 @@ static void lcdif_set_mode(struct lcdif_drm_private *=
lcdif, u32 bus_flags)
>  	 * Downstream set it to 256B burst size to improve the memory
>  	 * efficiency so set it here too.
>  	 */
> -	ctrl =3D CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
> +	ctrl =3D CTRLDESCL0_3_STATE_CLEAR_VSYNC |
> +	       CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
>  	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]);
>  	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
>  }
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/l=
cdif_regs.h
> index c55dfb236c1d..17882c593d27 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -190,6 +190,7 @@
>  #define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
>  #define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
> =20
> +#define CTRLDESCL0_3_STATE_CLEAR_VSYNC	BIT(23)
>  #define CTRLDESCL0_3_P_SIZE(n)		(((n) << 20) & CTRLDESCL0_3_P_SIZE_MASK)
>  #define CTRLDESCL0_3_P_SIZE_MASK	GENMASK(22, 20)
>  #define CTRLDESCL0_3_T_SIZE(n)		(((n) << 16) & CTRLDESCL0_3_T_SIZE_MASK)


