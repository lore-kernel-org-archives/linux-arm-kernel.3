Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03AAC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9+wKzPa6JcporMdRfFhDFtBgO7SIKlB0UBH49rnfV0=; b=taVb5clxpD8pdZEidggL/0+7wU
	KdSjFo9izxE/pOkbxpGJq/GWz1eIYR+vH471AI/uFyDRL0CZ+jL91Qv6kVLmzsuCd/kUknbzsCefe
	HHuDEy2gQmPer7kccao74NZiZMCbmwj4XH0L6amVmjdggXK6uDAjhd5ZwUhTrLoxXstRW4Uvqty4o
	EGuReyetAwQlSJg49BMCW0mSv1e9oB6xyKKDO9rl23X9sfs1pcIhJYTLE3iIEUhTNkuVMd+l60SI2
	PnrUVB/AbBijROJ9LoLvZbTDjFBnSyWeedZ+/Y/r0QIkECGsVQQJ20uWL1Ub5iySH/Z6K4qzXHRk0
	/iP79qSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hcv-0000000BgkR-1C0O;
	Wed, 09 Sep 2026 12:42:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Hcs-0000000Bgji-19Mc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 12:42:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6425D1A1A7B;
	Wed,  9 Sep 2026 12:42:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D9A160448;
	Wed,  9 Sep 2026 12:42:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B80311C7AF5C;
	Wed,  9 Sep 2026 14:41:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788957721; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=h9+wKzPa6JcporMdRfFhDFtBgO7SIKlB0UBH49rnfV0=;
	b=fQo5xu37RTwShDHIC2oOZlp+NwSKioDt2qv5+gAB1pv8i9p+xJQbpBXEwU+2wNL2W4bc8r
	5cdb/8tcsinfXdAF55wQjGfmArjpUrnYw4Dwco2XE/SlnHXnjcm/SZpd+T85a2MnDnA5cj
	I3SHBVAWhlYv2l8rgrX5gjNqlPBVFcZZmIn2oh7yHqY859T6YrMyKFUUAhgpuCNlxyhc10
	OiAeT05poKOLR0VWpwX3AYkmSmv6vensv1/nsp8wCJD7M129KP1VZIPp7XUsgL1XhmBn6B
	5oUZeTpanwQJifomjKg1GJWn4SAVptG5WZkcER8lGg69/mFX7Lp5cN8lxf3sWg==
Date: Wed, 9 Sep 2026 14:41:53 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 12/13] ARM: at91: remove samv7 support
Message-ID: <202609091241532edd8277@mail.local>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-13-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-13-arnd@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_054206_451702_4EB5A4F0 
X-CRM114-Status: GOOD (  10.52  )
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

On 08/09/2026 17:28:02+0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Atmel at91 line, now known as Microchip SAM contains both
> SoCs using ARM926 and Cortex-A CPUs as well as a number of
> microcontrollers. Only a single one of those MCUs currently
> has Linux support, and has no known users.
> 
> The samv7 platform was deprecated in Linux-7.3LTS, which will
> remain supported a while longer after it is gone from mainline.
> 
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

