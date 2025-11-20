Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A84CF884C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rsteaxwmn11dQnr7Va5x92id71POVjFtFsjVHcNIMtc=; b=YJPIUBPMY6K6UlWHqIn397EzYm
	ZXqQ8DlVe//JrJ9JbQcYBQGzn1srIhNwoCTCaStDvFJvGk3joK2igUIBZi/4gmA7KnjJabR4MxNde
	VpIO9IbSbWoUGeTL2201rpuTI1MNSYqaL/IzDrJcfJO85k382TLP6IEDAYUop6i49jDXqNjU1XXPW
	6ljBQcnpY/HtCo1uQkv3xVJDg0RoQqgYw7PBhBeRarXDU9IIof2Fl4Tvfk/pV/nbwIGrd7WC5J7hO
	NeDOdGtaxbwg8PghZm0OrlbQSaPRyhx4Nx+YpY53fRUZIBMp+nYGbJJp7tuhvM7ZwTG3X1DyMwMiH
	XAGwX8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3cF-00000006eR8-1gEd;
	Thu, 20 Nov 2025 12:18:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM3cB-00000006eNJ-08vq;
	Thu, 20 Nov 2025 12:18:20 +0000
X-UUID: fd67acb2c60a11f0a52f393f94899d25-20251120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rsteaxwmn11dQnr7Va5x92id71POVjFtFsjVHcNIMtc=;
	b=f/2vGwdtPnxHL/y0tet5KwSBSErPEYL6ymkTfszH4iCt93R55YLaT8pHGIuteeJZpxz6sjerwop0NhxBxUt4ecehcov6BQ/qUBZkyMK4b8c2t0bYh7HPRO2iVBB6ny7Jz/VQ0vvrGDkD8HGz/GOC3vv0KIvXNGxJANgecVt/BWQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:2ee3c67d-5605-46bc-8e75-b5dd12a09e83,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:615d1d58-17e4-43d2-bf73-55337eed999a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd67acb2c60a11f0a52f393f94899d25-20251120
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 799945580; Thu, 20 Nov 2025 05:18:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 20 Nov 2025 20:18:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 20 Nov 2025 20:18:11 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Eddie Huang
	<eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, "Shunxi
 Zhang" <ot_shunxi.zhang@mediatek.com>, <Vince-WL.Liu@mediatek.com>,
	<sirius.wang@mediatek.com>, <Jh.Hsu@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 2/5] mfd: mt6397: Add bit definitions and struct members to support alarm status
Date: Thu, 20 Nov 2025 20:17:58 +0800
Message-ID: <20251120121805.6775-3-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_041819_074657_8A6C8BCF 
X-CRM114-Status: GOOD (  12.68  )
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

This patch adds new bit definitions for the RTC_BBPU register and one
members in the mt6397_rtc_data structure in the mt6397 RTC header file
to support alarm status functionality in the MT6397 RTC driver.

Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
---
 include/linux/mfd/mt6397/rtc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 6d0bb1ea151b..fb320719f676 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -15,6 +15,8 @@
 #include <linux/rtc.h>
 
 #define RTC_BBPU               0x0000
+#define RTC_BBPU_PWREN         BIT(0)
+#define RTC_BBPU_RESET_AL      BIT(3)
 #define RTC_BBPU_CBUSY         BIT(6)
 #define RTC_BBPU_KEY           (0x43 << 8)
 
@@ -76,6 +78,7 @@ struct mt6397_rtc {
 	int                     irq;
 	u32                     addr_base;
 	const struct mtk_rtc_data *data;
+	bool                    alarm_sta_supported;
 };
 
 #endif /* _LINUX_MFD_MT6397_RTC_H_ */
-- 
2.45.2


