Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8EFCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 07:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CARmva9EM2/RMKOsxbDAEvge892qd5JXDQ4LT1FhjCs=; b=4csk8b515YPhDvO42FNZD2HbWr
	XaZ+PPCXM5FIW5gd6NzT1aSP0/V+Rur8OTBxcVVBTZ990Usda0y2HyTPhl32FmiY5OOGHkDfM5CyO
	rmS5jvv0+/SYoAmJkgDQXP3Zs8N38H+7+8vm5Ck7tej5b7mCNqObFphH5CylGYEiaCwIXEd80kDGx
	zEbW9T4mFEi0x8mKRvmD64A2rlx9B4bHVbs9aCJ3cYBsX36OKmCTAUZznwbJl1Pdkp6fAORejrD4D
	4v8a2Xdvph/RAae76GzFL4ttUIz0vrBG5RT9BE3J3PNMUrjU9FL7j97ZW7vzxG/B6s6eoT6U10IVx
	x0nqVXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBE2-0000000BIo0-2SgB;
	Tue, 04 Nov 2025 07:13:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBDy-0000000BImn-3zXI;
	Tue, 04 Nov 2025 07:13:04 +0000
X-UUID: b0828c74b94d11f0a52f393f94899d25-20251104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CARmva9EM2/RMKOsxbDAEvge892qd5JXDQ4LT1FhjCs=;
	b=axxMKNQu3l7Ce6g/0ZArfQRghUWnKn2fZ0VLtlseDczxqkxKTIOPcUSqHnUpgh1NjtmG1zoSZCLnRUwNRqyFWMjgzqFUUaIipawJ6VhW7HNnDtvsze9YICgc7BfuuyBcLCv6QYRBYGQPxozVew7yplFBcJ6G56ZG0RAR6Tc5AUU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:635ff762-3725-49cb-8f18-400d393c8b1d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:7508e37c-f9d7-466d-a1f7-15b5fcad2ce6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:-7|-6|
	0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b0828c74b94d11f0a52f393f94899d25-20251104
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <niklaus.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1935166498; Tue, 04 Nov 2025 00:12:57 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 4 Nov 2025 15:12:54 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 4 Nov 2025 15:12:54 +0800
From: niklaus.liu <Niklaus.Liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<sirius.wang@mediatek.com>, <vince-wl.liu@mediatek.com>,
	<jh.hsu@mediatek.com>, <zhigang.qin@mediatek.com>, <sen.chu@mediatek.com>,
	Niklaus Liu <niklaus.liu@mediatek.com>, niklaus.liu
	<Niklaus.Liu@mediatek.com>
Subject: 
Date: Tue, 4 Nov 2025 15:12:40 +0800
Message-ID: <20251104071252.12539-1-Niklaus.Liu@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_231302_996931_1661E1B0 
X-CRM114-Status: GOOD (  11.78  )
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

This series is based on linux-next, tag: next-20251103
V1 patch link:https://lore.kernel.org/linux-mediatek/20251103134241.3773-2-Niklaus.Liu@mediatek.com/

Subject: [V3 PATCH 0/1] soc: mediatek: mtk-regulator-coupler: Add support for MT8189

changes in V3:
 - modify for comment[add the new entry by alphabetical order] 

changes in V2:
 - change title for patch
 - reply comment: This is a software regulator coupler mechanism, and the regulator-coupled-with
configuration has been added in the MT8189 device tree. This patchaddresses an issue reported by a 
Chromebook customer. When the GPU regulator is turned on, mediatek_regulator_balance_voltage already
sets both the GPU and GPU_SRAM voltages at the same time, so there is no need to adjust the GPU_SRAM 
voltage again in a second round. Therefore, a return is set for MT8189.
If the user calls mediatek_regulator_balance_voltage again for GPU_SRAM, it may cause abnormal behavior of GPU_SRAM. 


changes in V1:
 - mediatek-regulator-coupler mechanism for platform MT8189 

Niklaus Liu (1):
  soc: mediatek regulator: Add Support for mt8189

 drivers/soc/mediatek/mtk-regulator-coupler.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

-- 
2.46.0


