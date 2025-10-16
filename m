Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8D4CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 06:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16Wzo3JHC2brp6YI5qgW0fAWTdMI5euW6XegxJazOCM=; b=GpMDOEQVCzHsdXV9KP6EuLWAh9
	m4LlVLB0bdByg24GkkUUVZhmHs9d9g29MxRkagPYI5ivYicO9xb0K1E5P3NoZXLM4d/2uwCnyHrDd
	P77gKi6/GKGUzH1CE8LxqpSlgDlJlkLceYJW4SsNicWuhCgF0nB+0XH1o8dsRge+fVBwsPG129UDR
	KPOcrUaMEyS7AkdOySBYkXRs9NCvHxEaC4p++ObZFNvmWMxH+7Jt1CedkmT5V6piTSXSpc7TH6rpt
	p9xmp/jCLICSO7pcDPCJ0vEsdXiO8ptyclronWDGFVtIJXatq7Y8E6lzQlDOnX4W+tNj2Eu/Fxppw
	JGQ7EPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H9q-00000003ZfZ-0yLM;
	Thu, 16 Oct 2025 06:08:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9H9n-00000003Zdj-1tZm;
	Thu, 16 Oct 2025 06:08:12 +0000
X-UUID: 7a810b60aa5611f0a52f393f94899d25-20251015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=16Wzo3JHC2brp6YI5qgW0fAWTdMI5euW6XegxJazOCM=;
	b=F6u/mwmw/nkeVArj6iW7gt5S6IYjDioA84kOKeEn+IT1E6Dk/vCZiMOgMwJv4gjjgfd4wLP671usxilNMf2aJ5BFBQVqrOpvvmMmMj5O0tZxmEc74SSgKMDo/N/IWNZcYZF3I+4SIAkwecXIngLfbBLVGKtqWKXwb8enpsw13eA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:5ce5453b-060d-4983-a4f3-a4f688f08966,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:b65e3ab9-795c-4f99-91f3-c115e0d49051,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7a810b60aa5611f0a52f393f94899d25-20251015
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1024506848; Wed, 15 Oct 2025 23:08:04 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 16 Oct 2025 14:08:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 16 Oct 2025 14:08:00 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
	<andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kyrie Wu <kyrie.wu@mediatek.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Christophe JAILLET
	<christophe.jaillet@wanadoo.fr>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Arnd
 Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, George Sun
	<george.sun@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	<andrzejtp2010@gmail.com>
Subject: [PATCH v4 1/8] dt-bindings: media: mediatek: decoder: Add MT8189 mediatek,vcodec-decoder
Date: Thu, 16 Oct 2025 14:07:39 +0800
Message-ID: <20251016060747.20648-2-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251016060747.20648-1-kyrie.wu@mediatek.com>
References: <20251016060747.20648-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_230811_498061_2F489975 
X-CRM114-Status: GOOD (  10.97  )
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

Add compatible for video decoder on MT8189 platform. Compared with
former ICs, the MT8189 decoder use iommu to instead of smmu, and
use scp architecture, the frequency is only 406MHZ, and cannot reach
more than 700MHZ. At the same time, the decoder supports the vp9
decoding protocol for the first time in single IC.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/mediatek,vcodec-subdev-decoder.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 74e1d88d3056..248a9f6af5a6 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -75,6 +75,7 @@ properties:
       - mediatek,mt8192-vcodec-dec
       - mediatek,mt8186-vcodec-dec
       - mediatek,mt8188-vcodec-dec
+      - mediatek,mt8189-vcodec-dec
       - mediatek,mt8195-vcodec-dec
       - mediatek,mt8196-vcodec-dec
 
-- 
2.45.2


