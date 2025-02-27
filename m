Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A88CC1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D15NreMI6+h9vGKq5BYX5zq8vLplidhcd0ZnFulD/4o=; b=cj3siNuoap2hVZ7XQcNiwwuRS5
	pgffcraJXI98lVt0gn2J0L0kHM8JWsdSZV6Zenjxfn+BAVG7iAZpla9lAnpZPTv1vsdVMm3tdeQxw
	kzQrrHtTEQYHsXD8XYdNq3ZKRzQLPWsgj0bkPUWwgY0EoP8Npr8OmyK9L1oRab9CioyNNG7g3XiT2
	ifL1kqZVKX2202etBMnmxlRe4xhLoISMIz9fEhDjNpThLUQuswhgzyIrTxBgwXDPj7l9mkKkC1ISF
	z7XBJ8OqaswWhvU/KKtVlOuTYlfH1mGN810ttwdoIV5MjPP7u51DLYyLobY6L/HfT0Hm6AZpuj+m9
	kMqgEUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjiw-00000008XAm-1e2V;
	Thu, 27 Feb 2025 19:39:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngCA-00000007xuh-0seI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671586; x=1772207586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cp3KlP5kz8uShLGylSzqchQUQS7t4AEaR6YGK7e5dDw=;
  b=XbpqQOKd5qJDMcMaWOKmfqcWbgepgBx6Ew64A38RKi/drnGP051w39V8
   r4YHL1q85iTvlR0j/OpbOsYFFjBvkMuOzyDgwTd1VMqcsMJdRo4psiRIl
   5jyJ/ayiNQj8TI+7SaKYQzo4TPXdqfgkJUE3aB9vg9BOW9RUk4ZD08rE/
   PrhvURo2bHt5VD/F6krcXoweC+KVA/3fwkG5biqpoJ3JuFb4UImiQ5wXM
   kpm2ahXF9CpFiglyRxtLW9yv08amv319JRa2cIo9K57lmEYcCEMBaViXp
   XiYDmMvsSu7mvhvWaWRkj6G8nzk86IDtMvs8vePy+FaUjEFslX88ruTXU
   g==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: dQw/PgHsT4ugpCXfq8lnRQ==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638186"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:53:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:47 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:47 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 21/21] ARM: dts: microchip: sama7d65: Add RTT timer to curiosity board
Date: Thu, 27 Feb 2025 08:52:08 -0700
Message-ID: <f00b44b41ff12948d33adc4987983d7d6619759d.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075306_314145_1364650E 
X-CRM114-Status: UNSURE (   8.30  )
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


