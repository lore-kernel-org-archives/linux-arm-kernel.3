Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2489FE67495
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Gb/0pO9ZhFEXcQF/4tc/EbwH+IhljJ6XBnX4XBc2RQ=; b=S64BLG1E//jwBj2t48rBhCA03m
	VUFGkY1Xl16Z6oruI3vupQ7zTwkzPyi4bxsV0mscBo11BwujULvnVgDf80WwincVBDh7IMzVUO/rP
	1wxheqf4p3JfXyyHN+Lpy6oXMNIXTU067tDZRIsAU1iqYGPG2yT3mLjUWz7Z/pwC6dIif2RWTMU7h
	euxpvHsrhDToYfbSevsZQHoPg3tzty44yWpZs+Va7nH1R8Q2Cg7hmlZqvgvczOR4N3z2y6+33A471
	DoAxcaCCiklmtAddHqf0RiXmM3pdJg4V/pkxmkyG/SZnE1avg9epw3Gz6ybWT4qL/qURWpsYJIiH9
	2UXY8Hrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcSu-0000000DXah-28Vj;
	Mon, 22 Dec 2025 09:44:32 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcSf-0000000DXPD-2YSr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766396656; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5Gb/0pO9ZhFEXcQF/4tc/EbwH+IhljJ6XBnX4XBc2RQ=;
	b=ruSMnp+QxrKyRHxj+YRAAQbjcWoSL9P5shyTCOmUCE+ldaLcP5quEtm7fQrqjMJ0fZdZLKfpJHhiF46oWIrsZJy/lq14u1+Lpg/AjAcGCV0el1GeSq8u+qj0fWlqrD4w2qtLFGUB1TQLAnIRAMOFlp+UqBI68omX3i5fOhAiVBU=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvOT.PY_1766396651 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 22 Dec 2025 17:44:13 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com,
	misono.tomohiro@fujitsu.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v4 05/17] ras: AEST: Probe RAS system architecture version
Date: Mon, 22 Dec 2025 17:43:38 +0800
Message-Id: <20251222094351.38792-6-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
References: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_014417_861622_73C7C8EF 
X-CRM114-Status: GOOD (  11.93  )
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

The RAS version of a component can be probed via its ERRDEVARCH register.

In cases where a component (e.g., SMMU) does not implement an ERRDEVARCH
register, the driver falls back to using the RAS version of the Processing
Element (PE).

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 arch/arm64/include/asm/ras.h |  3 +++
 drivers/ras/aest/aest-core.c | 22 ++++++++++++++++++++++
 drivers/ras/aest/aest.h      |  3 +++
 3 files changed, 28 insertions(+)

diff --git a/arch/arm64/include/asm/ras.h b/arch/arm64/include/asm/ras.h
index b6640b9972bf..da7c441252fe 100644
--- a/arch/arm64/include/asm/ras.h
+++ b/arch/arm64/include/asm/ras.h
@@ -4,6 +4,9 @@
 
 #include <linux/types.h>
 
+/* ERRDEVARCH */
+#define ERRDEVARCH_REV GENMASK(19, 16)
+
 struct ras_ext_regs {
 	u64 err_fr;
 	u64 err_ctlr;
diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index f4a5119dc513..84b2fb8127ff 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -16,6 +16,27 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
 #undef pr_fmt
 #define pr_fmt(fmt) "AEST: " fmt
 
+static int get_aest_node_ver(struct aest_node *node)
+{
+	u64 reg;
+	void *devarch_base;
+
+	if (node->type == ACPI_AEST_GIC_ERROR_NODE) {
+		devarch_base = ioremap(node->info->interface_hdr->address +
+					       GIC_ERRDEVARCH,
+				       PAGE_SIZE);
+		if (!devarch_base)
+			return 0;
+
+		reg = readl_relaxed(devarch_base);
+		iounmap(devarch_base);
+
+		return FIELD_GET(ERRDEVARCH_REV, reg);
+	}
+
+	return FIELD_GET(ID_AA64PFR0_EL1_RAS_MASK, read_cpuid(ID_AA64PFR0_EL1));
+}
+
 static int aest_init_record(struct aest_record *record, int i,
 			    struct aest_node *node)
 {
@@ -108,6 +129,7 @@ static int aest_init_node(struct aest_device *adev, struct aest_node *node,
 	node->adev = adev;
 	node->info = anode;
 	node->type = anode->type;
+	node->version = get_aest_node_ver(node);
 	node->name = alloc_aest_node_name(node);
 	if (!node->name)
 		return -ENOMEM;
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index 31131cce9928..bf0b9a49fdaa 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -61,6 +61,8 @@
 #define ERXMISC2 0x30
 #define ERXMISC3 0x38
 
+#define GIC_ERRDEVARCH 0xFFBC
+
 struct aest_access {
 	u64 (*read)(void *base, u32 offset);
 	void (*write)(void *base, u32 offset, u64 val);
@@ -141,6 +143,7 @@ struct aest_node {
 	 *              error events.
 	 */
 	unsigned long *status_reporting;
+	int version;
 
 	const struct aest_group *group;
 	struct aest_device *adev;
-- 
2.51.2.612.gdc70283dfc


