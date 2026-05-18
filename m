Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CF0CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMlxrlY09I0+URao4dl7KEWZ0T0fHCJmeuASJ1zvd4E=; b=nyT8jmX9QA8Dc+CyW8236ttwwA
	g902kms56+zBjswH0z2/RtFQdS3dcujAwRusQe8HE/N/uDFZ6KK11jz3YLQvftu7vhHXz+1u4Dirf
	UPN+Gl23+c3xV7nmX0euWTxn5Tpy359lzkmbG9j0KK624FKKAy0aan9GEAm9hInd67olFUsXwlvpk
	QqT8J0HWG8mo8LgFaqaW6c01UpFTedOKmLihH3wJq/EekgfnnFufjwAp+U2deJqaRnjL57Cwr99EB
	KZfvAyWaLaJn0TO0+wQhVLRMyTYFB3IWfIDGzRut9NiYfRqAqmo8qtcdDaEaekQ+qDO94CcBV7gHZ
	TIf1SIkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOv5J-0000000FBl6-1clo;
	Mon, 18 May 2026 10:20:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOv5E-0000000FBgP-0pN1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bMlxrlY09I0+URao4dl7KEWZ0T0fHCJmeuASJ1zvd4E=; b=SufT7dnQVuZRh5JMTJTlji6JRj
	YA5eRQmGThAqdzohJr1fQf6WrVpc7v2/Glgu1x6x39KxtWMxb8ZvD9KV/wZap9gUKuk/nAHXEOAvO
	EDgRYH6Hz1AVEycbNyP8TENxD+LviWgXCN/q3250GXPf9IEAN1QxwG0gj7DuxPIlkAyeWBkizsPee
	x+su/9AAiMCxRVOy7qY1rWEg/fzBDdB9mcJ9wmnkxotLdvFk98KSA8u/1JUe5JpHovZuGOnF21/Na
	Q9WekJzD+J6s+5TIpkawEwARUN+UNJQ2HOcZdoRbknPBWevFZiN8dTntqe6cuJ6qKYo6h6eO2IRjd
	vo3BZMJg==;
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOv58-0000000AjWv-1H8G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779099619; x=1810635619;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=bMlxrlY09I0+URao4dl7KEWZ0T0fHCJmeuASJ1zvd4E=;
  b=MJN1me4zSjKiCKbyikWeYegaCniX10kan1OM1cEi64jm3Z4k1+Gadz9g
   VcorMMEl7KVhFNn7XIN7rZE7CRn3A71Q89SG5j0ovHsRLzillzMXDC/B0
   d/2FUuaR9nFsK7FWkeLR8Q47NhaVQgyeJTgYX+F26/tu8EF3QHnbOF9ZC
   sj4Q1stupwTxKX1xGXyccLI9U2KbfHueurIKVIecdnShaytpmR5IUcgup
   a7ghs1c3g0R4VsA4PzIyuGgUycpj1KdN1/FN+scnU5cYw74lRhuHiwWvg
   eMv66trHLSvhF2DVFEzxDd2vXHfezTNZJ7Fu8LW97BTKft+abFPD5RfmO
   A==;
X-CSE-ConnectionGUID: zksISLk+QPa/K4Afg/pmIg==
X-CSE-MsgGUID: jRq+YpUJSkWIdmf0Wr9BZg==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:20:06 +0900
X-CSE-ConnectionGUID: Gv+mPeDIQ3qMzddEJ2Zy3Q==
X-CSE-MsgGUID: KtoDGItcQg60rTP0IxeYBw==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="56041678"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 18 May 2026 19:20:06 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 18 May 2026 19:20:00 +0900
Subject: [PATCH v5 4/4] driver core: platform: set mod_name in driver
 registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-acpi_mod_name-v5-4-705ccc430885@sony.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Sumit Gupta <sumitg@nvidia.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=11357;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=7RmL7RpLDjTb7OFP3+8ENtJ07SYTLx3tLFTfJEYLdO0=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhiyu5xffV1gf+bPHiPeM3eu/YszJVzVnluxZKrNU5nWU3
 zRR5bikjlIWBjEuBlkxRZZSpepfe1cELek581oRZg4rE8gQBi5OAZiIAgcjw8eJjT+mqasuem79
 ujGncmqEVEpg/9NUWxXZHSyiu/58/cDwV+aHZ4/OBrmkm6u+3f4VMEF8SljrXPbSD62nL4f+1/w
 syQoA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_112019_870657_CF88F3EC 
X-CRM114-Status: GOOD (  24.74  )
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
This patch depends on patches 1, 2, 3
---
 Documentation/driver-api/driver-model/platform.rst |  3 ++-
 drivers/base/platform.c                            | 21 ++++++++++++++-------
 drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
 include/linux/coresight.h                          |  5 +++--
 include/linux/platform_device.h                    | 17 +++++++++--------
 rust/kernel/platform.rs                            |  4 +++-
 6 files changed, 34 insertions(+), 21 deletions(-)

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
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 54ad5193b850..94ee24afdc6d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1695,7 +1695,8 @@ module_init(coresight_init);
 module_exit(coresight_exit);
 
 int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_drv,
-				     struct platform_driver *pdev_drv, struct module *owner)
+				     struct platform_driver *pdev_drv, struct module *owner,
+				     const char *mod_name)
 {
 	int ret;
 
@@ -1705,7 +1706,7 @@ int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_d
 		return ret;
 	}
 
-	ret = __platform_driver_register(pdev_drv, owner);
+	ret = __platform_driver_register(pdev_drv, owner, mod_name);
 	if (!ret)
 		return 0;
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index cd8fb47a1192..1cf85d772bea 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -692,9 +692,10 @@ coresight_find_output_type(struct coresight_platform_data *pdata,
 			   union coresight_dev_subtype subtype);
 
 int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_drv,
-				     struct platform_driver *pdev_drv, struct module *owner);
+				     struct platform_driver *pdev_drv, struct module *owner,
+				     const char *mod_name);
 #define coresight_init_driver(drv, amba_drv, pdev_drv) \
-	coresight_init_driver_with_owner(drv, amba_drv, pdev_drv, THIS_MODULE)
+	coresight_init_driver_with_owner(drv, amba_drv, pdev_drv, THIS_MODULE, KBUILD_MODNAME)
 
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


