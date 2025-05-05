Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F0FC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9tFr6NP/YvaJav3XxGA5IVoO2BI4qHSWUi9hJZDlRI=; b=ij7iiDyg2lI8hUAIkNFl0KMYzf
	NE/VNxPDD1Vics+9OxaDDuaeewfN1FlWiY/lPISW8A3xUKW04t6aTzX/Y1O5LkhGSYh9j2tcaLrF3
	BgkSHHN0rxbg6x7FgnLL5atPfWAbelUpMrVHY2v3Ea6Fk8ywbK/w5KVxSbfRfLzgVmkor596XH35a
	olBTE2ag3ZF33osKKtGg6+rOj3KvyogPMDmy5FvkDkCcvW6CDWUVJEWb/vRENgrf5MZLRNhVH2qtd
	QfT3zsvRNBlDfDiwVWKLXsUKbzenO6/8LOtsCWzH6QaaYPe9qnIDD/HVqL7sWSNhcKSU3uYBBFF4R
	ITnJbMXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuox-00000007IT4-3rtf;
	Mon, 05 May 2025 12:21:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBukf-00000007HW0-2B9M;
	Mon, 05 May 2025 12:16:54 +0000
X-UUID: d20c17a829aa11f08d385d50fb11b32d-20250505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=R9tFr6NP/YvaJav3XxGA5IVoO2BI4qHSWUi9hJZDlRI=;
	b=N/KgUxJLnC7gZtokF5QZIg5K1lbpQmJxyynuHKtEjf/p5T6RUb+n/lJCLwiZ63tENhxgE1KAP4VKF8Y5V8HNLsqAyTWje8mycxmdttAg4o/UK3xd/fGHQ2AihwUScGkuHeS6CGaU/5qzv+TumBZ2WWn4fu4NtFdse/HRc7gLu2Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ef6429a5-16be-4cfd-bd79-f29185c8854d,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:d7203170-e08c-41ab-89e8-3ba0a33da853,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d20c17a829aa11f08d385d50fb11b32d-20250505
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <sirius.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1715119289; Mon, 05 May 2025 05:16:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 5 May 2025 20:16:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 5 May 2025 20:16:46 +0800
From: Sirius Wang <sirius.wang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wenst@chromium.org>, Sirius Wang <sirius.wang@mediatek.com>
Subject: [PATCH 1/2] WIP: dt-bindings: arm: Add compatible for MediaTek MT8189
Date: Mon, 5 May 2025 20:15:45 +0800
Message-ID: <20250505121627.3944728-2-sirius.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505121627.3944728-1-sirius.wang@mediatek.com>
References: <20250505121627.3944728-1-sirius.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_051653_561263_67DACA85 
X-CRM114-Status: UNSURE (   9.42  )
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

This commit adds dt-binding documentation for the MediaTek MT8189
reference board.

BUG=b:387230785
BUG=b:387229727
BUG=b:362203280

TEST=emerge-skywalker chromeos-kernel-6_6

Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index fa1646bc0bac..05e827076a7f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -372,6 +372,10 @@ properties:
           - enum:
               - mediatek,mt8188-evb
           - const: mediatek,mt8188
+      - items:
+          - enum:
+              - mediatek,mt8189-evb
+          - const: mediatek,mt8189
       - description: Google Hayato
         items:
           - const: google,hayato-rev1
-- 
2.45.2


