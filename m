Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75F4CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 18:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mOgbWILBmA1EDd62aOZ6WfyN7vNlPpZv9jEP/DVTRhA=; b=my76WJgwo+8gKUw/we/MkRAZV8
	K4kqo3F9/IH4RMYUBvn5dZ8yQ27kjcmLwPa21gqIohoqqx3u+dfGh2pfobHGG/txwBPkQmEnX1OMi
	SIPymAnLdeoPlY26RHbXSAYE6gXxUfZ6Z31eFpCRCcpcBmsIoRFCRUx+s2WEFePWlDe0Y479QOJrq
	8/fjbV8tm0jkgToRsz/BlsKjOQoH+zewU3Rb8I0ZHuh3DQNeVaFE/6ILMn+j+Lq9Dg6pEQd3seodz
	YPivN7B68X/BdySckVNpKsGrMneXBfw+RKY2uqMmuSntivM3dUwSKcqLA7SIAKkhMcilY7dCyN/pJ
	pArqrRCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDnk6-0000000H1eG-2unH;
	Mon, 05 Oct 2026 18:48:54 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDnk3-0000000H1dY-46nv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 18:48:53 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-35118a5991dso1214644eec.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 11:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791226131; x=1791830931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOgbWILBmA1EDd62aOZ6WfyN7vNlPpZv9jEP/DVTRhA=;
        b=GL8kaJwJvpDDsgghWRNCqzi2IIQmMDU9pdjJj6xD9yO/yxaNdgb45tuPA51FkmSgSD
         56au0XqZ3rd/TNrSbrkLs1Vbk/LbjjibStsrXfmc2Qub8yevJHbni44Ywl8MJYskhH2S
         aSO/BQg2/MOdKcNT5dn3M+oHChRywOBleM96yBP5qRCePHEE6izbsb/YqsjcwH6e3/L2
         1tAnhyPfIe9dlk40fEvDOZRMjwtLmXQbtrVyP6s0kAvFluUWewYNydXKOSG/BPMJMMzB
         28oIVCf2Acq4Z+KG8g8Ig0mk/Y/vWQLA4hVSttN6Rj40TjplEK/d1whOFnp2s4e4OLes
         tWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791226131; x=1791830931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOgbWILBmA1EDd62aOZ6WfyN7vNlPpZv9jEP/DVTRhA=;
        b=ZrUrPG+ZpaiccmW0i9IA7YE+l6wHPIwm5Bw9uaP+KxIvcgMlbiguWeWoPBq4RRmqrp
         j/OG1yjANHnjkrUPe3Oj8iqz8YXnImOcHrVEA6lFI2tot3lLI/GJJQaLMk057WT+vtBk
         NI5Vd+6Pb3MigeeWeSFnJIEf8C/vFieh3F2kb41d/APZk4wjlpWkjwfF+sYWiu5/fq4z
         03Lg52OlX1Tbe7UPMU53caAyvxOaZGGLLC0B/jMlv4GY283kPWlWdVhX/6rfepBBl3u0
         PxHLTPNJIip5znc+QQGz2Cg5BUzuE6tQN0vxyBrvo0SmvzR3Xlw54uGtNveL3V/NsR/c
         Ymkw==
X-Forwarded-Encrypted: i=1; AKwUvBx4ifzo2knayS3VAYl2e/SjceN79hw97AYF4oVKRCGx1ABF9ZL16F3dzZ7D9aGxG8SeTjBHw3i196xAogOVQr0U@lists.infradead.org
X-Gm-Message-State: AFuF++mo2yPPCOdwbNCnFCnXX3B1BHxrDist3lNn3sVVSPe1S7YJSxmB
	oWjNEnMzfAT3WbkYoDv6SMQc+ve/8MzCGvmgW7kWX7ITNUmSs2g6VD7p
X-Gm-Gg: AYBFou0y4ASWAIGZI4czmgy4SsiI2i+PsOgNrdVajblnZwAaIrKaWr94feqwvlZpK2w
	bWnc/SKsL3ZxfyKX5BRQe0uIW+0u56UgPfZ9KF8rA7uDFuXhu/sY/QoFFwKFe/rOLBooYPFEixG
	L/u7LN4yPlzoaYTB8J7uYF0vJEQnWIui8aWraFpa0ZX2kGZIIrGhpsTZfpbW23wvTlu7U+HuEGb
	RDOmrpV1Q6QSu5VVkIG0nn1EGDjJ4+d4MplLG+p+6NjK1W0Yy0MaD/CT6VYUyGbr41eGKCCl0hn
	djZbeHpOtzvB4+D9DOW9fwVJ9TzTCehhnwiTONa00RwZ+B3QW6uxeHbe2F9nPvietsIviEwZLyY
	2vwwf0cRP5m5OpdKCRLYGoxRwKSQE5RcvdkJfR5oXyj9WleKYeIaLnzloIO2aWPHk9ARUZrUQhk
	OO04K2yiJrmv/NmQjLBxbAfRIvzFfzGUYbRupLqGvG5nIbqLSKHgo+KGqjLdfzQQpAuE3HEDL1I
	bBeQxMTJMth5iFkvCYY9Q7X3t/d7FY=
X-Received: by 2002:a05:7301:6184:10b0:33c:e72:5b3b with SMTP id 5a478bee46e88-34f2185899bmr14499131eec.25.1791226130364;
        Mon, 05 Oct 2026 11:48:50 -0700 (PDT)
Received: from inhnjlux1020.ls.ege.ds ([2406:b400:53:bc23:13ce:62d6:5ad0:c521])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a297b0sm216369eec.11.2026.10.05.11.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 11:48:49 -0700 (PDT)
From: Udaya Kiran Challa <challauday369@gmail.com>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Udaya Kiran Challa <challauday369@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4 2/2] ARM: dts: kirkwood: Rename netxbig LED child nodes to led-*
Date: Tue,  6 Oct 2026 00:17:46 +0530
Message-Id: <20261005184746.252723-1-challauday369@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_114852_021573_C14E19C9 
X-CRM114-Status: UNSURE (   9.61  )
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

Rename the LED child nodes in kirkwood-netxbig.dtsi and
kirkwood-net5big.dts from descriptive names (e.g. blue-power, red-sata0)
to generic led-* names to match the new YAML binding schema.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
---
 arch/arm/boot/dts/marvell/kirkwood-net5big.dts  | 14 +++++++-------
 arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
index 2497ad26b5b6..49deeb40f4e2 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
+++ b/arch/arm/boot/dts/marvell/kirkwood-net5big.dts
@@ -85,8 +85,8 @@ g762_clk: g762-oscillator {
 		};
 	};
 
-	netxbig-leds {
-		blue-sata2 {
+	leds {
+		led-0 {
 			label = "netxbig:blue:sata2";
 			mode-addr = <5>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -96,7 +96,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata2 {
+		led-1 {
 			label = "netxbig:red:sata2";
 			mode-addr = <5>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -105,7 +105,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata3 {
+		led-2 {
 			label = "netxbig:blue:sata3";
 			mode-addr = <6>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -115,7 +115,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata3 {
+		led-3 {
 			label = "netxbig:red:sata3";
 			mode-addr = <6>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -124,7 +124,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata4 {
+		led-4 {
 			label = "netxbig:blue:sata4";
 			mode-addr = <7>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -134,7 +134,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata4 {
+		led-5 {
 			label = "netxbig:red:sata4";
 			mode-addr = <7>;
 			mode-val = <NETXBIG_LED_OFF 0
diff --git a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
index d4edf2727388..23e8e8b4597d 100644
--- a/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
+++ b/arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi
@@ -115,7 +115,7 @@ &gpio1 13 GPIO_ACTIVE_HIGH
 		enable-gpio = <&gpio0 29 GPIO_ACTIVE_HIGH>;
 	};
 
-	netxbig-leds {
+	leds {
 		compatible = "lacie,netxbig-leds";
 
 		gpio-ext = <&netxbig_gpio_ext>;
@@ -123,7 +123,7 @@ netxbig-leds {
 		timers = <NETXBIG_LED_TIMER1 500 500
 			  NETXBIG_LED_TIMER2 500 1000>;
 
-		blue-power {
+		led-0 {
 			label = "netxbig:blue:power";
 			mode-addr = <0>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -133,7 +133,7 @@ NETXBIG_LED_TIMER1 3
 			bright-addr = <1>;
 			max-brightness = <7>;
 		};
-		red-power {
+		led-1 {
 			label = "netxbig:red:power";
 			mode-addr = <0>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -142,7 +142,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <1>;
 			max-brightness = <7>;
 		};
-		blue-sata0 {
+		led-2 {
 			label = "netxbig:blue:sata0";
 			mode-addr = <3>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -152,7 +152,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata0 {
+		led-3 {
 			label = "netxbig:red:sata0";
 			mode-addr = <3>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -161,7 +161,7 @@ NETXBIG_LED_ON 2
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		blue-sata1 {
+		led-4 {
 			label = "netxbig:blue:sata1";
 			mode-addr = <4>;
 			mode-val = <NETXBIG_LED_OFF 0
@@ -171,7 +171,7 @@ NETXBIG_LED_SATA 1
 			bright-addr = <2>;
 			max-brightness = <7>;
 		};
-		red-sata1 {
+		led-5 {
 			label = "netxbig:red:sata1";
 			mode-addr = <4>;
 			mode-val = <NETXBIG_LED_OFF 0
-- 
2.34.1


