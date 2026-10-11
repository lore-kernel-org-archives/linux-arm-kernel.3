Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2B3CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 18:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z95Whk5CNBd+R4ib73i78BlK0R2jxoPf+l1rMjUA2VM=; b=4caTD66BwlqEQrUrx2udjlrHr3
	eAZZMwxfXwn9LUv8FZeGr8cMm/3rsBkCi/LSf/3+zZRYzJFaJYqnDfRFPo8NysNiLF0QOPYKzhe8q
	vL/zARzP5M4fJBcp1QKde3HqMDFflJLZ8HI29xBT7P0FnL+7TK5wMqdGv3G4YUlDFVex49yEIlOhg
	jH6BNu/MEQYH31o902FRb9VdJT6cIio9zecxhAGL1leJtc4bWXJgUmIPFTGPYmjFSMkYikU6CaLv6
	/3Yu5V9ApgCBJSkgH81jg7pwt6T5/no9MHXmqoJ2jYKTrgf09QZyl5ouW4ICq98FFsndPH9xx1V3B
	LqGIC3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyKm-00000009IRC-03HC;
	Sun, 11 Oct 2026 18:31:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFyKj-00000009IQG-3apA;
	Sun, 11 Oct 2026 18:31:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 580C542D76;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FCBFC2BCF7;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791743501;
	bh=b5WqWIpY8HetKJM8uxETc/QQ/y49qT8ER9ENAwKq5T0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sVPv/y3IyEH05ad8o2JJO9YXswmOnH3CfUMExD3nYiTtyNWyU3mP4tS8hWBGxut+A
	 yT/cdBonvrjwsziTJEVbQ/jn2zoK+gi+T29vKBGk1omwtbMpwo4Q/4cUf2o32ScYqy
	 hcQZu0tbEPxcOA4PmUz78MXlxpzixfTTB2HIFfhqUuPLYu1iEuQaGmN9YLjVvVapRr
	 T8L5Lb5iPFzh/2HxfeywVUm+QKYebLKl2XUnZG45dS2aA8w2et0F0orIjBfvw45Kgz
	 Iu0sZO9mS91b+A683nfRsZqK3IsbjcHyfaJrGGawsugJ3t0nlZ4nwzaIiGzbYNMKGa
	 YEP3wWCfkhWXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0EBCA9EC7;
	Sun, 11 Oct 2026 18:31:41 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 21:31:40 +0300
Subject: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791743499; l=1642;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=PsqvKgTZVmwNJ/75hqMs5lzb8aAfYpplhUuYDuvqmXQ=;
 b=gqt5Pn5RDRBctoPQT0FhhHkMrtLZS+rS8WrpKx8CGMCHl/WC44eGIvR3VU++jAeOdW0x/OiO6
 8Ycvr/c7rGFAeDjY/tYKXbv/t7HctodE4HL9+Mtg11QzpF0JfGbz0R9
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

The vendor programs a unique factory MAC address into the SoC eFuse at
offset 0x34, where meson-gx.dtsi already describes the eth_mac nvmem
cell.  Reference the cell from the Ethernet controller so the kernel
picks up the factory address itself instead of depending on the
bootloader to populate local-mac-address, or falling back to a random
one when it does not.

The cell is 16 bytes long in meson-gx.dtsi, while
of_get_mac_address_nvmem() only accepts a cell of exactly ETH_ALEN
bytes, so narrow it to the 6 bytes of the address for this board.

Tested on an ODROID-C2 with the bootloader's MAC fixup out of the way
(ethernet0 alias removed from the DTB): with the 16-byte cell the
driver falls back to a random address, with the 6-byte cell eth0 comes
up with the factory address from the eFuse.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5943bc810..3b74528ef 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -223,6 +223,10 @@ &cec_AO {
 	hdmi-phandle = <&hdmi_tx>;
 };
 
+&eth_mac {
+	reg = <0x34 0x6>;
+};
+
 &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_rgmii_pins>;
@@ -230,6 +234,9 @@ &ethmac {
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
+	nvmem-cells = <&eth_mac>;
+	nvmem-cell-names = "mac-address";
+
 	amlogic,tx-delay-ns = <2>;
 
 	mdio {

-- 
2.53.0



