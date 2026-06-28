Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16982C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 17:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tZqL3y1dOgTp1mPIxTFcmNs123y4a3Qb20/7Lp4iY0=; b=fqiYh1XGhxTbM8LmHUDx/qR+wB
	L8KcYLjJ4HupFkkyn8SltIjC1Zs8aLAXVGUw7Vv+9/QPpGeaf25BJYi4A63cExMnGpDF+DYzzYtlC
	T0gwCW3HQkJEbuMcD0OXqZiqJjkIo8yVUf3TLGi1O9NewgiOpupy5lXmx3uu48PegK5cWl0y2Scm3
	jD7VTnoLihoMy5MJ+A2NaGBRAfzFVJ8U4Eg7pZKn5oW4TpAbznukegdn41+d+iTK631NOVtGIGYDk
	WyX6kQwI1JfrojyUWD+SgNwEuNX4LA3mZgConw94QMNw0qlxFsRxsEPtaiuZV9UzJTgq4pH6E4UqM
	0+J8ya/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyV-0000000DE8D-3RJd;
	Sun, 28 Jun 2026 17:07:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdsyH-0000000DE4N-2ff5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 17:07:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49270caa5c0so18467805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 10:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782666424; x=1783271224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tZqL3y1dOgTp1mPIxTFcmNs123y4a3Qb20/7Lp4iY0=;
        b=bSgELAna9wYGV2XBFvUalRbGH7raM8vMvSQHfzhYpH9YVUySL+N8QB9tObB8aBGRrj
         GO/r42yv9+oVqwdXCn4TCtssJAmeXdOnU0+csmumF8qT+tk0w5eVyWo+dhfi1+nPmV0O
         5ysoiT/UOr4+DGA0KuHJC57GCMJdCE/K9HfmFBpu3/ta187I/AANjf9w2Vq1hN01lkIe
         IM1pjtmJ4gKgdBQ7669rxZRXE58VNpID/4tUdTJi7NVBVJ5DF23fj3avscf7uv37t8K8
         6+Ul12DSJaJrEK9hYIf+jma+ED552bczWwiAdDfQ0mO1aU5I77qvPi+ePgWhppegLdRd
         dzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782666424; x=1783271224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7tZqL3y1dOgTp1mPIxTFcmNs123y4a3Qb20/7Lp4iY0=;
        b=gGYxzFDYWttDo79dAv7dTMw6VLYtrWGr8kyrPoqr/ERymrc2rCamzqjjQI70zRWACm
         R10AjuwQpFzdx4KzAgXtNRdkCUNdg6wn/Ufevx4zvo5mSPwtrTFNCRjF09T5auaP+BCw
         ExYCwbhpOfezxvdGgRRICVhYw3DoT4mGGmFPGs6cTIvkGaOGBRQj1TwOXcaMLgHC1UDH
         zESjnH1pOAMPJTve1GR1VczIgc2qGKyc2n2cddbJ3hNvhueH7dSL6Vnj3TDbIbRf2dmV
         LEu4X8RJ+Qw4UzDbLiiODlSVdjUefTg7ZEEhjpy5KPXKrt+gVQ76XjkT9qcASEuWTsVu
         Gw2Q==
X-Forwarded-Encrypted: i=1; AHgh+RoLRTU4U766Yn3T/zXXKDIcXwGhdz7N1cAIrz3+5vVE02Ap1Djd4IbUAckddnyeyxCR8RQScjpJNg8257yfRPMR@lists.infradead.org
X-Gm-Message-State: AOJu0YyGcyIhQc6QngoD0TQBPmFeMSkEzuO0dfcxSA5CuOSzx8XK6dmS
	GUkq8uzfPsfg37wxfPNDcjaC5JELGzzmo5U1xeTuIf5Lsh5Q4mBrqpTs
X-Gm-Gg: AfdE7cn1VHhtIuJwBel6ZrVUAp8mV8sCG+55qC89kc+lGplCnejqM3lhE433FtiW9iL
	9Xx+/9QIfJZI2rzxcQt1NKCFntbZu67UPYk8rSoknV4aoZuo+tzKN+/s854lUm2utW2aczRd4zb
	3szKse5T5jDLeizQg9fUf3uw7AhwqxR/O2TvHRrDpwWZgsukmYVYnnf3tJdeKIILtiWLOHiqR9W
	favYhw31sj7bniTiw38YmGUn3wVFrzAUmrZLWD2c8p/L4hR4YA45ulmAa03tiIEEF0N/ZADLDax
	MPauYXt6L6qAIpuMW3owRNrPC9qt7GXNgaA85z/aDSj9h79Y6QIiHmN0SHasrjCVEnVn/HhZRI0
	RMY+U1T4Eg5yWDseEt/bqmHYiNRkD7uPiTXeT7z+OWLUQSNYmAvOphTPRF58sMMxLcUvBmTNqSx
	1OmJDDI3QjZ7z4fueHFB1xB87GEqpahzrKqH1RPZp12F92KijMA9KKDg87Ao0FimZwk6T+mKbxb
	pC0oT6aW6Bg+Q6iTb95dKHfy/Qcp/m9KKQm
X-Received: by 2002:a05:600c:4e45:b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-4926f6ffa8emr135782035e9.37.1782666423657;
        Sun, 28 Jun 2026 10:07:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493a7fd1b0fsm54217195e9.1.2026.06.28.10.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 10:07:03 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 3/4] arm64: dts: am62p5-var-som-symphony: add touchscreen support
Date: Sun, 28 Jun 2026 19:06:48 +0200
Message-ID: <8c1c298100af75da363ec03126c31fead6dba947.1782665899.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782665899.git.stefano.r@variscite.com>
References: <cover.1782665899.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_100705_713070_23A3E817 
X-CRM114-Status: GOOD (  11.25  )
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

Add support for the capacitive touchscreen on the Symphony carrier
board.

Describe the FT5x06 touchscreen controller, configure its interrupt and
wakeup pins, and mark it as a wakeup source.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
index 5ba4ed56755b..5c41647ff43f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
@@ -293,6 +293,21 @@ &main_i2c1 {
 	clock-frequency = <400000>;
 	status = "okay";
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch_pins>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <16 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -307,6 +322,12 @@ &main_mcan0 {
 };
 
 &main_pmx0 {
+	pinctrl_captouch_pins: main-captouch-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x01b8, PIN_INPUT, 7) /* (E20) SPI0_CS1.GPIO1_16 */
+		>;
+	};
+
 	pinctrl_extcon: main-extcon-pins {
 		pinctrl-single,pins = <
 			AM62PX_IOPAD(0x01a8, PIN_INPUT, 7) /* (F25) MCASP0_AFSX.GPIO1_12 */
-- 
2.47.3


