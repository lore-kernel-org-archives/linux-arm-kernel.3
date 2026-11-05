Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B355B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YjsXMwGk;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=HP/f7wwz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TugPtM8jOK84jPf/Xqe5A1M/W5MRVkYlZUyQ33BYgdI=; b=YjsXMwGkloVpYvoM2TVWmETXCq
	tEBAXdPwaN5DooxcdpAWtgOJbByDG42QJgDCcm55xV1ce2QoXaAocdFMOuq0HxtBUBSh8Ob6aTipx
	uVHxedyu4TN85gnL1FQZGcTlT1wHr4km6L56TTjn9hlaZQ5fwttQnnYaovfCJbJdbz5E2KTR8PKxS
	UBvrGz9OwseehJTLBXp4iBLDrcSPWE7I4vU1P+fyPWlXtxWopRvWHOWuQtPFlftjb9pdGLJ5HYNKU
	rm1A5gOYV3KEomRVBvfbtiaVVIgdjNXQ96aN45OxOJk1DhL9DqWl1Cvfm7QsnV9UuhGCqvU9tNj+u
	J5ThEUvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsfs-000000087Wn-1BwV;
	Thu, 05 Nov 2026 08:18:21 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsfZ-000000087Ne-26kW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 08:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TugP
	tM8jOK84jPf/Xqe5A1M/W5MRVkYlZUyQ33BYgdI=; b=HP/f7wwzeKak7DumDLO9
	JVt1nbyuIbwEvmWLzblXwUa9fHA8QGq/qxdkiPvBnBdfWzA7DAKYuMswXIwiGZeI
	sifdTdpHrbkKn2cfjYz+DCejquVIc2HcrJkCdWGnfn8w8sRDZ67QMqoOAo9TyxhB
	2IGsFIsOlY5lsG4S5en4FiChy1bAl3F+ottavwgE+82fwoOAPf5WA+FMOpT3R+BF
	2KLvEAZIieAkmGBbXuYWFATGrKMGTrlv0ozHqnmpmuhSBEaBniPtSpneDXSHcEQ5
	+WhVic7v8nyGM71Z5AdhJHNCzaKZIUIrLqqcAbo4a+eEyXeofMd09ZE2E48Fpmp2
	wQ==
Received: (qmail 1062996 invoked from network); 5 Nov 2026 09:17:54 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 09:17:54 +0100
X-UD-Smtp-Session: l3s3148p1@cWDgIYNfIIHAwtcC
Date: Thu, 5 Nov 2026 10:17:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Vignesh R <vigneshr@ti.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: Convert to subsys_platform_driver()
Message-ID: <auw7sUcbOOG8umVu@shikoro>
References: <20261104113316.1634141-1-peng.fan@oss.nxp.com>
 <93534aaf-00f3-45f4-982e-7fd44ab3799c@kernel.org>
 <auuXnndiQOkEaOsj@ashevche-desk.local>
 <c6664dd8-871e-4b38-8017-d4c1a02fd36e@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6664dd8-871e-4b38-8017-d4c1a02fd36e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_001803_438401_B103FB7E 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> I'll send v2 of my patch for submitting patches mentioning this syntax.

Please CC me because I would like to ack it (or review? ;))


