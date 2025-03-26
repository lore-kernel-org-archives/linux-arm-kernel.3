Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12718C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 06:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aaBZuoENevLJbWKLyrTtql09PLoMSh8b42u2wmaoENc=; b=msjMcMvgB3aqiBLgX/GbqRViLU
	ytmXYXl/WDVMQp/dt3VEo2zVsy/TS8ZFcmOfUU28j0luxgfqNwFUugHUzdgxihhJEINHnjiIHUth2
	9Zdbl/IBAiMXdvN8oIEqQRBDB/n+Yv9asj/gzUcsS0cXQqJAbiVYBVzvyyE6qks1qS+bgxZMUWCLS
	+jlR/GnvoXTFPr2XXXNfRLlNWMb3lCwOhD7Djb5YMK0TIvckYJ4FeSgl/2Cch7tGUSpw1y1dXpmXU
	ZpSqOYpeL02ZaMQpnJ/oFfup0WEig1dDc1Ch/W1T3XaVPtkiPt7I5KOOiukVAUxadO8BI5beRvtf8
	Lzh8ftOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKJf-00000007fUM-2i4R;
	Wed, 26 Mar 2025 06:32:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txKHw-00000007fH7-25Zj;
	Wed, 26 Mar 2025 06:30:57 +0000
X-UUID: dc68d42a0a0b11f083f2a1c9db70dae0-20250325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aaBZuoENevLJbWKLyrTtql09PLoMSh8b42u2wmaoENc=;
	b=KIbrKgF4iS2LkoziQeVaFG6aUh/D5H63p94/ruXthD3SXlO/ataD9j2zCq9iXI2e6NTZR0MpfEEVDvOq9lxM5TkOHIrw2N78Qngq87l8xDoedx/5P9CDa7ADfKkVczBJE+M06F6ilpZ/Rkbj1YBLLArukxJLs8tDl6B9KgUq+sM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d40f1baf-971b-4f7e-8d9d-b78ffc098aa9,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:ec2c50a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: dc68d42a0a0b11f083f2a1c9db70dae0-20250325
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <crystal.guo@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 129751176; Tue, 25 Mar 2025 23:30:50 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 26 Mar 2025 14:30:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 26 Mar 2025 14:30:47 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Crystal Guo
	<crystal.guo@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v3,0/2] Add an interface to get current DDR data rate
Date: Wed, 26 Mar 2025 14:30:30 +0800
Message-ID: <20250326063041.7126-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_233056_547857_F4D37A44 
X-CRM114-Status: GOOD (  11.19  )
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

This series is based on linux-next, tag: next-20250324.

Vcore DVFS feature need know the current DDR data rate.
Add MediaTek DRAMC driver to provide an interface that can
obtain current DDR data rate.

---
Changes in v3:
- Move register offset, register mask and other SoC-dependent variables
  to the platform data;
- Correct the spelling error.

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

 .../memory-controllers/mediatek,dramc.yaml    |  44 ++++
 drivers/memory/Kconfig                        |   1 +
 drivers/memory/Makefile                       |   1 +
 drivers/memory/mediatek/Kconfig               |  21 ++
 drivers/memory/mediatek/Makefile              |   2 +
 drivers/memory/mediatek/mtk-dramc.c           | 232 ++++++++++++++++++
 6 files changed, 301 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,dramc.yaml
 create mode 100644 drivers/memory/mediatek/Kconfig
 create mode 100644 drivers/memory/mediatek/Makefile
 create mode 100644 drivers/memory/mediatek/mtk-dramc.c

-- 
2.18.0


