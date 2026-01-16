Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE02C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 20:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTrQjOk/eUYaxur59qHSK6OJCI3IKW5SFBR6vJAKYvk=; b=bqZDIiwJf9Vb8niDOBZJhxlQ5l
	H3mCdMt+2rhAqhQWOys80w7oHKqWwF58JO7evwfpNcP9PsF2ttDNu7yinV4vxfN7RQX4s/zPA67dy
	g7ROoBGmYdJkMrLUc+aqCS4DCECiBHxTJDjGFN5VYa+xx1TAZnKA3PvSgRcN7Fx+Yl2bbnoMgwPmk
	Lfy8pJPMcDca+Cj3sE6v74jAfWS8ZJpyGMUh+17Ysohug6+3iIbTlQH31wUWfwmXzOKSCcsHhBYM/
	yPkuP31xlMaFQ1Pxo4TSLcPpLY7reBMbp7/xsEEICx8PUNmCXtXAoqwu4yRAp+OqNbFut1lODTKI+
	nMhQE+Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6X-0000000Ek6F-1YPW;
	Fri, 16 Jan 2026 20:07:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgq6P-0000000EjyO-20cC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 20:07:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1768594045; x=1800130045;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Aw/tGbpDi+/qWY26Y9sF33D9NnFYEfAjwfpj8Zdq7M8=;
  b=cenNcu6SL9pW+brpsmaNhlHBwzmVqTwMfIkemlU81vTsriccB5C0qbey
   jBQVdQgoHZNBvLN7I0cq1Nglh1Rz7rKL5OPcZEg73Eb3N8GbPu3LCwZkZ
   jurqPIUgl7I2zbFDJBkVbZ9y9Y3a7Bpv+WY+W5IqJFiameD52wDwM0c8F
   v7XZXqgu+CJZnhXtrg41Bcv2MgjN8NUZgxNlIepMhlgiwXxzIQA/0gvl+
   4iHL1D61xfk88/7dkMGTtKhrQUiN0AgivrbKfU86UJRRCiYHf+kVwFafM
   RoYCPjmwW/+FYo/KK0tXXTUqr/q6CLOUa8BINLw8BfbM1/37a+lk+9XOC
   Q==;
X-CSE-ConnectionGUID: OTooRcwrRNCxZBlF1StIPQ==
X-CSE-MsgGUID: es4YwJhhRvuprFsOtjO9Cg==
X-IronPort-AV: E=Sophos;i="6.21,232,1763449200"; 
   d="scan'208";a="59042231"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 13:07:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 16 Jan 2026 13:07:03 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 16 Jan 2026 13:07:03 -0700
From: <ryan.wanner@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <bmasney@redhat.com>,
	<alexander.sverdlin@gmail.com>, <varshini.rajendran@microchip.com>
CC: <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 01/31] clk: at91: pmc: add macros for clk_parent_data
Date: Fri, 16 Jan 2026 13:06:54 -0700
Message-ID: <e89c803000d18109357f27bd17a86885652088dc.1768512290.git.ryan.wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768512290.git.ryan.wanner@microchip.com>
References: <cover.1768512290.git.ryan.wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_120725_524464_15E76DCF 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Add helpers to set parent_data objects in platform specific drivers.

Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
[ryan.wanner@microchip.com: enclose complex macro with parentheses.]
Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 drivers/clk/at91/pmc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 5daa32c4cf25..1ac0f77a867a 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -15,6 +15,14 @@
 
 #include <dt-bindings/clock/at91.h>
 
+#define AT91_CLK_PD_NAME(n) ((struct clk_parent_data){ \
+	.hw = NULL, .name = (n), .fw_name = NULL, .index = -1, \
+})
+
+#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){ \
+	.hw = (h), .name = NULL, .fw_name = NULL, .index = -1, \
+})
+
 extern spinlock_t pmc_pcr_lock;
 
 struct pmc_data {
-- 
2.43.0


