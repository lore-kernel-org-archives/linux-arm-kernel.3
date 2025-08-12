Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485B0C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iQpTDZH7lXr4FoO7KJPIkTJ/j35kWz/ImE22PyEPmP8=; b=1bgd4aALz+hDVYbxxKI6hM3aTo
	72SD3p+442FC7K8ndw3czdTORiT+UNAy7qNTkRU4lRcrzDS2Xj7i16pflcGrfMCNyzzu6rvZYRT6d
	/th8MFbKXvssZDB5oJugVSoNyx5Gja6eKZN5L+i9pWGCsh4/1knVDwC516/LutQrRa5nhKZvIUQF6
	wlb8eIsYoTxXHOc1INUaAdsNg0m2sj/4EnXn6c4sCgJAKTYRPXxQM0VL7oXveiMWncrowyIHcxru9
	TyhtGqC3Xk4QExW7cChp1PNyt6ZjxWcgXRgj8fD6lp1KkV+/n48ncCfBf8y6YXkp9gbiBDxjGnq9D
	lOiLGr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloG0-0000000Ajct-0kWn;
	Tue, 12 Aug 2025 12:37:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkQi-0000000AFXv-1N4t;
	Tue, 12 Aug 2025 08:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=iQpTDZH7lXr4FoO7KJPIkTJ/j35kWz/ImE22PyEPmP8=; b=KeB6nkkxVQZcgot7no6Ky4uaBg
	9fqcPV0af4CxhF5cseNcv1gzT3uMp/XF3D2hkwKqpZtwIMkgyc6DE0S5oRhWrpkxswYDQf/3qLSrG
	GIn6REpbTezPkUdE9niV3T3rjQO8NZWnBXePAnjfurX48QacpszCt+9pyvln+FYvtW8513lEFKEzR
	fqhPdjyVoZOrlxi+qL0AWefVTaT37vKfcabQ8+KsJ1esDakSAarOoI9qeVoPOFEoPCArZ3cojpdhq
	nN9A89qt80+ZoZsHyBpiCZyv3d/vG0hN9EMgoohtfykIEfgQeX24nYQqPVT/fKMIuRk7HrJbCeJhO
	5cGqrhqg==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulkQc-0001tw-Hq; Tue, 12 Aug 2025 10:32:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	quentin.schulz@cherry.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	damon.ding@rock-chips.com
Subject: [PATCH v3 0/2] Add RK3588 Tiger DisplayPort carrier
Date: Tue, 12 Aug 2025 10:32:15 +0200
Message-ID: <20250812083217.1064185-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013224_377886_867CC5E8 
X-CRM114-Status: GOOD (  13.44  )
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

A board that allows easy testing of the Analogix eDP controller on the
RK3588. Requires Damon's recent work on allowing bridges in the
Rockchip variant of the controller driver [0].

Concerning displays, my current setup is

  DP-carrier -> DP-port -> DP-to-eDP converter from Aliexpress -> eDP panel

which produces a nice 1080p image, but it seems Quentin's experience was
not as nice, as he reported in v2 [1] that his two test monitors produced
dfferent tints, but not real output with:

green tint on a Iiyama ProLite XU2294HSU and purple tint on a Dell P2319H


changes in v3:
- rebase on top of 6.17-rc1
- still should wait on the analogix bridge support

changes in v2:
- collect Ack/Review for binding
- address Quentin's comments
  - sorting in Makefile and dp-connector properties
  - ethernet alias
  - drop data-lanes comment

[0] https://lore.kernel.org/dri-devel/20250709070139.3130635-1-damon.ding@rock-chips.com/
[0] https://lore.kernel.org/linux-rockchip/0582b7bc-e5b2-4b5e-821e-8d2c4301579f@cherry.de
Heiko Stuebner (2):
  dt-bindings: arm: rockchip: add RK3588 DP carrier from Theobroma
    Systems
  arm64: dts: rockchip: add RK3588 DP carrier from Theobroma Systems

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rk3588-tiger-displayport-carrier.dts      | 109 ++++++++++++++++++
 3 files changed, 114 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts

-- 
2.47.2


