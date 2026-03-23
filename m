Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCC9F46102
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 12:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJ0gyR81/1WEFsq5/EEfbiyKSUH/x20GMn/RIAJnyFE=; b=mgz6hrS4kN6d68RaO7NjV2eTQh
	FdK1bTRXclb7q4JT2Uze3oTF7G1WVmQCSl/cdSq5zWaZ9NEwFL9Fw07x8NeV1IuZU2ts233y/gSVQ
	L6kNBW76qf8ALn2wbJMLQUDCstQMzKMLBw9dJe4sa74eEZ3C7wBm4eZ1tNvtnmYWPDrr32Ve5rKLF
	nqHWBoFrJ1EfcxU8YlxJE1STOuu9EHXso9gtnCiUoi+mAOkjlxMPP4zRU8AgKuDISgN+mabu/s8Ke
	ptA94uzuSBJIJ2nx9hszv9X+vKRrLEQVMGUt+yhuHHukL24KGIMmrHLrTbViayKB2IayodL1uGGVG
	8+8ZEEvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4enw-0000000GjDa-3T7T;
	Mon, 23 Mar 2026 12:54:48 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ent-0000000GjDB-3SWA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 12:54:47 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id AAAAEC3EEAC9;
	Mon, 23 Mar 2026 13:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl AAAAEC3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>,  Marco Felsch
 <m.felsch@pengutronix.de>,  Marek Vasut <marex@nabladev.com>,  Stefan
 Agner <stefan@agner.ch>,  Simona Vetter <simona@ffwll.ch>,
  <imx@lists.linux.dev>,  Fabio Estevam <festevam@gmail.com>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Frank Li <Frank.Li@nxp.com>,
  <linux-kernel@vger.kernel.org>,  <dri-devel@lists.freedesktop.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  <linux-arm-kernel@lists.infradead.org>,  Lucas Stach
 <l.stach@pengutronix.de>
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
In-Reply-To: <ecd02f87-c4b7-44ed-8ecf-98e0990af34a@nxp.com> (Liu Ying's
	message of "Mon, 23 Mar 2026 16:18:55 +0800")
References: <m3ms04caaj.fsf@t19.piap.pl>
	<32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
	<m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
	<20260320-amiable-hairy-bullfinch-28bfda@houat>
	<m3a4w2d4ds.fsf@t19.piap.pl>
	<ecd02f87-c4b7-44ed-8ecf-98e0990af34a@nxp.com>
Date: Mon, 23 Mar 2026 13:54:37 +0100
Message-ID: <m35x6mpuya.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_055446_024855_78A1DED3 
X-CRM114-Status: GOOD (  13.61  )
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

Hi Liu,

Liu Ying <victor.liu@nxp.com> writes:

> If you may use a display mode with low resolution, say 640x480p60, and
> the issue still happens, then I bet it's not related to the panic
> threshold settings, but more likely related to KMS detail control seqeunc=
e.
> This reminds me that Lucas had a patch series[1] to try to fix the
> sequence, but it seems that it didn't fix i.MX93 LCDIF according to [2]
> hence no landing.

It seems it depends on resolution: at 1080p60 with the DIV_ROUND_UP
(thresholds increased by 1) it seems to work fine. At 2160p30 (twice the
clock) there are frequent underruns. Now with thresholds increased to
2/4 and 3/4, weston started fine 10/10, while shutdowns were 8/10.
4/6 and 5/6 made it worse, though.

I don't know now. I will try to investigate a bit more tomorrow.
Perhaps the sequence of register writes could be better, indeed.

The following doesn't fix it for me either:
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -358,34 +358,27 @@ static void lcdif_enable_controller(struct lcdif_drm_=
private *lcdif)
 	writel(INT_ENABLE_D1_PLANE_PANIC_EN,
 	       lcdif->base + LCDC_V8_INT_ENABLE_D1);
=20
-	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
-	reg |=3D DISP_PARA_DISP_ON;
-	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
-
 	reg =3D readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
 	reg |=3D CTRLDESCL0_5_EN;
 	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
+
+	reg =3D readl(lcdif->base + LCDC_V8_DISP_PARA);
+	reg |=3D DISP_PARA_DISP_ON;
+	writel(reg, lcdif->base + LCDC_V8_DISP_PARA);
 }
=20

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

