Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EC7F532CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sULUjpLWZ7wVszRxwC8FpqlNzXJ4qE9Ukq/gh4VHajw=; b=mEjLYPGwMd777QoOURxIl8ykPu
	T+ErxqxHpK9aJlss+M+0/IqL4FFM9IAJo34acLI8AQtOor2fhrS0SLqF8S9WpIyOyFxiYzHaFzIiK
	bnC+pMVIpYZfCAOmfnKSMKcy39ZCS9YnWCL4xXe5aG/8t37fKKE3zVHupFTWBQ1QkQO5DKPghwzKu
	6qqjic6066PlJX4xrp76LgQdLT/dQmh/Ii1novXe4ofNnWzLRRG7udFBiNHlTh5Fsbu2DHvPsb7Im
	Oo69j5nyIbmSSxN9NWVUYVpJmCoJvUW/RSuVW1uNp8fOqHOhVdNm6z3AwnV0DyNxH7DJASSmqoSzu
	OzNrapfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sPe-00000000TpY-43nO;
	Tue, 24 Mar 2026 03:26:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sPb-00000000ToR-3mQn;
	Tue, 24 Mar 2026 03:26:37 +0000
X-UUID: 410690f0273111f1a6de359d7043e138-20260323
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sULUjpLWZ7wVszRxwC8FpqlNzXJ4qE9Ukq/gh4VHajw=;
	b=FfCpYM5ukpd/BeFhMg0+IuO+AYPR/yck0/HQozO9UnjfI+oCJ2dT87Y4VONvyYUe1Y8X2iWAR2wqE/eUEPgjO8aRmhQOrzxGNkpTS6fITW2o2n+7Zqcim+HczJoRNjcgzp43TzjQzV4rvCikTP4ew394dTPAImqkEhlgKlWI4gE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:d939d2cb-c84c-4e24-8658-891a4993b50e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:e3dd0ed5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 410690f0273111f1a6de359d7043e138-20260323
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ot_meiker.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 544251527; Mon, 23 Mar 2026 20:26:32 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 24 Mar 2026 11:26:29 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 24 Mar 2026 11:26:29 +0800
From: Meiker Gao <ot_meiker.gao@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Bayi Cheng <bayi.cheng@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <linux-spi@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Meiker Gao <ot_meiker.gao@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: spi: Fix clock-names definition
Date: Tue, 24 Mar 2026 11:26:17 +0800
Message-ID: <20260324032624.1708029-2-ot_meiker.gao@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260324032624.1708029-1-ot_meiker.gao@mediatek.com>
References: <20260324032624.1708029-1-ot_meiker.gao@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_202635_969023_1A056B0A 
X-CRM114-Status: GOOD (  10.49  )
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

Update the device tree binding for the Mediatek
MT8196 NOR controller to require that the 'clock-names'
property contains exactly six entries, in the strict order:
"spi", "sf", "axi", "axi_s", "bclk", "27m".

Signed-off-by: Meiker Gao <ot_meiker.gao@mediatek.com>
Change-Id: I0542d6d726f1af34ef76c1a58ba4e4b02ec45fe6
---
 .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
index a453996c13f2..f605a36e753c 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
@@ -56,6 +56,10 @@ properties:
                      design, so this is optional.
       - description: clock used for controller axi slave bus.
                      this depends on hardware design, so it is optional.
+      - description: clock used for bclk.
+                     this depends on hardware design, so it is optional.
+      - description: clock used for 27m.
+                     this depends on hardware design, so it is optional.
 
   clock-names:
     minItems: 2
@@ -64,6 +68,8 @@ properties:
       - const: sf
       - const: axi
       - const: axi_s
+      - const: bclk
+      - const: 27m
 
 required:
   - compatible
-- 
2.45.2


