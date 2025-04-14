Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AFCC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 22:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D15NreMI6+h9vGKq5BYX5zq8vLplidhcd0ZnFulD/4o=; b=AEnEIvYLUWNh4QIXqW254hdqP9
	a4tHTkn1ufpquZvQeu8OxUUrPg9kaGarn2mR6uMGo5IAfJHzmggiMUD3KxFP5Vkoket5QoPBQmVa9
	qZQ09VlbY4sr6F0Y4ToPH9dA1xMS1UOuBV4YjO3cDocbReGUqzTX/yUKNjxCbCDCihm9jET0kWl9K
	1W184rG5eUo/YU3FrtTFZUE0u2SNBsG2KjXtxyrMM5snbUD8YUc/W2Joc3JKtALAfYfL8Xv6VPk2h
	40DIc/8/yfNh8Y2zWfMu5aGKgJaCk7eqCUNdJqE4/jxiIKqQDqUTQ4nSAPSn8/sx57qDjaKo9gdN5
	R/hBkerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Rw7-00000003fb5-2s0f;
	Mon, 14 Apr 2025 22:05:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RZ5-00000003afr-3Rs7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1744666923; x=1776202923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cp3KlP5kz8uShLGylSzqchQUQS7t4AEaR6YGK7e5dDw=;
  b=nu+AyShL8MQJhbuAQ+71aubob+c9QlKQWrL8KcX9FWgpVrk01/qrLTjt
   P/9BjpVKPRYs2YNa4vAk3oDgNK70CzYTHtWMQGngp6zB0VRLgvK5ay9II
   cyAO/a6CDbAA3e6oojE65UzrIUqy3HW/3YKK0XBsJ3QkoH8Z4Vq1vWKIu
   XGi6AfzN/8iRtB8G58QQ57YAKHJJp9djA3ZaA5tGC5fdQYZtdFfnn8k+E
   zec+FU0Hg5aQcp+vscCc6fCBi80CLq/3JgnI2+zc/0eSzI9a1L0CE/aFI
   7/a2RRwahjnCWtzpEdax7eZUgB6DUzcus62REg05Xl0VWrJiyeaOwEB4z
   w==;
X-CSE-ConnectionGUID: jf75aQsXSneWELgtntpGWQ==
X-CSE-MsgGUID: MHSMuxp7TpCpQCP646iirw==
X-IronPort-AV: E=Sophos;i="6.15,212,1739862000"; 
   d="scan'208";a="40006679"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2025 14:41:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Apr 2025 14:41:06 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Apr 2025 14:41:06 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 11/11] ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board
Date: Mon, 14 Apr 2025 14:41:28 -0700
Message-ID: <463581224a07bf122c6907d34a0c5c71b1cc73e1.1744666011.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144203_927965_FD695332 
X-CRM114-Status: UNSURE (   8.12  )
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

Add RTT timer with backup register for SAMA7D65_Curiosity board.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 30fdc4f55a3b..3105fe1766c3 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -141,6 +141,10 @@ pinctrl_uart6_default: uart6-default {
 	};
 };
 
+&rtt {
+	atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
+};
+
 &sdmmc1 {
 	bus-width = <4>;
 	pinctrl-names = "default";
-- 
2.43.0


