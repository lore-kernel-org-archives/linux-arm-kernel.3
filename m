Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649F9D41D6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 08:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YpT4ce3zIhItYCH93EKcNdBFMZYaDHEMZu0eagpexE8=; b=I/olJbPvZ8vk9Ng0S7Q+N8hyUe
	srPk1e0jd90UwkCLKmCo5zS8+Hn4t+2vhoJvoOsgAZPs4fywuSBsnb4nEWazaveJJ8FZMau/moETP
	LK+jeY67/iLg5kFIRZ0/qMQZrFOFsV6HXdSBUkuDdf+EMhf0kFRH7gz2w3YugDdL8kqx1QFunhEHh
	MzGfJUm4op/R7bW0sX0YVnz5Sa5NB07Dx9UY+jNVFWmyEHbeinMzkt9SxStGnTeRUgGYSCmjn4Xfw
	IuLY5JHHxs2/naqsX9qV4kwLnypHBYuPtiOXT5gjaqU0jLsu6LClmGLJ9SSO9Fjfho7+X8TfIBk4y
	5u9DLQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmkJ-00000002jdz-1ryJ;
	Tue, 12 Nov 2024 08:59:35 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmgj-00000002j6a-3AMF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 08:55:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XngFL1Mlyz2DgtV;
	Tue, 12 Nov 2024 16:53:58 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id CA1D2180042;
	Tue, 12 Nov 2024 16:55:46 +0800 (CST)
Received: from huawei.com (10.145.6.51) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 12 Nov
 2024 16:55:45 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <maz@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<wangwudi@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, Nianyao Tang
	<tangnianyao@huawei.com>
Subject: [PATCH v2] irqchip/gicv3-its: Add workaround for hip09 ITS erratum 162100801
Date: Tue, 12 Nov 2024 17:04:26 +0800
Message-ID: <20241112090426.1876148-1-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.145.6.51]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200012.china.huawei.com (7.221.188.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_005554_242469_85537915 
X-CRM114-Status: GOOD (  14.96  )
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

When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
during unmapping operation, which will cause some vSGIs lost.

To fix the issue, it needs to send VINVALL command after VMOVP.

Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 10 +++++++
 drivers/irqchip/irq-gic-v3-its.c            | 29 +++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 65bfab1b1861..77db10e944f0 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -258,6 +258,8 @@ stable kernels.
 | Hisilicon      | Hip{08,09,10,10C| #162001900      | N/A                         |
 |                | ,11} SMMU PMCG  |                 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
+| Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 70d7f4f20225..d41cf6bf1458 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1232,6 +1232,16 @@ config HISILICON_ERRATUM_161600802
 
 	  If unsure, say Y.
 
+config HISILICON_ERRATUM_162100801
+	bool "Hip09 162100801 erratum support"
+	default y
+	help
+	  When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
+	  during unmapping operation, which will cause some vSGIs lost.
+	  So fix it by sending VINVALL command after VMOVP.
+
+	  If unsure, say Y.
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 52f625e07658..e98d13d0adf9 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -44,6 +44,7 @@
 #define ITS_FLAGS_WORKAROUND_CAVIUM_22375	(1ULL << 1)
 #define ITS_FLAGS_WORKAROUND_CAVIUM_23144	(1ULL << 2)
 #define ITS_FLAGS_FORCE_NON_SHAREABLE		(1ULL << 3)
+#define ITS_FLAGS_WORKAROUND_HISILICON_162100801	(1ULL << 4)
 
 #define RD_LOCAL_LPI_ENABLED                    BIT(0)
 #define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
@@ -3804,6 +3805,7 @@ static int its_vpe_set_affinity(struct irq_data *d,
 	struct its_vpe *vpe = irq_data_get_irq_chip_data(d);
 	unsigned int from, cpu = nr_cpu_ids;
 	struct cpumask *table_mask;
+	struct its_node *its;
 	unsigned long flags;
 
 	/*
@@ -3866,6 +3868,17 @@ static int its_vpe_set_affinity(struct irq_data *d,
 	vpe->col_idx = cpu;
 
 	its_send_vmovp(vpe);
+
+	/*
+	 * Version of ITS is same in one system. As there is no cache in ITS,
+	 * and only cache in related GICR should be clean, so one VINVALL is
+	 * enough here.
+	 */
+	its = list_first_entry(&its_nodes, struct its_node, entry);
+	if ((its->flags & ITS_FLAGS_WORKAROUND_HISILICON_162100801) &&
+	    is_v4_1(its))
+		its_send_vinvall(its, vpe);
+
 	its_vpe_db_proxy_move(vpe, from, cpu);
 
 out:
@@ -4781,6 +4794,14 @@ static bool its_set_non_coherent(void *data)
 	return true;
 }
 
+static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
+{
+	struct its_node *its = data;
+
+	its->flags |= ITS_FLAGS_WORKAROUND_HISILICON_162100801;
+	return true;
+}
+
 static const struct gic_quirk its_quirks[] = {
 #ifdef CONFIG_CAVIUM_ERRATUM_22375
 	{
@@ -4827,6 +4848,14 @@ static const struct gic_quirk its_quirks[] = {
 		.init	= its_enable_quirk_hip07_161600802,
 	},
 #endif
+#ifdef CONFIG_HISILICON_ERRATUM_162100801
+	{
+		.desc	= "ITS: Hip09 erratum 162100801",
+		.iidr	= 0x00051736,
+		.mask	= 0xffffffff,
+		.init	= its_enable_quirk_hip09_162100801,
+	},
+#endif
 #ifdef CONFIG_ROCKCHIP_ERRATUM_3588001
 	{
 		.desc   = "ITS: Rockchip erratum RK3588001",
-- 
2.34.1


