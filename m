Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD8DEA4FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2a5/NI1b3Xz62eOwxI7HWvsJZmIoYETpiMrjetxhsrM=; b=GNvDbqm4TeLIy+CzWedjk/jt8r
	49R3UjudUEx/6+EEfnlEw8K7o0SGk0sWaJKqaFA1nhCkrN0Vrf8Wl8WYy2LB3oAU32+/gyoY6H9oU
	o36Z7HKgRKoJA5Uk8OUBzHr5Ie7486nxc9FZljDmlaPA2obSj/Q2GMlUCQ5IrfL7XZF1rGPvF0kWW
	smIabbKlVWxjcopXiyT92EIYRqxFkO4W5Atgpb95GgGl8kcrQzvH/3af4ua5w8YCz5Jww7p7C6/nv
	aLntAvZgD6Y17xw14xjBZTl6lr24TDNSQtd0nTCe6oRbJ78RuudMGOfzvmPLQXohODIrgheTL54Pq
	kFm6Z20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwu-000000009HL-2OMz;
	Mon, 23 Feb 2026 11:18:00 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwp-000000009Bf-1Eld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:17:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so1787835a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845474; x=1772450274; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2a5/NI1b3Xz62eOwxI7HWvsJZmIoYETpiMrjetxhsrM=;
        b=jfPbHZR3u2bC19tI/2Rvr11Tbc+g0dl1j96RcD+msrzX+q8nFFQDq16bpDjTxWp9GR
         uqvPiTzcJcAOmhlYheNeXgT6ds1bzYxIm1N2oXegbd17MgX7GoGVRfcYW0te1ruqPOTO
         v7YOV5atAiEsudWYD9p28r1k512/c5aTypepveJLYZd9K5eBj22c+C2XTKzMBihgkVpC
         JxDW1XeHK1ssbNHMg6/6ZoJRPkMByXI4i4RC1Vg4kLlsIDq69P3N4bk+gjhx8np3LcnC
         vdxlBNzqZa6YUGnQFbd8+Ga17XgvnG0SOBGolU3g8NqVmxvxQrMkT9PL6qz7ZT6ujX2W
         S9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845474; x=1772450274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2a5/NI1b3Xz62eOwxI7HWvsJZmIoYETpiMrjetxhsrM=;
        b=qCJk83NKRPH/pXv+ewShDgb8/B4LyoPAhVqxC0M6lmAeJF2RWaxiN5LNrqcvRELHDG
         7LRxCvq+IKNySTEw8GszKaP+/LXvfpqyPf05d2fglxfoX5INpVRjBaa6oi/3AYfAh3Eb
         0MdAbwUzvodaUu8hEy8TCpz1kVoBbbIa/mDtpqtynCADqrNu6KP73FWE0Gq0tp0QT9jt
         Yi0JA+uA1hLuAhRFva2UVXGmW8eF10uGKI6JVMQ4e8zV9gvtx3QsUuOLn+LrzVYx7kVV
         rqQxygfEh3SxiMVAG8O1T9XEK9IwIeaVp5veP5LfvNMloeIxEVBGX6BOZSX8vOn1yp/u
         t+mg==
X-Forwarded-Encrypted: i=1; AJvYcCWe5nhL45X6MnGxRr+4sknBSNfYjlbc1e9x90XZqkUHiqYm7GWf065B2fQdOBmT+YINhk2VhbVUczcJ900ZDJ9E@lists.infradead.org
X-Gm-Message-State: AOJu0YzHcSj9psod5/bZ4Vr/NItBXMDv9DH+bsnkjU4UP1zqf1AKZemq
	q0XCCex5xEH3i1Q3J+1qGA6I4w9Euo4PiUlFCjwicKMbvYlspaBa3bby
X-Gm-Gg: ATEYQzyCwEIQqqtWgnLuS3TKCC7LJ/wK+5AaLed7BKywuS81bmh89K6jHMRXUib5X5d
	8pw2F2hUaLNlhBc5rr5Ex83qJx4BSOCAwMC76bzkcy3UA0MpBPS1zD+FbMQJYGap57pjHLMu1bN
	EItQFkBaWTMRUr+NuSSV9UWB6bRtAL6NODGgg/gCl0BQ1q21rZ7FTK5JU5KXQYJ2kcJ0m8AvvHY
	4zQtY4G4LaL07yfrApFO8y76lDSOKe/KrJe8uKdxbseetysVlH1tM/dgUgVgg3g16vmg1Q7Upqv
	9istYae7dMtXHRtPuJjd4gTADuPZq5X1DcWj0nbvCLBjM+GPqwRjrxaRsYtYLFN91WNVoEXYnu4
	QHRZrD5xFXmKwS1vvsNNXOfHo8967BMamar4UzrfzwTcHrltfgB1wa/wUvCnzxRhjHuBw5V8Pfh
	ggUJi7cMl2h4lx9Ya39cvPJ4syQA2fnc5CU1Ub5nXkcekHAZDt9a0uQc8Nb0a3qLdrzBxRuMadG
	RZSp1apcxDYzkKILcMyhFnVKya8gad8Sn00iIU2tUJ1FSFWU/p8lxF79Lpl0et7FRTBNboLo39y
	dfUG/WUL8ZfPmQ4Lr65i
X-Received: by 2002:a17:902:e5cb:b0:2aa:e55b:22b9 with SMTP id d9443c01a7336-2ad7455429dmr80003975ad.41.1771845474242;
        Mon, 23 Feb 2026 03:17:54 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:17:54 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:37 +0800
Subject: [PATCH v5 5/8] ARM: dts: aspeed: yosemite5: Correct power monitor
 shunt resistor
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-yv5_revise_dts-v5-5-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
In-Reply-To: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=2405;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=ixqQRGuzXvJ/yWnzkJIxe9zfdUzHdt5VjvjnntBpEuc=;
 b=rEG1ITCj4xw+8LHWUtz1K9lRGjkpb8uwC29tFg8vEbG1Nztv83RRuY/28KwaccWv+E5EDN7a5
 F7DDcO4w3mXDyQTbjKx+NT2Tdcr3zsA7eLpOO8wKtZtuwQUbVucA3m2
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031755_349361_8F3882C3 
X-CRM114-Status: GOOD (  12.27  )
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

Correct the shunt resistor values for the power monitor devices in the
Yosemite5 devicetree.

The values originally defined in the DTS do not match the resistor
values populated on the production board. The discrepancy was caused by
using outdated pre-production hardware documentation during the initial
DTS development. As a result, the power and current readings calculated
by the driver were inaccurate.

Update the DTS to reflect the actual resistor values present on the
board so that the reported power and current measurements are correct.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 84d3731b17f7c7c87338672bbcc859de2b89b722..524597a81365ef10cd03b67d35eeb88a965cbe0a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -415,7 +415,7 @@ power-sensor@42 {
 	power-monitor@43 {
 		compatible = "lltc,ltc4287";
 		reg = <0x43>;
-		shunt-resistor-micro-ohms = <250>;
+		shunt-resistor-micro-ohms = <100>;
 	};
 
 	power-sensor@44 {
@@ -461,25 +461,25 @@ eeprom@57 {
 	power-monitor@58 {
 		compatible = "renesas,isl28022";
 		reg = <0x58>;
-		shunt-resistor-micro-ohms = <1000>;
+		shunt-resistor-micro-ohms = <10000>;
 	};
 
 	power-monitor@59 {
 		compatible = "renesas,isl28022";
 		reg = <0x59>;
-		shunt-resistor-micro-ohms = <1000>;
+		shunt-resistor-micro-ohms = <10000>;
 	};
 
 	power-monitor@5a {
 		compatible = "renesas,isl28022";
 		reg = <0x5a>;
-		shunt-resistor-micro-ohms = <1000>;
+		shunt-resistor-micro-ohms = <10000>;
 	};
 
 	power-monitor@5b {
 		compatible = "renesas,isl28022";
 		reg = <0x5b>;
-		shunt-resistor-micro-ohms = <1000>;
+		shunt-resistor-micro-ohms = <10000>;
 	};
 
 	psu@5c {
@@ -723,13 +723,13 @@ gpio-expander@21 {
 	power-sensor@40 {
 		compatible = "ti,ina230";
 		reg = <0x40>;
-		shunt-resistor = <2000>;
+		shunt-resistor = <1000>;
 	};
 
 	power-sensor@41 {
 		compatible = "ti,ina230";
 		reg = <0x41>;
-		shunt-resistor = <2000>;
+		shunt-resistor = <1000>;
 	};
 
 	power-sensor@42 {

-- 
2.53.0


