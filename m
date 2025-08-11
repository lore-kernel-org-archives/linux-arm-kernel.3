Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED21CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7Dr6EHXZb1zZv1XZgN30AHSOXgaHs9rJ38l2ZynADk=; b=P0nuhYcD1SmNMENSA+CwZGfAq+
	sQA/wCOoJSbfls7HF7WHvwBQ6igXc/GofGEEA8o7GTc6Un7/i5Mxt4NvZ5Ap3eL66vw95vNYjzONP
	PnAK5V5PEykXhUyP2UQRrP29YmbExhegAMBtgUxrlRFbvjNIFP4yHomJkNmtSCOT+P+Fm0twbWXLK
	31HEFtcFHwBjL2uIz4jjjMxuAwBXQZeIyko2GC4dmrH99iVXGXt8GNGn6E0JWoyZy+ZOxdBH9YvJy
	WY2eLwZNGTo82mO3WsejCb8U98hvQfy3Dplf4BF2ojKFENhdmiYOuCtQz0BHkXvy6zlBE0tGjfj99
	wZAFpCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOCF-00000006tsN-0akE;
	Mon, 11 Aug 2025 08:47:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNhR-00000006p6r-19L9;
	Mon, 11 Aug 2025 08:16:10 +0000
X-UUID: 6cc2afa0768b11f09f706fa2197c6ceb-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=a7Dr6EHXZb1zZv1XZgN30AHSOXgaHs9rJ38l2ZynADk=;
	b=g1/++lYLKYzRew9XOFMgGCDfBxHOScAqVNTsRfYA7EZ4jmFW99/QcIrVyGBLtJWriK9hwm9XeQCVT51uqcTpU2H+BDxQ/ppmiidBzI6eEgIHX0opVerX+Gy0NPZw3rr6V3Eu7raXBnayMTJ8qZj17rSe6GneHcuaFrMwMrae3Kw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:5f848693-3ef1-46a5-9c6a-beefe501232a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:ce6f47ce-1ac4-40cd-97d9-e8f32bab97d5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6cc2afa0768b11f09f706fa2197c6ceb-20250811
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 695594691; Mon, 11 Aug 2025 01:16:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 16:15:55 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 16:15:55 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>
Subject: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU register
Date: Mon, 11 Aug 2025 16:15:33 +0800
Message-ID: <20250811081543.4377-2-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_011609_317915_A67D55D9 
X-CRM114-Status: GOOD (  10.56  )
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

This patch adds new bit definitions for the RTC_BBPU register in the
mt6397 RTC header file. The following bit definitions are introduced:

Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
---
 include/linux/mfd/mt6397/rtc.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 27883af44f87..001cef6b7302 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -15,8 +15,11 @@
 #include <linux/rtc.h>
 
 #define RTC_BBPU               0x0000
+#define RTC_BBPU_PWREN         BIT(0)
+#define RTC_BBPU_CLR           BIT(1)
+#define RTC_BBPU_RESET_AL      BIT(3)
 #define RTC_BBPU_CBUSY         BIT(6)
-#define RTC_BBPU_KEY            (0x43 << 8)
+#define RTC_BBPU_KEY           (0x43 << 8)
 
 #define RTC_WRTGR_MT6358       0x003a
 #define RTC_WRTGR_MT6397       0x003c
-- 
2.46.0


