Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A10C54754
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z4s9ebNgSLYHeslq+8/10OLsPhL9fHFB7iQxErbUZqU=; b=DLy++XH7o8eTSuE7dE1l3S0Ijx
	kKo7FVVnGAVm5G71VIBBW5muSg1TMkvPf5P4T6xlx4+G7TW+Z8JuT0wjjjaRstHkKy/h2oYWnG7on
	seqOVLEqrS2N1Xf8Kxwr89bzzkMhV/B5z0ruT3JzfhWViClqCSkhlAE6n57ew/pSnLliqoCMkmxu+
	hWFlFSqUZxQuW7plapK20eKJ+w3P21GZuXLkUn9igsjqVXfDoi6w+F6WwTEfB5zFRCy8FcGVDEkBS
	95lgzgFeHMq5wVSCmLSXyit6AsOPsPR0O/sjyMJV3dTh2HWn5F6sHkvPa+AXx3Be3VCSqo8URV993
	Uo4DocnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSfB-0000000HDti-2mYl;
	Thu, 15 May 2025 07:05:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSUY-0000000HCan-1Hvp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 06:54:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4ZygsQ5DqKztR6Q;
	Thu, 15 May 2025 14:53:30 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 84A2B140276;
	Thu, 15 May 2025 14:54:47 +0800 (CST)
Received: from kwepemq500001.china.huawei.com (7.202.195.224) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 15 May 2025 14:54:47 +0800
Received: from 228-1616.huawei.com (10.67.246.68) by
 kwepemq500001.china.huawei.com (7.202.195.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 15 May 2025 14:54:46 +0800
From: Nianyao Tang <tangnianyao@huawei.com>
To: <maz@kernel.org>, <tglx@linutronix.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <guoyang2@huawei.com>, <wangwudi@hisilicon.com>, <tangnianyao@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v3] irqchip/gic-v4.1: Use local 4_1 ITS to generate VSGI
Date: Thu, 15 May 2025 14:53:59 +0000
Message-ID: <20250515145359.2795959-1-tangnianyao@huawei.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.246.68]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemq500001.china.huawei.com (7.202.195.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_235454_648336_98C2FAC8 
X-CRM114-Status: GOOD (  12.78  )
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

On multi-node GICv4.1 system, VSGI senders always use one certain 4_1 ITS,
because find_4_1_its return the first its_node in list, regardless of
which node the VSGI sender is on. This brings guest vsgi performance drop
when VM is not running on the same node as this returned ITS.

On a 2-socket environment, each with one ITS and 32 cpu, GICv4.1 enabled,
4U8G guest, 4 vcpu is running on same socket.
When VM on socket0, kvm-unit-tests ipi_hw result is 850ns.
When VM on socket1, it is 750ns. The reason is VSGI sender always
use the last reported ITS(that on socket1) to inject VSGI. The access
from cpu to other-socket ITS will cost 100ns more compared to cpu to
local ITS.

By using a local ITS, we can get 12% reduction in IPI latency.

Modify find_4_1_its to first return per-cpu local_4_1_its, which is
init when inherit the VPE table from the ITS or from another CPU.
If fail to find local 4_1 ITS, return any 4_1 ITS like before.

Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
Suggested-by: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v3-its.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 0115ad6c8259..1b1d32f746b4 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -125,6 +125,8 @@ struct its_node {
 	int			vlpi_redist_offset;
 };
 
+static DEFINE_PER_CPU(struct its_node *, local_4_1_its);
+
 #define is_v4(its)		(!!((its)->typer & GITS_TYPER_VLPIS))
 #define is_v4_1(its)		(!!((its)->typer & GITS_TYPER_VMAPP))
 #define device_ids(its)		(FIELD_GET(GITS_TYPER_DEVBITS, (its)->typer) + 1)
@@ -2778,6 +2780,8 @@ static u64 inherit_vpe_l1_table_from_its(void)
 		}
 		val |= FIELD_PREP(GICR_VPROPBASER_4_1_SIZE, GITS_BASER_NR_PAGES(baser) - 1);
 
+		*this_cpu_ptr(&local_4_1_its) = its;
+
 		return val;
 	}
 
@@ -2815,6 +2819,8 @@ static u64 inherit_vpe_l1_table_from_rd(cpumask_t **mask)
 		gic_data_rdist()->vpe_l1_base = gic_data_rdist_cpu(cpu)->vpe_l1_base;
 		*mask = gic_data_rdist_cpu(cpu)->vpe_table_mask;
 
+		*this_cpu_ptr(&local_4_1_its) = *per_cpu_ptr(&local_4_1_its, cpu);
+
 		return val;
 	}
 
@@ -4180,8 +4186,9 @@ static struct irq_chip its_vpe_irq_chip = {
 
 static struct its_node *find_4_1_its(void)
 {
-	static struct its_node *its = NULL;
+	struct its_node *its;
 
+	its = *this_cpu_ptr(&local_4_1_its);
 	if (!its) {
 		list_for_each_entry(its, &its_nodes, entry) {
 			if (is_v4_1(its))
-- 
2.30.0


