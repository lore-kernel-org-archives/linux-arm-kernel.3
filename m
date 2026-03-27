Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB64D10F287A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 00:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChVlZg4DQcM0BMMikYPaCk2lhDaVuYdhq7p8q4efM+k=; b=225wCe2sbr7iLThgQstNdqKLKz
	KKuiexdMn1O4wZhpYCKv/7xqbyoMgE/tkHWMQmj5tPEqXaWu+lWoVfjQw+310wMe7HZoytKuggh//
	y4xq9MQw/3zKWtYGssxCiSX7PM6CF399csY3RMqr6kWtVnQMsapYxm2c/JcmpZaoi8x9poQ/GYOvP
	c2795qHpUKJMyl+gEdXQxTNO7gJQS/lRDVJ0PuRy90aCUE2GESvE16Q9JigkQaBeJ3qUDnFYQuDhI
	n9vTH6M7ndMnzqrEAcGVwfS/2X9i1jmuiXFBB1ywA+qnnPZQ1kLbkAgix6Pb2yXvSP7tTj++XB8NA
	zcRyAQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H6o-00000008LfF-04Yk;
	Sat, 28 Mar 2026 00:00:58 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6H6g-00000008LdM-10SW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 00:00:51 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fjHhw1BKYz9tcq;
	Sat, 28 Mar 2026 01:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChVlZg4DQcM0BMMikYPaCk2lhDaVuYdhq7p8q4efM+k=;
	b=Ocu0kZwhTlksevo19PYFTZ69n6soqc9lCQa+xcrf6AhQMJQ3Nzc4edYqTAGUXX2dIHj8lT
	6DAYDyrI4KK1o3RAaemy4wP2IiZ0CcNiGKflVcF8Z25ynUCCsBgFgoPecW6b2Fxec/dEuf
	KHYvEa1Vw3h+kfdiJ2Zy7GyBFQhLAbz/rHNsKy1iisoPTnF9VE+SRSchiwyZrAjpp62mW5
	v1ypBGywsCb4FmNnelF6/wis5vcmZQaLZ5UUowMwlwqE0Rtmw/v6OJi53M4evEws/ZHqkF
	iP2HV/Q/JZGQWdDBKCiuV+4w0L4yqtzOqxYfju329HvwLzzyNThzIGAYdyQymQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774656046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ChVlZg4DQcM0BMMikYPaCk2lhDaVuYdhq7p8q4efM+k=;
	b=BGMDzIXjadXYInfpq9ZCy27CEQYTdyPskKxQFVK8T3azuJNK2de+FX+ZflQ9QPwQ5As3qd
	lODwad0eHZuxHuAd4XY4ZxPki/plEJz9n+HiYVRsQ92x5miAYmpPHbv4LQPZQTc+bxmSjM
	FSw2gP6+gg3/ynDFai494c7Mj7e9SX1+Y74tlcszNob+IDqQ6ALa+DLxHaG3FYS//Noh4U
	oL+FDHtnqUOrHlBaPF0wBwuvBFKgeqvgwL/rGherHdL1uv8PyEma1O3xH7G/Fmby2V4h+i
	hyfHmSut8UOvKF+5VJ528ThdDvXPtpzIoZcmfVaJ0sfq7t1NsWojhEPBOUtThQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [RFC][PATCH 1/4] dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile A1
Date: Sat, 28 Mar 2026 00:58:18 +0100
Message-ID: <20260328000031.94645-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
References: <20260328000031.94645-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a36fb0b4677beb61b53
X-MBO-RS-META: pwr3aftunkzg7rwc7fgbask7d5d3axb4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_170050_422906_D091C691 
X-CRM114-Status: UNSURE (   9.66  )
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

Document ZT trace bus and ZTR trace clock on the R-Mobile A1.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/clock/renesas,cpg-clocks.yaml     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
index a0e09b7002f07..e974dd077efbb 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
@@ -41,7 +41,7 @@ properties:
 
   clock-output-names:
     minItems: 3
-    maxItems: 17
+    maxItems: 19
 
   renesas,mode:
     description: Board-specific settings of the MD_CK* bits on R-Mobile A1
@@ -116,6 +116,8 @@ allOf:
             - const: zg
             - const: b
             - const: m1
+            - const: ztr
+            - const: zt
             - const: hp
             - const: hpp
             - const: usbp
@@ -239,7 +241,7 @@ examples:
             clocks = <&extal1_clk>, <&extal2_clk>, <&extalr_clk>;
             #clock-cells = <1>;
             clock-output-names = "system", "pllc0", "pllc1", "pllc2", "r",
-                                 "usb24s", "i", "zg", "b", "m1", "hp", "hpp",
-                                 "usbp", "s", "zb", "m3", "cp";
+                                 "usb24s", "i", "zg", "b", "m1", "ztr", "zt",
+                                 "hp", "hpp", "usbp", "s", "zb", "m3", "cp";
             renesas,mode = <0x05>;
     };
-- 
2.53.0


