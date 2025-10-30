Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64520CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOzOTNAAyN7vYz7Yua2PoZcgyIUU0v5BE6O1gzYS/Fc=; b=ZzwcTsa88qWuKBWI/fXEBTdpyI
	yfVH302rhG9DASswLwUyyKnPpSAIrp0UIKXP3nNyN5F/CUxrqsVZGaljT7u+Y987sxxq3IP7KFIGg
	5CR88Eo1aLuIpsryGwrGjT0CMjIvfe6Q7dExevfpQvJDbDXXjxKBA0D6xXH/y9c7hQ7Q6uZ/K2vTj
	7pA0bmeOxUnjabWLls50++n9pz8UiFgPycJ+/j2OqpfvSY4Bk4amO/WwmMIhBjS6M77z3uEbWz0MC
	G+gL2xYcZJ8B7K7wO8Ka5z/3w2J4XZvgL+7W6zfRREyVJZ5uRF7se4jBfaq9q2+aRPVy5amU9AfDI
	jZ2Wvb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET0S-00000004E7X-3Mja;
	Thu, 30 Oct 2025 13:48:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vET07-00000004Dts-3phJ;
	Thu, 30 Oct 2025 13:47:41 +0000
X-UUID: fd1c2384b59611f09f706fa2197c6ceb-20251030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VOzOTNAAyN7vYz7Yua2PoZcgyIUU0v5BE6O1gzYS/Fc=;
	b=bthSk+pYmntR7KYcRnwoxBzCCZ8ALy6DMYQSu/Cybqpn1mGvwBxppl3sGmWlNxTQh3B9AlZ4+ooSuM1UfpB7uhuWUYWegtEHM5VwIHGjL6fcu4xmyrjsoKg49gxAU/zRfuRd7zHQZr95/OzqhLN4xCqBS5NNGOKVfkIHVn25Vaw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:91771ebe-17c1-4f66-b307-3f52ee1fd25e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:fe65f3df-3890-4bb9-a90e-2a6a4ecf6c66,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd1c2384b59611f09f706fa2197c6ceb-20251030
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1521790410; Thu, 30 Oct 2025 06:47:34 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 30 Oct 2025 21:47:31 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 30 Oct 2025 21:47:31 +0800
From: Jack Hsu <jh.hsu@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<jic23@kernel.org>, <dlechner@baylibre.com>, <nuno.sa@analog.com>,
	<andy@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <srini@kernel.org>,
	<ukleinek@kernel.org>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
	<daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<chunfeng.yun@mediatek.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<sean.wang@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<andrew-ct.chen@mediatek.com>, <lala.lin@mediatek.com>,
	<jitao.shi@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pwm@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jack Hsu
	<jh.hsu@mediatek.com>
Subject: [PATCH v6 07/11] dt-bindings: usb: Support MediaTek MT8189 evb board xhci
Date: Thu, 30 Oct 2025 21:44:39 +0800
Message-ID: <20251030134541.784011-8-jh.hsu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251030134541.784011-1-jh.hsu@mediatek.com>
References: <20251030134541.784011-1-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_064739_988932_FE8F486E 
X-CRM114-Status: UNSURE (   8.81  )
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

modify dt-binding for support mt8189 evb board dts node of xhci

Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 004d3ebec091..05cb6a219e5c 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -34,6 +34,7 @@ properties:
           - mediatek,mt8183-xhci
           - mediatek,mt8186-xhci
           - mediatek,mt8188-xhci
+          - mediatek,mt8189-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
           - mediatek,mt8365-xhci
@@ -119,6 +120,9 @@ properties:
   resets:
     maxItems: 1
 
+  reset-names:
+    maxItems: 1
+
   usb3-lpm-capable: true
 
   usb2-lpm-disable: true
@@ -168,7 +172,8 @@ properties:
             104 - used by mt8195, IP1, specific 1.04;
             105 - used by mt8195, IP2, specific 1.05;
             106 - used by mt8195, IP3, specific 1.06;
-          enum: [1, 2, 101, 102, 103, 104, 105, 106]
+            110 - used by mt8189, IP4, specific 1.10;
+          enum: [1, 2, 101, 102, 103, 104, 105, 106, 110]
 
   mediatek,u3p-dis-msk:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.45.2


