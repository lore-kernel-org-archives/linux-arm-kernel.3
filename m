Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D6BC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mFQOhJl4uBa6VXsYhtAHOjHnTPxXkHRJOd9KvAYBeNo=; b=Z01/K5KK9wUHhAtb1phJ6qLGOH
	Y06kt9yF3iSufLJbDJjRBPuqzs2hwMeNk+cD9o2PDpDVybhzGf0dl/HBmVZVxqJ9VJeNyudmvFH8J
	NMhGFYqHC7WVK8Stexg7s4ljKIwbUKZRtPzEQpUnlLXktqbCz918H7U7czH0RTaZqMlSp5jdyG5Og
	yRo+bKaXd7aZqnyLL+RnVhJSkWSQ+/WCuq0922gQYKwT00YS9Xexp/oHyXfRyYr69vv38Q1Dpyxn1
	U2eywOLuSGh3inVZsJ6ZvmDkfOkfgy+Z2xeacZ0G3x/Ke2SFkbN5y35L2vwaB7rLfA3qAsx+u3Rz+
	dshWsN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5R5D-0000000DUab-2GXl;
	Thu, 17 Apr 2025 15:23:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QMi-0000000DLUV-2UyK;
	Thu, 17 Apr 2025 14:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mFQOhJl4uBa6VXsYhtAHOjHnTPxXkHRJOd9KvAYBeNo=; b=kRE6cfqr0/p7iCsbYHqsx6eXae
	97VCb3pSsGY8DXrFuqa5NugfprvqQ9t7fEVrTE9jkCx6/IMhzS4IOu8Et+9RxYzzIX69/V1iy0BId
	WWsqL9q2TnX8yHqbnzUT3HmkLRVtljf+fFSQhDp7UDTfJMrCbHwYs+32bAYwbZ6HzIU9DMyOF2ABU
	ZBAu3Kccpj7Z5/t/De7rTlkeUvvmpz7C0d/tXjwnrNRiUow2EhPKtimCovAfjtG4Z/34y6Q3m7KoL
	/1+sZnGoOS+6uw/F5j1twSq/UajZ9ZdT3Q8AapzFzg55Y+PN0Gc4sJ5gGnLuU8fQrSwbzQOKwm1jX
	MwwCGtNw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5QMd-0000000AJSW-1azY;
	Thu, 17 Apr 2025 14:37:19 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 79C0F2023B;
	Thu, 17 Apr 2025 16:37:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5kFlxYkdvA7D; Thu, 17 Apr 2025 16:37:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744900626; bh=sYtHglBTVqXwt7DqWYSQlT7eDYzzYmQoAxAuuz6prkY=;
	h=From:To:Cc:Subject:Date;
	b=CtFTaMrS9Q+TSxO0qI73LNZSjfy2Si13/GMGsEFMoe+/mbx6pkaJ4d7SQW1fH/MiM
	 8eo6JtCxzDkmC7Yte3Imi8kjGbp0cE4ModoLDgaG2oCSKAyuaWnX6SP05y8mNHlvxn
	 dDQPBNp83KXEqMK3ETDBlmz9i3oEAQ4DAqcm6rhg8eBjfX20HYjYhoEs0zKezUgaOK
	 raFIThbYXrOOgl1zf/Ct5aMuNNm/1eG6JwtGJ6J3//yN0eKjp2sDvQXDRVxfoEQmZx
	 zKMcAbvX+41WNYubZCIIx+HHNoy8A9gb/G6Ugh8v5oIHn3d48QS2Sgv/tsFLxIKmzp
	 BmBrZEj1P1Ymw==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v4 0/5] Support SD/SDIO controllers on RK3528
Date: Thu, 17 Apr 2025 14:36:42 +0000
Message-ID: <20250417143647.43860-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_153715_642522_68186802 
X-CRM114-Status: GOOD (  10.30  )
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

RK3528 features two SDIO controllers and one SD/MMC controller. This
series adds essential support for their tuning clocks and brings the
SD/MMC one up on Radxa E20C board. Both HS and SDR104 mode are verified.

- Changed from v3
  - Drop applied binding patch of MMC controller
  - Rebase on top of linux-rockchip/for-next
  - Link to v3: https://lore.kernel.org/all/20250309055348.9299-1-ziyao@disroot.org/
- Changed from v2
  - Apply review tags
  - Rebase on top of linux-rockchip/for-next and drop applied patches
  - RK3528 devicetree
    - Fix accidentally dropped status property of saradc node
    - drop det and pwren pinctrls for SDIO{0,1} according to the
      reference design
    - Correct max-frequency for SDIO{0,1}
  - rk3528-radxa-e20c devicetree
    - Don't disable sdio for sdmmc as claimed in the hw design guide
  - Link to v2: https://lore.kernel.org/all/20250305194217.47052-1-ziyao@disroot.org/
- Changed from v1
  - Apply review tags
  - Rebase on top of linux-rockchip/for-next and saradc v2 series
  - rk3528 clock driver:
    - explicitly include minmax.h, replace MAX() with more robust max()
    - readability improvements
    - fix error checks: ERR_PTR(-ENODEV), instead of ERR_PTR(ENODEV), is
      returned when syscon_regmap_lookup_by_compatible() fails for missing
      such syscon
  - RK3528 devicetree
    - Add default pinctrl
    - Move the per-SoC property, rockchip,default-sample-phase, into the
      SoC devicetree
  - rk3528-radxa-e20c devicetree
    - Assign sdcard to mmc1
    - Add missing regulators
    - Apply no-sdio for the sdmmc controller
    - Sort nodes
  - Link to v1: https://lore.kernel.org/all/20250301104250.36295-1-ziyao@disroot.org/

Thanks for your time and review.

Yao Zi (5):
  dt-bindings: clock: Add GRF clock definition for RK3528
  clk: rockchip: Support MMC clocks in GRF region
  clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region
  arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
  arm64: dts: rockchip: Enable SD-card interface on Radxa E20C

 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 ++++++++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 69 +++++++++++++++++++
 drivers/clk/rockchip/clk-mmc-phase.c          | 24 +++++--
 drivers/clk/rockchip/clk-rk3528.c             | 61 ++++++++++++++--
 drivers/clk/rockchip/clk.c                    | 42 +++++++++++
 drivers/clk/rockchip/clk.h                    | 23 ++++++-
 .../dt-bindings/clock/rockchip,rk3528-cru.h   |  6 ++
 7 files changed, 244 insertions(+), 11 deletions(-)

-- 
2.49.0


