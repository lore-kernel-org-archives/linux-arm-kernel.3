Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E877C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrBAVN7TPogM6Ez3Z6qwzVYgIKsMP0dcus0ugWTNikE=; b=ywj4uffSiXv1qLa+StOKtMm4zV
	KFV7UT/aO3upgYNJzGl3jw4FikeUVTgcchkV1D8X2mU1MtvcxWM54CxJtAn2PL+qXK5wPsRq4TtzN
	i1X6JgE6umtzsWQt0yk+f3Tr47Z3VHmYKV8p8Eb6Kih3P9F8tMVJq98ujI3EmwC7Glo+HMba4LCvA
	YDO8At28jzL0e917v2J2PnECDlJmNGqWJkaob0SGutU5RWL/pzGiEqnWK9zJD2gJmzE2xf2qR+gJo
	+ZsG5jmjKfOSNmdIfo//Uq5TDfC6caU+jbVFWs2tkh+WUobQHoduk/60JjvZ8VSh416DH4w63nbqv
	2MGw3MUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnVN-00000002or6-1gVz;
	Mon, 07 Jul 2025 15:11:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnOv-00000002nub-2igM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:05:03 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bbSBG4Nw9z6L5PX;
	Mon,  7 Jul 2025 23:01:42 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 9A5AC1402EE;
	Mon,  7 Jul 2025 23:04:49 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.45.147.207) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Jul 2025 17:04:48 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <mark.rutland@arm.com>, <robh@kernel.org>
CC: <coresight@lists.linaro.org>, <devicetree@vger.kernel.org>,
	<dianders@chromium.org>, <james.clark@linaro.org>,
	<jonathan.cameron@huawei.com>, <krzk@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linuxarm@huawei.com>,
	<mike.leach@linaro.org>, <ruanjinjie@huawei.com>, <saravanak@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <suzuki.poulose@arm.com>
Subject: [PATCH 1/5] of: add infra for finding CPU id from phandle
Date: Mon, 7 Jul 2025 16:04:10 +0100
Message-ID: <20250707150414.620-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707150414.620-1-alireza.sanaee@huawei.com>
References: <20250707150414.620-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.45.147.207]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_080501_970870_EB0E653B 
X-CRM114-Status: GOOD (  16.39  )
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

The API interface requires two parameters, 1) node, 2) pointer to CPU
node. API sets the pointer to the CPU node and allows the driver to play
with the CPU itself, for logging purposes for instance.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/of/cpu.c   | 29 +++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index 5214dc3d05ae..fba17994fc20 100644
--- a/drivers/of/cpu.c
+++ b/drivers/of/cpu.c
@@ -173,6 +173,35 @@ int of_cpu_node_to_id(struct device_node *cpu_node)
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
+	if (!node)
+		return -1;
+
+	*cpu_np = of_parse_phandle(node, "cpu", 0);
+	if (!*cpu_np)
+		*cpu_np = of_parse_phandle(node, "cpus", cpu_idx);
+			if (!*cpu_np)
+				return -ENODEV;
+
+	return of_cpu_node_to_id(*cpu_np);
+}
+EXPORT_SYMBOL(of_cpu_phandle_to_id);
+
 /**
  * of_get_cpu_state_node - Get CPU's idle state node at the given index
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index eaf0e2a2b75c..194f1cb0f6c6 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -360,6 +360,8 @@ extern const void *of_get_property(const struct device_node *node,
 extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
 extern struct device_node *of_cpu_device_node_get(int cpu);
 extern int of_cpu_node_to_id(struct device_node *np);
+extern int of_cpu_phandle_to_id(const struct device_node *np,
+				struct device_node **cpu_np, uint8_t cpu_idx);
 extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
 extern struct device_node *of_get_cpu_state_node(const struct device_node *cpu_node,
 						 int index);
@@ -662,6 +664,13 @@ static inline int of_cpu_node_to_id(struct device_node *np)
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


