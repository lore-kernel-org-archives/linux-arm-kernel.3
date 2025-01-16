Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49226C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F1fKyQy/cFaLxw+/Fu4T05W5G/OWq4qpRxkiUE1pqFA=; b=VG0A509tR39K7ajN9VAGDpoFtx
	37ACCQjuZNLIKGs3zUqmiU7vyjQEtW67pGYW7VSbigQlbcR21QgJVarK9NxoEebHSVCJSCc1/X/u8
	Ozzsc9KJ3LMbeTt7CUEPbFdTJzVTujchrDtHZqQmZPnmF9p0rIIzK7bmww7JV7KpgybHRBKQhoUlg
	1Ons/jAp9VFzz//j1iUib5EqSnQ61vxw9ZvxMc0f0FfxKmCH3xc7QmRjX/ESzJN5mrVO6ZoDUsYFV
	OZ5QVeqKJv7dpEKHP/cjEKb+tLZ4c/fjoPw/FLw0gbwiKrACGTluSYt+RUKP1HpIlMPEVT4E1KtaN
	WCJ3QPow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPN4-0000000EvlT-0t57;
	Thu, 16 Jan 2025 12:53:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYPLo-0000000EvUJ-0jNm;
	Thu, 16 Jan 2025 12:51:57 +0000
X-UUID: a7dbdaa6d40811ef82ff63e91e7eb18c-20250116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=F1fKyQy/cFaLxw+/Fu4T05W5G/OWq4qpRxkiUE1pqFA=;
	b=f302/3y+Ij9Pb6eRXr0AMAwikIFjPQfGDHwOaKj9+3wUw/dOgPKbVOraWq7brDmk+739Akeegnzbl/N/EC+s2GWvfQ7WaYuJa6/2woj+R7+ASbaYvekqW2R4m6yAmPNnII6qZocsoZYSzkLSDYXA0qfvSjfVfsJtHR7OxRdC+mE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:d80ed24f-6cc9-4253-be7e-c6567471a56f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:60aa074,CLOUDID:e34d2485-0f10-4f52-bb41-91703793d3e4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a7dbdaa6d40811ef82ff63e91e7eb18c-20250116
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 83488833; Thu, 16 Jan 2025 05:51:51 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 16 Jan 2025 20:51:48 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 16 Jan 2025 20:51:47 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH] usb: host: xhci-plat: add support compatible ID PNP0D15
Date: Thu, 16 Jan 2025 20:51:41 +0800
Message-ID: <20250116125141.25856-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_045156_221755_46406D31 
X-CRM114-Status: GOOD (  10.08  )
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

Add support compatible ID PNP0D15 which declare that the xHCI
controller doesn't support standard debug capability.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index e6c9006bd568..248a34fbeb14 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -566,6 +566,7 @@ EXPORT_SYMBOL_GPL(xhci_plat_pm_ops);
 static const struct acpi_device_id usb_xhci_acpi_match[] = {
 	/* XHCI-compliant USB Controller */
 	{ "PNP0D10", },
+	{ "PNP0D15", },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, usb_xhci_acpi_match);
-- 
2.46.0


