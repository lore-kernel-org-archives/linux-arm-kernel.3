Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C33D64062
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 06:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qa0rG+HkH4eerZc8wp6OWcbR/ghiOeq880uZtF8zOjI=; b=SGk89xsUIPloNREBYsJJrVpdLR
	r0p7HXMJEMQZmlRZDm7yEvPTaEZEX8AtQK6qdrkSitoN4qGCshIJL1eHIn15i1T1jvkJoYXMJZE2w
	rcQv6Iqs81zJtLYWpLqSERhyHvCSMBLH7gkywkqV8a0EDadhcJGDGvhDvdWkxc9NDkQrwFdPujIo4
	Smk036RtT8Uqo9HQnQXs///RBL5bOvTOzXxvEPoroC/oCVoMvjBY164qMH2hmPpWSVJtVN8GVteTo
	Ax8a4OmZIUB10IEZcIklUUAP/HYj3+0Gq+P4j4TVaQRCiKiT8rSFdvLzDhKsEwQYff5Nbqi4xADbd
	wTKceKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVl7Y-00000006F7S-0Pl1;
	Wed, 17 Dec 2025 06:34:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVl7T-00000006F3p-1nvP;
	Wed, 17 Dec 2025 06:34:44 +0000
X-UUID: 768027f2db1211f09f706fa2197c6ceb-20251216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Qa0rG+HkH4eerZc8wp6OWcbR/ghiOeq880uZtF8zOjI=;
	b=LThlTPv9K/hN9gEN1Ibo9U0F/GOjosVouSmkrj3N6+fFNJ0txaXH4tIWZDh9844XlXj+Da3qg9eD4PCtoA6DnboNR6scoFKwhCOko6nAPkVNa//PNwJWcie201jpQDSoTpap4HAF6kMCqyIcBfA90eT67spbBjkJhJHxfItvWwQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:6efc12a2-ecd2-47b2-891a-d9dae907ffe9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:1595dc02-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|888|898,TC:-5,Content:0|15
	|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 768027f2db1211f09f706fa2197c6ceb-20251216
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <xiaoshun.xu@mediatek.corp-partner.google.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 56600327; Tue, 16 Dec 2025 23:34:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 14:34:36 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 14:34:36 +0800
From: Xiaoshun Xu <xiaoshun.xu@mediatek.corp-partner.google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Xiaoshun Xu
	<xiaoshun.xu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu
	<vince-wl.liu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 1/4] dt-bindings: soc: mediatek: devapc: Add bindings for MT8189
Date: Wed, 17 Dec 2025 14:34:10 +0800
Message-ID: <20251217063429.1157084-2-xiaoshun.xu@mediatek.corp-partner.google.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251217063429.1157084-1-xiaoshun.xu@mediatek.corp-partner.google.com>
References: <20251217063429.1157084-1-xiaoshun.xu@mediatek.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_223443_474865_34450A90 
X-CRM114-Status: GOOD (  10.86  )
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


External email : Please do not click links or open attachments until you ha=
ve verified the sender or the content.


From: Xiaoshun Xu <xiaoshun.xu@mediatek.com>

Extend the devapc device tree bindings to support the MediaTek MT8189
SoC. This includes:

- Adding "mediatek,mt8189-devapc" to the list of compatible strings.
- Introducing the "vio-idx-num" property to specify the number of bus
  slaves managed by devapc.

These changes enable proper configuration and integration of devapc on
MT8189 platforms, ensuring accurate device matching and resource
allocation in the device tree.

Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/devapc.yaml       | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/D=
ocumentation/devicetree/bindings/soc/mediatek/devapc.yaml
index 99e2caafeadf..06a096440331 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -14,13 +14,14 @@ description: |
   analysis and countermeasures.

 maintainers:
-  - Neal Liu <neal.liu@mediatek.com>
+  - Xiaoshun Xu <xiaoshun.xu@mediatek.com>

 properties:
   compatible:
     enum:
       - mediatek,mt6779-devapc
       - mediatek,mt8186-devapc
+      - mediatek,mt8189-devapc

   reg:
     description: The base address of devapc register bank
@@ -30,6 +31,10 @@ properties:
     description: A single interrupt specifier
     maxItems: 1

+  vio-idx-num:
+    description: Describe the number of bus slaves controlled by devapc
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   clocks:
     description: Contains module clock source and clock names
     maxItems: 1
@@ -42,8 +47,6 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
-  - clock-names

 additionalProperties: false

@@ -55,6 +58,7 @@ examples:
     devapc: devapc@10207000 {
       compatible =3D "mediatek,mt6779-devapc";
       reg =3D <0x10207000 0x1000>;
+      vio-idx-num =3D <132>;
       interrupts =3D <GIC_SPI 168 IRQ_TYPE_LEVEL_LOW>;
       clocks =3D <&infracfg_ao CLK_INFRA_DEVICE_APC>;
       clock-names =3D "devapc-infra-clock";
--
2.45.2


