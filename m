Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBB0FF8865
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=imlk/dy6Lz3mR5J/hI0+bG0ANdJD9kwhYAgyc3iWdEY=; b=IETHgKP391UuN6Rqt8USCMEeX7
	a3TVcWiuaCcHDkhOlA++M8pxo/D71fO94i9WJ7k13Burhwb3u4Tqv9eV3RB2HNqmz4UaT24vHGX+w
	1GFn50IzOIPs1FUkUyxeLIeyP+4VX9h563xouPPAnHV+54LlP1xc/fVm+Xn/J/SsvW0WlS5QrmvEH
	24QeEjrkNYlMKHgoDKOmuessg7tgnkAvG644RrWNUWRv9dNz6wcxGODJwTi0y0XEwChs2U7pNultL
	Wsaq/Q8WSmdT6k7TWeI7eoUWHK1FF5dGHPqRTNMh2xKaaemTAOq0hjUr8HS8UgdQXmp0VpD4kBLIU
	FWNh5z+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHG1p-0000000GKeq-44xa;
	Mon, 27 Apr 2026 07:05:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHG1n-0000000GKeQ-36uq;
	Mon, 27 Apr 2026 07:05:12 +0000
X-UUID: 6b1ab510420711f1a6de359d7043e138-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=imlk/dy6Lz3mR5J/hI0+bG0ANdJD9kwhYAgyc3iWdEY=;
	b=gfAdRDFdbimUT/we2NIvY7Z2sjWeYvBeml3i2OVM7+dP9e6jN1/SyXsBv/Hk3rMHuLLsp948zwHNkcNjO92PIGXq8EiiKwvGwW58S+t1+vcq4QYyNUWF3byB0npSkgUCApx1J7oJd985L9toXSRtZkecf6/KG8A0azqiwyyD3oY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7b6798b0-eaf3-4c39-a8c5-fd75debbb06e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:a8b9a764-469e-4eb6-aeb8-4b21454b0f32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6b1ab510420711f1a6de359d7043e138-20260427
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhengnan.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1928079149; Mon, 27 Apr 2026 00:05:05 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 15:05:02 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 15:05:02 +0800
From: mtk20898 <zhengnan.chen@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, mtk20898
	<zhengnan.chen@mediatek.com>
Subject: [RESEND,v2 0/2] MT8189 SMI SUPPORT
Date: Mon, 27 Apr 2026 15:04:27 +0800
Message-ID: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_000511_781506_641451C0 
X-CRM114-Status: UNSURE (   8.40  )
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

Based on tag: next-20260424, linux-next/master

This patchset add mt8189 smi support.

---
Changes in v2:
Just modify the mediatek,smi-common.yaml file as follows:
- Add schematic diagram explanation between smi-common and smi-sub-common
- Change the clock numbers of smi-sub-common to minimum 2, the third clock
  is optional
- Link to v1:
  https://lore.kernel.org/all/20250919081014.14100-1-zhengnan.chen@mediatek.com/
---

Zhengnan Chen (2):
  dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
  memory: mtk-smi: Add mt8189 support

 .../mediatek,smi-common.yaml                  | 25 ++++++++++-
 .../memory-controllers/mediatek,smi-larb.yaml |  3 ++
 drivers/memory/mtk-smi.c                      | 44 +++++++++++++++++++
 3 files changed, 70 insertions(+), 2 deletions(-)

-- 
2.46.0


