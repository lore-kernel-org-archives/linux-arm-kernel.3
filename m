Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF721C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 18:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZvOWQHwZVwyJf6BVvOEiNtKPaJ2rgizuAGd5TEgutw=; b=IRl8yvGPax5MxrJNod3RaHfSz0
	Ui/y6E98GOLOqFs6XG7EuS4VI87H4dhM8c12riPgnliWxdwzEggoagRTo7xHPRnx54SQrh3Y+KG6A
	ck7wHkpDU8HQ9e1LudW7E7erddPZwIZazbGuDFH4+dO2ucK4CLFE8u6ym/BM1rLQPT+zWt1Tv+mka
	6hkAZJGhh+LA6krnDb+G67bmvUIrq667nSxHm5YWcnzhB+tJV2w3/3i/FJEyCLLzsBcMktLh2udqG
	yjFNV7+OhNOcBiOk3BLKHsKvEyKjyoORkgXSeKMffapxSK2vTJ4vVgv5ANkIC0tPAjf1be1tqzeoA
	O/GBuKyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD6CE-00000001Zdn-2HJz;
	Thu, 08 May 2025 18:42:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD61S-00000001Y3D-3EgC;
	Thu, 08 May 2025 18:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mZvOWQHwZVwyJf6BVvOEiNtKPaJ2rgizuAGd5TEgutw=; b=y7dGOpSaTguEXKJjJT2GCbwAz1
	RF10UCNO6oVUQkWcapDMzWaIp3xCxC/6ApPzPPXZEqtjTgK4hiShc0zDrHGbzYazGixvUr/xmxTV2
	YrksQtRrKsCRkzJruR+BOuwyuo6xkDyaUVU6cWXRyI3Ol36uv7V8YtaAoTMMRaZTmR46gL2Q/cl8i
	GkenBKWdoMfABDY3drgeAAZ6ubvfMRkA30bMqiEw59PKenfkzeZxVjhn1INTEyYUsBnORgsaQNQbm
	87A+Wxe5hj1BlWVZcWh1uhmAIGI7uebz385DD1vSWPXmXZIJ+yxg87ZGftezCdNm2Ll1UB0XJGK4g
	ApFqhayw==;
Received: from [61.8.144.177] (helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD61M-0000vi-RN; Thu, 08 May 2025 20:31:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v5 0/5] Support SD/SDIO controllers on RK3528
Date: Thu,  8 May 2025 20:30:47 +0200
Message-ID: <174672902826.1927548.11499970123396406769.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250506092206.46143-1-ziyao@disroot.org>
References: <20250506092206.46143-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_113106_805972_07432030 
X-CRM114-Status: GOOD (  17.83  )
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


On Tue, 06 May 2025 09:22:01 +0000, Yao Zi wrote:
> RK3528 features two SDIO controllers and one SD/MMC controller. This
> series adds essential support for their tuning clocks and brings the
> SD/MMC one up on Radxa E20C board. Both HS and SDR104 mode are verified.
> 
> - Changed from v4
>   - rk3528 clock driver
>     - Switch to auxiliary GRF
>     - drop rockchip_clk_register_grf_branches
>     - Rename branch_mmc_grf to branch_grf_mmc to make style consistent
>       (with branch_grf_gate)
>   - Link to v4: https://lore.kernel.org/all/20250417143647.43860-1-ziyao@disroot.org/
> - Changed from v3
>   - Drop applied binding patch of MMC controller
>   - Rebase on top of linux-rockchip/for-next
>   - Link to v3: https://lore.kernel.org/all/20250309055348.9299-1-ziyao@disroot.org/
> - Changed from v2
>   - Apply review tags
>   - Rebase on top of linux-rockchip/for-next and drop applied patches
>   - RK3528 devicetree
>     - Fix accidentally dropped status property of saradc node
>     - drop det and pwren pinctrls for SDIO{0,1} according to the
>       reference design
>     - Correct max-frequency for SDIO{0,1}
>   - rk3528-radxa-e20c devicetree
>     - Don't disable sdio for sdmmc as claimed in the hw design guide
>   - Link to v2: https://lore.kernel.org/all/20250305194217.47052-1-ziyao@disroot.org/
> - Changed from v1
>   - Apply review tags
>   - Rebase on top of linux-rockchip/for-next and saradc v2 series
>   - rk3528 clock driver:
>     - explicitly include minmax.h, replace MAX() with more robust max()
>     - readability improvements
>     - fix error checks: ERR_PTR(-ENODEV), instead of ERR_PTR(ENODEV), is
>       returned when syscon_regmap_lookup_by_compatible() fails for missing
>       such syscon
>   - RK3528 devicetree
>     - Add default pinctrl
>     - Move the per-SoC property, rockchip,default-sample-phase, into the
>       SoC devicetree
>   - rk3528-radxa-e20c devicetree
>     - Assign sdcard to mmc1
>     - Add missing regulators
>     - Apply no-sdio for the sdmmc controller
>     - Sort nodes
>   - Link to v1: https://lore.kernel.org/all/20250301104250.36295-1-ziyao@disroot.org/
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: clock: Add GRF clock definition for RK3528
      commit: 8a023e86f3d999007f2687952afe78ef34a6aa91
[2/5] clk: rockchip: Support MMC clocks in GRF region
      commit: 621ba4d9f6db560a7406fd732af1b495ff5aa103
[3/5] clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region
      commit: 306d2f5ddaa765f04ffb54fc9437a6318f904b53

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

