Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38A7F433DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 03:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f0PQ1q7dwuqOBFQH2fGiZw4qdYkUa9V4Qn3JGatAdH8=; b=MYS57TRJfYaGQ6FmOQF4icnoQ2
	gltMAHeFfiqBS7KkzV/B9ZrNdMpcooTsd5q7krNY/VLBqrwyin31hksz/nfRX3BoL0LgqkGQU0/Cj
	Z3glfUmOsB7xSv0PKYAsrKm1SDtY2og68WD9bu71QBHRoc02Jht17n+J7J1kASY05dUQZyagyLjYM
	Xu6Zjuoo9xfnlhEzYVApPFsaxm5i/IAw6Oo35AcMYAkyHSWTv6s76GyuXYK41gKjRcawKWfVt73+Y
	Z9U3Apo5ENzEzIcP4SHQRmkRQrvDR9530OKRrJGckaJMSkdXnGpUfjRyMzqe6LE9UbKwiiXArc8OD
	1Dw/mvcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDA7-00000001uFv-1BMp;
	Thu, 16 Apr 2026 03:13:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDA4-00000001uFF-24El;
	Thu, 16 Apr 2026 03:13:01 +0000
X-UUID: 280f15ae394211f1a6de359d7043e138-20260415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=f0PQ1q7dwuqOBFQH2fGiZw4qdYkUa9V4Qn3JGatAdH8=;
	b=mAJHxGpf7hxBYjPnrCl1SyN2f0UZLBnSuj3bUoW/RDTYQEvP+33aSf2LGnPaS3Xa9YgT70emt7EN9Ppsq1xq3h+Iu0ikfCQHCk6WfXUJHyoDCBTYCohHHDx7rFssor1oTOGZYDFbGgiNNB/jNOL2DE8v4J39N1m9n8sF1IRf0wg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:243a4a87-677d-4ef8-9e90-6c97f8c97a95,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:7fb07a8f-6df4-4a3d-a7a4-fbdc42d669ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 280f15ae394211f1a6de359d7043e138-20260415
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1760109873; Wed, 15 Apr 2026 20:12:52 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 16 Apr 2026 11:12:50 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 16 Apr 2026 11:12:50 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.corp-partner.google.com>
Subject: [PATCH v3 0/6] soc: mediatek: Add devapc support
Date: Thu, 16 Apr 2026 11:12:03 +0800
Message-ID: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_201300_550568_E5A72DB2 
X-CRM114-Status: UNSURE (   8.53  )
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

From: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>

Based on tag: next-20260415, linux-next/master

This series of patches add support for Mediatek devapc of MT8189 and
MT8196 soc.

Xiaoshun Xu (6):
  soc: mediatek: mtk-devapc: refine devapc interrupt handler
  soc: mediatek: mtk-devapc: refine DEVAPC clock control
  soc: mediatek: mtk-devapc: Add support for MT8189 DEVAPC
  dt-bindings: soc: mediatek: devapc: Add bindings for MT8189
  soc: mediatek: mtk-devapc: Add support for MT8196 DEVAPC
  dt-bindings: soc: mediatek: devapc: Add bindings for MT8196

Changes in v3:
  - Add support for MT8196 devapc
  - Updated yaml for dt-bindings

Changes in v2:
  - Updated cover letter subject
  - Updated yaml for dt-bindings
  - Add support for MT8189 devapc
  - Refine devapc clock control flow
  - Refine devapc interrupt handler

Changes in v1:
  - Add support for MT8189 devapc
  - Updated yaml for MT8189

 .../bindings/soc/mediatek/devapc.yaml         |  11 +-
 drivers/soc/mediatek/mtk-devapc.c             | 197 ++++++++++++++----
 2 files changed, 168 insertions(+), 40 deletions(-)

-- 
2.45.2


