Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB464D78768
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 14:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YaSvJ5xcjt8nRaptOk10LgNpsTNpSURsFbVJ5k1I/jM=; b=zkKyMKRpdInfRseFjYZ7vBz94U
	1kUQpVgomJlX0INzEe1xs+Nn7dViS1DCYN1452/1XE80MFtS3ccBIOa2P4Ign0Ls2hdatR8UitbPx
	QIZMRmglOBv0oqc4tW4bqYvD/EwGIumZQ29e7f1xWFBv+jiuhH1bM03YRv/OA2hR3iiIiO0JXV44T
	GL/WAtC7iqvz9YTR5YJnqdy2lmYhC717ftu8nZVygyan53QsajvuFihBBZ9dAU+fZZ0ELa2rn/1Bt
	ZDJSUGYJ03p10ePVGc2jSEyxUFDvIqnuJHedh/6c7eCkYZwOkMCmJwSNskYCLOXCVTbpcoQH0ZjXV
	1J3eA/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE88f-00000000CzR-2oL3;
	Thu, 21 Nov 2024 14:26:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE87j-00000000Csf-15zk;
	Thu, 21 Nov 2024 14:25:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8B328A40A98;
	Thu, 21 Nov 2024 14:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84C73C4CECC;
	Thu, 21 Nov 2024 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732199133;
	bh=IOPiUmb3wXj+j2xu3fhXd0yPSBEGQDEtT0cSG6Ufbq8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WzB25KaVHPuJ3qADwxJKa9Rj1ythejzWtD6i9s/OxjeP4iJ3r763aF0SF9H0bvMRd
	 ug6MjqNcoVqDKXRXb2ReUfTUOqQ8mYC7oaTY06FJ5bevlG/NP8WUYLE04Ss5lQGrgH
	 qDaQPP7AJkEAau+gQg5XFBc68MnNOO0BLnRYMz25fi0dBd+O/G1d8NZv5vKLjcADEB
	 6R/Zp8kvI9vCV7ui0vS+WWUqg04e8LupYYEhIfS1o2Vccw+jGgxdheB2v3Ky+gbKqC
	 QFyx4/m5OtV0niCJc9CgXrjFKMyYjIOO0Y1s1YFfkkUwb4hinhNdUL7YDitjj6msTQ
	 o8CD7g4R7j+rw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73134D78768;
	Thu, 21 Nov 2024 14:25:33 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Date: Thu, 21 Nov 2024 22:25:21 +0800
Subject: [PATCH v4] ACPI: introduce acpi_arch_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241121-intro-acpi-arch-init-v4-1-b1fb517e7d8b@gmail.com>
X-B4-Tracking: v=1; b=H4sIANBCP2cC/4XNQQ6CMBCF4auYrq1ppyDUlfcwLkqZwiRCSUsaD
 eHuFlZsjMv/JfPNwiIGwshup4UFTBTJjzmK84nZ3owdcmpzMxBQiFpUnMY5eG7sRNwE2+emmTu
 rtUOl8Aoty6dTQEfvnX08c/cUZx8++5cE2/oHTMAl16AkgjJVBfLeDYZeF+sHtoFJHZH6B6Iy0
 phSirrUjXHuiKzr+gUBRyTj/QAAAA==
X-Change-ID: 20240807-intro-acpi-arch-init-fc99fe33e62d
To: Hanjun Guo <guohanjun@huawei.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3611;
 i=shankerwangmiao@gmail.com; h=from:subject:message-id;
 bh=Jl9aXTAyOwV80IxKtP6Gua28eCTN9Fr/tbA9iL0gCVo=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBnP0Lbcf9PkzbBl6oc3sU4YtPr5VeRoXj99DkCl
 d0CRuCkc0KJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCZz9C2wAKCRCwMePKe/7Z
 bpz2EAC9hdUoauiIhwZ41G6gzCpymFr9rJ4nwpqKCvLyOGfcEE8bTMTXxFb2Ms1anYnrPedeb2+
 ex9XY+8zVBkswP7VYOC2wKs6bQzoqkrRz9PfsMlmkxn/NVn4jI570uVVFjV+ad+TQt/ZhjRPptY
 b8epvh4sxKfhvB3K3/gqFlMHqh7cjA0FKTEsooBFeW0KUXhdNcjXVIvQXFBOlEeouEnFOGg4zLr
 yrX6rNFwKVHxmfjR1c1RcL6ghFr0+jTDdCpghP6Bp8bLlCjW3V+cPk3XiG2yLYsqFygZ1OZCVQQ
 n3C0btlKgxDAjRky5OCqkZ8O3O+o9QJT42X6eziQu4fj1YftCWzhUS/C1ZOPPf8J5u6uvnWxsal
 GZ7M3fDUybkuVwMhxny3MpkKZ8QEhg7pif4vszPts03u1zu22ePxckKdIBmLFjcb1OKvLzfIeVd
 f9eSyY7GD8Rc1iqa2vu49AuFlGAh8DpElw8t03wTRDrUV6+Dcy+nsAF6U+UINpLMyW2WOLDW/ig
 sj0NRHc6HGFRtRJAMOrjvaE9jPyXgT4uO6ypThNoqukknZwzpfkJbpELnbptK/RVSbqOni6lqft
 lBw880LaIK772r8VFO7eDwWigLlMEF8UfZIp/PiYQza8FXA7MfeVbBarS+FhReg+e/oMh0XCNwq
 CdhzVutnQBC+Dvg==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/default with
 auth_id=189
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_062535_436501_264AE40A 
X-CRM114-Status: GOOD (  12.56  )
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
Reply-To: shankerwangmiao@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Miao Wang <shankerwangmiao@gmail.com>

To avoid arch-specific code in general ACPI initialization flow,
we introduce a weak symbol acpi_arch_init. Currently, arm64 and
riscv can utillize this to insert their arch-specific flow. In
the future, other architectures can also have chance to define
their own arch-specific acpi initialization process if necessary.

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
Changes from v1
- Change acpi_arch_init from a static inline stub to a weak function
  according to Haijun Guo's advice
---
Changes from v2:
- Add __init attribute to the weak acpi_arch_init stub
- Link to v2: https://lore.kernel.org/r/20240807-intro-acpi-arch-init-v2-1-9231e23a7721@gmail.com
---
Changes in v4:
- Rebased to recent Linus's tree
- Consolidate acpi_arm_init and acpi_riscv_init into acpi_arch_init
- Link to v3: https://lore.kernel.org/r/20240808-intro-acpi-arch-init-v3-1-ba510859baff@gmail.com
---
 drivers/acpi/arm64/init.c |  2 +-
 drivers/acpi/bus.c        |  5 +++--
 drivers/acpi/riscv/init.c |  2 +-
 include/linux/acpi.h      | 12 +-----------
 4 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/acpi/arm64/init.c b/drivers/acpi/arm64/init.c
index d0c8aed90fd16f9a7fe62b8c551c0cd091cb91ec..7a47d8095a7dd5f3dac6e0754d6271bf6de269ff 100644
--- a/drivers/acpi/arm64/init.c
+++ b/drivers/acpi/arm64/init.c
@@ -2,7 +2,7 @@
 #include <linux/acpi.h>
 #include "init.h"
 
-void __init acpi_arm_init(void)
+void __init acpi_arch_init(void)
 {
 	if (IS_ENABLED(CONFIG_ACPI_AGDI))
 		acpi_agdi_init();
diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 16917dc3ad604cc537d05bb2c0034ff5a9181fd0..058910af82bca689577909e8967073ca3198b3c8 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1434,6 +1434,8 @@ static int __init acpi_bus_init(void)
 struct kobject *acpi_kobj;
 EXPORT_SYMBOL_GPL(acpi_kobj);
 
+void __weak __init acpi_arch_init(void) { }
+
 static int __init acpi_init(void)
 {
 	int result;
@@ -1461,8 +1463,7 @@ static int __init acpi_init(void)
 	acpi_viot_early_init();
 	acpi_hest_init();
 	acpi_ghes_init();
-	acpi_arm_init();
-	acpi_riscv_init();
+	acpi_arch_init();
 	acpi_scan_init();
 	acpi_ec_init();
 	acpi_debugfs_init();
diff --git a/drivers/acpi/riscv/init.c b/drivers/acpi/riscv/init.c
index 5ef97905a72759ea2aab3195e56b7ee580eded96..673e4d5dd752719ae7ed0017c8b5b1c688cf9b4b 100644
--- a/drivers/acpi/riscv/init.c
+++ b/drivers/acpi/riscv/init.c
@@ -7,7 +7,7 @@
 #include <linux/acpi.h>
 #include "init.h"
 
-void __init acpi_riscv_init(void)
+void __init acpi_arch_init(void)
 {
 	riscv_acpi_init_gsi_mapping();
 }
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 7dd24acd9ffeedbe47ac392bd939309408c0afa3..05f39fbfa4856d2e6b7d45d9580cc82963764d55 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1530,17 +1530,7 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 }
 #endif
 
-#ifdef CONFIG_ARM64
-void acpi_arm_init(void);
-#else
-static inline void acpi_arm_init(void) { }
-#endif
-
-#ifdef CONFIG_RISCV
-void acpi_riscv_init(void);
-#else
-static inline void acpi_riscv_init(void) { }
-#endif
+void acpi_arch_init(void);
 
 #ifdef CONFIG_ACPI_PCC
 void acpi_init_pcc(void);

---
base-commit: 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
change-id: 20240807-intro-acpi-arch-init-fc99fe33e62d

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>



