Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C900FC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9imW1wh7P5NcD6+FCFtASpqY9fQcjduq5Jb0jSIcZCk=; b=wqIYSLRCn6Q+v7n0yn9bpmfkcZ
	VlRe3qFPzfgtE+IZ1K7mSV/Lh7SYmectt03639aDH/lGNdVUAGEt5z4aZEOZDGQ+W3PCOHYcpcQV5
	ARpSAAfjZ0ArvdL3f+WRHDKQaZMYjTjIVRGyyxweNmsOO1jzYGrLlNXeXlt581DfAeNckLvfYYNr+
	sJAaUH2q+0r9d39FLPpo587u1kJzQqqneBQEpWyK33/JYsA7aX8SqIfr6++HOCyi7zOxj+Rc5h5PF
	i2lw5cnlVGJ/xxIprMEDT594PHbxbkcJvg5ae6UqfDm/+qn/sSZ++suYawnS54fqDYiJO63r7jHJf
	QuEcLgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dPH-0000000ADCC-4AwC;
	Thu, 24 Sep 2026 06:58:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dP5-0000000AD7F-1v7f
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 06:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9imW1wh7P5NcD6+FCFtASpqY9fQcjduq5Jb0jSIcZCk=; b=MlObK1uN2asDvOzz6/eEqT9fv2
	B2NDQvz19xo4Z/xIUqTHiIiyklhBSiozLAnCAESX23tG9IcquA7islw6eew7ehwCIRduxKB46iUuO
	A2TAFVIRQccEtlPwH374vkYWZVzHqD7Wo/Ei5mXMo8juA58zieoMTvmBTSTmbHYKbM8UpVj9V+cOI
	Zhv+5K3Dz/u7Dn/qMHjAEsguufjGbQa+ETBpixIh0uhH0sJ/9juf6puAuaUF04pfW+aMf5o1WELxK
	tPy7bAmzr3R3VdIOgkvN6/cFBDrxKc8zi83jrGog34psoo/Ca5OMoww96VyIvduD3hfIxeYyA13C4
	GEs4xS1g==;
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9dOy-0000000FckC-1xUA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:57:55 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8B3712020D;
	Thu, 24 Sep 2026 08:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790233067;
	bh=9imW1wh7P5NcD6+FCFtASpqY9fQcjduq5Jb0jSIcZCk=; h=From:To:Subject;
	b=XPwKEaA/+oTj2IDcyMNLsr7qvw5nGGrHYPG1V2WEYtUm/nT4Yvj4Roa0AuLBD7VJK
	 XUJHj2Fh1U2rD0XNwsIdamM122hqQlFPOUCcTFcDEkGqbZm8hdRJAf8hZ+DS/a7al5
	 zfAeGxCpokrGKObCw7Yf/ZW+96l+xvEBWuS3coi/IxvSghh9EN1IvCWwzizDRw4hy3
	 Y5vZMjaLNPXmtmNglg1QVvbOMp+ZnzMDsV5yGyj+y2it6nYfBAszRjCfHlgzNgaY3A
	 uUM9Z+E1lMVfrh42e7quGI/bATET4zNpx+dTTc2HnyhMp8kcsJ0FIPvgvPQvhWJswW
	 RCuD/UlPhJKWQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/7] dt-bindings: arm: fsl: Add Lino iMX91/iMX93
Date: Thu, 24 Sep 2026 08:57:27 +0200
Message-ID: <20260924065735.17678-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924065735.17678-1-francesco@dolcini.it>
References: <20260924065735.17678-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_075753_097555_BF2E1F5F 
X-CRM114-Status: UNSURE (   7.91  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add bindings for the Toradex Lino iMX91 and Lino iMX93 SoMs, based on
the NXP i.MX91 and i.MX93 SoCs, respectively.

Lino SoMs use two board-to-board connectors to interface with a carrier
board. They can also be mounted on the Lino-Verdin Adapter, which
converts the Lino interface to the Toradex Verdin family pinout and
allows the SoM to be used with Verdin-compatible carrier boards.

The Lino-Verdin Adapter also provides a Wi-Fi/Bluetooth module, an
Ethernet PHY and a GPIO expander.

Add compatibles for systems consisting of a Lino SoM mounted on a
Lino-Verdin Adapter and connected to either a Verdin Development Board
or a Dahlia carrier board.

Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
Link: https://www.toradex.com/accessories/lino-verdin-adapter
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3: rebased
v2:
 - add acked-by
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index adf209b3b7cf..f3c73510c18b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1528,6 +1528,15 @@ properties:
               - fsl,imx91-11x11-frdm-s    # FRDM i.MX91S Development Board
           - const: fsl,imx91
 
+      - description: i.MX91 boards with Toradex Lino Modules and Verdin Adapter
+        items:
+          - enum:
+              - toradex,lino-imx91-verdin-dahlia # Lino iMX91 Module on Verdin Dahlia Board
+              - toradex,lino-imx91-verdin-dev    # Lino iMX91 Module on Verdin Dev Board
+          - const: toradex,lino-imx91-verdin     # Lino iMX91 Module on Verdin Adapter
+          - const: toradex,lino-imx91
+          - const: fsl,imx91
+
       - description: i.MX93 based Boards
         items:
           - enum:
@@ -1539,6 +1548,15 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
+        items:
+          - enum:
+              - toradex,lino-imx93-verdin-dahlia # Lino iMX93 Module on Verdin Dahlia Board
+              - toradex,lino-imx93-verdin-dev    # Lino iMX93 Module on Verdin Dev Board
+          - const: toradex,lino-imx93-verdin     # Lino iMX93 Module on Verdin Adapter
+          - const: toradex,lino-imx93
+          - const: fsl,imx93
+
       - description: i.MX94 based Boards
         items:
           - enum:
-- 
2.47.3


