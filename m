Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF3DD3CCB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 05:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/7mz0mXjXA2DXkjO4TEuV+xqnNTQ2wbsC+8nrLSQPI=; b=bH260RYzEBijOhrArvFz/UkPZY
	oi4kQZoVLgyyw/RfPqhc+hLAOW004eIXLinltouFZS4GHSpiwv6vgUIvWMNtUFbVmNjTJXki7DQmG
	VoTZKZi8f7WF4uVXs8jLU9wJJFUOI8lDhrTDBOP6sj+N3f2OB2QK3PcfQoYiIRKM+alSeH1fRxSFv
	rlTfLKSnUh8zIMH7zdMirj2q9XXaWp/ZxV/pfggK9hLF8bLWPEIAcOM2CFSYstz96XZvkauBjSBPP
	z0u9IViK+5hBaiLud4fj5doTL3FuRHHYNST3V1jADa+dJfxoZo9hEbP8n6skkw9IHaWTUEmhEBR/h
	qyWWEHFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFxP-0000000Bo07-26cq;
	Thu, 15 Jan 2026 05:31:43 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFxH-0000000BnyZ-2ys0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 05:31:36 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-646b8d2431dso403396d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 21:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768455094; x=1769059894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/7mz0mXjXA2DXkjO4TEuV+xqnNTQ2wbsC+8nrLSQPI=;
        b=QBTidHYj4PAWrYFiyT0Dt2E82PoNNfQ5tF1Ko7REOSFGE0/+asOk0iQNojDGInJlrR
         VxPNs8MHaKTwyirjcdJmexnWuY6ThzxGh2547zr6YzHXstSptSHQQAWyus7CpJy7jG/B
         mP/qgthlqaj3pxDkCSa+jFxk7PV1y+UItdGH218MPHI+Tc7NxgN2xPDNnGu+RcEZK2l1
         S5vihs4bRRf2L7oZeEaMEIPyVddLQ5B17uFrttV/h89HfxKXfj2rPKOyvo3VqO4+LfKS
         Fi286qt/j5G2fZdlVpJBsrGS2IigtE6Uy7nmK1dQUrNvwT5By9OG/+l6m28pq9Rs68qZ
         L9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768455094; x=1769059894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q/7mz0mXjXA2DXkjO4TEuV+xqnNTQ2wbsC+8nrLSQPI=;
        b=osd4fsSOzyFk6CAW7etEqlb/cUPzg2YjDSDoOyVvBGVI/J9GMlhkvnyS9qJBPoEeaH
         OGHVyC3gDV+NochTaZ45uUAJ7gOJhRA2HFsuLxx535mDwv+7q5G/w4c4DmgEA3/0RMuJ
         LG73vvQcwAsBtTGp33RvJNg01LEbhRUFwsjZoTQmeLxG1VwdsNypYIGKXxZYUMu7EUbD
         iCCAm2phjXP6WDdsoFKRQ5IxJQfwzxlGSYUrRd1fGFzQbPGOFBr6oL/LxfOhh0lLQwZN
         MduX8nFtDBte/jQBfpEy5hB8KqrKUcWBNXC86lsdK2wcaV/GLnOcBt6jJjgshJiUjOta
         FXnA==
X-Forwarded-Encrypted: i=1; AJvYcCWRxZ1QRbTEIknPXNz4PReSr4qNojHNAQsBS8iOI+eF2rmaZkbzFrV9HG/2JYH6xHyktHtfDu2LO5m6XUy2x5HY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz96uPvXTex//Ypew7lOJGT7e+d3TRQKjumByCkf4AQ62AgYZNM
	d5hWbYVWNNaisQMi11SSnp714DMHrlunIYQc+8bzQfqURr3sXrziVtVO
X-Gm-Gg: AY/fxX7JSyYsqoG9K3gOdtLpLzqUP+itufToWjxU+U11SpafXhDZZezHAUB3f73ZPVi
	WnWnJ/9iYldxahNxtVsRjlxCcN4xAj1ouvhWyrzxGzURnXzsQ4Zd+Pkz+XUlZX04kqa66pxnd+0
	dheJAdQZhQlyIjSZ2N5WhY8SMZ5W7bOgwwPt5Y+v5RuZLvVG0FFd/gAK+6VinOJ1QbkKyzM0Elk
	aqeEkFYoHaBHiZ25YrEZalZkJICg+h4oApQ5dX5j7X2KA1/4i1aaZ0ij6QszL9clRZivJWWYSCP
	WddyiSI86LLGb6zz2O86tgelliyPtT/5odLgLjPJptuVhVL2jgk13dpk+HJDeC/vrR3gKCyVytw
	vx8CeVNrUk6/6Zv+FlB2Ouxq2p4jq6jB3MKZkP/s3fIUT+wO5KzJdhnib9dA3ZqkYxYI86Kfn8R
	ZVO2/n
X-Received: by 2002:a05:690e:1341:b0:645:5cb9:dbd2 with SMTP id 956f58d0204a3-64901b0fa1emr3887933d50.67.1768455094381;
        Wed, 14 Jan 2026 21:31:34 -0800 (PST)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-790aa553172sm99259437b3.11.2026.01.14.21.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 21:31:33 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Wed, 14 Jan 2026 23:31:08 -0600
Subject: [PATCH v2 2/2] ARM: dts: aspeed: Add Asus Kommando IPMI card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-asus-ipmi-expansion-card-v2-2-12b72d20a9b9@gmail.com>
References: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
In-Reply-To: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_213135_816073_782EC0BA 
X-CRM114-Status: GOOD (  13.12  )
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

Add device tree for Asus Kommando IPMI Expansion card, an AST2600 based
PCIe BMC card.

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
 arch/arm/boot/dts/aspeed/Makefile                  |   1 +
 .../aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  | 117 +++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
index 9adf9278dc94f84653775296c93150e61cc99328..f599a3e61dd1ae69a133f2b9ea3a90da699f2f18 100644
--- a/arch/arm/boot/dts/aspeed/Makefile
+++ b/arch/arm/boot/dts/aspeed/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-asrock-romed8hm3.dtb \
 	aspeed-bmc-asrock-spc621d8hm3.dtb \
 	aspeed-bmc-asrock-x570d4u.dtb \
+	aspeed-bmc-asus-kommando-ipmi-card.dtb \
 	aspeed-bmc-asus-x4tf.dtb \
 	aspeed-bmc-bytedance-g220a.dtb \
 	aspeed-bmc-delta-ahe50dc.dtb \
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
new file mode 100644
index 0000000000000000000000000000000000000000..ab7ad320067c1ddc0fea9ac386fd488c8ef28184
--- /dev/null
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+// Copyright 2025 Anirudh Srinivasan
+
+/dts-v1/;
+
+#include "aspeed-g6.dtsi"
+#include "aspeed-g6-pinctrl.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
+
+/ {
+	model = "Asus Kommando IPMI Expansion Card";
+	compatible = "asus,ast2600-kommando-ipmi-card", "aspeed,ast2600";
+
+	aliases {
+		serial4 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial4:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-fault {
+			gpios = <&gpio1 ASPEED_GPIO(C, 5) GPIO_ACTIVE_HIGH>;
+			label = "panic_amber";
+			panic-indicator;
+			default-state = "off";
+		};
+
+		led-heartbeat {
+			gpios = <&gpio0 ASPEED_GPIO(A, 7) GPIO_ACTIVE_LOW>;
+			label = "heartbeat_green";
+			linux,default-trigger = "timer";
+		};
+
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: video {
+			size = <0x04000000>;
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+};
+
+&fmc {
+	status = "okay";
+
+	flash@0 {
+		status = "okay";
+		m25p,fast-read;
+		label = "bmc";
+		spi-max-frequency = <50000000>;
+#include "openbmc-flash-layout-64.dtsi"
+	};
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*A0 0*/	"", "", "", "", "", "", "", "BMC_HBLED",
+	/*B0 8*/	"", "", "", "", "", "", "", "",
+	/*C0 16*/	"", "", "", "", "", "", "", "",
+	/*D0 24*/	"", "", "", "", "", "", "", "",
+	/*E0 32*/	"", "", "", "", "", "", "", "",
+	/*F0 40*/	"", "", "", "", "", "", "", "",
+	/*G0 48*/	"", "", "", "", "", "", "", "",
+	/*H0 56*/	"", "", "", "", "", "", "", "",
+	/*I0 64*/	"", "", "", "BMC_RSTBTN", "", "", "", "",
+	/*J0 72*/	"", "", "", "", "", "", "", "",
+	/*K0 80*/	"", "", "", "", "", "", "", "",
+	/*L0 88*/	"", "", "", "", "", "", "", "",
+	/*M0 96*/	"", "", "", "", "", "", "", "",
+	/*N0 104*/	"", "", "", "", "", "", "", "",
+	/*O0 112*/	"", "", "", "", "", "", "", "",
+	/*P0 120*/	"", "", "", "", "", "", "", "",
+	/*Q0 128*/	"", "", "", "", "", "", "", "",
+	/*R0 136*/	"", "", "", "", "", "", "", "",
+	/*S0 144*/	"", "", "", "", "", "", "", "",
+	/*T0 152*/	"", "", "", "", "", "", "", "",
+	/*U0 160*/	"", "", "", "", "", "", "", "",
+	/*V0 168*/	"", "", "", "", "BMC_PWRBTN", "", "MB_S0_DETECT", "",
+	/*W0 176*/	"", "", "", "", "", "", "", "",
+	/*X0 184*/	"", "", "", "", "", "", "", "",
+	/*Y0 192*/	"", "", "", "", "", "", "", "",
+	/*Z0 200*/	"", "", "", "", "", "", "", "";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*18A0 0*/  "","","","","","","","",
+	/*18B0 8*/  "","","","","","","","",
+	/*18C0 16*/ "","","","","","BMC_MLED","","",
+	/*18D0 24*/ "","","","","","","","",
+	/*18E0 32*/ "","","","","","","","";
+};
+
+&vhub {
+	status = "okay";
+};
+
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};

-- 
2.52.0


