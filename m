Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2090C3ABB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysAEBRSwDyEXQZWyau7lTYH1QvtI2slNhlJvKDKIA3s=; b=n/6YJHQ+EEuhe5WFnAs4UIIbTi
	2XPXgApXvZMrVq1qomeBevYvu73sAXM03ZFr+RjLQTSAcseU2XXjEYMuouu8VLrGUmepWvVo3L9vR
	8r9EUryAUvTm0AqSkT281yaHVxzOjKVZv2VFkLMbqH6OFZ++x26IpxVwK2t9esYWVrmYLa6VTLWky
	i3AFAItMU9EHC5YdKIwqwg+jc7xF0fzgI7Ua+FxA+QuP57JoK8eng44dMu8QPeSsofgb7N0BnhNSP
	CijMVSR8slp7z1aB6WThSZvMWNSOKiS21OMhbyTB5ymh54CxGY4GEi6lFXYX3xp4ifRTgS7YbATrR
	JFPAFCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6D-00000002dlB-2oHk;
	Fri, 02 May 2025 17:22:57 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAt3s-00000002TcS-2BzO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:16:32 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zpwst4H8jz6M4Wn;
	Sat,  3 May 2025 00:12:02 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id CB5CE140370;
	Sat,  3 May 2025 00:16:25 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.77.180) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 18:16:24 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
CC: <robh@kernel.org>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Date: Fri, 2 May 2025 17:13:00 +0100
Message-ID: <20250502161300.1411-7-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502161300.1411-1-alireza.sanaee@huawei.com>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.77.180]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_091630_996843_18229F9A 
X-CRM114-Status: GOOD (  15.21  )
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

In the CPU map, there are two cases that only one occurs at at time.
    1) "cpu" = <phandle>
    2) "cpus" = <phandle> <index>

The first case addresses non-SMTs and the second case addresses SMTs
that the variable must be cpu(s) with an index where we later look up
the reg array with that.

    core0 {
      thread0 {
        cpus = <&cpu0 0>;
      };
      thread1 {
        cpus = <&cpu0 1>;
      };
    };

[1] https://lore.kernel.org/devicetree-spec/CAL_JsqK1yqRLD9B+G7UUp=D8K++mXHq0Rmv=1i6DL_jXyZwXAw@mail.gmail.com/

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 drivers/of/cpu.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/of/cpu.c b/drivers/of/cpu.c
index 1e8d1fa04d3c..fbd3f6d4a87f 100644
--- a/drivers/of/cpu.c
+++ b/drivers/of/cpu.c
@@ -186,14 +186,41 @@ EXPORT_SYMBOL(of_cpu_node_to_id);
 int of_cpu_phandle_to_id(const struct device_node *node,
 			 struct device_node **cpu_np)
 {
+	int cpu, ret;
+	bool found = false;
+	uint32_t local_thread, thread_index;
+	struct device_node *np;
+	struct of_phandle_args args;
+
 	if (!node)
 		return -1;
 
+	/*
+	 * Two cases which only one occurs at a time:
+	 * 1) cpu = <phandle>
+	 * 2) cpus = <phandle> <thread_index>
+	 */
 	*cpu_np = of_parse_phandle(node, "cpu", 0);
-	if (!cpu_np)
-		return -ENODEV;
+	if (!*cpu_np) {
+		ret = of_parse_phandle_with_fixed_args(node, "cpus", 1, 0,
+						       &args);
+		if (ret < 0)
+			return ret;
+
+		*cpu_np = args.np;
+		thread_index = args.args[0];
+		for_each_possible_cpu(cpu) {
+			np = of_get_cpu_node(cpu, &local_thread);
+			found = (*cpu_np == np) && (local_thread == thread_index);
+			of_node_put(np);
+			if (found)
+				return cpu;
+		}
 
-	return of_cpu_node_to_id(*cpu_np);
+		return -ENODEV;
+	} else {
+		return of_cpu_node_to_id(*cpu_np);
+	}
 }
 EXPORT_SYMBOL(of_cpu_phandle_to_id);
 
-- 
2.34.1


