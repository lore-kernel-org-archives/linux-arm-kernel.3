Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472E5CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjdG1/a5AFb8CurP464/OyK+i/niRA2OFjF7IXQ6EqU=; b=F/ZH+XQnRt6wLKKRsxf3hnuNSQ
	qj2/3nM+q7kuMSEY0lfqRBdIXiT+CkawuDwC6SB9SB6R/hzEgiBJD05z7H0BWiDR/2vRaIUoZKX1N
	eqkJ5oSQwImC7ZUZsUVUyy370PjoQdMa6WVHgabQrMSQIZhAoviKCOAJsNb4ZGW80q7Y13yAt4e7U
	0q+0BlLbxVtjAHP8rxbO7qGYid5YEdBWgZ4PWzMuzXhmb4DU7RoWQ3OF0ng7sUleEIXprACYvUUlQ
	aKBq+LeUWFv8BvHvVu8rk5RRBu+R5CQMhzqoMpe/HfUlGpusyRSHCA028dfjXI4RDkyaGBcnOdznV
	wmyvorWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkOL-00000003XWN-0FMv;
	Wed, 19 Nov 2025 15:46:45 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNg-00000003WlC-3jYH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:46:06 +0000
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b2dc17965so5618674f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567162; x=1764171962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjdG1/a5AFb8CurP464/OyK+i/niRA2OFjF7IXQ6EqU=;
        b=TTPPGojvpW8MSopUGhggvn1GO6SaeSWtCzQ8gEYcp0JV5rJ7oHFmYES+hSnvZLpNqB
         FdggwDBps8VWH15vrHO3wCdU4yxbju0CZP4quSHuObxIjjspkPDWol+ph3MnhzPR7tOz
         cDYI5jylnH74bSyu87inxNSn4gmG/pSC7uxsX7EVkN6mqkqhjI7rbyaEbWqDxPPsyU/W
         FUqW/t2R5onODI0q9uYCqzE5NpJzjoaDMWZg35adLsaFyLI1226ZtwksXdYITUNKGiC7
         wK7h7Gd8qBsjXkpeYnBKUuCieSBGSrWHL0gJ5cUp1qhivUDBXun88nYAxSD2XCPFYGXh
         y8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567162; x=1764171962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vjdG1/a5AFb8CurP464/OyK+i/niRA2OFjF7IXQ6EqU=;
        b=ZGdmOjI8OFlaVDyCrukhngBhNspcdMBHzwsJr/hlw6/HZbBoHqLXuuDE04wrfxVVYU
         sPWls7OXjZwRJC7m+Q9NZWEE5HQife/MuuwifYsCoNg9/ndozWxS0glkjp7qyP/tj3Ki
         KFT/FQWGhupVY01/eBK6Ekn09tcnV/6PwHrE5fbEh0MvkLyaJ0zF+aj1XjTHDbyp5I4g
         ZT1qBaOVirdj2bJJcahlT/n3Fs+bphgScMtdvYhz2abQ70FMgDPP9dAZPOp3jmpy5XH6
         TVE9N4RMYKe5Q5x1nfK/w7amcq5am18MCABYN8RAjgeUHxjeIqnttcqh/oSz+c3rQcik
         1svA==
X-Forwarded-Encrypted: i=1; AJvYcCX2f9x6oZ7g0bSV6NkiHVsX+zFq1cj6dcOQMGhr5lJtvIwXkgnGxuVfG/VOiov+7VClDbFqtLrbC5vSCglzDNXX@lists.infradead.org
X-Gm-Message-State: AOJu0YzrtDv4M8cgsMpvApUnesqs6E2E1SsF0uwM7b8eDqNsBEhp+Y7H
	j6OIpcXX/Lmr5WitfCaMNrSM2N8wbMSqvRsMyw6lV3ut2xPnikgUId+UZW2dx6h2Lss=
X-Gm-Gg: ASbGncuOPS2Jj5MZgeF31dMNMviWGwf5I2T1T0JJaJGS6kRaRs0bvSd4xdrWafF6HCR
	4fLVQ0neWrd566R24NHEbxAp3pZoTn1NjbzTavXio+r4dPBWp7reiN6U+beFTuFaYwlvfsKO/6p
	PXomaWHATxxfnQZcU96VN1RIIfq0i3KGhgt3jWCJsYiNppy2tKCI3Li9Ob95Cfy4q1eGyQFhanw
	L+qx+D+qGK92iTMdAv55Xd1BDfEmlLtlu4aDc8I+ODH8AfCrQN6g/rLgaqMSwyeZEWP86kkqd5/
	mYpwur6WbHEeSB0Xd/P90qxBl5B0nfHBZLA4JNwwpAxvVaMJNegeEQ2o3ev75uL4L/AZFeINjee
	ob3wvMopZpBh0665eMyPftEWzLCTPimw88i5R5kpLGgZmkJqj7Pq72bVwQBsrccskLVcS4eKsyv
	+dbF179xI0816YftCMdRegcq8C089gGw==
X-Google-Smtp-Source: AGHT+IEYehjZzwQP4QY9mT+/5fGr+NBXUC5zHCL5MMz466EKwRwnbbkUf34pwbvo8KJX34cdlYI+Ug==
X-Received: by 2002:a05:6000:657:b0:400:7e60:7ee0 with SMTP id ffacd0b85a97d-42b592d8549mr20248098f8f.0.1763567162304;
        Wed, 19 Nov 2025 07:46:02 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:46:01 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 26/26] meminspect: Add Kinfo compatible driver
Date: Wed, 19 Nov 2025 17:44:27 +0200
Message-ID: <20251119154427.1033475-27-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074605_032404_DDCCAE15 
X-CRM114-Status: GOOD (  25.65  )
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

With this driver, the registered regions are copied to a shared
memory zone at register time.
The shared memory zone is supplied via OF.
This driver will select only regions that are of interest,
and keep only addresses. The format of the list is Kinfo compatible,
with devices like Google Pixel phone.
The firmware is only interested in some symbols' addresses.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 MAINTAINERS                |   1 +
 kernel/meminspect/Kconfig  |  10 ++
 kernel/meminspect/Makefile |   1 +
 kernel/meminspect/kinfo.c  | 289 +++++++++++++++++++++++++++++++++++++
 4 files changed, 301 insertions(+)
 create mode 100644 kernel/meminspect/kinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8034940d0b1e..9cba0e472e01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16168,6 +16168,7 @@ MEMINSPECT KINFO DRIVER
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
 F:	Documentation/devicetree/bindings/misc/google,kinfo.yaml
+F:	kernel/meminspect/kinfo.c
 
 MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
 M:	Mike Rapoport <rppt@kernel.org>
diff --git a/kernel/meminspect/Kconfig b/kernel/meminspect/Kconfig
index 8680fbf0e285..396510908e47 100644
--- a/kernel/meminspect/Kconfig
+++ b/kernel/meminspect/Kconfig
@@ -18,3 +18,13 @@ config MEMINSPECT
 	  Note that modules using this feature must be rebuilt if option
 	  changes.
 
+config MEMINSPECT_KINFO
+	tristate "Shared memory KInfo compatible driver"
+	depends on MEMINSPECT
+	help
+	  Say y here to enable the Shared memory KInfo compatible driver
+	  With this driver, the registered regions are copied to a shared
+	  memory zone at register time.
+	  The shared memory zone is supplied via OF.
+	  This driver will select only regions that are of interest,
+	  and keep only addresses. The format of the list is Kinfo compatible.
diff --git a/kernel/meminspect/Makefile b/kernel/meminspect/Makefile
index 09fd55e6d9cf..283604d892e5 100644
--- a/kernel/meminspect/Makefile
+++ b/kernel/meminspect/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_MEMINSPECT) += meminspect.o
+obj-$(CONFIG_MEMINSPECT_KINFO) += kinfo.o
diff --git a/kernel/meminspect/kinfo.c b/kernel/meminspect/kinfo.c
new file mode 100644
index 000000000000..62f8ee7a66a9
--- /dev/null
+++ b/kernel/meminspect/kinfo.c
@@ -0,0 +1,289 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
+ * Copyright 2021 Google LLC
+ * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
+ */
+#include <linux/container_of.h>
+#include <linux/kallsyms.h>
+#include <linux/meminspect.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/utsname.h>
+
+#define BUILD_INFO_LEN		256
+#define DEBUG_KINFO_MAGIC	0xcceeddff
+
+/*
+ * Header structure must be byte-packed, since the table is provided to
+ * bootloader.
+ */
+struct kernel_info {
+	/* For kallsyms */
+	u8 enabled_all;
+	u8 enabled_base_relative;
+	u8 enabled_absolute_percpu;
+	u8 enabled_cfi_clang;
+	u32 num_syms;
+	u16 name_len;
+	u16 bit_per_long;
+	u16 module_name_len;
+	u16 symbol_len;
+	u64 _relative_pa;
+	u64 _text_pa;
+	u64 _stext_pa;
+	u64 _etext_pa;
+	u64 _sinittext_pa;
+	u64 _einittext_pa;
+	u64 _end_pa;
+	u64 _offsets_pa;
+	u64 _names_pa;
+	u64 _token_table_pa;
+	u64 _token_index_pa;
+	u64 _markers_pa;
+	u64 _seqs_of_names_pa;
+
+	/* For frame pointer */
+	u32 thread_size;
+
+	/* For virt_to_phys */
+	u64 swapper_pg_dir_pa;
+
+	/* For linux banner */
+	u8 last_uts_release[__NEW_UTS_LEN];
+
+	/* Info of running build */
+	u8 build_info[BUILD_INFO_LEN];
+
+	/* For module kallsyms */
+	u32 enabled_modules_tree_lookup;
+	u32 mod_mem_offset;
+	u32 mod_kallsyms_offset;
+} __packed;
+
+struct kernel_all_info {
+	u32 magic_number;
+	u32 combined_checksum;
+	struct kernel_info info;
+} __packed;
+
+struct debug_kinfo {
+	struct device *dev;
+	void *all_info_addr;
+	size_t all_info_size;
+	struct notifier_block nb;
+};
+
+static void update_kernel_all_info(struct kernel_all_info *all_info)
+{
+	struct kernel_info *info;
+	u32 *checksum_info;
+	int index;
+
+	all_info->magic_number = DEBUG_KINFO_MAGIC;
+	all_info->combined_checksum = 0;
+
+	info = &all_info->info;
+	checksum_info = (u32 *)info;
+	for (index = 0; index < sizeof(*info) / sizeof(u32); index++)
+		all_info->combined_checksum ^= checksum_info[index];
+}
+
+static u8 global_build_info[BUILD_INFO_LEN];
+
+static int build_info_set(const char *str, const struct kernel_param *kp)
+{
+	size_t build_info_size = sizeof(global_build_info);
+
+	if (strlen(str) > build_info_size)
+		return -ENOMEM;
+	memcpy(global_build_info, str, min(build_info_size - 1, strlen(str)));
+	return 0;
+}
+
+static const struct kernel_param_ops build_info_op = {
+	.set = build_info_set,
+};
+
+module_param_cb(build_info, &build_info_op, NULL, 0200);
+MODULE_PARM_DESC(build_info, "Write build info to field 'build_info' of debug kinfo.");
+
+static void __maybe_unused register_kinfo_region(void *priv,
+						 const struct inspect_entry *e)
+{
+	struct debug_kinfo *kinfo = priv;
+	struct kernel_all_info *all_info = kinfo->all_info_addr;
+	struct kernel_info *info = &all_info->info;
+	struct uts_namespace *uts;
+	u64 paddr;
+
+	if (e->pa)
+		paddr = e->pa;
+	else
+		paddr = __pa(e->va);
+
+	switch (e->id) {
+	case MEMINSPECT_ID__sinittext:
+		info->_sinittext_pa = paddr;
+		break;
+	case MEMINSPECT_ID__einittext:
+		info->_einittext_pa = paddr;
+		break;
+	case MEMINSPECT_ID__end:
+		info->_end_pa = paddr;
+		break;
+	case MEMINSPECT_ID__text:
+		info->_text_pa = paddr;
+		break;
+	case MEMINSPECT_ID__stext:
+		info->_stext_pa = paddr;
+		break;
+	case MEMINSPECT_ID__etext:
+		info->_etext_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_num_syms:
+		info->num_syms = *(__u32 *)e->va;
+		break;
+	case MEMINSPECT_ID_kallsyms_relative_base:
+		info->_relative_pa = (u64)__pa(*(u64 *)e->va);
+		break;
+	case MEMINSPECT_ID_kallsyms_offsets:
+		info->_offsets_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_names:
+		info->_names_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_token_table:
+		info->_token_table_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_token_index:
+		info->_token_index_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_markers:
+		info->_markers_pa = paddr;
+		break;
+	case MEMINSPECT_ID_kallsyms_seqs_of_names:
+		info->_seqs_of_names_pa = paddr;
+		break;
+	case MEMINSPECT_ID_swapper_pg_dir:
+		info->swapper_pg_dir_pa = paddr;
+		break;
+	case MEMINSPECT_ID_init_uts_ns:
+		if (!e->va)
+			return;
+		uts = e->va;
+		strscpy(info->last_uts_release, uts->name.release, __NEW_UTS_LEN);
+		break;
+	default:
+		break;
+	};
+
+	update_kernel_all_info(all_info);
+}
+
+static int kinfo_notifier_cb(struct notifier_block *nb,
+			     unsigned long code, void *entry)
+{
+	struct debug_kinfo *kinfo = container_of(nb, struct debug_kinfo, nb);
+
+	if (code == MEMINSPECT_NOTIFIER_ADD)
+		register_kinfo_region(kinfo, entry);
+
+	return NOTIFY_DONE;
+}
+
+static int debug_kinfo_probe(struct platform_device *pdev)
+{
+	struct kernel_all_info *all_info;
+	struct device *dev = &pdev->dev;
+	struct device_node *mem_region;
+	struct reserved_mem *rmem;
+	struct debug_kinfo *kinfo;
+	struct kernel_info *info;
+
+	mem_region = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!mem_region)
+		return dev_err_probe(dev, -ENODEV, "no such memory-region\n");
+
+	rmem = of_reserved_mem_lookup(mem_region);
+	if (!rmem)
+		return dev_err_probe(dev, -ENODEV, "no such reserved mem of node name %s\n",
+			      dev->of_node->name);
+
+	/* Need to wait for reserved memory to be mapped */
+	if (!rmem->priv)
+		return -EPROBE_DEFER;
+
+	if (!rmem->base || !rmem->size)
+		dev_err_probe(dev, -EINVAL, "unexpected reserved memory\n");
+
+	if (rmem->size < sizeof(struct kernel_all_info))
+		dev_err_probe(dev, -EINVAL, "reserved memory size too small\n");
+
+	kinfo = devm_kzalloc(dev, sizeof(*kinfo), GFP_KERNEL);
+	if (!kinfo)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, kinfo);
+
+	kinfo->dev = dev;
+
+	kinfo->all_info_addr = rmem->priv;
+	kinfo->all_info_size = rmem->size;
+
+	all_info = kinfo->all_info_addr;
+
+	memset(all_info, 0, sizeof(struct kernel_all_info));
+	info = &all_info->info;
+	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
+	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
+	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
+	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
+	info->name_len = KSYM_NAME_LEN;
+	info->bit_per_long = BITS_PER_LONG;
+	info->module_name_len = MODULE_NAME_LEN;
+	info->symbol_len = KSYM_SYMBOL_LEN;
+	info->thread_size = THREAD_SIZE;
+	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
+	info->mod_mem_offset = offsetof(struct module, mem);
+	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
+
+	memcpy(info->build_info, global_build_info, strlen(global_build_info));
+
+	kinfo->nb.notifier_call = kinfo_notifier_cb;
+
+	meminspect_notifier_register(&kinfo->nb);
+	meminspect_lock_traverse(kinfo, register_kinfo_region);
+
+	return 0;
+}
+
+static void debug_kinfo_remove(struct platform_device *pdev)
+{
+	struct debug_kinfo *kinfo = platform_get_drvdata(pdev);
+
+	meminspect_notifier_unregister(&kinfo->nb);
+}
+
+static const struct of_device_id debug_kinfo_of_match[] = {
+	{ .compatible	= "google,debug-kinfo" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
+
+static struct platform_driver debug_kinfo_driver = {
+	.probe = debug_kinfo_probe,
+	.remove = debug_kinfo_remove,
+	.driver = {
+		.name = "debug-kinfo",
+		.of_match_table = of_match_ptr(debug_kinfo_of_match),
+	},
+};
+module_platform_driver(debug_kinfo_driver);
+
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
+MODULE_AUTHOR("Jone Chou <jonechou@google.com>");
+MODULE_DESCRIPTION("meminspect Kinfo Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


