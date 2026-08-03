Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A98C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rnPJ65E1Y9yzwUYd8xbFQASARnIMv8dFxPXCgrTihiM=; b=eA24bMivIf1BgzJd1tAeEk2XbY
	vtPmhiXv43RITc3RxR8aTM2cr2jF+f7B4QOUOpdIo6w9lX1IhnTSc1Fvn6skAdq8KOXxuI94wYWoF
	rvWpV5mUgJ95nG0ctcKmtJZ/co3cHSXdwv2PegWtWCXwWA74AscQgVa25e0AP2Zhuagiup6Wl0Ajp
	LiNhqcYMkJqi/6LxyDxX/JJWvZGaYQ8Oo2J7Z9RrfEhGTdoMPHUUsvoEu4AqFqmj9/tKh+3VYIYyF
	m5I6AXtyFfpzcVunNbEAKyIdKSO+OTo2Pff9y1GIoVEP1quzSZ5nca+J/5no79P0geUmJn86BEgcG
	DFCKkTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmwX-0000000GVXh-2mh2;
	Mon, 03 Aug 2026 07:18:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmwU-0000000GVWt-39YM;
	Mon, 03 Aug 2026 07:18:36 +0000
X-UUID: 86a87e928f0b11f1acbe4559397dec65-20260803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rnPJ65E1Y9yzwUYd8xbFQASARnIMv8dFxPXCgrTihiM=;
	b=mR9iyQ8aKeM3JFbOdCnDc5SrV+eenLI8BnQhujrB7jW1js+NzZyYUN+OrLuvDYTKKbgKLTT+ZK0D85V6oRThuBjPIknqw+LJWxCEXdZ6OM1dZ+lCZIrKmHIX9Ejoise4REN0PvHr2EjSuEwvD2QZ9lI7EKYIzv4BzM1f2AfN4S0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:249d2bd4-5bf2-42dd-9d31-34dfe4ef064b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:86e7b2cd-1e1e-41fe-8474-552e0064a2de,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 86a87e928f0b11f1acbe4559397dec65-20260803
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ot_zexin.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 265560649; Mon, 03 Aug 2026 00:18:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 3 Aug 2026 15:18:26 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 3 Aug 2026 15:18:25 +0800
From: Zexin Wang <ot_zexin.wang@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <light.chen@mediatek.com>, <Fred-WY.Chen@mediatek.com>,
	<Yt.Hsieh@mediatek.com>, Zexin Wang <ot_zexin.wang@mediatek.com>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [RESEND PATCH] watchdog: sbsa_gwdt: add force_enable module parameter
Date: Mon, 3 Aug 2026 15:18:18 +0800
Message-ID: <20260803071823.27759-1-ot_zexin.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_001834_801933_3C54AA0D 
X-CRM114-Status: GOOD (  15.34  )
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

The sbsa_gwdt driver only manages and registers the watchdog timer if it
was already enabled by a previous boot stage (such as firmware). If the
watchdog was left disabled prior to entering the kernel, the driver
will not actively enable it during the probe phase.

Introduce a new module parameter 'force_enable' to allow overriding this
behavior. When 'force_enable' is set, the driver will forcibly start
the watchdog and register it as running during the probe phase, even if
it was disabled in the previous boot stage.

Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
---
 drivers/watchdog/sbsa_gwdt.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index e04d42cc7774..4b49e1aeef84 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -122,6 +122,11 @@ MODULE_PARM_DESC(nowayout,
 		 "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
+static bool force_enable;
+module_param(force_enable, bool, 0);
+MODULE_PARM_DESC(force_enable,
+		 "Force enable watchdog on probe (default=0)");
+
 /*
  * Arm Base System Architecture 1.0 introduces watchdog v1 which
  * increases the length watchdog offset register to 48 bits.
@@ -296,6 +301,7 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 	struct sbsa_gwdt *gwdt;
 	int ret, irq;
 	u32 status;
+	bool force_action;
 
 	gwdt = devm_kzalloc(dev, sizeof(*gwdt), GFP_KERNEL);
 	if (!gwdt)
@@ -386,14 +392,27 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 	 */
 	sbsa_gwdt_set_timeout(wdd, wdd->timeout);
 
+	force_action = force_enable && !(status & SBSA_GWDT_WCS_EN);
+	if (force_action) {
+		sbsa_gwdt_start(wdd);
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+		dev_info(dev, "Watchdog force enabled.\n");
+	}
+
 	watchdog_stop_on_reboot(wdd);
 	ret = devm_watchdog_register_device(dev, wdd);
-	if (ret)
+	if (ret) {
+		dev_err(dev, "Failed to register watchdog: %d\n", ret);
+		if (force_action) {
+			clear_bit(WDOG_HW_RUNNING, &wdd->status);
+			sbsa_gwdt_stop(wdd);
+		}
 		return ret;
+	}
 
 	dev_info(dev, "Initialized with %ds timeout @ %u Hz, action=%d.%s\n",
 		 wdd->timeout, gwdt->clk, action,
-		 status & SBSA_GWDT_WCS_EN ? " [enabled]" : "");
+		 watchdog_hw_running(wdd) ? " [enabled]" : "");
 
 	return 0;
 }
-- 
2.45.2


