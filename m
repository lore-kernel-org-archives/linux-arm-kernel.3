Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B507C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 00:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUrpxadYrqBSK67TA6zn3eLe0N/DmdKTKNEo2UJkwDw=; b=4juwS00HeWG6sNxxAxGAXv2cmu
	9X/QcIr/B1mzE3bnyevt1704tz6FxzjWtwuGL5oc23PKsfSxSTyMwCR87i5DxlvcD2cHB1OoJrA1j
	R6h6AeVesTEj35tvU49WfvTEe4l0V+u9CVCYQOG1Osa5e9gi7Fj1kM0YzCp/lKSidcsrnolT69SKN
	l89rhNNzLkayHObHxcVBm5Zw0I81ivsnQn+o3Y/NNx6lTWToYL4+grOTyFNJs4K4PUv4aH3TvCpp2
	dBCiznpgLMWzrg3oFhuHh7UTMW/+1fGDGJoEgYm9pxjm54CG3LYbpfIbdRZOh8skcuONWLNqC4kg/
	tMu9MH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmKc-00000004lfv-1fPb;
	Wed, 02 Apr 2025 00:51:50 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmFW-00000004kg7-3Xi0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 00:46:36 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 2884E60A67
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Apr 2025 02:46:24 +0200 (CEST)
Received: (qmail 23192 invoked by uid 988); 2 Apr 2025 00:46:23 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 02 Apr 2025 02:46:23 +0200
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] mt7915: mcu: re-init MCU before loading FW patch
Date: Wed,  2 Apr 2025 02:45:27 +0200
Message-ID: <20250402004528.1036715-3-mail@david-bauer.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250402004528.1036715-1-mail@david-bauer.net>
References: <20250402004528.1036715-1-mail@david-bauer.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=ZDX/F/uaex4ndiB551575kE2oTtysLodPUsWsi6X8BQ=;
	b=Ycc4JtKw/MQH+qC74VcmTdBWEb/Kw9qqatf42KdbSJM79kDfAr51QTqkK0mA/AdZnwy2rvV+r6
	Kqrvl7AE1fDHgDP32FkpUdwQbTOCmQt0Hj8A8sK+31WXUnBNJBHG6nZwGq6LqGwZeIhbflsD18J/
	HvHCrVLcniISeJPI2P6BNx8VmR+TakIaNQZbEBp+K6YM1LoaPj2UtM4J/GpQq5CVj2WFuZFnFb2Y
	gCQLIgjZKCitFR8Sr8EyERX/F+lAao2SOzDMHKLBdOD9vVUrSO52cr0e6oh5ndbXA2+1wpTIMfVB
	phmA3c9vUlHOsXdIHHLdBkcSBk51QjeX4StnEpyQBsAau02Ep4yse6g4TLgIKM5MKD4wcGk9EnHP
	p9n+9tyb5pH6sUhPKoWChxdK/JFiOvwSVYPaSPJn3n0/jDJ8dAjfmdmgsQnrBLdaM0eMUXYR0A8z
	zkx+LmUQ+bBWH5v2t/b6wHsvMnd5y7VQDqJq1tslqzyctmLRqc7/A8m/QN492a4i4swpVURHXoRP
	nYID2YffFTsONxXmEFxZhPR0frZR7zrOqVDPs93FspR+mtRqospCOPisja59xVBPao2t3RcI22vA
	gp3AfwpBd3RtEtZwby7trfO1UvQyMZodd8LozqkcaMG537T+DPYBcePw9O1h5P/ueksKot4pesJ2
	o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_174635_015637_4A885330 
X-CRM114-Status: GOOD (  13.89  )
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

Restart the MCU and release the patch semaphore before loading the MCU
patch firmware from the host.

This fixes failures upon error recovery in case the semaphore was
previously taken and never released by the host.

This happens from time to time upon triggering a full-chip error
recovery. Under this circumstance, the hardware restart fails and the
radio is rendered inoperational.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index d93a72d0a78a..41eba991acef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2097,16 +2097,21 @@ static int mt7915_load_firmware(struct mt7915_dev *dev)
 {
 	int ret;
 
-	/* make sure fw is download state */
-	if (mt7915_firmware_state(dev, false)) {
-		/* restart firmware once */
-		mt76_connac_mcu_restart(&dev->mt76);
-		ret = mt7915_firmware_state(dev, false);
-		if (ret) {
-			dev_err(dev->mt76.dev,
-				"Firmware is not ready for download\n");
-			return ret;
-		}
+	/* Release Semaphore if taken by previous failed attempt */
+	ret = mt76_connac_mcu_patch_sem_ctrl(&dev->mt76, false);
+	if (ret != PATCH_REL_SEM_SUCCESS) {
+		dev_err(dev->mt76.dev, "Could not release semaphore\n");
+		/* Continue anyways */
+	}
+
+	/* Always restart MCU firmware */
+	mt76_connac_mcu_restart(&dev->mt76);
+
+	/* Check if MCU is ready */
+	ret = mt7915_firmware_state(dev, false);
+	if (ret) {
+		dev_err(dev->mt76.dev, "Firmware did not enter download state\n");
+		return ret;
 	}
 
 	ret = mt76_connac2_load_patch(&dev->mt76, fw_name_var(dev, ROM_PATCH));
-- 
2.47.2


