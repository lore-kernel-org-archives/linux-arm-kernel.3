Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6CFC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMtNlu8kPisu+hOa7K/fqtqAEC8wLRcWVB3HQOnfxXM=; b=nS2kk4wRG4kxTTa7Rbp5X8qicx
	h2bVfR3cM7c19wuKXz4fTp2ZEGFqPYa1WnkGq8D2UREmNLwt2V7xJ/QTNkTbCQNpeRNHfN//ghwl3
	fjL9XdPnrcuxi/JSm56UVlzcONklcxX2+bNfKS5iztXngNSl9y3YcWvYuuSKQlP0Vre5J6RugxKgB
	+9IqdZJmZkQ+XSLFDaAaJ2z5J9L3aozVz2okb09W8KFPkkIOc5i+UwqW5/8ZPtpF8zmvUnLiQfzij
	w7ZRzFz06HUPh7lUNe6/on79Z14Jd93H6joHCacnBPT1H0npCusuPtMgFMFSYV/0u55myAbUL5gA4
	imTNC7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJV9C-00000008cuy-3sug;
	Mon, 26 May 2025 10:33:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJV5t-00000008cT0-3E94;
	Mon, 26 May 2025 10:30:11 +0000
X-UUID: 6362edc23a1c11f08d385d50fb11b32d-20250526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EMtNlu8kPisu+hOa7K/fqtqAEC8wLRcWVB3HQOnfxXM=;
	b=E8wCm4WMolqsIT6Av1Bz2GwuB/l/p4ga0IvSn6Jykgp9bfX6QcoTEW+D4ud0zIBIT4jCXwRvcjWPKGeMIv24UfKaanfEhDnGNrN9QZ7Mn47vVaCiG0/Igp39obOdJVf+h7uDQ9gOa8sHiIGgyw8KNRLej1wg6Yv7wJg//FgCPEM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8c68a43d-3708-4345-90b5-0a00e237640b,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:c3c0bc47-ee4f-4716-aedb-66601021a588,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6362edc23a1c11f08d385d50fb11b32d-20250526
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <mason-cw.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 302214469; Mon, 26 May 2025 03:30:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 26 May 2025 18:30:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 26 May 2025 18:30:01 +0800
From: Mason Chang <mason-cw.chang@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
	<nfraprado@collabora.com>, Julien Panis <jpanis@baylibre.com>, Nicolas Pitre
	<npitre@baylibre.com>, Colin Ian King <colin.i.king@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Chen-Yu
 Tsai <wenst@chromium.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Frank Wunderlich
	<frank-w@public-files.de>, Daniel Golle <daniel@makrotopia.org>, Steven Liu
	<steven.liu@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
CC: Mason Chang <mason-cw.chang@mediatek.com>
Subject: [PATCH 1/3] thermal/drivers/mediatek/lvts_thermal: change lvts commands array to static const
Date: Mon, 26 May 2025 18:26:57 +0800
Message-ID: <20250526102659.30225-2-mason-cw.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
References: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_033009_809893_7C614DB4 
X-CRM114-Status: GOOD (  12.00  )
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

Change the LVTS commands array to static const in preparation for
adding different commands.

Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 29 +++++++++++++------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 985925147..7e4f56831 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -96,6 +96,17 @@
 
 #define LVTS_MINIMUM_THRESHOLD		20000
 
+static const u32 default_conn_cmds[] = { 0xC103FFFF, 0xC502FF55 };
+/*
+ * Write device mask: 0xC1030000
+ */
+static const u32 default_init_cmds[] = {
+	0xC1030E01, 0xC1030CFC, 0xC1030A8C, 0xC103098D, 0xC10308F1,
+	0xC10307A6, 0xC10306B8, 0xC1030500, 0xC1030420, 0xC1030300,
+	0xC1030030, 0xC10300F6, 0xC1030050, 0xC1030060, 0xC10300AC,
+	0xC10300FC, 0xC103009D, 0xC10300F1, 0xC10300E1
+};
+
 static int golden_temp = LVTS_GOLDEN_TEMP_DEFAULT;
 static int golden_temp_offset;
 
@@ -902,7 +913,7 @@ static void lvts_ctrl_monitor_enable(struct device *dev, struct lvts_ctrl *lvts_
  * each write in the configuration register must be separated by a
  * delay of 2 us.
  */
-static void lvts_write_config(struct lvts_ctrl *lvts_ctrl, u32 *cmds, int nr_cmds)
+static void lvts_write_config(struct lvts_ctrl *lvts_ctrl, const u32 *cmds, int nr_cmds)
 {
 	int i;
 
@@ -985,9 +996,9 @@ static int lvts_ctrl_set_enable(struct lvts_ctrl *lvts_ctrl, int enable)
 
 static int lvts_ctrl_connect(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 {
-	u32 id, cmds[] = { 0xC103FFFF, 0xC502FF55 };
+	u32 id;
 
-	lvts_write_config(lvts_ctrl, cmds, ARRAY_SIZE(cmds));
+	lvts_write_config(lvts_ctrl, default_conn_cmds, ARRAY_SIZE(default_conn_cmds));
 
 	/*
 	 * LVTS_ID : Get ID and status of the thermal controller
@@ -1006,17 +1017,7 @@ static int lvts_ctrl_connect(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 
 static int lvts_ctrl_initialize(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 {
-	/*
-	 * Write device mask: 0xC1030000
-	 */
-	u32 cmds[] = {
-		0xC1030E01, 0xC1030CFC, 0xC1030A8C, 0xC103098D, 0xC10308F1,
-		0xC10307A6, 0xC10306B8, 0xC1030500, 0xC1030420, 0xC1030300,
-		0xC1030030, 0xC10300F6, 0xC1030050, 0xC1030060, 0xC10300AC,
-		0xC10300FC, 0xC103009D, 0xC10300F1, 0xC10300E1
-	};
-
-	lvts_write_config(lvts_ctrl, cmds, ARRAY_SIZE(cmds));
+	lvts_write_config(lvts_ctrl, default_init_cmds, ARRAY_SIZE(default_init_cmds));
 
 	return 0;
 }
-- 
2.45.2


