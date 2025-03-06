Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B9AC28B22
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zZk3OkAU1AqUqDxdrw3CKq7flSmIjZeU0GWKHI9L5/M=; b=hZkD4hEv1xM6fuGg5iwdsneAbD
	uacA5yRC/fG3TtLipW08PtjUkEE0dtJBImZx+/WPdMKf3/nGEbkh4xIVcjr1S1m8ZeMznhqq1LYbY
	PzMgNbik5fEx2N52ZrEVTrmOQqW8oaCphBc0QRXLnQNOZ/ehjXAVHPbXC2pWC1O9qPy45l7G38VVF
	wEAobHQnqW2wxu/+icq1EDcRZr1Vu1umzn30PCQvXOLIREeKjfouZFpLUZyc0mZT63gL45z5zdZn4
	OTSnw0nMCcgJBmOWnxhqanBJf1EGYRskc3LIDiEEy8IAfQyXV3Eero7K7tFYJwDyPlPAB7SJIzuxZ
	+wI9Kn4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8CJ-0000000Aabn-1DxZ;
	Thu, 06 Mar 2025 10:11:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6wG-0000000AOJk-0LKC;
	Thu, 06 Mar 2025 08:50:45 +0000
X-UUID: 13b197d6fa6811efa1e849db4cc18d44-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=zZk3OkAU1AqUqDxdrw3CKq7flSmIjZeU0GWKHI9L5/M=;
	b=uKOT+d7d6kzJbGCB2W5s1xaEo1QKBmOQqHEDw7LslYWe4U1VgwPYoq9c6ohSse365c8nm5Y7sc+VG3TwirVGtGitq7oHBsk43sKtzFOmgfzplV4B41dJXNnMERQwjP+FeR388M6jWVIm8/jk/ZjjP2D6MXqae1ZMbB2HUc92ZIU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b69aaad7-fef3-4adc-bf14-01986cc6b302,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:9dccc249-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 13b197d6fa6811efa1e849db4cc18d44-20250306
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1401025294; Thu, 06 Mar 2025 01:50:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Mar 2025 16:50:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Mar 2025 16:50:35 +0800
From: Axe Yang <axe.yang@mediatek.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Wenbin Mei
	<wenbin.mei@mediatek.com>
CC: <yong.mao@mediatek.com>, <qingliang.li@mediatek.com>,
	<andy-ld.lu@mediatek.com>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Axe Yang <axe.yang@mediatek.com>
Subject: [PATCH 0/2] mmc: mtk-sd: add support for burst type switch
Date: Thu, 6 Mar 2025 16:48:04 +0800
Message-ID: <20250306085028.5024-1-axe.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_005044_121295_C36AC02C 
X-CRM114-Status: GOOD (  10.02  )
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

Add a device tree property for MSDC node to switch burst type.
The default burst type is 'single', but for some versions of IP,
the AMBA type is AXI, which do not support 'single' burst type.

This series of changes provides a way to switch the burst type,
and is necessary as the AXI bus is being used more frequently
in the new versions of MSDC IP.

Axe Yang (2):
  dt-bindings: mmc: mtk-sd: add single burst switch
  mmc: mtk-sd: add support to disable single burst

 Documentation/devicetree/bindings/mmc/mtk-sd.yaml |  8 ++++++++
 drivers/mmc/host/mtk-sd.c                         | 10 ++++++++++
 2 files changed, 18 insertions(+)

-- 
2.46.0


