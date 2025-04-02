Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D516C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s1BBBxSWqFLhM9rjpBTtLASKD1ESrFjmLlDUTnjzs2E=; b=IJUiPhULaMI4/f91FdsQ99eWpM
	kgjmnJ9pKoUAX5y6okWAF7l2K+fCSJNJfEyBU9y2ajfpm7qAS2Sgs+Aex3MCppexF0el8EXOJjZpt
	fhVuB1pSt+gD66K7g/weJkJgb4EKOYFPos2Iwbdx7sgA3L3rHyMIGuSIfsawi7tVqxbtmAGZnF6r5
	+TJexq/2wLC3Q+gc7EV2hCKmhE1361QOz9bIreBpV+pl/1vO12U1y6HY+sJB1a5XaK8V1MLLhfh1X
	tDGO2Tm+LcdVJ4MaNLWpcPxpnihnqE7OQu4FXBelbX8OMcemqZGy6Vb/O7GSDrTUvKVNiPDe6bfHP
	z0lNSMnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztoE-00000005aSM-14op;
	Wed, 02 Apr 2025 08:50:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztcy-00000005YsX-2yet;
	Wed, 02 Apr 2025 08:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743583155;
	bh=cQTnye/bMR3a4CIhuNYW2H7HVeU4bIvhzbyjX6kKvvA=;
	h=From:To:Cc:Subject:Date:From;
	b=KmhvrdUCWCt5GLrm0X0nDnXCINis0c3PO83VB3eTPmQOPZWd3Amw0zkdr97Coo3pi
	 tmsDGwV1FOlfZFQSbDW8Y+KuUvcH4HFBqhSl3FtA0saib8j6f5EQDopBNjxzxKkyHM
	 QkuuXW7nm87Itz8z/KjEJ4tJ5TkSJru8IcrhK0ESpa9mrIV78pHNKWSzVL6oplw+vV
	 Rguxt+IErwfc2b0UpvWoAJUxam/Baoy6l53GfqVYbUpuPn1sapymsts8a0y0Ruti8Z
	 2+nADxb4FjWoBku1Y4fQJKM3MWUkiz95h4ulbmiGA44tv4/ufZrQAlWbyMYJYZ2GXy
	 S5n3tqwAyYN7w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FBE617E0B0B;
	Wed,  2 Apr 2025 10:39:14 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Cc: daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	npitre@baylibre.com,
	jpanis@baylibre.com,
	nfraprado@collabora.com,
	wenst@chromium.org,
	bchihi@baylibre.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] thermal/drivers/mediatek/lvts: Fix debugfs unregister on failure
Date: Wed,  2 Apr 2025 10:38:52 +0200
Message-ID: <20250402083852.20624-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_013916_890082_5E5C0193 
X-CRM114-Status: GOOD (  13.35  )
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

When running the probe function for this driver, the function
lvts_debugfs_init() gets called in lvts_domain_init() which, in
turn, gets called in lvts_probe() before registering threaded
interrupt handlers.

Even though it's unlikely, the last call may fail and, if it does,
there's nothing removing the already created debugfs folder and
files.

In order to fix that, instead of calling the lvts debugfs cleanup
function upon failure, register a devm action that will take care
of calling that upon failure or driver removal.

Since devm was used, also delete the call to lvts_debugfs_exit()
in the lvts_remove() callback, as now that's done automatically.

Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 088481d91e6e..c0be4ca55c7b 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -213,6 +213,13 @@ static const struct debugfs_reg32 lvts_regs[] = {
 	LVTS_DEBUG_FS_REGS(LVTS_CLKEN),
 };
 
+static void lvts_debugfs_exit(void *data)
+{
+	struct lvts_domain *lvts_td = data;
+
+	debugfs_remove_recursive(lvts_td->dom_dentry);
+}
+
 static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
 {
 	struct debugfs_regset32 *regset;
@@ -245,12 +252,7 @@ static int lvts_debugfs_init(struct device *dev, struct lvts_domain *lvts_td)
 		debugfs_create_regset32("registers", 0400, dentry, regset);
 	}
 
-	return 0;
-}
-
-static void lvts_debugfs_exit(struct lvts_domain *lvts_td)
-{
-	debugfs_remove_recursive(lvts_td->dom_dentry);
+	return devm_add_action_or_reset(dev, lvts_debugfs_exit, lvts_td);
 }
 
 #else
@@ -1374,8 +1376,6 @@ static void lvts_remove(struct platform_device *pdev)
 
 	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
 		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
-
-	lvts_debugfs_exit(lvts_td);
 }
 
 static const struct lvts_ctrl_data mt7988_lvts_ap_data_ctrl[] = {
-- 
2.48.1


