Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE9DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 10:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x5YVwar/PDY9Yr+18QumzLlM58z0UJNSKEIcichTNH0=; b=Dazc+iEWq5osG2FFL5bu/r5FXC
	9dsH5kmcKAYyv9blzXMrbkTMaNCh7sW7TI9yodzJXbdaivJjWvYe0Rh0NMaMQJK6NxPhqrrzqeMbW
	4ZGX8wZVIo5GRhQ2FfO27dDpziq2vB/D0N89N+A7zByqjyW93c7O/mL9wjRJYGLOFL7e9FPSsWY86
	T73Ddbg6bFLH62khQcvNKdrJC6R1tOs6MiVphE3BtovMZZ7njMKeLJG4UiOt5aE+WcUXI3c23vv1J
	Jis822r8jmbnpobImavgHEBpHefsHCf89i1akNBVFzKxPKy0oKyKbm3OdUtB+fyOtErDBf8t2ucM2
	Hf+lJo6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7AWi-00000006g5b-3ZL1;
	Tue, 22 Apr 2025 10:06:52 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79Gy-00000006PZu-374H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:46:34 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZhbQR5kGNz6FCB6;
	Tue, 22 Apr 2025 16:44:47 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 7195A1402F3;
	Tue, 22 Apr 2025 16:46:27 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.65.221) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Apr 2025 10:46:26 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree-spec@vger.kernel.org>
CC: <robh@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
	<linuxarm@huawei.com>
Subject: [PATCH v1 5/5] DT: of_cpu_phandle_to_id to support SMT threads
Date: Tue, 22 Apr 2025 09:43:40 +0100
Message-ID: <20250422084340.457-6-alireza.sanaee@huawei.com>
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
X-CRM114-CacheID: sfid-20250422_014632_927588_F59A6974 
X-CRM114-Status: GOOD (  15.27  )
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

Enhance the API to support SMT threads, this will allow sharing resources among
multiple SMT threads.

Enabled the sharing of resources, such as L1 Cache and clocks, between SMT
threads. It introduces a fix that uses thread IDs to match each CPU thread in
the register array within the cpu-node. This ensures that the cpu-map or any
driver relying on this API is fine even when SMT threads share resources.

Additionally, I have tested this for CPU based on the discussions in [1], I
adopted the new cpu-map layout, where the first parameter is a phandle and the
second is the local thread index, as shown below:

Used a new variable in CPU node "#cpu-cells", in which I describe the
number of parameters when parsing the phandle with arg to find the local
thread ID. This variable is not mandatory, and is indeed
backward-compatible.  The API first look for this particular variable,
if it does not exists, it just assume thread 0, which is the existing approach.

    core0 {
      thread0 {
        cpu = <&cpu0 0>;
      };
      thread1 {
        cpu = <&cpu0 1>;
      };
    };

[1] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/of/cpu.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index c2d729999a4e..2df07aea184e 100644
--- a/drivers/of/cpu.c
+++ b/drivers/of/cpu.c
@@ -189,21 +189,26 @@ int of_cpu_phandle_to_id(const struct device_node *node,
 			 const char * prop)
 {
 	bool found = false;
-	int cpu, ret;
+	int cpu, ret = -1;
+	uint32_t local_thread, thread_index;
 	struct device_node *np;
 	struct of_phandle_args args;
 
 	if (!node || !prop)
-		return -1;
-
-	ret = of_parse_phandle_with_args(node, prop, NULL, 0, &args);
-	if (ret < 0)
 		return ret;
 
+	ret = of_parse_phandle_with_args(node, prop, "#cpu-cells", 0, &args);
+	if (ret < 0) {
+		ret = of_parse_phandle_with_args(node, prop, NULL, 0, &args);
+		if (ret < 0)
+			return ret;
+	}
+
 	cpu_np = args.np;
+	thread_index = args.args_count == 1 ? args.args[0] : 0;
 	for_each_possible_cpu(cpu) {
-		np = of_cpu_device_node_get(cpu);
-		found = (cpu_np == np);
+		np = of_get_cpu_node(cpu, &local_thread);
+		found = (cpu_np == np) && (local_thread == thread_index);
 		of_node_put(np);
 		if (found)
 			return cpu;
-- 
2.43.0


