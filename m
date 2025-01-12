Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABE4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 04:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B4Sfrt8uyUySFDJ3bjoV+mUUJjuD5J/DmG9W2o8vDO4=; b=q02qmyduj+U3clZ8Mf+rL82CTF
	Y/nFJaFz9wJ9TRIhB6gZ6dQ539wKAgqBqSYOAd3fpltjAXKJ5jajTwAyFzEQmHSYW5yCkHHiqyqp6
	IwzUTWsE6qz4AEnakRQ8nXexQoDPRVFafCqEdiYw+F9nw1eJjnhlZ/ySapjJ8MQVL+Wd4X6uPlGa6
	0RHdUeZY+MsJo1JzR8HfZDuKaczXqUWc2pGcxWVvBHKF4aIIxY+nFuBjg/SiI/mE/a17GOTa3kjFd
	d/Gqv/g76pCnXYH9BEiAbIFC/ZkvgfS3wfO/qUmMMoWYWQDAUVmMenEAogMuHJtzX/CBdGGkwnI3w
	+bvMWyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWpok-000000024fJ-07Re;
	Sun, 12 Jan 2025 04:43:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWpnT-000000024Wd-2hkt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 04:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736656920; x=1768192920;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=QWX/DIgncBhwnmRSUaBeYNsVbCo0MhvPrLkGImBuVwU=;
  b=ROr8FErxh60bIsKExeORCLFrnSp/0wh6t5AOdWKaVvmiRI+ym4Qkmcml
   ve7pb3xjJQqrt8rMxosqFUgieX+jxuVTjF74yyj5XHzSPUzHCDe3oHEOP
   RiwRwlwUo5ai0usA7KhXPfvP/KVzEIo8GV5ofNiLq9mhmBZ1OF9ZM0CyO
   jZAkZk8J8nyaemUnz32wyc+DLA3vSH/cL49VY0yILtodXXOxEwLU9zjMi
   5D8Dlh5Q9GAz7YUXBAfyO/NRnvEwxIGRnZif9G/QCdKfxFeNCpLrTbfcK
   1Yz9/DuuuMGiGhKiFph9S+5JgDtMZ70XPME+n9dvV+nlz1rdXZTTVcaYI
   w==;
X-CSE-ConnectionGUID: 5EsYT+VbR9e2cYwCsEZWUg==
X-CSE-MsgGUID: RQgX0DutSgOxxTzaHEUgAA==
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36430852"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jan 2025 21:41:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 11 Jan 2025 21:41:15 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sat, 11 Jan 2025 21:41:12 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Sun, 12 Jan 2025 10:11:10 +0530
Subject: [PATCH] drivers: soc: atmel: fix the args passed to AT91_SOC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250112-atmel-soc-v1-1-822937f1dd5a@microchip.com>
X-B4-Tracking: v=1; b=H4sIAOVHg2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0Mj3cSS3NQc3eL8ZF0Tg2STJCBhmWRmoQRUX1CUmpZZATYrOra2FgC
 InqGaWwAAAA==
To: Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Varshini Rajendran <varshini.rajendran@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Dharma Balasubiramani <dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736656871; l=1897;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=QWX/DIgncBhwnmRSUaBeYNsVbCo0MhvPrLkGImBuVwU=;
 b=D9b0zLBYcFNhvFkmEj5yqTP90zbB+tXIzRIrUAS699NZCFCcq3/ZgiGuN06fw00hMw4g0HCU1
 mjPXJsyFdtsC0U+XtGSGZpTGmhD2mYFq2U7jgzEmjvnUDmQrcxQmdmp
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_204200_204434_E3424647 
X-CRM114-Status: UNSURE (   9.92  )
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

fix the arguments passed to the AT91_SOC for SAM9X75 SiP.

Fixes: 5eb64f2b368f ("ARM: at91: add support in SoC driver for new sam9x7")
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/soc/atmel/soc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index 298b542dd1c0..273c1420fd40 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -111,17 +111,17 @@ static const struct at91_soc socs[] __initconst = {
 	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
 		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
 		 "sam9x75", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D1M_EXID_MATCH,
-		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
+		 AT91_CIDR_VERSION_MASK, SAM9X75_D1M_EXID_MATCH,
 		 "sam9x75 16MB DDR2 SiP", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D5M_EXID_MATCH,
-		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
+		 AT91_CIDR_VERSION_MASK, SAM9X75_D5M_EXID_MATCH,
 		 "sam9x75 64MB DDR2 SiP", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D1G_EXID_MATCH,
-		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
+		 AT91_CIDR_VERSION_MASK, SAM9X75_D1G_EXID_MATCH,
 		 "sam9x75 125MB DDR3L SiP ", "sam9x7"),
-	AT91_SOC(SAM9X7_CIDR_MATCH, SAM9X75_D2G_EXID_MATCH,
-		 AT91_CIDR_VERSION_MASK, SAM9X75_EXID_MATCH,
+	AT91_SOC(SAM9X7_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
+		 AT91_CIDR_VERSION_MASK, SAM9X75_D2G_EXID_MATCH,
 		 "sam9x75 250MB DDR3L SiP", "sam9x7"),
 #endif
 #ifdef CONFIG_SOC_SAMA5

---
base-commit: 2b88851f583d3c4e40bcd40cfe1965241ec229dd
change-id: 20250112-atmel-soc-40c4b40c9b68

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


