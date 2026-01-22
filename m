Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C002BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jREerp1UUtlvwq6DucOPbqJRI1tz6hZrq/qDog8bRt8=; b=aRWX4FW261HhP2nu8hevWOYhMQ
	Dua5Sts2FyHmODcVADwc65bZZOklaVipv7VJ3qfH23nAArDFX9aXMEPe5unquOWelhj7qRBaFDIuu
	72krA1iVoriwFoqVFfQLjAxuZ4WbBVJxqyThFXtl6pWBBw2i6SU8BvZYtl9qn38GveMGCY7/5Stxy
	durNjfM765nzjqDyhReXNMc3z5/Er2KCShDA0g5X9yn0GOcb/U7doakjeddD5CjQaEBS9Q6yiv+O6
	ncYkCkAEb/czm70oEJ49U8CB4RaUtr7y571og8IHuHOzaMycnIuwB581fN7zMvph3VnxMsvZfk8Kg
	KwzyylDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virI3-00000006lFm-1amw;
	Thu, 22 Jan 2026 09:47:47 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virHz-00000006lCh-0IUL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769075260; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=jREerp1UUtlvwq6DucOPbqJRI1tz6hZrq/qDog8bRt8=;
	b=f2pgkAloibxoIJjVJbyft8oE8LP8z6J+TXmkRNdYUQwUYBqYe2nNoLSw1XHFrdHke+V5I3O/1BnjgWxOgwSKTMDVuLYT8YdpShfE3kljQz9vNRFjSd4MJRUs6/cCd4M9fbM3WTs58T5Kq57crJSPVgcwfbG3264y+iMkXOWEW6w=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WxbuwhN_1769075254 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Jan 2026 17:47:37 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	robin.murphy@arm.com,
	mark.rutland@arm.com,
	tony.luck@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org
Cc: lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-edac@vger.kernel.org,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v6 04/16] ras: AEST: Unify the read/write interface for system and MMIO register
Date: Thu, 22 Jan 2026 17:46:44 +0800
Message-Id: <20260122094656.73399-5-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
References: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_014743_445391_32249FF8 
X-CRM114-Status: GOOD (  12.13  )
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


