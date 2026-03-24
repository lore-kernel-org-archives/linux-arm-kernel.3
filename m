Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4383FF532CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zj2qyC8xhG10+YQXv/gFMiWEJ3lx8xupMwUnARNEhRY=; b=UCwWQu5XE0KBA65V5QvvrdcTQK
	xjH2I5iiw6qSM8UFEWi1GMka7235gMsgatMiFOjqAP46pHUlSWT+hirI1aV9EWofyOuH/3nZEgOiP
	8xhT0gZHcfoZgowuEa2sbvyK/o8gXycFPGor9Si2Q2vuUFf0k61pZtcFnkj1s/OITQG5C+KK8imRH
	VD8YT9PlurtNMAADOAI29FdEtfQIK2P7ocmWIa/D/ujDxbytXZC67jGIQYi31phuWYj+iWrcExo63
	DxIppl1t6ri37Cj7TxgBkZsrOtkKgfVEDtUkIHwFdg3AzrGPyLB+t6ul6qOpHw87LfbRKVSa5+QIj
	OkV3ixoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sPf-00000000Tpy-2Bf6;
	Tue, 24 Mar 2026 03:26:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sPc-00000000Toh-2VIo;
	Tue, 24 Mar 2026 03:26:37 +0000
X-UUID: 3ffd77b4273111f1a6de359d7043e138-20260323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Zj2qyC8xhG10+YQXv/gFMiWEJ3lx8xupMwUnARNEhRY=;
	b=AbBUI423eJ4HlnyMnOmdzD3zJ6OlgbXL4Txhd5JYwiwNXyIKMe8tK/vo8SkkL8pytsTnCtqZY+5QGS7PAhHclGGIkwf0OOYqOZRPkyzy/FcWwXjQAKSGGIZfkj6urdCoBoH/cPRYeQhDcgVM6Guurqg/5yUkAxfDF/vjTXLThuU=;
X-CID-CACHE: Type:Local,Time:202603231947-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b394a425-ff28-4cb8-bf62-c40c8c051053,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:7bda2194-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3ffd77b4273111f1a6de359d7043e138-20260323
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1248824872; Mon, 23 Mar 2026 20:26:30 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 11:26:27 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 11:26:27 +0800
From: Meiker Gao <ot_meiker.gao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Bayi Cheng <bayi.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Meiker Gao <ot_meiker.gao@mediatek.com>
Subject: [PATCH 0/2] *** SUBJECT HERE ***
Date: Tue, 24 Mar 2026 11:26:16 +0800
Message-ID: <20260324032624.1708029-1-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_202636_631249_4A4D1285 
X-CRM114-Status: UNSURE (   9.26  )
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

*** BLURB HERE ***
This patch series refactors the clock management for the Mediatek SPI NOR driver,
making it more flexible and compatible with different platforms.

Patch 1 updates the device tree binding to support variable clock-names.
Patch 2 migrates the driver to use clk_bulk API and optimizes error handling.

Changes in v1:
  - Dynamically allocate clk_bulk_data array.
  - Simplify error handling.
  - Code cleanup and style improvements.

Meiker Gao (2):
  dt-bindings: spi: Fix clock-names definition
  [v3] spi: spi-mtk-nor: Modify and optimization the SNFC.

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |  6 ++++++
 drivers/spi/spi-mtk-nor.c                     | 19 ++++++++-----------
 2 files changed, 14 insertions(+), 11 deletions(-)

-- 
2.45.2


