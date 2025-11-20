Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4456CF884D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pHfD7om7BxHWxpb3tLFXRGxsQw3J9kA68rgyLjRz5Q=; b=Ug+BvyNwBElDtQZ6WLmcWsbRKF
	z+3uEfdCuevZRZJ41tHsKS8izZ1ZrS5mwbKLuOWIxi7dw4y0z4d+dUZwg9UjKMH4TBrchhJHl33e8
	fiAZRserXhHRcBAuOKBHLXVzvcZeuR4Qr6tHI4pajgmPmEOUw8QXPmZHXlpvUDszQO2lATluGembF
	RXC8pV6Bm+C5hvFEPWmTsIOlzd6NKJ+Uz/Q59a4rx6FrqKjgYzQvIwtJ4K6jUvuOgraiI7G9+zJ1L
	atgIh23EWQ+WAgp/T2ao+VQCrpC8rhIYVkqOu5DVYtSnfGsAmHLkkTMZw3poyZBhPt8xBqbacPJd6
	Il6ll4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3cG-00000006eRx-05S1;
	Thu, 20 Nov 2025 12:18:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3cB-00000006eNF-3bY2;
	Thu, 20 Nov 2025 12:18:21 +0000
X-UUID: fbffa9d8c60a11f09f706fa2197c6ceb-20251120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2pHfD7om7BxHWxpb3tLFXRGxsQw3J9kA68rgyLjRz5Q=;
	b=nG3/d/IvlUkixoAhpa+7sYW6Vcek5kQROK3/hKdmjcUOPQo2qovPQjfgEFm8KyC4DcUPl2SrnqcuMhg3ojZ5zt4bHCqYMeXZfvmt3TKy9zSUs7qRlwdj4IodM5Kr2HILuF0bBdijuqsfQFz42Wqn6LTbmC+viwPO5zS/smBvIGo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c14e7158-d7e3-415f-85e9-9ccf762ce721,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:de7204bb-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fbffa9d8c60a11f09f706fa2197c6ceb-20251120
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 944672777; Thu, 20 Nov 2025 05:18:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 20 Nov 2025 20:18:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 20 Nov 2025 20:18:09 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eddie Huang
	<eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>, <Vince-WL.Liu@mediatek.com>,
	<sirius.wang@mediatek.com>, <Jh.Hsu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/5] mfd: mt6397: Fix formatting of RTC_BBPU_KEY definition
Date: Thu, 20 Nov 2025 20:17:57 +0800
Message-ID: <20251120121805.6775-2-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_041819_909664_556168DB 
X-CRM114-Status: GOOD (  10.64  )
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

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

Adjust the whitespace alignment for the RTC_BBPU_KEY macro definition
in the mt6397 RTC header file. This is a cosmetic change to improve
code consistency.

Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
---
 include/linux/mfd/mt6397/rtc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 27883af44f87..6d0bb1ea151b 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -16,7 +16,7 @@
 
 #define RTC_BBPU               0x0000
 #define RTC_BBPU_CBUSY         BIT(6)
-#define RTC_BBPU_KEY            (0x43 << 8)
+#define RTC_BBPU_KEY           (0x43 << 8)
 
 #define RTC_WRTGR_MT6358       0x003a
 #define RTC_WRTGR_MT6397       0x003c
-- 
2.45.2


