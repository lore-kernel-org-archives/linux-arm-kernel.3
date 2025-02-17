Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2393C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QifBQ/xg2RCUDrB4vfDq4gu1LJ6B/77pKMAfIESueUs=; b=bHia+q/VjQmM0RsXQlkvUeJMTi
	Cp+o5gHW2Z54SKCrIfXvedTuhIh8CYk6x+Py0B/FF+GHV8dxrp5XW4or7KH4LfIfYxLUY4WKzJspP
	S9E7dkvKB88NdvIw98HQX+D/C2YKgVioTQQVt+TeOV8dpIHa6wKhpcTdu1zdBNiXg5dbfQS5MQVmR
	9wJ0E5Yd75b11KkNMUi94TACvhTKbyGiLh8gArHVYjpNXJ4KWnRFym3eLzrseGyqzFUbz/zfGf7zG
	JGWZOdhVEzCnmPmcGCywrxIuWbJ3n6sA1TdIA/VJHucZ1Fi0jWTxoURU5LEYvFW1+1EpM2CcWWXC/
	61vKO9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykr-00000004B6z-12X9;
	Mon, 17 Feb 2025 10:53:37 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCH-000000045KK-18YG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:17:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-38f1e8efe82so4566782f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787472; x=1740392272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QifBQ/xg2RCUDrB4vfDq4gu1LJ6B/77pKMAfIESueUs=;
        b=nsaWnVMuQl0ISIK+zOrKWM8QMmHK2OqNHGv6JxwvAPM/LzhkWs2GQKuIfYRUcYjxaS
         sdq3CAM/SgQjrv6RWpCMx/HzhxzeqQ+F36/hkMXj3swQGZ/3GKKMdIVBmPBzGUYLnBh+
         RXhpfkhuGucQPK+ZBP7t05fC3ZuW0HfiCckqxuszfbS/vugIe5xynna+zl+9dKM96R0W
         PcKnaYVA7valuOMEaHtgTHwse9p2UvIceeIuZRmI6/MicS2igR5YbRizVha1eNuCfv5a
         HDHkTzmIT/28cvXyDW5DHir7Sw/yAXi3CEcjH6Q0esbUrYc2N6rxk1spHAamM6O7gaSc
         0bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787472; x=1740392272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QifBQ/xg2RCUDrB4vfDq4gu1LJ6B/77pKMAfIESueUs=;
        b=JPVU0+0sC7O404ga+kq3HAqnh3xiiaRsCcddEaP6wtiChQPNSCeljjZDFErABI/Tkh
         3MIKXclKkDvcy6/hmpL0CcUaGO8nualahD3nakJHz1jXhAbT195kGyPD4nWys4bFiMtJ
         ZPwUk5zg2BjVzgEJTwWv2a+7VK3lzitF4Kli7wDdjdW1aAWdlLgft00FPwa1e4uMLC9y
         C7S45CA5Veg65eNGkmcmWM0bPpiGOa/jN+0MxVXc/Kn3gphd8WgzAH9ZM0cJTNLvVBCy
         pFhWnt4HYe65kkMxC60rVoPOEI55uzmhcfEzhzaXXjE7YxTHr93yATk/uHoTpPO1KWUX
         2BNw==
X-Forwarded-Encrypted: i=1; AJvYcCUXcyIGqASPtSHhwFn8JAjZNtQpKQOfTMPu9gqyL6DIyYtIfkabCOEcu4XjpDPEC5R9AOUBDdqtQLyJ246ktCTQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwLV5H/W8lt0zoRHKrNd7ZmoKGhmyhUShlTEHA/kRDT3xSA41li
	9NPe5yZGRBQeR42P/eIbOst1jZAjoqaMMgJ813f/kf53E2rfaqUtpB53bbYyYzY=
X-Gm-Gg: ASbGnctyH4ZLXwDhgFxFlhkDRP4cJ+l/hqAJgYddK42CN84whH6BudET4+F5bl5CwNA
	v1HPrq6+FYjl78eVIKrK0kVm9HZ+3nTYO8r1sglZyUbC8rvI/74nWhn8ROkj5DZDjG7RsWbvrBa
	l/XYqWhvjybDfGd4Ft6ZVC5OUbgv5R35xdCMwOuXPSF0DMC25Rqywhy5URmS8smUiOtG9RmYYqT
	31YwekYfZTJ0nx1D1YD15RbUBrXOHb2LlBcSP/FxXZb3ctq7h0Zj0VttKKresb/1I/3sfkAbXp/
	RH2FIIeWrqj4vqxdV7PRzjsF
X-Google-Smtp-Source: AGHT+IHXaznwSyo3YbfYL/R4+3M72WRvyCNEfigOhBxj8g1XzyEDxhWvwflhOeb8uHLrPz5EryyeQA==
X-Received: by 2002:a5d:5f4a:0:b0:38f:4244:68cb with SMTP id ffacd0b85a97d-38f42446bfbmr3184326f8f.12.1739787471737;
        Mon, 17 Feb 2025 02:17:51 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:51 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 04/10] qcom: smem: add pstore smem backend
Date: Mon, 17 Feb 2025 12:17:00 +0200
Message-ID: <20250217101706.2104498-5-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021753_341484_56BCD2D1 
X-CRM114-Status: GOOD (  26.52  )
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

Add support for pstore smem backend in the qcom smem driver.
This backend resorts to minidump regions behind the scenes.

Co-developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/Kconfig       |   9 +
 drivers/soc/qcom/Makefile      |   6 +-
 drivers/soc/qcom/smem_md.c     | 306 +++++++++++++++++++++++++++++++++
 drivers/soc/qcom/smem_pstore.c | 112 ++++++++++++
 include/linux/soc/qcom/smem.h  |  43 +++++
 5 files changed, 474 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/qcom/smem_md.c
 create mode 100644 drivers/soc/qcom/smem_pstore.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 58e63cf0036b..e1c71f713c05 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -180,6 +180,15 @@ config QCOM_SMEM
 	  The driver provides an interface to items in a heap shared among all
 	  processors in a Qualcomm platform.
 
+config QCOM_SMEM_PSTORE
+	bool "Qualcomm Shared Memory(SMEM) Pstore backend"
+	depends on QCOM_SMEM
+	select PSTORE
+	select PSTORE_SMEM
+	help
+	  Say y here to enable the shared memory driver to register itself
+	  as a pstore backend.
+
 config QCOM_SMD_RPM
 	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index acbca2ab5cc2..304b031ed70e 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -23,8 +23,10 @@ obj-$(CONFIG_QCOM_RPMH)		+= qcom_rpmh.o
 qcom_rpmh-y			+= rpmh-rsc.o
 qcom_rpmh-y			+= rpmh.o
 obj-$(CONFIG_QCOM_SMD_RPM)	+= rpm-proc.o smd-rpm.o
-obj-$(CONFIG_QCOM_SMEM) +=	smem.o
-obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
+obj-$(CONFIG_QCOM_SMEM) += qcom_smem.o
+qcom_smem-y += smem.o
+qcom_smem-$(CONFIG_QCOM_SMEM_PSTORE) += smem_pstore.o smem_md.o
+obj-$(CONFIG_QCOM_SMEM_STATE)	+= smem_state.o
 CFLAGS_smp2p.o := -I$(src)
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
diff --git a/drivers/soc/qcom/smem_md.c b/drivers/soc/qcom/smem_md.c
new file mode 100644
index 000000000000..2b665ecc5695
--- /dev/null
+++ b/drivers/soc/qcom/smem_md.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/devcoredump.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+#include <linux/dma-mapping.h>
+#include <linux/pstore_smem.h>
+#include <linux/pstore_zone.h>
+#include <linux/pstore.h>
+
+#define MAX_NUM_ENTRIES	  201
+#define MAX_STRTBL_SIZE	  (MAX_NUM_ENTRIES * MAX_REGION_NAME_LENGTH)
+
+#define MAX_NUM_OF_SS           10
+#define MAX_REGION_NAME_LENGTH  16
+#define SBL_MINIDUMP_SMEM_ID	602
+#define MINIDUMP_REGION_VALID	   ('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MINIDUMP_SS_ENCR_DONE	   ('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MINIDUMP_SS_ENABLED	   ('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+#define MINIDUMP_REGION_INVALID	   ('I' << 24 | 'N' << 16 | 'V' << 8 | 'A' << 0)
+#define MINIDUMP_REGION_INIT	   ('I' << 24 | 'N' << 16 | 'I' << 8 | 'T' << 0)
+#define MINIDUMP_REGION_NOINIT	   0
+
+#define MINIDUMP_SS_ENCR_REQ	   (0 << 24 | 'Y' << 16 | 'E' << 8 | 'S' << 0)
+#define MINIDUMP_SS_ENCR_NOTREQ	   (0 << 24 | 0 << 16 | 'N' << 8 | 'R' << 0)
+#define MINIDUMP_SS_ENCR_START	   ('S' << 24 | 'T' << 16 | 'R' << 8 | 'T' << 0)
+
+#define MINIDUMP_APSS_DESC	   0
+
+/**
+ * struct minidump - Minidump driver data information
+ * @apss_data: APSS driver data
+ * @md_lock: Lock to protect access to APSS minidump table
+ */
+struct minidump {
+	struct device		*dev;
+	struct minidump_ss_data	*apss_data;
+	struct mutex		md_lock;
+};
+
+/**
+ * struct minidump_region - Minidump region
+ * @name		: Name of the region to be dumped
+ * @seq_num:		: Use to differentiate regions with same name.
+ * @valid		: This entry to be dumped (if set to 1)
+ * @address		: Physical address of region to be dumped
+ * @size		: Size of the region
+ */
+struct minidump_region {
+	char	name[MAX_REGION_NAME_LENGTH];
+	__le32	seq_num;
+	__le32	valid;
+	__le64	address;
+	__le64	size;
+};
+
+/**
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
+ * @status : Subsystem toc init status
+ * @enabled : if set to 1, this region would be copied during coredump
+ * @encryption_status: Encryption status for this subsystem
+ * @encryption_required : Decides to encrypt the subsystem regions or not
+ * @region_count : Number of regions added in this subsystem toc
+ * @regions_baseptr : regions base pointer of the subsystem
+ */
+struct minidump_subsystem {
+	__le32	status;
+	__le32	enabled;
+	__le32	encryption_status;
+	__le32	encryption_required;
+	__le32	region_count;
+	__le64	regions_baseptr;
+};
+
+/**
+ * struct minidump_global_toc - Global Table of Content
+ * @status : Global Minidump init status
+ * @md_revision : Minidump revision
+ * @enabled : Minidump enable status
+ * @subsystems : Array of subsystems toc
+ */
+struct minidump_global_toc {
+	__le32				status;
+	__le32				md_revision;
+	__le32				enabled;
+	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+};
+/**
+ * struct minidump_ss_data - Minidump subsystem private data
+ * @md_ss_toc: Application Subsystem TOC pointer
+ * @md_regions: Application Subsystem region base pointer
+ */
+struct minidump_ss_data {
+	struct minidump_subsystem *md_ss_toc;
+	struct minidump_region	  *md_regions;
+};
+
+static struct minidump *md;
+
+static void qcom_md_add_region(const struct qcom_minidump_region *region)
+{
+	struct minidump_subsystem *mdss_toc = md->apss_data->md_ss_toc;
+	struct minidump_region *mdr;
+	unsigned int region_cnt;
+
+	region_cnt = le32_to_cpu(mdss_toc->region_count);
+	mdr = &md->apss_data->md_regions[region_cnt];
+	strscpy(mdr->name, region->name, sizeof(mdr->name));
+	mdr->address = cpu_to_le64(region->phys_addr);
+	mdr->size = cpu_to_le64(region->size);
+	mdr->valid = cpu_to_le32(MINIDUMP_REGION_VALID);
+	region_cnt++;
+	mdss_toc->region_count = cpu_to_le32(region_cnt);
+}
+
+static int qcom_md_get_region_index(struct minidump_ss_data *mdss_data,
+				    const struct qcom_minidump_region *region)
+{
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	struct minidump_region *mdr;
+	unsigned int i;
+	unsigned int count;
+
+	count = le32_to_cpu(mdss_toc->region_count);
+	for (i = 0; i < count; i++) {
+		mdr = &mdss_data->md_regions[i];
+		if (!strcmp(mdr->name, region->name))
+			return i;
+	}
+
+	return -ENOENT;
+}
+
+static int qcom_md_region_unregister(const struct qcom_minidump_region *region)
+{
+	struct minidump_ss_data *mdss_data = md->apss_data;
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	struct minidump_region *mdr;
+	unsigned int region_cnt;
+	unsigned int idx;
+	int ret;
+
+	ret = qcom_md_get_region_index(mdss_data, region);
+	if (ret < 0) {
+		dev_err(md->dev, "%s region is not present\n", region->name);
+		return ret;
+	}
+
+	idx = ret;
+	mdr = &mdss_data->md_regions[0];
+	region_cnt = le32_to_cpu(mdss_toc->region_count);
+	/*
+	 * Left shift all the regions exist after this removed region
+	 * index by 1 to fill the gap and zero out the last region
+	 * present at the end.
+	 */
+	memmove(&mdr[idx], &mdr[idx + 1], (region_cnt - idx - 1) * sizeof(*mdr));
+	memset(&mdr[region_cnt - 1], 0, sizeof(*mdr));
+	region_cnt--;
+	mdss_toc->region_count = cpu_to_le32(region_cnt);
+
+	return 0;
+}
+
+static int qcom_md_region_register(const struct qcom_minidump_region *region)
+{
+	struct minidump_ss_data *mdss_data = md->apss_data;
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	unsigned int num_region;
+	int ret;
+
+	ret = qcom_md_get_region_index(mdss_data, region);
+	if (ret >= 0) {
+		dev_info(md->dev, "%s region is already registered\n", region->name);
+		return -EEXIST;
+	}
+
+	/* Check if there is a room for a new entry */
+	num_region = le32_to_cpu(mdss_toc->region_count);
+	if (num_region >= MAX_NUM_ENTRIES) {
+		dev_err(md->dev, "maximum region limit %u reached\n", num_region);
+		return -ENOSPC;
+	}
+
+	qcom_md_add_region(region);
+
+	return 0;
+}
+
+static bool qcom_minidump_valid_region(const struct qcom_minidump_region *region)
+{
+	return region &&
+		strnlen(region->name, MINIDUMP_MAX_NAME_LENGTH) < MINIDUMP_MAX_NAME_LENGTH &&
+			region->virt_addr &&
+			region->size &&
+			IS_ALIGNED(region->size, 4);
+}
+
+/**
+ * qcom_minidump_region_register() - Register region in APSS Minidump table.
+ * @region: minidump region.
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+int qcom_minidump_region_register(const struct qcom_minidump_region *region)
+{
+	int ret;
+
+	if (!qcom_minidump_valid_region(region))
+		return -EINVAL;
+
+	mutex_lock(&md->md_lock);
+	ret = qcom_md_region_register(region);
+
+	mutex_unlock(&md->md_lock);
+	return ret;
+}
+
+/**
+ * qcom_minidump_region_unregister() - Unregister region from APSS Minidump table.
+ * @region: minidump region.
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+int qcom_minidump_region_unregister(const struct qcom_minidump_region *region)
+{
+	int ret;
+
+	if (!qcom_minidump_valid_region(region))
+		return -EINVAL;
+
+	mutex_lock(&md->md_lock);
+	ret = qcom_md_region_unregister(region);
+
+	mutex_unlock(&md->md_lock);
+	return ret;
+}
+
+
+static int qcom_apss_md_table_init(struct minidump_subsystem *mdss_toc)
+{
+	struct minidump_ss_data *mdss_data;
+
+	mdss_data = devm_kzalloc(md->dev, sizeof(*mdss_data), GFP_KERNEL);
+	if (!mdss_data)
+		return -ENOMEM;
+
+	mdss_data->md_ss_toc = mdss_toc;
+	mdss_data->md_regions = devm_kcalloc(md->dev, MAX_NUM_ENTRIES,
+					     sizeof(*mdss_data->md_regions),
+					     GFP_KERNEL);
+	if (!mdss_data->md_regions)
+		return -ENOMEM;
+
+	mdss_toc = mdss_data->md_ss_toc;
+	mdss_toc->regions_baseptr = cpu_to_le64(virt_to_phys(mdss_data->md_regions));
+	mdss_toc->enabled = cpu_to_le32(MINIDUMP_SS_ENABLED);
+	mdss_toc->status = cpu_to_le32(1);
+	mdss_toc->region_count = cpu_to_le32(0);
+
+	/* Tell bootloader not to encrypt the regions of this subsystem */
+	mdss_toc->encryption_status = cpu_to_le32(MINIDUMP_SS_ENCR_DONE);
+	mdss_toc->encryption_required = cpu_to_le32(MINIDUMP_SS_ENCR_NOTREQ);
+
+	md->apss_data = mdss_data;
+
+	return 0;
+}
+
+int qcom_smem_md_init(struct device *dev)
+{
+	struct minidump_global_toc *mdgtoc;
+	size_t size;
+	int ret;
+
+	md = devm_kzalloc(dev, sizeof(*md), GFP_KERNEL);
+
+	md->dev = dev;
+
+	mdgtoc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &size);
+	if (IS_ERR(mdgtoc)) {
+		ret = PTR_ERR(mdgtoc);
+		dev_err(md->dev, "Couldn't find minidump smem item %d\n", ret);
+	}
+
+	if (size < sizeof(*mdgtoc) || !mdgtoc->status) {
+		ret = -EINVAL;
+		dev_err(md->dev, "minidump table is not initialized %d\n", ret);
+	}
+
+	mutex_init(&md->md_lock);
+
+	ret = qcom_apss_md_table_init(&mdgtoc->subsystems[MINIDUMP_APSS_DESC]);
+	if (ret)
+		dev_err(md->dev, "apss minidump initialization failed %d\n", ret);
+	return ret;
+}
diff --git a/drivers/soc/qcom/smem_pstore.c b/drivers/soc/qcom/smem_pstore.c
new file mode 100644
index 000000000000..a322a320e435
--- /dev/null
+++ b/drivers/soc/qcom/smem_pstore.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/hwspinlock.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/devcoredump.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+#include <linux/dma-mapping.h>
+#include <linux/pstore_smem.h>
+#include <linux/pstore_zone.h>
+#include <linux/pstore.h>
+
+static LIST_HEAD(apss_md_rlist);
+struct md_region_list {
+	struct qcom_minidump_region md_region;
+	struct list_head list;
+};
+
+static struct qcom_smem_pstore_context {
+	struct pstore_device_info dev;
+} oops_ctx;
+
+static int register_smem_region(const char *name, int id, void *vaddr,
+				   phys_addr_t paddr, size_t size)
+{
+	struct qcom_minidump_region *md_region;
+	int ret;
+
+	struct md_region_list *mdr_list =
+		kzalloc(sizeof(*mdr_list), GFP_KERNEL);
+	if (!mdr_list)
+		return -ENOMEM;
+	md_region = &mdr_list->md_region;
+
+	scnprintf(md_region->name, sizeof(md_region->name), "K%d%.8s", id, name);
+	md_region->virt_addr = vaddr;
+	md_region->phys_addr = paddr;
+	md_region->size = size;
+	ret = qcom_minidump_region_register(md_region);
+	if (ret < 0) {
+		pr_err("failed to register region in minidump: err: %d\n", ret);
+		return ret;
+	}
+
+	list_add(&mdr_list->list, &apss_md_rlist);
+	return 0;
+}
+
+static int unregister_smem_region(void *vaddr,
+					phys_addr_t paddr, size_t size)
+{
+	int ret = -ENOENT;
+	struct md_region_list *mdr_list;
+	struct md_region_list *tmp;
+
+	list_for_each_entry_safe(mdr_list, tmp, &apss_md_rlist, list) {
+		struct qcom_minidump_region *region;
+
+		region = &mdr_list->md_region;
+		if (region->virt_addr == vaddr) {
+			ret = qcom_minidump_region_unregister(region);
+			list_del(&mdr_list->list);
+			goto unregister_smem_region_exit;
+		}
+	}
+
+unregister_smem_region_exit:
+	pr_err("failed to unregister region in minidump: err: %d\n", ret);
+
+	return ret;
+}
+
+static int qcom_smem_register_dmr(char *name, int id, void *area, size_t size)
+{
+	return register_smem_region(name, id, area, virt_to_phys(area), size);
+}
+
+static int qcom_smem_unregister_dmr(void *area, size_t size)
+{
+	return unregister_smem_region(area, virt_to_phys(area), size);
+}
+
+int qcom_register_pstore_smem(struct device *dev)
+{
+	int ret;
+
+	struct qcom_smem_pstore_context *ctx = &oops_ctx;
+
+	ctx->dev.flags = PSTORE_FLAGS_DMAPPED;
+	ctx->dev.zone.register_dmr = qcom_smem_register_dmr;
+	ctx->dev.zone.unregister_dmr = qcom_smem_unregister_dmr;
+	ctx->dev.zone.dmapped_cnt = 2;
+
+	ret = register_pstore_smem_device(&ctx->dev);
+	if (ret)
+		dev_warn(dev, "Could not register pstore smem device.");
+
+	return 0;
+}
+
+void qcom_unregister_pstore_smem(void)
+{
+	struct qcom_smem_pstore_context *ctx = &oops_ctx;
+
+	unregister_pstore_smem_device(&ctx->dev);
+}
diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
index f946e3beca21..376822f13a4f 100644
--- a/include/linux/soc/qcom/smem.h
+++ b/include/linux/soc/qcom/smem.h
@@ -17,4 +17,47 @@ int qcom_smem_get_feature_code(u32 *code);
 
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host);
 
+#ifdef CONFIG_QCOM_SMEM_PSTORE
+int qcom_register_pstore_smem(struct device *dev);
+void qcom_unregister_pstore_smem(void);
+
+#define MINIDUMP_MAX_NAME_LENGTH	12
+
+/**
+ * struct qcom_minidump_region - Minidump region information
+ *
+ * @name:	Minidump region name
+ * @virt_addr:  Virtual address of the entry.
+ * @phys_addr:	Physical address of the entry to dump.
+ * @size:	Number of bytes to dump from @address location,
+ *		and it should be 4 byte aligned.
+ */
+struct qcom_minidump_region {
+	char		name[MINIDUMP_MAX_NAME_LENGTH];
+	void		*virt_addr;
+	phys_addr_t	phys_addr;
+	size_t		size;
+};
+
+int qcom_minidump_region_unregister(const struct qcom_minidump_region *region);
+int qcom_minidump_region_register(const struct qcom_minidump_region *region);
+
+int qcom_smem_md_init(struct device *dev);
+
+#else
+
+static inline int qcom_register_pstore_smem(struct device *dev)
+{
+	return 0;
+}
+
+static inline void qcom_unregister_pstore_smem(void)
+{
+}
+
+static inline int qcom_smem_md_init(struct device *dev)
+{
+	return 0;
+}
+#endif
 #endif
-- 
2.43.0


