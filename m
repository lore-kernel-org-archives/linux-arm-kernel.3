Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F858C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJC2wcDTAclKhIOa1ToaJ+Xh1voHR2PxPljq1LT1sxE=; b=15K7lGrp8ePF0ABFwwNHMLlZQ6
	rvIwCjSia+L22+aIHqgOyf5QaCOQVnDHGe0y94PcaWbOggDLFw8J9o2tKV+o69+uOpDAcyqi//8fH
	gL/0mtXXMz/IZRA9V2jOOxfqRavD9oS/foEjlbFL2rkbZ2F16LbhHLoWjBrE16TiIqwT1iaIrPUPI
	+nPT4lHYoCqMDX3hRDqQPegw/81V4pddIvxFo5ajcGt8j5lFfLdcFOy0/NHnEahEY/m/IpUn9mGfN
	8xgluLOLMQlIP9fIgye4P5fHrcY6vxx2Fwds9oVcxyhOypLGodI0tNcYO7gIJ7Y0HTpyl2b7gZ/pJ
	9ZNKzQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taFfN-000000088fR-19Ws;
	Tue, 21 Jan 2025 14:55:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taFaJ-000000087li-0pUi;
	Tue, 21 Jan 2025 14:50:32 +0000
X-UUID: 0bad81e0d80711ef9048ed6ed365623b-20250121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sJC2wcDTAclKhIOa1ToaJ+Xh1voHR2PxPljq1LT1sxE=;
	b=j51aJDNXHu+ptfs2/iwXuB3ofSQ/j/ynR0eIiiaUg9FZo6y91TrYdtZh8XUJ6po2Yy0D/Go7+IFU7bbF84QLQIcHpEvPSlZFeX5scfeejQJOPBeqvWdAPW73bKi6slsr4RxDw66yRXy1/H2Pj/zGLuvdFnuNWBSHIM3T63UFyb0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:8be80dfe-e4d7-40ce-94d4-8d6db623f0aa,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:0a1c6385-0f10-4f52-bb41-91703793d3e4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 0bad81e0d80711ef9048ed6ed365623b-20250121
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1532049757; Tue, 21 Jan 2025 07:50:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 22:50:21 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 22:50:20 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/4] usb: mtk-xhci: add support remote wakeup of mt8196
Date: Tue, 21 Jan 2025 22:50:07 +0800
Message-ID: <20250121145008.22936-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
References: <20250121145008.22936-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_065031_252914_4181104E 
X-CRM114-Status: GOOD (  13.60  )
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

There are three USB controllers on mt8196, each controller's wakeup
control is different, add some specific versions for them.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: modify marcos name
---
 drivers/usb/host/xhci-mtk.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 904831344440..3f8e37b25322 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -113,6 +113,14 @@
 #define WC1_IS_P_95		BIT(12)
 #define WC1_IS_EN_P0_95		BIT(6)
 
+/* mt8196 */
+#define PERI_WK_CTRL0_8196	0x08
+#define WC0_IS_EN_P0_96		BIT(0)
+#define WC0_IS_EN_P1_96		BIT(7)
+
+#define PERI_WK_CTRL1_8196	0x10
+#define WC1_IS_EN_P2_96		BIT(0)
+
 /* mt2712 etc */
 #define PERI_SSUSB_SPM_CTRL	0x0
 #define SSC_IP_SLEEP_EN	BIT(4)
@@ -129,6 +137,9 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V1_4,		/* mt8195 IP1 */
 	SSUSB_UWK_V1_5,		/* mt8195 IP2 */
 	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
+	SSUSB_UWK_V1_7,		/* mt8196 IP0 */
+	SSUSB_UWK_V1_8,		/* mt8196 IP1 */
+	SSUSB_UWK_V1_9,		/* mt8196 IP2 */
 };
 
 /*
@@ -381,6 +392,21 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
 		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
 		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
 		break;
+	case SSUSB_UWK_V1_7:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
+		msk = WC0_IS_EN_P0_96;
+		val = enable ? msk : 0;
+		break;
+	case SSUSB_UWK_V1_8:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
+		msk = WC0_IS_EN_P1_96;
+		val = enable ? msk : 0;
+		break;
+	case SSUSB_UWK_V1_9:
+		reg = mtk->uwk_reg_base + PERI_WK_CTRL1_8196;
+		msk = WC1_IS_EN_P2_96;
+		val = enable ? msk : 0;
+		break;
 	case SSUSB_UWK_V2:
 		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
-- 
2.46.0


