Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81D3C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 04:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37qLIotRPmnzaW20h2NotUNPVBXaNkInrrMEcIH9xM8=; b=dvnFTEROgu7GGpCPVjU5fg5ZI3
	LWzeB5mkNf+Pc9JxW4qpIZzYAP4n3j2QFm2+sAzXuw1D30V8ULzIBYiAHZR3WS/qvNrxBhCzyhgY7
	S63EhiyJiU02zOxnJyKJHHJwton0qrOX9IvbDKeJKhwLqSih6eG2ongH3zC5NoQSEn7d3sRs12vw5
	HYd/BJe+z9ZKAK55x7Nz7nVcuiMJyCoG2sTT9YtW/Gmb9ROlCun6uEz16zAW6yojUKE18616YdoEz
	t6fU+eQH3zE0E+FXe/8rznka4ir4ihKpPSs1Wyl+rsqbSiPj8HikXp+LgpaL5u7uRNNnNKoFoW+PG
	GVHZvSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPQY-0000000D7sp-0GYP;
	Fri, 07 Mar 2025 04:35:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOe8-0000000D26K-2Xcu;
	Fri, 07 Mar 2025 03:45:13 +0000
X-UUID: 8edc2feafb0611ef83f2a1c9db70dae0-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=37qLIotRPmnzaW20h2NotUNPVBXaNkInrrMEcIH9xM8=;
	b=EXbtUzLEGNB/rHQC2d7z1Vy2TFnSpDV0bPghkl49mzFJen5Y6jxM/Wyr0WWYCNo9mxfaGl89ZxRzFde/XKpDVh1aydYRgfz8xahMURrOSLFYfmuKkwruNxCqbqdZkRzgQm7fupeGScWNIxSKMyg/LFQ7sy/h48GlRbgeoKAqVfY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e11a70c4-25ac-426f-89e8-0ddb49480d40,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:7a97108c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 8edc2feafb0611ef83f2a1c9db70dae0-20250306
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1268841428; Thu, 06 Mar 2025 20:45:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:45:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:45:02 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, Guangjie Song <guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 07/13] pmdomain: mediatek: Support power domain irq safe
Date: Fri, 7 Mar 2025 11:44:31 +0800
Message-ID: <20250307034454.12243-8-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307034454.12243-1-guangjie.song@mediatek.com>
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_194512_654289_07AE8CE5 
X-CRM114-Status: UNSURE (   8.81  )
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

Support power domain is irq safe with MTK_SCPD_IRQ_SAFE.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index 0ae4c617b5a6..467c54e24bea 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -42,6 +42,7 @@
 #define MTK_SCPD_PEXTP_PHY_RTFF		BIT(8)
 #define MTK_SCPD_UFS_RTFF		BIT(9)
 #define MTK_SCPD_RTFF_DELAY		BIT(10)
+#define MTK_SCPD_IRQ_SAFE		BIT(11)
 #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
 
 #define SPM_VDE_PWR_CON			0x0210
@@ -897,6 +898,8 @@ static struct scp *init_scp(struct platform_device *pdev,
 		}
 		if (MTK_SCPD_CAPS(scpd, MTK_SCPD_ACTIVE_WAKEUP))
 			genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
+		if (MTK_SCPD_CAPS(scpd, MTK_SCPD_IRQ_SAFE))
+			genpd->flags |= GENPD_FLAG_IRQ_SAFE;
 	}
 
 	return scp;
-- 
2.45.2


