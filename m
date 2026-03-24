Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89D0F532C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 02:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zj2qyC8xhG10+YQXv/gFMiWEJ3lx8xupMwUnARNEhRY=; b=qpripsP5EEfBhkhYi+frpPNBuX
	At/wP2WRnJpegMTGIiOHv4xig7Vcs9DyIN1l9yftUGSC/4wxO+OaYjwNwdN8whcTwY3T9+9gzv2Jp
	Ecfa91yRBI/Zq2U8ZzSnor6RFhkOlXqZeJQLTNU/Evt57eNxo3nC7itY6AZXvVwhYX8PptoXq5/FH
	YXNPKYbU7LttLTwgQddPbIqQHmTsvsWSvHFxluzm5nTSAGzQ0iN9vLvVScp7pPdJkZwpx4cGaoxUy
	RJXZoZmbBSbdLTFd4oVK2Grx7zNZKZph27y8XrxInS2KnKm55AIeN+Mfgg89wFumshzFfib5QYv40
	ghQO0LaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rny-00000000QCM-3L2s;
	Tue, 24 Mar 2026 02:47:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4rnx-00000000QBr-0BTq;
	Tue, 24 Mar 2026 02:47:42 +0000
X-UUID: d0d8b042272b11f1a6de359d7043e138-20260323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Zj2qyC8xhG10+YQXv/gFMiWEJ3lx8xupMwUnARNEhRY=;
	b=uEgmChsBSLjbfxFHfchjLz7KNO/p+AlY/Lop6WBiznrmncaaLJG81p3jxTNcJhZ2+OysYpevNqf+RfhetvJ2MONYa/JeMihsRIZFiMy6BZhu4ssUwLaoR0jdxMDQywiB6DphI/t/kdFcotNBga7ZugBNlNCGeLHMajSezXMaF00=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cc52f783-686c-4e0b-97b0-33e6fd634a2e,IP:0,U
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
X-UUID: d0d8b042272b11f1a6de359d7043e138-20260323
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1861440050; Mon, 23 Mar 2026 19:47:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 10:47:33 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 10:47:33 +0800
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
Date: Tue, 24 Mar 2026 10:47:24 +0800
Message-ID: <20260324024729.1700626-1-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_194741_088887_177AEDB0 
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


