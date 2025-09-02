Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AD3CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 05:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=42RegQTCDRL14IF71DWqeWDzMi+09VfAloiY2ptO0oE=; b=wrul7mptqYfSG+
	R+vxDbzZRBRA3SF1hrE9Tf3Ju9RDSjSSJgcCIX625Z8/jp5doz3WQ1WhsYU5pNPnBASrPO1BpWEoz
	cwzT5Y0s5YJ4aFybo1YgDlljJZvEFsLtZPCExXfVQfX6hELsXlK6igOTh9nUtIkOcwz2q+oGQ5vV9
	LuaeEe8jJgqEYqcvnI6p+MY91m5p8PGEjl4J0w3TXzawObr5ro5xScFw+9mp3wuGFgsD76yPd/sWC
	tXT25EpRCk3nlNJjlNkIPZPbSKfyAsR6IIopZm+dK0vcb4KHAf4zivDW/xpQMbQjM404VV1lji2WX
	mZwCpILss9hjeV2Sdzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJzU-0000000FP93-0otC;
	Tue, 02 Sep 2025 05:55:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utJwl-0000000FORk-192N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 05:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756792367; x=1788328367;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=KsI+M7YnFhd/Oo7jo6teF3LjOcYUqnHqlXYhwF09GJ8=;
  b=KkMa3wqb9HAepRrg7Z8ehcB6YzQEYk4kI5hgNfs7rl14vNmGSX2SqtY3
   JtMZ6B2ol9y/IKjH3ociV2VuXdxYpB4NSZixY0Bk5mxjetCYn2cjDOYvi
   CmRWYmwf/x/BpmDlTL+t/366iPsyQn4xHl+Sn8G0PoqEPlzTY6eHk7lfK
   3wfhFlJyq+Am+dbjyzgq/I/GENiPD/rG8Y+IDV/nyMEkkt5rUsB6/6//J
   I8+JYBI1Z+nJLJEKTMeiliNzA7LoXJAxu4YWt2Lsf3SdcJ5ei7/KUBBjU
   pPK33Sw2z/8qtCmQ9P3d3/2ndP05f3PxVqyviLPOqiU8FsFDukO53CTto
   A==;
X-CSE-ConnectionGUID: 1ukqY7Z2Svu+qnOLrd9exQ==
X-CSE-MsgGUID: lNApHYG2Tuqr8iBNPO7irw==
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="46483411"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Sep 2025 22:52:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 1 Sep 2025 22:52:29 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 1 Sep 2025 22:52:24 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH 0/5] Add QSPI support for sam9x7 and sama7d65 SoCs
Date: Tue, 2 Sep 2025 11:22:17 +0530
Message-ID: <20250902-microchip-qspi-v1-0-37af59a0406a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABGGtmgC/x3MQQqAIBBA0avIrBPUkqirRIuapppFaQ5EIN09a
 fkW/2cQSkwCvcqQ6GbhcBbYSgHu07mR5qUYnHHedMbpgzEF3DnqSyJrmlvsGust1gQliolWfv7
 hML7vBzDWzZpgAAAA
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Dharma Balasubiramani <dharma.b@microchip.com>, Varshini Rajendran
	<varshini.rajendran@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756792344; l=908;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=KsI+M7YnFhd/Oo7jo6teF3LjOcYUqnHqlXYhwF09GJ8=;
 b=MjxsyeDrxOB1wRIZko5qiDCJGRosvkwJODv4FsB2+qTmRCjP4qx8nlJjRycaO78WfdeKx0g8M
 McqAOvU+s3zBu7u3d9n+cRcTUJU1dP0DSgvwU6IY+P7KCOHe/uaMNLw
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_225247_461461_C27C2361 
X-CRM114-Status: UNSURE (   9.07  )
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

This patch series adds support for SAM9X7 and sama7d65 QSPI controller
along with the SoC-specific capabilities.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Dharma Balasubiramani (4):
      spi: atmel,quadspi: Document sam9x7 QSPI
      spi: atmel,quadspi: Define sama7d65 QSPI
      spi: atmel-quadspi: add padcalib, 2xgclk, and dllon capabilities
      spi: atmel-quadspi: add support for SAM9X7 QSPI controller

Varshini Rajendran (1):
      spi: atmel-quadspi: Add support for sama7d65 QSPI

 .../devicetree/bindings/spi/atmel,quadspi.yaml     |   3 +
 drivers/spi/atmel-quadspi.c                        | 134 ++++++++++++++++-----
 2 files changed, 105 insertions(+), 32 deletions(-)
---
base-commit: 33bcf93b9a6b028758105680f8b538a31bc563cf
change-id: 20250902-microchip-qspi-eb7c94151c3e

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


