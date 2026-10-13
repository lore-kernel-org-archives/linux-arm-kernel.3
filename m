Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A69BCC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIIe7Oi+djZ9XgtHUXw31H42TUuD0xP0hAFUDgxj2bU=; b=klZ0NXbxswMfHsEz71qD1C0he7
	UeWzYFHMWZWPWgLYagmXXCAu+hmtZkMm06iwqClaeET1X8/Zv4ec9FRquUaErnY7AnXuTTYSpFzdp
	wNljf0rdM3YXG8IPQLLS4HXDgQQygoPKm0DYMlnGnpLCs33qYT2WwJWsnyYEvF5ALsKCZ8/CKykq4
	lDiRjqEAF2r2Kd0e4S9Wjfzv84ktTYNzsoiQ5mzeknmKHYyaZu43e5t3KtLEyBvYSCAhDfzadSKW6
	G3EEawgKZW8yNxeYgP/m+ZQ4baUIYHKCYnEBeMu88oxPTBBhjLS7cYnXYFHsjhCpe1MOa4jDzRn+8
	MsyxXdPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbxh-0000000Crx5-1UOx;
	Tue, 13 Oct 2026 12:50:33 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbxS-0000000Crav-16ay
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:50:29 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 30FC31FA7B;
	Tue, 13 Oct 2026 14:50:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791895815;
	bh=gIIe7Oi+djZ9XgtHUXw31H42TUuD0xP0hAFUDgxj2bU=; h=From:To:Subject;
	b=nmFIZ9/ygIVjsJ+MFJOliYWK15FxmtiHwLb1yir2UWXDHQzZe/lNhR6cCWLXfERX+
	 U/CU5C9Rb2PzY7pmzWpQrE1ub+62YmLDTzrO2r8tfszo/jPxbVgrfmWphOgxTp5ZMa
	 GhRh5Pq8he1TT12R4H40qzivyWsNTks5OKRZPiApYbXMNJGWQxg9Y56nX3Eo4kshJm
	 Mfvg4ANNyC8BVdagjE3Epp20tpDj33S2saBFU8AZ7n9OQlCSUhTcsvy39iR2U5QWMG
	 k+gyFjAMMA1+TXVvSJXU6wa6NwQ00y6uwcJPHNT7u78y2qAo+PdGoe9uc8DuDngorT
	 NXedGwmBcUUnw==
Date: Tue, 13 Oct 2026 14:50:12 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Leonardo Costa <leoreis.costa@gmail.com>,
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
Message-ID: <20261013125012.GB73534@francesco-nb>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
 <20261012164054.GA56180@killaraus.ideasonboard.com>
 <20261013090631.GA33628@francesco-nb>
 <20261013111158.GG56180@killaraus.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013111158.GG56180@killaraus.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_055024_237429_4D902FFE 
X-CRM114-Status: GOOD (  22.92  )
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

On Tue, Oct 13, 2026 at 01:11:58PM +0200, Laurent Pinchart wrote:
> On Tue, Oct 13, 2026 at 11:06:31AM +0200, Francesco Dolcini wrote:
> > On Mon, Oct 12, 2026 at 06:40:54PM +0200, Laurent Pinchart wrote:
> > > On Mon, Oct 12, 2026 at 04:25:22AM -0300, Leonardo Costa wrote:
> > > > This series adds a device tree overlay that enables the VGA output on Apalis
> > > > iMX6, which is driven from a parallel RGB interface passing through a
> > > > non-programmable video DAC.
> > > > 
> > > > The video DAC is a simple resistor network gated by an active-low
> > > > data-enable signal. For the bridge to work properly, this series also
> > > > changes the following in the dt-bindings and simple-bridge driver:
> > > > 
> > > > - dt-bindings: Add a new compatible for the bridge in the simple-bridge
> > > >   binding. This is necessary because the existing dumb-vga-dac compatible
> > > >   doesn't describe a data-enable signal polarity.
> > > > 
> > > > - simple-bridge: Add the VGA bridge match-table entry and timings
> > > >   struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.
> > > 
> > > Is there schematics available anywhere ? That would help reviewing the
> > > series ?
> > 
> > This circuit is on the SoM, and the SoM schematics are
> > confidential and not generally available.
> > 
> > I tried to extract as ascii art the relevant circuit, hope it helps
> 
> Thank you, it makes things clearer.
> 
> The circuit seems fairly generic. Wouldn't it be better to add an
> optional property ot the dumb-vga-dac instead of a new compatible string
> specific to Apalis ?

We discussed this internally and we were not 100% sure, so we decided to
go with this proposal that seemed easier and less controversial.

With that wrote, I let Leonardo comment on the pro/cons of the two
approaches.

Francesco

