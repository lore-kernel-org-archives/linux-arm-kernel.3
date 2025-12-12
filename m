Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1C7D4336C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FPKF2r4D2AqXgn4tnEGPB9oAIHy/c5u5kiIsp8cFLww=; b=ri8i3H2O3UvxbG+DoFVjw7p3TI
	Zb+DrCEDAeEL+xLS/U2/lBJ7L/3FGYu4Wt2WBcqmH2mfT1Vl9wkXiANPV9KWr1ycNhpIrOo034Zsz
	BU850gGCPhofX2uXc1Wv0iGjtSslPOLYprAwVl1H3NYUGXLfaG4IfRpYgnv2gaHT63V7ytdOZHbxH
	Kcdbf+M/Ks0JJNVpd1q+JOtX8xysd54fOmYNrZTzvHWRG7sFiFife3HccArOA99tk1lwxXQWvglOr
	YK9JAkrOLa0dboxZURuVGKdgyjeFIatmXHG0IhftscdjKW4hVFOojmfu3Q5n5+P+08per99N995Y0
	JGlKsEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtca-0000000HaUB-1Bv3;
	Fri, 12 Dec 2025 03:15:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtcX-0000000HaT1-1Wxo;
	Fri, 12 Dec 2025 03:15:06 +0000
X-UUID: becdaf60d70811f09f706fa2197c6ceb-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FPKF2r4D2AqXgn4tnEGPB9oAIHy/c5u5kiIsp8cFLww=;
	b=Sza5faWFLZPxh4C79Nb8goFsxFuRjfKOD+0m+5eAEnsxPNFHD8/+a1/qbBA8FMEhuFp5evjKTvRs0SMKLpywXqAzGvQNNpS+3v54vjvZby95eL6rDoe2/j51xmxBxOWsaS7upxuQD3CNTSrjxM8d7sZkFCAbVHLPkmCZCwBaiJk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ba2bbd3f-ad32-4354-a12d-a8789299b875,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:9a136f28-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|888|898,TC:-5,Content:0|15|50,ED
	M:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: becdaf60d70811f09f706fa2197c6ceb-20251211
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 822694545; Thu, 11 Dec 2025 20:15:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 12 Dec 2025 11:14:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 12 Dec 2025 11:14:58 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/4] *** SUBJECT HERE ***
Date: Fri, 12 Dec 2025 11:13:41 +0800
Message-ID: <20251212031450.489128-1-xiaoshun.xu@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_191505_414499_01283FE0 
X-CRM114-Status: UNSURE (   6.35  )
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


External email : Please do not click links or open attachments until you ha=
ve verified the sender or the content.


From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>

v1:
1. Add dt-bindings compatible and vio-idx-num attribute of MT8189
2. Add support DEVAPC of MT8189
3. Refine MT8189 DEVAPC clock control flow
4. Refine MT8189 DEVAPC interrupt handler

*** BLURB HERE ***

xiaoshun.xu (4):
  dt-bindings: soc: devapc: Add for support MT8189
  soc: mediatek: mtk-devapc: Add support for MT8189 DEVAPC
  soc: mediatek: mtk-devapc: refine DEVAPC clock control
  soc: mediatek: mtk-devapc: refine devapc interrupt handler

 .../bindings/soc/mediatek/devapc.yaml         |   6 +
 drivers/soc/mediatek/mtk-devapc.c             | 176 ++++++++++++++----
 2 files changed, 144 insertions(+), 38 deletions(-)

--
2.45.2


