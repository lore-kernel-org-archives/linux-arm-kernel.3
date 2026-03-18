Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BF8FCD0D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tvu7SzlLp7tX2tjydABiLqyEQwlaZp2mMLV/+QdApm8=; b=jZu9qzygNCcFzCQDsgFDhc/Dk4
	GqbCz1Dkb/8+emtqBFrK2l3/g8PArBTF3hSbETsbXMRr1qFk9AMP14nSpqKBTojg0I1tN9P8sLx7H
	F6je/02UYNRjAYC/tTrk8vnk2c1IyPZWXEmD1E+UwCbesLJ7zEvnYTxCdtH3IbBB+iY9PQuSsDYxZ
	zjseBb2/t8gDt1g8HG0TelHwqBGU0eoDPnla1RHx2MzxzyqYJE+FGyopCCRRBpjTQ2IyNPBSE1USE
	n/nnmMxbO2dO/81i7EjwBWUAcBvuAQiqcb2RJl1OJZTYuXmM5KjDCpxPoIeQXWZYS/WKb6h1PQBVt
	g055kFyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mAI-000000082Zn-0HmP;
	Wed, 18 Mar 2026 08:22:06 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2mAF-000000082Z2-2zyu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:22:05 +0000
X-UUID: 87e9b0a222a311f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:517c93f7-a0b9-47f8-93e6-f1014873366f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:4088885d7b2ceb3a44a7619703b93cfa,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 87e9b0a222a311f1a21c59e7364eecb8-20260318
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1654943835; Wed, 18 Mar 2026 16:21:58 +0800
From: Li Jun <lijun01@kylinos.cn>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH v2] arm: mvebu: fix null pointer when access
Date: Wed, 18 Mar 2026 16:21:43 +0800
Message-Id: <20260318082143.2560586-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_012204_066550_74AA4136 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

the kzalloc&kstrdup may return null pointer, will cause kernel panic.

-Fix null pointer.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/arm/mach-mvebu/coherency.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index a6b621ff0b87..f9411e16ddbb 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -191,7 +191,13 @@ static void __init armada_375_380_coherency_init(struct device_node *np)
 		struct property *p;
 
 		p = kzalloc(sizeof(*p), GFP_KERNEL);
+		if (!p)
+			return;
 		p->name = kstrdup("arm,io-coherent", GFP_KERNEL);
+		if (!p->name) {
+			kfree(p);
+			return;
+		}
 		of_add_property(cache_dn, p);
 	}
 }
-- 
2.25.1


