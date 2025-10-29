Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAEB9CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5rqruaBGbdBage9RelMNC/uGmvBCpu4gWGsl5QOYqT0=; b=wFgTEdJV0TOcVWOTDmEqnLYBUN
	G5Ey8suOV6ws6gvi+OtAHgJlviBggq51wIGfeS9salq/kv2Ow9WzzXCLNdnS9101nOCISITOmPdiQ
	IiRDNg3focxnPkM8Gx4/Vjl5IpzVcSzIdcSJffR2k++CwEar2Aj37XNAp7xbIjmwdaLzXgrZ2vZtN
	QX96W6DMwaU2dpteG51ezgV1nVfHxDKgd+pVowAni19rK7Cyj11h899RxtEBX3sGXl7pDcXaaXCnN
	5IqsdCe/mmclTDreeBCA1JWvDNOEwc7UuBXe4CcWRZPVp1gA6H4fAX8lmQQtkIoJ4jnCGt5N4nMuV
	5niE/nsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE69u-00000001Lgl-45B2;
	Wed, 29 Oct 2025 13:24:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE69s-00000001LgD-0Phv;
	Wed, 29 Oct 2025 13:24:13 +0000
X-UUID: 6900e1aeb4c811f09f706fa2197c6ceb-20251029
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5rqruaBGbdBage9RelMNC/uGmvBCpu4gWGsl5QOYqT0=;
	b=pk9g9oaSYj3I+TOZUiQQGGHiCWJRB61dGuuMc0yCvDer0LubkfUzbbDEGLelDX7P58QHftHW/ISbCMet9wVF4uL8mNn0DAoGqPcmwh5mMoelcPNs6BkTL3I/uPZOsrmwO0xlGKvbOsCS0kKK100+Er44P9SZROenVmEp3q8hsfE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3591013f-075c-438b-bd98-f01bf2595e04,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:74a96326-cfd6-4a1d-a1a8-72ac3fdb69c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6900e1aeb4c811f09f706fa2197c6ceb-20251029
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <sirius.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1122297030; Wed, 29 Oct 2025 06:08:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 29 Oct 2025 21:08:45 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 29 Oct 2025 21:08:45 +0800
From: Sirius Wang <sirius.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>
CC: <wenst@chromium.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <jh.hsu@mediatek.com>,
	Sirius Wang <sirius.wang@mediatek.com>
Subject: [PATCH] soc: mediatek: mtk-socinfo: Add extra entry for MT8189
Date: Wed, 29 Oct 2025 21:08:34 +0800
Message-ID: <20251029130842.32633-1-sirius.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_062412_136368_036B0984 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

The MT8189 has a different socinfo match for MT8189 SoC
(commercial name Kompanio 540), so add it the driver.

Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index c697a0398d91..32153c122416 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -50,6 +50,8 @@ static struct socinfo_data socinfo_data_table[] = {
 	MTK_SOCINFO_ENTRY("MT8186T", "MT8186TV/AZA", "Kompanio 528", 0x81862001, CELL_NOT_USED),
 	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/AZA", "Kompanio 838", 0x81880000, 0x00000010),
 	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/HZA", "Kompanio 838", 0x81880000, 0x00000011),
+	MTK_SOCINFO_ENTRY("MT8189", "MT8189GV/AZA", "Kompanio 540", 0x81890000, 0x00000020),
+	MTK_SOCINFO_ENTRY("MT8189", "MT8189HV/AZA", "Kompanio 540", 0x81890000, 0x00000021),
 	MTK_SOCINFO_ENTRY("MT8192", "MT8192V/AZA", "Kompanio 820", 0x00001100, 0x00040080),
 	MTK_SOCINFO_ENTRY("MT8192T", "MT8192V/ATZA", "Kompanio 828", 0x00000100, 0x000400C0),
 	MTK_SOCINFO_ENTRY("MT8195", "MT8195GV/EZA", "Kompanio 1200", 0x81950300, CELL_NOT_USED),
-- 
2.45.2


