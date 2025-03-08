Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429A0C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6nXu7KSD6tf6cobmFDtax1hDH31QEZ+uhW/Em9uGb1k=; b=3+H0DAtZxAN47NwQvr77JLvBm5
	LGfzVsiU5duMIr7MPlmg7Gyl81nbG5yQ06EnC3tdk5SlXCJITXvx7ruM6MuqxASXTGkRYxcR7i946
	hxFMxGcjMrRoYBHa4TYhsIO7dVWTAtB2Eg23oqpxVYptq9d4/4LqJPdbyZBuRrdG2i/SqVt5roM/I
	QtOuk/zsH79zLq8F3O4mTMoWaCZ3NPpPvgyLHQUBKRGppTMN6h89x5nuOW15xjKM5sRq5ksfjZPle
	MuAe5bdgfMISKcpfRmPwnPSkFMiDKICiorOu9mJXNwPqThoqFKj49kD5AdSSORyQjr8t+E0wfDW+7
	yWGdzLHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqowR-0000000GKM6-11FR;
	Sat, 08 Mar 2025 07:49:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqoun-0000000GK8S-3l6V;
	Sat, 08 Mar 2025 07:48:11 +0000
X-UUID: abf45d96fbf111ef83f2a1c9db70dae0-20250308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6nXu7KSD6tf6cobmFDtax1hDH31QEZ+uhW/Em9uGb1k=;
	b=rEdsjyaSLos9IBJ/dAVag+sofQhuQTkuoF23VCzHwW18WzZSaDBHXGepgm0BF4BW46Z1WG5XZ4uIEzu/ADknGD2xWMaFhT0mWlePM9fwlCZTNJz1tYP4xrpwHhXGQPeWYs0xLyxAJskDtccFtsTeb8yYQzjUaH5qwAFoUjFQpGo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:b1abc263-b19c-4d41-aab8-4f8a7f4fc498,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:56f3d749-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: abf45d96fbf111ef83f2a1c9db70dae0-20250308
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1777764025; Sat, 08 Mar 2025 00:48:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Mar 2025 15:48:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Mar 2025 15:48:02 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v8 0/3] media: mediatek: vcodec: support h264 extend vsi
Date: Sat, 8 Mar 2025 15:47:54 +0800
Message-ID: <20250308074802.18929-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_234809_943854_DDCB4F90 
X-CRM114-Status: GOOD (  12.59  )
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

The working buffer address start and end are calculated in kernel
side currently, the address end can't be calculated if the driver
only getting the address file handle, not the real physical address.
Need to send the extended vsi to firmware to calculate the address
end.

Re-construct some interface and add configuration to support extend
and non extend driver at the same time. Needn't to parse nal info for
extended architecture.
---
compared with v7:
- fix smatch warning for patch 2

compared with v6:
- fix the coding style for patch 2
- rewrite commit message for patch 2/3

compared with v5:
- add some parameters comment for patch 2

compared with v4:
- rebase this patch series with latest vcodec driver

compared with v3:
- change code logic with callback to decode for patch 2

compared with v2:
- squash patch 2/3/4 together
- re-write commit message for patch 1

compared with v1:
- combine some pathes together for patch 2
- re-write patch 4
---
Yunfei Dong (3):
  media: mediatek: vcodec: remove vsi operation in common interface
  media: mediatek: vcodec: support extended h264 decode
  media: mediatek: vcodec: add description for vsi struct

 .../vcodec/decoder/mtk_vcodec_dec_drv.h       |   2 +
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 652 +++++++++++++++---
 2 files changed, 562 insertions(+), 92 deletions(-)

-- 
2.46.0


