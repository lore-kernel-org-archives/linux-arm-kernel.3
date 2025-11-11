Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB74CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJEnXUEG6vZWLXTM9F/rXFXxzsyh5CEun4xXmQa9mXM=; b=UeCFnMcblWpu2UUb8r7SV9QELj
	ofIoidjqxyZbk5ocj9g5gJF+a9cyr72rj/7Oxr88TDeiaLG2YBkiU/AImbIhTphFdMaUtMhVj4smN
	vfDtxRWRRx8c7imlQ/WT+3N/hYMsgole+z+rsBKbq2JHqJG7eYcNLFR1o309pfx0wEdCmXYFrfeEB
	Y83m1Z2iGkEn9xDF6/V2nF/HDSE6wvOUKtoCILZSFKOwRBTBEH6CAB1u3muJod2Q9BuZQGY1irwt1
	PFpqilJI8lSEPFUZoMQ0Ne4QndTCYKpTWsfulnUZAC390culyMZX/mXWQ/kh+JI14R+I+jEuXVRO8
	oZy81p5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiOp-00000006dZV-2rkU;
	Tue, 11 Nov 2025 07:02:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiOm-00000006dVd-2VMG;
	Tue, 11 Nov 2025 07:02:42 +0000
X-UUID: 65aa4ecebecc11f0a52f393f94899d25-20251111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=XJEnXUEG6vZWLXTM9F/rXFXxzsyh5CEun4xXmQa9mXM=;
	b=OA0jv1a2Ok3rC+nHEqeT/0rGGhjkY4OWMM2U1Yd0N3juY/katVC86YxQ5AEm886Ea79c1lr6d/L047J42xQ6EIZGbmgTZABRB8obYnx84N4QRgktrvhCFFKBKIV64cRZRNQ4L3OzNM67PWLybwLUZIgaAIjk/rObC7pv/DBl8lQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4521275f-5078-4b76-91fd-00f657d6933b,IP:0,UR
	L:0,TC:0,Content:54,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:54
X-CID-META: VersionHash:a9d874c,CLOUDID:4f96aaba-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	3|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 65aa4ecebecc11f0a52f393f94899d25-20251111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <jh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 594200769; Tue, 11 Nov 2025 00:02:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 11 Nov 2025 15:02:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 11 Nov 2025 15:02:30 +0800
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
	<jh.hsu@mediatek.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 4/9] dt-bindings: timer: Support MediaTek MT8189 timer
Date: Tue, 11 Nov 2025 14:59:18 +0800
Message-ID: <20251111070031.305281-5-jh.hsu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251111070031.305281-1-jh.hsu@mediatek.com>
References: <20251111070031.305281-1-jh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_230240_636479_7F823425 
X-CRM114-Status: UNSURE (   8.57  )
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

add compatible string for mt8189 dts node of timer

Signed-off-by: Jack Hsu <jh.hsu@mediatek.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---
Changs in v7:
 - update dt-bindings commit msg
   (use "mt8189" instead of "mt8189 evb board")
   
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..8e705fe58dc5 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -44,6 +44,7 @@ properties:
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer
               - mediatek,mt8188-timer
+              - mediatek,mt8189-timer
               - mediatek,mt8192-timer
               - mediatek,mt8195-timer
               - mediatek,mt8196-timer
-- 
2.45.2


