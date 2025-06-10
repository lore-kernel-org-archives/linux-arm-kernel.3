Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FE7C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PS/J/Tio82VscoAGIyJ5j4xDBN0G0tkUiw1k/m5qN6Y=; b=aVYiIceU/SG/yytO8axcs10lvC
	3mq+3z7J+IM3e93dCSPF0wWIjwu6ml6SuDT+mVHTijN/qYO/DcqRw0xteQJ4ftVutodzWEaH1O871
	OI9D86oXua7Pi9ejW7DooPR4sSid603LUGgHDh5Lzxvtw49QHr2kR1RN+kmnj6Xh+41odhsk2jPE5
	+rZMWmzL0gODg3kzK2K9IQVDhWG/eLPbRVS8MuUb7ew1Aurp/jVyKcOOfk2qrslQC9A3ePXuSEMG7
	dhhYXySfKhqJ8MNhTWHlkDFzJxfikO0HhjEQbrde/uS1rvtezBTQj94JxegKTRMyewUEGHsbH13rG
	w/iwrSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0WT-00000007Dtv-17wj;
	Tue, 10 Jun 2025 15:04:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyNb-00000006pCr-0do2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1749559623; x=1781095623;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6bHYj/GvFhdNqpNwCN5loAmPMAKh1G83CZSf8OJUjKU=;
  b=SHcytD9TAY2v1zRgGsN8bbCN4orq23KPvCp+nhhP7Xh9SwrkaYylAWT2
   OxzevZWzoAXHPrLkp8N2MrY29C3wc7M6N/JWRmj3toZhJNvmrf20DRECR
   0QJ3cidp1iSnkVtQ+XV59UZYWZlo8UDMVhFUuNpAV8hfMXeDMS63bvgpv
   6IFI6aab89C86iJF2aDCOF21MqelAolju1sMDKZ69CLwuRc89qYQ2tLIO
   X/4DvWiLAwu2IKBNAikPtnZI4ez7CyX6zr1lww1is9exET4H072Pr7/T5
   lhjMXs4mSkHcmOXcekInt0EZSXs5Z/zHTwW3G98NpGcaNhNOXlEkMObTO
   w==;
X-CSE-ConnectionGUID: kK3Lf/4PT9yRKmehi04c6g==
X-CSE-MsgGUID: zqHRItgfQOOuxb1tVn4vxw==
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="47589575"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2025 05:47:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 10 Jun 2025 05:46:58 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 10 Jun 2025 05:46:56 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] power: reset: at91-sama5d2_shdwc: Refactor wake-up source logging to use dev_info
Date: Tue, 10 Jun 2025 15:45:47 +0300
Message-ID: <20250610124545.175492-3-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_054703_411615_26D3C21F 
X-CRM114-Status: GOOD (  10.29  )
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

Use dev_info() instead of pr_info() for more consistent
logging in the driver.

[root@sam9x75eb ~]$ dmesg | grep power
[    1.678542] at91-shdwc fffffe10.poweroff: Wake-Up source: WKUP pin

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/power/reset/at91-sama5d2_shdwc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/reset/at91-sama5d2_shdwc.c b/drivers/power/reset/at91-sama5d2_shdwc.c
index e9fe08ee3812..ecf15694f925 100644
--- a/drivers/power/reset/at91-sama5d2_shdwc.c
+++ b/drivers/power/reset/at91-sama5d2_shdwc.c
@@ -129,7 +129,7 @@ static void at91_wakeup_status(struct platform_device *pdev)
 	else if (SHDW_RTTWK(reg, &rcfg->shdwc))
 		reason = "RTT";
 
-	pr_info("AT91: Wake-Up source: %s\n", reason);
+	dev_info(&pdev->dev, "Wake-Up source: %s\n", reason);
 }
 
 static void at91_poweroff(void)

base-commit: f09079bd04a924c72d555cd97942d5f8d7eca98c
-- 
2.49.0


