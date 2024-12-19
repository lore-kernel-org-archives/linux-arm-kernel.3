Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F708E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 18:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6l2tIy9AreNG9UEVSlyrqm8QJaBLoxbrNWgh+rkDbg=; b=eITSkV/aWlGg6PDFDiP4nSdQYh
	uxFljqf4dR8djmpxK06H85364pCJ3Uhk0MK1ZCiF/u4g5Mw6PvBLMAy+Rf/KUp1gcHjNTytXC8GP1
	U3IIbMSW7vRTXHkQBcGpAhqI0bk/tiex852NY81R05k6HZUnV6imD2NhTo1DbhwIzK6t4/hnkUPgM
	pm5I6aurVGtHvqD8a+bZ8/hJCplzhD4VHjRAIDuH0yyet6E3WzVpcu++9J2/VRgw+Ng8z0gM1gU1+
	Q7N2ScVpGc7T7BWAb+tg6v/tvDpEq1SXE2LVmvLE0xlGMcXXL3hkAl+2uzrpd9bvDrBRxgy17SvI0
	2+XiPnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOL70-00000002irm-2ILv;
	Thu, 19 Dec 2024 18:19:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOL3k-00000002iHF-3rI6;
	Thu, 19 Dec 2024 18:15:42 +0000
X-UUID: 3efc3bfebe3511ef9048ed6ed365623b-20241219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=D6l2tIy9AreNG9UEVSlyrqm8QJaBLoxbrNWgh+rkDbg=;
	b=iAVtvC+SlqLHCdQTvvE3ARX1VzKH4njUH7tkGTTrgrMVz3/NHN07lU5m0f9cjaLOiI9nqoPfE4y7xoLtsRfb5wzclt9uLZD2Jn2E75zxUsx6Yma9dqCfAkWKKTL8BuUaBL9Ya0bOc/sIaex9iiaPX+qGF0N7WKbErMD5mBiiVNE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:8be5d797-2684-4579-af4c-f17c34233ddb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:67143f3c-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:100,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3efc3bfebe3511ef9048ed6ed365623b-20241219
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1748155773; Thu, 19 Dec 2024 11:15:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Dec 2024 02:15:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Dec 2024 02:15:34 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Fei Shao
	<fshao@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v3 1/4] dt-bindings: display: mediatek: ovl: Add compatible strings for MT8188 MDP3
Date: Fri, 20 Dec 2024 02:15:28 +0800
Message-ID: <20241219181531.4282-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
References: <20241219181531.4282-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_101540_960484_FFDCB693 
X-CRM114-Status: UNSURE (   9.39  )
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

Add compatible strings for the MDP3 OVL hardware components in
MediaTek's MT8188 SoC and it is compatible with the existing
MT8195 MDP OVL components.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 9ea796a033b2..33542211507f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -46,6 +46,9 @@ properties:
               - mediatek,mt8186-disp-ovl
               - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
+      - items:
+          - const: mediatek,mt8188-mdp3-ovl
+          - const: mediatek,mt8195-mdp3-ovl
 
   reg:
     maxItems: 1
-- 
2.43.0


