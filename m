Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6638BFF60FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ppm8Ahxu3yD+PaCS+Jim/Aqx0Ce8DbNQlo2I+oBEARU=; b=tQtRHA1Yn+OKEm15wY6wmO3JUz
	WSyDE/dFoO79jizKzyj5viLLWQkE9J2BghTJy+NfWLSBTY2vzyCG/iCDTgyHUp/2T4/ZIXAdmI5Zx
	ubJOd39xBsupsj2WsIHaIYoT9FsnEIliQP1jSZaBkP+lmxYIghl8cLoPXzZs433fJj2c04MSTJj0B
	psaEqL+oBYHG6xRkq6p5PgwxWKG6Ju5RWNwr32oBCfo8vRyet+43RV6p/6VC8CMPUFnofNwmZwQA+
	7M8jPEcspq0Kucv30KmkR3CvVds9KAZrg13fDJ3u2P9PVES8NoOMkF4JQVKMEJbbwSPBl8N04Cobp
	uX0XAYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W5B-0000000CkYc-3gNn;
	Tue, 31 Mar 2026 10:12:25 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7W58-0000000CkXG-3XxB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:12:24 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id F12ABEC010C;
	Tue, 31 Mar 2026 06:12:20 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 31 Mar 2026 06:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774951940;
	 x=1775038340; bh=Ppm8Ahxu3yD+PaCS+Jim/Aqx0Ce8DbNQlo2I+oBEARU=; b=
	SH5HD3eDFjqigcr/67yohxqmEFPcoDYm+X66SGibt8qEGfUvVYOF8Fb2pErlBdJk
	gS3Fk6APUCJC/Ydbo8NykY5BH7rKOfxiQPAvYxpk2MF6J2dUNoAKxTLnGoYPxFmU
	DQkhNlRqRr7Ql/QCON1ryH0nim/eKY/AWEBnKuinvp1XmblZDTdgoGUgDwrOZ4/c
	PrX0ZhZIBl2SDv3cSHI13UhpclcUE99/klk6NBGiOPLwJHqLLnwcuDT6M+lGFxmi
	31mOciEGB32HB1X3EhK7cZRlOCkP4WApBnG7p67mL2S23snBa4j4FZolC3JYCCju
	l/kPh+S6hoFiUjigRyZ/bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1774951940; x=
	1775038340; bh=Ppm8Ahxu3yD+PaCS+Jim/Aqx0Ce8DbNQlo2I+oBEARU=; b=J
	heDDw++4zOPnwVEt4nKnSX739unAB96P1xTMIZdCDH59ovLtEUqU6WTkp/KAx/s/
	g2a9M9SJRSu5eXpToDVGv8ufqm9yRYH4fxX2JoAPLcs6gSDXd11ZuibCA3rH9Z5X
	snxpvBtPvz2otie2z1+/bmkHMV3HkH5LGydrDouPm1rov3J74auD1ikEQOb0eZXU
	3Z3VO/BrEiZcso9tl9HAize72+MxRmq9bwNff/cJNcI6J8Pb+MtpwGpq7Heo4kbD
	qnuxlxQEoF623TGCBAC3LKmYtQhrKgtY2kX4CzUg5bxCmCt0ZEsrZYOg2k3ebwpo
	nNSGpta9lQvDABDyHgvXg==
X-ME-Sender: <xms:BJ7LacTMVsVR2n3PY_TFnbd3-JVesOhKJHqrEfgZBliveklaH6ZTaQ>
    <xme:BJ7LaUkbLJqcOkbDAT0uuax9_BhkPUyeEdcXB-S01Z9G69BSehW__hR0yrVpe1mfX
    ZglUg91dBZx_bPoofZ_vNKZsRhoVyApPO4Z-mh39os0B8-UwbH8rXc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefgeduieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheptghhvghsth
    gvrheivdehudehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehg
    mhgrihhlrdgtohhmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehk
    rhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehr
    ohgshheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:BJ7LaddLmIq35YemD71eYqqc6mzG5eLijk23RuFEQ3BTb8wC75g4_w>
    <xmx:BJ7LaYsk_2JHQ6SFNpX-EkzZ6nmJyF2phArkF-dCiaVchnnRWU1eEQ>
    <xmx:BJ7LaSmHEKbIz7QwDnLsC5Q6h0EKLqK7cOfq3XMumq6xK0XOoWjCCQ>
    <xmx:BJ7LaUNKtVS1PZvg4n9AvAMg1JNydzOj-lm-Bm8Ynj5veo9TpfFhQw>
    <xmx:BJ7LadQ-ubt37WZVfMH62Qp9RhbIYCL0YTWmv2MWnCrvo8iyrsXaBQZK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5ACF3700065; Tue, 31 Mar 2026 06:12:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ABMmOHXEXk43
Date: Tue, 31 Mar 2026 12:11:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Chester Lin" <chester62515@gmail.com>,
 "Matthias Brugger" <mbrugger@suse.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@nxp.com>,
 "Larisa Grigore" <larisa.grigore@nxp.com>, "Lee Jones" <lee@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Aisheng Dong" <aisheng.dong@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Alberto Ruiz" <aruizrui@redhat.com>,
 "Christophe Lizzi" <clizzi@redhat.com>, devicetree@vger.kernel.org,
 "Enric Balletbo" <eballetb@redhat.com>,
 "Eric Chanudet" <echanude@redhat.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "NXP S32 Linux Team" <s32@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Rob Herring" <robh@kernel.org>
Message-Id: <e1c341d6-e60d-4200-a094-48667e8ccd5c@app.fastmail.com>
In-Reply-To: <4c46909d-641b-4389-bc4a-29394cb1d46d@oss.nxp.com>
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-2-khristineandreea.barbulescu@oss.nxp.com>
 <20260121021913.GA1704619-robh@kernel.org>
 <e956750b-0333-4465-b37e-5f460b5e092f@oss.nxp.com>
 <edc3a63a-8117-476f-9582-97ae31fefa96@kernel.org>
 <7d200097-51bc-4404-be8b-f536d0ecfc25@oss.nxp.com>
 <21531cdd-5ab9-493e-a722-61b98117e2c4@kernel.org>
 <22a5a072-847e-4cfd-8abd-e37163f73265@oss.nxp.com>
 <fe755e85-1558-4272-bdd4-af7a2038ab1f@kernel.org>
 <ba6140bf-237e-4099-af0c-ee404c1719cd@oss.nxp.com>
 <c7a59716-3d53-4787-b4ef-9674c2a4a9b5@kernel.org>
 <3c454da1-d949-4258-87ce-8b545000bf01@app.fastmail.com>
 <5f1b651b-1064-4280-a7e0-b7d66c396cde@oss.nxp.com>
 <f3ff461b-edd7-423a-ac99-e70145aaaaea@kernel.org>
 <4c46909d-641b-4389-bc4a-29394cb1d46d@oss.nxp.com>
Subject: Re: [PATCH v8 01/10] dt-bindings: mfd: add support for the NXP SIUL2 module
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_031223_402395_D688F64D 
X-CRM114-Status: GOOD (  13.08  )
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

On Tue, Mar 31, 2026, at 09:48, Khristine Andreea Barbulescu wrote:
> 
> With the current layout, the SIUL2 node itself now contains the two
> MMIO ranges directly, while the remaining child node is only the
> pinctrl/GPIO function.

The thread started by saying this is an MFD "It can export information
about the SoC, configure the pinmux&pinconf for pins and it is also
a GPIO controller with interrupt capability." Having a combined
pinctrl/gpio/irqchip driver is normal, but can you clarify what
you plan to do with the "information about the SoC" part?

Was this a "soc_device" driver, or something else? Have you
concluded now that this is not going to be needed at all?
In that case, I guess having a monolithic driver is
indeed simpler than an MFD.

What I wonder about then is whether the binding needs to be changed
at all. With the current nxp,s32g2-siul2-pinctrl.yaml binding
and pinctrl-s32g2.c implementation, you seem to have a monolithic
device already, though missing the gpio functionality. Rather
than completely replacing this, I assume the easiest way then
would be to add the PGPD registers into this device node, right?

It is still a bit weird to list the individual register areas
inside of the larger device here, but that still seems better
than an incompatible binding change.

    Arnd

