Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A7CCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3b4QpxKv8+vWsDL0rut7sCN8A8Kqyh5C4hRbqegMNOs=; b=YcaXhGD1PTtbszTjGjQT8c90zx
	mG5GG3+VxEHb49JPGKzW0Sa5PcfURuDZ87Or4AWoLb5HmqZpcQcH7OktTLbT+PZsYFJnnC00zKZsP
	GgvHE2naKtVrn5bdlQBnXJJ7v2xTl04eTS5Fjen4U6W2d+eYSgAv6sH1Kz0CdijZFi9xwQoGkGNUr
	S5bMzzsoO38yQwCgwWAXQ8X+/8LJQYNPWhEuzs4Vm4WihTnw7tLCaascWdzO4EfS064F5Gd6eHxZu
	efkGkuOnmJ8Jfn78WJVb6f2LpJaJr1Llq/3kfPSzNpx7As7xCCVH0C+hOPpfkeI4h9rNbW7dEnBhc
	7fS3XDUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFXz-000000007lM-3ebs;
	Thu, 18 Sep 2025 14:23:43 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFXx-000000007iu-0Dsg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:23:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4cSHnC0d66zdcjB;
	Thu, 18 Sep 2025 22:18:55 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 40808180B57;
	Thu, 18 Sep 2025 22:23:31 +0800 (CST)
Received: from kwepemq500001.china.huawei.com (7.202.195.224) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 22:23:31 +0800
Received: from ceph1.huawei.com (10.67.144.45) by
 kwepemq500001.china.huawei.com (7.202.195.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 18 Sep 2025 22:23:30 +0800
From: Nianyao Tang <tangnianyao@huawei.com>
To: <maz@kernel.org>, <tglx@linutronix.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <guoyang2@huawei.com>, <wangwudi@hisilicon.com>, <tangnianyao@huawei.com>,
	<wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<guozicheng3@hisilicon.com>
Subject: [PATCH V2] irqchip/gic-v4.1:Check whether indirect table is supported in allocate_vpe_l1_table
Date: Thu, 18 Sep 2025 22:15:57 +0800
Message-ID: <20250918141557.1791041-1-tangnianyao@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.144.45]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq500001.china.huawei.com (7.202.195.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_072341_244184_CEE69E9A 
X-CRM114-Status: GOOD (  13.15  )
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

In allocate_vpe_l1_table, it allocates a new vpe table without checking
whether indirect table is supported.
ARM allows vendors to support only flat tables. Let's first check if
indirect tables are supported before using it.

Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 467cb78435a9..a4d719720e61 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2903,6 +2903,7 @@ static int allocate_vpe_l1_table(void)
 	unsigned int psz = SZ_64K;
 	unsigned int np, epp, esz;
 	struct page *page;
+	bool indirect;
 
 	if (!gic_rdists->has_rvpeid)
 		return 0;
@@ -2937,10 +2938,12 @@ static int allocate_vpe_l1_table(void)
 
 	/* First probe the page size */
 	val = FIELD_PREP(GICR_VPROPBASER_4_1_PAGE_SIZE, GIC_PAGE_SIZE_64K);
+	val |= GICR_VPROPBASER_4_1_INDIRECT;
 	gicr_write_vpropbaser(val, vlpi_base + GICR_VPROPBASER);
 	val = gicr_read_vpropbaser(vlpi_base + GICR_VPROPBASER);
 	gpsz = FIELD_GET(GICR_VPROPBASER_4_1_PAGE_SIZE, val);
 	esz = FIELD_GET(GICR_VPROPBASER_4_1_ENTRY_SIZE, val);
+	indirect = !!(val & GICR_VPROPBASER_4_1_INDIRECT);
 
 	switch (gpsz) {
 	default:
@@ -2973,7 +2976,7 @@ static int allocate_vpe_l1_table(void)
 	 * If we need more than just a single L1 page, flag the table
 	 * as indirect and compute the number of required L1 pages.
 	 */
-	if (epp < ITS_MAX_VPEID) {
+	if (epp < ITS_MAX_VPEID && indirect) {
 		int nl2;
 
 		val |= GICR_VPROPBASER_4_1_INDIRECT;
@@ -2984,7 +2987,8 @@ static int allocate_vpe_l1_table(void)
 		/* Number of L1 pages to point to the L2 pages */
 		npg = DIV_ROUND_UP(nl2 * SZ_8, psz);
 	} else {
-		npg = 1;
+		npg = DIV_ROUND_UP(ITS_MAX_VPEID, epp);
+		npg = clamp_val(npg, 1, (GICR_VPROPBASER_4_1_SIZE + 1));
 	}
 
 	val |= FIELD_PREP(GICR_VPROPBASER_4_1_SIZE, npg - 1);
-- 
2.33.0


