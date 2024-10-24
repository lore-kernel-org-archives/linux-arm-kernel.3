Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF342D2C56C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxICbmbmSwf18AfhvVR9epHA6gYchHkc0Cd7fB+w2a4=; b=cmVfpJqu2WUj9XTR6YiqU2cRJF
	f96uZs9W1csUvvhe1OcLUYObZU4dO8AAsZG2LTDa/0pKjGYJeoNt14p+bqaUrlaYr32x0IS4etVwc
	jt2QRe/4lGhWS0Q1h2innoe0W2sczWMZVfNmIxzWqLCAs/2r1B9hMkCHfRW+3dm6/cw2nIqvLObQE
	fJUy5rFyn3F3CCSAynX8vHt9Z9rfMb3zIvkik+VOmTG0ql6L7KuNKW9+FZYCIyxltVTsJjmTC+6jg
	hvPKZXR7Puc5WO6M5u/nY1fIIAEMAPEth8v9bCJmqYXJvdu+siLrWT8j6eT0xKwWzZ8puH4zoGz22
	nGftz8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vPv-000000007js-2wRz;
	Thu, 24 Oct 2024 10:50:11 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vIZ-000000006Mg-3jlE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:42:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t3vI7-0005ly-UW; Thu, 24 Oct 2024 12:42:07 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t3vI5-000BPM-0K;
	Thu, 24 Oct 2024 12:42:05 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1t3vI4-0007P8-3B;
	Thu, 24 Oct 2024 12:42:04 +0200
Message-ID: <7512cbb7911b8395d926e9e9e390fbb55ce3aea9.camel@pengutronix.de>
Subject: Re: [PATCH v10 0/6] Add support for the LAN966x PCI device using a
 DT overlay
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Herve Codina <herve.codina@bootlin.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Simon
 Horman <horms@kernel.org>, Lee Jones <lee@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Lars Povlsen
 <lars.povlsen@microchip.com>, Steen Hegelund
 <Steen.Hegelund@microchip.com>,  Daniel Machon
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, Andrew
 Lunn <andrew@lunn.ch>,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Allan
 Nielsen <allan.nielsen@microchip.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Oct 2024 12:42:04 +0200
In-Reply-To: <20241014124636.24221-1-herve.codina@bootlin.com>
References: <20241014124636.24221-1-herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_034235_951095_31D4B037 
X-CRM114-Status: GOOD (  10.20  )
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

On Mo, 2024-10-14 at 14:46 +0200, Herve Codina wrote:
> Hi,
>=20
> This series adds support for the LAN966x chip when used as a PCI
> device.
[...]

Applied to reset/next, thanks!

[1/6] misc: Add support for LAN966x PCI device
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D185686beb464
[2/6] MAINTAINERS: Add the Microchip LAN966x PCI driver entry
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D86f134941a4b
[3/6] reset: mchp: sparx5: Map cpu-syscon locally in case of LAN966x
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D0426a920d626
[4/6] reset: mchp: sparx5: Add MCHP_LAN966X_PCI dependency
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Deba0dedd27f9
[5/6] reset: mchp: sparx5: Allow building as a module
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D996737ef676f
[6/6] reset: mchp: sparx5: set the dev member of the reset controller
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D37b395c2c489

regards
Philipp

