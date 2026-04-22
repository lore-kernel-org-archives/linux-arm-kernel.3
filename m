Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1672EF9B604
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOPrpwN477o2q/ReoM7iwVtzVbTQQD8orRUi6dSpuPw=; b=PyKb2QXX9SgFLxk7VdPeMSOJ/h
	KrcHUdVT+Nt0FDw4GOYGDOQLujtEA8E0X7Rgkk0Qi9jwPQNIc5N5mnrOXu4GtwT12g2olXhh9TNxU
	b87Y8OR4qDsMLZavUuVqmiZp6qe4UCh8VNcvQf+qIShRwJUjxOzWj41kvJyjYLrUzhou+dQfYkpxM
	kLdDN2E5ioPIbpjan/WWkpr1OYsDVdZ9cOl0Bu9G9uckhg+dK2zY+XsGUTDmGOwSD66pC4VJIMgjQ
	HWsRCoJ0I2iMeCD/3EZp5pEu5VD3qoTzUxO9b8i8CePg7d7qjsozuZyMguxSP4534qEyclQ7TSvB3
	m+t/n0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUD7-00000009t4P-0V0L;
	Wed, 22 Apr 2026 09:49:34 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFUCv-00000009t0V-07kt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 09:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776851361; x=1808387361;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=EOPrpwN477o2q/ReoM7iwVtzVbTQQD8orRUi6dSpuPw=;
  b=tVfumKXlfdvDwRcXqPx9aCWkAQCThbUsH50sf45YsjuNVD/V7twE2QyX
   0QkNgPbsdRghQBxfVQPVOgnmJzHgnT5tFOOVz8LbLNrSryer3y7Pn2Al7
   WIE8sKCtaod95dun7apBwH7h53ZoU3OqMQ9EYKU/hmCyNA1VanDOATq/d
   xLZ36BQ84b+9PjviV71PFWJVYgq0tCPv8ADeHBK0OM1M4a0l1cNVSd8nB
   j4Xe6gI7NrmjlCqRvZmXZCmBYeoKLya5dBf3IQ3SHKuA1ZtgPMDswMXQA
   +JgwQj2i/jS3mSqDDeUdkhIjIc6tA8dhadfz6uOsl5QGqBr1f+A83v+6O
   Q==;
X-CSE-ConnectionGUID: WyLZ+VC1ROSZXJBSG9UB4A==
X-CSE-MsgGUID: VNbmKXi5TmyzRu49wGdoaw==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:49:15 +0900
X-CSE-ConnectionGUID: HDWeGh87TYGngXRoL929NA==
X-CSE-MsgGUID: 7gFORB46Sde4hwtBsaBa1A==
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="51446128"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 22 Apr 2026 18:49:14 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Wed, 22 Apr 2026 18:49:03 +0900
Subject: [PATCH v3 1/4] kernel: param: initialize module_kset on-demand
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-acpi_mod_name-v3-1-a184eff9ff6f@sony.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3602;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=Ep6QIT5ucgr5upYbumWW0j4HwLVdmH1vYS1Pt6Gv6zc=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhswXM6dzfuk0KHdssl6afcBb7vreN/8eWjKq1OsHBuz/r
 rf2/omFHaUsDGJcDLJiiiylStW/9q4IWtJz5rUizBxWJpAhDFycAjCRBQWMDL1xyXY+2Ub9fQZd
 qjp73WJ6dO5Wyz+NUj7787vW13nSSxj+R5nGGMYFd6mwrNkTv25dfXkZm8McGYkGdv53KcxLLL9
 yAAA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_024921_300339_A382926D 
X-CRM114-Status: GOOD (  15.51  )
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

module_kset is initialized in param_sysfs_init(), a subsys_initcall. A number
of platform drivers register themselves prior to subsys_initcalls. With an
upcoming patch ("driver core: platform: set mod_name in driver registration")
that sets their mod_name in struct device_driver, lookup_or_create_module()
will be called for those drivers, which calls kset_find_object(module_kset, mod_name).
This fails because module_kset isn't alive yet.

Fix this by initializing module_kset on-demand in lookup_or_create_module().
Retain the param_sysfs_init() subsys_initcall to ensure that module_kset is
live after subsys_initcalls (assuming no OOM) for any users who may need it,
on the off chance that it wasn't init'd on-demand because of no
pre-subsys_initcall drivers.

This on-demand path can trigger before subsys_initcall. kset_create_and_add()
be should safe in those contexts because the allocator is up and running by then,
no userspace to start uevent helper or listen to a uevent socket.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>

---

Patch 3 depends on this patch.
---
 kernel/params.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc2521..f25d6fda159c 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -745,6 +745,26 @@ void module_param_sysfs_remove(struct module *mod)
 }
 #endif
 
+static int uevent_filter(const struct kobject *kobj)
+{
+	const struct kobj_type *ktype = get_ktype(kobj);
+
+	if (ktype == &module_ktype)
+		return 1;
+	return 0;
+}
+
+static const struct kset_uevent_ops module_uevent_ops = {
+	.filter = uevent_filter,
+};
+
+static struct kset *__init_or_module ensure_module_kset(void)
+{
+	if (!module_kset)
+		module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
+	return module_kset;
+}
+
 struct module_kobject * __init_or_module
 lookup_or_create_module_kobject(const char *name)
 {
@@ -752,6 +772,9 @@ lookup_or_create_module_kobject(const char *name)
 	struct kobject *kobj;
 	int err;
 
+	if (!ensure_module_kset())
+		return NULL;
+
 	kobj = kset_find_obj(module_kset, name);
 	if (kobj)
 		return to_module_kobject(kobj);
@@ -911,19 +934,6 @@ static const struct sysfs_ops module_sysfs_ops = {
 	.store = module_attr_store,
 };
 
-static int uevent_filter(const struct kobject *kobj)
-{
-	const struct kobj_type *ktype = get_ktype(kobj);
-
-	if (ktype == &module_ktype)
-		return 1;
-	return 0;
-}
-
-static const struct kset_uevent_ops module_uevent_ops = {
-	.filter = uevent_filter,
-};
-
 struct kset *module_kset;
 
 static void module_kobj_release(struct kobject *kobj)
@@ -940,7 +950,7 @@ const struct kobj_type module_ktype = {
 };
 
 /*
- * param_sysfs_init - create "module" kset
+ * param_sysfs_init - create module_kset if not already done
  *
  * This must be done before the initramfs is unpacked and
  * request_module() thus becomes possible, because otherwise the
@@ -948,8 +958,7 @@ const struct kobj_type module_ktype = {
  */
 static int __init param_sysfs_init(void)
 {
-	module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
-	if (!module_kset) {
+	if (!ensure_module_kset()) {
 		printk(KERN_WARNING "%s (%d): error creating kset\n",
 			__FILE__, __LINE__);
 		return -ENOMEM;

-- 
2.43.0


