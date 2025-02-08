Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299E0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 07:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vrn/T+bP6v+jye0RhHmeyFpoaCMmJ+ry5M5tfkDObHg=; b=I6q1PjQtvd700th02ownjFYKcz
	yDKY1Ta3JivHjlKEi0iNTn2ihO2D43oM5WuKQHGS65ysHOUizlJ8T7urv0kHQ4gnc+rz3vsdVP+9s
	1aG+0zSC9M+OpxWlEWszw7tG8OQc/GX+l//X2ZICAW38xnQFo7flKWDEcjEKVBeJm68i+vDVzxKDR
	OldO7w1BXyDlefmvl3d3LUpmDljEm6MtRcqzrsBeA1fAqPprS2aC8siO3cSlZMns/ay+fN0JCUqWx
	p5NdWxZOggkuLzLlqZxDN98arnpJHI5yXCNgIEPioko7NWr+tE3lXPTK+uYVwg4F6xFCULe9lUyGr
	UQATKwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgewj-0000000CMeg-2veH;
	Sat, 08 Feb 2025 07:08:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgevK-0000000CMHf-2n1u;
	Sat, 08 Feb 2025 07:06:43 +0000
X-UUID: 3d949738e5eb11ef9048ed6ed365623b-20250208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Vrn/T+bP6v+jye0RhHmeyFpoaCMmJ+ry5M5tfkDObHg=;
	b=BGp24uGdVc1w2v2DcUEEfheMSfFx7KLndw/kzoPK2ZyE1vim+M/D+84X1R8Eio5ohn13572dVu8QUQwywJYtfakopXhO0s1phA074EA0OXP0nkuYMiw3rn/vpYFSlmp6zAQtc8g3CfxV5ubNN2yDuJ/5sUQnwT8HswQFlz3Dcyw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:83874c28-9d0b-49c7-b889-899b4b58c13b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a0583c3e-da39-4471-8a46-23da908abe46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3d949738e5eb11ef9048ed6ed365623b-20250208
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 867596788; Sat, 08 Feb 2025 00:06:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Sat, 8 Feb 2025 15:06:35 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Sat, 8 Feb 2025 15:06:34 +0800
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
Subject: [PATCH v7 0/3] media: mediatek: vcodec: support h264 extend vsi
Date: Sat, 8 Feb 2025 15:06:22 +0800
Message-ID: <20250208070633.30862-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_230642_709600_1A3C5744 
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
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 648 +++++++++++++++---
 2 files changed, 558 insertions(+), 92 deletions(-)

-- 
2.46.0


