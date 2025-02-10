Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07889C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOXZ6StvK/G5fI2aYxY8WNzkMCVl8y5FE1SksnewfaM=; b=JHB2w7eD+nn13DLc/7S2g864eC
	ffq/d3b8dWP7b0tXJ5TAHInDrcQtW7VqgwApBK7k/7VXd9yhiyBA7R5K8eaRd+afS5bysRI/PSc9k
	n5p4rBRvFUFloILjN3eLM4zbrJ8gF9pjidtxkitC/y+1o+GQDo8AuHXpoIdPXB6syi0k7r9RxAkZz
	tIub/7nfkeqAkB1WWNfXXWRV+Fhm7kpKGHH/WBbvirvGA0QDGlVtCgBq2M9/FUBR6eMtEjz/7G+fL
	3zQr0JdujgcQUszlNxF7ELKFgYPnxFfhYMAg7NmsO6Yuva+CTXJGHVCHJ6+w0FjGhkH2XDJ7vOESk
	8iAoYMaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbYD-00000001Y0K-08CT;
	Mon, 10 Feb 2025 21:42:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thb6b-00000001SUk-16Ld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739222053; x=1770758053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=unETEqL21PPGjcJ+5ThZ5Xx9TlKma2kepF5jLOEMdPY=;
  b=GmrDiY1cra0uwxRDJHxDvzEk+LBvcaIH8rLsDnV7PDzM37iTSJjZtZpk
   FTjWG+XLuH1F2Z9rWmslRtD9F5hRL6JLyWKb3UxansDW+EnFYjpN/td2W
   4qFiAFqPA8qaJ+Up6clLsE1HanVOf3sOPJ7ZNqS/KmGqDtWuhQt8uE33i
   0kHNG2XN/SIIbT5xWY13d8DJRYkcAmhpIPaSiRf+Vwvc7PiiSIfe63MYP
   JInQXrLU5ib5aU7D1p3GjJwfWQiBKRJaINovZuCvJljy7/6wl+fp1huSx
   rOdimuPWbll8hdYfVbxj8N6RoQ419gdmWSi1QPJq8l17Q7iUvmK79UQji
   w==;
X-CSE-ConnectionGUID: AYqW9AG9RbOJ2Xf8Pt97Yw==
X-CSE-MsgGUID: 0agEuR3bS46pa3Vj3mw/1g==
X-IronPort-AV: E=Sophos;i="6.13,275,1732604400"; 
   d="scan'208";a="205027996"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Feb 2025 14:14:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Feb 2025 14:13:47 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 10 Feb 2025 14:13:47 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v2 15/15] ARM: dts: microchip: add shutdown controller and rtt timer
Date: Mon, 10 Feb 2025 14:13:15 -0700
Message-ID: <709f5268da63c123cc4eee9e47875324df81c454.1739221064.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739221064.git.Ryan.Wanner@microchip.com>
References: <cover.1739221064.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_131413_362335_7E2ACC28 
X-CRM114-Status: UNSURE (   9.26  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add shutdown controller and rtt timer to support shutdown and wake up.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../boot/dts/microchip/at91-sama7d65_curiosity.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 0f86360fb733a..d1d0b06fbfc43 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -77,6 +77,11 @@ pinctrl_uart6_default: uart6-default {
 	};
 };
 
+&rtt {
+	atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
+	status = "disabled";
+};
+
 &sdmmc1 {
 	bus-width = <4>;
 	pinctrl-names = "default";
@@ -84,6 +89,15 @@ &sdmmc1 {
 	status = "okay";
 };
 
+&shdwc {
+	debounce-delay-us = <976>;
+	status = "okay";
+
+	input@0 {
+		reg = <0>;
+	};
+};
+
 &slow_xtal {
 	clock-frequency = <32768>;
 };
-- 
2.43.0


