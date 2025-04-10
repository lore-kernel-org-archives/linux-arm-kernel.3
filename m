Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83D7C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qLNu/KtHI93/guQuNVzwPF3GfmNF+H57zE0YS1pFGc=; b=BUggXe47pKch6IrGotvjR0hUVj
	sjX2zpOJZz4StI5W5V8eYDUqy16D5fJuzv5ci6iSZtu0h6yS4ZoinjNvRe7aKVQ4gsgiCoIaQmqvp
	ju1jGzTtWUIW7MYQtrKwLPOSeoVq5F8A8eq8xFu+jB7mEtfjKLhdTsqPEGeBxi6ed/7kY3aIWkh3m
	YsP2X3zgWgTBtYms+Z5DTVA6rj/aK/GRCOEANtSM24Yoe/usUUb/PUbZ67IPNqg5pdTNYYjnygMts
	57Q/7qdBj30Y6LeskMgEyH1ZPw6wAJVI8caRp1IunAgnjCSpMlr0LkNCWnTc4dvqucNGcUShQWY9p
	tzpuTdjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gVk-00000008uX1-3Z9A;
	Thu, 10 Apr 2025 01:15:20 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gGb-00000008sCU-4BQo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:43 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c560c55bc1so31397585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246780; x=1744851580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qLNu/KtHI93/guQuNVzwPF3GfmNF+H57zE0YS1pFGc=;
        b=VEUvvAQcCbCB3KV8/CZgvNcFa/54tpoFtmlZ2vbIvVlOChHdMT+4toHvTGog1Yjqqv
         XjAI1skefzWR0TJTqy2YBKs8w/NwiklM/XAmDCc6r9OTv/Oqzw8FwtMLHsknq0PeuZ21
         5thGcCIwCxb/y5O1G88pLXGjuWm7YOLMwUTvDdmOlDyCyoQFNJygI6evNoxDswG32e2E
         5L8DcxI4GLXll3glpcQGJKyLZz7KD/1v4jXdK/odE0JyfQ19lMwK7tuAe59/UBXWzSKs
         Zu3lz+UlH1wnp2v9203V/kelJc+W1/uD+zM3RhoYyQ2WWMmg9BFhq4EY6m/HHwTVeLvB
         u/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246780; x=1744851580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qLNu/KtHI93/guQuNVzwPF3GfmNF+H57zE0YS1pFGc=;
        b=IloeNSLXiI7GQN2UG+dZMD1sxw3nhcveZK7mIXzsxLPgdiy5eUJsG0fqUC5+ZxWy0c
         AfRwnna7hzAwyZrznxXer19WzWYc2nG0AalS6gaoUgKFAY7mUJU+J8lqpMJcY5Ozg7WG
         kxZFdX7MgB1BDi9kQMs/nIpYVo6m9L1k57u6AHuIZX+CMFwJyiJaaeMxuM4HH+Hj+CNl
         iKfAF4sdTb5HsxC+AzJ5XLVX28Pz70e6EN3P02enkTsMEL6JJooeVFkqcQtPggJ+/8kq
         V6kj12VeTB2R1piK7a+escnf0ZlyHYZWzAd6oeCd0XGjfMtyXguj20DBKuhlC2Ee8ujB
         skMA==
X-Gm-Message-State: AOJu0Yw7UoBdKTHd42Odzsln7VnLjtYuV+583PRrktKunMgFJ70t81mx
	RsCUZ2PVK9t0zKoRctiTVOrZe3qNAotaW+j6Lmz1tHRLA7MU5ixXhYeElg==
X-Gm-Gg: ASbGnctWoKvnbTLQrSdbJHTH2jx0ArAjpaEulncb7swynEou4+YhiUQJiLMec7iTmxr
	fbXt46SztbagnF8rqoKr0nGb+ulE7ZrktKuykbuhdN7aEJERyjquu5aUNBpwXGPa/4ucHniuRps
	NslMpoX2vP6xfjcRuByLrvHPx/JrSS2n8gMxtkyOvIbmS8sxtFtrDQO4kMlS/2qOmRCM5jEBs4P
	pxssYhQyl/HcGkXxC7TN3cUOL/Hcyh074F9nkmeRQA2f8j1JE/HwX9y90igc0NvfsoNggga3AJi
	1A3b5jcIlU86aODHfaJBRHCXAZVEm1nfr8oHwnxX/Lx3iN063xzRPEbVUVZPt7x9CajjPHtUwj6
	SaARESIu0M4W69dw=
X-Google-Smtp-Source: AGHT+IHMaFesdbwBQ/9S3gzd2hrnklop5LrX3XvIYEQehAtXNRnm2BUKFiblv/IXgjxmg3TAsEYK4g==
X-Received: by 2002:a05:620a:3903:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7c7a76bf77emr153611685a.44.1744246780532;
        Wed, 09 Apr 2025 17:59:40 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:40 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: imx8mm-beacon: Enable RTC interrupt and wakeup-source
Date: Wed,  9 Apr 2025 19:59:02 -0500
Message-ID: <20250410005912.118732-8-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175942_033171_5B25A394 
X-CRM114-Status: GOOD (  10.34  )
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

The external RTC has the ability to be used as an alarm when
interrupts are enabled and configured as a wakeup-source.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index ed7a1be4a1a6..8d4d1c86ad71 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -235,8 +235,13 @@ eeprom@50 {
 
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
 		reg = <0x51>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -354,6 +359,12 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1


