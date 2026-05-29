Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB26CD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpBRYje8PFwQWANH98rSqO/HPHv/oZ2k0pnYJxe+62g=; b=3d2psJPiHi7271RG09gPzUMR/z
	PYPQtY1z4Nk0SyiWSMnF2C4yhMZ/s/Mw7tftsabrwPgdL/f2oGgHdbQsnvLqU4Zpbtwh8lG4bIcL7
	jkg9g2bR4kWkW6+a1sMjgw8ahAhtuNpKgfPs66gOEHnuopgouxWcE2PrPIjzQoA0T8Q7/oR6v8FrY
	GbOdKmlXBpgvH49NMSBb+qGqfLW/9NcY4GfjKi+MrAgBbdxUK0nthv61t4ALSSnKmMvC2jnRXr5Xp
	CvWz6mSjC7RTDFd8FZYjvMbdjlD+XCS5tCGWqzhAZ5pEIE2OBFzhxr9qPAd5TUHKwkiB7DAKs9TtM
	QUqsn2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu4V-000000078Dh-3m1L;
	Fri, 29 May 2026 10:04:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSu4U-000000078Ct-1SCB;
	Fri, 29 May 2026 10:04:07 +0000
X-UUID: b82714a05b4511f1acbe4559397dec65-20260529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bpBRYje8PFwQWANH98rSqO/HPHv/oZ2k0pnYJxe+62g=;
	b=mjtGL7NNIhZaFAJi9Al7ghBnD0Qk7hgXknQiT2Z1iycP4qGD+J5oFG+1SnU8pBiPTFNMoG64uAmhyqBdPDstUW1PbPziBD7TtiMIJpGCWQ2VDnTi0u+Oh+zTwf03BKhuHZvOmzmtM0l9gRUNJp3X42F9Tq66hGSqx0ov/QbZfBs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:b51e70ef-193a-41ac-ae0f-5d41feda1d36,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:5291d0f6-ddd5-40e6-821c-e08002aeddf5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b82714a05b4511f1acbe4559397dec65-20260529
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <justin.yeh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1430673133; Fri, 29 May 2026 03:04:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH 2/2] pinctrl: mediatek: mt8189: Add MODULE_LICENSE declaration
Date: Fri, 29 May 2026 18:02:42 +0800
Message-ID: <20260529100308.51271-3-justin.yeh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260529100308.51271-1-justin.yeh@mediatek.com>
References: <20260529100308.51271-1-justin.yeh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_030406_401576_057C8950 
X-CRM114-Status: GOOD (  10.30  )
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

Add missing MODULE_LICENSE("GPL v2") macro to fix modpost error during
kernel module build. The license identifier matches the SPDX header
(GPL-2.0) at the top of the file.

This fixes the following build error:
  ERROR: modpost: missing MODULE_LICENSE() in pinctrl-mt8189.o

Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt8189.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8189.c b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
index cd4cdff309a1..a9c128c514a4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8189.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8189.c
@@ -1696,3 +1696,4 @@ static int __init mt8189_pinctrl_init(void)
 arch_initcall(mt8189_pinctrl_init);
 
 MODULE_DESCRIPTION("MediaTek MT8189 Pinctrl Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


