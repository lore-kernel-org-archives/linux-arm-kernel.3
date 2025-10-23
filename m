Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6377DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPT3sf8wfY5DQqpAI6BRq5NilA1XIkGCBR2IAG2jviE=; b=NGRzHwZBuq893geQWeKlgO2QNI
	UTIjPoGOdTeZCA6hnM8K2f6KSUt3EtK+E6xJcfRb87/+gz2rd8piuK8i8hY+fMCqcQhJYArJ/8gzd
	VNNO6GpPHPo+I//dF7u/GIn6UTnwJLW1JgmGIg5MHsMyEInpXz/EL0Vai598IFf1jp7buOl+TObbM
	RVuTheMTFKFa+RJIan3dh63aTeXxppUTW4rGTpk0AkN7HoQn6eh5dN5ULsuamszgujyS4k7pQGs93
	Uj4lA1lbMOif6dGn1GvNByzcHikhccWr/KW9Dfbi0oYy5M7B0s6bP6bWY/eMInQ6BHx2ldIWcvqPu
	j+6wLvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1MS-00000007RKo-0lT3;
	Thu, 23 Oct 2025 19:52:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1ML-00000007RDH-3Gtz;
	Thu, 23 Oct 2025 19:52:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761249138; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DdOqNvBqKEdc4eEzkGr7mK7LmCB7Y31YeJCoSLMgIe6TQiUkw+EzOLS2qJGDAm+EvaCcXIw3ALdgGRblsOhi2TdMhsuNegBmmhLP4aNpHdokthKXOLfPLfjYQloOS88sT7fMVrF2K6DEITjYyzRK8qBizl8kKJ2b1vMO0DjspB8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761249138; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CPT3sf8wfY5DQqpAI6BRq5NilA1XIkGCBR2IAG2jviE=; 
	b=W8WUFTbQUsRHcPn0VEKtbsEaeENRWUwDSx9Ld2xweUDTSh/cA/GZls98/7eOo0UIuS2YMFfy/lVJq7oG+N1kigGt07kpDXokH9wR2b4c2mzVgxVoIULXRWCEn8y4M/mzPmu0T+vgJ4AujoecdtjeovNppG6wLJD8LXKiVf/T1CQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761249138;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=CPT3sf8wfY5DQqpAI6BRq5NilA1XIkGCBR2IAG2jviE=;
	b=aFYUQe0SY9XnLYIz6viIFfOYDxZH6qAOZOO6pszLuthpL92Ndc7OA5tOqsj4lGXF
	a9kGP4ZWHNZVDjcDX6cWjDJIrETJH2nnhq7LCvsuXKepd1N/gggn6k3UncxzSb7bblH
	H/g/Q43UGNoupXcgpZKPuDJNUFDDCgFSbgSpMscA=
Received: by mx.zohomail.com with SMTPS id 1761249137337622.7696583604552;
	Thu, 23 Oct 2025 12:52:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Oct 2025 21:49:38 +0200
Subject: [PATCH v3 20/24] scsi: ufs: mediatek: Rework hardware version
 reading
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt8196-ufs-v3-20-0f04b4a795ff@collabora.com>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
In-Reply-To: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_125230_432438_A2F98218 
X-CRM114-Status: GOOD (  14.35  )
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

Split assignment to the host struct out from the read function, and
utilise bitfield helpers to simplify the code. Also move the debug print
out of the legacy version helper, which means it no longer has to take a
struct ufs_hba as an input, and can be rewritten as a pure function.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 65 +++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 22b9e10b1560..6f54c5a35dc4 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -797,50 +797,47 @@ static void ufs_mtk_mcq_set_irq_affinity(struct ufs_hba *hba, unsigned int cpu)
 	dev_dbg(hba->dev, "set irq %d affinity to CPU %d\n", irq, _cpu);
 }
 
-static bool ufs_mtk_is_legacy_chipset(struct ufs_hba *hba, u32 hw_ip_ver)
+static bool __pure ufs_mtk_is_legacy_chipset(u32 hw_ip_ver)
 {
-	bool is_legacy = false;
-
 	switch (hw_ip_ver) {
 	case IP_LEGACY_VER_MT6893:
 	case IP_LEGACY_VER_MT6781:
 		/* can add other legacy chipset ID here accordingly */
-		is_legacy = true;
-		break;
-	default:
-		break;
+		return true;
 	}
-	dev_dbg(hba->dev, "IP version 0x%x, legacy = %s", hw_ip_ver,
-		str_true_false(is_legacy));
 
-	return is_legacy;
+	return false;
 }
 
-/*
- * HW version format has been changed from 01MMmmmm to 1MMMmmmm, since
- * project MT6878. In order to perform correct version comparison,
- * version number is changed by SW for the following projects.
- * IP_VER_MT6983	0x00360000 to 0x10360000
- * IP_VER_MT6897	0x01440000 to 0x10440000
- * IP_VER_MT6989	0x01450000 to 0x10450000
- * IP_VER_MT6991	0x01460000 to 0x10460000
+#define MTK_UFS_VER_PREFIX_M (0xFF << 24)
+
+/**
+ * ufs_mtk_get_hw_ip_version - read and return adjusted hardware version
+ * @hba: pointer to this device's &struct ufs_hba
+ *
+ * Reads, transforms and returns the hardware version.
+ *
+ * Since MT6878, the versioning scheme was changed from 01MMmmmm to 1MMMmmmm.
+ * In order to support version comparisons across these different versioning
+ * schemes, this function transforms the older style to the newer one.
+ *
+ * For example:
+ *  MT6983 is transformed from 0x00360000 to 0x10360000
+ *  MT6897 is transformed from 0x01440000 to 0x10440000
+ *  MT6989 is transformed from 0x01450000 to 0x10450000
+ *  MT6991 is transformed from 0x01460000 to 0x10460000
+ *
+ * Returns a u32 representing the hardware version.
  */
-static void ufs_mtk_get_hw_ip_version(struct ufs_hba *hba)
+static u32 ufs_mtk_get_hw_ip_version(struct ufs_hba *hba)
 {
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-	u32 hw_ip_ver;
+	u32 version = ufshcd_readl(hba, REG_UFS_MTK_IP_VER);
+	u32 prefix = FIELD_GET(MTK_UFS_VER_PREFIX_M, version);
 
-	hw_ip_ver = ufshcd_readl(hba, REG_UFS_MTK_IP_VER);
+	if (prefix <= 1)
+		FIELD_MODIFY(MTK_UFS_VER_PREFIX_M, &version, BIT(28));
 
-	if (((hw_ip_ver & (0xFF << 24)) == (0x1 << 24)) ||
-	    ((hw_ip_ver & (0xFF << 24)) == 0)) {
-		hw_ip_ver &= ~(0xFF << 24);
-		hw_ip_ver |= (0x1 << 28);
-	}
-
-	host->ip_ver = hw_ip_ver;
-
-	host->legacy_ip_ver = ufs_mtk_is_legacy_chipset(hba, hw_ip_ver);
+	return version;
 }
 
 static void ufs_mtk_get_controller_version(struct ufs_hba *hba)
@@ -1178,7 +1175,11 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 
 	ufs_mtk_setup_clocks(hba, true, POST_CHANGE);
 
-	ufs_mtk_get_hw_ip_version(hba);
+	host->ip_ver = ufs_mtk_get_hw_ip_version(hba);
+	host->legacy_ip_ver = ufs_mtk_is_legacy_chipset(host->ip_ver);
+
+	dev_dbg(hba->dev, "IP version 0x%x, legacy = %s", host->ip_ver,
+		str_true_false(host->legacy_ip_ver));
 
 	return 0;
 

-- 
2.51.1.dirty


