Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2814CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Orl7eWHVdHFy+WR+gD9uQiA0hr6q43qRIWv8DdjKbbM=; b=cLFVEoD6w+YTLBtc6i/ysZcCZ8
	QqEIylY1Ge8smtx5Rd+SjkV3Do8BxYs8rACr9LXqboqquI2bDL68etYHIzhbnplcok2odgJ8eALbr
	yyeBX/DTL16+eh5VxMTELKJ785q4sFukBW3dDxtSi+giAuFYWQoWnmcN1Ek/Kp3kTP/6se3BbLlGH
	nYe75mqmrqukwgUdxJnSBfxgroDq78dXo2TqykTDVfojUfOB1xUoUR8WjZHnKjM0rQtxD5aMg36s0
	ZzOKua5KorSH4qeEp1u4VTmCNa6MW6+AXA7SYtq8eIpWe6g19LyUcxvayGu+TZe0uNNKW95Te2HFL
	0qop29Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYTC-0000000CP0w-4BQm;
	Tue, 13 Oct 2026 09:06:51 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYT6-0000000COzf-0v2I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:06:49 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 955931F8BD;
	Tue, 13 Oct 2026 11:06:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791882396;
	bh=Orl7eWHVdHFy+WR+gD9uQiA0hr6q43qRIWv8DdjKbbM=; h=From:To:Subject;
	b=ntUHKu9mg7FGUcRTRomXe/QAChsiHB5hBkj3e0+P3of2MKQqsGccxGbo+PIHOVk7L
	 2SsEGB/kFXdXxGqL2WvX/jBdjhuDUew7i6ZTxEkvbDzG/+gyU1WiiEmkC5YwtC7aO/
	 OLxmM/be3SJ0fgnd0iMiV0V9dVPWXaem0HMi7OfAzthlZC8WfxhxHwpjRsA5kRaDTn
	 PV5VcPWmvCZ9U+9EIZUBt41GpfGXdf3LWjpml8XslO9PBiR56gyl07HqXjkleIF9SJ
	 atAU7Ncjo7FZeRswdyxCxHIJQtXG3khsubegJpd8A+ORztvDoTMpOUbgzorP65YYlX
	 QPUHZGjn1vyxw==
Date: Tue, 13 Oct 2026 11:06:31 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Leonardo Costa <leoreis.costa@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add VGA support for Apalis iMX6
Message-ID: <20261013090631.GA33628@francesco-nb>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012164054.GA56180@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012164054.GA56180@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_020645_278788_1187DB3C 
X-CRM114-Status: GOOD (  17.09  )
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

Hello Laurent,

On Mon, Oct 12, 2026 at 06:40:54PM +0200, Laurent Pinchart wrote:
> On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> > This series adds a device tree overlay that enables the VGA output on Apalis
> > iMX6, which is driven from a parallel RGB interface passing through a
> > non-programmable video DAC.
> > 
> > The video DAC is a simple resistor network gated by an active-low
> > data-enable signal. For the bridge to work properly, this series also
> > changes the following in the dt-bindings and simple-bridge driver:
> > 
> > - dt-bindings: Add a new compatible for the bridge in the simple-bridge
> >   binding. This is necessary because the existing dumb-vga-dac compatible
> >   doesn't describe a data-enable signal polarity.
> > 
> > - simple-bridge: Add the VGA bridge match-table entry and timings
> >   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.
> 
> Is there schematics available anywhere ? That would help reviewing the
> series ?

This circuit is on the SoM, and the SoM schematics are
confidential and not generally available.

I tried to extract as ascii art the relevant circuit, hope it helps

BLUE (5 bits)
=============
DISP0_DATA[4] ---[R30   348R]---+
DISP0_DATA[3] ---[R33   715R]---+
DISP0_DATA[2] ---[R36  1.47K]---+-------- VGA1_B
DISP0_DATA[1] ---[R39  2.94K]---+          |
DISP0_DATA[0] ---[R42  5.90K]---+          D
                                           |
DI0_PIN15 ------------------------------ G | T4 MMBF2201N
                                           S
                                           |
                                          GND


RED (5 bits)
============
DISP0_DATA[15] --[R31   348R]---+
DISP0_DATA[14] --[R34   715R]---+
DISP0_DATA[13] --[R37  1.47K]---+-------- VGA1_R
DISP0_DATA[12] --[R40  2.94K]---+          |
DISP0_DATA[11] --[R43  5.90K]---+          D
                                           |
DI0_PIN15 ------------------------------ G | T5 MMBF2201N
                                           S
                                           |
                                          GND


GREEN (6 bits)
==============
DISP0_DATA[10] --[R32   348R]---+
DISP0_DATA[9]  --[R35   715R]---+
DISP0_DATA[8]  --[R38  1.47K]---+
DISP0_DATA[7]  --[R41  2.94K]---+-------- VGA1_G
DISP0_DATA[6]  --[R44  5.90K]---+          |
DISP0_DATA[5]  --[R45  11.8K]---+          D
                                           |
DI0_PIN15 ------------------------------ G | T6 MMBF2201N
                                           S
                                           |
                                          GND



Francesco



