Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7CBC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DXgipTTbL/+duhrMrioXpTHFIjBxzqR+m6MvMySmAw=; b=KHcwy1c/JvNUcbD0G6ZF0QCjhF
	Gsaeex2HChv5QE48Fr5P1cl2KgfS0m94NRRyjz1QE1B6FEMqXKXZLTduU4CxhoEFlxrLspZePmn8w
	YgggrnEZbh/wax5qO+MWcpBBD+WatUclhdJouz4fHKq4XCv4pekIYcSbtvErnZXcL6uC1dGsmt890
	U7lAMLRIFu/9ZL2+AKwCb3LIGVqWLEOpWQYyT2YvYGG4/aY6qYhlp12C/9Y3yRZ1GwU5iCs4VXW3S
	VENN1wyavztOc4IE/Op3Sfxkxt67FGfAZKvFW+SdTbCdw/KK4WmX/0OfZ834XhvOnZHQi5C3Fi8rM
	ZuEE4Pfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUTQ-0000000GfaL-0fIh;
	Mon, 24 Aug 2026 13:12:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUTK-0000000GfZZ-15O5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:12:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 040D843B9A;
	Mon, 24 Aug 2026 13:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDF6CC19425;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787577137;
	bh=QyXzZnJwkyxBDSEwT4XALNAbFVFz7Ox37OrO3JqwCZk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p7NjkJO7FloiQgAuqKk6zV+0yL9ZWDaWqO36zQDjya1zg0eZekTpPYjkSfqavibgf
	 SON5OBnuQBIxhDJE7W+fZz7ByT4ZeIWYionNeSZM4potvBl01yx9/crETHJKapm0eR
	 0JJ6n+sflqxxVePsYb2ZlNWQ8GLkDWIF0X5vWXp1I6WlnhvBFXefJcl4Xpzg2wuWDr
	 NAucYBQNra5pa+N7qKNzIQd4SgayKQ9B5XPMD+OdUvuKNJx1/vLtNQHVtS1XBjL3Fm
	 BMACGGbYK3qrXtP0ILMc97IoRMgCKhbE4Wrnd4w0V/8OpvVPikuAqT6xyh7/wr5zjk
	 OQGuOaHJweDuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB06FC5DF94;
	Mon, 24 Aug 2026 13:12:17 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 15:12:01 +0200
Subject: [PATCH v2 1/3] arm64: dts: lx2160a: fix incorrect pinmux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v2-1-0a525d5f4cd5@free.fr>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
In-Reply-To: <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
To: Frank Li <Frank.Li@nxp.com>, Carlos Song <carlos.song@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Josua Mayer <josua@solid-run.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thibaut Collet <thbt.cllt@gmail.com>, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787577136; l=1626;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=cZfDHWxtn03VL7NNB13yIdWVRIXNDxo1MTtXhAgv4U8=;
 b=dHSEpwxeF9dhLwKyueWq+wokOc4uqkX0QwvIMBU7Ty2dsMST7A7Rn24MKI+ZUqoIEeVH/goLx
 WKgk3gOCBUzBv9OBRjRsCCsjhAfCQGBgKygWVieLawOiMoatUKi+UHR
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

For gpio1 value set for pinctrl is outside the mask and so will do
nothing.

Add the missing offset for value field to be the same as the mask as
expected.

Fixes: 284ad7064aaa ("arm64: dts: lx2160a: complete pinmux for rcwsr12 configuration word")
Suggested-by: Thibaut Collet <thbt.cllt@gmail.com>
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
index ae6e37870c5e5..d4522a19405a9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi
@@ -1622,7 +1622,7 @@ fspi_data74_pins: xspi1-data74-pins {
 			};
 
 			gpio1_31_28_pins: xspi1-data74-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 15)>;
+				pinctrl-single,bits = <0x0 (0x1 << 15) (0x7 << 15)>;
 			};
 
 			fspi_data30_pins: xspi1-data30-pins {
@@ -1630,7 +1630,7 @@ fspi_data30_pins: xspi1-data30-pins {
 			};
 
 			gpio1_27_24_pins: xspi1-data30-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 18)>;
+				pinctrl-single,bits = <0x0 (0x1 << 18) (0x7 << 18)>;
 			};
 
 			fspi_dqs_sck_cs10_pins: xspi1-base-pins {
@@ -1638,7 +1638,7 @@ fspi_dqs_sck_cs10_pins: xspi1-base-pins {
 			};
 
 			gpio1_23_20_pins: xspi1-base-gpio-pins {
-				pinctrl-single,bits = <0x0 0x1 (0x7 << 21)>;
+				pinctrl-single,bits = <0x0 (0x1 << 21) (0x7 << 21)>;
 			};
 
 			esdhc0_cmd_data30_clk_vsel_pins: sdhc1-base-sdhc-vsel-pins {

-- 
2.43.0



