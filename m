Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF18C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoSjlnae3EsMZE+evVJvGM8Or86X6uguw0HnaW+owzc=; b=qRisJO6EoPjkoyScVkCqtqO6Hf
	yJ2woFNNqQd0n4Sp/qlyiTciT0K0C72ZU7utsqfYRa08WddDQGDfmy2re/hJcyfZu/CBVQfKYV2f4
	QsyJX6UCZGqsOo6R15y4gfJixTVS577nicGhoxxxM5gW1iLQ+gjIp53W+zw9xzJvZnIZQZyxkVjIF
	Wfsil64X/TEZr0AIkVobG9KB8Wlm5k5q5xgbxhhINBmMCT6na9hwvKeLIsqXQcrgkW9voRv0JqNim
	3B0pajlnyF7GDlXT3xcmRzswVGC2InuNR/c0jIOvez49f54wJ+syGOpFOg9+7OgDMXU7SbG4bbM+4
	4G8VNcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1dT-0000000Cvq2-0OYf;
	Fri, 25 Sep 2026 08:50:27 +0000
Received: from out-197.mta0.migadu.com ([2001:41d0:1004:224b::c5] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA1dK-0000000CvmC-0GzZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 08:50:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Gcr8hLNdqy1k42dqWVISdXk8rlCA5k+esFk5lI0c9bw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790326215; v=1; x=1790931015;
 b=n1jVc1AllJclD6n10nSho/Q+NJ53Pv/NAHXOobRmOT9W6oUjbC6RXltEDIJDHraUCjCvIr3y
 49H+xwqKbemcuaFWmIXiQliaf2ZoODBIzP15uS6Wra8K2aWklVbiD1QIrzm4jf4dv+Hripn2VPn
 jFTKJ4hiRoDU3pbiuhN4mc+I=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ff18a72ce455d391;
	Fri, 25 Sep 2026 08:50:14 +0000
X-Mizu-Trace-ID: ff18a72ce455d391
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] irqchip/gic-v3-its: Don't free the tables of an enabled ITS
Date: Fri, 25 Sep 2026 09:49:59 +0100
Message-Id: <20260925085000.753400-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260925085000.753400-1-fuad.tabba@linux.dev>
References: <20260925085000.753400-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_015018_238104_5B979A99 
X-CRM114-Status: GOOD (  11.69  )
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

its_probe_one() enables the ITS before its_init_domain(), the last step
that can fail, and the unwind from there frees the tables and the
command queue without disabling it. The kernel comes up with an enabled
ITS pointing at freed pages.

Enable the ITS last. Nothing reaches the new domain before then: this
runs from init_IRQ(), and the ITS joins its_nodes only after the enable.

Fixes: 4c21f3c26ecc2 ("irqchip: GICv3: ITS: DT probing and initialization")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 drivers/irqchip/irq-gic-v3-its.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 58e52095e6ea8..a5690721f0feb 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5332,16 +5332,18 @@ static int __init its_probe_one(struct its_node *its)
 	}
 
 	gits_write_cwriter(0, its->base + GITS_CWRITER);
+
+	err = its_init_domain(its);
+	if (err)
+		goto out_free_collection;
+
+	/* Enable last: the unwind frees memory an enabled ITS may access */
 	ctlr = readl_relaxed(its->base + GITS_CTLR);
 	ctlr |= GITS_CTLR_ENABLE;
 	if (is_v4(its))
 		ctlr |= GITS_CTLR_ImDe;
 	writel_relaxed(ctlr, its->base + GITS_CTLR);
 
-	err = its_init_domain(its);
-	if (err)
-		goto out_free_collection;
-
 	raw_spin_lock(&its_lock);
 	list_add(&its->entry, &its_nodes);
 	raw_spin_unlock(&its_lock);
-- 
2.39.5


