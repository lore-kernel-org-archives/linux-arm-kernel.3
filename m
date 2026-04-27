Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2950FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uzzuWVlj0FYbiNj+F9T4fZDJbrozBaIDhDqFdpxQrv0=; b=WQdOrz5jMpRqjezjCRp6ji3OWa
	LThb+hxwFIqSh75aKr4khOuOPxTEIY5wwca6OVGZIi90TF3eXk18wO8Ofr8YlgmnzVLpk+drqwjQf
	71eDFr8u8lhjz00RJI9V7es+IQ9icgBkOqqPYlj8kVviEKvVBCkzQD+OUSQWigbq/vkxsZo8T22U+
	o9CfMy8dq/QerpC+dpnKrLFW+/TWuxBV4G927lWDK36OF0CpgmlJGME0gxbM0/6ycXhqwUgRn/8HT
	oHnmrsPYpos66qX9ANmAwdttY/OMRWD8ML5sYNUqeCin75gneMsoP+FVH8i1KHeM6Xd9fD6b91JOd
	r8mqMFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK27-0000000GmTT-3Aop;
	Mon, 27 Apr 2026 11:21:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHK24-0000000GmSj-3zvk;
	Mon, 27 Apr 2026 11:21:46 +0000
X-UUID: 418c3772422b11f1a6de359d7043e138-20260427
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uzzuWVlj0FYbiNj+F9T4fZDJbrozBaIDhDqFdpxQrv0=;
	b=WrX7tz0SWb1hckN8mnyw6gmTQiX3taGOFWKcMQ0KsTeIHVAsNOd+sGlnMXfDMl9YQS4mhk1HrYNlF4r4ASy7QMMSSPvL1vHIO3zeCufN82hzZ2baDqftwaFU5vGAVAP8hdmXedgCrTRqhywN/Q9fqut7r6XEL7owF9FC0rH3R40=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:34ff783f-1431-4633-982a-4175d993aaa8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:-50
X-CID-META: VersionHash:e7bac3a,CLOUDID:c12bab64-469e-4eb6-aeb8-4b21454b0f32,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:2,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 418c3772422b11f1a6de359d7043e138-20260427
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jay.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2066642690; Mon, 27 Apr 2026 04:21:37 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 27 Apr 2026 19:21:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 27 Apr 2026 19:21:33 +0800
From: Jay Liu <jay.liu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Jay Liu <jay.liu@mediatek.com>
Subject: [PATCH v5 0/6] drm/mediatek: Add PQ components support for MT8196
Date: Mon, 27 Apr 2026 19:20:14 +0800
Message-ID: <20260427112131.23423-1-jay.liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_042144_996378_153979EB 
X-CRM114-Status: GOOD (  13.44  )
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

This series adds Picture Quality (PQ) component support for the MT8196 SoC,
including device tree bindings and driver implementations for GAMMA, DITHER,
CCORR, and TDSHP modules.

Patch 1: Add GAMMA compatible string for MT8196
Patch 2: Add DITHER compatible string for MT8196
Patch 3: Add CCORR compatible string for MT8196
Patch 4: Add TDSHP dt-binding documentation
Patch 5: Add support for multiple CCORR components
Patch 6: Add TDSHP driver support for MT8196

Architecture notes:
MT8196 display pipeline includes two CCORR instances that must be chained
in the hardware path, but the CTM API only configures one. Patch 5 ensures
the second CCORR instance does not interfere with the configured one.

Testing:
- Verified dt-bindings pass dt_binding_check
- Tested display pipeline with all PQ components on MT8196 EVB
- Confirmed color correction (CCORR CTM and GAMMA LUT) functionality
- Confirmed sharpness enhancement (TDSHP) functionality in relay mode
- Note: dtbs_check will be validated when MT8196 DTS is upstreamed

Changes in v5:
- Cover letter: Fix subject spelling and add subsystem prefix
- tdshp dt-binding: Replace 'disp-tdshp' with 'tdshp' in dt-binding (suggested by Krzysztof)
- Add complete version history and lore links for tracking (suggested by Krzysztof)

Changes in v4:
- tdshp dt-binding: Remove unused 'Sibling' description (suggested by Krzysztof)
- tdshp dt-binding: Use enum directly instead of items list for compatible property
- tdshp dt-binding: Fix indentation and remove extra blank line in example section
- ccorr driver: Rebase on linux-next to resolve conflicts

Changes in v3:
- Fix dt_binding_check errors in all binding patches
- Remove incorrect Signed-off-by line
- Move standalone ccorr fix out of this series

Changes in v2:
- Optimize ccorr ctm_set process to avoid affecting other SoCs
- Remove unnecessary code from tdshp driver
- Update tdshp dt-bindings (clocks, description, examples)

Link to v4: https://lore.kernel.org/all/20260324125315.4715-1-jay.liu@mediatek.com/
Link to v3: https://lore.kernel.org/all/20250808125512.9788-1-jay.liu@mediatek.com/
Link to v2: https://lore.kernel.org/all/20250727071609.26037-1-jay.liu@mediatek.com/
Link to v1: https://lore.kernel.org/all/20250219092040.11227-1-jay.liu@mediatek.com/

Dependencies:
This series depends on the MT8196 display pipeline foundation patches [1].

[1] "Add display path components support for MT8196"
    https://patchwork.kernel.org/project/linux-mediatek/list/?series=955361

Jay Liu (6):
  dt-bindings: display: mediatek: gamma: Add support for MT8196
  dt-bindings: display: mediatek: dither: Add support for MT8196
  dt-bindings: display: mediatek: ccorr: Add support for MT8196
  dt-bindings: display: mediatek: tdshp: Add support for MT8196
  drm/mediatek: Support multiple CCORR component
  drm/mediatek: Add TDSHP component support for MT8196

 .../display/mediatek/mediatek,ccorr.yaml      |  1 +
 .../display/mediatek/mediatek,dither.yaml     |  1 +
 .../display/mediatek/mediatek,gamma.yaml      |  1 +
 .../display/mediatek/mediatek,tdshp.yaml      | 46 ++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  5 +-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       | 52 ++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       |  8 +--
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c     |  6 ++-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +
 10 files changed, 116 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,tdshp.yaml

-- 
2.46.0


