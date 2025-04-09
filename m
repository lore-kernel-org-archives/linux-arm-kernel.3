Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67598C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=my7uBvqECB/sOAyowfZ/THu4bYXk54wQNm2Isuf7bmI=; b=LykQmLcvy9+zxpYmB8Cf8E+6VC
	Okr/Lox88cXNk/rHsG5nG4nXaoznYEl8r9pUxMuYIyz1LSinUS/gOrEj+MG4rROKps5kq6dK9LvEE
	tHZY2RWl+s+L/kQ43SVpiLKHyjqyaEpI7Ls5swxVw+CPKKACe+o/1SFoWis4DA5W7p/jpHF6SsmGV
	26oTbfK1YC+57fVEnsJ3QvDcUgLoyStLWW7Z/DFW7+u1wlGczTwdKEFOyfipIKNn5OFaAksHXc5u6
	LbluFLvlamYiYw+6N33lQFNIIC3W/5HQqxoKq5VJejKL7V+bKGON1SP8JU2HbiWfnw9XlQtZbKOYG
	LXBbuDxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QBh-00000006TGV-24CL;
	Wed, 09 Apr 2025 07:49:33 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q6p-00000006SPy-3J1e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:44:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4BAF44385;
	Wed,  9 Apr 2025 07:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744184669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=my7uBvqECB/sOAyowfZ/THu4bYXk54wQNm2Isuf7bmI=;
	b=KBN4MtLmPlhJT8jyUC4btDJo3IEAdZK//JQBMi7WbMu/B+rCd/e6Jjtu4cHLo5Kvj0EdSK
	cugph51E69gQ0bAP5GT4BfMviEgNRyDv+6Q2i207sMKEQ+GV5sawf6B9HJSK+Qsyn4X/PN
	4yPiF1OBscq24kUYPPVXW4w9d9VlbVXMqxUF0yNfYdo4rFZEZPVtEzqgkoHwrl0JJm7BzJ
	TSpA6RdHpamm5Yoj9OBR39bhxgTZKO8wDuumRem3GtazowyfpJjclvaPQM/0K9m+EiGHjT
	RDa4wOKHabrkyze9/YPiVgxCjo8zBIFHrKoSUYE+jAcFRe4jajvaKNcasMBX5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Apr 2025 09:44:25 +0200
Message-Id: <D91XV1I4CY37.20T12FMZ5QLQ5@bootlin.com>
Cc: "Herve Codina" <herve.codina@bootlin.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Andi Shyti" <andi.shyti@kernel.org>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Peter Rosin" <peda@axentia.se>, "Derek
 Kiernan" <derek.kiernan@amd.com>, "Dragan Cvetic" <dragan.cvetic@amd.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Rob Herring" <robh@kernel.org>, "Saravana
 Kannan" <saravanak@google.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Mark Brown" <broonie@kernel.org>, "Len Brown" <lenb@kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Daniel Scally"
 <djrscally@gmail.com>, "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>, "Wolfram Sang"
 <wsa@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>, "Allan Nielsen"
 <allan.nielsen@microchip.com>, "Horatiu Vultur"
 <horatiu.vultur@microchip.com>, "Steen Hegelund"
 <steen.hegelund@microchip.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>
From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
To: "Andrew Lunn" <andrew@lunn.ch>
Subject: Re: [PATCH 15/16] misc: lan966x_pci: Add dtso nodes in order to
 support SFPs
X-Mailer: aerc
References: <20250407145546.270683-1-herve.codina@bootlin.com>
 <20250407145546.270683-16-herve.codina@bootlin.com>
 <19f1a382-1b6b-42bd-a548-a1a5644c9a1b@lunn.ch>
 <20250408162603.02d6c3a1@bootlin.com>
 <D91CSNC07NYM.3KC467K0OZ4GG@bootlin.com>
 <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
In-Reply-To: <c14dd5c6-2dae-4398-89a9-342e7a25bb30@lunn.ch>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdfvhhhomhgrshcurfgvthgriiiiohhnihdfuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeevledvgedtgfekgffffeefgfegieegffeivdekheejgfffueduvdehgeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedupdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_004432_181665_E9413B8B 
X-CRM114-Status: GOOD (  14.66  )
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

On Tue Apr 8, 2025 at 5:38 PM CEST, Andrew Lunn wrote:

> "HW blocks inside an SoC." That would be the SoC .dtsi file. Anything
> outside of the SoC is in the .dts file. OEM vendors take the SoC,
> build a board around it, and name there .dts file after the board,
> describing how the board components are connected to the SoC.
>
> So..
>
> So by PCI endpoint, you mean the PCIe chip? So it sounds like there
> should be a .dtsi file describing the chip.
>
> Everything outside of the chip, like the SFP cages, are up to the
> vendor building the board. I would say that should be described in a
> .dtso file, which describes how the board components are connected to
> the PCIe chip? And that .dtso file should be named after the board,
> since there are going to many of them, from different OEM vendors.

Indeed, that makes sense. So if I get correctly your suggestion,
instead of having a .dtso that describes everything, it should be
split between:

 - A .dtsi that describes what's inside the LAN996x when used in PCI
   endpoint mode

 - A .dtso that includes the above .dtsi, and that describes what on
   the PCI board around the LAN966x.

Correct?

Thomas
--=20
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com


