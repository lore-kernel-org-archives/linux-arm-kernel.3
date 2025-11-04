Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBE7CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yRIS9Quy51a3mNw2C7dYSGFB2RcLs93hOIiFJCI5w1w=; b=0r0YXUoO4/sGSAlH6xuBuvZjVG
	pFxsz1KjHOZy5SqDN/EmrF/YlZ0yGCmuyg3BENvpebgwSlXQCSAHTYvqIjLwKohDGRdX05n5pGaZ2
	n4Ra9dV6ADJKjWnjZny9yembKAOA52JJzD+C0JwaCzWuQS8WmlP8XFXX/+hZfRwzJQwxpjtKvWZKr
	A8rHgFUPanzzZA7jXhMHmu4ChJQ5MxVnzGuff9/jT3xBozOwR73bF4jXlQHETBEHogeO/PaK6Xb6T
	9pKRHcuXQ46k0ani2wzs5VaOoAFjEom85CHkNiBgSKgn5S+CzOifHSS8eJYXB8Cr8G4r9G0bTuaUj
	tAxmb9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7WP-0000000B2VR-3PZD;
	Tue, 04 Nov 2025 03:15:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7WK-0000000B2Tf-1urk;
	Tue, 04 Nov 2025 03:15:47 +0000
X-UUID: 8b9aaa66b92c11f0a52f393f94899d25-20251103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=yRIS9Quy51a3mNw2C7dYSGFB2RcLs93hOIiFJCI5w1w=;
	b=Rs5Uao0s8TyLHYaLLyEZQ7G9D0ZWI15aAru4eP/eyQx9bxKQE45hzRrc43DzfF4TC7FdqtiqtClc3Mgp6fI6kW0ucop2oqp7kPXWUTb+9tAS7V51EFOu56YeZdgEPyMAKO6gcPUQXwnWyrF1kB2BzaY94KC7zLg5DuUOvaxJoGs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:fbdc5e09-12b1-43dc-800b-2dcf376ef2dd,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1078e07c-f9d7-466d-a1f7-15b5fcad2ce6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8b9aaa66b92c11f0a52f393f94899d25-20251103
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <niklaus.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 40326313; Mon, 03 Nov 2025 20:15:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 4 Nov 2025 11:15:39 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 4 Nov 2025 11:15:39 +0800
From: niklaus.liu <Niklaus.Liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <zhigang.qin@mediatek.com>, <sen.chu@mediatek.com>,
	Niklaus Liu <niklaus.liu@mediatek.com>
Subject: [PATCH 1/1] soc: mediatek: mtk-regulator-coupler: Add support for MT8189
Date: Tue, 4 Nov 2025 11:15:11 +0800
Message-ID: <20251104031533.9419-2-Niklaus.Liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251104031533.9419-1-Niklaus.Liu@mediatek.com>
References: <20251104031533.9419-1-Niklaus.Liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_191546_915491_D1A26F1D 
X-CRM114-Status: GOOD (  15.85  )
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

From: Niklaus Liu <niklaus.liu@mediatek.com>

Enhance the regulator coupler driver to support GPU power control on the
MediaTek MT8189 platform. This update ensures proper coordination of
multiple regulators required for GPU operation,improving power management
and system stability.

Signed-off-by: Niklaus Liu <niklaus.liu@mediatek.com>
---
 drivers/soc/mediatek/mtk-regulator-coupler.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
index 0b6a2884145e..f6e3b2a3a5a8 100644
--- a/drivers/soc/mediatek/mtk-regulator-coupler.c
+++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
@@ -42,6 +42,18 @@ static int mediatek_regulator_balance_voltage(struct regulator_coupler *coupler,
 	int max_uV = INT_MAX;
 	int ret;
 
+	/*
+	 * When vsram_gpu is enabled or disabled and the use_count of the
+	 * vsram_gpu regulator is zero, the regulator coupler driver will
+	 * execute regulator_do_balance_voltage, which adjusts the vsram_gpu
+	 * voltage to the minimum value. This may result in vsram_gpu being
+	 * lower than vgpu. Therefore, when enabling or disabling vsram_gpu,
+	 * the 8189 temporarily skips the regulator coupler driver's modification
+	 * of the vsram_gpu voltage.
+	 */
+	if (of_machine_is_compatible("mediatek,mt8189") && rdev == mrc->vsram_rdev)
+		return 0;
+
 	/*
 	 * If the target device is on, setting the SRAM voltage directly
 	 * is not supported as it scales through its coupled supply voltage.
@@ -148,7 +160,8 @@ static int mediatek_regulator_coupler_init(void)
 	if (!of_machine_is_compatible("mediatek,mt8183") &&
 	    !of_machine_is_compatible("mediatek,mt8186") &&
 	    !of_machine_is_compatible("mediatek,mt8188") &&
-	    !of_machine_is_compatible("mediatek,mt8192"))
+	    !of_machine_is_compatible("mediatek,mt8192") &&
+	    !of_machine_is_compatible("mediatek,mt8189"))
 		return 0;
 
 	return regulator_coupler_register(&mediatek_coupler.coupler);
-- 
2.46.0


