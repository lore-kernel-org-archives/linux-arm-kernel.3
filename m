Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED10CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2vXwQfHKqCDjo4zHzNAP8besnHwyG0reXiDXSzw75g=; b=BxEYGz0GPG66s5rr97Hi3+Zvnz
	1F2HkXFY+ElFk44C8n7ytGc8rXcuNu4A+4mdyfmsKGA0Lly6Ck8RmB4oDWWniQUl8lNDBEuLQKAro
	dQWPew7cY+YBpGk3p/5dffDqVoy82fEzIZ3z/R50fSHaL6uRpCkRu/mR1z/JB1vvSyx+S7TX6kGVV
	btK4jZd1j+MbZiNJhi+P6MzGK3su5E9lBD4jIeYMKyEKSrLdsDV5OnTGpEEbplJN85jS1NHO1zpQD
	ktsuvdvUh/vU1fA3L01ubuNiq6SEi6tlGBydQ9FjnVk2Anem6bs0rLssI474TFi3HxWSa+cNXKWV/
	xVwFxHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN96-0000000FH3S-3ars;
	Wed, 10 Sep 2025 15:54:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwN94-0000000FH13-1bWS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 15:54:07 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwN8y-0008U5-Ku; Wed, 10 Sep 2025 17:54:00 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwN8x-000cAf-1T;
	Wed, 10 Sep 2025 17:53:59 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwN8x-00GJ0O-0v;
	Wed, 10 Sep 2025 17:53:59 +0200
Date: Wed, 10 Sep 2025 17:53:59 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Jonas Rebmann <jre@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: nxp,sja1105: Add reset-gpios
 property
Message-ID: <20250910155359.tqole7726sapvgzr@pengutronix.de>
References: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
 <20250910-imx8mp-prt8ml-v1-1-fd04aed15670@pengutronix.de>
 <20250910125611.wmyw2b4jjtxlhsqw@skbuf>
 <20250910143044.jfq5fsv2rlsrr5ku@pengutronix.de>
 <20250910144328.do6t5ilfeclm2xa4@skbuf>
 <693c3d1e-a65b-47ea-9b21-ce1d4a772066@sirena.org.uk>
 <20250910153454.ibh6w7ntxraqvftb@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910153454.ibh6w7ntxraqvftb@skbuf>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_085406_420257_BDF99E81 
X-CRM114-Status: GOOD (  36.70  )
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

On 25-09-10, Vladimir Oltean wrote:
> On Wed, Sep 10, 2025 at 04:09:05PM +0100, Mark Brown wrote:
> > > And if you plan to do that from the GPIO function of your SoC, the SoC
> > > might be busy doing other stuff, like booting, and no one might be
> > > driving the RST_N voltage to a defined state.
> > 
> > I suspect you're reading too much into the datasheet there.  I suspect
> > that what it's trying to say is that the reset signal only works with
> > stable power and clocks, that it must be held low for the 5us while
> > those conditions hold and that you have to do at least one cold reset
> > after power on.  The above wording is pretty common in datasheets and I
> > know in a bunch of cases it was carried forward kind of blindly rather
> > than looking at the actual device requirements.
> 
> No, it doesn't say that, and I had discussions with the application
> engineering team for this chip about this :-/
> 
> I can't comment on anything extrapolated outside of the SJA1105/SJA1110.
> 
> > > It really depends on a lot of factors including the reset timing and
> > > supply voltage distribution of the PCB, but RST_N has essentially 2
> > > purposes. One is ensuring proper POR sequencing, the other is cold
> > > resetting at runtime. You can do the latter over SPI with identical
> > > outcome, which leaves proper POR sequencing, which is not best served by
> > > a GPIO in my experience.
> > 
> > I'm not sure not including the signal in the DT bindings is going to
> > influence board designers much either way TBH.
> 
> Either way, something has to nudge at least the software developer
> towards finding and reading the vendor's relevant documentation.
> 
> In that sense, 'reset-gpios' is misleading to say the least, because
> everyone sees a reset GPIO and has the human tendency to think there
> isn't anything more to be known about it (like I also did).
> 
> To be clear, I'm saying that supporting 'reset-gpios' in this driver was
> a mistake, at least in the form where its supplies and clocks aren't
> also under control. I'm not sure it's a mistake that we need to document,
> and if we do, there need to be a lot more disclaimers. Also, I'm pretty
> sure nothing will break if driver support for it is simply removed.

IMHO silently removing the support will break designs for sure and
should never be done. As said, imagine that the firmware will handle the
supplies and the driver only needs to release the reset. If you silently
remove the support, the device will be kept in reset-state. In field
firmware updates are seldom, so you break your device by updating to a
new kernel.

One could argue that the driver supported it but there was no dt-binding
yet, so it was a hidden/unstable feature but I don't know the policy.

Regards,
  Marco

