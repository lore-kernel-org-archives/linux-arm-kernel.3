Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4100DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDpaLLRKWgTQPc41daxcm5CifSb89qHvv5HYCoXxsrk=; b=VN9KB60KrZS2JTllekdiPEKgYB
	2Q3B+H7lHFO0Td6NB1HyAWX0lnL/plArulj3SFuC9knX+m7ixxD8+m4ALw0J3TtzZxct0jIJPSFEF
	1f6DsYRMElz0Uko31oFqLfK5dogmDHmNPDaGF9N92+GlWs6BXw0YoRl1ym09Crl78Vm7X1sRetZHn
	v1rhvBFUdO8f/OM63f4WJlWEq3t+SETDk3s1w5PAbpgJNIE5p21bUgfCRk+KzMXUEhEX9ohrSHRud
	ZDP135pW75cm0h/07f2E0IrwKFYEjBrMM1ITDNSEABnAtcvlWaPgrD4tby92jC37BGC+EDZUMdiiS
	3gAo7WSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwO6S-0000000Fdr2-0ZR3;
	Wed, 10 Sep 2025 16:55:28 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwO6P-0000000Fdps-2OmJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:55:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwO6K-00081C-BQ; Wed, 10 Sep 2025 18:55:20 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwO6J-000ceW-0G;
	Wed, 10 Sep 2025 18:55:19 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uwO6I-00GJtR-2w;
	Wed, 10 Sep 2025 18:55:18 +0200
Date: Wed, 10 Sep 2025 18:55:18 +0200
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
Message-ID: <20250910165518.bzpz5to5dtwe2z6x@pengutronix.de>
References: <20250910-imx8mp-prt8ml-v1-0-fd04aed15670@pengutronix.de>
 <20250910-imx8mp-prt8ml-v1-1-fd04aed15670@pengutronix.de>
 <20250910125611.wmyw2b4jjtxlhsqw@skbuf>
 <20250910143044.jfq5fsv2rlsrr5ku@pengutronix.de>
 <20250910144328.do6t5ilfeclm2xa4@skbuf>
 <693c3d1e-a65b-47ea-9b21-ce1d4a772066@sirena.org.uk>
 <20250910153454.ibh6w7ntxraqvftb@skbuf>
 <20250910155359.tqole7726sapvgzr@pengutronix.de>
 <20250910164231.cnrexx4ds3cdg6lu@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910164231.cnrexx4ds3cdg6lu@skbuf>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_095525_616231_423D69FF 
X-CRM114-Status: GOOD (  20.91  )
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
> On Wed, Sep 10, 2025 at 05:53:59PM +0200, Marco Felsch wrote:
> > IMHO silently removing the support will break designs for sure and
> > should never be done. As said, imagine that the firmware will handle the
> > supplies and the driver only needs to release the reset. If you silently
> > remove the support, the device will be kept in reset-state. In field
> > firmware updates are seldom, so you break your device by updating to a
> > new kernel.
> > 
> > One could argue that the driver supported it but there was no dt-binding
> > yet, so it was a hidden/unstable feature but I don't know the policy.
> 
> Ok, I didn't think about, or meet, the case where Linux is required by
> previous boot stages to deassert the reset. It is the first time you are
> explicitly saying this, though.
> 
> So we can keep and document the 'reset-gpios' support, but we need to
> explicitly point out that if present, it does not supplant the need to
> ensure the proper POR sequence as per AH1704.

We could do that but I think that no one should assume that the driver
ensures this due to the missing power-supply and clock support. But this
goes to the DT maintainers. IMHO we shouldn't mention any document
within the binding, maybe within the commit message, since those
documents may get removed.

Regards,
  Marco

