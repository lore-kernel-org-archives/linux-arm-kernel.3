Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25293CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tBu1bs4aRFXXM2hwyueRO+bUFFMnZxfxSLLqElKyz0E=; b=x6vPyrjaxaZCCViwJF36NxtoVl
	L+2bVYViZCIpxXi3jq4MEi6LLpdvnhc5Sx5AC8nhVE1owrqBehH9ee+WDBX4R86Dd4Wr8wZNxgnkU
	Wo4qmQtlJgL8PIBT/FNZqh2BMtn0s4a/dss0rDm93JAUPU0bnEoizn2B3L+qItzAO2GABKSxC5BEn
	IHzFkLdtjoBcUL2LvL135gg42AKtFIliB9ZNNKFh5ysiASOp+EiDwJq7G9E/9ARu6kKu2TNvoam3b
	q9GVOdgkKkqPshUpqZOAotWfuEiOVitjLlkLdYFHEq5ibUlVlk+3YGlPYCukUKJdnAqw+wQ2sL6MW
	67ki9qcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBrR-0000000AS8j-30y4;
	Sun, 07 Sep 2025 09:39:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvBoh-0000000ARVF-0o76;
	Sun, 07 Sep 2025 09:36:13 +0000
X-UUID: 12a45a528bce11f09f706fa2197c6ceb-20250907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tBu1bs4aRFXXM2hwyueRO+bUFFMnZxfxSLLqElKyz0E=;
	b=uni4au8DUwwhf1STbU8f9ZWOZAor2fRvhQuGLjnGQbvCTATzNRmXoZzNoO8X+/YwljlhmHzaaUXd+NQILT0Cl01u7wh5UFNbQ1JlbpBWY5q03eUU4MH2w1b+6gHHGH1+9DDGdaO9Lv4NfnWMECaqcpJwEX4Vx1d1Izta1H7REWQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:076387be-7ac7-4719-b10c-814b8178fb48,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:e1420ca9-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 12a45a528bce11f09f706fa2197c6ceb-20250907
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 692609872; Sun, 07 Sep 2025 02:36:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sun, 7 Sep 2025 17:36:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sun, 7 Sep 2025 17:35:58 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Qianfeng Rong <rongqianfeng@vivo.com>
CC: Maoguang Meng <maoguang.meng@mediatek.com>, Longfei Wang
	<longfei.wang@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 0/2] initialize vcodec scalar variable
Date: Sun, 7 Sep 2025 17:35:55 +0800
Message-ID: <20250907093557.8008-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_023611_239580_3A359F35 
X-CRM114-Status: UNSURE (   9.34  )
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

Initialize vcodec structures:
patch 1 add missing initialization to fix the encoder's UNINIT checker
issue.

patch 2 converts memset() to = { } for other vcodec structures.

Changes in v3:
 - Converts memset() to = { }
 - Combined with Qianfeng's patch as v3
 - Link to v2: https://patchwork.linuxtv.org/project/linux-media/patch/20250715081547.18076-1-irui.wang@mediatek.com/
 - Link to Qianfeng's v1: https://patchwork.linuxtv.org/project/linux-media/patch/20250803135514.118892-1-rongqianfeng@vivo.com/

Changes in v2:
 - Add Fixes tag, update commit message
 - Remove unnecessary memset
 - Move memset to before the first usage


Irui Wang (1):
  media: mediatek: encoder: Fix uninitialized scalar variable issue

Qianfeng Rong (1):
  media: mediatek: vcodec: use = { } instead of memset()

 .../mediatek/vcodec/decoder/vdec/vdec_vp9_if.c    |  3 +--
 .../mediatek/vcodec/decoder/vdec_vpu_if.c         | 12 ++++--------
 .../mediatek/vcodec/encoder/mtk_vcodec_enc.c      | 12 +++++-------
 .../mediatek/vcodec/encoder/venc_vpu_if.c         | 15 +++++----------
 4 files changed, 15 insertions(+), 27 deletions(-)

-- 
2.45.2


