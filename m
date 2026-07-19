Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E78C44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 03:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xyQHwIFVut+lm+nAdAghnesFek2vNce0l66GTprhkyM=; b=LAIBDf3ToV4xauLPpiCwKrA5z6
	LY4VkQzOqpod0CrAy/zzvEEd0dkKayv1qQa9kN+HhNs3oWuzEIcsL4LZDTz5iLCeVASBmCUYUFvWO
	TpNpM9Z/Fwg8nBACRGMy6ZSR4Ui4hVjTdflEA5cO+YbvJPqyHexNCJyXcZoftqMUPY89d7WyANLRh
	gbQOYLY9FcWXOhqLb/f4lWVKMlgqTdzymf46+oskdGvM8XzC9PtJ5qvwFyNKW40QZiU6tCcWMlrFF
	jOWuC2abB7LDUwdyKEQhelqALXzkpeZsRG5O+VMwnhDXe1EzkCHRECUcIhpQ0iRKKF3JUoRuiv2iN
	W09vq89g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlITr-00000004iml-31Xp;
	Sun, 19 Jul 2026 03:46:19 +0000
Received: from flow-b1-smtp.messagingengine.com ([202.12.124.136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlITq-00000004imN-0SJR;
	Sun, 19 Jul 2026 03:46:19 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 470F0130009F;
	Sat, 18 Jul 2026 23:46:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 18 Jul 2026 23:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1784432777; x=1784436377; bh=xyQHwIFVut
	+lm+nAdAghnesFek2vNce0l66GTprhkyM=; b=WS7p1HPQvIE8IUx2j3llGAgT0I
	jfLu4d3+UBRHYilPX2awFqvTnBfKNZKpC3IoYiRSjbI/TpJjUchMZGogkYS01pP1
	TmkjMfvnTl8GLIlR/3J13TFYWc/5AZ24uGWSkcHDRntxrOLUJBduuOUHKPeAjLIZ
	NOKnt2RI0zfl/GkXZ++fYKsb87JVRVH0kepTBQnRIVzY/ImCyg/mxM1INuW7cg7f
	vNDWJfSS7rzNWY5Hx+ohe4BmYDCoDzx/YzrMpkuxjnKXUZCsExq76CCuD/7yZunn
	xcLgcgBF/v9laEPK2LrebjHRqqJQNQERvxYpkGONOBEgDqh7mm/gt+XmdHzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784432777; x=1784436377; bh=xyQHwIFVut+lm+nAdAghnesFek2vNce0l66
	GTprhkyM=; b=UQ06KpwtRUkh3VGYWhqtdO0eNcHLtVBAuNGb4ncUAC2jPjHhB5t
	hQwfvFoZi8+T95vjLt5aV667ohqkjdq8OKd3FkI5NLvoCedEIWNpR4dA//Pi/XpX
	+nVntCkNQGgaZB0EVDinCygnzcQczUvW0z1lXk83GVKwRxo6hE4Dqu/5ckM8Mczl
	toUBTTqdWK1VJGx+xOgYM/edxBI7MUAc3QE23/KuQRxYnpFv/xrV14MIQAAst0VV
	k6BYS8p+hjKz/S/i8w9igjmPMrcs81K0NIabj/wn/N8KVyi5UBqnTAap/I84iY2n
	CWElGdZJMFeE5nbR+ATb/LYTXeQIAMv3Sqg==
X-ME-Sender: <xms:iEhcau2SScEeUxvklTLblqWkAGDRKYExyAYHxPeP8CheHG_8pstyOg>
    <xme:iEhcatpjnNZCUNDWDeklMdVSwoN8S7xRY4EM03alXU5EbeET00y7AcRldC1UEsdDw
    PPRL74lR7pYLW2VwGT7uFRLQKzY86fgTqzyDgWsVkJMRa2vEE3t3JQ>
X-ME-Received: <xmr:iEhcarWY6m6oYKMlbv4WoizBsc695vKlrlvCVBh1m_stQ0NW0tIT2P8MVOqCrKswp2oyXhjzHvqfjS5fz0U>
X-ME-Proxy-Cause: dmFkZTGibFtg22yAWBkWYA+IY3Aj6/glywGQp1D5NR+rShJYeQFlQJKMYKitQzpmuOsbmA
    nQI0f+IlBOjRLpP0fPdwni2sWsdy3sEdgE73cUw3v4J7lN/TK4ok9BNexfqAVYbMzU3waL
    b1XbhcmqovgdmVJRdLcz2brmyz5yaI5x4HPSABy1rq0JXVmZwU2AVls7TtmUAWliOnBbV6
    FuNM1zUyvOj3aVp9mYHNOTrYji7LJk+++JJi/2tif6RoGqJbtD1NWLnPoDaGYxjcFy2KUA
    Ccq4PnAvEzkQl+mEm37C1ifcd7vxksCJ068ZqKWyA9SG1wQifRN/RxFwVOQ3JwXwWVuqZt
    4faxzk9iRN93CfCHkvCj3Mq/Z2G/GZkFyXZouPCwvova7BqxxzGd9WC+jv+YV5pSv5KJ+h
    jmen+rxIPlRFt4km+dVuUsh4uYjLxYjV6J39utfGEG+ENgC2A28PphLjLKR5An6hG/m3HD
    C/bNbCYKczRuE3QxQmZwrd0J6a3gK01ZFWMhQaTojGIExnpbUMBqlGrDJxPOGj3tW0pJDx
    838fkDM7s19l9L396gMU8wrIy/MLfh+hQ3e7xdNGBasC/71Ihj3Vprw7ET52/wi3sIZTvU
    ZezWaQM775clnt03BslsL9Wnf3PR0G3F/FA1G3KcNUivUqGTe9nDt4cCKITg
X-ME-Proxy: <xmx:iEhcamqkZuzF9WrsmwQ69xBtnTXwI0IgM2Y_zSUBnPnZ2x8H_ayyvw>
    <xmx:iEhcaiAVQbkFO9nGtUJcMqPqSERzStDBDRfu55ROQL1ROhaCJDuVgQ>
    <xmx:iEhcaig2M2wV13J6lOsFLVYhA4Ngndw7OQol5D0ybIrxiRXII9JAPA>
    <xmx:iEhcagZoFkWYa2NGqDPwi5VmUYCzYgbhiCRbzF0OtcZNaJWNxiR9Kg>
    <xmx:iUhcaiE8n-FcK5HBN0i9jNOtE18SLGn2oJMmZyWi-F0tN_ADU_0Rduyf>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Jul 2026 23:46:13 -0400 (EDT)
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
Subject: [PATCH v5 0/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Date: Sun, 19 Jul 2026 15:46:09 +1200
Message-ID: <20260719034611.3623066-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_204618_195212_B44CBB9F 
X-CRM114-Status: GOOD (  12.04  )
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

The on-module YT8531 PHY has no crystal and takes its 25 MHz reference
from the SoC. Following review of v4, the reference is now handled the
way Andrew Lunn and Maxime Chevallier asked for: the PHY is the consumer
and enables the clock itself. That needs a small motorcomm change sent
to netdev [1]; the clock is optional so this DTS still applies without
it. The earlier dwmac-rk MAC-side patch is dropped.

Tested on a CM5-IO with [1] applied: the YT8531 links at 1000 Mbit/s;
RK806, HYM8563, eMMC, microSD, the USB3 hub and PCIe all probe.
dtbs_check is clean.

Changes in v5:
- The 25 MHz reference is now consumed by the PHY, not the MAC. The PHY
  node gets its clock back (clocks = <&cru REFCLKO25M_GMAC0_OUT>) and is
  named explicitly (ethernet-phy-id4f51.e91b) so it is instantiated from
  the DT without an MDIO ID probe, which it cannot answer before the
  clock runs. &gmac0 drops clk_mac_refout and inherits the SoC clocks.
  This reverses the v4 removal of the PHY-node clock, which was the wrong
  direction.
- Enable &sai6, the I2S CPU DAI the HDMI sound card needs (already in v4;
  re-tested here, HDMI audio card registers).

Changes in v4:
- phy-mode = "rgmii-id", drop the MAC tx_delay/rx_delay; the PHY adds
  both delays (Andrew Lunn). Re-tested at 1000 Mbit/s.
- Pick up Krzysztof's Acked-by on patch 1.

Changes in v3:
- Remove the ES8388 codec from the header and the i2c0 comment; use gpios
  in the vcc_3v3_pcie regulator.

Changes in v2:
- Fix the Type-C DP alt-mode node, move the FUSB302 role-switch endpoint
  into the connector, drop the ES8388 node and dead pinctrls, rename the
  wifi pinctrl node, and describe the PHY reset at the MDIO bus level.

[1] net: phy: motorcomm: enable the reference clock for YT8531

Jiaxing Hu (2):
  dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
  arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-armsom-cm5-io.dts     | 402 +++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5.dtsi  | 558 ++++++++++++++++++
 4 files changed, 968 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

-- 
2.43.0


