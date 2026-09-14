Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69551C88E6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGNuYks9l8k6RKHlJoOk84pwpKQUzci+L+rdDp6XAgo=; b=iJgcyepRXvQ+KCqbXeSTTFBCTl
	I0KIOPpU9WuY15tTU9XRYa7+so/LAXPWBphCMPrXcH0n7TGQby5YBHmcc/fw/Po952Fo5FHRAqgKB
	9LQq/BOqoSHj92tVxtTVnTlEZjTq/eigLfuBf/hcwAX0pCUE/SvNVJwvoEl0t3zKEKVUSEu8y+C0D
	CohwfXKWb+hidQ6KnPBwtdaWVP9rIoTq55OAhU7a9srUE5tvvFdH/UIcABvxC3cT6ct3gFFDUyX/3
	Nb/ve8/HpHsvNW70xXSOm0JsiXLdQa50PzVbOsgHHBvg1kcRoyJWbmjnwWdO9TtA1Ubl6ryGxSxW1
	KUwvGYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62F7-00000002mgN-1fig;
	Mon, 14 Sep 2026 08:40:49 +0000
Received: from fout-a7-smtp.messagingengine.com ([103.168.172.150])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62F3-00000002mcL-0RZn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:40:48 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 66798EC05DD;
	Mon, 14 Sep 2026 04:40:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 14 Sep 2026 04:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375244;
	 x=1789461644; bh=gGNuYks9l8k6RKHlJoOk84pwpKQUzci+L+rdDp6XAgo=; b=
	UCOMoXcjKmYD2m94fFit3OJazyOvGTIhgBBiRAr9ABckNObQyUcBLSS1iDGo8CEB
	AfMsKKGRlfQezciTFiwWO1AdlO8aM16bdUU5LtGXeSDX/TYRl5a2OeyIT9hovKEF
	wIabNn2UsRnn/vTUX6erhUHzM5mS4XK1JNkePi0fhzRY1fTWhPd2r4UgKruoR/HA
	x5j+AklXz2LILMX+DSXW5e2uu6POgbWRtD1keP0uQLJtBIW5T+1K/B49LXU1Vr1a
	54VK0QT53SNnWgdBUFOPdE+FU0fqerBQ3hrzcXJI2eHITF4w4rJNZuPYWcSSZiRc
	mt41tzc8DxYjV/7rUQe80w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375244; x=
	1789461644; bh=gGNuYks9l8k6RKHlJoOk84pwpKQUzci+L+rdDp6XAgo=; b=B
	x3qDIag+XGhm6Xen0m9AznhH6a3oeFXjnQwMIlheBEsPUlk4954qyMBgR1lOQGP8
	8q1Eg03nHO0GFJk1TEtVI5GjF9RiT6i+i7D9JlDWS3NobKReN/m6axW4cAXFGNgs
	eds3NYI9h2WAccSH3IzZBgWQa9ru2XA7hGByY7jEomLotOVEFDSVABfUyIjztVWT
	ifLerZNJZGx8qp6mBZL6iKpezvcI4O9IzPI1VwZuyc3eVsjx2t5E177XrU8WskZ2
	gNMXx1+OjJaBNDNm428vZwN7tbWi4JOBQMQQ8XurOzqZJIkjasFNiQ/qz67Gyn2K
	NwWhDLtNY4aVORAq5Y38Q==
X-ME-Sender: <xms:DLOnakVr8qWFLm64imxNBETjc2KDJJ5idq4RO54A8RGfnouGrl3eeg>
    <xme:DLOnagy7pfApijhgZN7n7iHb9aaWohhKU4m7Mab94BuFtquXlik7zMZRP1HzNTbFO
    YO4ng9ouDp_S3qx02eDROB4Z8hO3aYJ5m01gkwPV-mWdGMTBAZzk_IN>
X-ME-Received: <xmr:DLOnaj8uKL21JlSvBox6DGzgMSg7Z-WROzBRu8OtzOUa6CCRuwJtJF6Hjpe6jQaSiPaHzoJnyuAeU5iJKyW19EIg5sjPHaqlnYT-wg>
X-ME-Proxy-Cause: dmFkZTE4K6JMrxd6sPzZVNrePGCzWSArxKGqIFy2UwUC7nS/ZY+sStdcZ7vmPmE2pNoHZC
    9MiqcQ5OXckdWGFiy01IJr2JkZ+n3p+fcnek7D1Qwk8LgHRtAPwJ3G0I5cz7ZhSuemTIJc
    i9Rs6SyTtRrS0p1PgXmcVZpifTNEIm8RuZjsFaFCWemyhP462rhvuOdftkbms6ekvvuLIV
    6HeACEZ35ia1OWZxWsqljJDvRhxvUU8yfY+GnRLK37wYdoIiqubcn305EIee0gH5ypsRyC
    0b6zJacisih6eDtoNCnZwnv1woWj2R2DHm/YruUPQexvu5t1hokHp9I+EwChY3zqidyUDO
    mZSf5ieyc384TBYHAJiC0+L2HDaefkeOewdUYU5+K2fiLw9NovyDRVICv1RagdOjI0mqed
    xMoAPqzO7I5QedrLLyT6+10qQPfpO2pUCunDkH5nBsAFlG2piSNk/N9bpYlbmj5IMVv4jN
    eWKEW+yyvtLuYbUKjYWbcHX0Zhgi7TUAQ0/0yWJhfV/pmtQc2RSqqNU+UlUHznWH2iJflV
    jMbR/p3G7MH0fLs4NzlUHlxWayXo8yL8HSkcyUqqsP3zDXdtoCEc26dUxnMu+aIfsEZZ/v
    lfLnoUBHeRDBdtdYOtGBCdmAJjqRP2iU65LsiwA71EejVjJHsW2xNxDec0Yg
X-ME-Proxy: <xmx:DLOnat_QNEoGlw6BRzNUtT4gCTbG2G9no4ppp-csGL2zU-knIu7FJQ>
    <xmx:DLOnaqWMB_PoxPVEdA8dH-Hg2AzYUJUIhHCpjSfgSf_Cr5hnFynS0g>
    <xmx:DLOnaifzk_czq7ab23MOEb5pJ21TCXf8653cKzVg_MM8TK7eXb7pFg>
    <xmx:DLOnarasMiB_iDPLe7WbunBM8vqrhRAHRjFZ79E6rGDh93sSQEcOfA>
    <xmx:DLOnamWNQbNuoIKk9FecEtoOWpLrdEELADGKX6jzho7I3VsIqC_BKJpU>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:43 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:33 +0200
Subject: [PATCH v2 03/13] arm64: dts: apple: t603x: Fix child-name-order
 dt-check-style issues
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-3-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3217; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=KQEtZ8nZptaMvldtSk9ZHKjNUaBiwDDrzs1q02ay9Lo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm5klT7WLpe43mZ2q/OSky6yPyb0WRg7xapEGSk3JM
 cfduj06SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATCQih+F/VsA9NUWdRc45W+wW
 Rn1TDqm8LMW2bRIfP59x7OuS3oo8RoYNnOu7Otd9DbwiOu3o8rynsv/33dYpi5lgMPN1S90mhsv
 sAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_014045_638045_E90FCCF8 
X-CRM114-Status: UNSURE (   9.62  )
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

Reorder child nodes by name to fix dt-check-style warnings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6030.dtsi      | 34 +++++++++++++++----------------
 arch/arm64/boot/dts/apple/t6031-base.dtsi | 26 +++++++++++------------
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t6030.dtsi b/arch/arm64/boot/dts/apple/t6030.dtsi
index 0bfa8db59db4..0b5824c9f1bf 100644
--- a/arch/arm64/boot/dts/apple/t6030.dtsi
+++ b/arch/arm64/boot/dts/apple/t6030.dtsi
@@ -15,6 +15,13 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -220,23 +227,6 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupt-parent = <&aic>;
-		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
-		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
-			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
-	};
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -537,6 +527,16 @@ pinctrl_aop: pinctrl@374824000 {
 			#interrupt-cells = <2>;
 		};
 	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&aic>;
+		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
+		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t6030-pmgr.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6031-base.dtsi b/arch/arm64/boot/dts/apple/t6031-base.dtsi
index 6df3be68d740..667f32e9e606 100644
--- a/arch/arm64/boot/dts/apple/t6031-base.dtsi
+++ b/arch/arm64/boot/dts/apple/t6031-base.dtsi
@@ -11,6 +11,13 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	clkref: clock-ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clkref";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -285,6 +292,12 @@ l2_cache_2: l2-cache-2 {
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&aic>;
@@ -294,17 +307,4 @@ timer {
 			     <AIC_FIQ 0 AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ 0 AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
-
-	clkref: clock-ref {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-		clock-output-names = "clkref";
-	};
-
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-	};
 };

-- 
2.55.0


