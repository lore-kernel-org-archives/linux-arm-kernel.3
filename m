Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F10C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sGnlcbGkTpVe+jRIfMZ3RjpXeqeQnWzdixj31SR4Fb0=; b=n1dXWozCB3F8FIoVMz+VNXP+QR
	d+hDX+GIPgXK8GcKfRH82h5LGxp3RXVwr8sKlOglNypdtaBHqc1IM3OCgsCUDUTqHsB5728BdbGLg
	kd5l1VCZ+4JpRJlhvLnKexeF/jw9dSIzT2zaWgQIJ+MI+9qPN5xkBNMq20PZ5zI6GxwOBc6C80EYE
	KXfuyDqj+9SN3cIi3Tv5t1Q8slHfPmqZz5ccC+ArJoMdDcxBvHdRjnD3t1cKTpVLtskerQyf0QCQD
	ig/RW4m1hseQ3gyF3uerOVAsldkvY4GNIAOwGn1prFZVrYxFvenRlBNBLGwylvZoh9qW9tDllc/Hm
	Cd2cWaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ube1K-00000004y9p-2Np1;
	Tue, 15 Jul 2025 11:40:26 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdnf-00000004w87-2cMD;
	Tue, 15 Jul 2025 11:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1752578709;
	bh=sGnlcbGkTpVe+jRIfMZ3RjpXeqeQnWzdixj31SR4Fb0=;
	h=From:To:Subject:Date:Message-Id;
	b=cZr0pnEsnrrQdtStSFitLLsSCOSVpubKxFHbR1bREp1qM9WZ6UuNUaZ0peSWkp2fk
	 7WsogcrvB60fao9coivk8ISkQwvzCKMrd3KtSFBGv/vC3n5l3Tn+tY/KIO1nEVIhqh
	 NmEAvgBWki2aUE1dMDFZrn3yG4aDL/X8Ty0efsr4=
X-QQ-mid: zesmtpsz3t1752578706tf14436e8
X-QQ-Originating-IP: uovcXhhJiGiAlXUvswW9NV/gOyyyF7ZPgZz7Ciqcoww=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 19:25:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10341645025017690004
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
	Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] Add Type-C DP support for RK3399 EVB IND board
Date: Tue, 15 Jul 2025 19:24:51 +0800
Message-Id: <20250715112456.101-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NAeO0+xU6W76d5kq9LLvslwjguL2xeraIg95JXLjdwWhVeBFgUPf0IXo
	dmGzjg25kOW5Xj5hwGL8hp4lykLLrCIGSmADpp9ViG98T9RLgGXNWp4TLGvbc+s2c2HTEqH
	kLw7ISNUKEekGBncpAiXOW7BRvu2q8OJhIGkUBmJZaQVDF/TLBaBZzzniN0oGzVBG+yYGtt
	BaV2g4WeXodkbKglVtg90shL1TLjlwrrQGAUpS5aqZJMdBMMMacgxdcELO1WS5kjRqNHW3w
	GaMoecx9CVN2RC0knnwdYCQ1Ls0xK1wCGGI8JgLKsq1511Ly2mvPa4/CHzhj+eQVOxJB+sZ
	HbOXqindKCKiqmhrxjdQ8v65ZogExjlBIMjH2Tg7+NVceFZWyeE6OwGhGRbL6eKisI70ptX
	PaYxyWjXsHNwYltjhybeNh9NYEqxrcP/pxgg7FbAM+Z24sJ7U729+7B/Rwzw9khCdyghKTN
	88KfFqL0afT+aDZpyQSYHWRHw1Gitd/QO74Kwpg1DEfb/x+0plWeRntozWbs6gn/7dcoHEO
	q7Wtn6r3w9FdjHewGmP2/oQpwuv56tPQOBH8HXc4KA5U9JNwigPTiu0V5JjVzOi30WUkYWk
	vOLubWuaShxTWrotbi8C2aBhclg4yvCkRovNxzmDWzP/f6B2OdD3W7EBCfGqZq7YraniRXU
	1OeKyw+VvL65qCgdS0Tcln56rcTjkseM+TiQYsLvXmNMk5RsSf4Tu5KoeiMLrly/XnUbqo+
	aF78WWpMPCMu3RByyF2GLneoZJWRa/fF8YBMyWjtVmKXf2n5z9QKirNmCjOyvrQWodD0klx
	ViMMq3vrhFaRQ563J6SCAUTHGQGTZryZmQeodRWyzofXhVGnCWddl6KW22doIaBKCWDBMja
	Uj2M4x2xoHk6YmPQhn3c2aTmzZL1Tmq7j9ZYfaqEuTkmUuX8zl+ps6zuHVzq4n2cnQiTKdH
	+Z72bX4wPg7AIMm9b4GTturAAr6MsDRf+6yOz2RlHsR4fOw==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_042620_167839_B454CAFB 
X-CRM114-Status: UNSURE (   8.82  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The RK3399 EVB IND board has a Type-C interface DisplayPort. It use
fusb302 chip as Type-C controller.

This series focuses on adding TCPM support for USBDP PHY and DP driver.
Before this, the USBDP PHY and DP controller of RK3399 sensed state
changes through extcon, and devices such as the RK3399 Gru-Chromebook
rely on them. This series should not break them.

Patch1 add missing "displayport" prop for USB connector binding.
Patch2 add new Type-C mode/orientation switch for RK3399 USBDP phy
binding.
Patch3 add TCPM support for RK3399 USBDP PHY.
Patch4 add TCPM support for CDN-DP.
Patch5 add Type-C DP support for RK3399 EVB IND board.

Chaoyi Chen (5):
  dt-bindings: connector: Add displayport connector for hotplug notify
  dt-bindings: phy: rockchip: rk3399-typec-phy: Support mode/orientation
    switch
  phy: rockchip: phy-rockchip-typec: Add support for Type-C TCPM
  drm/rockchip: cdn-dp: Add support for Type-C TCPM
  arm64: dts: rockchip: rk3399-evb-ind: Add support for DisplayPort

 .../bindings/connector/usb-connector.yaml     |   4 +
 .../phy/rockchip,rk3399-typec-phy.yaml        |  14 +
 .../boot/dts/rockchip/rk3399-evb-ind.dts      | 119 +++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  37 +-
 drivers/phy/rockchip/phy-rockchip-typec.c     | 335 +++++++++++++++++-
 5 files changed, 482 insertions(+), 27 deletions(-)

-- 
2.49.0



