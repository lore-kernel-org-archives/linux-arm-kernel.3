Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F1DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ecwP5WHA6qxJmIynC9kNzInQHmacZTdmNCoZ5D+pPCM=; b=kDfjLM+hnT9oeDIF2ayMToeOpI
	2wL/NvZUvtSD2A01VQkpZU8TawFmHgQnSgoSahWKE6K5FsPh2TGzRFVpPqhNXKCZibA6ugqjjjAvZ
	0pBmXk0MgVIy0wVgcLyVKXHjakyfUMz6ninzBPXoRBXh0DZ5OAFvv+2+aqdZbVAYuttiHfWUkTj/q
	gWJYQeSZlg8bSOlbWggXRg4/+HlkjDpqrBOTmF5bQ2+Zap6n7F44r1HwYo6EkURACTvugV0WYns9Y
	nsZpRqlxFTKLrz8wJA/xx6dCUBqrPirqlfGs9wmLRICph4CYWJ5FprdMYKlSU7+3ktp8N3W/ekuMy
	rBNM9Zkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AHy-00000006d8A-1gp0;
	Tue, 22 Apr 2025 09:51:38 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79En-00000006P1Y-3CFe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:44:19 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZhbMs6ydyz6L530;
	Tue, 22 Apr 2025 16:42:33 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B2A51401F3;
	Tue, 22 Apr 2025 16:44:13 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.65.221) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Apr 2025 10:44:13 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree-spec@vger.kernel.org>
CC: <robh@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>
Subject: [PATCH v1 1/5] DT: add infra for finding CPU id from phandle.
Date: Tue, 22 Apr 2025 09:43:36 +0100
Message-ID: <20250422084340.457-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250422084340.457-1-alireza.sanaee@huawei.com>
References: <20250422084340.457-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.65.221]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_014418_118065_5C02550E 
X-CRM114-Status: GOOD (  17.01  )
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
function. This commit encapsulates cpu node finding and making driver
code easier to cleaner.

The API interface requires three parameters, 1) node, 2) pointer to CPU
node, and 3) property which includes the phandle. API sets the pointer
to the CPU node and allows the driver to play with the CPU itself, for
logging purposes for instance.
---
 drivers/of/cpu.c   | 40 ++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h |  3 +++
 2 files changed, 43 insertions(+)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index 5214dc3d05ae..c2d729999a4e 100644
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
+ * @prop: String of property holding the phandle.
+ *
+ * Return: The logical CPU number of the given CPU device_node or -ENODEV if
+ * the CPU is not found. If the property is not found, it returns -1. On
+ * success, cpu_np will always point to the retrieved CPU device_node.
+ */
+int of_cpu_phandle_to_id(const struct device_node *node,
+			 const struct device_node *cpu_np,
+			 const char * prop)
+{
+	bool found = false;
+	int cpu, ret;
+	struct device_node *np;
+	struct of_phandle_args args;
+
+	if (!node || !prop)
+		return -1;
+
+	ret = of_parse_phandle_with_args(node, prop, NULL, 0, &args);
+	if (ret < 0)
+		return ret;
+
+	cpu_np = args.np;
+	for_each_possible_cpu(cpu) {
+		np = of_cpu_device_node_get(cpu);
+		found = (cpu_np == np);
+		of_node_put(np);
+		if (found)
+			return cpu;
+	}
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL(of_cpu_phandle_to_id);
+
 /**
  * of_get_cpu_state_node - Get CPU's idle state node at the given index
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index eaf0e2a2b75c..5e51e57478b1 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -360,6 +360,9 @@ extern const void *of_get_property(const struct device_node *node,
 extern struct device_node *of_get_cpu_node(int cpu, unsigned int *thread);
 extern struct device_node *of_cpu_device_node_get(int cpu);
 extern int of_cpu_node_to_id(struct device_node *np);
+extern int of_cpu_phandle_to_id(const struct device_node *np,
+				const struct device_node *cpu_np,
+				const char *propname);
 extern struct device_node *of_get_next_cpu_node(struct device_node *prev);
 extern struct device_node *of_get_cpu_state_node(const struct device_node *cpu_node,
 						 int index);
-- 
2.43.0


