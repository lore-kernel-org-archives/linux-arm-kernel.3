Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B951093187
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flWCVMaW85+JPuoAPcJafboUMOeLJMd+PP+2FFkRnCc=; b=yy6tAkGZzqtn4076QN5pWe5ET3
	V2ixpFxYvKhb7w4g7G5yvJOw5kNE2RYgHHyZHRAmalChsSJl7xFnKnERJ6IBjUhWmUmxr/JLgiy0H
	7k6nZMlPrrRMioxQnmFQtuEhAOzxd8phFbizPoTVr0kLpsOjVyPkSo2ChgROvR0GslxBMS2TKqtrd
	UcUkcowL2mUQPMHWy2zaRk6v7tbncanfPcoKJyMoIMCCIcFdfAXarpBi27CEV02W7WNbJnoD9OqpH
	IW+21rJ1BqqVqfZDZR0+5w2JfhCQ//sx4y2tJgDvLc7lY1V86bUKxSvOmyB2LKYqkRaGbH87lsciK
	xjyQSxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Uqa-0000000CJBW-2yQS;
	Fri, 20 Mar 2026 08:04:44 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UqW-0000000CJBA-3Kvr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:04:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3UqB-0007ax-Uy; Fri, 20 Mar 2026 09:04:19 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3Uq9-001Csl-2L;
	Fri, 20 Mar 2026 09:04:17 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3Uq9-0000000Cpgb-2SMG;
	Fri, 20 Mar 2026 09:04:17 +0100
Date: Fri, 20 Mar 2026 09:04:17 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@nabladev.com>
Cc: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, 
	Stefan Agner <stefan@agner.ch>, Liu Ying <victor.liu@nxp.com>, Simona Vetter <simona@ffwll.ch>, 
	imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, 
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
Message-ID: <m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
References: <m3ms04caaj.fsf@t19.piap.pl>
 <32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_010440_834087_C3833E56 
X-CRM114-Status: GOOD (  18.39  )
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

On 26-03-20, Marek Vasut wrote:
> On 3/19/26 12:45 PM, Krzysztof Hałasa wrote:
> > Running (and terminating) Weston on i.MX8MP sometimes produced black
> > or grey screens. The LCDIF3 INT_STATUS_D0 register showed a FIFO underrun:
> > 
> > 32FC6024: 1000002
> > 
> > The PANIC0_THRES register was set to:
> > 
> > 32FC6238:  AA0154
> > 
> > which apparently meant low = 2736 bytes (0xAA * 16 + 16), high = 5456 bytes
> > (0x154 * 16 + 16).
> > 
> > With this patch (based on NXP's driver) the watermarks are only 16 bytes
> > higher (register values increased by 1) and the underruns are gone.
> > 
> > Tested on Solidrun Hummingboard Mate with a 1080p60 HDMI display.
> > 
> > Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>
> > 
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -353,8 +353,8 @@ static void lcdif_enable_controller(struct lcdif_drm_private *lcdif)
> >   	u32 reg;
> >   	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
> > -	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_MAX / 3) |
> > -	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 * PANIC0_THRES_MAX / 3),
> > +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, DIV_ROUND_UP(1 * PANIC0_THRES_MAX, 3)) |
> > +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, DIV_ROUND_UP(2 * PANIC0_THRES_MAX, 3)),
> 
> I am starting to wonder, whether this should be configurable in DT, because
> it seems there might be users that need to tweak the watermarks one way or
> the other for different video outputs ?

+1 to provide a override mechanism via DT.

Regards,
  Marco

> 
> +CC Liu
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

