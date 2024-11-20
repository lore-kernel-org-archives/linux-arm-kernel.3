Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6522BD6E2C9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 06:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gMs/diYXN4X9z9nI+JN/RNmvVcQKJVNx8MA0OWmObQ=; b=Dk4po7wSIm2mh5SSSH4E5mgqzR
	qyJfUUB3V1KY2t6+T/FuUhkFudxDDP72wx3PRJAKPK0xX29gJCvY8AoUdyg8Ov1hlvOBjhw7ze3ib
	3pc7aEcohiOqMfVuSWsi/D1ywF7FY57xr8zCSIhyPda3yK1pxgfddktfbCJMHb2ZV8J73hktTmBwV
	E33dMDf8TU9UnPARyGgBdKflFHpmlYf8OKBoLTZ6+zV6m/yhYqy0wtudqX2alJO0TkmCt63tPxZu0
	U2PIfn+O/dAYCXXjPT2wk1L5ahHk0LxanzV3v/ztwM+biQZy6j3tHEDIZIsE1ql2ls+psDyPcjNc5
	lDb9/WWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeLq-0000000EWMw-3Yqu;
	Wed, 20 Nov 2024 06:38:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDeKs-0000000EVrw-3iJq;
	Wed, 20 Nov 2024 06:37:12 +0000
X-UUID: dd18d9a2a70911ef82ff63e91e7eb18c-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=+gMs/diYXN4X9z9nI+JN/RNmvVcQKJVNx8MA0OWmObQ=;
	b=LuwcqE0yZnCObFpVMBJA8S++6g0pofeAwsubYTTtM9isJwZClk+w0hDPm8Lx7IONFnDayQsMhU3o+ji5ApHE0uilklMdtz6q51yUROElZ+MT4IQDPCphEIVRI2X07dNkDsT9eFXoHAuOKj7/tZyfcM+WoQAxaWVNOwKGe5Vx7wY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:83ba943b-29b0-4413-a8fd-65ed0d0247f9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:04f218b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dd18d9a2a70911ef82ff63e91e7eb18c-20241119
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 347994005; Tue, 19 Nov 2024 23:37:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 14:37:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 14:37:04 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Friday Yang
	<friday.yang@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: memory: mediatek: Add SMI reset and clamp related property
Date: Wed, 20 Nov 2024 14:36:38 +0800
Message-ID: <20241120063701.8194-2-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241120063701.8194-1-friday.yang@mediatek.com>
References: <20241120063701.8194-1-friday.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_223710_927645_1AD0E4C0 
X-CRM114-Status: GOOD (  17.09  )
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

On the MediaTek platform, some SMI LARBs are directly linked to SMI
Common. While some SMI LARBs are linked to SMI Sub Common, then SMI
Sub Common is linked to SMI Common. The hardware block diagram could
be described as below.
Add 'resets' and 'reset-names' for SMI LARBs to support SMI reset
and clamp operation. The SMI reset driver could get the reset signal
through the two properties.

             SMI-Common(Smart Multimedia Interface Common)
                          |
         +----------------+------------------+
         |                |                  |
         |                |                  |
         |                |                  |
         |                |                  |
         |                |                  |
       larb0       SMI-Sub-Common0     SMI-Sub-Common1
                   |      |     |      |             |
                  larb1  larb2 larb3  larb7       larb9

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---

Although this can pass the dtbs_check, maybe there is a better way
to describe the requirements for 'resets' and 'reset-names' in bindings.
But I don't find a better way to describe it that only SMI larbs located
in camera and image subsys requires the 'resets' and 'reset-names'.
I would appreciate it if you could give some suggestions.

.../mediatek,smi-common.yaml                  |  2 +
 .../memory-controllers/mediatek,smi-larb.yaml | 53 +++++++++++++++----
 2 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 2f36ac23604c..4392d349878c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -39,6 +39,7 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8188-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -107,6 +108,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8188-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
       required:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2381660b324c..302c0f93b49d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -69,6 +69,18 @@ properties:
     description: the hardware id of this larb. It's only required when this
       hardware id is not consecutive from its M4U point of view.

+  resets:
+    maxItems: 1
+    description: This contains a phandle to the reset controller node and an index
+      to a reset signal. SMI larbs need to get the reset controller by the node.
+      SMI could get the reset signal by the index number defined in the header
+      include/dt-bindings/reset/mt8188-resets.h.
+
+  reset-names:
+    const: larb
+    description: The name of reset controller. SMI driver need to obtain the
+      reset controller based on this.
+
 required:
   - compatible
   - reg
@@ -125,19 +137,38 @@ allOf:
       required:
         - mediatek,larb-id

+  - if:  # only for camera and image subsys
+      properties:
+        mediatek,smi:
+            contains:
+              enum:
+                - smi_sub_common_img0_4x1
+                - smi_sub_common_img1_4x1
+                - smi_sub_common_cam_5x1
+                - smi_sub_common_cam_8x1
+
+    then:
+      required:
+        - resets
+        - reset-names
+
 additionalProperties: false

 examples:
   - |+
-    #include <dt-bindings/clock/mt8173-clk.h>
-    #include <dt-bindings/power/mt8173-power.h>
-
-    larb1: larb@16010000 {
-      compatible = "mediatek,mt8173-smi-larb";
-      reg = <0x16010000 0x1000>;
-      mediatek,smi = <&smi_common>;
-      power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
-      clocks = <&vdecsys CLK_VDEC_CKEN>,
-               <&vdecsys CLK_VDEC_LARB_CKEN>;
-      clock-names = "apb", "smi";
+    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
+    #include <dt-bindings/power/mediatek,mt8188-power.h>
+    #include <dt-bindings/reset/mt8188-resets.h>
+
+    larb10: smi@15120000 {
+        compatible = "mediatek,mt8188-smi-larb";
+        reg = <0 0x15120000 0 0x1000>;
+        clocks = <&imgsys CLK_IMGSYS_MAIN_DIP0>,
+                 <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>;
+        clock-names = "apb", "smi";
+        power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
+        resets = <&imgsys1_dip_nr_rst MT8188_SMI_RST_LARB10>;
+        reset-names = "larb";
+        mediatek,larb-id = <10>;
+        mediatek,smi = <&smi_sub_common_img0_4x1>;
     };
--
2.46.0


