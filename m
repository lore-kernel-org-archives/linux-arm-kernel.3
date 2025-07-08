Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067FFC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EaJ1fLYBLvpg3OStzXs/gfarJKvDbv71vAMyWlLZmvc=; b=4wLrvjQNXTiNhxJdd4ZjIwDhjs
	aAeYreX5luo3PfR+wPRwLrdpqAiJoM7A/syjuw39Mpz2Kvmkz2pb9Rqamec6edxkM5yBvLRoldNQF
	BOcbQljU3Tn9aJc1bpiH7OyMGAkTqdBmP/3V0q5TF3i/uy5E4o0mEYY3XeeI2rShN3w1Tmw3lqPvN
	J867Y8KWGkR1UVLUF0dn3UJojbwhNBbb8tugVz4HWydMm6MgezSh8GGrJh2eZoz7gNy1jCMYdZtW0
	XVSm9zDbEnKBJvc2nMdhXJEyiiORCrwKRzvLuc5A5EFwDZH7CoO9BwLIA9LyfrkMaofPMQwVjV7hF
	F2JjRmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA75-00000005lhY-3HdN;
	Tue, 08 Jul 2025 15:20:07 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZA2j-00000005kRk-40p8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 15:15:39 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bc4NB4r7hz6D8gg;
	Tue,  8 Jul 2025 23:12:26 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 849261402A5;
	Tue,  8 Jul 2025 23:15:36 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 8 Jul 2025 17:15:35 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <krzk@kernel.org>, <robh@kernel.org>
CC: <coresight@lists.linaro.org>, <devicetree@vger.kernel.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>,
	<jonathan.cameron@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>, <mike.leach@linaro.org>,
	<ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 1/5] of: add infra for finding CPU id from phandle
Date: Tue, 8 Jul 2025 16:14:58 +0100
Message-ID: <20250708151502.561-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708151502.561-1-alireza.sanaee@huawei.com>
References: <20250708151502.561-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_081538_277237_700D20AA 
X-CRM114-Status: GOOD (  17.21  )
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

Get CPU id from phandle. Many drivers get do this by getting hold of CPU
node first through a phandle and then find the CPU ID using the relevant
function. This commit encapsulates cpu node finding and improves
readability.

The API interface requires two parameters, 1) node, 2) pointer to
pointer of CPU node, 3) cpu node index. API sets the pointer to the CPU
node and allows the driver to play with the CPU itself, for logging
purposes for instance.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/of/cpu.c   | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index 5214dc3d05ae..494d47470f94 100644
--- a/drivers/of/cpu.c
+++ b/drivers/of/cpu.c
@@ -173,6 +173,46 @@ int of_cpu_node_to_id(struct device_node *cpu_node)
 }
 EXPORT_SYMBOL(of_cpu_node_to_id);
 
+/**
+ * of_cpu_phandle_to_id: Get the logical CPU number for a given device_node
+ *
+ * @node: Pointer to the device_node containing CPU phandle.
+ * @cpu_np: Pointer to the device_node for CPU.
+ * @cpu_idx: The index of the CPU in the list of CPUs.
+ *
+ * Return: The logical CPU number of the given CPU device_node or -ENODEV if
+ * the CPU is not found, or if the node is NULL, it returns -1. On success,
+ * cpu_np will always point to the retrieved CPU device_node with refcount
+ * incremented, use of_node_put() on it when done.
+ */
+int of_cpu_phandle_to_id(const struct device_node *node,
+			 struct device_node **cpu_np,
+			 uint8_t cpu_idx)
+{
+	struct device_node *local_cpu_node;
+	int cpu;
+
+	if (!node)
+		return -1;
+
+	local_cpu_node = of_parse_phandle(node, "cpu", 0);
+	if (!local_cpu_node)
+		local_cpu_node = of_parse_phandle(node, "cpus", cpu_idx);
+
+	if (!local_cpu_node)
+		return -ENODEV;
+
+	cpu = of_cpu_node_to_id(local_cpu_node);
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


