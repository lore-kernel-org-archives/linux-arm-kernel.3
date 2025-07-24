Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954F2C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fWG6liyAx+OC/k6NlOqOAiqfCofkENyDgSwiIXNmCrk=; b=YlUuyCxcvBxUT9OxyC9GFMb3Zc
	t/A7dpq9B6EtU2/S/lVywbijQofSLvL/+dzZqiQ3UPXURZyo+1RpxA293OotCyJKLqVqF5SObBSOm
	MuXSlOC+KiUaLTTgbvb3blGkTHIafJBs5iMAzpPIJJOZcZ2CU5aDGPufOsUzElOJYFfx/w/E1pkUF
	Pm5BL6aZf3+q2WVRzM8aYOGEQt3EoAm2czwH88R91Pe5BBQ7YIg7mcEWAXLssgKkfNUD4pTm9biIh
	l8k1fZ7o+b6cUYQVhAoiWAs/QHnEPGCJjxaKw8ZXcPIz9sc0L5gV/kiy/LSyt28RLVEDuZct+K8cT
	KWXcP4uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrl-00000007rlY-20G0;
	Thu, 24 Jul 2025 15:28:17 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRF-00000007ewI-3Z3q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so11786365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365408; x=1753970208; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWG6liyAx+OC/k6NlOqOAiqfCofkENyDgSwiIXNmCrk=;
        b=TfIK32z/ZI/q+PY6ydEMMjD+zpkFKk8pGKafcg0ByNp7kTj5cSeLn4far9oKT0dutz
         uR0InU4FCcbMd/a/hcfn+XKX7KOrhJ4UGvJNIZHbqc61qsvE7rnB20WCGoxsKC75KtNr
         Lca4XKygrVx3PDCS1arqeR91fuITehbH+Ce44sQTd4uAXk4vhBd0IMV0dfBmcaFSwA29
         t+Z7aebojOxPz5MZcS0/OFKd1ZfNYd6k0/z3JDl4wgzV6Srxo+fbwNdpWdl1PoNJhfQa
         SpdOb3D9AMUvRLBkOIRz5Jx8K40N4u2MxZZOhfKV6It6JmKl6Q4ES8QN0sDhIPJmqn8q
         Guhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365408; x=1753970208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWG6liyAx+OC/k6NlOqOAiqfCofkENyDgSwiIXNmCrk=;
        b=pz4m0J0tY83U8+nUefqGc/QIpST6PFdVV8WzJ2xTxI8Ca0Jsb+iDps0aUPFDKNRfdP
         gCrVoXt8eUxBxIIHayBZL0jccIjU7Ll/e2yREdy00qcvYDCw0Hd5/b61x8RyMDDnkLvB
         bUGC5dv7r3OB+7THsNndctU9UdkkjFkNH/rM4ePZlp+t8t0dwxOwKRa3PJJRYp34fQPC
         0Cq3H95HfyxfQtIc87Gal/4/z/nFAulwxNWYwhLK8o7taNkfvZMIzx7sdJDBUA5e2s5o
         VOElOs8+/R5D0qAhZyeYnkdzIga/TvH8EWLjSNEBkZTx6AxRXyitrYkh+fbHQlVvR7bg
         A4NA==
X-Gm-Message-State: AOJu0Yx+TE7mauX9+2Xxo34+ktIn9YAcykguwl/ycI4dBac6k8Cjvt+H
	agaXIl8piv97hel66A2MgVwviKTxf+vK7pKWtyilqqVXHPHRwH2Z/8OcyNYB+YGuHsQ=
X-Gm-Gg: ASbGncttahTVG0kdWKzCfMJDdRrnnGWj/XfmjDv7atMtuwpOsHOd0BUrZ7QE6jyJZaA
	sejIcn7rO1JuN66OnM/SrOdQhrYIeWWKGn980Kk3BIymIP2gYREhvwo3rR32/qxLWWPNkmZNMee
	/iW+qQpQInDdU35V0mwCHLAuItLmhhbHCu95iUiSm0lrhNkYR9npKc9rkBamXkMC1OtRIVcVcxB
	Nl5naxUn4U6LkLHCX/Ha/jRKM4oN4nxBNDEOHGF/f6VfNj3h4res81riiOYdsXJQYYhNrHIHqtz
	h2n6ztDbSwaK3XL16EcmStwFl6yzC8fUtV3T/ebRNjvkeMc43tFne+E/+jpfVEaxXziVuUlhV/d
	Nhfg1UqGSqD141cCwRArxJIkMThcOpsOqTb9M7SnjJWP4UbevlWxj2zMRgTlPb9wfU+Slq76aB+
	WEE9Rcw+XGMrml
X-Google-Smtp-Source: AGHT+IGPJc7unar/DDQTk3kiLLtY/cjrcVJ4F2sYy/xaKu3cmlZTqIIza2uFiyGLrfIi1KWSYZcG+g==
X-Received: by 2002:a05:600c:1554:b0:456:1c4a:82b2 with SMTP id 5b1f17b1804b1-4586d84cfb5mr49962935e9.10.1753365408340;
        Thu, 24 Jul 2025 06:56:48 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:48 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 29/29] kmemdump: Add Kinfo backend driver
Date: Thu, 24 Jul 2025 16:55:12 +0300
Message-ID: <20250724135512.518487-30-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065649_973326_7E40B4F3 
X-CRM114-Status: GOOD (  30.28  )
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

Add Kinfo backend driver.
This backend driver will select only regions of interest for the firmware,
and it copy those into a shared memory area that is supplied via OF.
The firmware is only interested in addresses for some symbols.
The list format is kinfo-compatible, with devices like Google Pixel phone.
Based on original work from Jone Chou <jonechou@google.com>

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
As stated in the cover letter I did not test this on a device as I do not
have one. Testing is appreciated and feedback welcome !
This kinfo backend is how we envision it to look like, while preserving
compatibility with existing devices and firmware.
Yes I also know the compatible is not documented. But if we want to have
this driver in the kernel, I can easily add one


 MAINTAINERS            |   5 +
 drivers/debug/Kconfig  |  13 ++
 drivers/debug/Makefile |   1 +
 drivers/debug/kinfo.c  | 304 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 323 insertions(+)
 create mode 100644 drivers/debug/kinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 68797717175c..bc605480d6e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13625,6 +13625,11 @@ F:	drivers/debug/kmemdump.c
 F:	drivers/debug/kmemdump_coreimage.c
 F:	include/linux/kmemdump.h
 
+KMEMDUMP KINFO BACKEND DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+S:	Maintained
+F:	drivers/debug/kinfo.c
+
 KMEMDUMP QCOM MINIDUMP BACKEND DRIVER
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
diff --git a/drivers/debug/Kconfig b/drivers/debug/Kconfig
index d34ceaf99bd8..1a44990c2824 100644
--- a/drivers/debug/Kconfig
+++ b/drivers/debug/Kconfig
@@ -39,4 +39,17 @@ config KMEMDUMP_QCOM_MINIDUMP_BACKEND
 	  into the minidump table of contents. Further on, the firmware
 	  will be able to read the table of contents and extract the
 	  memory regions on case-by-case basis.
+
+config KMEMDUMP_KINFO_BACKEND
+	tristate "Shared memory KInfo compatible backend"
+	depends on KMEMDUMP
+	help
+	  Say y here to enable the Shared memory KInfo compatible backend
+	  driver.
+	  With this backend, the registered regions are copied to a shared
+	  memory zone at register time.
+	  The shared memory zone is supplied via OF.
+	  This backend will select only regions that are of interest,
+	  and keep only addresses. The format of the list is Kinfo compatible.
+
 endmenu
diff --git a/drivers/debug/Makefile b/drivers/debug/Makefile
index 7f70b84049cb..861f2e2c4fe2 100644
--- a/drivers/debug/Makefile
+++ b/drivers/debug/Makefile
@@ -3,3 +3,4 @@
 obj-$(CONFIG_KMEMDUMP) += kmemdump.o
 obj-$(CONFIG_KMEMDUMP_COREIMAGE) += kmemdump_coreimage.o
 obj-$(CONFIG_KMEMDUMP_QCOM_MINIDUMP_BACKEND) += qcom_minidump.o
+obj-$(CONFIG_KMEMDUMP_KINFO_BACKEND) += kinfo.o
diff --git a/drivers/debug/kinfo.c b/drivers/debug/kinfo.c
new file mode 100644
index 000000000000..bdf50254fa92
--- /dev/null
+++ b/drivers/debug/kinfo.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/platform_device.h>
+#include <linux/kallsyms.h>
+#include <linux/vmalloc.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/kmemdump.h>
+#include <linux/module.h>
+#include <linux/utsname.h>
+
+#define BUILD_INFO_LEN		256
+#define DEBUG_KINFO_MAGIC	0xCCEEDDFF
+
+/*
+ * Header structure must be byte-packed, since the table is provided to
+ * bootloader.
+ */
+struct kernel_info {
+	/* For kallsyms */
+	__u8 enabled_all;
+	__u8 enabled_base_relative;
+	__u8 enabled_absolute_percpu;
+	__u8 enabled_cfi_clang;
+	__u32 num_syms;
+	__u16 name_len;
+	__u16 bit_per_long;
+	__u16 module_name_len;
+	__u16 symbol_len;
+	__u64 _relative_pa;
+	__u64 _text_pa;
+	__u64 _stext_pa;
+	__u64 _etext_pa;
+	__u64 _sinittext_pa;
+	__u64 _einittext_pa;
+	__u64 _end_pa;
+	__u64 _offsets_pa;
+	__u64 _names_pa;
+	__u64 _token_table_pa;
+	__u64 _token_index_pa;
+	__u64 _markers_pa;
+	__u64 _seqs_of_names_pa;
+
+	/* For frame pointer */
+	__u32 thread_size;
+
+	/* For virt_to_phys */
+	__u64 swapper_pg_dir_pa;
+
+	/* For linux banner */
+	__u8 last_uts_release[__NEW_UTS_LEN];
+
+	/* Info of running build */
+	__u8 build_info[BUILD_INFO_LEN];
+
+	/* For module kallsyms */
+	__u32 enabled_modules_tree_lookup;
+	__u32 mod_mem_offset;
+	__u32 mod_kallsyms_offset;
+} __packed;
+
+struct kernel_all_info {
+	__u32 magic_number;
+	__u32 combined_checksum;
+	struct kernel_info info;
+} __packed;
+
+struct debug_kinfo {
+	struct device *dev;
+	void *all_info_addr;
+	u32 all_info_size;
+	struct kmemdump_backend kinfo_be;
+};
+
+static struct debug_kinfo *kinfo;
+
+#define be_to_kinfo(be) container_of(be, struct debug_kinfo, kinfo_be)
+
+static void update_kernel_all_info(struct kernel_all_info *all_info)
+{
+	int index;
+	struct kernel_info *info;
+	u32 *checksum_info;
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
+static int build_info_set(const char *str, const struct kernel_param *kp)
+{
+	struct kernel_all_info *all_info = kinfo->all_info_addr;
+	size_t build_info_size;
+
+	if (kinfo->all_info_addr == 0 || kinfo->all_info_size == 0)
+		return -ENAVAIL;
+
+	all_info = (struct kernel_all_info *)kinfo->all_info_addr;
+	build_info_size = sizeof(all_info->info.build_info);
+
+	memcpy(&all_info->info.build_info, str, min(build_info_size - 1,
+						    strlen(str)));
+	update_kernel_all_info(all_info);
+
+	if (strlen(str) > build_info_size) {
+		pr_warn("%s: Build info buffer (len: %zd) can't hold entire string '%s'\n",
+			__func__, build_info_size, str);
+		return -ENOMEM;
+	}
+
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
+/**
+ * register_kinfo_region() - Register a new kinfo region
+ * @be: pointer to backend
+ * @id: unique id to identify the region
+ * @vaddr: virtual memory address of the region start
+ * @size: size of the region
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int register_kinfo_region(const struct kmemdump_backend *be,
+				 enum kmemdump_uid id, void *vaddr, size_t size)
+{
+	struct debug_kinfo *kinfo = be_to_kinfo(be);
+	struct kernel_all_info *all_info = kinfo->all_info_addr;
+	struct kernel_info *info = &all_info->info;
+
+	switch (id) {
+	case KMEMDUMP_ID_COREIMAGE__sinittext:
+		info->_sinittext_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__einittext:
+		info->_einittext_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__end:
+		info->_end_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__text:
+		info->_text_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__stext:
+		info->_stext_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__etext:
+		info->_etext_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_num_syms:
+		info->num_syms = *(__u32 *)vaddr;
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_relative_base:
+		info->_relative_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_offsets:
+		info->_offsets_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_names:
+		info->_names_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_token_table:
+		info->_token_table_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_token_index:
+		info->_token_index_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_markers:
+		info->_markers_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_seqs_of_names:
+		info->_seqs_of_names_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_swapper_pg_dir:
+		info->swapper_pg_dir_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_init_uts_ns_name:
+		strscpy(info->last_uts_release, vaddr, __NEW_UTS_LEN);
+		break;
+	default:
+	};
+
+	update_kernel_all_info(all_info);
+	return 0;
+}
+
+/**
+ * unregister_md_region() - Unregister a previously registered kinfo region
+ * @id: unique id to identify the region
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int unregister_kinfo_region(const struct kmemdump_backend *be,
+				   enum kmemdump_uid id)
+{
+	return 0;
+}
+
+static int debug_kinfo_probe(struct platform_device *pdev)
+{
+	struct device_node *mem_region;
+	struct reserved_mem *rmem;
+	struct kernel_info *info;
+	struct kernel_all_info *all_info;
+
+	mem_region = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (!mem_region) {
+		dev_warn(&pdev->dev, "no such memory-region\n");
+		return -ENODEV;
+	}
+
+	rmem = of_reserved_mem_lookup(mem_region);
+	if (!rmem) {
+		dev_warn(&pdev->dev, "no such reserved mem of node name %s\n",
+			 pdev->dev.of_node->name);
+		return -ENODEV;
+	}
+
+	/* Need to wait for reserved memory to be mapped */
+	if (!rmem->priv)
+		return -EPROBE_DEFER;
+
+	if (!rmem->base || !rmem->size) {
+		dev_warn(&pdev->dev, "unexpected reserved memory\n");
+		return -EINVAL;
+	}
+
+	if (rmem->size < sizeof(struct kernel_all_info)) {
+		dev_warn(&pdev->dev, "unexpected reserved memory size\n");
+		return -EINVAL;
+	}
+
+	kinfo = kzalloc(sizeof(*kinfo), GFP_KERNEL);
+	if (!kinfo)
+		return -ENOMEM;
+
+	kinfo->dev = &pdev->dev;
+
+	strscpy(kinfo->kinfo_be.name, "debug_kinfo");
+	kinfo->kinfo_be.register_region = register_kinfo_region;
+	kinfo->kinfo_be.unregister_region = unregister_kinfo_region;
+	kinfo->all_info_addr = rmem->priv;
+	kinfo->all_info_size = rmem->size;
+
+	all_info = kinfo->all_info_addr;
+
+	memset(all_info, 0, sizeof(struct kernel_all_info));
+	info = &all_info->info;
+	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
+	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
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
+	return kmemdump_register_backend(&kinfo->kinfo_be);
+}
+
+static void debug_kinfo_remove(struct platform_device *pdev)
+{
+	kfree(kinfo);
+	kmemdump_unregister_backend(&kinfo->kinfo_be);
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
+MODULE_DESCRIPTION("Debug Kinfo Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


