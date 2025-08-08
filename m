Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D26C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K7iyex7lMfUkETiMptOjGboRhBbfG+sCbpLEqjEMdiI=; b=LQogldiAQ0exTBvsLfg+IJhTN9
	QTXH8gmcGyTu3wJGwywS7vL+KljNqIKfEuuoRDaRu18OxScm/tb0DKxM9IQcDfdgmM1MRD7n/uqMx
	jNRZ5LFn+mTBqAHjI6Jhbd+ZfrGDi0t+5wGuqi8vKEhW5b92GmGR8ml0Qxmga8ur8fJHLt2d9ujBk
	kKQh/9I+2zVoceYVoxL8SvPiqlE3FV0MVAI8IMqnL5U/u1qkB4/O6Fwhi2EuuDhfbkggpAaByhg2j
	31jky7ywe+Qen+YX1XBcG0F98RSWwpfISOnMJY+tIpTB3vozbw683xKiliWcNXYF3WiiDSPWHixHp
	GAwNVT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMfr-00000002rZg-1QiU;
	Fri, 08 Aug 2025 12:58:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMd9-00000002qxq-27IY;
	Fri, 08 Aug 2025 12:55:33 +0000
X-UUID: f344e098745611f09f706fa2197c6ceb-20250808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=K7iyex7lMfUkETiMptOjGboRhBbfG+sCbpLEqjEMdiI=;
	b=m1WxlJVzzUa7BZ6NdckJueYmkGs9XfvvyK9Suydgu/eES+S6HdJmvZv5Y2SOKZ/0IB0KlPiFtcSyDL/GxFKtYRt5J9+NBZVUHgpwk1kTvK5v43eyV52qDdHvoJrHL59OWOoSXKKaUQ7ZN+1zsopgQVzrcsC6RADvBfzoB0Y/qis=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:9a168d87-6421-4232-9df5-4871ec788778,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:e2e635ce-1ac4-40cd-97d9-e8f32bab97d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f344e098745611f09f706fa2197c6ceb-20250808
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1755433799; Fri, 08 Aug 2025 05:55:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 8 Aug 2025 20:55:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 8 Aug 2025 20:55:18 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jay Liu <jay.liu@mediatek.com>
Subject: [PATCH v3 0/6] porting pq compnent for MT8196
Date: Fri, 8 Aug 2025 20:53:55 +0800
Message-ID: <20250808125512.9788-1-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_055531_561726_329494A6 
X-CRM114-Status: GOOD (  10.23  )
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

Change in v3:
- fix dt_binding_check error
- remove Signed-off-by: 20220315152503 created <jay.liu@mediatek.com>
- move fix ccorr issue patch out of this series.

This patch series id base on [1]
[1] Add components to support PQ in display path for MT8196
    - https://patchwork.kernel.org/project/linux-mediatek/list/?series=955361

Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Jay Liu (6):
  dt-bindings: display: mediatek: gamma: Add support for MT8196
  dt-bindings: display: mediatek: dither: Add support for MT8196
  dt-bindings: display: mediatek: ccorr: Add support for MT8196
  dt-bindings: display: mediatek: disp-tdshp: Add support for MT8196
  drm/mediatek: Support multiple CCORR component
  drm/mediatek: Add TDSHP component support for MT8196

 .../display/mediatek/mediatek,ccorr.yaml      |  1 +
 .../display/mediatek/mediatek,disp-tdshp.yaml | 52 +++++++++++++++++++
 .../display/mediatek/mediatek,dither.yaml     |  1 +
 .../display/mediatek/mediatek,gamma.yaml      |  1 +
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  5 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 52 ++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  8 +--
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |  6 ++-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +
 10 files changed, 122 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml

-- 
2.46.0


