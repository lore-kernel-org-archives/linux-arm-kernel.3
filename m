Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C603DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=67zBKAFFwPEqpjYU6DUQenOYYuvrA+r8ErnMRmV64A0=; b=mlesiFwh/RbZ0Liiic8UlHWeNE
	N3Phntb3jury//uzgRLkEb/atJTAdVdEcHRs3J0GUByhE/M5JWnY3gwUkH/5/QXjp/m2yPAvUnt7e
	a4ncDpJClGvFRuocn1mV0vXPwwK14CEcKdYBv1UB8dcjsLpYCq+lGkNoeC1YV0SdNC4enN4PzD1ns
	pKQtAP/OIioUg2Tf3oj48eRhNGCmhQMU1XZrKiCue5VOxEl9WEsgYuyLBCfzhPDYYphcOrNEXssnx
	oXws65JO+XKWvF4Hu48LAwHXiBmwdP44ZnuTmRC1xfGtMM1iyY+atvQaotk9LNri6s6gyy4Wbbzjl
	V+n4k1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucege-0000000Bmby-1RwC;
	Fri, 18 Jul 2025 06:35:16 +0000
Received: from smtpbg154.qq.com ([15.184.224.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceZL-0000000Blk5-05DK;
	Fri, 18 Jul 2025 06:27:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1752819995;
	bh=67zBKAFFwPEqpjYU6DUQenOYYuvrA+r8ErnMRmV64A0=;
	h=From:To:Subject:Date:Message-Id;
	b=Zik/9s7G/mB+ZJRyzq0gd1LAQlJ/GxR3TNUCml4tWdsq6A62IAieqoMlUk9NWoZJ+
	 pDgrar2vx+ZqparqxSVspR0RJ2TvNY5XQzLdPleGKoBP/xk29oRLG0g3kY3DZknah9
	 bpXf75JTd9YKfCmtOSTVsh6gJZTEFhFMJg4NKEkc=
X-QQ-mid: zesmtpgz7t1752819986td7cbe615
X-QQ-Originating-IP: r5wfY5yuY9UU3ArV/GPId12LkrXTc5e4liuG9amroX4=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 18 Jul 2025 14:26:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13786534937215164042
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] Add Type-C DP support for RK3399 EVB IND board
Date: Fri, 18 Jul 2025 14:26:14 +0800
Message-Id: <20250718062619.99-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NUTz4BkILuKLFFWBZfchHmgro58ie0ge2FUjnEqsnEn6k8xumvUA+oxu
	cLEf2AWDN7drx7MYB8cZoI8G1ijNKOB2JlMqYdAP6SghkuMXZOYwkYYN8T3wxgGw6emUMz4
	lMEoxVv7/JMKMZYUjVx+0UxiF83gappP97FT8Ia05D3tZxO450fWSVtXWZ2ratMcX9dMw1M
	5bhOu21a9BHsDGYM7ZY24ImAXwXGGn7qvlDWZ9mhFOgY5j3BJReWMi1NvVsC2+MLAeSxdZb
	EDfWv+Gv/6Cs8KiYAOFakeSk6R/x8FJhae3hKR+2J/YZokO6pWwnrNsTTE59BWHUsJuDuU3
	bZ9Lak/Pn38LDLYRBsxhTrGDNqp5QgpY5D9UzC5/FMsIx+mTyxlbhNtc5IOfCkdHaQEFI8X
	vL7Y6HHpJ05esfa3+M6onQ+5h5LDP/ovpcX8YFtM423SpWKplrTccGFvFu45U4b++N1ojuj
	I9yMMJK66Nn/ciE1doHKyEAafX2C9B7STCZKk+JOeIk0JnCWQ3ViGKrpjyZYVLfQaqmqXaq
	iNS1ExixC08cR2Fu5aKK4rdHFQF0PuOSDdQfUYEAT4XlOAYI8OZIJYILuBCbh3X4KwbxfKm
	T/QWjNtsnaa+e3mZQioekywdKNVgSrRVcj2un+RIAcK5PYOHTfi6qex3C8mesCsmjia8d/I
	V6rLlw1nZSJypZPFEz6ekVYZ8sjJcncws+niVsT5IvyOxdez1ne0c6XyQ+SGdDWmqA9dBaA
	3FYn6amxwafgeSkLx+BNHJs0NTeJ8Nsl95ZLkIpKCmkKdFRb8eNVa2WCkwZR+EpPudkmgdX
	urgZONMjuyPqdj3FtcCb0y+zgO8pTbDKEKwd8pe5CeU5Z/VOYKc4TfVJIO/MkzjEMnXHJrB
	ZkN0CeVLWu5Kngfzbo0p2e2mhhGrzf63a3Ca8sWT91Q7uCx7pySunEPmE3vlgy7SFDHr29h
	a3L6Kz95X9ntNqHNj5G73g1qh4FVUf9jEsc4AZlmjaZd7WNROxoSHQy8x
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_232743_698361_37280AEE 
X-CRM114-Status: GOOD (  13.67  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
the CDN-DP can be switched to output to one of the PHYs. For USB
Type-C interfaces, an external chip assists the PHY in handling
altmode switching and orientation switching.

Their connection diagram is shown below:

external Type-C Chip0 ---> USB/DP PHY0 ---+
                                          | <----> CDN-DP controller
external Type-C Chip1 ---> USB/DP PHY1 ---+

The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
fusb302 chip as Type-C controller. The connection diagram is shown below:

fusb302 chip ---> USB/DP PHY0 <----> CDN-DP controller

This series focuses on adding TCPM support for USBDP PHY and DP driver.
Before this, the USBDP PHY and DP controller of RK3399 sensed state
changes through extcon, and devices such as the RK3399 Gru-Chromebook
rely on them. This series should not break them.

BTW, one of the important things to do is to implement extcon-like
notifications. I found include/drm/bridge/aux-bridge.h , but if the
aux-bridge is used, the bridge chain would look like this:

PHY0 aux-bridge ---+
                   | ----> CDN-DP bridge
PHY1 aux-bridge ---+

Oh, CDN-DP bridge has two previous aux-bridge!

Now, I try to use drm_connector_oob_hotplug_event() to notify HPD
state between PHY and CDN-DP controller.

Patch1 add new Type-C mode switch for RK3399 USBDP phy binding.
Patch2 add typec_mux and typec_switch for RK3399 USBDP PHY.
Patch3 drops CDN-DP's extcon dependency when Type-C is present.
Patch4 add missing dp_out port for RK3399 CDN-DP.
Patch5 add Type-C DP support for RK3399 EVB IND board.

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250715112456.101-1-kernel@airkyi.com/
- Reuse dp-port/usb3-port in rk3399-typec-phy binding.
- Fix compile error when CONFIG_TYPEC is not enabled.
- Notify DP HPD state by USB/DP PHY.
- Ignore duplicate HPD events.
- Add endpoint to link DP PHY and DP controller.
- Fix devicetree coding style.

Chaoyi Chen (5):
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode-switch
  phy: rockchip: phy-rockchip-typec: Add typec_mux/typec_switch support
  drm/rockchip: cdn-dp: Support handle lane info and HPD without extcon
  arm64: dts: rockchip: Add missing dp_out port for RK3399 CDN-DP
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

 .../phy/rockchip,rk3399-typec-phy.yaml        |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  12 +-
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 133 ++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  37 +-
 drivers/phy/rockchip/phy-rockchip-typec.c     | 403 +++++++++++++++++-
 5 files changed, 564 insertions(+), 25 deletions(-)

-- 
2.49.0



