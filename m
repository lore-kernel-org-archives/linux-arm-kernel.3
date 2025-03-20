Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B616C36001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QZXUJ4VH3AfP2WjMQih2vKgtDXB87pmd/jXX3007I+c=; b=EFAOiC+HGd5MCDmsVSe5KVWOiM
	gMOWBQSezGUEVP3W4ODwkeOyD9D1y8CVp46lTNBN8CTup5Zg8jsHRoCfLviqOsjj0iqJWmOwLYCps
	qPzy/N4Z0rZFocJqqff2KQbKs1Dcak3Gbiwemx5z0wmHSUgtWZYM50YML2ZfH4sTCUlNLa8/yGCg+
	EH0V+tq9rQDEnQG6FChRAqUt+d9WZ74a/05Jj3BXjZaHACLJ1ARcBiu6cuPQL2VO38+7Pe+vqdFto
	a41hAb/c3z7aOHsxNKNnXT/nSrECgZeo5wCH9337QM7u+qYBTajNLSDjRb8FvJ9wuVXJ77JlF8JK4
	85oWK36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvAUE-0000000BQRO-1yHy;
	Thu, 20 Mar 2025 07:38:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvASV-0000000BQAT-2qbS;
	Thu, 20 Mar 2025 07:36:56 +0000
X-UUID: 167372fe055e11f083f2a1c9db70dae0-20250320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QZXUJ4VH3AfP2WjMQih2vKgtDXB87pmd/jXX3007I+c=;
	b=Ra7/F6i7QgLfWOnYZ2vFL03qL1+EQL2VQRAzcLBY7UXKoCTnurgd3Qt8cn+GYanholW7fZiGVwazA5P5TwXY0yqYZThhHO05LcxMl1E/ABxMU4KektBOiwDjP0R3GoNNVKOZX0oMscyZNBT32H6zgVK8NC5JPGqlLyRWrP5tziQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:738553b9-e7b7-41a0-8b2a-35422eb66680,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:a81194c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 167372fe055e11f083f2a1c9db70dae0-20250320
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1283954900; Thu, 20 Mar 2025 00:36:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 20 Mar 2025 15:36:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 20 Mar 2025 15:36:47 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Wendy-st Lin <wendy-st.lin@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<iommu@lists.linux.dev>, Xueqi Zhang <xueqi.zhang@mediatek.com>
Subject: [PATCH 0/3] Add mt8196 SMI support
Date: Thu, 20 Mar 2025 15:36:15 +0800
Message-ID: <20250320073625.25225-1-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_003655_733074_A81A0F00 
X-CRM114-Status: UNSURE (   8.61  )
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

Add mt8196 SMI support

This patchset add mt8196 SMI support. 8196 SMI has several differences
compared to previous ICs. MT8196 SMI has more than 32 SMI larbs.
It connects with SMMUv3, rather than MTK_IOMMU.MT8196 SMI commons is
backed up/restored by RTFF HW.

Xueqi Zhang (3):
  dt-bindings: memory: mediatek: Add mt8196 support
  memory: mtk-smi: Add a flag skip_rpm
  memory: mtk-smi: mt8196: Add smi support

 .../mediatek,smi-common.yaml                  |   4 +-
 .../memory-controllers/mediatek,smi-larb.yaml |   4 +-
 drivers/memory/mtk-smi.c                      | 145 +++++-
 .../dt-bindings/memory/mt8196-memory-port.h   | 460 ++++++++++++++++++
 include/dt-bindings/memory/mtk-memory-port.h  |   4 +-
 5 files changed, 609 insertions(+), 8 deletions(-)
 create mode 100644 include/dt-bindings/memory/mt8196-memory-port.h

-- 
2.46.0


