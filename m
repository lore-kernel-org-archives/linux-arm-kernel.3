Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97254C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 03:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRKbm8MkDmyaqkiaP1DwdDeOmQ+erOodCBiH4VJGyeM=; b=UpDDcsC04vVZfLsqO75WxRWJQl
	XzDvs67UUVuUAL40yLw4nk19A1B7RZ2hh4YdwxqqmTHpn8Z/uZXGgdLjVdiDygwogrzh/ioVQBDwe
	rU4bUvZ859SE4TeHoIpj2vUPvsyKFC7RCTvDTKzcRj2fVR8Dgem0/42c0cV91t+rBxf9UKcBgY787
	u/VfgTA4nXTAunNHCmuzuzGtBTFASlrW+5bY3CExoDmGy530rGX7w9wwSN9V8SljJXdzm2KW52WDe
	6Qgk0r7jtFsgy6hdKYKNoeaYkjCV/ybxq3E7dr11wrpytXLoz+IOnzKkQTt0Et7QzcJfxncJ9JQdD
	RL35ealQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zoA-00000002dvc-2j1c;
	Tue, 08 Apr 2025 03:39:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1zhD-00000002d6Z-3XYz;
	Tue, 08 Apr 2025 03:32:21 +0000
X-UUID: 11de310e142a11f0a1e849db4cc18d44-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NRKbm8MkDmyaqkiaP1DwdDeOmQ+erOodCBiH4VJGyeM=;
	b=WTyExuL2ITQfMt/vXMRwbKapmtOL2J/tVZtyJKVQR4dgYh/XJjEd4iDSHmiRtlviKOMIK+XbSmjLxFxazMsFeNXriJW+E3Vq3LhajFAuQtAeKxvHEA8z8sDLeNeaPia3zmdAGYAMLaCH/L1QujEimKjqkGZ04KPIiYwiqFJ34mI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:8e2cb524-6cb1-4aae-b508-03c0a7227136,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:fc7a114b-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 11de310e142a11f0a1e849db4cc18d44-20250407
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1612144450; Mon, 07 Apr 2025 20:32:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Apr 2025 11:32:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Apr 2025 11:32:13 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: Friday Yang <friday.yang@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 3/3] memory: mtk-smi: mt8188: Use devm_pm_runtime_enable
Date: Tue, 8 Apr 2025 11:31:56 +0800
Message-ID: <20250408033206.12176-4-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250408033206.12176-1-friday.yang@mediatek.com>
References: <20250408033206.12176-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_203219_880814_0E5B7790 
X-CRM114-Status: GOOD (  11.69  )
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

Replace pm_runtime_enable with the devres-enabled version which
can trigger pm_runtime_disable.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 drivers/memory/mtk-smi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index f25d46d2ef33..daef6d350419 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -713,16 +713,17 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_link_remove;

-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		goto err_link_remove;
+
 	platform_set_drvdata(pdev, larb);
 	ret = component_add(dev, &mtk_smi_larb_component_ops);
 	if (ret)
-		goto err_pm_disable;
+		goto err_link_remove;

 	return 0;

-err_pm_disable:
-	pm_runtime_disable(dev);
 err_link_remove:
 	device_link_remove(dev, larb->smi_common_dev);
 	return ret;
@@ -733,7 +734,6 @@ static void mtk_smi_larb_remove(struct platform_device *pdev)
 	struct mtk_smi_larb *larb = platform_get_drvdata(pdev);

 	device_link_remove(&pdev->dev, larb->smi_common_dev);
-	pm_runtime_disable(&pdev->dev);
 	component_del(&pdev->dev, &mtk_smi_larb_component_ops);
 }

@@ -954,7 +954,10 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 			return ret;
 	}

-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, common);
 	return 0;
 }
@@ -965,7 +968,6 @@ static void mtk_smi_common_remove(struct platform_device *pdev)

 	if (common->plat->type == MTK_SMI_GEN2_SUB_COMM)
 		device_link_remove(&pdev->dev, common->smi_common_dev);
-	pm_runtime_disable(&pdev->dev);
 }

 static int __maybe_unused mtk_smi_common_resume(struct device *dev)
--
2.46.0


