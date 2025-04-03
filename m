Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7E6C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QDJ27iW4X63WdVZOkwgFkljRednxU+tqzHABvD19+JY=; b=3QKXhNVjsZbfAsTW8jNBKUCLTL
	2nKHsCs17AzaeTAucvpo4V4qxmiD8Rtyt2YexkKd9UyHTkBTrfMPb5qR7aVixIqR+uzhlgPlJjEcJ
	tH9twIaXhXtUbX3MxYIcntD1kXFHhmyDuRBqA9aUsz5yvoTTg7V8r58z5ztkFuq7Ei8lkh7nned8Y
	wHkCT7In0ckvtA+z7GbHN0qeCNpSYNXw7dtPQSmVAON7PpL8B6bcIlV1Du1ju8cM/k70DIsLNukRP
	XoyosOGHWQ7PaIzWpYXAxTx4sUQcNZMIsn2sPRTPG+QIRGrChaQaROLA67e3jZTJC5nHQ3rJ+WKxN
	sTE7DhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EYE-0000000803w-23Vm;
	Thu, 03 Apr 2025 06:59:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EPW-00000007yoV-2Rb3;
	Thu, 03 Apr 2025 06:50:48 +0000
X-UUID: f2747222105711f083f2a1c9db70dae0-20250402
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QDJ27iW4X63WdVZOkwgFkljRednxU+tqzHABvD19+JY=;
	b=WbCGvL+RZiolFP4pFPm4S3d977RHOkvCRefveBKOtha+ABg8whoQo8c1SE3dDZ2rqFS2hFcNT8HrdkqAcA6fKTVUpcW+ZvKlebf4uPorD2WC21ldWsTVXx5z2eepk2bl5XVxLO5h3bIEuO4A9wXbHnRotxegT1muiSs2accJamk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d9c7cc4e-2a34-48c4-82f6-f6736c148275,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:2b7024c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: f2747222105711f083f2a1c9db70dae0-20250402
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 278618222; Wed, 02 Apr 2025 23:50:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 3 Apr 2025 14:50:33 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 3 Apr 2025 14:50:33 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 0/2] Add an interface to get current DDR data rate
Date: Thu, 3 Apr 2025 14:48:46 +0800
Message-ID: <20250403065030.22761-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_235046_620746_75D28ABA 
X-CRM114-Status: GOOD (  12.83  )
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

This series is based on linux-next, tag: next-20250402.

Vcore DVFS feature need know the current DDR data rate.
Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

---
Changes in v4:
- Rename "mediatek,dramc.yaml" to "mediatek,mt8196-dramc.yaml";
- Refine Kconfig for MediaTek memory controller by removing the
  redundant explanation;
- Move the function 'read_reg_field()' to before mtk_dramc_probe();
- Rename struct 'mtk_dramc_dev_t' to 'mtk_dramc';
- Align the comments to kerneldoc;
- Simplify the function 'mtk_dramc_get_data_rate' by removing the
  redundant error handling process.

---
Changes in v3:
- Move register offset, register mask and other SoC-dependent variables
  to the platform data;
- Correct the spelling error.

Link to v3:
https://patchwork.kernel.org/patch/14029756

---
Changes in v2:
- Remove pr_info and pr_err, use dev_err or dev_err_probe to print
  error message;
- Replace module_init by module_platform_driver;
- Remove unnecessary global variables;
- Change fmeter-verison to platform data;
- Remove mtk-dramc.h;
- Refine compatible to "mediatek,mt8196-dramc";
- Refine CONFIG name to MEDIATEK_MC;
- Fix yaml build errors, remove unnecessary properties on yaml file.

Link to v2:
https://patchwork.kernel.org/patch/13964208

Crystal Guo (2):
  dt-bindings: memory-controllers: Add MediaTek DRAM controller
    interface
  memory/mediatek: Add an interface to get current DDR data rate

 .../mediatek,mt8196-dramc.yaml                |  44 ++++
 drivers/memory/Kconfig                        |   1 +
 drivers/memory/Makefile                       |   1 +
 drivers/memory/mediatek/Kconfig               |  20 ++
 drivers/memory/mediatek/Makefile              |   2 +
 drivers/memory/mediatek/mtk-dramc.c           | 223 ++++++++++++++++++
 6 files changed, 291 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,mt8196-dramc.yaml
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c

-- 
2.18.0


