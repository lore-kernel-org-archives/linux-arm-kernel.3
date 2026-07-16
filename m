Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F26DC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VduGeEK/qFaft2OOKUOT4RzcIQNeRjRTHS/R1AlN5rI=; b=iwfL8uH11ZjjfGbHhomngXF8B+
	6HLaBzwLYmAxpgMxGZbEPeYSoMK5+nvrn8Gbgx4HHFq36ypcBzCXZkI2PwNwHdzuUnshZcxorAyqP
	JTwyOWM1slIUKx0qrjBG1P6tSjgG7jpekzcK99+hna0hdvac6GsRnCMB5XUyrYx9vWZ0mITO+w4f6
	a7dlZJkrSD1pZkIzLbZGyrzRddd8Q4R8qIlQpWzPGMx4/b6xKCEXKQwQ5+D+m4lade1NT4fkLufFZ
	mr3dPwHD3tS8V2tsTcI5HS2xYKqIdM07H8tCkHxuqnzhY4GvAJqtfOwfBUXRZcbY1i7eFWqDATNiu
	BhQJwAfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMlj-0000000HR5S-3mBl;
	Thu, 16 Jul 2026 14:08:55 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMlY-0000000HQzb-0qth;
	Thu, 16 Jul 2026 14:08:46 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 25778EC00CA;
	Thu, 16 Jul 2026 04:17:17 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 16 Jul 2026 04:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1784189837; x=1785053837; bh=VduGeEK/qF
	aft2OOKUOT4RzcIQNeRjRTHS/R1AlN5rI=; b=jcyhQnG9ddQUmYYNeG2wF2wRVy
	Dt2ZtzswRXaxRV58/6CIPi3VqpgfDNpc1fPzHcdq8wUgreLN4gaDx+P1x7LQjhly
	p+Nw16qFtpr0xupP96z3dtCvb4STTxkILEjaonbIkbJkfOf8owJd5AWBtPXB0oHA
	CgCScv+EImYGu4NAQdqYAEVOi9/Xxr77jnJOX8Rtgt/Wh75oVSXC/N6ZamR27x28
	afMUf4cuv0cwGOvYHM8tu51KrEZBSkNion7Hcl3Qt529lJl4JYErTSfje/N5VdOL
	F5CKNKTd7sgDYnZ/CGi9ZHuK7B6G73AorFa6qMi6U4gUPWYgUytOnbW8JZLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784189837; x=1785053837; bh=VduGeEK/qFaft2OOKUOT4RzcIQNeRjRTHS/
	R1AlN5rI=; b=GmFHfucovb1RNOzmXX+VBol0gvEYfLSzL0iGCZU+QHYwO8Oe+n/
	zzwXOE1nvmZAABEC+XAsUvmmlIPKfOK8C26VUUbEF9FDdJ8xKI3jVIG+KZ5BLCtj
	zjia1M3HCKrLPBjGEjbD21OUr1MLqMMfJj5LpxyS+dnAv+QbbNvbXKL85kSp1pzJ
	aPOZlHYukXq7KdwZXVkDjBnqqwigriHSue6o4Bq3mF4ND1iqXMc3hBVSOgoAzR+T
	0ZWKxfVB7Zn967LCW+iAeJ6BDQD/DLKWxsJQTvRbo6hnt5r+EYew3PbUhVq0Cg6R
	k09xchv6W0bfwmHCkdcuVHiid4tO1K7H7tQ==
X-ME-Sender: <xms:jJNYavyUSYghX1ucZ0n8kEWPxmEuzD1e9hxIZhjDO0qCpyUt5x_P5Q>
    <xme:jJNYajTVNuSYbWjLpyu4QGipzf2mPZZG786ceMyB_qoAm30DQaMA8m41EbmswdMtQ
    5t-XGfkSbDivnUSKvSK3L4ccFgbzp35yIlaRh3gYIedJoTRVa9u9WHI>
X-ME-Received: <xmr:jJNYarjPmJUxHIFKIvcFWbl1SZC6-f9SwGvANdCgJy8XKq3G6sCreQWTmFIcQHkdsK6i82J7yP859Z7_bRk>
X-ME-Proxy-Cause: dmFkZTEemukn6/PC4OGkQhY/K9vtRGQ9rw9IyvIuSs90fo6Ub7Zakdx8lB13ggDWohhvBC
    XnrSNjFh99thlob31SAsk7R6gDBZyWYNngqFnZABR5MKACPFkI3sisr4Io3mPuzO+Ge5l+
    GZFpmgDRv5hYKmkOUz3MBY46FD+gBAQahbV7J0Sf6r42Fvrs4/k5jrErr0UOVQQi2UMlYQ
    WNFTrfexcEa0vsVX/riv/5lW2WltV7FRhwVlBXsTDp4aH3HB+kt0NZlBNgd8RmxkrL6YIt
    32M0tHpdj/kBKX9k5yEEa7pp/N+d5XMlfzDTFv+i9Mad96P4SGqYt7CixwURYorcTDW8YL
    uEo9PgMtDSZFDPGd6fy1i2MXsDddwYIgFo5Zb7i11AQqSC5G3c0Hh/r3nsCnNPSCOBaVcO
    3e/93kEdFK+aKPDjUebbGkkonO/I6H6KBUjPM3dBX+6FoFInFLJO4+0HrnmUP/LCJJiFG3
    dwruRrfJsDVZD1mH3gCSkexKAB7u7RS3L7gi9utqgn89j/K6u3cnd0O4wJFn2nLhN2QJiF
    shKkahow7lvkOk9uLPJsQkqRWgrWGSR/R8NNm9JGufabHEvmu4ZFAP3DjaXtUJPLJ7Unwd
    wWlS10zS5vw51x793Ass+UV7RjfM4777tC+wPuWdsyS+B/mFLVGiDpdaP3iQ
X-ME-Proxy: <xmx:jJNYaqmhAz0_ot-M4JWoybkc0_SG4zXHzGK3929YgHMeNZ6aS7X3yA>
    <xmx:jJNYaut_s1qgJmtXX8BjIFvpWwWBJi-hRB_qib0UHuPJa-xxmsMpuQ>
    <xmx:jJNYaoZOi6dNRSU6z4Ys9Qc7VrkQ4JunyPKkuCE6w1TaBOhvZ0AtEA>
    <xmx:jJNYauAC5Zfp2nrQij36kxccIOFx0TjNGp9410zn-XXBcBKQbn3vyw>
    <xmx:jJNYahfZOr6hEjTRqIx9cePCrnYD-gEaWSEWlpG-WHRwlBkHSh87__gx>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 04:17:13 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v3 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 20:17:09 +1200
Message-ID: <20260716081711.2482259-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_070844_487537_26F62200 
X-CRM114-Status: GOOD (  14.61  )
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

Add mainline support for the ArmSoM CM5, an RK3576 compute module, and
its CM5-IO carrier board.

Patch 1 adds the binding, patch 2 the module dtsi and the carrier dts.

The on-module YT8531 PHY has no crystal and needs the SoC 25 MHz
reference clock (clk_mac_refout). Ungating it for RGMII needs a small
dwmac-rk change sent separately to netdev [1]; the clock is optional so
this DTS applies without it.

Tested on a CM5-IO: the YT8531 is probed by the motorcomm driver and the
link comes up at 1000 Mbit/s; RK806, HYM8563, eMMC, microSD, the USB3
hub and the PCIe root complex all probe. dtbs_check is clean.

Changes in v3:
- Remove the ES8388 codec from the file header and the i2c0 block
  comment. The node was dropped in v2 but the comments still named it
  (sashiko-bot on v2).
- Use gpios instead of gpio in the vcc_3v3_pcie fixed regulator, to
  match the other regulators in the file.
- The other v2 review notes need no change: the always-on plus
  off-in-suspend state on vdd_cpu_lit_s0 and vdd_gpu_s0 matches every
  rk3576 board upstream, and the eMMC full-pwr-cycle-in-suspend with no
  vmmc-supply is the same pattern used across rk3576. dtbs_check stays
  clean.

Changes in v2:
- Type-C DP alt-mode: name the altmodes child "displayport" and make
  svid a /bits/ 16 value; drop the undocumented svid from &usbdp_phy and
  add the missing mode-switch.
- Move the FUSB302 role-switch endpoint into the connector's ports; the
  fusb302 binding does not allow a port on the device node. Rename the
  node to usb-typec@22.
- Drop the ES8388 node (disabled, wrong compatible) and the unreferenced
  gmac0_rst, bt_reg_on and wifi_host_wake_irq pinctrls.
- Rename the wifi-poweren-gpio pinctrl node, it collided with
  gpio-consumer.yaml.
- Describe the PHY reset at the MDIO bus level rather than with the
  deprecated snps,reset-gpios; a per-PHY reset-gpios is applied only
  after the ID scan, too late for a PHY that boots held in reset.

[1] net: stmmac: dwmac-rk: enable the reference clock for output mode

Jiaxing Hu (2):
  dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
  arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 397 ++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 564 ++++++++++++++++++
 4 files changed, 969 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

-- 
2.43.0


