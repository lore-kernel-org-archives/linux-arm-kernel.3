Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D67CCA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wqOqGEd782WLPUVDTcc7k5RXTuvfeHelG9nAk1RIVc=; b=Ib5UhrrVsCFKgUIoXYvfUqbgcU
	HCt7ztjt6abCEElH7IhKDQl21DIHumG0IPPOJ2S2y6B/cczhCpOTzc2+nmIEWBxwoOcp6B1574PTA
	/0QzHwGM/L5gJr0kJ9WCImWCuuuvu1d8kaJ3A2ey1N7m2Oxa/rnSehTJu7kXr+084upKwwFCagpHd
	tYQpjuMT59WzfvXsN1bEMnwITzcf80HkizrFINzbZuEwDi7gwo2wQYaz7GXrAU62lF2yaxawnijiZ
	isoY21r6Hb59gnBu9qGj9NLYozcAbWO38ZB8RmUg3i8pxvJ2qtrPJUHGGz5er/WWlHMqqL2LHccy6
	6SniXJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugVE-00000005Qxh-22AU;
	Sat, 06 Sep 2025 00:10:00 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZ9Z-000000033P0-2RmB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 16:19:11 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cJM2m72SLz6L51Z;
	Sat,  6 Sep 2025 00:18:08 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 2C8B1140159;
	Sat,  6 Sep 2025 00:19:08 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.202.66.105) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 5 Sep 2025 18:19:05 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <coresight@lists.linaro.org>, <dianders@chromium.org>,
	<james.clark@linaro.org>, <jonathan.cameron@huawei.com>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<robh@kernel.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<suzuki.poulose@arm.com>
Subject: [PATCH v4 1/6] of: add infra for finding CPU id from phandle
Date: Fri, 5 Sep 2025 17:18:24 +0100
Message-ID: <20250905161830.37-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905161830.37-1-alireza.sanaee@huawei.com>
References: <20250905161830.37-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.202.66.105]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_091909_918411_9029B928 
X-CRM114-Status: GOOD (  18.64  )
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

Get CPU ID from phandle. Some drivers such as coresight, cti-coresight,
or arm-dsu use this API for finding CPU node in DT. In particular,
drivers do this by getting the CPU device_node through a phandle and
then find the CPU ID using of_cpu_node_to_id(). This commit encapsulates
CPU node finding and improves readability.

The interface takes three parameters, 1) node, 2) pointer to
pointer of CPU node, 3) CPU node index. API sets the pointer to the CPU
node and allows the driver to work with the CPU node, for logging
purposes for instance.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/of/cpu.c   | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index 5214dc3d05ae..9e0d3ec10bc2 100644
--- a/drivers/of/cpu.c
+++ b/drivers/of/cpu.c
@@ -173,6 +173,54 @@ int of_cpu_node_to_id(struct device_node *cpu_node)
 }
 EXPORT_SYMBOL(of_cpu_node_to_id);
 
+/**
+ * of_cpu_phandle_to_id: Get the logical CPU number for a given device_node
+ *
+ * @node: Pointer to the device_node containing CPU phandle.
+ * @cpu_np: Pointer to the device_node for CPU.
+ * @cpu_idx: The index of the CPU in the list of CPUs.
+ *
+ * *cpu_np is only set when cpu_np is not NULL.  Use of_node_put() to release
+ * the node reference if cpu_np != NULL and this function succeeds.
+ *
+ * Return: This function has three different possible return situations:
+ *	1) returns -EINVAL if the node is NULL.
+ *	2) returns -ENODEV if the CPU node is not found or of_cpu_node_to_id is
+ *	not successful.
+ *	3) returns the logical CPU number if the CPU node is found.
+ */
+int of_cpu_phandle_to_id(const struct device_node *node,
+			 struct device_node **cpu_np,
+			 uint8_t cpu_idx)
+{
+	struct device_node *local_cpu_node = NULL;
+	int cpu;
+
+	if (!node)
+		return -EINVAL;
+
+	if (cpu_idx == 0)
+		local_cpu_node = of_parse_phandle(node, "cpu", 0);
+	if (!local_cpu_node)
+		local_cpu_node = of_parse_phandle(node, "cpus", cpu_idx);
+	if (!local_cpu_node)
+		return -ENODEV;
+
+	cpu = of_cpu_node_to_id(local_cpu_node);
+	if (cpu < 0) {
+		of_node_put(local_cpu_node);
+		return cpu;
+	}
+
+	if (cpu_np)
+		*cpu_np = local_cpu_node;
+	else
+		of_node_put(local_cpu_node);
+
+	return cpu;
+}
+EXPORT_SYMBOL(of_cpu_phandle_to_id);
+
 /**
  * of_get_cpu_state_node - Get CPU's idle state node at the given index
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index a62154aeda1b..717e55065d99 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -365,6 +365,8 @@ extern const void *of_get_property(const struct device_node *node,
 extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
 extern struct device_node *of_cpu_device_node_get(int cpu);
 extern int of_cpu_node_to_id(struct device_node *np);
+extern int of_cpu_phandle_to_id(const struct device_node *np,
+				struct device_node **cpu_np, uint8_t cpu_idx);
 extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
 extern struct device_node *of_get_cpu_state_node(const struct device_node *cpu_node,
 						 int index);
@@ -680,6 +682,13 @@ static inline int of_cpu_node_to_id(struct device_node *np)
 	return -ENODEV;
 }
 
+static inline int of_cpu_phandle_to_id(const struct device_node *np,
+				       struct device_node **cpu_np,
+				       uint8_t cpu_idx)
+{
+	return -ENODEV;
+}
+
 static inline struct device_node *of_get_next_cpu_node(struct device_node *prev)
 {
 	return NULL;
-- 
2.43.0


