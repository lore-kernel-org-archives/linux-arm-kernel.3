Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A0ECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DTsZ4mSpfFISefij5Gz5ztFju+y7++46NRoakiV2hQ=; b=DdHNbHzIcdbFKhGUj1rSiBklJ8
	DoqHivhIYoWLwxkBrXz5TyaAeff4XXoDd9CQajGA2qazZrmtklsMH7MgDRfAQqIiPiuv2EUXy0+Jq
	iZPUmgoVPTV8sQKw5zi9Phqecl2LvnFTy0x9QUGI/zfBpF9SnMKHiLtWFEYvpoR2tHreXYcwugn87
	lQMnE7IRjIHmTAGYfcZ+ZlAPa0ZoXU7fQT+naw4a5Tndp2F4xOSyQ/l+WsSTi7hMDFk/ZQdSO9DTj
	83Pb+Jwju8vxBK/i2G5+ZKRQy7wW+uPI3RoGh66U4gfRoqnVmH8+JEFjQHrJ9AlxFl/iJGDo2ZaIu
	NyU+oP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu4c-000000078G9-0D4c;
	Fri, 29 May 2026 10:04:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu4V-000000078DH-1Tbx;
	Fri, 29 May 2026 10:04:08 +0000
X-UUID: b810431a5b4511f1acbe4559397dec65-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1DTsZ4mSpfFISefij5Gz5ztFju+y7++46NRoakiV2hQ=;
	b=nx6ypuPLrEcGXzarvabZNUX57YCxL2O86bR3YY68G4B3wy4audHzMAqnw5K6JaUSK2BTvfxlus2G4KZFq4LSyteh4cE2a25oC55jfa+3KAln5gS7x3sm2uJxmjD/YqeohhOb/adnxMAXx6iYv2GTtJdsU6AHicGlYbLT8qGAR9Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:54050f5c-5643-4856-a015-7bbae689a296,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:d9810471-c7f5-426d-bf09-c1b094e924d8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b810431a5b4511f1acbe4559397dec65-20260529
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1802597819; Fri, 29 May 2026 03:04:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 29 May 2026 18:03:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 29 May 2026 18:03:59 +0800
From: Justin Yeh <justin.yeh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Justin Yeh <justin.yeh@mediatek.com>
Subject: [PATCH 1/2] pinctrl: mediatek: Restore PINCTRL_MT8189 to tristate
Date: Fri, 29 May 2026 18:02:41 +0800
Message-ID: <20260529100308.51271-2-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260529100308.51271-1-justin.yeh@mediatek.com>
References: <20260529100308.51271-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_030407_395068_77346D93 
X-CRM114-Status: GOOD (  11.52  )
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

Under the GKI + vendor_dlkm model, vendor-specific pinctrl cannot be
built into the GKI vmlinux. Upstream's recent switch of PINCTRL_MT8189
to bool prevents building as a loadable module, which breaks DDK module
usage. Restore tristate so MT8189 pinctrl can be packaged as a kernel
module in vendor_dlkm.

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 4819617d9368..a75434e7e989 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -270,7 +270,7 @@ config PINCTRL_MT8188
 	  map specific eint which doesn't have real gpio pin.
 
 config PINCTRL_MT8189
-        bool "MediaTek MT8189 pin control"
+        tristate "MediaTek MT8189 pin control"
         depends on OF
         depends on ARM64 || COMPILE_TEST
         default ARM64 && ARCH_MEDIATEK
-- 
2.45.2


