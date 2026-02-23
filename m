Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03597EA4FAE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5vVMT1zbuATIKTYy3lzElq9T02DZlHlvtVffec21kE=; b=qYNVxNWwy9Pgu/v7aQpVnZZmPQ
	hzZOr7ygsuCCw8Pgb6cmLprpZpezNpb/eXOFo9vnFLOpYr9WO3r127+oaB5GlaFJkfBXgPP/wwKhh
	nkeOsphJKxYN7TktTffJeMapJ60siT3Mot3xQG5HtNG5KCud2ZGbr/rLZBhKlT3N5F0DQTxum/C7R
	vnpUa5mty92uLUonDbzBG4MnVEYCVoXcn0igG38HFuMNHmiY5zbiGe23iiklHLAzB3NIkH8YB/CoY
	9iUYYRTxDUi0kKinmnyJXllvohRsmALkKrNSUggwYXmpV00FEjwOjKbVkJndUQGOenGG4vd+7h8D4
	CeYLWbag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTwv-000000009I2-0AQp;
	Mon, 23 Feb 2026 11:18:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTws-000000009Er-0zta
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:17:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ab077e3f32so16885415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845477; x=1772450277; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5vVMT1zbuATIKTYy3lzElq9T02DZlHlvtVffec21kE=;
        b=FVFbdISSihETq2FcJBaCMLJ8pDBhfgNdWkk+N04IYuDDC/nvFiIm5pOqPVu16GsOpm
         XZvUih7gypV2Bb0Gbda494o9nG10yZvXEQ1NEcaoknWIkM0U+CupEIi4To1U08DfpRnQ
         rM8wPoakcB1kQ3cnevjCMVmIYTJ5ypX5tuMbPJu/k7QUp8IIP1YfznSz/hiXvmS0i2EP
         6v2yyKBCaVvarZ7GcL/P7zQZYl9Nj9If2pgQSj/+slM1K/150PB1cLQTxrMU9E07NxcN
         Cc8bja+hqFZI2niAr/0ZhpwK5Z0FO2LMqLxTAOrvwRLU7VbV6W0vNd5PsZgYNPtkQqe7
         C0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845477; x=1772450277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D5vVMT1zbuATIKTYy3lzElq9T02DZlHlvtVffec21kE=;
        b=k5Co335JyIvVnXcpPYB+SzBt/hMk1OneCZ8SDzgOVU7g9zrxXMyuZAmEs0IVY6ry13
         ZiM9ppHW0sLiWaAwqtG0O35TusvHCdl/MCV0krugNu2jILhrOO+VCdmCXlf1mJB6iekz
         co3My0mdwPA0TPNerCY0utWsyADUsjCSW11kuzrjpCcs1+c5rmcXsHyi1oCUQD0vHRQz
         C2fU2VEn/KH2dLeAlMsPwUAEOMO1l8nGk0KaFJeNLory/5bad09PQZ9rWfQekqP2ylRj
         LjtHkwdTiTRgqeazhaqptDc/AQbvTC4GNid4n9ApShhWdyeRRRKc6rKBt7ei6T/uAMZ+
         HAzw==
X-Forwarded-Encrypted: i=1; AJvYcCUlGFZloJtkAiak1qP6meed637N8lKWFKyOwdViZEpczAXDgIUeef9jC8Susdn+95BV3qHNjxPnDIRx0ne72Xgj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8NWMIa/jCvvF+tAHqwxS6F05JLzPbmZDpydA1xxSBjR6ahALL
	7WSYyRHpWZZGSN+u43WRiXgwjRgln5D29hY7ATR/L9RnG72aWN9kOSOg
X-Gm-Gg: ATEYQzwGs/PxuvVtuZZitbJfg4PkS3Q5Rk7pcpRYtFj4yOQR4F1nKf8owoSrBStRBcy
	33w8XE40OrysZY+JLsYLBTJvIxK/krN8U89NEzSC1caaDIRiE1QGI5D6bnC0d7rr3GL+tVriQXG
	sis5/ya1dfcoPZon08Y4vAD5BYChIpS2Bwrsk+O9qQpGpunikaSzKpe4+gUZFIgpdrSRJIoKr8W
	vuayMzUzWbhRRDFk/b8j/InKC4XGzdeKcmeRKyLFUhxeuYxIBiQQH9ZxWIJhvhuG0z4eTFXQNLA
	EJxi+ARb0WtW+gR+DcuYzhddjgilUHi+Yf+MFPM7hz9THdnviZ8AZ+UF4iPp4PyZvbR4oRUvBKq
	P+KGmELV1GVKBIo6l/fTVRqsweqwhmyZglQ8y+Tf9Hs6Li7kXnNJXMEMxciXKW2tr2u5RI1swtE
	iHsaffKJ5hKToYY4GJBO36Vzeo55409tlMgRN/52roAHvDdkWbNoKKpQr/zVPO6kyNBjlU3OawS
	E91vRqXC4pOswRsFIpOTGh0cJofkbs2nBM32aYhvq6en4ZjzUgyczSL7Bz4MRgrJdiglz0GGNeh
	d+mIO9ENftjmpNklkzDq
X-Received: by 2002:a17:903:1904:b0:295:5132:1a99 with SMTP id d9443c01a7336-2ad74579492mr68714575ad.44.1771845477264;
        Mon, 23 Feb 2026 03:17:57 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:17:57 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:38 +0800
Subject: [PATCH v5 6/8] ARM: dts: aspeed: yosemite5: Add power distribution
 board IO expanders
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-yv5_revise_dts-v5-6-fc913e902488@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=2527;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=XhvT0QVqfubc2SFF6jrDcroi321rW0noJl73B6I6iXc=;
 b=O9OnQ/chzEMf/fvHPQWK4maR7cBtWJhmUprWi2xvvAQHfu7EDK1fmcNdRzjOSF3QVoZVZK+QC
 WQ/rCXtpalDBcJGTTwGoiS/y0QJ81L4P9kiJl4xJ4N7dW2ctbdTUDCP
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_031758_286001_B3B24129 
X-CRM114-Status: GOOD (  11.83  )
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

Add device tree nodes for the two IO expanders on the power
distribution board (PDB) in Yosemite5.

The updated hardware design introduces these IO expanders to support
fan presence detection, hot swap controller (HSC) fault monitoring,
and PDB CPLD update status monitoring.

Connect the IO expander interrupt to SGPIO92. This pin was previously
named ALERT_PADDLE2_SMB_N and was unused by the system. Repurpose and
rename it to FM_IOE_ALT_N to reflect its function as the PDB IO
expander interrupt.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 42 +++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 524597a81365ef10cd03b67d35eeb88a965cbe0a..30fb41fdaeb7a2276cdfe98654696a16cf1de5fc 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -389,6 +389,46 @@ adc@1d {
 		ti,mode = /bits/ 8 <1>;
 	};
 
+	/* PDB IOEXP0 */
+	pdb_io_expander0: gpio-expander@24 {
+		compatible = "nxp,pca9555";
+		reg = <0x24>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <92 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"FM_P52V_AUX_FLT_N","FM_P12V_AUX_ALERT_N",
+			"FM_SLOT1_HSC_FAULT","FM_SLOT2_HSC_FAULT",
+			"FM_SLOT3_HSC_FAULT","FM_SLOT4_HSC_FAULT",
+			"FM_SLOT5_HSC_FAULT","FM_SLOT6_HSC_FAULT",
+			"PRSNT_FAN0","PRSNT_FAN1",
+			"PRSNT_FAN2","PRSNT_FAN3",
+			"","",
+			"","INT_SLOT";
+	};
+
+	/* PDB IOEXP1 */
+	gpio-expander@25 {
+		compatible = "nxp,pca9555";
+		reg = <0x25>;
+		interrupt-parent = <&pdb_io_expander0>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names =
+			"SLOT1_CM_UPDATE","SLOT2_CM_UPDATE",
+			"SLOT3_CM_UPDATE","SLOT4_CM_UPDATE",
+			"SLOT5_CM_UPDATE","SLOT6_CM_UPDATE",
+			"","",
+			"","",
+			"","",
+			"","",
+			"","";
+	};
+
 	power-sensor@40 {
 		compatible = "ti,ina238";
 		reg = <0x40>;
@@ -937,7 +977,7 @@ &sgpiom0 {
 	"ALERT_OC_PADDLE2_N","",
 	"ALERT_OC_PWR2_N","",
 	"ALERT_OC_PWR11_N","",
-	"ALERT_PADDLE2_SMB_N","",
+	"FM_IOE_ALT_N","",
 	"ALERT_PWR14_SB2_LEAK_DETECT_N","",
 	/*bit48-bit55*/
 	"ALERT_PWR14_SB3_LEAK_DETECT_N","",

-- 
2.53.0


