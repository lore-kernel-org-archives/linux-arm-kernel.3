Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F16D1268C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 01:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akNpouvmuxWGyea2eYHQtYaML0UvO0Ocaga8OlPp7/Q=; b=Al4xJ3tMttYxa8py55YFAI4LUM
	XIoucoOmO+EFuMJLYkTCWVzXfJhX0ZLG+1coEBjA3wvIwqZYWccUy9dSPrs8RE0hU4lY/6KXPPKhd
	S8an50n7acBkBFFeCIcmAZlmEpawHs9lSzXbuOqxXkZ6VxhSJ2AlpEoSVjxENvUY9fTfR/DuVTTWZ
	xCChHwtMcRz0yIAyRW7FWb995+akSWUO+NCACDQOD5D3j3B2njwnL1+Gz1MeKG+W5U1skw2MKSm1q
	oVooQ7Wnf63a7AvWCCK+QoSt+2Vozicfv3uXwgP70IvDUzElWwHWAUfKgGvUzTOxKWOVQPAYWwDFi
	x2g647sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbmY-000000060Hv-2UoX;
	Wed, 03 Dec 2025 01:35:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbmV-000000060Gx-2dNp;
	Wed, 03 Dec 2025 01:35:48 +0000
X-UUID: 62a44c98cfe811f09f706fa2197c6ceb-20251202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=akNpouvmuxWGyea2eYHQtYaML0UvO0Ocaga8OlPp7/Q=;
	b=omxm5IbsD3qBuDEJY272C3VIlDqZCYCtjDoylcTFxbYv4A6rb1O47QwkkN+AgsALWnvA3F/JuvVnoQh3aUj/9PYYhekTYX0I4oqttzQOdDxDhHqAJxzXd1c0j9vjGqPTa3b+1nvAMwFV1cBWXPEb5r9mKSdT5OKTWghsfJMSYq8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:8911834f-4dc8-4cea-948d-3a370a0c9bd7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:97bbf6a7-1697-4a34-a2ba-2404d254a770,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 62a44c98cfe811f09f706fa2197c6ceb-20251202
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <mingjin.ge@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 340643341; Tue, 02 Dec 2025 18:35:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 3 Dec 2025 09:35:41 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 3 Dec 2025 09:35:41 +0800
From: Mingjin Ge <mingjin.ge@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Mingjin Ge <mingjin.ge@mediatek.com>
Subject: [PATCH 1/1] usb: mtk-xhci: add support remote wakeup of mt8189
Date: Wed, 3 Dec 2025 09:34:50 +0800
Message-ID: <20251203013521.2038888-2-mingjin.ge@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251203013521.2038888-1-mingjin.ge@mediatek.com>
References: <20251203013521.2038888-1-mingjin.ge@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_173547_673380_E698CDB2 
X-CRM114-Status: GOOD (  11.45  )
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

Add remote wakeup configuration for the mt8189 in xhci-mtk driver.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Signed-off-by: Mingjin Ge <mingjin.ge@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 8da05e9dfa28..134a46907db5 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -96,6 +96,10 @@
 #define WC0_IS_P	BIT(12)	/* polarity */
 #define WC0_IS_EN	BIT(6)
 
+/* mt8189*/
+#define PERI_WK_CTRL0_8189	0x0
+#define WC0_IS_EN_P_89		BIT(18)
+
 /* mt8192 */
 #define WC0_SSUSB0_CDEN		BIT(6)
 #define WC0_IS_SPM_EN		BIT(1)
@@ -140,6 +144,7 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V1_7,		/* mt8196 IP0 */
 	SSUSB_UWK_V1_8,		/* mt8196 IP1 */
 	SSUSB_UWK_V1_9,		/* mt8196 IP2 */
+	SSUSB_UWK_V1_10,	/* mt8189 IP all */
 };
 
 /*
@@ -407,6 +412,11 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
 		msk = WC1_IS_EN_P2_96;
 		val = enable ? msk : 0;
 		break;
+	case SSUSB_UWK_V1_10:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8189;
+		msk = WC0_IS_EN_P_89;
+		val = enable ? msk : 0;
+		break;
 	case SSUSB_UWK_V2:
 		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
-- 
2.45.2


