Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94548E67498
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jREerp1UUtlvwq6DucOPbqJRI1tz6hZrq/qDog8bRt8=; b=5GihWh5sBt24/xRz4HhqfzSo15
	06I5MiHrhcPlhMI0XAKv4BcQ1mzd5atM4ek3gGy+f3BxHxTB3/h2DksM4BDCxyt5Pr2XAnqHBsYal
	u0vGPdU0ko8A+20l1QTyZHX5NQSI5Szj8uK6+W6QNrzayAYhz0lm/z1kKoS24u5DX9r49tgnzfyyP
	AN5SL87Jh1t2zQIeM8WEGGFUtHlP6crb448Klk0OZB9Pf+Xorx589jF1ObgrAbsZmaWSmBacOfgNF
	gYzMVS/VTyiekqr7fZLKGFmqBSN09GYtqTvWQPSJ8pwvixQmG4wKNSRTyh5JP9YpsJWOgu6i2w7ys
	m/R4hyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcSh-0000000DXS5-49VM;
	Mon, 22 Dec 2025 09:44:19 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcSd-0000000DXO3-2BqD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766396653; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=jREerp1UUtlvwq6DucOPbqJRI1tz6hZrq/qDog8bRt8=;
	b=fgO09HRI7XkSlkXsbj2uJzx2mwj2DkDxeFnNl/OlMeqcC/85bIje4+LScNww/JPjZ5whu+ph9ed36QCvEvSdIon94MBJd4hnNK0OA6KSj1Es28rKkcvFg4DOBzARHa8/8SCdRKc0bJ6HSBm42GEUotb3AweM+7H/8OV1KPSLM44=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvORvOX_1766396649 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 22 Dec 2025 17:44:10 +0800
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
Subject: [PATCH v4 04/17] ras: AEST: Unify the read/write interface for system and MMIO register
Date: Mon, 22 Dec 2025 17:43:37 +0800
Message-Id: <20251222094351.38792-5-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
References: <20251222094351.38792-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_014415_738010_E3C8E9BF 
X-CRM114-Status: GOOD (  11.85  )
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

Use record_read/write to simultaneously read and write system registers and
MMIO registers while maintaining code conciseness.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/ras/aest/aest-core.c |  1 +
 drivers/ras/aest/aest.h      | 94 ++++++++++++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index acebb293ac75..f4a5119dc513 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -29,6 +29,7 @@ static int aest_init_record(struct aest_record *record, int i,
 		record->regs_base =
 			node->base + sizeof(struct ras_ext_regs) * i;
 
+	record->access = &aest_access[node->info->interface_hdr->type];
 	record->addressing_mode = test_bit(i, node->info->addressing_mode);
 	record->index = i;
 	record->node = node;
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index 3250675e99b7..31131cce9928 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -10,6 +10,11 @@
 
 #define MAX_GSI_PER_NODE 2
 
+#define record_read(record, offset) \
+	record->access->read(record->regs_base, offset)
+#define record_write(record, offset, val) \
+	record->access->write(record->regs_base, offset, val)
+
 #define aest_dev_err(__adev, format, ...) \
 	dev_err((__adev)->dev, format, ##__VA_ARGS__)
 #define aest_dev_info(__adev, format, ...) \
@@ -47,6 +52,20 @@
 #define ERXGROUP_16K_ERRGSR_NUM 4
 #define ERXGROUP_64K_ERRGSR_NUM 14
 
+#define ERXFR 0x0
+#define ERXCTLR 0x8
+#define ERXSTATUS 0x10
+#define ERXADDR 0x18
+#define ERXMISC0 0x20
+#define ERXMISC1 0x28
+#define ERXMISC2 0x30
+#define ERXMISC3 0x38
+
+struct aest_access {
+	u64 (*read)(void *base, u32 offset);
+	void (*write)(void *base, u32 offset, u64 val);
+};
+
 struct aest_record {
 	char *name;
 	int index;
@@ -63,6 +82,7 @@ struct aest_record {
 	 */
 	int addressing_mode;
 	struct aest_node *node;
+	const struct aest_access *access;
 };
 
 struct aest_group {
@@ -159,3 +179,77 @@ static inline int aest_set_name(struct aest_device *adev,
 
 	return 0;
 }
+
+#define CASE_READ(res, x)                           \
+	case (x): {                                 \
+		res = read_sysreg_s(SYS_##x##_EL1); \
+		break;                              \
+	}
+
+#define CASE_WRITE(val, x)                            \
+	case (x): {                                   \
+		write_sysreg_s((val), SYS_##x##_EL1); \
+		break;                                \
+	}
+
+static inline u64 aest_sysreg_read(void *__unused, u32 offset)
+{
+	u64 res;
+
+	switch (offset) {
+		CASE_READ(res, ERXFR)
+		CASE_READ(res, ERXCTLR)
+		CASE_READ(res, ERXSTATUS)
+		CASE_READ(res, ERXADDR)
+		CASE_READ(res, ERXMISC0)
+		CASE_READ(res, ERXMISC1)
+		CASE_READ(res, ERXMISC2)
+		CASE_READ(res, ERXMISC3)
+	default :
+		res = 0;
+	}
+	return res;
+}
+
+static inline void aest_sysreg_write(void *base, u32 offset, u64 val)
+{
+	switch (offset) {
+		CASE_WRITE(val, ERXFR)
+		CASE_WRITE(val, ERXCTLR)
+		CASE_WRITE(val, ERXSTATUS)
+		CASE_WRITE(val, ERXADDR)
+		CASE_WRITE(val, ERXMISC0)
+		CASE_WRITE(val, ERXMISC1)
+		CASE_WRITE(val, ERXMISC2)
+		CASE_WRITE(val, ERXMISC3)
+	default :
+		return;
+	}
+}
+
+static inline u64 aest_iomem_read(void *base, u32 offset)
+{
+	return readq_relaxed(base + offset);
+}
+
+static inline void aest_iomem_write(void *base, u32 offset, u64 val)
+{
+	writeq_relaxed(val, base + offset);
+}
+
+/* access type is decided by AEST interface type. */
+static const struct aest_access aest_access[] = {
+	[ACPI_AEST_NODE_SYSTEM_REGISTER] = {
+		.read = aest_sysreg_read,
+		.write = aest_sysreg_write,
+	},
+	[ACPI_AEST_NODE_MEMORY_MAPPED] = {
+		.read = aest_iomem_read,
+		.write = aest_iomem_write,
+	},
+	[ACPI_AEST_NODE_SINGLE_RECORD_MEMORY_MAPPED] = {
+		.read = aest_iomem_read,
+		.write = aest_iomem_write,
+	},
+	{ }
+};
-- 
2.51.2.612.gdc70283dfc


