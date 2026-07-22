Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603EBC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdAhWxxku1ExCVmeOf7trOMVycxMJvkpBoDlah5X6ic=; b=LxmjmgleNkPXdH4x+JX/JAUeuy
	bqDAL4Bl0pHu7X+7MZM6v6WccjdZ5m9TS3DXefhrx/8w1gxBR6pmMRBf6KZCpdcvrX6CTvu7J5c5O
	Q7I3EQYxdgagwExHrfjucFGv33Kj7CEDELlj3VoavDEewUkvrNey/yHPNPk7IUnvZrdCrXChsWfZz
	mutcvjTsapeH5Plnpt1le4vdIeGGZJ+AbVl8QK6j6OBXDWMWh1oZGGpcUn6RYB4twUIkuTTlRXHBC
	F97K8wZZ/iSsUPy7PPpIDqLqv3jd8T5fnx2Wxqjfc9BMlPRCbKcgkqa8rROybWctOvKyDyN2FMuOu
	NGGGh5hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZc3-0000000CIup-0Ond;
	Wed, 22 Jul 2026 16:16:03 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZbu-0000000CIrk-3MLr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 16:15:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-495590dde14so37889295e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784736953; x=1785341753; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hdAhWxxku1ExCVmeOf7trOMVycxMJvkpBoDlah5X6ic=;
        b=DHa7Z9Isn9hiDyfrtzx+AO3nqg8lmpAWftBoFR4DmGh3LT+F+BLSA2yNL568Hiy3zv
         9IwXIqhHApd/wPAjUBbQL/7BHQiKEFlA+U+YkENlxk/YzmxJG1UkqVP+DvNF6p5U1WQH
         oA6pWyCuD+Ln9IBJFltJHgA3LX/T5z/pB8TnzDfTMfMN7IqqLbq4ZeWq/QAgM646CguV
         6lbon/BizKO3dWMlwfWtSqcIGlKqoFInzYPTV0gdTsMxaA2b6/6MAlmzoJwqZJSjBrQi
         KSW1t+LdOLEX9AU9N/PagiTNjTBLf5X4wTXb0DZNo4659Cd2DZszuxMjdGkn9BBWAejy
         o25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736953; x=1785341753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hdAhWxxku1ExCVmeOf7trOMVycxMJvkpBoDlah5X6ic=;
        b=bH9fvgkU5ZQUwbisoUGYRhUsEtZssRm2bX49HdgGjY5bJB8dDek9nopIqozyALVEBE
         Z0wxTPvaWMeNXuUzAsIjB11P3LVGfr8cJ8REhSMJbv84vZdupDVn40f8ikGeK3qzDyvA
         bhG3zdzF31Ajz+oUyvbF2zP7XXp1njdLih99kBlFE+jCu9Dx0M2wPTtrKtChGSehJYto
         oGc91wdKHOGS6pWr4JnBRkapuJwV690rkT+Pn2335ASzgGIY56hN96jiRkXtpa6F1oTi
         uZf9Cd7Xl2waoRMgUlFZ/u0oGq4RFRyrCQGMSAGcclixMG6SHYcN4RMwZBDHrFN0J3RO
         zWuw==
X-Forwarded-Encrypted: i=1; AHgh+Rod+z+vz7JJkB+oFUsJpKhOhJG1X2POEI0e3Goy4uClBQpgyzFjZlVvMdepT/teRz9xWC3CNnOTKmWDWAqiYoZC@lists.infradead.org
X-Gm-Message-State: AOJu0YxUGALcSCx3m5rAhv6XGN7Ow4nWY4z/BezYm+d4xV66g6J2QZQH
	DPkN5Kuy+mB55pZtkEQ65hP9Z/9tSBIyRS7e3v8lXGC/LjxeYdHUOaA0
X-Gm-Gg: AR+sD11crtmSoe2+JpAdVnI6Dh9S0LD/KY9gU8m8JTjI/TtlMLEvp4MAFeKjE82mWHa
	wJDEbPxVvBLK/nVLMVDTF1uq9BqYV8hdvCcccq6xWDd7NJ1zpugpT0eIR8+pNe/CnXJlH9R0UJB
	mGO86rqk0lGym01RPNjAa9KtFRIU3uvZ52tGQHLtiPTZzSNLl/VUXukcg8zdUe22fP0Ecrhn1NN
	dIrRvI1fOgoPE4Qcd6f9u4MWzTIxrgO3qA3zziCvY2Vu+cy28O60WoYKFXXsqdNehc5KPUg3Sna
	KYv9YFn+mivs1NoPBaIeGgAsBftlgpKBOkM+66Ygi9rzSuqlp7vq2MZtEmMuigGVCnCNFySrd9w
	Ka5igZx/30IsDeM50w83NK2bf+cngHHTOWCfYOeYksGRZX/2equbrqQXkfrxNHweqnBlAuu8JAc
	JpSUvJutbn4ylAxzEJwpZp9tAwj+SxIT7ZMX75bMY0XJy9S6TXlxEKrGnOEfvBXtLVJ3mRYylil
	5ZFCA==
X-Received: by 2002:a05:600c:4685:b0:495:3f99:849c with SMTP id 5b1f17b1804b1-4954a3f48ebmr309531885e9.15.1784736952504;
        Wed, 22 Jul 2026 09:15:52 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49565304aefsm146049575e9.0.2026.07.22.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:15:52 -0700 (PDT)
Date: Wed, 22 Jul 2026 18:15:50 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex
 OV5640 CSI Cameras
Message-ID: <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amDXGRT80HfyJwCt@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_091554_868463_E497C82B 
X-CRM114-Status: GOOD (  39.63  )
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

On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > Hello Kieran,
> >
> > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > >
> > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > >
> > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > camera module.
> > > > > >
> > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > >  4 files changed, 119 insertions(+)
> > ...
> > > I think with the Toradex ecosystem there would be some value in
> > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > so that we can abstract the hardware which is being 'added'.
> > >
> > > I think it's important that we tackle the problem of combinatorial
> > > explosions of overlays when we can add a component to multiple
> > > platforms.
> > >
> > > For example, your OV5640 camera could be added to many different boards
> > > - and each board could have many different cameras - in different ports.
> > >
> > > We should not be copy/pasting overlays for each combination, or we'll
> > > have 'thousands' of identical overlays.
> >
> > I see your point, and I agree that it would be valuable to move this
> > topic forward. I will raise it internally at Toradex and see how we can
> > contribute.
> >
> > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> >
> >  | DT connectors have been discussed for the last 10 or so years and three
> >  | is still no real progress.
> >  |
> >  | I would be happy to send a follow up patchset which would convert the
> >  | DTOs to whatever connector implementation format lands in the future,
> >  | but I am concerned that waiting for DT connectors will block this
> >  | patchset from landing for a long time.
> >
> 
> I do quick check for ov5640, we can use partial connectors, which already
> in kernel tree.
> 
> use duplicate label like
> 
> in mainboard
> csi_io_i2c: &i2c3 {
> 	...
> }
> 
> csi_io_regualotor_3v3: ....
> 
> 
> csi_io: connector_csi {
> 	compatible = "...";
> 	gpio-map = <0 0 &gpio1 3 3>;
> 	...
> 	irq-map =<0 &gpio1 4 1>;
> 	...
> }
> 
> in 5640 overlay
> 
> &csi_io_i2c {
> 	camera@xx {
> 
> 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> 	}
> }
> 
> https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> 
> Only clock part have dependence. other parts. I am working mipi dsi for
> display, almost work except panel show have some problem, which is not
> related with connector.
> 
> Frank

This is very interesting and I agree with both you and Kieran that it
would be great to abstract these connections away and kill the need for
so many variations.

Certainly I will read up on this and spread it internally as well.

That said, since there are still unresolved dependencies, I am not
convinced that we should already head this way with this series. It
supports hardware that exists today in the currently standard and clean
way.

Can we consider moving to this once these patches are merged and we see
benefit?

Kind regards,
Ernest


