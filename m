Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1F7FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 02:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wwgvEYLWg4ZMf3xZuScEeBxUIZJiuxnz1K7s2O07bsk=; b=jK7NyO1ElRUxo7LpPcbklX7mbr
	osPutlg0iyOOtjVC13G0G9VitvtToO0UZP4VmQ9mFnomEX/Mn8B/mOFRJ2wiILe42AnsUN631FB0Q
	YOn0mg2WMpuCkbsBLyr1r4Aq7JJ2AzAfherwLVUq8KjzyzLpOlT9BzfcuDwdn4YeoCJ0bX0bFoeOZ
	+qmMChKYptoWj77LS+LOT/QbswpyjGV9QApbtwohQgN6UD62yY57SmuD6rd1JQdgNcSnZ0sDq24Fn
	OwxK5CIwbCpvff/cclnwBcDOkRWsELAPa6ezBs8n02KaJouKvw0pCJ3928Cw5aIURIHaxh7Q6sW3Q
	6es0r87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBvP-0000000G4Em-0Xxr;
	Mon, 27 Apr 2026 02:42:19 +0000
Received: from jpms-ob01-os7.noc.sony.co.jp ([2001:cf8:acf:41::7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBvI-0000000G4Bj-0ass
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 02:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1777257732; x=1808793732;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=wwgvEYLWg4ZMf3xZuScEeBxUIZJiuxnz1K7s2O07bsk=;
  b=O8J57sIuT63qALZKfgmWmU+O6KfKAU41s5BGb1n83Yu//70VE4BdQ57a
   nh2M4Nga/3/vE3Ny6XXaxBotxQsMq7ZWGEGH1FBBcYLA42ilIxSgna74r
   qmn5ooKD/HVo9IJ1HnYnvpFBwxsQg6CRaB6B7gd+Et6rxjBhGGqb5SM3Q
   GNOLdgNgR6+oioM4ewJ2DXV2A7wCQFOkqMSBjx7HctT+cl7laphZY3AsE
   S5b1xFLa/MQUNqQyQCdu9cDJqgCtGE9gfGYNrl9czbtmaxh14fgkM/lP8
   bdM3Gn6SJm8NEzt5DMCSSLtFMlBb9D9BxCrcA4YMqT99J9s2VtzvuBnyN
   A==;
X-CSE-ConnectionGUID: oQhg/VXVT/iQHJS0TAmsKQ==
X-CSE-MsgGUID: 0k9kY7nUSYKN4pvw0pW/Pg==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 11:42:04 +0900
X-CSE-ConnectionGUID: 3gISxFTbRE6wRXgzByRNeQ==
X-CSE-MsgGUID: 2jQXR9N4SDWHcLwm1Lb4tg==
X-IronPort-AV: E=Sophos;i="6.23,201,1770562800"; 
   d="scan'208";a="52275253"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 27 Apr 2026 11:42:03 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 27 Apr 2026 11:41:21 +0900
Subject: [PATCH v4 1/4] kernel: param: initialize module_kset before
 do_initcalls()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
In-Reply-To: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=3267;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=4FGEsKZVItFVh3wNPBycUa5qbrb/KXyEWcUvvYGRmTk=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsx3Z372X/GQFn/G+CwxnE2+ZN2+arfP4R0tjR9nbT/+N
 HinJqd1RykLgxgXg6yYIkupUvWvvSuClvScea0IM4eVCWQIAxenAEzEfAsjw/Jn1Zt/uwolbWX4
 eUZPJ7zz/nwmG4676TFGCRxtT7+332D4Z7fVe96ZkKBJ6ieTePemvi+sszoXW8p479qp4PMmbUr
 6jAA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_194212_419077_D8998314 
X-CRM114-Status: GOOD (  13.51  )
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
of platform drivers register themselves prior to subsys_initcalls
(tegra194_cbb_driver registers in a pure_initcall, for example). With an
upcoming patch ("driver core: platform: set mod_name in driver registration")
that sets their mod_name in struct device_driver, lookup_or_create_module_kobject()
will be called for those drivers, which calls kset_find_obj(module_kset, mod_name).
This causes a null deref because module_kset isn't alive yet.

Fix this by initializing module_kset in do_basic_setup() before do_initcalls().
Modernize the pr_warn while we're at it.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Suggested-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 include/linux/module.h |  4 ++++
 init/main.c            |  1 +
 kernel/params.c        | 21 +++++++++------------
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 7566815fabbe..6478596e8f9f 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -886,6 +886,10 @@ static inline void module_for_each_mod(int(*func)(struct module *mod, void *data
 #ifdef CONFIG_SYSFS
 extern struct kset *module_kset;
 extern const struct kobj_type module_ktype;
+
+void param_sysfs_init(void);
+#else
+static inline void param_sysfs_init(void) {}
 #endif /* CONFIG_SYSFS */
 
 #define symbol_request(x) try_then_request_module(symbol_get(x), "symbol:" #x)
diff --git a/init/main.c b/init/main.c
index 96f93bb06c49..01552c6b62ff 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1486,6 +1486,7 @@ static void __init do_basic_setup(void)
 	ksysfs_init();
 	driver_init();
 	init_irq_proc();
+	param_sysfs_init();
 	do_ctors();
 	do_initcalls();
 }
diff --git a/kernel/params.c b/kernel/params.c
index 74d620bc2521..d1e3934fb3a7 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -942,22 +942,19 @@ const struct kobj_type module_ktype = {
 /*
  * param_sysfs_init - create "module" kset
  *
- * This must be done before the initramfs is unpacked and
- * request_module() thus becomes possible, because otherwise the
- * module load would fail in mod_sysfs_init.
+ * Must run before:
+ * - do_initcalls(): some drivers register during initcalls and rely on
+ *   module_kset existing for their sysfs module symlink.
+ * - rootfs_initcall (initramfs unpack): request_module() becomes possible.
+ *   But if module_kset is null, module load would fail in mod_sysfs_init(),
+ *   causing request_module() to fail.
  */
-static int __init param_sysfs_init(void)
+void __init param_sysfs_init(void)
 {
 	module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
-	if (!module_kset) {
-		printk(KERN_WARNING "%s (%d): error creating kset\n",
-			__FILE__, __LINE__);
-		return -ENOMEM;
-	}
-
-	return 0;
+	if (!module_kset)
+		pr_warn("Error creating module kset\n");
 }
-subsys_initcall(param_sysfs_init);
 
 /*
  * param_sysfs_builtin_init - add sysfs version and parameter

-- 
2.43.0


