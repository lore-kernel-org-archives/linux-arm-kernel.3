Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DF6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 06:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ULhWCMRnfloXSUOUb5D++K1tzuZ3+YXJYVeiwkdjmeI=; b=eEsKejshM6CeGda1uhavbwbQUz
	9u+p9gbNbRW8QBCw+LCiswIhckqJ+Y98tRsdTWk+lVtlU5sfh/nspEzBXOZMSSJuShxB9IwWrQ6QK
	3lex7G5Mnd/4R3HWSeWf3sah5jEDyDURvtuv6tur7tfpn23KnH2OEcr1ECueBEykh+j2uq6R/HesV
	C3RZ7BzI/jvakCUMkRxlPGyXK2EMzGf4E54AH80nTFmc/BC8R+hvirIqzmXiVRDSWSH0rMu3IKwHw
	X0LGmpIjAhwLJSOL+WqTq0lZb/hz8hTtlLtqf/yA2/9Q2wmEHzaiOGRE8qnGjd0FzAuIqcNfj+72R
	EMCXaoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urWFk-00000000S7j-1wgN;
	Thu, 28 Aug 2025 06:36:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urWD0-00000000Rjx-24bb;
	Thu, 28 Aug 2025 06:34:08 +0000
X-UUID: f935ad1683d811f09f706fa2197c6ceb-20250827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ULhWCMRnfloXSUOUb5D++K1tzuZ3+YXJYVeiwkdjmeI=;
	b=f6JqcjoN6QKY3SrBy1St1yNmmlv8yJpC8apS75UVln/BaoZ2EKqBgYv0j6k1NA4opNEDt/HwCVagFd3+vsZ/38RrVJvWX16rdNtzuqR2OxTqO7oWuVjAcB0H5qJA0f38TCHmqqAD9KucZD5NxMDgn5CGkjoUmFziV1fp6JsBBuY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:b635c7f4-93f7-4afe-a5ea-a8815b2c4e6a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:0d78b26d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f935ad1683d811f09f706fa2197c6ceb-20250827
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 880576825; Wed, 27 Aug 2025 23:33:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 14:33:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 14:33:53 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
	<jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
	<sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
	<sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/19] dt-bindings: arm: mediatek: mmsys: add compatible for MT8196
Date: Thu, 28 Aug 2025 14:31:52 +0800
Message-ID: <20250828063327.3475747-1-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_233406_553140_306C6A3D 
X-CRM114-Status: GOOD (  10.08  )
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

From: Nancy Lin <nancy.lin@mediatek.com>

In previous SoCs, a single HW pipeline was an independent mmsys,
which included the OVL module, PQ module, and display interface
module.

In the 8196, to increase the flexibility of pipeline connection
and control, the OVL module on a single HW pipeline was separated
into two mmsys, namely ovlsys0 and ovlsys1. The PQ module was also
separated into a dispsys0, and the display interface module was
separated into a dispsys1. Additionally, display power-related
settings are controlled through vdiso-ao.

For example:
The primary path and external path of the display both use
ovlsys0 -> dispsys0 -> dispsys1, forming a pipeline.

The third path of the display uses ovlsys1 -> dispsys0 -> dispsys1,
forming another pipeline.

Therefore, the 8196 needs to add 5 compatible string to support
mmsys for MT8196.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 3f4262e93c78..5f244a8f6a47 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -39,6 +39,11 @@ properties:
               - mediatek,mt8195-vdosys1
               - mediatek,mt8195-vppsys0
               - mediatek,mt8195-vppsys1
+              - mediatek,mt8196-dispsys0
+              - mediatek,mt8196-dispsys1
+              - mediatek,mt8196-ovlsys0
+              - mediatek,mt8196-ovlsys1
+              - mediatek,mt8196-vdisp-ao
               - mediatek,mt8365-mmsys
           - const: syscon
 
-- 
2.45.2


