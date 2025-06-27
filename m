Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B38C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=flv9F+vbWlUEP0g6n2CeOJYKmBHG5x2fJ3VddYBRjUw=; b=HoJNGFEjvpM3cCPz7o6W9zNobe
	5dtwpBEAzrcnTQqkAuLiNtQeoqsVdp/VUSOLnyxYBEEBQPpXCS7PYOvuo4p3ZtiveGn+uZx5RQ/9k
	EK+s95vBqeT/3mzVj1XvPlRoOgq/fDEBGASEWidBlMD8SjE27lPqJ9zfuF8BT+wjMJwkEKziIIfnd
	VOhbf4nYkKmNzgqioXApeAMidw6PxTV8g4YnIo2caMod9aeFFwQHbdnDu0vWrc2njpMBPWRUliMfx
	X2W9eyRHUQzaYJho2xZ1Z+DrS+x5+Zu6OgKe5fNGxms/YaXqlhjctl6ZCjjGr3G3O5PZZfXEF+4JG
	t2MUSuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5kM-0000000EAdS-2eLI;
	Fri, 27 Jun 2025 09:51:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV5dX-0000000E9S0-2l2Z;
	Fri, 27 Jun 2025 09:44:48 +0000
X-UUID: 58d6a604533b11f09f706fa2197c6ceb-20250627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=flv9F+vbWlUEP0g6n2CeOJYKmBHG5x2fJ3VddYBRjUw=;
	b=pydXQx/3azrSwPMA9XAY3IQSCd2ln8X5QqwNAoj7WCipsZF/5N3N04+iM4ALbvYjxOTmvY2FGXttUWk8TGkMYEbBB4Njw+YIeblSyH2crOsTmuZlOu0vYXMofl6LlBveugOw2Gi/TxibqnRoIpQ4oLRDxZmUbDBEHZrnII9MJ5Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:aef5b316-6b75-4438-aa58-dbf77490b909,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:534ea273-15a7-4ae6-ad4b-94c27b45c266,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 58d6a604533b11f09f706fa2197c6ceb-20250627
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <ot_zexin.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 171709590; Fri, 27 Jun 2025 02:44:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 27 Jun 2025 17:44:36 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 27 Jun 2025 17:44:35 +0800
From: Zexin Wang <ot_zexin.wang@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Zexin Wang <ot_zexin.wang@mediatek.com>
Subject: [PATCH 2/2] dt-bindings: watchdog: mediatek: Add support for MT8189
Date: Fri, 27 Jun 2025 17:44:20 +0800
Message-ID: <20250627094431.11772-3-ot_zexin.wang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
References: <20250627094431.11772-1-ot_zexin.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_024447_703113_FCEFAA77 
X-CRM114-Status: UNSURE (   9.09  )
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

Add compatible string for watchdog on MT8189 SoC.

Signed-off-by: Zexin Wang <ot_zexin.wang@mediatek.com>
---
 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index 8d2520241e37..ad69bd28ac9e 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -29,6 +29,7 @@ properties:
           - mediatek,mt8183-wdt
           - mediatek,mt8186-wdt
           - mediatek,mt8188-wdt
+          - mediatek,mt8189-wdt
           - mediatek,mt8192-wdt
           - mediatek,mt8195-wdt
       - items:
-- 
2.45.2


