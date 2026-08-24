Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D071EC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 21:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YiZyZbLBmJ3iUV5hx0olprybllFCvpy0oQ3B2dYGzK8=; b=iqtsPV9AZ31xoLhQso6IrJqatx
	XlxrR4OK940W2K9tVWB+SwV1eBvmqt7DScvmYUoe0PYWk1LJFY2GSt3oXjOXodgHxlr9CplF0ohL9
	tHAgYzcA/DAJOM2vhCWxC4e98JzBnrHHyyXmc9+qQEMoAb7Fv5j1T1BDfrufUwMBuMsxj2Q/qX5Xu
	t6MrGHKCj+vMpXR+FowFh6QmTvRu987lYR5xHwq5zw/tJ/jDzLqS20JU/gQjtMmVluPA748dEpbO+
	HJPNTXJd+ymmH4UWzkFGwijS4rcvRqJ/hHzEPag59hrqbKi1mXTWo4f1q+ZDfHJ1nLubQFAxscbXm
	MDRYCcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycAy-0000000HPIC-0G48;
	Mon, 24 Aug 2026 21:25:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wycAw-0000000HPHS-2Dso
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 21:25:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B51AF4380C;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D331C2BCF4;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787606749;
	bh=MtrNk79y9UlhhIe4pbAdt5QRKJ67Z3i4LU97ujPXueM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LV1VGOuKH6vtbfL6sKT2y++7zjUIto9i952tLgrMaBj3pdijOa9gc7Dq8YJ4+d0h6
	 QQc2YP1OyOMJpDiZZGqUY8O3kUY0SB4n1ZHf+YG/I1ROurlJm/88Jj9xRhe3YG87vy
	 EaqxNR5w7TUuaJAxFtLRjm7VGBPD6KEug7IhD0XtdminlLj3R/mOwNTxXxOfErwjWD
	 0Y/eNq7wi8qXZWub+0f+kbM3rphMeGhSS3YFkbe5CP8f9uz65k7fVRwmYnE2xih68v
	 31YEa5j9J6Y3Y2lFMNbCJMNThtU93YHZEuDrm3Gyfr2aCSneZbXT/yC9mONnuhzIX7
	 QiXEm7wc/rliw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C956C5DF9C;
	Mon, 24 Aug 2026 21:25:49 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 24 Aug 2026 23:25:29 +0200
Subject: [PATCH v3 1/3] arm64: dts: lx2160a: fix incorrect pinmux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-for-upstream-lx2160a-pinmux-fix-v3-1-5556ff1e6be2@free.fr>
References: <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
In-Reply-To: <20260824-for-upstream-lx2160a-pinmux-fix-v3-0-5556ff1e6be2@free.fr>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787606747; l=1674;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=tk7MyEzbkFZ9falPdlkYVsr2TClhONYWQaNZkpaH8F4=;
 b=sGMzLO+RIZh/oxKRvZgGXdsZ95+HjPTv+ykAhYxa76E4oapS1VBZ/VzyRGoiUEqngmIjPT6+f
 99nZ4asHgAFB3p79gFJdvAGg6a1GsHqf76xMANmZqfx2eipXYrOoN7d
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
Reviewed-by: Josua Mayer <josua@solid-run.com>
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



