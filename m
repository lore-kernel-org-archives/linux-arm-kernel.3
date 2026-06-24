Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4831CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8pD2niHhUSyKv0Sb+ifrbF6NQbVWcEj0IMgAAFDU/M=; b=JcLC99ufRdte1iuJpbxTbdEDR5
	6iHigdBBBz7vc/mNlo/z3C5+sYP+AU+FL7ruGk3huogWMSbNQKI6/PPzMxWnBT0yIoHw/iRmZbQqW
	cxriKb63DZVipy1Y4pPDt1xkDrUbdg+zIB1BSsAAdNfrN2TojLOyGyOzUd70KmehgUfa5bXjn9pSd
	TT2U2n2OwH459RvXehRZ6MhguRmVgvzPdDdiPZwzuCpjdj4T0qOclDEzGK2UoPp85QjNiPRULj0om
	s+y6URLXlQGcVuhWKccRnIBtrLysSKO44s3Tj1fbO5/+ZBFy5/lb0Z26CdTxQ7rqcNOx45LV6A6u3
	6m9Bemew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJsQ-00000007V55-0oKY;
	Wed, 24 Jun 2026 09:26:34 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJs3-00000007UlQ-0VCt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 09:26:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=j8pD2niHhUSyKv0Sb+ifrbF6NQbVWcEj0IMgAAFDU/M=;
	b=zxda6Md5vcpZojJF3DqKwYWE+YBuXYhT9SCZxJ2rJ5YZimt8Wd7I4YQ9D9tp6cyH58ULObgrh
	xSkLaOUklXRzo7ngwowV9Xxvlx6iPyp3Zh4Hi6jXBwSq6nhWJ9sbTPJBmLlwhywwi9dJ9N1iCQQ
	zwhWY7BfXStYLVB5L6Dqjik=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4glbt60tvyzRhSV;
	Wed, 24 Jun 2026 17:17:02 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 299BE40569;
	Wed, 24 Jun 2026 17:26:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 24 Jun
 2026 17:26:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <tsbogend@alpha.franken.de>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <peterz@infradead.org>,
	<kees@kernel.org>, <nathan@kernel.org>, <linusw@kernel.org>,
	<ojeda@kernel.org>, <david.kaplan@amd.com>, <lukas.bulwahn@redhat.com>,
	<ryan.roberts@arm.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <thuth@redhat.com>, <menglong8.dong@gmail.com>,
	<oupton@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<broonie@kernel.org>, <kevin.brodsky@arm.com>, <james.clark@linaro.org>,
	<yangyicong@hisilicon.com>, <tabba@google.com>, <osandov@fb.com>,
	<arnd@arndb.de>, <anshuman.khandual@arm.com>, <david@kernel.org>,
	<akpm@linux-foundation.org>, <ljs@kernel.org>, <dev.jain@arm.com>,
	<yang@os.amperecomputing.com>, <chaitanyas.prakash@arm.com>,
	<kprateek.nayak@amd.com>, <chenl311@chinatelecom.cn>,
	<sshegde@linux.ibm.com>, <thorsten.blum@linux.dev>,
	<chang.seok.bae@intel.com>, <tim.c.chen@linux.intel.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mips@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 07/12] arm64: cpu_ops: Make 'cpu_operations' pointer global instead of per-cpu
Date: Wed, 24 Jun 2026 17:25:32 +0800
Message-ID: <20260624092537.2916971-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260624092537.2916971-1-ruanjinjie@huawei.com>
References: <20260624092537.2916971-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_022611_502753_104D9AED 
X-CRM114-Status: GOOD (  14.58  )
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

From: Will Deacon <will@kernel.org>

'cpu_ops' is an NR_CPUS-length array of 'cpu_operations' pointers, which
theoretically allows for different CPUs to have different bringup and
hotplug backends.

In reality, this complexity exists only to deal with the case where CPU0
is not hotpluggable, so replace the array with a single, global pointer
and record separately whether or not they apply to the boot CPU. Update
the logic in init_cpu_ops() to enforce that only a single set of
'cpu_ops' is required.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/cpu_ops.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kernel/cpu_ops.c b/arch/arm64/kernel/cpu_ops.c
index e133011f64b5..eacfb88a0c0c 100644
--- a/arch/arm64/kernel/cpu_ops.c
+++ b/arch/arm64/kernel/cpu_ops.c
@@ -20,7 +20,8 @@ extern const struct cpu_operations acpi_parking_protocol_ops;
 #endif
 extern const struct cpu_operations cpu_psci_ops;
 
-static const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
+static const struct cpu_operations *cpu_ops __ro_after_init;
+static bool boot_cpu_has_enable_method __ro_after_init;
 
 static const struct cpu_operations *const dt_supported_cpu_ops[] __initconst = {
 	&smp_spin_table_ops,
@@ -40,6 +41,9 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
 {
 	const struct cpu_operations *const *ops;
 
+	if (!name)
+		return NULL;
+
 	ops = acpi_disabled ? dt_supported_cpu_ops : acpi_supported_cpu_ops;
 
 	while (*ops) {
@@ -49,6 +53,7 @@ static const struct cpu_operations * __init cpu_get_ops(const char *name)
 		ops++;
 	}
 
+	pr_warn("Unsupported enable-method: %s\n", name);
 	return NULL;
 }
 
@@ -94,25 +99,31 @@ static const char *__init cpu_read_enable_method(int cpu)
 	return enable_method;
 }
 /*
- * Read a cpu's enable method and record it in cpu_ops.
+ * Read a cpu's enable method and update/check cpu_ops.
  */
 int __init init_cpu_ops(int cpu)
 {
 	const char *enable_method = cpu_read_enable_method(cpu);
+	const struct cpu_operations *ops = cpu_get_ops(enable_method);
 
-	if (!enable_method)
+	if (!ops)
 		return -ENODEV;
 
-	cpu_ops[cpu] = cpu_get_ops(enable_method);
-	if (!cpu_ops[cpu]) {
-		pr_warn("Unsupported enable-method: %s\n", enable_method);
-		return -EOPNOTSUPP;
-	}
+	if (!cpu_ops)
+		cpu_ops = ops;
+	else if (cpu_ops != ops)
+		return -EBUSY;
+
+	if (cpu == 0)
+		boot_cpu_has_enable_method = true;
 
 	return 0;
 }
 
 const struct cpu_operations *get_cpu_ops(int cpu)
 {
-	return cpu_ops[cpu];
+	if (cpu || boot_cpu_has_enable_method)
+		return cpu_ops;
+
+	return NULL;
 }
-- 
2.34.1


