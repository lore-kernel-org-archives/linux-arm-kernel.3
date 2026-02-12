Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE27AEB48EB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 10:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGv/+L04zyZJagXf8w5imf0y8azihWDdO31bhtz5hn8=; b=Xc/5x8fuimsyDyk4bOGX9/gYgB
	/iWE9SGotj+I+ipthW2JBrCdt9QCAJQ/yY8jctkrX4h2LELQWgfgu85f3JO/QtgRsDDrVhQRMPr3O
	UTwZJHxS9TdeAQCublybxjos3lu6P7OmMLUQz5I/B1RNTf1K6x21TRoUFwVqK/mc8R3+otjfX530Q
	A7skU3Qbsc2dQDZOegjbaHJDqg38BPpqwjwNSO+2XRXSTFNSb9oizs0Q24TRKm3KCYQr9yJFm2LPf
	SAGYv2nU4hjlHpJlJ2faN2mq8NrqiyrwPE/ZNU/wbGw8Ae2tYGUy6KxMLoePHwX8RrRXdDtpQN6fJ
	Cx0CB0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTX1-00000001tUx-29dM;
	Thu, 12 Feb 2026 10:02:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTWz-00000001tTW-0lLi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 10:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770890559; x=1802426559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RgPLsEAvEIhX+x4fiqob1zN/Jh2A9AFXuJ2U8zEAWpM=;
  b=uQqtrE9/XD2I6V3xhrYDDmyE+THoPihGLd2E9bQITOjrWCkF5ojHggkk
   NT36KJs8JXNYdrLWAd6grIEGuZsC64pDVvhRn7DkGZXz6O8SpsYVJH+j0
   8sqN6zOP+6cYqMN81fp3xp64/WVgHQzmyBgcWXzJvtX6PSaOeyFExZbqS
   ZARCbaYUJG48fuZ2KxTmEGJRiho7mv0GBZC3EeO9l6pyyV7i17QnC9d77
   2yUW8AB05b9Bxm6+NafHsSFywmLOUcUqWWUKY/wwgzG6BiZWKCE47KY1W
   RKCqXndybdC89e5Vipl7Jp9XL/mQ5PoDMx6Gy4i8Pt7gFlaY66FyfKiq0
   A==;
X-CSE-ConnectionGUID: MLyYTqveRP6xRNiALHFvrA==
X-CSE-MsgGUID: SQ2Xuz9nT8yug6mqergzPw==
X-IronPort-AV: E=Sophos;i="6.21,286,1763449200"; 
   d="scan'208";a="220596017"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:02:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Thu, 12 Feb 2026 03:02:19 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 12 Feb 2026 03:02:16 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v2 3/4] clk: at91: sam9x7: Add gmac generic clock entry with ID 24
Date: Thu, 12 Feb 2026 12:01:46 +0200
Message-ID: <20260212100147.5007-4-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212100147.5007-1-mihai.sain@microchip.com>
References: <20260212100147.5007-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_020241_288948_4F7A2D9B 
X-CRM114-Status: UNSURE (   9.94  )
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

According with datasheet table 12.1 the instance ID 24 is used
for gmac generic clock.
This change adds the gmac_gclk entry in SAM9X7 clock description
table.

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 68e569bd70f5..8b52da194849 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -568,6 +568,15 @@ static const struct {
 		.pp_chg_id = INT_MIN,
 	},
 
+	{
+		.n = "gmac_gclk",
+		.id = 24,
+		.pp = { "audiopll_divpmcck", "plla_div2pmcck", },
+		.pp_mux_table = { 6, 8, },
+		.pp_count = 2,
+		.pp_chg_id = INT_MIN,
+	},
+
 	{
 		.n = "lcd_gclk",
 		.id = 25,
-- 
2.53.0


