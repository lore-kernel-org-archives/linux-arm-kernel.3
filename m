Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E018ACA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 03:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FAogCFRAzYdA8T7BI1fjGXmA602PVE4L9Lu5c60nJiI=; b=cfzonJehArBhGGwZ15XosUVEyn
	kLCHTjWxYJCrmSs/372DkFC8Bl2TKVbIvblHIFE+9cVKaevKXBYKE81qLakH8AjTDBFLVgqMC8EqJ
	lku3+7C2hG58pmhDSmypRSk5mB37FLw7EjPpF7Aufjs1mO+oWwy6riyBBTRxuNFqhsqmusBTZwJTK
	D3YokIW4A0Or9l5A669TeDXZEUOAh1Sh6WMiQQuy1dW/pH9NjERiUDKNKNqcnTUKhQfuwyUs5YsMM
	PMwthdkkuUJoZ2R1YftVb2dmFBSsE0/rPJdXSTrhJ5qbmqYAZ368NSdB/D/YbP9rD2CJ2gCJn86Wi
	ATDQNfVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDI7-00000009Ila-36Se;
	Tue, 19 Aug 2025 03:45:43 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoDAf-00000009HRj-0zh4;
	Tue, 19 Aug 2025 03:38:02 +0000
X-UUID: e4bf80dc7cad11f09eb0dd999d3936bf-20250818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FAogCFRAzYdA8T7BI1fjGXmA602PVE4L9Lu5c60nJiI=;
	b=D/B0j8WnEVzXk7GLT0MQLSAU+GsIK5q7aOFo7s1iTnlhO0pTJ3l936GzSa3/4rMbOUrULSeqQ4NuRnZGuInNA2raykgdUd83PYRxDeNAQkXQwh9V18nuqmnY3gNCpDpTD27AVXMnt2K9n88ZdxxTK5sMNOeiAoAY4AGr8pe323U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:de8d4d7e-2453-4bab-ae2a-9f8d3911030e,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:f1326cf,CLOUDID:146212f4-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|801,TC:-5,Content:3|15|50,EDM:-3
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e4bf80dc7cad11f09eb0dd999d3936bf-20250818
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1775001103; Mon, 18 Aug 2025 20:37:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 19 Aug 2025 11:37:52 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 19 Aug 2025 11:37:51 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH v3 0/4] Add GCE driver for 8189
Date: Tue, 19 Aug 2025 11:36:07 +0800
Message-ID: <20250819033746.16405-1-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_203801_326894_02D4751A 
X-CRM114-Status: GOOD (  10.16  )
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

This serides patches dependent on:[1]https://lore.kernel.org/all/20250601173355.1731140-8-jason-jh.lin@mediatek.com/

Xiandong Wang (4):
 [v3,01/04] dt-bindings: mailbox: add cmdq yaml for MT8189
 [v3,02/04] arm64: dts: mediatek: Add GCE header for mt8189
 [v3,03/04] mailbox: mtk-cmdq: Add cmdq driver for mt8189
 [v3,04/04] mailbox: mtk-cmdq: modify clk api for suspend/resume

 .../mailbox/mediatek,gce-mailbox.yaml         |   1 +
 arch/arm64/boot/dts/mediatek/mt8189-gce.h     | 870 ++++++++++++++++++
 drivers/mailbox/mtk-cmdq-mailbox.c            |  24 +-
 3 files changed, 885 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-gce.h

-- 
2.46.0


