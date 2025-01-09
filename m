Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEB9E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 20:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufquL8MTaCaDartUz08Jv9Co5w4deNYxwsOj/E8fcww=; b=P7ozf7FUVROIoyWSIlOQJdqfYY
	yG3fK7ZXjx7X+uafj+jAFNGTEPCALOPd7ee4iTxpLq9zXOTammpQWm7BSSU+R6lroayf3t6bYc7WP
	iMtr6BrsBazh50oTMehouViJnvWVf1U+crobuzGimXbLsTQr3/es8kiePqKCn8u8IHaPgBsLdyY3L
	jp/UXOCGCoALSif8+F/OQdjyv9xGaUsSmek5NVJvFPnVghuoJEuvcsqve5jeBdYp8J2DZaFLBeWi1
	/lJrIAuCUiUCM/Ybg8vjd0cZLQCiw3W7WCvD6pPCFr9fIa0c99meFniu0RCs7uTWswpdDKdKX1W+0
	2FuV2fxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVylY-0000000DBfP-2tqD;
	Thu, 09 Jan 2025 20:04:28 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVykL-0000000DBWS-0QXh;
	Thu, 09 Jan 2025 20:03:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81E65FF802;
	Thu,  9 Jan 2025 20:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736452988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ufquL8MTaCaDartUz08Jv9Co5w4deNYxwsOj/E8fcww=;
	b=aqnMgi8dmXNmdqbb82gZLgfSEWXhFqHsrY4xDCQkXxC1eVbQ/WCgrOzndGV9myrqe/hElG
	jef5H3/ls9gbinUu25fBKeiz2GZiCFulJ+4WhYBhfC45VCcq4EfPtR0KIHfjbcek+Q1VfV
	9wBuydXTJ3vjy+3TBFcHwgj4253G33JMK1TEdzYz0Ww2Ja4TgQmwoyNJWYJWfnKuos+WPd
	cU46FTlgkwEX3NlsLIdW4FYBG1lIgDNygresvTuecEYNDGFWiC7SET7ShqD2glnBctwGq+
	pVYOLHmLiyMp2+38SZucpgCpNOe0nHGnaKhJZh2gFh8WYrNUDI6LJ28dYOimqg==
Date: Thu, 9 Jan 2025 21:03:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] rtc: use boolean values with device_init_wakeup()
Message-ID: <173644377117.1019413.12980385173648327961.b4-ty@bootlin.com>
References: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217071331.3607-2-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_120313_294918_E2E83611 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Guenter Roeck <groeck@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, Yiting Deng <yiting.deng@amlogic.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Michal Simek <michal.simek@amd.com>, Vincent Shih <vincent.sunplus@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, Eddie Huang <eddie.huang@mediatek.com>, Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Support Opensource <support.opensource@diasemi.com>, patches@opensource.cirrus.com, linux-renesas-soc@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 17 Dec 2024 08:13:26 +0100, Wolfram Sang wrote:
> device_init_wakeup() second argument is a bool type. Use proper boolean
> values when calling it to match the type and to produce unambiguous code
> which is easier to understand.
> 
> 

Applied, thanks!

[1/1] rtc: use boolean values with device_init_wakeup()
      https://git.kernel.org/abelloni/c/8c28c4993f11

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

