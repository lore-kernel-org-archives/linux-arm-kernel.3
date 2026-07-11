Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F20C44506
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eerO83FR9XLVJDLYJUhN9olbnCS8UH6ub1IdYOkeRY=; b=XfWvbn9CMVvgqwoqufy0J41x/f
	69SFxxv+p+SBl06Ai6lawJarP6CbOPbmwhU819+U5Z+hXIsoVXkSZQdDA90zNvDchIheWND90rHr3
	OLW5TTzY3R0/Jr1/pltpOwEdYCmZNQLiVJ6DD1OFBMqW66ai2aELyeFH7ILyPG0kdFID/YYw3UU3K
	3QK0mfIPxyQXQTqM0gm1u6wdk/cHzJjZXhOdShKGwz7JJTopNnJnxh44lq7e8fOliAZdoZ6g/uDCV
	qnT5Nd8NEskOG195TEsQZQUZgnWIRiBxN5vJSWCrUN9u1Y79ICx6Y82Sg0vFbFlG/zE+RRyiXNJZ3
	BGEoWyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepn-00000006t3l-2mA6;
	Sat, 11 Jul 2026 21:02:03 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepe-00000006syY-2PJx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 21:01:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5581A119823;
	Sat, 11 Jul 2026 23:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803707; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2eerO83FR9XLVJDLYJUhN9olbnCS8UH6ub1IdYOkeRY=;
	b=LHmh6EZpP36TorzqAJRec9nu4MuXA3Ib02qlFKHh/CKqDTtfKCvwv1lpmJ4Gf+pc0/ndjN
	sRLAkTQgtn0xPJCBpr+6GrTQwPqi0LWqUly8VpB0RQ831jGPwBOmGjFqB8/YTgA/Wxmna2
	HGYYA5tvT7YjeHaPfqn0Q2lbxcMjDU3GFy58uXcj88X7j4A0aRdKt+fNQIosw3hIPNKT5F
	4jpV+lYTd9uFrntsOMEp8+8Rbc4avOG1lRpdzumtxc7o19IUaxQ3JBekob0it8QbOvDzXg
	l03Oekbdw4dzgaKSKYAJ878xaIPJTn0A5fVWkLS4oFGqD+Plt0RlK+47d72Ccg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 01/10] dt-bindings: arm: stm32: Document STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC
Date: Sat, 11 Jul 2026 22:59:30 +0200
Message-ID: <20260711210131.236025-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_140154_826571_95518148 
X-CRM114-Status: UNSURE (   7.61  )
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

This stm32mp25xx-dhcos-bb board is a stack of DHCOS SoM based on
STM32MP25xx SoC (1200MHz / crypto capabilities) populated on SoM
Breakout Board, the stm32mp255c-dhcos-dhsbc is the SoM populated
on DHSBC carrier board. The stm32mp23xx-dhcos-bb is a stack with
STM32MP23xx SoC.

The SoM contains the following peripherals:
- STPMIC (power delivery)
- 4GiB LPDDR4 memory
- eMMC and SDIO WiFi module

The Breakout Board carrier board contains the following peripherals:
- USB-C peripheral port, power supply plug

The DHSBC carrier board contains the following peripherals:
- Two RGMII Ethernet ports
- MicroSD slot
- LVDS connector
- MIPI CSI2 connector
- USB-A Host port, USB-C power supply plug
- USB-C / DP port
- Expansion connector

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../devicetree/bindings/arm/stm32/stm32.yaml   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index c6af3a46364fc..2045dc2e54a60 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -196,6 +196,18 @@ properties:
           - const: ultratronik,stm32mp157c-ultra-fly-sbc
           - const: st,stm32mp157
 
+      - description: DH STM32MP251 DHCOS SoM based Boards
+        items:
+          - const: dh,stm32mp251a-dhcos-bb
+          - const: dh,stm32mp251a-dhcos-som
+          - const: st,stm32mp251
+
+      - description: DH STM32MP255 DHCOS SoM based Boards
+        items:
+          - const: dh,stm32mp255c-dhcos-dhsbc
+          - const: dh,stm32mp255c-dhcos-som
+          - const: st,stm32mp255
+
       - description: ST STM32MP257 based Boards
         items:
           - enum:
@@ -203,6 +215,12 @@ properties:
               - st,stm32mp257f-ev1
           - const: st,stm32mp257
 
+      - description: DH STM32MP231 DHCOS SoM based Boards
+        items:
+          - const: dh,stm32mp231a-dhcos-bb
+          - const: dh,stm32mp231a-dhcos-som
+          - const: st,stm32mp231
+
       - description: ST STM32MP235 based Boards
         items:
           - enum:
-- 
2.53.0


