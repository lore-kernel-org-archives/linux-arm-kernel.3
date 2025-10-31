Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C07CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/xzT4ObjTcgk6V1zapYFK/VlbVEu9a12rK5uSz4JmdM=; b=Qw2pDzMWIVzMCUeVjSpEI0BOI0
	3Jnyw3g9cQqyAyFDXtpM6Aj1rh58LOXs0Cgs1Ii26xmn1uypmOGQZTfCeyiglf3onGitwUhaEYpFP
	ghSn8CIeaQOUKboLSHPt1RRVjpsVEQUCHLGYtWRfOEPcPY6ZeYqfvEwXgjpNRRFqQ/9KTIvyvmvZL
	6YgrQe6SWSFiqR/fT30QM/MnixAE59rYiQ0b9N2QK3kcFvtRHJJuZNj9KwkThbfv4XTVUjYiXDNZY
	JlOSEi5AkVtT42f5rPUz9kveggrVV5rW6lZlkC8jmgJHjM3nWrII0WqKg5Yf5xMQgGmt5ZZz4DqFR
	MASA1R8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErbG-00000006MKA-2YqW;
	Fri, 31 Oct 2025 16:03:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErb1-00000006MD9-0Z7D;
	Fri, 31 Oct 2025 16:03:24 +0000
X-UUID: 1e3a415eb67311f0a52f393f94899d25-20251031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/xzT4ObjTcgk6V1zapYFK/VlbVEu9a12rK5uSz4JmdM=;
	b=VsNIwrUNq2Kqcz3vj9aXSj48BxTNkfS6gRwFWar5oYiO3mPwlmSXASImC9sHBOEuj8VnjNc4QY84Ked2V6afTmIYG6yob+AJJAVMYclr0jVekGD0HZwESA6ytJhPePdd/xo2y6cdbvKscOolxj5eJV7si+u7d1Wccb6iUkm4O3w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:5a00ea80-2c34-47ed-bd94-a7e6a27de975,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:4249c818-3399-4579-97ab-008f994989ea,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1e3a415eb67311f0a52f393f94899d25-20251031
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770919447; Fri, 31 Oct 2025 09:03:19 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sat, 1 Nov 2025 00:03:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Sat, 1 Nov 2025 00:03:09 +0800
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
Subject: [PATCH 0/5] Migrate soc, drm-mediatek, mdp3 to new CMDQ APIs (series 2/4)
Date: Sat, 1 Nov 2025 00:01:55 +0800
Message-ID: <20251031160309.1654761-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_090323_190272_0BE0045B 
X-CRM114-Status: UNSURE (   9.14  )
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

This series migrates the MediaTek SoC, DRM, and MDP3 drivers to the new
CMDQ APIs introduced for MT8196.

Series application order:
  1. [Fixes] Refine DMA address handling for the command buffer
  - https://lore.kernel.org/all/20251022171847.379470-1-jason-jh.lin@mediatek.com/
  2. [Series 1/4] Add GCE support for MT8196 and update CMDQ APIs
  - https://lore.kernel.org/all/20251031155838.1650833-1-jason-jh.lin@mediatek.com/
  3. [Series 2/4] Migrate subsystems to new CMDQ APIs (this series)
  4. [Series 3/4] Remove shift_pa from CMDQ jump functions
  5. [Series 4/4] Remove deprecated CMDQ APIs

Please apply this series after the MT8196 GCE support series,
and before the following series.

---

Jason-JH Lin (5):
  soc: mediatek: Use pkt_write function pointer for subsys ID
    compatibility
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_jump_rel_temp() for removing
    shift_pa
  drm/mediatek:Use reg_write function pointer for subsys ID
    compatibility
  media: platform: mtk-mdp3: Refactor CMDQ writes for CMDQ API change
  media: platform: mtk-mdp3: Change cmdq_pkt_jump_rel() to
    cmdq_pkt_jump_rel_temp()

 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 12 +++++-----
 .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    |  6 ++---
 .../platform/mediatek/mdp3/mtk-mdp3-comp.h    |  6 ++---
 drivers/soc/mediatek/mtk-mmsys.c              |  8 ++++---
 drivers/soc/mediatek/mtk-mutex.c              |  5 ++--
 include/linux/soc/mediatek/mtk-cmdq.h         | 24 +++++++++++++++++++
 6 files changed, 44 insertions(+), 17 deletions(-)

-- 
2.43.0


