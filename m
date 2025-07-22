Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17817C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIPLtydVOOolgOzaD5g4zStGuHr68At93a/rtnTkrP8=; b=tI49VC/tOdYUTm5QFLj8FAOVhU
	ZFT89usj/F9Azc+GAcFA4BMnd83sBexXdLW2OhNS1HihiY+zdbvdPU1yBcVQ+FyJAXwNChUob9Je3
	ovMmDMG75tU5+uQROkegXiIElbb10iZ5D7Z7yu9ylona5bxFJIz/fWTfO0VNKyCvOtiBkssTDS2rH
	zV2oX8Fe85ZkuS6zawSGpLggLLKmz+3C6dxX0XAKBoe7m6L+JuydyMPRdL0gNdxYvTHBDOeiub3Un
	oSQACsYFCA6PTdr3CVp9tuKAm1Tny/F0dt0eM9CILI0liKlt/YQMI4ot8nYJLKizPjHK/V2z4WlFj
	KPkHTMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue94p-00000001xxy-1WXB;
	Tue, 22 Jul 2025 09:14:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8pO-00000001vFj-2nbD;
	Tue, 22 Jul 2025 08:58:28 +0000
X-UUID: 0455468266da11f09eb0dd999d3936bf-20250722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LIPLtydVOOolgOzaD5g4zStGuHr68At93a/rtnTkrP8=;
	b=Bw8Ngf/xJR/X8QkBwpvrpnXl7ykhHTU/BwYzsohCTz7kfsapKHQN8Jqj0anoh4D+1tXwpPpjMaUWllZ6aueVJPMiwTffQoFB63edaWdbWckX3Yqu0Tf45BShPJwd5z38HjFIPRVXKRePg5VuDCQ0OV4oq1in5y2MeyvxGKe8WpA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:61acdc48-0fc4-4c03-8de1-c0fa3412a6b0,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:9eb4ff7,CLOUDID:09661f50-93b9-417a-b51d-915a29f1620f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0455468266da11f09eb0dd999d3936bf-20250722
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1812454121; Tue, 22 Jul 2025 01:58:21 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Jul 2025 16:58:17 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Jul 2025 16:58:17 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Sean Wang
	<sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 4/4] arm64: defconfig: Enable UFS support for MediaTek Genio 1200 EVK UFS board
Date: Tue, 22 Jul 2025 16:58:11 +0800
Message-ID: <20250722085811.2062790-4-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250722085811.2062790-1-macpaul.lin@mediatek.com>
References: <20250722085811.2062790-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_015826_705544_375F53C8 
X-CRM114-Status: GOOD (  10.37  )
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

Enable the UFS related settings to support Genio 1200 EVK UFS board.
This board uses UFS as the boot device and also the main storage.
This includes support for:
 - CONFIG_PHY_MTK_UFS
 - CONFIG_SCSI_UFS_MEDIATEK

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

Changes for v2:
 - No changes.

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cc82faf1371c..b3c6728ed5dc 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1216,6 +1216,7 @@ CONFIG_SCSI_UFS_BSG=y
 CONFIG_SCSI_UFSHCD_PLATFORM=y
 CONFIG_SCSI_UFS_CDNS_PLATFORM=m
 CONFIG_SCSI_UFS_QCOM=m
+CONFIG_SCSI_UFS_MEDIATEK=m
 CONFIG_SCSI_UFS_HISI=y
 CONFIG_SCSI_UFS_RENESAS=m
 CONFIG_SCSI_UFS_TI_J721E=m
@@ -1616,6 +1617,7 @@ CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_PCIE=m
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_UFS=m
 CONFIG_PHY_MTK_HDMI=m
 CONFIG_PHY_MTK_MIPI_DSI=m
 CONFIG_PHY_MTK_DP=m
-- 
2.45.2


