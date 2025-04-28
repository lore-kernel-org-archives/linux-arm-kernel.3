Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD576C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DH6GXAu28P+paRygaPvQ/RCNUmo6GrCq7ae0FlmoHS4=; b=3HFztS7EPE8lhiFfcDrvFLn4wF
	aicZ/kLBN6ZTUgkLNqKUZkl3GSKP0L9zloLbFtzgWDe5eJvOGhzT3/jDLdxV3kEaNsoduLK4CWHUe
	/n0WZ2Ig8UP+6ZOpz5j3iUMd/Rd8VIuSEfrwekwzoo3QvRNDU5WRwa/F5+eAf1PsT8TJvqBxgpGo1
	hgzg7Jgq6lTzw4Ys9YuMrzYbUmo8GLZ1o2pfTBAIjINemy6hBjZDzSKJ6cp4li4AbVIxsytyAwS5F
	PkIT1Jax6bwlNYi130YuXkSdQaXGguiPuEdofckLb+xNPUJi8dLSyTWGcYOi5c14Zxoq50kTabAlw
	H0GavbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VW1-00000007WLR-339Q;
	Mon, 28 Apr 2025 20:55:49 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VU2-00000007VzF-2p5D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:53:48 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SKrad12906825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 15:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745873617;
	bh=DH6GXAu28P+paRygaPvQ/RCNUmo6GrCq7ae0FlmoHS4=;
	h=From:To:CC:Subject:Date;
	b=tIkCqS96wkIjSuqqpycbEf2sku3SYJpatOs8xxcULW/FkpWfRJUuOgO3o34GQa4gJ
	 ufRt+VpFg/0FGTshQ0vNVoupZVNg/bdAGdr2uqPlH+IWR1WWZieWfKggMgAJKONXHj
	 I2cXp9iaS9GkWiYRaB7m248drQB0OPLAsOK+4rIk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SKragN030028
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 15:53:36 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 15:53:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 15:53:36 -0500
Received: from uda0506412.dhcp.ti.com (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SKraQl061891;
	Mon, 28 Apr 2025 15:53:36 -0500
From: Kendall Willis <k-willis@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <d-gole@ti.com>
CC: <khilman@baylibre.com>, <msp@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <k-willis@ti.com>
Subject: [PATCH v2] firmware: ti_sci: Convert CPU latency constraint from us to ms
Date: Mon, 28 Apr 2025 15:53:36 -0500
Message-ID: <20250428205336.2947118-1-k-willis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_135346_889447_91FD6021 
X-CRM114-Status: GOOD (  15.66  )
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

Fix CPU resume latency constraint units sent to device manager through the
TI SCI API. The device manager expects CPU resume latency to be in msecs
which is passed in with the TI SCI API [1]. CPU latency constraints are
set in userspace using the PM QoS framework which uses usecs as the unit.
Since PM QoS uses usecs for units and the device manager expects msecs as
the unit, TI SCI needs to convert from usecs to msecs before passing to
device manager.

[1] https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#tisci-msg-lpm-set-latency-constraint

Cc: stable@vger.kernel.org
Fixes: a7a15754c7f7 ("firmware: ti_sci: add CPU latency constraint management")
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Link to v1:
https://lore.kernel.org/all/20250425153754.2141984-1-k-willis@ti.com/

Changes from v1 to v2:
- reworded commit message to clearer about TI SCI CPU resume latency API
- added comment about converting to msecs and rounding down for the
  device manager
- changed commit to be inline with stable kernel rules
- rebased on linux-next

Test log [2] shows entry to MCU Only low power mode by sending a CPU
resume latency constraint of 100000 us using PM QoS. On line 860,
MCU Only is shown to be entered by 0x1 as the printed mode [3].

[2] https://gist.github.com/kwillis01/4cf6e19893927d232e7faa0676ea2425 
[3] https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#supported-low-power-modes
---
 drivers/firmware/ti_sci.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 806a975fff22..ae5fd1936ad3 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -2,7 +2,7 @@
 /*
  * Texas Instruments System Control Interface Protocol Driver
  *
- * Copyright (C) 2015-2024 Texas Instruments Incorporated - https://www.ti.com/
+ * Copyright (C) 2015-2025 Texas Instruments Incorporated - https://www.ti.com/
  *	Nishanth Menon
  */
 
@@ -3670,6 +3670,7 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct device *cpu_dev, *cpu_dev_max = NULL;
 	s32 val, cpu_lat = 0;
+	u16 cpu_lat_ms;
 	int i, ret;
 
 	if (info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED) {
@@ -3682,9 +3683,16 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
 			}
 		}
 		if (cpu_dev_max) {
-			dev_dbg(cpu_dev_max, "%s: sending max CPU latency=%u\n", __func__, cpu_lat);
+			/*
+			 * PM QoS latency unit is usecs, device manager uses msecs.
+			 * Convert to msecs and round down for device manager.
+			 */
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

base-commit: 33035b665157558254b3c21c3f049fd728e72368
-- 
2.34.1


