Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5FED116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QswTmhmm9cxp2zJRf5Xns5t1jSqZYBVvb7gt5exo6yw=; b=arQz9JRarlFE5bMuBfjxkvNrGb
	us4vqzujtuQIPrjb9pU/yZe236pbxy7q3DLHfp6o4henTMXdc6hPKQvk2SAq57I6HBgdftOXReKyE
	hgjZA+4Q7LSQ/w26pXznu+jKndjlY1/XMjxvFjzx4GH+7l/L9aBzKNN2vINsnwTv4kuwuWqs40GD/
	bY0vviuy/MF0TmRICRVLVtKkf02or4ByKVxPsPs2syrIJW6jGvqfk2rzzms5OiwZ5oTKtj7/t5W/q
	WTi0N8zoYbaX2LiVDIMay/csZ7VxKLGMuqVKYGIgsST3T74H2FC+FLb4JGYKJ0HIulWyAVxIp8gyS
	DGvbDQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0nk-00000003HKS-04ys;
	Mon, 01 Dec 2025 10:06:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0ng-00000003HJO-43Gm;
	Mon, 01 Dec 2025 10:06:34 +0000
X-UUID: 65fb52c0ce9d11f09f706fa2197c6ceb-20251201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QswTmhmm9cxp2zJRf5Xns5t1jSqZYBVvb7gt5exo6yw=;
	b=mshZJ17hBt0Fx2EZ7lCU/obt7tVqqHT0j6Ojv90mHe1pWBh9HnReuTzgY7q+2AjzO25OM1inUjKfRUNofLR3ZaEF5evFkT73yxIUAOB4v4gkKWTYa7UWC1mt0+qnXJYe2wwvvLNe7oRDIBNYX7orqfJSzqw52YlWt/X3zMu3JS4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4385181d-958f-4cbc-a3be-16c75a703374,IP:0,UR
	L:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-20
X-CID-META: VersionHash:a9d874c,CLOUDID:45634502-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:1|19,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 65fb52c0ce9d11f09f706fa2197c6ceb-20251201
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <hanchien.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1022474283; Mon, 01 Dec 2025 03:06:26 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 1 Dec 2025 18:06:23 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 1 Dec 2025 18:06:23 +0800
From: Hanchien Lin <hanchien.lin@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Balsam
 CHIHI" <bchihi@baylibre.com>
CC: <Hanchien.lin@mediatek.com>, <Irving-CH.lin@mediatek.com>, Jh Hsu
	<Jh.Hsu@mediatek.com>, WH Wu <vincent.wu@mediatek.com>, Raymond Sun
	<Raymond.Sun@mediatek.com>, Sirius Wang <Sirius.Wang@mediatek.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <hanchien.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/2] arm64: dts/thermal: Add MT8189 thermal controller and driver support
Date: Mon, 1 Dec 2025 18:06:18 +0800
Message-ID: <20251201100620.1557608-1-hanchien.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_020633_019799_50F946F0 
X-CRM114-Status: GOOD (  10.48  )
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

This patch series adds support for the thermal controller on MediaTek MT8189 SoC.

Patch 1 adds the device tree node for the MT8189 thermal controller.
Patch 2 adds MT8189 support to the LVTS thermal driver.

Link to v1: https://lore.kernel.org/all/20251110094113.3965182-1-hanchien.lin@mediatek.com/

Changes in v2:
- Change reset functions from devm_reset_control_get_by_index to devm_reset_control_get_exclusive from reviewers comment.
- Change some use of line breaks and commas for coding style from other mediatek drivers.

Hanchien Lin (2):
  arm64: dts: mediatek: mt8189: Add thermal controller node
  thermal/drivers/mediatek/lvts_thermal: Add MT8189 support

 .../thermal/mediatek,lvts-thermal.yaml        |  27 +++-
 drivers/thermal/mediatek/lvts_thermal.c       | 151 ++++++++++++++++--
 .../thermal/mediatek,lvts-thermal.h           |  20 +++
 3 files changed, 185 insertions(+), 13 deletions(-)

-- 
2.45.2

Thanks,
Hanchien Lin <hanchien.lin@mediatek.com>

