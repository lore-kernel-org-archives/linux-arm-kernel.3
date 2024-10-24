Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F4ED0BB7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 09:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjrZqmlFFlSzh5vgtq7m7adfVk4oLYk4Vu2ErMdURd0=; b=rWztVt6WXv1l0ib1R39yM7Jc/s
	6FlG1IhuoGyuR4s1J7+tbAPn1kz+dF/sG/uc8BePbBPkA7GvrVQREW8eOS5yHDkehoXPDzxCnEOdC
	fPPGQ4HRKDP92Z8BG51tmebx81JCGWisChzE/pOwIs+/3ylubRttdoGXE8hLUoViH++84QmM5FbD7
	USlc50vRQryV5wcplWODa4t353XfAgWlSmmppxV7wEns6gn9KJcVBUL7dquoNbniUa7TToTWVqzeC
	mwQjIhG1ZbXzqEIhWmcHs2qnwAnSBYqAnA/0a9zWHmtWNHgHY9uadhIg/O+HV9G12etezsyfUWV/c
	i0OxW8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uGG-0000000HUaw-1Bhm;
	Thu, 24 Oct 2024 09:36:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3u7u-0000000HSPI-0itW;
	Thu, 24 Oct 2024 09:27:31 +0000
X-UUID: 2e199f2e91ea11ef82ff63e91e7eb18c-20241024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hjrZqmlFFlSzh5vgtq7m7adfVk4oLYk4Vu2ErMdURd0=;
	b=dCvE/PzjiJToH7hKEXSWbSr0078gb6W+HJDpymUP8cx6z5AHA0KK66nP81EmZK/b+az9Zot1PxDKqz2ZJ3150bnEofNN6829vcywaXTz6aXpyomV/j2naV+XF88lP+OSmWNcOBMLWPu87fFnHOONlf5iHucBpnu6CR1F8xTYNKs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:675d6edf-5b7a-41b6-b453-7b09d42a175b,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:b0fcdc3,CLOUDID:e630cccc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2e199f2e91ea11ef82ff63e91e7eb18c-20241024
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <karl.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 588469713; Thu, 24 Oct 2024 02:27:25 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 24 Oct 2024 02:27:22 -0700
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 24 Oct 2024 17:27:22 +0800
From: Karl.Li <karl.li@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Karl Li <Karl.Li@mediatek.com>,
	Chungying Lu <chungying.lu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Karl Li
	<karl.li@mediatek.com>
Subject: [PATCH 1/1] soc: mediatek: Add command for APU SMC call
Date: Thu, 24 Oct 2024 17:27:05 +0800
Message-ID: <20241024092712.431605-2-karl.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241024092712.431605-1-karl.li@mediatek.com>
References: <20241024092712.431605-1-karl.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_022730_257107_9B36C3C5 
X-CRM114-Status: GOOD (  11.71  )
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

From: Karl Li <karl.li@mediatek.com>

Add command for APU SMC call.
The APU microprocess's start and stop sequence will process in ATF.

Signed-off-by: Karl Li <karl.li@mediatek.com>
---
 include/linux/soc/mediatek/mtk_apu_secure.h | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 include/linux/soc/mediatek/mtk_apu_secure.h

diff --git a/include/linux/soc/mediatek/mtk_apu_secure.h b/include/linux/soc/mediatek/mtk_apu_secure.h
new file mode 100644
index 000000000000..ea491bc24adb
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk_apu_secure.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024 MediaTek Inc.
+ */
+
+#ifndef __MTK_APU_SECURE_H__
+#define __MTK_APU_SECURE_H__
+
+enum mtk_apusys_kernel_op {
+	MTK_APUSYS_KERNEL_OP_APUSYS_PWR_TOP_ON,			/*  0 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_PWR_TOP_OFF,		/*  1 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_REVISER,		/*  2 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_RESET_MP,		/*  3 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_BOOT,		/*  4 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_START_MP,		/*  5 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_STOP_MP,			/*  6 */
+	MTK_APUSYS_KERNEL_OP_DEVAPC_INIT_RCX,			/*  7 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_SEC_MEM,		/*  8 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_DISABLE_WDT_ISR,		/*  9 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_CLEAR_WDT_ISR,		/* 10 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_CG_GATING,		/* 11 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_CG_UNGATING,		/* 12 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_RV_SETUP_APUMMU,		/* 13 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_DUMP,		/* 14 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_WRITE,		/* 15 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_LOGTOP_REG_W1C,		/* 16 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_COLD_BOOT_CLR_MBOX_DUMMY,	/* 17 */
+	MTK_APUSYS_KERNEL_OP_APUSYS_SETUP_CE_BIN,		/* 18 */
+	MTK_APUSYS_KERNEL_OP_NUM,
+};
+
+#endif
-- 
2.18.0


