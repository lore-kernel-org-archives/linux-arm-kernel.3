Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65FFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=THHhEle/Fz/9S9GPMRtZ5lQV0yLbtkgWEQY+1B2ec/4=; b=aQoGwwbw8VWap/jTWgyGWfhek7
	fE1UEIqm2/gfoudU+0cBob55iUycVbrnVW+/LTkoNC6gUPWJYLUpXUNevE8VqrxK1AF2QxjC3JMir
	oYhtH8MxTiIrF9yGIPITFSZQmAX+CyVVPMd0TX77vslHEWcYKDVlaOeb7+UDbbevjeq7BautPyVvc
	DCtwJlisfNSY4Wr3jcackEOCmTIGhNLtuqo0v93mZx8B7Yc/IcbUpTV/JfmPNdkRJ5bfsOurge3fl
	fK5ym4dIOrUO3ExC2b/Zce4Entnr5WQqhXN1HdtuUCDaeEuvY5JVzm+5Pp6ijlXYCEjbrGVP1X5N/
	U6ektNAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErhV-00000006Ndd-19l7;
	Fri, 31 Oct 2025 16:10:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErhS-00000006Ncj-3DZT;
	Fri, 31 Oct 2025 16:10:03 +0000
X-UUID: 0d1266e4b67411f09f706fa2197c6ceb-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=THHhEle/Fz/9S9GPMRtZ5lQV0yLbtkgWEQY+1B2ec/4=;
	b=ajfOIN5d6V6du8HhFsNr2TGC7CEYAM1uL5/C3/sEe78wUa8iHFu90RDxyQnypsKugdds07KLl3NVYkySIKad9l+Cn0YHAKyD3KqIo0AHVvthjwJeaKsGWkRqwYtrZxEapoI/QpIH6pWXDbcx1tasp8YBAN/lJAzRWmuYki+Fqxk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ea73d4c0-1d5f-4fb1-b2e7-811df948b746,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:73cffedf-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0d1266e4b67411f09f706fa2197c6ceb-20251031
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 782092398; Fri, 31 Oct 2025 09:10:00 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 1 Nov 2025 00:09:56 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Sat, 1 Nov 2025 00:09:56 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Dufresne
	<nicolas@ndufresne.ca>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Nancy Lin
	<nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Paul-PL
 Chen <paul-pl.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, Xiandong
 Wang <xiandong.wang@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>,
	Fei Shao <fshao@chromium.org>, Chen-yu Tsai <wenst@chromium.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH 0/3] Remove deprecated CMDQ APIs (series 4/4)
Date: Sat, 1 Nov 2025 00:09:31 +0800
Message-ID: <20251031160955.1659524-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_091002_817869_4269EE92 
X-CRM114-Status: UNSURE (   8.24  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

This series removes temporary and deprecated CMDQ APIs after all
subsystems have migrated to the new interface.

Series application order:
  1. [Fixes] Refine DMA address handling for the command buffer
  - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
  2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs
  - https://lore.kernel.org/all/20251031155838.1650833-1-jason-jh.lin@mediatek.com/
  3. [Series 2/4] Migrate subsystems to new CMDQ APIs
  - https://lore.kernel.org/all/20251031160309.1654761-1-jason-jh.lin@mediatek.com/
  4. [Series 3/4] Remove shift_pa from CMDQ jump functions
  - https://lore.kernel.org/all/20251031160712.1657810-1-jason-jh.lin@mediatek.com/
  5. [Series 4/4] Remove deprecated CMDQ APIs (this series)

Please apply this series last, after all previous series have been applied in order.

---

Jason-JH Lin (3):
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_jump() and
    cmdq_pkt_jump_rel_temp()
  soc: mediatek: mtk-cmdq: Remove cmdq_pkt_write() and
    cmdq_pkt_write_mask()
  mailbox: mtk-cmdq: Remove unsued cmdq_get_shift_pa()

 drivers/mailbox/mtk-cmdq-mailbox.c       |  8 ---
 drivers/soc/mediatek/mtk-cmdq-helper.c   | 49 +++++++-----------
 include/linux/mailbox/mtk-cmdq-mailbox.h | 12 -----
 include/linux/soc/mediatek/mtk-cmdq.h    | 65 ------------------------
 4 files changed, 18 insertions(+), 116 deletions(-)

-- 
2.43.0


