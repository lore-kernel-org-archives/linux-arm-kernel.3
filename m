Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FC3CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 13:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DnHBZf9FwnOpjIKwf/TmkrH6aiNn+aT//tH7U9Z8tL0=; b=YbtgekABW8TnlLZiH/w7RPijbh
	DQSEORV67E+cwifSpvG57QW4J/57BC9A9+mzxVqCdZ23LvB0v+Kj78y2GvjYRrEXEx1U7ArQ8BSL7
	RLLYBV5LlLDbU03dgzwGd9AKCbbq2ytfN/d2PbrTqgoRI+oMifMfJxRFxXCOimqkSunTn2a3ZsCiW
	V6umsLDPX9JtCG7TuZnrt/kuXSs23dD6h7GHdWWGPJJFn8ddok+EptbRBQNqMIfSC2tYV6ysjjTtj
	vo8H9xX721QLvN61jUj7Mdw/HvkgzIPnzo+IA1eMBJYSDSPXVAy+z7q/Yqsn2y/iijJjy3h35jHsx
	BRD62FkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2eN-0000000BChv-44ML;
	Mon, 01 Jun 2026 13:25:51 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2eL-0000000BCh8-2Yzq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 13:25:51 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso3006160a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 06:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780320349; x=1780925149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DnHBZf9FwnOpjIKwf/TmkrH6aiNn+aT//tH7U9Z8tL0=;
        b=p4CvhBs32nHr4NRqquMMmrUKU0VK6t1BSTp/eo0QqQS1lKv5soQALxAh7KUSPBOn6m
         2d9QmYkfkxoc0OoDtmZiOrA2ov8oDqUkg8dCs0d2PGM8XBWBkiNtg2ZhdXRWCIew2RSn
         y2qaVfO77rQyfV0Sr6jiSxhTa6Is2fp5SXscIjh1dfMT4PwhKrfcMOfTPmLRDD/XtEp4
         pAQN7bdAPDBHGAUyBvb9ZF/QZ59EyuxlJHv6LaXPAAk5Fg69WpLbKwCoIBwHy1BKWIyE
         yjlg6UKn0+29YGl7/9IBnPrsK3yNKs+vvM9H1JVL3wLiZ/CI7x7KrZCCr8IPeLVeuolc
         Zuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320349; x=1780925149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnHBZf9FwnOpjIKwf/TmkrH6aiNn+aT//tH7U9Z8tL0=;
        b=ZXtp9hiclxBESYxUZSYgu56Jsquekthp+X0Rtkc4VNXqf8Pd/nIeAMUr2yMnzWVS3d
         7Ps7MzNzr3/U/qmi9kWDM6pJMtAfGODfZVSG6XeW/zMlXtnOsWu86aqJNsQtzlWEiMqE
         dtrpAZYhxvtqikGHcVfFF1QDlDv//ZukADWB8h+AMh6Nytgcoi2g/qk+VGLmIUDxHpaz
         KQ+8N1hOvfYmnYtzG01u6BZGGG/n8heKCyM9sc4kruzBAsYLGCBUa+DY74LreZhRkvKJ
         yZkMBdG3YgaZwFzqK9ZF0iPz7nZNj4Rnz88Kal28uw7XsQqkiSg2uhRTYPSsDsmR9sHo
         5eFw==
X-Forwarded-Encrypted: i=1; AFNElJ97yELmM2TQfWF1n10M76ZzgB3LUK35iBkUeghICpbBlbxZJwMcoo2dpWiCP+rHlFkcSe+kxOnizUppitRGCygO@lists.infradead.org
X-Gm-Message-State: AOJu0YzAl8hFzCerowk1NYofvG65ip/f0oWLRe17iCKeGm3ExclJS5Ym
	fLghqnIpxxXxcxtsxEF6Wq+SwgismnWfx7anA7ehRdnv6SybMK0BRccI
X-Gm-Gg: Acq92OG78ty6XP4iV3kWvCq6/UsOWOaqaPKP+SNr4yCCuX0mkciTKxZtewspBFb4OXG
	WE6jBPHHPsQ5GmoVFFkR6dm5PnTZBQVKG7XVN28IjQjhiP2HFQzClZhye0BxuKtaZBg9TTqKJl0
	36KeKaIcAg4QynRwgf0HHsu/GrxeEXVtgCh9ZgQ0jSj/ucF4HAW+XgR/UYxBl4rZqOwowJF5VN1
	IVA67mogLyLTV87DzkrUS5SLNSl8+wFFio22Ak3myqdw7TwNPtaI/8D+BVT/6FGw48F9O9JNWNA
	cAu0+K5tLKawJVdDH6kC0Qa2Dv+t1MV10aTxu3kCRY6k62e6Z40cchGGEIVsy2eZe1vfewIG/Ca
	x8MtKoiKMlBldSaoO7Jo3RJn0nsHXAyoZ4Tb2Qivm/C3fdeBKTYDV4g5MzdU11oaNi1Qv0yoHPj
	Y1Knu9w3KRJjDxmhSgw4il9LAwdC3sOacVogKokWlm
X-Received: by 2002:a17:90b:5704:b0:36a:f612:e6a3 with SMTP id 98e67ed59e1d1-36c501b8fb2mr11081482a91.17.1780320348705;
        Mon, 01 Jun 2026 06:25:48 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:9c6f:e28:3da8:7980])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bc02d0a22sm11444234a91.8.2026.06.01.06.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:25:46 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: rockchip: add Vicharak Axon board support
Date: Mon,  1 Jun 2026 18:55:27 +0530
Message-ID: <20260601132529.139172-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_062549_676726_C6A88C53 
X-CRM114-Status: GOOD (  11.17  )
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

This series adds initial device tree support for the Vicharak Axon
single-board computer, which is based on the Rockchip RK3588 SoC.

The Vicharak Axon is a feature-rich SBC targeting developer and embedded
use cases. It ships with:

  - Rockchip RK3588 (4x Cortex-A76 + 4x Cortex-A55)
  - RK806 PMIC providing all SoC power domains
  - eMMC 5.1 (on-board) and microSD slot
  - Gigabit Ethernet via RGMII (RTL8211F)
  - Dual HDMI 2.1 output and one HDMI 2.0 input (receiver)
  - PCIe 3.0 x4 and two PCIe 2.0 slots
  - SATA 3.0
  - SDIO Wi-Fi
  - USB 2.0 host ports (EHCI/OHCI)
  - NXP PCA9554 I/O expander for status LEDs
  - Haoyu HYM8563 RTC

Changes since v1:
- Renamed the dts file from rk3588-axon.dts to rk3588-vicharak-axon.dts
- Added binding patches for the board (rockchip.yaml) and vendor (vendor-prefixes.yaml)
- Renamed regulator nodes to the standard `regulator-name` pattern
- Removed `mem-supply` properties and phandles from cpu nodes (vendor-kernel specific)
- Fixed pcie20_avdd0v85 vin-supply mismatch
- Removed obsolete `regulator-compatible` property
- Removed invalid `regulator-init-microvolt` property
- Removed dangling `enable-active-high` properties from fixed regulators
- Cleaned up unneeded i2c3 / es8388 nodes
- Added missing `vpcie3v3-supply` properties to PCIe nodes

Hrushiraj Gandhi (2):
  arm64: dts: rockchip: add Vicharak Axon board
  dt-bindings: arm: rockchip: add Vicharak Axon board

 .../devicetree/bindings/arm/rockchip.yaml     |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../dts/rockchip/rk3588-vicharak-axon.dts     | 1038 +++++++++++++++++
 4 files changed, 1046 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts

-- 
2.47.3


