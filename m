Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4510AF34C47
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 12:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuZN2SYLC2G9lYXG6DFyga2vEQPqp18kfGbM5VhBs+I=; b=14MK6y8JfV57VLEAFrCoCF5YCK
	0PvxY6IfF7zQdZgt87cAhC/QKPkG0soXB4dGFw+Mkmqyrdhri49gCe40WLZAFnaWR6VVLmxFxOSkn
	5fdPEKqgoaaW/d3ykldDC0IitLwsoKKljEzqEGR5paJHbmFZqh9ZLM52i95Gnlii4IXLHg4vASumk
	D0npyhmky7VJnz7qjdEKCe+J1eTHDtWY0JrCTrcj43FD8uoXxdYooMVyXjuW+0tVqd5rEgXaW2jhO
	iYJpYQAhzG2PwJmfe4Ffp3fwDeUzsg070vWGj9Z2aMmah8FNPT2uw/yOgQEkEV+vpRArcPq6Wu7k2
	7eMGVQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGEX-0000000FdED-3rRC;
	Mon, 13 Apr 2026 12:17:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGEU-0000000FdDK-3v3o;
	Mon, 13 Apr 2026 12:17:40 +0000
X-UUID: bf8932be373211f19e7563141e833ce8-20260413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IuZN2SYLC2G9lYXG6DFyga2vEQPqp18kfGbM5VhBs+I=;
	b=ITg7t9LPETcKYYckFczhTnZSFP3ovF9wree38zMsXivWE5hNJYitAav7BB81vKwHwu+xixEU1UviceAXDmyMxPq/SJw7lH40E/MgJy2FR8N87KR2S8rms7YqL0uI8eRJ/SeCUVLE5tA8QuC4DLJthaBQnhGhRPwDOljXixvGqpk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:44d2740f-7cc9-4448-bb96-bd7d500ff03d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:bf32e194-f8ef-4ca8-bea0-143568f9ca1d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf8932be373211f19e7563141e833ce8-20260413
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1545035995; Mon, 13 Apr 2026 05:17:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Apr 2026 20:17:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Apr 2026 20:17:29 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/2] usb: mtu3: add support remote wakeup of mt8196
Date: Mon, 13 Apr 2026 20:17:26 +0800
Message-ID: <20260413121727.4702-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260413121727.4702-1-chunfeng.yun@mediatek.com>
References: <20260413121727.4702-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_051738_985440_A513F110 
X-CRM114-Status: GOOD (  12.59  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4: add reviewed-by
v3: add the ommitted third dual-role controller add acked by Conor
v2: new patch for dual-role controllers
---
 drivers/usb/mtu3/mtu3_host.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 7c657ea2dabd..8138b3f3096a 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -46,6 +46,14 @@
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
@@ -59,6 +67,9 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V1_3,		/* mt8195 IP0 */
 	SSUSB_UWK_V1_5 = 105,	/* mt8195 IP2 */
 	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
+	SSUSB_UWK_V1_7, 	/* mt8196 IP0 */
+	SSUSB_UWK_V1_8, 	/* mt8196 IP1 */
+	SSUSB_UWK_V1_9, 	/* mt8196 IP2 */
 };
 
 /*
@@ -100,6 +111,21 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
 		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
 		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
 		break;
+	case SSUSB_UWK_V1_7:
+		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8196;
+		msk = WC0_IS_EN_P0_96;
+		val = enable ? msk : 0;
+		break;
+	case SSUSB_UWK_V1_8:
+		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8196;
+		msk = WC0_IS_EN_P1_96;
+		val = enable ? msk : 0;
+		break;
+	case SSUSB_UWK_V1_9:
+		reg = ssusb->uwk_reg_base + PERI_WK_CTRL1_8196;
+		msk = WC1_IS_EN_P2_96;
+		val = enable ? msk : 0;
+		break;
 	case SSUSB_UWK_V2:
 		reg = ssusb->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
-- 
2.45.2


