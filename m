Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB02EFCD0C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0J4NfQvHpzYkKzyi0vXHu9BLrXDvO7r/nJ0o8bqWeZE=; b=MXQcWR/RXb9zOKRg66c+3shAVR
	UThJjXZyMBZdrYqFAvQGYeEeAs+WVm18PTBpP+CxxIL/uut6L1NuAV8fNwLdyP2NDxGV8GP5WmtSB
	8xnBBzC+3FcV2mN1IA137eKmIUJDodFmyx1mA6jhwrvr+IAix8fNyO7lABLb13WjYfbNCuoRJ0qN5
	3JGawP3VRp778FhprlWajC4y5dclXpfIoUryhApJjSZL+eNbdtl9A0Iar0toQ78+d9D2JG+DfADXH
	drz4M+GJxYWJFNklNJ8CxVhv+aXL+23t/lMHcLjGtnubIl9C28MR+sus9VIhNziyRzNPMfT1gKSdV
	8xUg4kZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2liv-00000007xZv-49tU;
	Wed, 18 Mar 2026 07:53:49 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2lir-00000007xYH-1PFU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 07:53:47 +0000
X-UUID: 8f4a428e229f11f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:aef8549d-e582-4cad-8ce5-95983ea814d1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:315cd026318ef31811496fbe943e4f31,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8f4a428e229f11f1a21c59e7364eecb8-20260318
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 281637562; Wed, 18 Mar 2026 15:53:32 +0800
From: Li Jun <lijun01@kylinos.cn>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH] arm: mvebu: fix null pointer when access
Date: Wed, 18 Mar 2026 15:53:24 +0800
Message-Id: <20260318075324.2477118-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_005345_686880_F04C3F3C 
X-CRM114-Status: UNSURE (   7.50  )
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

the kzalloc may return null pointer, will cause kernel panic.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/arm/mach-mvebu/coherency.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index a6b621ff0b87..beba8ed9fa15 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -191,6 +191,8 @@ static void __init armada_375_380_coherency_init(struct device_node *np)
 		struct property *p;
 
 		p = kzalloc(sizeof(*p), GFP_KERNEL);
+		if (!p)
+			return;
 		p->name = kstrdup("arm,io-coherent", GFP_KERNEL);
 		of_add_property(cache_dn, p);
 	}
-- 
2.25.1


