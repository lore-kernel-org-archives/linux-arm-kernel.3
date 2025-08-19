Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FD6CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 02:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w72hmReb5KMNMVr1REunFBZzQRf6nu6DrZtxaxj3TWE=; b=aDMoysegv/I2TgBcH46ywkgJbW
	LoQ1oFXA6y39R/+D4ZEELxxCO6gOFg2pPDveHlVgYjU/5lQbQEUjZUfnebTU23An0rY0NsI1anDKK
	9cAtjUoa2G1XiOkDS+fcqWHERjYp21l3wigazUjfnURORECV4+yyBFVXMYYlLSE7zP7f6r4igfK9a
	osRCR+/5vyjAd6Up68cN/btdeOgO74btQZmgWTCT7j0GNeTPkpFUajU8FmDaC83LvKyGNZrItdPrb
	GGKq5G0PWxcHw5vqExSOqvdeefrCce6hQlFpn2DB6ruDFdaFbPPE3EAKFOpS3a7VnHOJsZgG4xp07
	iYcHkIwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBgP-000000099zw-1Nuo;
	Tue, 19 Aug 2025 02:02:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoBdp-000000099b3-1u4N;
	Tue, 19 Aug 2025 02:00:02 +0000
X-UUID: 350871d87ca011f09f706fa2197c6ceb-20250818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=w72hmReb5KMNMVr1REunFBZzQRf6nu6DrZtxaxj3TWE=;
	b=IUbXgbREQa5WHcrOXbsqaoofXd0mYdUWJBvxAOHIsCpYRr9eixTeu4REs8QByKSRwFtBae8NQPxnQCVO8yWiQkzqwTYwtxMFrHOYbu0hgBD+qfk/nmEEH8E5zW3CjO8XYy44cD5UDBipxskXgp8tORmqE9fSRfnMJ+UgMMl1lcw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:46d807b2-ae75-41da-9cd4-9a28d90f4a84,IP:0,UR
	L:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:100
X-CID-META: VersionHash:f1326cf,CLOUDID:3d3211f4-66cd-4ff9-9728-6a6f64661009,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|801,TC:-5,Content:3|15|50,EDM:-3
	,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 350871d87ca011f09f706fa2197c6ceb-20250818
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <xiandong.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2081594345; Mon, 18 Aug 2025 18:59:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 19 Aug 2025 09:59:53 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 19 Aug 2025 09:59:52 +0800
From: Xiandong Wang <xiandong.wang@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Houlong Wei
	<houlong.wei@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: [PATCH v2 0/4] Add GCE driver for 8189
Date: Tue, 19 Aug 2025 09:59:37 +0800
Message-ID: <20250819015948.15450-1-xiandong.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_190001_505043_084A358D 
X-CRM114-Status: UNSURE (   9.42  )
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

This serides patches dependent on:[1]https://lore.kernel.org/all/20250601173355.1731140-8-jason-jh.lin@mediatek.com/

Xiandong Wang (4):
 [v2,01/04] dt-bindings: mailbox: add cmdq yaml for MT8189
 [v2,02/04] mailbox: mtk-cmdq: Add cmdq driver for mt8189
 [v2,03/04] arm64: dts: mediatek: Add GCE header for mt8189
 [v2,04/04] mailbox: mtk-cmdq: modify clk api for suspend/resume

 .../mailbox/mediatek,gce-mailbox.yaml         |   1 +
 arch/arm64/boot/dts/mediatek/mt8189-gce.h     | 870 ++++++++++++++++++
 drivers/mailbox/mtk-cmdq-mailbox.c            |  24 +-
 3 files changed, 885 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-gce.h

-- 
2.46.0


