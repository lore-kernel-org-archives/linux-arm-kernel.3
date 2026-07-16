Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563EAC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F+tW2ndMU5DRPy5DazRWgny4gJkDTfDW7JUkLAAbhzI=; b=SR/gKVwLerqxVhPSHSnNsZMK3r
	xcxgSPH8ln1oNT704/lcGkkOYM3BSfpVa24gnrodYBDmSBUj+nDnybyCD6AiiCMMTNmPpeXS0B1xT
	AEgDh46uFx96Ksw49SDPxI9PG5OCcKOiKnvx+7x+Ej9dND8sVhGBr/BeIYerrjVIFxFeLPTMYUFGf
	dV5WvUZhUAolfbyHDrKM6mgowXiqjkhA7vTw52i81Sh/o8fN8Dw4Oj5DkmSWOeACHaSY5MYUUjngD
	ezTf0R8XR2VoYoB4DIUYT2Nc2J7z/Ozo1xafDFgsaSsM8jdz6FXlvOtrRaWfJJ2CjAugzijXfWStK
	vdEBMcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMla-0000000HR18-1jLZ;
	Thu, 16 Jul 2026 14:08:46 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkMlY-0000000HQzd-0bSm;
	Thu, 16 Jul 2026 14:08:45 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 680C4EC019C;
	Thu, 16 Jul 2026 05:51:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 16 Jul 2026 05:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1784195467; x=1785059467; bh=F+tW2ndMU5
	DRPy5DazRWgny4gJkDTfDW7JUkLAAbhzI=; b=x7Zlrs/do96LS4cLSvz821tuW/
	ZBeTyhJnPrullKcOJM0zTnSJWE3OWs9takCPcHfMGwtcEN6ey4VML76pbnszX6Le
	6vCk7VzJzC/VOrNAcvQLbkqzUWHJ4lUu7Xoq99Wt3oozVMmJAAVXUiQR1PCdPguN
	RIkWarFlsipgSriyTpR/ZzHcP7RSUQNSEa76qhGGHKtqlmoWWF3uWjCznDTuZDYf
	8DNxJ68xaNEpYbJtoFEm72UPJ5vQrcBg2dfuzAJzUi6q/QxM+cGeDpgDDF740SP9
	ntjQHUJsVqbNbl9+jvgMzsRMyx8njqOLjAoOFYYBSFaZlkV2jOGWYrNTXcbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784195467; x=1785059467; bh=F+tW2ndMU5DRPy5DazRWgny4gJkDTfDW7JU
	kLAAbhzI=; b=io0DZeIsdt4rvy4atPFYMZKpRfJWcXbQ6FoML9nUoJFMq9P80eG
	uCXsZaJKzsWMstwORf94Yt1xGOtMmbdzXuSVgP304HqSDcrpR5TP9l1Yb+cMW/A2
	NbW7Zw6aYTI2LFYHHEESZL8qSdq6KGEK+JObA+lRGHTBE0UZ79Ld6S8YaoXxpJ1M
	5FozYhiV68rnRADPzHNbDAZYx6hSzE3p+0o6DkUoOoqCL2x9JyuIjnYV3Z1u1xPx
	H8qMULeiMcBWPmumjJ1bPa802+tXT2r1JbU2mCfIOCDSD5a7zUt1e+z1vfHTPV2p
	K0UjfJbCGUaRgU2v48lwzmHidQppbRYD5hw==
X-ME-Sender: <xms:iqlYarjkF16nqEtPt7Z4tDNmsv03S10s-_z0z1Wwbd9F-fNYG6oZvA>
    <xme:iqlYajvr72Th9kDA0Z_F_8m6fstzCI9DG1IvFzm7jYR-Cxhh4dmojaORb4aMY5rdX
    4MW6panZgtzdYMIXvdqCHXwzb0vD2mYimgP0dL3QMWcPsYUJ1vsf-U>
X-ME-Received: <xmr:iqlYangrV7ylcn3WZJ0bsmQHFYNo7WWOZ6NDItaDYLhrkpTnlk4_B2SlonHTUkRfAOYMNgFv5UqfxtK_ixc>
X-ME-Proxy-Cause: dmFkZTEprbmmi/VnjSGn8v756j53UYBAUHLnE+fClBXqjTH9wnE3qC5kJuRhMqU8OnfiTK
    pH39h7WuYgsjmZsB15MnneJ10NOjCAMQttfrIGKj1JvUJtfQyghZj7SV7TUaZuhG/9eqJW
    TmTECvy5H8buG3dTy8a5OxrJTT/w4m+LRz6MIxHKnJ9FM305nnYQyxJRpvk9RnFNdqS4N3
    KlU7dtOhheT+mvUtEnoAg9eGnbZwk8UfCOQjvadOR6438qtPNCtuVYJJkoRzJ8MB5Od98l
    PHM+acvMpTY+EyFgAU/1okSdWXRBChiVZsp5+CcRwwxhhJLP+4g8dby++BXYqnVQdMYdX0
    KzmeQBDd4Yh3iA8sNB0ZuoyGH0dDWxZxLTOybR/FldGCAbPJstNDPwpTtEEchhTSR2Azjr
    n3SpA6a9muBAbg2wDEAk+fdadw/9W1qWIY/sfBryN0ZJmedKnBp2zGiZuvrvxxz82cu6WR
    zKq9xfqXf3vMX6XZqC4T9IedKRSkUqRUL+M9BehfvwvUdc5MTccEsqduWfFnBKkXHOHyI/
    W929yRVnG9A4ml0FDfPZksUx+F8w+QMbp41JEtov04n4I1g3yEVNy5MYYiHtEFcuInmmIz
    bIvwqh4AgoTSdEltYdo5R8tdIKCD5D//wDK5FmHg/QRLSrX/PN1xRTr5aHIw
X-ME-Proxy: <xmx:iqlYahYq6QDMv9vBwW9rE4b1WPH5ASCWMU1inDJz_h8mTC4yaI2DbQ>
    <xmx:iqlYauYmYZgepdQPFHf2mZxLYIUU4udJnnGIFdvkin23w5DnfUun_w>
    <xmx:iqlYauycGA58Ommh77oeiI6eWqP1mAwcM_Ef-maCA0RcWP3v1k1m3g>
    <xmx:iqlYaifpeDEFNmIYDrTS-7X88hAzItcvHY0SnrekWtWC4bA5Xl4l4g>
    <xmx:i6lYamaZaqDNQ31rD1HzhXrNJCpN-oMQdyaLRnjDtIrKtHxY1scM6k_T>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 05:51:04 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [PATCH v3 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Thu, 16 Jul 2026 21:50:59 +1200
Message-ID: <20260716095101.2498464-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_070844_485581_ECA16F9E 
X-CRM114-Status: GOOD (  15.14  )
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
- Pick up Krzysztof's Acked-by on patch 1.
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


