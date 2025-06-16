Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FB5C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 04:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=umZZODBC0zwW+FQGVQ1VvC9xChtDdOxEYWQjHr8vmZw=; b=LdqTBf6aGRYaP4VnYAVvRRDYdn
	/t1e5NzCz04crEkR66iBadGFdF74WJMgayuUhuvW7MUxmHgaPwwC8Xfc0WCQkakH44PLQPqcWRrLu
	04LVqKUezZrBLKf1Y/E2F3On7fP2FuIEz9tHxpUPaQ24G7nle3Sh5pyXUyZlnSTHuDs2r8EpH7kvb
	I5ixxagTB8Ys38v69aUgTGGArf7wd8zXzP4aeyHLxnsNv7/RWrtDU21Q8kkiMaHARQe4jWOMWTA/0
	lUc8XAMF5sexIifk+ghpynkHwIrHncDGUb4MJRWHG1rDg13RN/UGjeTUgsBI6UPNw4YRZR4RQB2WT
	FfYeamtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1Gi-00000003KOk-3tfw;
	Mon, 16 Jun 2025 04:16:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR01a-00000003CnQ-4Bl3;
	Mon, 16 Jun 2025 02:56:44 +0000
X-UUID: 840875824a5d11f09eb0dd999d3936bf-20250615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=umZZODBC0zwW+FQGVQ1VvC9xChtDdOxEYWQjHr8vmZw=;
	b=bm/nr8l5c4yKanc+nOIpT0Bu1GoMYHmOQlKsM0+BCxuNH91CkaZU3uvhw11g3SaKj/UJCg5mvIZ48GbhOGzSEe6/x4k+kE0b3fYjkcEWwTKgz8YqRrf5u+Eb7IG6JWDc4QrLipt748EXCQaQe7LH+8rwEA9C2NHfEb+KM6AF3I8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:05764be4-ed8d-4d47-8518-95b98f80229f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:cd810277-7521-4364-b0ef-cd7d9c0ecbde,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 840875824a5d11f09eb0dd999d3936bf-20250615
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xueqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1645102320; Sun, 15 Jun 2025 19:56:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 16 Jun 2025 10:56:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 16 Jun 2025 10:56:31 +0800
From: Xueqi Zhang <xueqi.zhang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ning li
	<ning.li@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <iommu@lists.linux.dev>, Xueqi Zhang
	<xueqi.zhang@mediatek.com>
Subject: [RFC PATCH 0/8] Add mt8196 SMMU support
Date: Mon, 16 Jun 2025 10:56:06 +0800
Message-ID: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_195643_040821_C3A3BC17 
X-CRM114-Status: GOOD (  10.76  )
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

This patchset add mt8196 SMMU support.
1. Mediatek SMMU interrupt is low level active rather than the
standard edge. Process Mediatek SMMU wrapper interrupt and dump
detailed information when a translation fault occurs.
2. In some projects, Mediatek also have EL2 driver, so put the pm
operation in TFA(EL3), then all the kernel and EL2 could control
the pm. Thus implement rpm get/put function which send smc call to
TFA to get/put SMMU power.

Xueqi Zhang (8):
  dt-bindings: iommu: mediatek: Add mt8196 support
  iommu/arm-smmu-v3: Add SMMU implementation
  iommu/arm-smmu-v3: Add implementation for MT8196 MM SMMU
  iommu/arm-smmu-v3: Add implementation for MT8196 APU SMMU
  iommu/arm-smmu-v3: Add IRQ handle for smmu impl
  iommu/arm-smmu-v3: mediatek: Add wrapper handle for IRQ
  iommu/arm-smmu-v3: Invoke rpm operation before accessing the hw
  iommu/arm-smmu-v3: mediatek: Implement rpm get/put function

 .../bindings/iommu/arm,smmu-v3.yaml           |  24 +-
 drivers/iommu/arm/Kconfig                     |   7 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   3 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c  |  16 +
 .../arm/arm-smmu-v3/arm-smmu-v3-mediatek.c    | 536 ++++++++++++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  96 +++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  14 +
 7 files changed, 691 insertions(+), 5 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-impl.c
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-mediatek.c

-- 
2.46.0


