Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F465CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 11:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uktfp7znOQc3fwxeng9TADKlhal6Z80DfPwYH/y/6n8=; b=XmFAI62mXd2kOxyp5ONRfdHPac
	HAephCTKHCxWf/HS5pRLAlpiZb0GAGQOJmd+WKM7UrNq7v9MUQ4EvaJIbixa+4TxQZOtTA3e1jMmO
	M16ENkmt4YDd9yTnOw7a5H2fq8Wt7ambFqBGe8jkmOQ6tG26RnZ1gtbO8axQ3/nVJmGBr7URl9qxe
	x+XozK9w+Ek/LbzxBn5ENJda8gbLutLwIQLjGAgv2Il4eYUc5cyv6IiFQhnMlAgrFFvWPX5JaM2/0
	uIPh3XJB6z60EM0UYJ173mLEevCfaneBWd02kNXDDYpCjes1bwPX5Px9eaBqzVz3U/h2lGuqP9c4w
	uzC7Me9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBzK-00000003ybr-3MKV;
	Wed, 27 May 2026 10:59:50 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSBzI-00000003ybT-1wyZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 10:59:50 +0000
X-UUID: 283aa34c59bb11f1aa26b74ffac11d73-20260527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5c1ddc5f-385d-4c45-a20c-5e105335c24b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-30
X-CID-META: VersionHash:e7bac3a,CLOUDID:36b8ed42d9611f943c4d82481743fdd7,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 283aa34c59bb11f1aa26b74ffac11d73-20260527
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 568183387; Wed, 27 May 2026 18:59:39 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: mach: fix missing NULL checks and memory leaks in DT property setup
Date: Wed, 27 May 2026 18:59:37 +0800
Message-Id: <20260527105937.3570122-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_035948_856747_69E307F2 
X-CRM114-Status: UNSURE (   7.87  )
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

Check kstrdup returns, free p on failure.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/arm/mach-mvebu/coherency.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index 7234d487ff39..aa09a829b1db 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -192,6 +192,10 @@ static void __init armada_375_380_coherency_init(struct device_node *np)
 
 		p = kzalloc_obj(*p);
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


