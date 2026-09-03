Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1B8C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5bdj0y4oYEpnDfkR0m8WrsA+XN8zsx7vUaIED3jkAwo=; b=EVoFODyjEZ8AVqsBwm01JQbzrS
	p/YRGoWze4xva36iMQbGRt+nsn92vvldLwRPcn6ngA48lFi6NMy69B1dKvPM8aJXlg7vlp8kRl2Ad
	LRLwPejJ584xqnWzXC4YZ8l0H/GIXV1e6sq/bt6tkKCtSA2dnapOzHr433jLbE6282K1dGvrSjWf7
	QbxfO+WZRp8xWKdy0m4hmVyaSJZ9hL8l9cXN68ssgqyIwd6kZLNZ6dvwkYU5+4P5N0DrfxD4qguB4
	gXK8kv1pD62W5VM+0aV7sl2fgl080Fq5Xw/3cNQ552AsfCz6SPKldfmLxQVjVT6AFVZb+7CGYysxb
	V+uzTDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24ro-0000000H6uy-3gBS;
	Thu, 03 Sep 2026 10:40:24 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24rm-0000000H6u0-2lFI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:40:24 +0000
X-UUID: dafe0ce2a78311f19a56ed5b684f684d-20260903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d4e2fd6f-218a-48b2-b292-b22acc3eb1ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:e751f361d4ea0866ec4817b170e931cf,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50|99,EDM:5,IP
	:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dafe0ce2a78311f19a56ed5b684f684d-20260903
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 2124869959; Thu, 03 Sep 2026 18:40:18 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: maz@kernel.org,
	lpieralisi@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH v2] irqchip/gic-v5: Install root IRQ handler last in gicv5_init_common()
Date: Thu,  3 Sep 2026 18:40:14 +0800
Message-Id: <20260903104014.587068-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_034022_994585_F67DE971 
X-CRM114-Status: GOOD (  10.71  )
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

set_handle_irq() cannot be undone: once a handler is installed, any
further call returns -EBUSY, so the set_handle_irq(NULL) in the error
path has never worked.  Drop it, and install the root handler only
after gicv5_irs_enable() has succeeded.

set_handle_irq() only fails if another root handler is already
installed, which cannot happen on a GICv5 system.  Should it ever
fail, the system is unusable: panic instead of unwinding.

Link: https://lore.kernel.org/r/87fqzrmywu.wl-maz@kernel.org
Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/irqchip/irq-gic-v5.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index ac2d423b1723..c365f8150300 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -1166,21 +1166,18 @@ static int __init gicv5_init_common(struct fwnode_handle *parent_domain)
 	if (ret)
 		goto out_int;
 
-	ret = set_handle_irq(gicv5_handle_irq);
+	ret = gicv5_irs_enable();
 	if (ret)
 		goto out_int;
 
-	ret = gicv5_irs_enable();
-	if (ret)
-		goto out_handle;
+	if (set_handle_irq(gicv5_handle_irq))
+		panic("GICv5: unable to install root IRQ handler\n");
 
 	gicv5_smp_init();
 
 	gicv5_irs_its_probe();
 	return 0;
 
-out_handle:
-	set_handle_irq(NULL);
 out_int:
 	gicv5_cpu_disable_interrupts();
 	gicv5_free_domains();
-- 
2.25.1


