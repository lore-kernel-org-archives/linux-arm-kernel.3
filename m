Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631EBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vb9C6MAl6FATJ/FSIDGrDfptehSErrlH81k1sCZvVns=; b=g8Z1KABpJxQDHyUzNJnZ8nrMvW
	WmR716oOm9CABo9A733HKbWvwLB/WTyPbMzMy7JLTURASi40Mi/Ct8l2buAmLH2+RHxyPUNQJUfLd
	4daLV8RYA5XYMps4ZxbnKsX2ab2WwOGe6RrtFK3DGwGFRaIrPzLp1rENnbw40gHfoLY2JAR+KLD61
	6M/l5U4uxdDGO6EYvjP66JheXXAF5BLnnJTY87bg870MAQESdITpaeoX8gnZtSz8vNOS4dpYWLp9+
	KSmBDNOnsKEDZGzM73Jg/OUzFiet9CoI8lfWNM/IxZR2FegU7EmckPob+Z5d9bnm9fKJRbhmGATdD
	NWzhAwEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8MSU-00000000KHm-3Psz;
	Fri, 25 Apr 2025 17:03:26 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L7p-000000004fH-2zFG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:38:03 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFbvlT2824767
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 10:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745595477;
	bh=vb9C6MAl6FATJ/FSIDGrDfptehSErrlH81k1sCZvVns=;
	h=From:To:CC:Subject:Date;
	b=N7DmJQ2XoB7rS8Bmox9OtdQmWZZYt3azNIBkr29AQkxzRXAdKvUkWBmPhgj8R8Bjr
	 gMiU/oYLX3GH4ubDsV9NnKJLk7P5ZKxWbk3fAiR8xU4m6052RiCsDl80lumKB9Dtn9
	 l9cy7+P3HVPAxZvlu9Ivf8nBIjllYwVyTVTdsMz0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFbvNi025228
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 10:37:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 10:37:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 10:37:55 -0500
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PFbsRt108472;
	Fri, 25 Apr 2025 10:37:54 -0500
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <d-gole@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <k-willis@ti.com>
Subject: [PATCH] firmware: ti_sci: Convert CPU latency constraint from us to ms
Date: Fri, 25 Apr 2025 10:37:54 -0500
Message-ID: <20250425153754.2141984-1-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_083801_860625_548B5856 
X-CRM114-Status: GOOD (  12.73  )
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

Fix CPU resume latency constraint units sent to TI SCI firmware.
CPU latency constraints are set using the PM QoS framework. The PM QoS
framework uses usecs as the units for latency whereas the device manager
uses msecs, so a conversion is needed before passing to device manager.

Signed-off-by: Kendall Willis <k-willis@ti.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
---
Test log [1] shows entry to MCU Only low power mode by sending a CPU
resume latency constraint of 100000 us using PM QoS. MCU Only is shown
to be entered by 0x1 as the printed mode.

[1] https://gist.github.com/kwillis01/059a2ca38232387b414bc6f4b87c7475
---
 drivers/firmware/ti_sci.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 806a975fff22..bc138a837430 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3670,6 +3670,7 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct device *cpu_dev, *cpu_dev_max = NULL;
 	s32 val, cpu_lat = 0;
+	u16 cpu_lat_ms;
 	int i, ret;
 
 	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
@@ -3682,9 +3683,13 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
 			}
 		}
 		if (cpu_dev_max) {
-			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u\n", __func__, cpu_lat);
+			/* PM QoS latency unit is usecs, TI SCI uses msecs */
+			cpu_lat_ms = cpu_lat / USEC_PER_MSEC;
+			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u ms\n", __func__,
+				cpu_lat_ms);
 			ret = ti_sci_cmd_set_latency_constraint(&info->handle,
-								cpu_lat, TISCI_MSG_CONSTRAINT_SET);
+								cpu_lat_ms,
+								TISCI_MSG_CONSTRAINT_SET);
 			if (ret)
 				return ret;
 		}

base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
-- 
2.34.1


