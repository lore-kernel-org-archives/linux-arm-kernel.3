Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950CDD0BB7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lRU6xMS4dEefnhGsln0x8bEQy8mZTyh/nEdKYPEt8C4=; b=Zzbs69Lufz7jGxTmAVCSf7+P9U
	MkyiZCuKTe3l6XypFb3GGWk3mFbVlhj3gqXu9+vaM9cvnFKSLT5OyonuGWcJHSiRhhEsaBP7NGroC
	maoHSGT8Sx2LgAlSyTGkfEKpw9/7Y2bquLloFqkp1h7LRpep9dxJULmFu7+25WXW4UlEoqGF4TwZO
	uL2L8OZV0KB1iReXKWEk6gs+wps6/XZn/Hj9iTFSmYAIfEgUgd+PdI0xaWage4OQ/Rde2ZSqt7GYR
	oPk+lSsJwGJGPqO2gJaXr9Ufj/tNM1N/DanIrasKdEhzwfAuPyKx1SZNZJyJGeEUkfGVDcIptKMXj
	Y+jZDRog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uBe-0000000HTaY-04Qw;
	Thu, 24 Oct 2024 09:31:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u7O-0000000HS9u-0tEy;
	Thu, 24 Oct 2024 09:26:59 +0000
X-UUID: 1acd9aec91ea11ef82ff63e91e7eb18c-20241024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lRU6xMS4dEefnhGsln0x8bEQy8mZTyh/nEdKYPEt8C4=;
	b=KyFx+V7zzoGalYgBrHT+oG6Xp12RqZLlyE5vzHprPG8rZ/ImeZn+WiiLkMqQrqcb36JQZl3AVAkQI2tocL8WX5Dfod6Y/jWNJHEHw5T2ClcMPaBFAyZv8opLvQZF8hYnrXY+dj+BlKrxi1R4RbQ1gmpQ1mvpR9VYtlNuJJma3jw=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.42,REQID:0cac3925-7334-43a7-ac98-76df1e465410,IP:0,U
	RL:25,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Spam_GS6885AD,AC
	TION:quarantine,TS:125
X-CID-META: VersionHash:b0fcdc3,CLOUDID:926a0b2e-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:801,TC:nil,Content:3,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 1acd9aec91ea11ef82ff63e91e7eb18c-20241024
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2094721242; Thu, 24 Oct 2024 02:26:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 24 Oct 2024 17:26:47 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 17:26:47 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Karl Li <Karl.Li@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Chungying Lu <chungying.lu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: mailbox: mediatek: Add apu-mailbox document
Date: Thu, 24 Oct 2024 17:25:43 +0800
Message-ID: <20241024092608.431581-2-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024092608.431581-1-karl.li@mediatek.com>
References: <20241024092608.431581-1-karl.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.460500-8.000000
X-TMASE-MatchedRID: YXgS1C6OPWx/dZAjNXEbFgPZZctd3P4BWjWsWQUWzVoCsxyhR8y7CQaT
	alM8C773wvUxdKBGcQwRA4hwIn2MDY2WQSzu3zX3T7jCYv2QJPG7atxTbKDEIPufvd3T2+v3oAW
	Nnmn5m56Neg5tL2+jnh12U5je5b4a7bdBxC9wVFeBlNt4VSGvIV3HHpZF/7mweuOjdf174McfPl
	xxE3mQszYLbDMMWtWewKX8fpO+yjINsM5qvTUs054CIKY/Hg3AaZGo0EeYG978V77yhJRgo99pj
	zubZ2rHwrbXMGDYqV8kL2NLniq3NVDiHpFdHheQuDMYOBqTn6YXj2OqpTl9ta7mcBhy8Pft
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.460500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DBEC2FDE3AEB68C307DBA82FD95F9BB603F9FAFD5EF28C10EC52C826E39BFB0E2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_022658_339903_AEA2302D 
X-CRM114-Status: GOOD (  13.18  )
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

From: Karl Li <karl.li@mediatek.com>

Add apu-mailbox dt-binding document.

Signed-off-by: Karl Li <karl.li@mediatek.com>
---
 .../mailbox/mediatek,apu-mailbox.yaml         | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
new file mode 100644
index 000000000000..cb4530799bef
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,apu-mailbox.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/mediatek,apu-mailbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek APU mailbox
+
+maintainers:
+  - Karl Li <Karl.Li@mediatek.com>
+
+description:
+  The MediaTek APU-Mailbox facilitates communication with the
+  APU microcontroller. Within the MediaTek APU subsystem, a
+  message passing mechanism is built on top of the mailbox system.
+  The mailbox only has limited space for each message. The firmware
+  expects the message header from the mailbox, while the message body
+  is passed through some fixed shared memory.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8188-apu-mailbox
+      - mediatek,mt8196-apu-mailbox
+
+  "#mbox-cells":
+    const: 1
+    description:
+      The cell describe which channel the device will use.
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#mbox-cells"
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    apu_mailbox: mailbox@4c200000 {
+      compatible = "mediatek,mt8196-apu-mailbox";
+      reg = <0 0x4c200000 0 0xfffff>;
+      interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+      #mbox-cells = <1>;
+    };
-- 
2.18.0


