Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8E4CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 06:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pxZ/Typ0a9ooXMzf62/OLDdu2wBvs7yyqCqpQGVFNLQ=; b=cKc41bIerYuQKas0FKndaCxVz/
	vbrfKLAldwq7olOyaWdipM50LXYde1RMYp0ORWL66EFoY98twuuKoCofNUazW9dq+6FQYqJMfYW/M
	5q3Z6GXfOSUiN41v4T7Jv4jQFAoLW5Vh6qQp+RjoQaLkeJf/DCYhwkIp4GiV9X1za9KK4753BgXV0
	MLfDuqCKvtheEPDCecSYaG8LJscIfTERfKJ7WhR5PDiKyhbK79uR8SY9BBYnHFFK4/YKe2CttNSHw
	cGnnUopC2lU2QFYnQ4ptq77Cq8iAb+JJ63wdj5fs9GrfewHKsiHKR/qhWcWQH/ApMAthcrD2UHL22
	hzwQ5lZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDiG-00000000I4T-1iNT;
	Tue, 19 May 2026 06:13:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDiE-00000000I3h-2fK5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 06:13:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51F5441AB1;
	Tue, 19 May 2026 06:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D55C2BCB3;
	Tue, 19 May 2026 06:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779171234;
	bh=eDdypLMdh0ABr1jXAwg8jwfBuFdkrNrWgQDaQkjnNC0=;
	h=From:To:Cc:Subject:Date:From;
	b=go93WtE3I1mjggb2znt6NfuRg0nGZlaSlTbx8FhNDkk0Gpr6til29QgDJO63ydlw2
	 wEjqN5hGTOzgsFyeq++wC32Sw7SGULtor58RhAI+8AIcwJH644OhpXZJclashP92s3
	 VrrW3uD2BDjhA0fBSeYQTjYWCgWN3D9U7iCYzMxORpAv7jGUcq3SkN4z4YwayLFn5S
	 3szWlGPCj7/ItQZTr8ZoeT/iVwHXrnq1Q8fO32f5jFOXzRAQnfSfriiYNn0n5wau+t
	 GFRsIazCB1R9jg0Y9BibzcFJa0NyrgzazjRqWuCcJv0569oLs1bAAm/faz8QkOkvNF
	 1H0FTcJOBvEqg==
From: Jisheng Zhang <jszhang@kernel.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ACPI: Use LIST_HEAD() to initialize on stack list head
Date: Tue, 19 May 2026 13:54:45 +0800
Message-ID: <20260519055445.13122-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_231354_719774_A51CB920 
X-CRM114-Status: GOOD (  12.75  )
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

Use LIST_HEAD to initialize on stack list head. No intentional
functional impact.

Change generated with below coccinelle script:

@@
identifier name;
@@
- struct list_head name;
+ LIST_HEAD(name);
... when != name
- INIT_LIST_HEAD(&name);

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/acpi/acpi_apd.c   | 3 +--
 drivers/acpi/arm64/amba.c | 3 +--
 drivers/acpi/resource.c   | 3 +--
 drivers/acpi/scan.c       | 3 +--
 drivers/acpi/x86/lpss.c   | 3 +--
 5 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index bed0791c17fc..fa28acc541fe 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -68,14 +68,13 @@ static int fch_misc_setup(struct apd_private_data *pdata)
 	struct platform_device *clkdev;
 	struct fch_clk_data *clk_data;
 	struct resource_entry *rentry;
-	struct list_head resource_list;
+	LIST_HEAD(resource_list);
 	int ret;
 
 	clk_data = devm_kzalloc(&adev->dev, sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&resource_list);
 	ret = acpi_dev_get_memory_resources(adev, &resource_list);
 	if (ret < 0)
 		return -ENOENT;
diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
index 1350083bce5f..ec342404306b 100644
--- a/drivers/acpi/arm64/amba.c
+++ b/drivers/acpi/arm64/amba.c
@@ -39,7 +39,7 @@ static int amba_handler_attach(struct acpi_device *adev,
 	struct acpi_device *parent = acpi_dev_parent(adev);
 	struct amba_device *dev;
 	struct resource_entry *rentry;
-	struct list_head resource_list;
+	LIST_HEAD(resource_list);
 	bool address_found = false;
 	int irq_no = 0;
 	int ret;
@@ -55,7 +55,6 @@ static int amba_handler_attach(struct acpi_device *adev,
 		return -ENOMEM;
 	}
 
-	INIT_LIST_HEAD(&resource_list);
 	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
 	if (ret < 0)
 		goto err_free;
diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index bc8050d8a6f5..ff78311c136b 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -1118,11 +1118,10 @@ EXPORT_SYMBOL_GPL(acpi_dev_filter_resource_type);
 
 static int acpi_dev_consumes_res(struct acpi_device *adev, struct resource *res)
 {
-	struct list_head resource_list;
+	LIST_HEAD(resource_list);
 	struct resource_entry *rentry;
 	int ret, found = 0;
 
-	INIT_LIST_HEAD(&resource_list);
 	ret = acpi_dev_get_resources(adev, &resource_list, NULL, NULL);
 	if (ret < 0)
 		return 0;
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 530547cda8b2..bd599d0a9348 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1738,7 +1738,7 @@ static bool acpi_is_indirect_io_slave(struct acpi_device *device)
 
 static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 {
-	struct list_head resource_list;
+	LIST_HEAD(resource_list);
 	bool is_serial_bus_slave = false;
 	static const struct acpi_device_id ignore_serial_bus_ids[] = {
 	/*
@@ -1792,7 +1792,6 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 	if (!acpi_match_device_ids(device, ignore_serial_bus_ids))
 		return false;
 
-	INIT_LIST_HEAD(&resource_list);
 	acpi_dev_get_resources(device, &resource_list,
 			       acpi_check_serial_bus_slave,
 			       &is_serial_bus_slave);
diff --git a/drivers/acpi/x86/lpss.c b/drivers/acpi/x86/lpss.c
index 0171eef00484..d33dc34a2894 100644
--- a/drivers/acpi/x86/lpss.c
+++ b/drivers/acpi/x86/lpss.c
@@ -615,7 +615,7 @@ static int acpi_lpss_create_device(struct acpi_device *adev,
 	const struct lpss_device_desc *dev_desc;
 	struct lpss_private_data *pdata;
 	struct resource_entry *rentry;
-	struct list_head resource_list;
+	LIST_HEAD(resource_list);
 	struct platform_device *pdev;
 	int ret;
 
@@ -627,7 +627,6 @@ static int acpi_lpss_create_device(struct acpi_device *adev,
 	if (!pdata)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&resource_list);
 	ret = acpi_dev_get_memory_resources(adev, &resource_list);
 	if (ret < 0)
 		goto err_out;
-- 
2.53.0


