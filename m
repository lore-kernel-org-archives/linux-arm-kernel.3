Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFA0CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WOTiB39a6DgVGV93rhDR02QXQQuNzwOMoqALStC09kc=; b=TNtcOZSGM37NOApugsbzq4UD/J
	eAYmZQhWcWPAuHsvFo0qOM9k1AHNYLS/JyiYE73pCtaJ/eiNbuqFKWQI+i7YaBKmsSkqoqHy3g1Qd
	zw6QOcO0GpvshMT19/oAeWPTWKP3fJDtQkpKU93v6rEelETlkiQChLZimJl07gcFNscSaPuAkGtjo
	IWr+y4deDsX2NqcnQSTcxRGY+7YBUrTegvckQtlYLkjqZBVynbr66G8eI0MEFc+DaGVSYks4bOHs6
	F2Yu3V5RbsdhTuDiZT05qRKFfAT9qpe4Drjg1Gu5tlxippW6lxJaodc6wRp2yOC6bR6GCsHnWadFl
	xuuSmj+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCLc-0000000H8ZT-21AG;
	Tue, 21 Oct 2025 13:24:20 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCLZ-0000000H8XV-238J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 13:24:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=WOTiB39a6DgVGV93rhDR02QXQQuNzwOMoqALStC09kc=;
	b=o69PsxyMFVNNI0c0rgeWtIY25a/AsGE5e1asHhJbNco9UglotmM60McAv1yCVfut5jSaKhLmX
	umbI6K+Td2MdD7iQPJUPkJ3GRFVCl2iuXdzlesJtS0Kx+EHO9u/KeIdOFW1bwNmuVlDMRJXJbDz
	jupFM2/i1LzVkYMCz9AduSo=
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4crY0C3GQCzKm5G;
	Tue, 21 Oct 2025 21:23:39 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 6BA23140155;
	Tue, 21 Oct 2025 21:24:03 +0800 (CST)
Received: from huawei.com (10.50.163.32) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Oct
 2025 21:24:02 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<maz@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<yuzenghui@huawei.com>
CC: <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<tangnianyao@huawei.com>, <wangwudi@hisilicon.com>, <liuyonglong@huawei.com>,
	<yangjinqian1@huawei.com>
Subject: [PATCH] irqchip/gicv3-its: Clear cache with VINVALL for erratum 162100801
Date: Tue, 21 Oct 2025 21:24:01 +0800
Message-ID: <20251021132401.3570140-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_062418_146380_4684F735 
X-CRM114-Status: GOOD (  13.00  )
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

Use VINVALL to clear cache after VMOVP operation to avoid incomplete
cache cleanup. The previous implementation only cleared cache on one
ITS. This change sends VINVALL to every ITS to properly clear caches.

Fixes: f82e62d470cc ("irqchip/gicv3-its: Add workaround for hip09 ITS erratum 162100801")
Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/Kconfig               |  2 +-
 drivers/irqchip/irq-gic-v3-its.c | 25 +++++++++++--------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6663ffd23f25..d4848a8396a9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1268,7 +1268,7 @@ config HISILICON_ERRATUM_162100801
 	help
 	  When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
 	  during unmapping operation, which will cause some vSGIs lost.
-	  To fix the issue, invalidate related vPE cache through GICR_INVALLR
+	  To fix the issue, invalidate related vPE cache through VINVALL
 	  after VMOVP.
 
 	  If unsure, say Y.
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 467cb78435a9..767ac171e440 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -66,7 +66,6 @@ static u32 lpi_id_bits;
 #define LPI_PENDBASE_SZ		ALIGN(BIT(LPI_NRBITS) / 8, SZ_64K)
 
 static u8 __ro_after_init lpi_prop_prio;
-static struct its_node *find_4_1_its(void);
 
 /*
  * Collection structure - just an ID, and a redistributor address to
@@ -1405,6 +1404,14 @@ static void its_send_vmapp(struct its_node *its,
 	its_send_single_vcommand(its, its_build_vmapp_cmd, &desc);
 }
 
+static void its_send_vinvall(struct its_node *its, struct its_vpe *vpe)
+{
+	struct its_cmd_desc desc;
+
+	desc.its_vinvall_cmd.vpe = vpe;
+	its_send_single_vcommand(its, its_build_vinvall_cmd, &desc);
+}
+
 static void its_send_vmovp(struct its_vpe *vpe)
 {
 	struct its_cmd_desc desc = {};
@@ -1442,17 +1449,12 @@ static void its_send_vmovp(struct its_vpe *vpe)
 
 		desc.its_vmovp_cmd.col = &its->collections[col_id];
 		its_send_single_vcommand(its, its_build_vmovp_cmd, &desc);
+		if (is_v4_1(its) && (its->flags &
+			    ITS_FLAGS_WORKAROUND_HISILICON_162100801))
+			its_send_vinvall(its, vpe);
 	}
 }
 
-static void its_send_vinvall(struct its_node *its, struct its_vpe *vpe)
-{
-	struct its_cmd_desc desc;
-
-	desc.its_vinvall_cmd.vpe = vpe;
-	its_send_single_vcommand(its, its_build_vinvall_cmd, &desc);
-}
-
 static void its_send_vinv(struct its_device *dev, u32 event_id)
 {
 	struct its_cmd_desc desc;
@@ -3910,7 +3912,6 @@ static int its_vpe_set_affinity(struct irq_data *d,
 	struct its_vpe *vpe = irq_data_get_irq_chip_data(d);
 	unsigned int from, cpu = nr_cpu_ids;
 	struct cpumask *table_mask;
-	struct its_node *its;
 	unsigned long flags;
 
 	/*
@@ -3974,10 +3975,6 @@ static int its_vpe_set_affinity(struct irq_data *d,
 
 	its_send_vmovp(vpe);
 
-	its = find_4_1_its();
-	if (its && its->flags & ITS_FLAGS_WORKAROUND_HISILICON_162100801)
-		its_vpe_4_1_invall_locked(cpu, vpe);
-
 	its_vpe_db_proxy_move(vpe, from, cpu);
 
 out:
-- 
2.33.0


