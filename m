Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC566C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDsf1xNr2AkYRENv7eJrAIHxeW+ubiP0N6KggGEIn/k=; b=QmC1cgQ/yHvUkT1Z2Xo6c6Ezsw
	Ihlkxu9xYNi7/dMJllzBwta/3yEHB5AeUcmyEmVJb/u2/ykmlT/u4EdXBZHT5JvuB90rKwdU+xoF8
	hkNX498vQxz5MbsV2KRBm3bIONNIWVwtX+6UdDEDE3ZiMGDXkrg8rGErsDwaj3H6QRX0YDiO4We/d
	UlwlsfJ5a9n/cHHBv7MXpCb2firwsYN21iBRUPW2Sq1q55kgLNUastFn2dyrnzAA1D3gLyO71/EMT
	QbBspVA/lnMdqec1IKcEvQWkTgU+fYkZ1dCLdHNYPxVsk+QqLgzWOBwoKjcfqcWMMTF34USqyXHd2
	KXAUD6sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOSd-00000008jpB-25V2;
	Mon, 12 May 2025 08:24:31 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOFc-00000008hmx-3Un3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 08:11:06 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zwscv1Lntz6M4gh;
	Mon, 12 May 2025 16:06:23 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id BE8E41402F4;
	Mon, 12 May 2025 16:11:01 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.30.10) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 May 2025 10:11:00 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
Subject: [PATCH v3 7/7] of: of_cpu_phandle_to_id to support SMT threads
Date: Mon, 12 May 2025 09:07:15 +0100
Message-ID: <20250512080715.82-8-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512080715.82-1-alireza.sanaee@huawei.com>
References: <20250512080715.82-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.30.10]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_011105_153405_B7E03DA0 
X-CRM114-Status: GOOD (  19.00  )
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
Cc: mark.rutland@arm.com, robh@kernel.org, dianders@chromium.org, gshan@redhat.com, saravanak@google.com, suzuki.poulose@arm.com, catalin.marinas@arm.com, james.clark@linaro.org, linuxarm@huawei.com, shameerali.kolothum.thodi@huawei.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ruanjinjie@huawei.com, krzk@kernel.org, jonathan.cameron@huawei.com, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, mike.leach@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Enhance the API to support SMT threads, this will allow sharing
resources among multiple SMT threads.

Enabled the sharing of resources, such as L1 Cache and clocks, between
SMT threads. It introduces a fix that uses thread IDs to match each CPU
thread in the register array within the cpu-node. This ensures that the
cpu-map or any driver relying on this API is fine even when SMT threads
share resources.

Additionally, I have tested this for CPU based on the discussions in
[1], I adopted the new cpu-map layout, where the first parameter is a
phandle and the second is the local thread index, as shown below:

    core0 {
      thread0 {
        cpu = <&cpu0 0>;
      };
      thread1 {
        cpu = <&cpu0 1>;
      };
    };

Also, there are devices such as below that are a bit different.

    arm_dsu@0 {
      compatible = "arm,dsu";
      cpus = <&cpu0 &cpu1 &cpu2 &cpu3>;
    }

In these cases, we can also point to a CPU thread as well like the
following:

    arm_dsu@0 {
      compatible = "arm,dsu";
        cpus = <&cpu0 5 &cpu1 9 &cpu2 1 &cpu3 0>;
    }

It should be possible to know how many arguments a phandle might
require, and this information is encoded in another variable in the dt
called #cpu-cells in cpu node.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>

[1] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/
---
 drivers/of/cpu.c | 41 +++++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index fba17994fc20..cf54ef47f029 100644
--- a/drivers/of/cpu.c
+++ b/drivers/of/cpu.c
@@ -189,16 +189,41 @@ int of_cpu_phandle_to_id(const struct device_node *node,
 			 struct device_node **cpu_np,
 			 uint8_t cpu_idx)
 {
+	bool found = false;
+	int cpu, ret = -1, i, j;
+	uint32_t local_thread, thread_index;
+	struct device_node *np;
+	struct of_phandle_args args;
+	static const char * const phandle_names[] = { "cpus", "cpu" };
+	static const char * const cpu_cells[] = { "#cpu-cells", NULL };
+
 	if (!node)
-		return -1;
+		return ret;
 
-	*cpu_np = of_parse_phandle(node, "cpu", 0);
-	if (!*cpu_np)
-		*cpu_np = of_parse_phandle(node, "cpus", cpu_idx);
-			if (!*cpu_np)
-				return -ENODEV;
+	for (i = 0; i < ARRAY_SIZE(phandle_names); i++) {
+		for (j = 0; j < ARRAY_SIZE(cpu_cells); j++) {
+			ret = of_parse_phandle_with_args(node, phandle_names[i],
+							 cpu_cells[j], cpu_idx,
+							 &args);
+				if (ret >= 0)
+					goto success;
+		}
+	}
 
-	return of_cpu_node_to_id(*cpu_np);
+	if (ret < 0)
+		return ret;
+success:
+	*cpu_np = args.np;
+	thread_index = args.args_count == 1 ? args.args[0] : 0;
+	for_each_possible_cpu(cpu) {
+		np = of_get_cpu_node(cpu, &local_thread);
+		found = (*cpu_np == np) && (local_thread == thread_index);
+		of_node_put(np);
+		if (found)
+			return cpu;
+	}
+
+	return -ENODEV;
 }
 EXPORT_SYMBOL(of_cpu_phandle_to_id);
 
@@ -206,7 +231,7 @@ EXPORT_SYMBOL(of_cpu_phandle_to_id);
  * of_get_cpu_state_node - Get CPU's idle state node at the given index
  *
  * @cpu_node: The device node for the CPU
- * @index: The index in the list of the idle states
+g* @index: The index in the list of the idle states
  *
  * Two generic methods can be used to describe a CPU's idle states, either via
  * a flattened description through the "cpu-idle-states" binding or via the
-- 
2.34.1


