Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A694C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6EUN3uH+cBsC/FYES8tXDJVOJ0qqEl8LtFAqKxXbW7w=; b=AshUr9LCRC/tK7/pyO/PPTAOae
	iDmleBrmhNc9ClMf9aaRZAHFt/bH5T07ivTCcfBW6G222v1qwrDYYKOdYltckOCmwtRk8JMbNAf/v
	mTXQglLXcrKgmoK830R7NEbeX5f+1YRf6CDgF+b/Nz8T0U1JjCJRVtD80IoYpQom10Nh09WxoiS7Z
	HNZm1Gk4hziKEWx4VGdybqhQCWip32ySSKa661RxGsc9R/gBc+pShfiyou8LAO6sCbTMYxAmnqTVP
	+C2ezIsQKtT3Epb3qmtAxsLb8S39thidvja+wYtCL2GDkvzKWMtbCYrLiVrnMZRWM0+hcoJkh/KD9
	iivoy+QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5DZ-00000001RLO-4Bde;
	Thu, 08 May 2025 17:39:34 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5Bc-00000001RAD-22en
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 17:37:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746725831; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=E/hu1PaHoB4ZtYo7xbH8KOeUnfSUrqpnCYMfSSUbAop2QsDmf1BV7UbxD+zXSQRAVl
    vYsFookEPeSjaQth2lgeCP1bZa9kc6BvFOFZEHKf7wTX2kOYFuG5PPhLDuDfj6E8wd7n
    EV+qgxyO1R/vhLQPoJVFmL0tHBNJPOIC6BUNdullnZUeMXqFXGIy0nZShulYFDzm645c
    rS085v08u8XAiw7GBKR6sNZQDR7BHFPU9ASQY88B3GCzGEETAVQqCCscXr79zFFBqgWa
    EC9D5YsrAqw8ffe5HSGCJicicmDJ97rNDoymj04tl7mg/A6YMJNTH1d8lb3fApf1LItp
    jR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1746725831;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6EUN3uH+cBsC/FYES8tXDJVOJ0qqEl8LtFAqKxXbW7w=;
    b=YdoZCzkrPzOWFHEOng6OrmkO5BxHIsFRQuquLSiMbe/5lp1nNEJf061tcueoavvzQc
    gmnVzvY08u52HrIBTDIKRjJQqzuml0Ian8LrBQ8TgPBX1bZLpiGslP0/Ij9/qmMs2NNF
    7Epc0rVQA9qNqTyw1CD3KuccSMxhfioO94T/v80Bu/ORtGiThn7qkdgbc68aXVGzjk5p
    a7Qs4GyTImU3Y6AKezxWj4KD9rGQuh/ixEl6DTiayFvVewFxtIaWM15O+freWOTL8yLo
    Of44MROQiH8z/bgsf4k+s675pBA8E1eZE4zXFX6J+Vo9DXrNlHLyS7dnpgjJsBeB8MfQ
    gXwQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1746725831;
    s=strato-dkim-0002; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6EUN3uH+cBsC/FYES8tXDJVOJ0qqEl8LtFAqKxXbW7w=;
    b=ZVvyJCRKpmBeBE/RO8xHt/Oq8MuvgFFnkbDfFfF0sff1gZ65r3C1zL+X4c58WTwXNr
    Y6/RAyUtEaJ6Zu6Yz1QV8e8XpTDAFEAOA+ldPreO1jCEjsEo9lz01W/+iTL6qEUWZGqm
    I0XQqg3RRvfOfVnuc42lhlCPBfsD8dm6B1O6iJzhG1WdeCrO8GlPT6vfORldxe3cXLUu
    RzzDRvBIdAXHiOzsCZgaMjhXRVCd8oxf/AGfXC72Qu3l+b48KPJtmNzM/na8NJ4ZAPmz
    jNpOuUwi42M1kAf9knCJ1l0c29WEeh9noXsXfosnz/RihcLn1lKyaM5JRbrZ3fLu+KcT
    G9Gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1746725831;
    s=strato-dkim-0003; d=fossekall.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=6EUN3uH+cBsC/FYES8tXDJVOJ0qqEl8LtFAqKxXbW7w=;
    b=AyNZaAhzM3eRbO/LdasN+IUEhKYe/C47l6PUCtor5g33FLlsfIgzuzxmpjJAUCx9g5
    THDWVrLM0wtlyjmCyyAA==
X-RZG-AUTH: ":O2kGeEG7b/pS1EzgE2y7nF0STYsSLflpbjNKxx7cGrBdao6FTL4AJcMdm+lap4JEHkzok9eyEg=="
Received: from aerfugl
    by smtp.strato.de (RZmta 51.3.0 AUTH)
    with ESMTPSA id f28b35148HbBLQC
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 8 May 2025 19:37:11 +0200 (CEST)
Received: from koltrast.home ([192.168.1.27] helo=a98shuttle.de)
	by aerfugl with smtp (Exim 4.96)
	(envelope-from <michael@a98shuttle.de>)
	id 1uD5BG-0007JD-0K;
	Thu, 08 May 2025 19:37:10 +0200
Received: (nullmailer pid 8724 invoked by uid 502);
	Thu, 08 May 2025 17:37:10 -0000
From: Michael Klein <michael@fossekall.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Cc: Michael Klein <michael@fossekall.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] ARM: dts: bananapi: add support for PHY LEDs
Date: Thu,  8 May 2025 19:36:56 +0200
Message-Id: <20250508173657.8695-1-michael@fossekall.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_103732_826560_28256967 
X-CRM114-Status: GOOD (  12.19  )
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

The RTL8211E ethernet PHY driver has recently gained support for
controlling PHY LEDs via /sys/class/leds. The Bananapi M1 has three
LEDs connected to the RTL8211E PHY. Add the corresponding nodes to
the device tree.

Signed-off-by: Michael Klein <michael@fossekall.de>
---

v2: Refine commit message
v3: Move patch changelog below commit message separator

 .../boot/dts/allwinner/sun7i-a20-bananapi.dts | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
index 46ecf9db2324..d8b362c9661a 100644
--- a/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
+++ b/arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts
@@ -48,6 +48,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "LeMaker Banana Pi";
@@ -169,6 +170,32 @@ &ir0 {
 &gmac_mdio {
 	phy1: ethernet-phy@1 {
 		reg = <1>;
+
+		leds {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_GREEN>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_AMBER>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+				function = LED_FUNCTION_LAN;
+				linux,default-trigger = "netdev";
+			};
+		};
 	};
 };
 
-- 
2.39.5


