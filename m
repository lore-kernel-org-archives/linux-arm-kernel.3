Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2086C7113E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 05:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjawdPXDFiV/N1sdtbKoGhFLKfeJGmsGCgxqm8vyo8k=; b=CGFH8Xlk1pJwAgK8DHCUDnGDyp
	aIdkztmzNHJ0XeoXAf47bKZF3RODjOPkDjW/pD9jAk+tUZSx9bP2sWgpcmlvZ+XDnl7+PMNL4F90G
	+eyRPDQ5iwH7Z4+iarzvgw7vHLsDitZGXdcG67l3JVRUTpeD/HmZvZIfGQDshnHnXtyo1WofC9CVY
	nfHDYQez14zZcy1nbMxiiuj5FgDqkW28iYU9NVTMbBh8kFxjZXRBWq0dD7M5m/HFxfw1JTQooObks
	r/XCG4zFHBFYDm4PD0lnncoXrhVHkC9C2DJxTfLCOkb1EQ8DHZh/IEZ5DKP2xE+hkKqFdx/nxHIzK
	bS4vzMeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPalJ-0000000CFs6-3rhL;
	Thu, 12 Jun 2025 05:46:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPahS-0000000CF92-0TcT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 05:42:07 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.goehrs@pengutronix.de>)
	id 1uPah2-0000LG-81; Thu, 12 Jun 2025 07:41:40 +0200
Message-ID: <4562e9ad-50ea-4523-b619-8018ad71b8fa@pengutronix.de>
Date: Thu, 12 Jun 2025 07:41:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/28] iio: adc: ti-lmp92064: use = { } instead of
 memset()
To: David Lechner <dlechner@baylibre.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, kernel@pengutronix.de,
 Oleksij Rempel <o.rempel@pengutronix.de>, Roan van Dijk <roan@protonic.nl>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Mudit Sharma <muditsharma.info@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, =?UTF-8?Q?Ond=C5=99ej_Jir?=
 =?UTF-8?Q?man?= <megi@xff.cz>, Andreas Klinger <ak@it-klinger.de>,
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
 <20250611-iio-zero-init-stack-with-instead-of-memset-v1-10-ebb2d0a24302@baylibre.com>
Content-Language: en-US
From: =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-10-ebb2d0a24302@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.goehrs@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_224206_146091_A45346FF 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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



Am 12.06.25 um 00:39 schrieb David Lechner:
> Use { } instead of memset() to zero-initialize stack memory to simplify
> the code.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Leonard Göhrs <l.goehrs@pengutronix.de>

