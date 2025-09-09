Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACC4CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqkLiWItq44+h/R1+EtYWkRm5AyzksHBQoJeAh9biR8=; b=TaBFMDw5trFFwCZnL/BfeJ/5jL
	dwlUdfwtcjqrx2KhaOQKN9PqxTIgtGpW1N546Oe3vZISxG1gz8aybhtNrCj4CaHaq454PDAvQLQFc
	l72sxNHCvcOdn9VNHN0P4QpzWVK6rTxQdUIJj96ESgEhSPqLuqUaF1liLXCljFOiZxqm0YtbUjZSf
	/cyh0tABN6Ew83JcBK8hVjuqVhIq3HOrkz8ze3/PV8kZt6RIf0G8yx03cQXBWzXsbZn8iRnkwnt17
	C6fRSWzS7CrpQSmGMtPaJOidk/1/Pa12lx8YZFwYJfW1RCVzIgYgYciwfwyvtSXH6vab1YTbA1bdI
	RTwHS6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Ug-00000008Czc-1CE7;
	Tue, 09 Sep 2025 15:42:54 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvLH-00000006Hu7-3CNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:12:53 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so3752157f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 03:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412770; x=1758017570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqkLiWItq44+h/R1+EtYWkRm5AyzksHBQoJeAh9biR8=;
        b=Lx+0FpbCBaiTWWthICNfrTCUsAW25Q8KZ/t/GGeFz32VP8W9m9lTuaUkqZ9ZuHzytC
         dPYXxavBV3nfqj04iDK2QNJ9UHHyQdevg0rUgm/n0YJKa1MOVMPrQIElp/l1YmORmXWw
         aNMYCmGb4MFtaL18RBxsO+vp/L80TkWNEjogu8v0krQov1+TCBsQ3Flup0twXfWTc1AW
         PxSQMGQtldex6aebtORj/EF5bdFubhgSkZShQI554SHsZfheY0/Ay0QRIZ/ODdME92IV
         fi77v/8YY4OaqoAcZuxQNPfraTIdUV7PAMPLcPN5jD9/7wp3kLA99zw7I5WmzO3bwMZd
         GLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412770; x=1758017570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqkLiWItq44+h/R1+EtYWkRm5AyzksHBQoJeAh9biR8=;
        b=Zi1uy35ShnTZWCLMCasBzN0mfSfQ/k+DgHi15WiMe71duL/PjXuud7Vo+v4eyQtFJV
         95rtZPKWsv7ZB2b0FGAgfyhZjcqSsDMuNNpRPHxkgcTbp5kWAITbdS7rMSz/gPnzcsG4
         ZOmGlfyxrCtnZV9cmqOILiv6luM4LT7g1A9FI6ZEGSRRnBfwzNRtil9Gv7B7ymf41P+q
         naANTq1XR1i1qnE9vBTJZnPjsZOS9nw4IoC3X2jVfUBmpYB/4/0vVRfVnBt5N6Czf2AR
         vNH8Abb2OAMZ7P7bM9+2dvKoru6nihnvXOgcK/8MPBNiCpskkNOYJgxVbSfJgVDEecpL
         f92A==
X-Forwarded-Encrypted: i=1; AJvYcCWqC9emA+fVcvJZQL6mmJP/PtMP7aWwAMXE3VLQ+Q8Uu4Eo0egeS6iV++6fOAna2v0BTOQuXJas1pUYaxcSxTju@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk91EcQlCyO5AjUwAAMQeKIHdTU+kYLeFTpMemLXr6LwodwfuS
	q2CF4j87JbzjKxGjB1yZ59ltpfHZekRmrhY/7R3RJd8m1JGFc50Gb+Vc
X-Gm-Gg: ASbGncsp5M4OMdoqFn38C318vdV97xkVCnOCJyGTQ0c5Vxmty4mUBmIHcVITMleCufh
	IhabsnR+KAgQKq2QCJhocxY7KT+ygxvJrqzbxh4kAZnMf8gY4IAlO2iM/O+PrwlX3nc7DvhdlPY
	tWoD3tywEnYNEurf9QwqMdandGQqtVMNPQgAlCgSw6kaVLZu7TdeblmPsHhuF4zMHTDpCdzEvHC
	LJ+Q/wH9UmXMP1TEfsgSObILmlGO84DNofpXRW7w+M34ZbXErctqUtZ7rc6lJBDgLTez2W3C1xF
	kEZeN+ILGmH85dW2CtYc+icKok6yR5zw9kTEPnMcDEiRkEDier2b3eyYJHLAJmnGigQ1Lqs98KA
	64D3B1T23W26WCEahSSghUXDjwM9F7hJlM6KcA+OtJb7/CfiYvKY/NAFeX+qCwpuelxB/RPO6Rp
	/zCm9KJSqOYYEDM0eNiUBa7W89TQ==
X-Google-Smtp-Source: AGHT+IEb/Uh0bOqYUD5CpTPjyWpptnA7lRTRp1bQevh63jpbLTzKsCg28IzONQcxTOeXGoqoY9SRmQ==
X-Received: by 2002:a5d:5f92:0:b0:3e1:4d93:5580 with SMTP id ffacd0b85a97d-3e643ff64ecmr6456919f8f.37.1757412770106;
        Tue, 09 Sep 2025 03:12:50 -0700 (PDT)
Received: from localhost (2a02-8440-7136-74e7-5ebf-4282-0e1a-b885.rev.sfr.net. [2a02:8440:7136:74e7:5ebf:4282:e1a:b885])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521bfdbbsm2111014f8f.10.2025.09.09.03.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:12:49 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 09 Sep 2025 12:12:26 +0200
Subject: [PATCH v6 19/20] arm64: dts: st: support ddrperfm on
 stm32mp257f-dk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-b4-ddrperfm-upstream-v6-19-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
X-Mailer: b4 0.15-dev-dfb17
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_031251_877737_4117D5A2 
X-CRM114-Status: GOOD (  11.52  )
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Configure DDRPERFM node on stm32mp257f-dk board.
Disable the node as DDRPERFM will produce an error message if it's clock
(shared with the DDRCTRL on STM32MP25x) is secured by common bootloaders.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index 45ffa358c800..81b115280bd4 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -84,6 +84,11 @@ &arm_wdt {
 	status = "okay";
 };
 
+&ddrperfm {
+	memory-channel = <&lpddr_channel>;
+	status = "disabled";
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.43.0


