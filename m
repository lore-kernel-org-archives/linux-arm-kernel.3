Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44B8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QgjH/oq+9TaQCgHaubBz/L/lufD2PpLp+kJALrlt93s=; b=TieUZnsOMllC+nTyWgBQuxMD5I
	XpqWDaqsiMtKV3MLVpIVXY+2eTBi6WvmvWAP2bF7756jvSypEXWl4GN/mjDU3epd5utnAT53/86p4
	AECWw6R1dAEtZTFDjt9ADlTDo/QZgrjRGBAoWlwSxWQBBpbiX9+xFcjmQCuWGZNN5xMt8FDdx+RVp
	/NJUA6bBAIZddW4ucOg0nFAIK304IHf2RzaT4kETNK399IMri/yy93nqyNPtbg3R3WFGhnW8QhOjF
	gYGBwH+IUlta57EkCRFpkAj6yCQbI64QYe1bKDwmLnTNWp799vvMX+wan0wOjmzu3qh+ZFWJe3bj9
	z/Os8TQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHnf-0000000GE8f-0veT;
	Fri, 10 Jan 2025 16:23:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHbU-0000000GANP-0CTo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 16:11:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QgjH/oq+9TaQCgHaubBz/L/lufD2PpLp+kJALrlt93s=; b=ONseZzfN3csdcsBx/5n9AWysVA
	atBuWgO4H1Hg+oXDNhPMCVGRlapG7I8K5cN1yxT/xjR0tTeGH1Cl27hNpTwwC0zVYZSp6jZntJWC7
	xM1noRCUwIzw0750tEh0Pmf6WzgbLqAAokJ1BKA9/dPNLXWy2XaJuyY19Re1hDpR0Le9pSHLssCUG
	vr1FTKkknRQqEoEGqSPgDbE0E82qAx7gy6mdbx1SxyYs98fCohN7QKqc73fbMjI4+w/EXkQRfyIj4
	KQIRxplxuipYDVGmrhsELGO4FmnbdEeQmdhgBthFYGrdicL9Hun6862Nk6Ffhzhge/hCyhn2oSpsZ
	0Eweh3CQ==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHbQ-00000009pxT-3QsV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:11:18 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YV66w15Tmz6L4xp;
	Sat, 11 Jan 2025 00:09:44 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id DDA1A1401DC;
	Sat, 11 Jan 2025 00:10:58 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 10 Jan 2025 17:10:58 +0100
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <linuxarm@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@Huawei.com>,
	<jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH] arm64: of: handle multiple threads in ARM cpu node
Date: Fri, 10 Jan 2025 16:10:57 +0000
Message-ID: <20250110161057.445-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_161117_179326_15027F6B 
X-CRM114-Status: GOOD (  16.38  )
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

Update `of_parse_and_init_cpus` to parse reg property of CPU node as
an array based as per spec for SMT threads.

Spec v0.4 Section 3.8.1:
The value of reg is a <prop-encoded-**array**> that defines a unique
CPU/thread id for the CPU/threads represented by the CPU node.  **If a CPU
supports more than one thread (i.e.  multiple streams of execution) the
reg property is an array with 1 element per thread**.  The address-cells
on the /cpus node specifies how many cells each element of the array
takes. Software can determine the number of threads by dividing the size
of reg by the parent node's address-cells.

An accurate example of 1 core with 2 SMTs:

	cpus {
		#size-cells = <0x00>;
		#address-cells = <0x01>;

		cpu@0 {
			phandle = <0x8000>;
			**reg = <0x00 0x01>;**
			enable-method = "psci";
			compatible = "arm,cortex-a57";
			device_type = "cpu";
		};
	};

Instead of:

	cpus {
		#size-cells = <0x00>;
		#address-cells = <0x01>;

		cpu@0 {
			phandle = <0x8000>;
			reg = <0x00>;
			enable-method = "psci";
			compatible = "arm,cortex-a57";
			device_type = "cpu";
		};

		cpu@1 {
			phandle = <0x8001>;
			reg = <0x01>;
			enable-method = "psci";
			compatible = "arm,cortex-a57";
			device_type = "cpu";
		};
	};

which is **NOT** accurate.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 arch/arm64/kernel/smp.c | 74 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3b3f6b56e733..8dd3b3c82967 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -689,53 +689,61 @@ static void __init acpi_parse_and_init_cpus(void)
 static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
+	u64 hwid;
+	u32 tid;
 
 	for_each_of_cpu_node(dn) {
-		u64 hwid = of_get_cpu_hwid(dn, 0);
+		tid = 0;
 
-		if (hwid & ~MPIDR_HWID_BITMASK)
-			goto next;
+		while (1) {
+			hwid = of_get_cpu_hwid(dn, tid++);
+			if (hwid == ~0ULL)
+				break;
 
-		if (is_mpidr_duplicate(cpu_count, hwid)) {
-			pr_err("%pOF: duplicate cpu reg properties in the DT\n",
-				dn);
-			goto next;
-		}
+			if (hwid & ~MPIDR_HWID_BITMASK)
+				goto next;
 
-		/*
-		 * The numbering scheme requires that the boot CPU
-		 * must be assigned logical id 0. Record it so that
-		 * the logical map built from DT is validated and can
-		 * be used.
-		 */
-		if (hwid == cpu_logical_map(0)) {
-			if (bootcpu_valid) {
-				pr_err("%pOF: duplicate boot cpu reg property in DT\n",
-					dn);
+			if (is_mpidr_duplicate(cpu_count, hwid)) {
+				pr_err("%pOF: duplicate cpu reg properties in the DT\n",
+				       dn);
 				goto next;
 			}
 
-			bootcpu_valid = true;
-			early_map_cpu_to_node(0, of_node_to_nid(dn));
-
 			/*
-			 * cpu_logical_map has already been
-			 * initialized and the boot cpu doesn't need
-			 * the enable-method so continue without
-			 * incrementing cpu.
+			 * The numbering scheme requires that the boot CPU
+			 * must be assigned logical id 0. Record it so that
+			 * the logical map built from DT is validated and can
+			 * be used.
 			 */
-			continue;
-		}
+			if (hwid == cpu_logical_map(0)) {
+				if (bootcpu_valid) {
+					pr_err("%pOF: duplicate boot cpu reg property in DT\n",
+					       dn);
+					goto next;
+				}
+
+				bootcpu_valid = true;
+				early_map_cpu_to_node(0, of_node_to_nid(dn));
+
+				/*
+				 * cpu_logical_map has already been
+				 * initialized and the boot cpu doesn't need
+				 * the enable-method so continue without
+				 * incrementing cpu.
+				 */
+				continue;
+			}
 
-		if (cpu_count >= NR_CPUS)
-			goto next;
+			if (cpu_count >= NR_CPUS)
+				goto next;
 
-		pr_debug("cpu logical map 0x%llx\n", hwid);
-		set_cpu_logical_map(cpu_count, hwid);
+			pr_debug("cpu logical map 0x%llx\n", hwid);
+			set_cpu_logical_map(cpu_count, hwid);
 
-		early_map_cpu_to_node(cpu_count, of_node_to_nid(dn));
+			early_map_cpu_to_node(cpu_count, of_node_to_nid(dn));
 next:
-		cpu_count++;
+			cpu_count++;
+		}
 	}
 }
 
-- 
2.43.0


