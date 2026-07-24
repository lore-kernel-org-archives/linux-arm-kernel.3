Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253A5C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkz4nyMnu+p0MmuXqpH9H0qUrj19YSj8Cq+qczGuex8=; b=Jrefbuu5UlE0E+O0EZn69eK1iY
	x8q84gXasiyCsUDc40+EWjRhAtMAt+YXQc13yS3l/GSjs5PuxpEQsPtz2kEGd9oSRlzMIt6bNewe9
	8J+0c3hSwgwVEPhsuMoGR6O+SKy1qXTVF+ii0wM7oakciDEZ5GMGAfsyRNyDcrmpuXgnN2MPDDNaN
	eyP3g+/HfEUkb99bjy+aho+G4pZSZ2JySp8SLwjyHOGAvpqTDxV/ld8UQBDDhoGQufbsyaSon3fyK
	+HXgkWKf0xCgkSbf8ekdvNZYxx815pufb6K4GOMPmTpkLJxhw3NWrjSgcckYynIs8p5qPO0a6GLDw
	zbjLAihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGA9-0000000GVoE-2VFw;
	Fri, 24 Jul 2026 13:42:05 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnGA7-0000000GVnd-0NHz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 13:42:04 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso420847f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 06:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784900521; x=1785505321; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kkz4nyMnu+p0MmuXqpH9H0qUrj19YSj8Cq+qczGuex8=;
        b=Wo9vX0bMMr+JEXwn4eqTOKDaZKR3wa08wMXJBh/rWOju5Rg6ZYZP+5u5hDjc4gUzz9
         iEwsgxzX6aHQ/ZLDZ6gu4wBafqzpt57sLuRE5+1aUm1pvPybQLIntrYFJkxdoms46l1C
         CcF4yqITVZEKcUPzjuM2ERfpxzjME9QHiV7Lo5e17ZhmINUQY03+VaDFhw9xsD9WGw7R
         uRmncVu0dPGQrHfe4J7ND7Hp/2Wz93ZaQPqQlsY2iq7T2tGYpEdeXROQQ/1ymXSGkIqk
         XH1znWAwKYlc4FD1xc45j5sJZ15EFjv94WMFrfoOm7ltwiWOcBoB0l0VAF3ttT1XCIJr
         uSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784900521; x=1785505321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkz4nyMnu+p0MmuXqpH9H0qUrj19YSj8Cq+qczGuex8=;
        b=QAMAuCR+dbUi+7NYEY+8SAHlRIeEFWmk8lPl8IlswSA86xtGhAtzFL9c+KSR9GsPby
         c4FMcSPNjyfuHpGPPeLb0v8NSYUtIOlVkpMhbvPaZwkPplFRFiqEgdk77hCrD+CKKubq
         PUD722AYS3rwLwRLEqAy6asX9PVcPwlR4TmKX1k8WrNxJ+jrjxReoKGF0pS/1f7bTLtw
         q1Mraapqnzx1uuVW19WM4+C4AjwdNgRjjqEy4qzuL2Tti229fnbu6ANGlpnyxJAx9NRz
         oerDRSLV7arnxVjcugA6o5oPWJc5MBJUMsg/GGQK5m+9pOHuG5J4ZVyJOlZXDuDgN9Lp
         95Tg==
X-Forwarded-Encrypted: i=1; AHgh+RpF2nJPBeDhcavRIO84NFjVleKQ0TePaSs570yUY/s8UaPppGNuE8OJWAUcpV+7i1Z0LM1dA7o3bIuPtaHvgchJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo/k7i3/4AHjOzie6+IC8xUferKOlXEjMMSKVXU+9fl+Cp3Sc9
	hJ7Ip5r9oVDaqFF1HTTkEOMW4cVbn6hs9xM26V07WkgsbK35SFZgTtdkNhPueKMv
X-Gm-Gg: AR+sD10yPThAAMt3kuAhESYOMbVFQpKdbhGmCCquSGR+HDNPqli9/BrFD75+WBzzkkd
	FnI4akKDXCEmxV243xuKbxBx4rKSad/z6REv1OX2yY1r8Qdx3qukUF3Lbd1kvQk7EljZM4omy+b
	T3fWkIh5S9MoJUKGzeA7ZDI9J30aCVIS5j5Te09U6DqZnlfbRFvQX9YNlDSFkNvsK4A3/3HbRqr
	XIeQ2CN6O2axPNk84y+v9fujTZvXn5o/5rTExxe5t8A3JDVoPy6mn0bu+zQmv5krbUmkYieT6F5
	MYZN/emJ33EO4uotn5C9t4CduHdRd7FH2lC9d4yMPKgJGsfznLphYJ/XQhF4Y75FD5AwYpaQvOU
	CWF/HNHWpvVD8Shk0Db+YGldaZui6Yc0zE2GXprAV/uPxQ4jkRdSzS6MgG/4UNYDr7NUxJskBiB
	aSZs+FU8deYRaMo1BqYhBAOMSunW8lXKnsEGSfGqZKrg7ASs7RdKnDMlroAtfjH5euj0fvfegOw
	iZN0A==
X-Received: by 2002:a05:600c:1f82:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4957426c545mr83063625e9.1.1784900520632;
        Fri, 24 Jul 2026 06:42:00 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531basm24736797f8f.19.2026.07.24.06.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 06:42:00 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:41:59 +0200
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
Message-ID: <sr26lfvwasgcosfzcf4ydtwxwjjutlio2yqpgxldatpzjo7e4y@77k7gefnjzvl>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
 <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com>
 <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810>
 <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
 <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
 <20260722105914.GA72270@francesco-nb>
 <amDXGRT80HfyJwCt@SMW015318>
 <vrw2wmtywuokachenclid4dnrosaq2xqlzqtyqe75tsdt27yzx@ntztzwyxoadw>
 <amJrv2FDbdkbvMKQ@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amJrv2FDbdkbvMKQ@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_064203_172648_4564C76C 
X-CRM114-Status: GOOD (  48.89  )
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

On Thu, Jul 23, 2026 at 02:30:07PM -0500, Frank Li wrote:
> On Wed, Jul 22, 2026 at 06:15:50PM +0200, Ernest Van Hoecke wrote:
> > On Wed, Jul 22, 2026 at 09:43:37AM -0500, Frank Li wrote:
> > > On Wed, Jul 22, 2026 at 12:59:14PM +0200, Francesco Dolcini wrote:
> > > > Hello Kieran,
> > > >
> > > > On Wed, Jul 22, 2026 at 11:30:29AM +0100, Kieran Bingham wrote:
> > > > > Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> > > > > > On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > > > > > > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > > > > > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > >
> > > > > > > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin CSI_1.
> > > > > > > >
> > > > > > > > The default overlay describes the current CSI Camera Set 5MP OV5640 with a
> > > > > > > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the legacy
> > > > > > > > camera module.
> > > > > > > >
> > > > > > > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-camera-module-5mp-ov5640-arducam
> > > > > > > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > > > > > > Link: https://developer.toradex.com/hardware/legacy-products/other/csi-camera-module-5mp-ov5640/
> > > > > > > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > > > > > > ---
> > > > > > > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > > > > > > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++++++++++++
> > > > > > > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > > > > > > >  4 files changed, 119 insertions(+)
> > > > ...
> > > > > I think with the Toradex ecosystem there would be some value in
> > > > > supporting or helping with the ongoing dt-connectors or dt-addons topics
> > > > > so that we can abstract the hardware which is being 'added'.
> > > > >
> > > > > I think it's important that we tackle the problem of combinatorial
> > > > > explosions of overlays when we can add a component to multiple
> > > > > platforms.
> > > > >
> > > > > For example, your OV5640 camera could be added to many different boards
> > > > > - and each board could have many different cameras - in different ports.
> > > > >
> > > > > We should not be copy/pasting overlays for each combination, or we'll
> > > > > have 'thousands' of identical overlays.
> > > >
> > > > I see your point, and I agree that it would be valuable to move this
> > > > topic forward. I will raise it internally at Toradex and see how we can
> > > > contribute.
> > > >
> > > > At the same time, quoting Marex (https://lore.kernel.org/all/dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com/):
> > > >
> > > >  | DT connectors have been discussed for the last 10 or so years and three
> > > >  | is still no real progress.
> > > >  |
> > > >  | I would be happy to send a follow up patchset which would convert the
> > > >  | DTOs to whatever connector implementation format lands in the future,
> > > >  | but I am concerned that waiting for DT connectors will block this
> > > >  | patchset from landing for a long time.
> > > >
> > >
> > > I do quick check for ov5640, we can use partial connectors, which already
> > > in kernel tree.
> > >
> > > use duplicate label like
> > >
> > > in mainboard
> > > csi_io_i2c: &i2c3 {
> > > 	...
> > > }
> > >
> > > csi_io_regualotor_3v3: ....
> > >
> > >
> > > csi_io: connector_csi {
> > > 	compatible = "...";
> > > 	gpio-map = <0 0 &gpio1 3 3>;
> > > 	...
> > > 	irq-map =<0 &gpio1 4 1>;
> > > 	...
> > > }
> > >
> > > in 5640 overlay
> > >
> > > &csi_io_i2c {
> > > 	camera@xx {
> > >
> > > 		reset-gpios = <&csi_io 0 ACTIVE_HIGHT>;
> > > 	}
> > > }
> > >
> > > https://lore.kernel.org/imx/AM9PR04MB8353AC7DF91C5F73C34019E0E3F72@AM9PR04MB8353.eurprd04.prod.outlook.com/
> > >
> > > Only clock part have dependence. other parts. I am working mipi dsi for
> > > display, almost work except panel show have some problem, which is not
> > > related with connector.
> > >
> > > Frank
> >
> > This is very interesting and I agree with both you and Kieran that it
> > would be great to abstract these connections away and kill the need for
> > so many variations.
> >
> > Certainly I will read up on this and spread it internally as well.
> >
> > That said, since there are still unresolved dependencies, I am not
> > convinced that we should already head this way with this series. It
> > supports hardware that exists today in the currently standard and clean
> > way.
> 
> Your ov5640 have not such dependence. You can try connector firstly.
> 
> display most like can go through connector, (I remember pwm already
> supported, but not sure).
> 
> others continue go through old method until dependence clear.
> 
> Frank
> 

The ov5640 still requires a clock nexus which is not merged yet.

I have been playing around with it locally now and find the work here
very interesting. Certainly this is also useful for Toradex and I would
like to use it to reduce duplication.

We will repeat this work for the Verdin iMX8MP. So I see real value in
using these new mechanisms to map the GPIOs such that the Verdin ov5640
overlay can be reused. However, this would also require a new binding
for a "verdin_csi" device.

Therefore, I could consider dropping the ov5640 overlays from this
series and sending them as a follow up with the partial connectors
support. But I don't want to block the series from getting merged for
this non-trivial effort.

If we go that way, I wonder where the verdin-ov5640 overlay should go?
We also have Verdin modules with a TI SoC, with the OV5640 overlays
already merged, that could be refactored. Those live in ti/, not
freescale/. Do you have any input on how we should deal with that?

Personally I am still more in favour of merging now and refactoring with
our next series for other SoMs, but I understand the desire to start on
this now so there are more consumers of this new behaviour.

Thanks for your input and kind regards,
Ernest


