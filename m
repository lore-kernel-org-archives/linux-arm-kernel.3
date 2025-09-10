Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A121CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqHLtl4+6vBepurPiwlhpLxhji1pXDTSPcdmiUQcV2Q=; b=1amC40gqT0dcGjBnwJ2uI0BQEQ
	E/O4Hx5ayHSTzxXAMUba57S8M+khM5ju+CZwnSIttf3FylLtQjt8m5d5pZ29+zX5EJ5l8Pmyu/zo2
	tpx8b4H0GcYYonpDE+xObHZEj6yGb8Mr+k+4KT1xlJbmy3duj6VuIyIfU647xdtljBHokKqZS0OQB
	d0NOqjh2YVfO5wwfqqUR47xKB+lwrg/svizFMjGm6jczealrb+IZ3UiUJw7CM9JJqxxJ0Pbg1nOdL
	OC7e76+LXkXUKLoOJhvf/487a/CXd9zFZJz96mSYn9rqqfeBQ5QiejJuOMfYAoycGNmKYBVYzpXLu
	FRzm9hYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLqY-0000000Ej27-0Rxn;
	Wed, 10 Sep 2025 14:30:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLqV-0000000Ej0c-3Rx5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:30:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwLqQ-00075Z-3V; Wed, 10 Sep 2025 16:30:46 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwLqO-000beC-2I;
	Wed, 10 Sep 2025 16:30:44 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwLqO-00GHZB-1j;
	Wed, 10 Sep 2025 16:30:44 +0200
Date: Wed, 10 Sep 2025 16:30:44 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Jonas Rebmann <jre@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
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
Message-ID: <20250910143044.jfq5fsv2rlsrr5ku@pengutronix.de>
References: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
 <20250910-imx8mp-prt8ml-v1-1-fd04aed15670@pengutronix.de>
 <20250910125611.wmyw2b4jjtxlhsqw@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910125611.wmyw2b4jjtxlhsqw@skbuf>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_073051_864022_9B861E10 
X-CRM114-Status: GOOD (  29.54  )
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
> On Wed, Sep 10, 2025 at 02:35:21PM +0200, Jonas Rebmann wrote:
> > Both the nxp,sja1105 and the nxp,sja1110 series feature an active-low
> > reset pin, rendering reset-gpios a valid property for all of the
> > nxp,sja1105 family.
> > 
> > Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> > index 9432565f4f5d..8f4ef9d64556 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml
> > @@ -32,6 +32,11 @@ properties:
> >    reg:
> >      maxItems: 1
> > 
> > +  reset-gpios:
> > +    description:
> > +      GPIO to be used to reset the whole device
> > +    maxItems: 1
> > +
> >    spi-cpha: true
> >    spi-cpol: true
> > 
> > 
> > --
> > 2.51.0.178.g2462961280
> >
> 
> There are multiple issues with the reset line and I was considering
> dropping driver support for it.
> 
> The most important issue is the fact that, according to NXP document
> AH1704, the RST_N signal has to be kept asserted for 5 us after power-on
> reset. That is hard to achieve if this pin is routed to an SoC GPIO.

Can you please elaborate a bit more? I was curious and checked the
AH1704, it says:

"The RST_N signal must be kept low for at least 5 us after all power
supplies and reference clock signals become stable."

This is very common, so the driver only needs to ensure that the pin was
pulled low for at least 5us but not exact 5us.

> Additionally, routing the reset signal to a host SoC GPIO does not bring
> any particular benefit, since the switch can be (and is) also reset by
> the driver over SPI.

I don't know the switch but it's also common that a so called
software-reset may not reset all registers, state machines, etc.

There it's common practice that the driver tries to pull the hw reset
line and if not present falls back to a software reset.

> So, at least for this particular switch, having a "reset-gpios" actively
> points towards a potential violation of its POR timing requirements.

Really? Please see my above comment.

> That is, unless the power rails are also software-controlled. But they
> aren't.

AH1704 Fig.10 just illustrate a reset and power-on sequence. I highly
doubt that the host can't pull the hw rest line if the supplies and the
clock is already running.

You're right about the fact that the driver is currently not able to do
a proper power-on sequence, so the kernel relies on the prev. firmware
or the hw-setup. But this is another problem.

Regards,
  Marco

