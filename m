Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57275CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WkLeetlEiGsISzY1xWXkEm/5I5DPkQJHXZnw/D42BmA=; b=NBe/tg1SD7coV2CSd68P1FaQm/
	8WnWKt3yukHdlEFsYClr+zprBM4SkAtDtYWhv7ZK3i3f8McrdZqnf3GvEvnY+loIKGCiPnw/xRnr8
	W2He7aQQ33cJYt0YUeSoAy41IjCTpRo0pSie+J8uNPSO5zm0CjAGxFLU9NKqAsqfh9IaRW9TjUJqQ
	Tl1HPrYQb8SU52huJxdA33edRl2RXJWYKCjVB2fgctWdsvWfEYRAp53cmgYswpIWHcrsV9KRJjJw+
	TPv9OB8o3Vi31RpdxZGS+snFP1GoO6ZcNfhQTDSFrMumJlB/x68CSUWP3QQYyTTYX8yhENkcnhfHB
	0QNQWjPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zbC-0000000Cyjr-0gwq;
	Tue, 23 Sep 2025 09:46:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zb8-0000000CyjU-33NL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 09:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758620770; x=1790156770;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4IC6kzCc94flTu4NXzbmBmmXB8gHOaFw4qBAx5wMWio=;
  b=mlb5Sz9q+qfMrrzHVxsSNWAnha8moyisdmf45q7Zx4oyqcdkrP7B5B1N
   SH4bqryorLkkOJ+JeyGM7OHvylbsUQD8Sh8UWhRVUF7OrPSxGVZoQM3M0
   LhBrpLNyo+2DgCet3dVnpiABbgQ84PzBcHyCRMlv99TtAgA9CAfp7ZZji
   9Z4oExDpYybCB0JByyq2oQC46NQXFJEoqzU0EQv3NyG2faokeeY+l4z9E
   A9brxZab3nb7f3nzZNDou+r+mqOmIt+SxGALEJnqFdmuhlSVBptYkdJwc
   isM5j7EgsGy2Dl6bP2Q4pYhJX0iDBrVTGqhmKc3zNa4Hfy97oGV7SjkzC
   Q==;
X-CSE-ConnectionGUID: revMr/fCT+KWP1FGF0svAw==
X-CSE-MsgGUID: tyHQfLvdTb6WLP8gyUoRvw==
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="47393017"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Sep 2025 02:46:09 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 23 Sep 2025 02:46:00 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 23 Sep 2025 02:45:56 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <linux@armlinux.org.uk>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<ardb@kernel.org>, <martin.petersen@oracle.com>, <mihai.sain@microchip.com>,
	<ebiggers@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH] ARM: at91: at91_dt_defconfig: set MMC_SPI to module
Date: Tue, 23 Sep 2025 15:15:52 +0530
Message-ID: <20250923094552.430595-1-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_024611_213921_5A617FB3 
X-CRM114-Status: GOOD (  10.28  )
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

Change CONFIG_MMC_SPI from built-in to module in the
at91_dt_defconfig. This allows the MMC over SPI driver to
be loaded only when needed for WILC subsystem.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 arch/arm/configs/at91_dt_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index ff13e1ecf4bb..4f1153098b16 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -181,7 +181,7 @@ CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_OF_AT91=y
 CONFIG_MMC_ATMELMCI=y
-CONFIG_MMC_SPI=y
+CONFIG_MMC_SPI=m
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=y
 CONFIG_LEDS_GPIO=y
-- 
2.25.1


