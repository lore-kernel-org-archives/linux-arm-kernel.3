Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D857CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 01:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaJcy8uB9TWSMU7ubh3cDSFa67pgvyglewAF7Cx7fxY=; b=zsRT40TpFVc8mraAVxhWRVExEm
	d3yGDOaYwqgvjuxFnrFGowrPv8+1wCZtWmtnBBdu8i/KG46olxrKd96XzYB+wR6LpqiIy3hTSIT4j
	4T/ADXj9o0kt4+LiyHdwqRa/ZParAMsjwaOJBLVcJcrswo+Xzlv5/bzf2X3CJoyAzann2j9bPI9X2
	FJ/MZRCDdIy7+bVU7dghu73vBvKm+TtHy2NwIrRHZYFu11cG0cmB//bmdX+ukIIABrPlfY54vyBlw
	UDEYZxMkZvB43wUsiHFUBX3/zFlkkyqj878VWeAUXHL2Ln+eeSgggXhftW8NCd1oCEG5jCILumLv7
	6UyC0VVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1Ll-00000000TVW-22Pe;
	Thu, 18 Jun 2026 01:15:21 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa1Ld-00000000TSK-2S9H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 01:15:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4ggjRw0m4lzKHMZK
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:14:20 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 52DF140593
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 09:15:09 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP3 (Coremail) with SMTP id _Ch0CgC3XQmXRjNq00isCA--.10914S4;
	Thu, 18 Jun 2026 09:15:09 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: maz@kernel.org,
	tglx@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shikemeng@huaweicloud.com
Subject: [PATCH v2 2/4] irqchip/gic-v3-its: Fix its node leak in gic_acpi_parse_madt_its()
Date: Thu, 18 Jun 2026 09:14:57 +0800
Message-Id: <20260618011459.58347-3-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260618011459.58347-1-shikemeng@huaweicloud.com>
References: <20260618011459.58347-1-shikemeng@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgC3XQmXRjNq00isCA--.10914S4
X-Coremail-Antispam: 1UD129KBjvdXoWrZw13ArWUtFWxGFWDuw4UArb_yoWfGFb_CF
	yjqFsrGFWj9r18Gw42yF4rZryqya1v9F1kuF1Fva45Cw18Z347JFsrurZ8AF45G3WvvryS
	yrZYvr1Skr17JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb68FF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUULZ2DUUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_181513_805516_EC608C63 
X-CRM114-Status: GOOD (  10.55  )
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

Fix its node leak when its_probe_one() failed in
gic_acpi_parse_madt_its().

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index d721b6101e0a..3e4edcb64065 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5747,9 +5747,13 @@ static int __init gic_acpi_parse_madt_its(union acpi_subtable_headers *header,
 		its->flags |= ITS_FLAGS_FORCE_NON_SHAREABLE;
 
 	err = its_probe_one(its);
-	if (!err)
-		return 0;
+	if (err)
+		goto probe_err;
+
+	return 0;
 
+probe_err:
+	its_node_destroy(its);
 node_err:
 	iort_deregister_domain_token(its_entry->translation_id);
 dom_err:
-- 
2.33.0


