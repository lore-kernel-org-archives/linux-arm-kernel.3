Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16738F327A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdVWUjdrwCXwW+xjjbRAXUxd6dXio6R7QMgwWg+XSA8=; b=SToIFy1NOc+amvyDL2B+P2xk6I
	ZaT9NQPU5XeclTKsTY09coeKDNFj/iMU6B18K7wQdXCzEhYUPdvDXGBFQA9rMAM4iQe4Vdlj5RQ0B
	V8qBydFj/h3qeNhXLlICP1ZbY8qRemTmUWsxz2dcF2RXap4su65ou3yIJH7vwTEgBr7q4t/SIKaYj
	jgkFDawolnDMRDXvRND82Jrh6HIo/Yyl1MCe2kX6bi8FL+M9h3ubB/TD6x+Khqbq+2zXUyG9zLED4
	0IMDlXmab0e4y5oPum91nN3BzQ7KcX7iREnvamiHcC2Ni4UdGb7z9kFizllT6zFwPfqVefoSmZ1yP
	1BUFsDwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4CX-000000084Gd-0XtJ;
	Tue, 21 Apr 2026 06:03:13 +0000
Received: from jpms-ob02.noc.sony.co.jp ([2001:cf8:ace:41::5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4CT-000000084Eu-1Pq7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 06:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776751390; x=1808287390;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=HdVWUjdrwCXwW+xjjbRAXUxd6dXio6R7QMgwWg+XSA8=;
  b=qWdH60kXPsHc0/29ttSVYvePxRU+jOu7I9n/rBbQsOkNlRisM1mdALbC
   tkCb8lsWxB6u9TGPuEFJsLooN+HmsoJ6yiTaSjajsTmDeBryH19qgYIDP
   A8GPbRuCl21/jG7rppOFV7jpuxCwY5O1vW5jOcQUySDgtg390/buDepN3
   63jR73/Ns/76bHNi3ka70OJk3TMu195xUioTG8RBRcQkUAsAJVoRvIc/f
   BkMd2e6jU1o2NHlxTSyWfrcLW3AcUK3wJ2KV6CAaZ3pYC1Z+ON+YPJFoB
   yV2Vt9a4oqPiVZ7UxvTo+F1NPwDvQvRvK2NnrQzsCXnTu8wg4qq9qaWvw
   g==;
X-CSE-ConnectionGUID: /5w3he5yQMCAWtc4V+rYCQ==
X-CSE-MsgGUID: yurCbAL4SpSXwGF6VEBOqg==
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 15:03:03 +0900
X-CSE-ConnectionGUID: MJ2I4ocyTnCepcWWqK6kpg==
X-CSE-MsgGUID: Pd//BoLNR1uojNztbHNT0Q==
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="603010299"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP; 21 Apr 2026 15:03:02 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Tue, 21 Apr 2026 15:02:35 +0900
Subject: [PATCH v2 2/2] driver core: platform: set mod_name in driver
 registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-acpi_mod_name-v2-2-e73f9310dad3@sony.com>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
In-Reply-To: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
To: Kay Sievers <kay.sievers@vrfy.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Shashank Balaji <shashank.mahadasyam@sony.com>, 
 Rahul Bukte <rahul.bukte@sony.com>, Daniel Palmer <daniel.palmer@sony.com>, 
 Tim Bird <tim.bird@sony.com>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=17065;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=QeDMW+OR8m10UWiARg4ny1auuk+1IqyS5U2I9jAd6+I=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsznwkJLZcKn3Iz6dFukxOcan9Yk3k1Rt0XmeWh8kX33+
 KaE0ZJ1HaUsDGJcDLJiiiylStW/9q4IWtJz5rUizBxWJpAhDFycAjCRsDcM/2u/WtxI9SqcUbnh
 VjPP6wX3JGzWTp3zsyDGtYFd68uZ5iuMDNOPX+Qu9Ojb9CPCtlG/xub2p/vKv8QqhT+u+zFnoYM
 YDx8A
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_230309_742309_45471161 
X-CRM114-Status: GOOD (  24.38  )
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

Pass KBUILD_MODNAME through the driver registration macro so that
the driver core can create the module symlink in sysfs for built-in
drivers, and fixup all callers.

The Rust platform adapter is updated to pass the module name through to the new
parameter.

Tested on qemu with:
- x86 defconfig + CONFIG_RUST
- arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT

Examples after this patch:

    /sys/bus/platform/drivers/...
        coresight-itnoc/module		-> coresight_tnoc
        coresight-static-tpdm/module	-> coresight_tpdm
        coresight-catu-platform/module	-> coresight_catu
        serial8250/module		-> 8250
        acpi-ged/module			-> acpi
        vmclock/module			-> ptp_vmclock

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Depends on the previous patch, without which the kernel fails to boot on arm64
defconfig.
---
 Documentation/driver-api/driver-model/platform.rst |  3 ++-
 drivers/base/platform.c                            | 21 ++++++++++++++-------
 drivers/hwtracing/coresight/coresight-catu.c       |  3 ++-
 drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  2 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |  2 +-
 drivers/hwtracing/coresight/coresight-replicator.c |  2 +-
 drivers/hwtracing/coresight/coresight-stm.c        |  3 ++-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  3 ++-
 drivers/hwtracing/coresight/coresight-tnoc.c       |  3 ++-
 drivers/hwtracing/coresight/coresight-tpdm.c       |  2 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |  3 ++-
 include/linux/coresight.h                          |  3 ++-
 include/linux/platform_device.h                    | 17 +++++++++--------
 rust/kernel/platform.rs                            |  4 +++-
 15 files changed, 47 insertions(+), 29 deletions(-)

diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
index cf5ff48d3115..9673470bded2 100644
--- a/Documentation/driver-api/driver-model/platform.rst
+++ b/Documentation/driver-api/driver-model/platform.rst
@@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
 provides helpers to register and unregister an array of drivers::
 
 	int __platform_register_drivers(struct platform_driver * const *drivers,
-				      unsigned int count, struct module *owner);
+				      unsigned int count, struct module *owner,
+				      const char *mod_name);
 	void platform_unregister_drivers(struct platform_driver * const *drivers,
 					 unsigned int count);
 
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e58..2b0cc0889386 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -901,11 +901,14 @@ EXPORT_SYMBOL_GPL(platform_device_register_full);
  * __platform_driver_register - register a driver for platform-level devices
  * @drv: platform driver structure
  * @owner: owning module/driver
+ * @mod_name: module name string
  */
-int __platform_driver_register(struct platform_driver *drv, struct module *owner)
+int __platform_driver_register(struct platform_driver *drv, struct module *owner,
+			       const char *mod_name)
 {
 	drv->driver.owner = owner;
 	drv->driver.bus = &platform_bus_type;
+	drv->driver.mod_name = mod_name;
 
 	return driver_register(&drv->driver);
 }
@@ -938,6 +941,7 @@ static int is_bound_to_driver(struct device *dev, void *driver)
  * @drv: platform driver structure
  * @probe: the driver probe routine, probably from an __init section
  * @module: module which will be the owner of the driver
+ * @mod_name: module name string
  *
  * Use this instead of platform_driver_register() when you know the device
  * is not hotpluggable and has already been registered, and you want to
@@ -955,7 +959,8 @@ static int is_bound_to_driver(struct device *dev, void *driver)
  */
 int __init_or_module __platform_driver_probe(struct platform_driver *drv,
 					     int (*probe)(struct platform_device *),
-					     struct module *module)
+					     struct module *module,
+					     const char *mod_name)
 {
 	int retval;
 
@@ -983,7 +988,7 @@ int __init_or_module __platform_driver_probe(struct platform_driver *drv,
 
 	/* temporary section violation during probe() */
 	drv->probe = probe;
-	retval = __platform_driver_register(drv, module);
+	retval = __platform_driver_register(drv, module, mod_name);
 	if (retval)
 		return retval;
 
@@ -1011,6 +1016,7 @@ EXPORT_SYMBOL_GPL(__platform_driver_probe);
  * @data: platform specific data for this platform device
  * @size: size of platform specific data
  * @module: module which will be the owner of the driver
+ * @mod_name: module name string
  *
  * Use this in legacy-style modules that probe hardware directly and
  * register a single platform device and corresponding platform driver.
@@ -1021,7 +1027,7 @@ struct platform_device * __init_or_module
 __platform_create_bundle(struct platform_driver *driver,
 			 int (*probe)(struct platform_device *),
 			 struct resource *res, unsigned int n_res,
-			 const void *data, size_t size, struct module *module)
+			 const void *data, size_t size, struct module *module, const char *mod_name)
 {
 	struct platform_device *pdev;
 	int error;
@@ -1044,7 +1050,7 @@ __platform_create_bundle(struct platform_driver *driver,
 	if (error)
 		goto err_pdev_put;
 
-	error = __platform_driver_probe(driver, probe, module);
+	error = __platform_driver_probe(driver, probe, module, mod_name);
 	if (error)
 		goto err_pdev_del;
 
@@ -1064,6 +1070,7 @@ EXPORT_SYMBOL_GPL(__platform_create_bundle);
  * @drivers: an array of drivers to register
  * @count: the number of drivers to register
  * @owner: module owning the drivers
+ * @mod_name: module name string
  *
  * Registers platform drivers specified by an array. On failure to register a
  * driver, all previously registered drivers will be unregistered. Callers of
@@ -1073,7 +1080,7 @@ EXPORT_SYMBOL_GPL(__platform_create_bundle);
  * Returns: 0 on success or a negative error code on failure.
  */
 int __platform_register_drivers(struct platform_driver * const *drivers,
-				unsigned int count, struct module *owner)
+				unsigned int count, struct module *owner, const char *mod_name)
 {
 	unsigned int i;
 	int err;
@@ -1081,7 +1088,7 @@ int __platform_register_drivers(struct platform_driver * const *drivers,
 	for (i = 0; i < count; i++) {
 		pr_debug("registering platform driver %ps\n", drivers[i]);
 
-		err = __platform_driver_register(drivers[i], owner);
+		err = __platform_driver_register(drivers[i], owner, mod_name);
 		if (err < 0) {
 			pr_err("failed to register platform driver %ps: %d\n",
 			       drivers[i], err);
diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index dfd035852b12..3e4df832f02a 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -708,7 +708,8 @@ static int __init catu_init(void)
 {
 	int ret;
 
-	ret = coresight_init_driver("catu", &catu_driver, &catu_platform_driver, THIS_MODULE);
+	ret = coresight_init_driver("catu", &catu_driver, &catu_platform_driver,
+				    THIS_MODULE, KBUILD_MODNAME);
 	tmc_etr_set_catu_ops(&etr_catu_buf_ops);
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 80e26396ad0a..b88bc053ab58 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1645,7 +1645,8 @@ module_init(coresight_init);
 module_exit(coresight_exit);
 
 int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
-			  struct platform_driver *pdev_drv, struct module *owner)
+			  struct platform_driver *pdev_drv, struct module *owner,
+			  const char *mod_name)
 {
 	int ret;
 
@@ -1655,7 +1656,7 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 		return ret;
 	}
 
-	ret = __platform_driver_register(pdev_drv, owner);
+	ret = __platform_driver_register(pdev_drv, owner, mod_name);
 	if (!ret)
 		return 0;
 
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 629614278e46..00b7c52d3ab9 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -758,7 +758,7 @@ static struct platform_driver debug_platform_driver = {
 static int __init debug_init(void)
 {
 	return coresight_init_driver("debug", &debug_driver, &debug_platform_driver,
-				     THIS_MODULE);
+				     THIS_MODULE, KBUILD_MODNAME);
 }
 
 static void __exit debug_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3b248e54471a..8ee5b42bb475 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -415,7 +415,7 @@ static struct amba_driver dynamic_funnel_driver = {
 static int __init funnel_init(void)
 {
 	return coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver,
-				     THIS_MODULE);
+				     THIS_MODULE, KBUILD_MODNAME);
 }
 
 static void __exit funnel_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e6472658235d..9af67100f1fd 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -421,7 +421,7 @@ static struct amba_driver dynamic_replicator_driver = {
 static int __init replicator_init(void)
 {
 	return coresight_init_driver("replicator", &dynamic_replicator_driver, &replicator_driver,
-				     THIS_MODULE);
+				     THIS_MODULE, KBUILD_MODNAME);
 }
 
 static void __exit replicator_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index e68529bf89c9..b140069e07b5 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1052,7 +1052,8 @@ static struct platform_driver stm_platform_driver = {
 
 static int __init stm_init(void)
 {
-	return coresight_init_driver("stm", &stm_driver, &stm_platform_driver, THIS_MODULE);
+	return coresight_init_driver("stm", &stm_driver, &stm_platform_driver,
+				     THIS_MODULE, KBUILD_MODNAME);
 }
 
 static void __exit stm_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..bef0a9d1fa1b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -1051,7 +1051,8 @@ static struct platform_driver tmc_platform_driver = {
 
 static int __init tmc_init(void)
 {
-	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver, THIS_MODULE);
+	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver,
+				     THIS_MODULE, KBUILD_MODNAME);
 }
 
 static void __exit tmc_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 1128612e70a7..1c7c7a062600 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -346,7 +346,8 @@ static struct platform_driver itnoc_driver = {
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver,
+				     THIS_MODULE, KBUILD_MODNAME);
 }
 
 static void __exit tnoc_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 06e0a905a67d..2a735f797c8e 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1534,7 +1534,7 @@ static struct platform_driver static_tpdm_driver = {
 static int __init tpdm_init(void)
 {
 	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver,
-				     THIS_MODULE);
+				     THIS_MODULE, KBUILD_MODNAME);
 }
 
 static void __exit tpdm_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index aaa44bc521c3..3ddabb81b946 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -312,7 +312,8 @@ static struct platform_driver tpiu_platform_driver = {
 
 static int __init tpiu_init(void)
 {
-	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver, THIS_MODULE);
+	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver,
+				     THIS_MODULE, KBUILD_MODNAME);
 }
 
 static void __exit tpiu_exit(void)
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2b48be97fcd0..382341f587d0 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -698,7 +698,8 @@ coresight_find_output_type(struct coresight_platform_data *pdata,
 			   union coresight_dev_subtype subtype);
 
 int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
-			  struct platform_driver *pdev_drv, struct module *owner);
+			  struct platform_driver *pdev_drv, struct module *owner,
+			  const char *mod_name);
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv);
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 975400a472e3..26e6a43358e2 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -293,18 +293,19 @@ struct platform_driver {
  * use a macro to avoid include chaining to get THIS_MODULE
  */
 #define platform_driver_register(drv) \
-	__platform_driver_register(drv, THIS_MODULE)
+	__platform_driver_register(drv, THIS_MODULE, KBUILD_MODNAME)
 extern int __platform_driver_register(struct platform_driver *,
-					struct module *);
+					struct module *, const char *mod_name);
 extern void platform_driver_unregister(struct platform_driver *);
 
 /* non-hotpluggable platform devices may use this so that probe() and
  * its support may live in __init sections, conserving runtime memory.
  */
 #define platform_driver_probe(drv, probe) \
-	__platform_driver_probe(drv, probe, THIS_MODULE)
+	__platform_driver_probe(drv, probe, THIS_MODULE, KBUILD_MODNAME)
 extern int __platform_driver_probe(struct platform_driver *driver,
-		int (*probe)(struct platform_device *), struct module *module);
+		int (*probe)(struct platform_device *), struct module *module,
+		const char *mod_name);
 
 static inline void *platform_get_drvdata(const struct platform_device *pdev)
 {
@@ -368,19 +369,19 @@ static int __init __platform_driver##_init(void) \
 device_initcall(__platform_driver##_init); \
 
 #define platform_create_bundle(driver, probe, res, n_res, data, size) \
-	__platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE)
+	__platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE, KBUILD_MODNAME)
 extern struct platform_device *__platform_create_bundle(
 	struct platform_driver *driver, int (*probe)(struct platform_device *),
 	struct resource *res, unsigned int n_res,
-	const void *data, size_t size, struct module *module);
+	const void *data, size_t size, struct module *module, const char *mod_name);
 
 int __platform_register_drivers(struct platform_driver * const *drivers,
-				unsigned int count, struct module *owner);
+				unsigned int count, struct module *owner, const char *mod_name);
 void platform_unregister_drivers(struct platform_driver * const *drivers,
 				 unsigned int count);
 
 #define platform_register_drivers(drivers, count) \
-	__platform_register_drivers(drivers, count, THIS_MODULE)
+	__platform_register_drivers(drivers, count, THIS_MODULE, KBUILD_MODNAME)
 
 #ifdef CONFIG_SUSPEND
 extern int platform_pm_suspend(struct device *dev);
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 8917d4ee499f..2d626eecc450 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -82,7 +82,9 @@ unsafe fn register(
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
-        to_result(unsafe { bindings::__platform_driver_register(pdrv.get(), module.0) })
+        to_result(unsafe {
+            bindings::__platform_driver_register(pdrv.get(), module.0, name.as_char_ptr())
+        })
     }
 
     unsafe fn unregister(pdrv: &Opaque<Self::DriverType>) {

-- 
2.43.0


