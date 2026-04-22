Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE492F9B601
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBBO0mRcqdSPWhBtPPX6nCzgt6YjZR2JfRp0jrfAJWs=; b=v5oVWFI3q53TZaCjiayf51SloC
	NLHtb7+Qq7Ba6cWUQyRrFYPpU6aPrh1RZKOd+PwS7yEiUKTqGfG+Fq8WkiShtvaEiRqRxxR0IJ/Ml
	jdJ+MoEOKGHq4rTB6A+HvSzXJsmdHiaWPBabdNVyck/nELzvJsjnbCPWdVsE9dJ6Te4J6plYRFf/M
	m5AqhagyTgn+Mu6TwwD6Mkb/7ZwHeCMgtKh/f2iE+e5n3J5GZ3U3TE7ySN6QP+NRJlSmOrEKQkq/Q
	OP21wv97ngI+RbwPJdChruXIgWcH/yom6DdBlPRRSc9eigb3npa5M7PqIKxZHT+jyffFg+WZw1cxL
	PMI4EkOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUD8-00000009t4n-328J;
	Wed, 22 Apr 2026 09:49:35 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUCz-00000009t0X-15dq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 09:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776851365; x=1808387365;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=nBBO0mRcqdSPWhBtPPX6nCzgt6YjZR2JfRp0jrfAJWs=;
  b=a6m+YMIfAHLAdHkBvnlCn3KjWG3XHaqb2IE8UDLiofhfI36KrBctNiql
   31Tx+dXY+WeuXOVhOGozzwu4T6gJuu6huqBy3msmwZvZqDnEaeI7kyNj9
   hQMpFHa0MHOyqA6FUdoOWfAR4iolNeaKwg0dNtlqCHnL21CY/658bvZXJ
   El9misUxMpYSLKubrlbOpcDv8zZVdmLQLJKAoOHuIfOwgc99aMzu1MWEf
   GJvPdUqCL0zuoN09TVohRiygFAqSWrjakl7HXdMR3L1MhV9OPihNAxMu2
   PtbAbvwU7YiD4fpVS93th6R/X9FflKgIiN4dUCyXmg2Zmd9avbGIS5si6
   w==;
X-CSE-ConnectionGUID: xmrk3iSdTTm5Io7ZoJfmUg==
X-CSE-MsgGUID: IWEacMJMQSq3KGMtn63htQ==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:49:18 +0900
X-CSE-ConnectionGUID: BatEHnjgTPuKMzooe57vjg==
X-CSE-MsgGUID: GQ4OY4IqT6SmX09kFmUv5A==
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="51446134"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 22 Apr 2026 18:49:17 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Wed, 22 Apr 2026 18:49:05 +0900
Subject: [PATCH v3 3/4] driver core: platform: set mod_name in driver
 registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-acpi_mod_name-v3-3-a184eff9ff6f@sony.com>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
In-Reply-To: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=10432;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=B6q++mSn5JRFnfsuFzhjJYD81tALEbBXnDVL8mzSizw=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhswXM2cIuCtMnVRoYV/zlPPYv2vqbCHJ85SjuRNDGTw2v
 5xV8eNkRykLgxgXg6yYIkupUvWvvSuClvScea0IM4eVCWQIAxenAEzET5rhf2D8RsHHYuHLmIBa
 jixkiJi1RKLc8NnkqD+u3/zU2QWqGf5paTNXnppvb/GtLnTi++C3JiofvIVYP9X0zPsiUzn37Xx
 2AA==
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_024925_541207_40C41A0A 
X-CRM114-Status: GOOD (  24.53  )
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
- arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT stuff

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

This patch depends on patches 1 and 2.
---
 drivers/base/platform.c                      | 21 ++++++++++++++-------
 drivers/hwtracing/coresight/coresight-core.c |  5 +++--
 include/linux/coresight.h                    |  5 +++--
 include/linux/platform_device.h              | 17 +++++++++--------
 rust/kernel/platform.rs                      |  4 +++-
 5 files changed, 32 insertions(+), 20 deletions(-)

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
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 9e93b22cb056..a9ff0b3d8717 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1645,7 +1645,8 @@ module_init(coresight_init);
 module_exit(coresight_exit);
 
 int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
-			  struct platform_driver *pdev_drv, struct module *owner)
+			  struct platform_driver *pdev_drv, struct module *owner,
+			  const char *mod_name)
 {
 	int ret;
 
@@ -1655,7 +1656,7 @@ int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 		return ret;
 	}
 
-	ret = __platform_driver_register(pdev_drv, owner);
+	ret = __platform_driver_register(pdev_drv, owner, mod_name);
 	if (!ret)
 		return 0;
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 4f58bfc59080..bcc6c1754dba 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -698,9 +698,10 @@ coresight_find_output_type(struct coresight_platform_data *pdata,
 			   union coresight_dev_subtype subtype);
 
 #define coresight_init_driver(drv, amba_drv, pdev_drv) \
-	__coresight_init_driver(drv, amba_drv, pdev_drv, THIS_MODULE)
+	__coresight_init_driver(drv, amba_drv, pdev_drv, THIS_MODULE, KBUILD_MODNAME)
 int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
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


