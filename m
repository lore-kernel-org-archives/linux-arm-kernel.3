Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B30BC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+5Mho4VPuqaUN6/kz43PQ85di8W0mKRXizaFOmtQUSY=; b=uldVF7/11Sqc/WA/DwwSq3/F83
	OjAPx3Jnn3x3n93dD9bxP24L2cgMgLlbbhTwxqPriK2sivaJ7dh4P+Jns60KJRs5ertoGzdWvVPHi
	wirT6zgkwJFFkNE77zhzv4ub+Y1NQ5PJCenMuwN6HV5sqPkaK6JE2xKn/1T9hYqZgHd7TH+xbxRba
	+ZGehgmUwvfznZRmIu5qXypHjmN30tPlzTkvQ/vT4YZy+iOAYSasP+9r1ldPASGQS7CK5IWIQzWqC
	iQdcoEqA/1Wc+xYohqIR7T9QTY5YpvEyNAXiu6n5pa7rbH9eEwfpJtC45VT32oZhFxxQbz5eMN4+V
	wjM1oceQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgMa-0000000Cgq9-2Xr8;
	Tue, 14 Jul 2026 16:52:08 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgMT-0000000CgiT-03qN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784047914;
	bh=0NYj325MCxYfzA0iMFtFlFNm7KVwpEWpQsm1qEOkdJ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZiOS6GD2z8CvGbtL0moHrrPujbDO5n6tgv6RfCwYJrs1wGp6CPFXJIc5ew43nmhV2
	 0to+rX9ljKOqdVHsN/XqIZzsELt5CLzdYptOivPMSQ3cIQ+Nd7lHJF5El9WRcmWJUA
	 SMS1lP7vprHJQLaGAhwBfMpj4StwXZx/qNXkRmpQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 14 Jul 2026 18:51:49 +0200
Subject: [PATCH 2/3] drivers: perf: Use __DEVICE_ATTR() macro to initialize
 dev_ext_attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-sysfs-const-attr-dev_ext_attr-v1-2-6b2c0435d621@weissschuh.net>
References: <20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net>
In-Reply-To: <20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net>
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
 Yushan Wang <wangyushan12@huawei.com>, Jijie Shao <shaojijie@huawei.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, driver-core@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784047913; l=9437;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0NYj325MCxYfzA0iMFtFlFNm7KVwpEWpQsm1qEOkdJ0=;
 b=taFfFE7aDqhB7yKmzGYYYePgDR3Gq0wU8bj7GfGE+vF5SobjgvamevsFQjF1lGuaA4rzQZtbQ
 g8UOoXRQfZaBitkIOv3PDEqpf2XYWku0enMWHxYIssSWEOwfK+bF7zt
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_095201_365617_1964884D 
X-CRM114-Status: GOOD (  15.58  )
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

The upcoming constification of the device_show_*() callback
signatures requires the users to handle the transition automatically.

Switch to the __DEVICE_ATTR() macro which can do this.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/perf/arm-cci.c                      |  2 +-
 drivers/perf/arm-ccn.c                      |  2 +-
 drivers/perf/arm_cspmu/arm_cspmu.h          |  2 +-
 drivers/perf/arm_dsu_pmu.c                  |  2 +-
 drivers/perf/cxl_pmu.c                      | 10 +++++-----
 drivers/perf/fujitsu_uncore_pmu.c           |  2 +-
 drivers/perf/hisilicon/hisi_pcie_pmu.c      |  2 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.h    |  6 +++---
 drivers/perf/hisilicon/hns3_pmu.c           |  6 +++---
 drivers/perf/nvidia_t410_c2c_pmu.c          |  2 +-
 drivers/perf/nvidia_t410_cmem_latency_pmu.c | 12 ++++++------
 drivers/perf/qcom_l3_pmu.c                  |  8 ++++----
 drivers/perf/xgene_pmu.c                    |  2 +-
 13 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 1cc3214d6b6d..374a00ae4e48 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -132,7 +132,7 @@ static ssize_t __maybe_unused cci_pmu_event_show(struct device *dev,
 
 #define CCI_EXT_ATTR_ENTRY(_name, _func, _config) 				\
 	&((struct dev_ext_attribute[]) {					\
-		{ __ATTR(_name, S_IRUGO, _func, NULL), (void *)_config }	\
+		{ __DEVICE_ATTR(_name, S_IRUGO, _func, NULL), (void *)_config }	\
 	})[0].attr.attr
 
 #define CCI_FORMAT_EXT_ATTR_ENTRY(_name, _config) \
diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
index 8af3563fdf60..955cb5c2b77b 100644
--- a/drivers/perf/arm-ccn.c
+++ b/drivers/perf/arm-ccn.c
@@ -217,7 +217,7 @@ static void arm_ccn_pmu_config_set(u64 *config, u32 node_xp, u32 type, u32 port)
 
 #define CCN_FORMAT_ATTR(_name, _config) \
 	struct dev_ext_attribute arm_ccn_pmu_format_attr_##_name = \
-			{ __ATTR(_name, S_IRUGO, device_show_string, \
+			{ __DEVICE_ATTR(_name, S_IRUGO, device_show_string, \
 			NULL), _config }
 
 static CCN_FORMAT_ATTR(node, "config:0-7");
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 3fc5c8d77266..841b04ea02a4 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -23,7 +23,7 @@
 #define ARM_CSPMU_EXT_ATTR(_name, _func, _config)			\
 	(&((struct dev_ext_attribute[]){				\
 		{							\
-			.attr = __ATTR(_name, 0444, _func, NULL),	\
+			.attr = __DEVICE_ATTR(_name, 0444, _func, NULL),\
 			.var = (void *)_config				\
 		}							\
 	})[0].attr.attr)
diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index 32b0dd7c693b..1d7def95645f 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -69,7 +69,7 @@
 #define DSU_EXT_ATTR(_name, _func, _config)		\
 	(&((struct dev_ext_attribute[]) {				\
 		{							\
-			.attr = __ATTR(_name, 0444, _func, NULL),	\
+			.attr = __DEVICE_ATTR(_name, 0444, _func, NULL),\
 			.var = (void *)_config				\
 		}							\
 	})[0].attr.attr)
diff --git a/drivers/perf/cxl_pmu.c b/drivers/perf/cxl_pmu.c
index 68a54d97d2a8..4ab3360a9004 100644
--- a/drivers/perf/cxl_pmu.c
+++ b/drivers/perf/cxl_pmu.c
@@ -209,11 +209,11 @@ static int cxl_pmu_parse_caps(struct device *dev, struct cxl_pmu_info *info)
 }
 
 #define CXL_PMU_FORMAT_ATTR(_name, _format)\
-	(&((struct dev_ext_attribute[]) {					\
-		{								\
-			.attr = __ATTR(_name, 0444, device_show_string, NULL),	\
-			.var = (void *)_format					\
-		}								\
+	(&((struct dev_ext_attribute[]) {						\
+		{									\
+			.attr = __DEVICE_ATTR(_name, 0444, device_show_string, NULL),	\
+			.var = (void *)_format						\
+		}									\
 		})[0].attr.attr)
 
 enum {
diff --git a/drivers/perf/fujitsu_uncore_pmu.c b/drivers/perf/fujitsu_uncore_pmu.c
index c3c6f56474ad..b83fdaf59324 100644
--- a/drivers/perf/fujitsu_uncore_pmu.c
+++ b/drivers/perf/fujitsu_uncore_pmu.c
@@ -292,7 +292,7 @@ static void fujitsu_uncore_event_read(struct perf_event *event)
 
 #define UNCORE_PMU_FORMAT_ATTR(_name, _config)				      \
 	(&((struct dev_ext_attribute[]) {				      \
-		{ .attr = __ATTR(_name, 0444, device_show_string, NULL),      \
+		{ .attr = __DEVICE_ATTR(_name, 0444, device_show_string, NULL), \
 		  .var = (void *)_config, }				      \
 	})[0].attr.attr)
 
diff --git a/drivers/perf/hisilicon/hisi_pcie_pmu.c b/drivers/perf/hisilicon/hisi_pcie_pmu.c
index c5394d007b61..2dc19b7c8cbf 100644
--- a/drivers/perf/hisilicon/hisi_pcie_pmu.c
+++ b/drivers/perf/hisilicon/hisi_pcie_pmu.c
@@ -110,7 +110,7 @@ static ssize_t hisi_pcie_event_sysfs_show(struct device *dev, struct device_attr
 
 #define HISI_PCIE_PMU_FORMAT_ATTR(_name, _format)                              \
 	(&((struct dev_ext_attribute[]){                                       \
-		{ .attr = __ATTR(_name, 0444, device_show_string, NULL),       \
+		{ .attr = __DEVICE_ATTR(_name, 0444, device_show_string, NULL),\
 		  .var = (void *)_format }                                     \
 	})[0].attr.attr)
 
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
index 3ffe6acda653..a4cb9ed7ea20 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
@@ -27,9 +27,9 @@
 #define HISI_MAX_COUNTERS	0x18
 #define to_hisi_pmu(p)	(container_of(p, struct hisi_pmu, pmu))
 
-#define HISI_PMU_ATTR(_name, _func, _config)				\
-	(&((struct dev_ext_attribute[]) {				\
-		{ __ATTR(_name, 0444, _func, NULL), (void *)_config }   \
+#define HISI_PMU_ATTR(_name, _func, _config)				     \
+	(&((struct dev_ext_attribute[]) {				     \
+		{ __DEVICE_ATTR(_name, 0444, _func, NULL), (void *)_config } \
 	})[0].attr.attr)
 
 #define HISI_PMU_FORMAT_ATTR(_name, _config)		\
diff --git a/drivers/perf/hisilicon/hns3_pmu.c b/drivers/perf/hisilicon/hns3_pmu.c
index c157f3572cae..88a1129e9b90 100644
--- a/drivers/perf/hisilicon/hns3_pmu.c
+++ b/drivers/perf/hisilicon/hns3_pmu.c
@@ -405,9 +405,9 @@ static ssize_t hns3_pmu_filter_mode_show(struct device *dev,
 	return len;
 }
 
-#define HNS3_PMU_ATTR(_name, _func, _config)				\
-	(&((struct dev_ext_attribute[]) {				\
-		{ __ATTR(_name, 0444, _func, NULL), (void *)_config }	\
+#define HNS3_PMU_ATTR(_name, _func, _config)				     \
+	(&((struct dev_ext_attribute[]) {				     \
+		{ __DEVICE_ATTR(_name, 0444, _func, NULL), (void *)_config } \
 	})[0].attr.attr)
 
 #define HNS3_PMU_FORMAT_ATTR(_name, _format) \
diff --git a/drivers/perf/nvidia_t410_c2c_pmu.c b/drivers/perf/nvidia_t410_c2c_pmu.c
index 411987153ff3..930cb3e8aad2 100644
--- a/drivers/perf/nvidia_t410_c2c_pmu.c
+++ b/drivers/perf/nvidia_t410_c2c_pmu.c
@@ -545,7 +545,7 @@ static struct attribute_group nv_c2c_pmu_peer_attr_group = {
 #define NV_C2C_PMU_EXT_ATTR(_name, _func, _config)			\
 	(&((struct dev_ext_attribute[]){				\
 		{							\
-			.attr = __ATTR(_name, 0444, _func, NULL),	\
+			.attr = __DEVICE_ATTR(_name, 0444, _func, NULL),\
 			.var = (void *)_config				\
 		}							\
 	})[0].attr.attr)
diff --git a/drivers/perf/nvidia_t410_cmem_latency_pmu.c b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
index acb8f5571522..d6e02b70a7cf 100644
--- a/drivers/perf/nvidia_t410_cmem_latency_pmu.c
+++ b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
@@ -435,12 +435,12 @@ static struct attribute_group cmem_lat_pmu_identifier_attr_group = {
 
 /* Format attributes. */
 
-#define NV_PMU_EXT_ATTR(_name, _func, _config)			\
-	(&((struct dev_ext_attribute[]){				\
-		{							\
-			.attr = __ATTR(_name, 0444, _func, NULL),	\
-			.var = (void *)_config				\
-		}							\
+#define NV_PMU_EXT_ATTR(_name, _func, _config)					\
+	(&((struct dev_ext_attribute[]){					\
+		{								\
+			.attr = __DEVICE_ATTR(_name, 0444, _func, NULL),	\
+			.var = (void *)_config					\
+		}								\
 	})[0].attr.attr)
 
 static struct attribute *cmem_lat_pmu_formats[] = {
diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 66e6cabd6fff..d5aa6ace847a 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -609,10 +609,10 @@ static void qcom_l3_cache__event_read(struct perf_event *event)
 
 /* formats */
 
-#define L3CACHE_PMU_FORMAT_ATTR(_name, _config)				      \
-	(&((struct dev_ext_attribute[]) {				      \
-		{ .attr = __ATTR(_name, 0444, device_show_string, NULL),      \
-		  .var = (void *) _config, }				      \
+#define L3CACHE_PMU_FORMAT_ATTR(_name, _config)				        \
+	(&((struct dev_ext_attribute[]) {				        \
+		{ .attr = __DEVICE_ATTR(_name, 0444, device_show_string, NULL), \
+		  .var = (void *) _config, }				        \
 	})[0].attr.attr)
 
 static struct attribute *qcom_l3_cache_pmu_formats[] = {
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index 33b5497bdc06..3f23611fd4c7 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -164,7 +164,7 @@ enum xgene_pmu_dev_type {
  */
 #define XGENE_PMU_FORMAT_ATTR(_name, _config)		\
 	(&((struct dev_ext_attribute[]) {		\
-		{ .attr = __ATTR(_name, S_IRUGO, device_show_string, NULL), \
+		{ .attr = __DEVICE_ATTR(_name, S_IRUGO, device_show_string, NULL), \
 		  .var = (void *) _config, }		\
 	})[0].attr.attr)
 

-- 
2.55.0


