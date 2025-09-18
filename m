Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E0BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYI0VLNGPFF+BPC8SpD1zlWgSvD0SEyXsY08IItMsME=; b=0WghUBgZIfyfEu8KmMY/WkIbhe
	cMDV/VkVA4ucX08c9Y2vFVyiZqQyysix+/v5FKPcY8VwHyzP2mpFuetZJ83ujET3IxA2J02MTv1OR
	o/rTUFwMYoIYay5YdUGuR+kvfLNaBQAnPeBowwFCi9nK/N64revkRkiz4B48+Ktabgrvi6R3W7WVN
	E8dr4KAxpLGYbbBhShnc1gUKwOx6KRHDhHgOR5jPGcXHMeSJOnZWMmTRCAkuyJwvVR8GziNKGBkDl
	6zxI5EY6muTaJWsli31KVbKpSkWvuhgIg7ZIvczBz39FowpF503tW2hOt6ICrGBFyzFKk7h/IL8hu
	JfDpt4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDaR-0000000HMe4-0iZl;
	Thu, 18 Sep 2025 12:18:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDaM-0000000HMbX-1GsE;
	Thu, 18 Sep 2025 12:18:03 +0000
X-UUID: 82fe53fc948911f09f706fa2197c6ceb-20250918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KYI0VLNGPFF+BPC8SpD1zlWgSvD0SEyXsY08IItMsME=;
	b=dtHP/ZEKU7fjC9FaGLAWuol/WpeOteHi8F+zGdYEbSskpkwb7zw/HZaDWnz/jficU2XaKkRSPOeCBwF9Gm5++JhbrobrF2Ch5nBFrpkrm4PbbMkXDaOESq4egP9Px5k6bkivNk+KXla7AMUtxEwp/miv/XoMTL++ieu/fY0qz2k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:d420f21c-aad3-4119-aa95-36ed5fb7fe91,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:1ca6b93,CLOUDID:a199ee84-5317-4626-9d82-238d715c253f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 82fe53fc948911f09f706fa2197c6ceb-20250918
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 630976591; Thu, 18 Sep 2025 05:17:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 18 Sep 2025 20:17:54 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 18 Sep 2025 20:17:54 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang
	<sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 4/4] arm64: defconfig: Enable UFS support for MediaTek Genio 1200 EVK UFS board
Date: Thu, 18 Sep 2025 20:17:50 +0800
Message-ID: <20250918121751.229554-4-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250918121751.229554-1-macpaul.lin@mediatek.com>
References: <20250918121751.229554-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_051802_341907_A76ED7D7 
X-CRM114-Status: GOOD (  10.47  )
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
 - CONFIG_SCSI_UFS_MEDIATEK

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

Changes for v2:
 - No changes.

Changes for v3:
 - Enable CONFIG_SCSI_UFS_MEDIATEK as a built-in option, since it’s
   required to mount the root filesystem during boot.
 - Use 'make savedefconfig' to generate patch. Thanks for reminding.

Changes for v4:
 - No change. Add Reviewed-by tag. Thanks!

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..c4601925221c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1218,6 +1218,7 @@ CONFIG_SCSI_UFS_BSG=y
 CONFIG_SCSI_UFSHCD_PLATFORM=y
 CONFIG_SCSI_UFS_CDNS_PLATFORM=m
 CONFIG_SCSI_UFS_QCOM=m
+CONFIG_SCSI_UFS_MEDIATEK=y
 CONFIG_SCSI_UFS_HISI=y
 CONFIG_SCSI_UFS_RENESAS=m
 CONFIG_SCSI_UFS_TI_J721E=m
-- 
2.45.2


