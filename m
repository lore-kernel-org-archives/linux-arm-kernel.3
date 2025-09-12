Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9379CCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgoQ+woT/93cBsRw8kKeoK5/i5b3BJOE5ioHeOB3mNE=; b=SxaId9/NQ2NDAnnTTSqvR8jm/B
	UPcTP7EizNj4qq5h791fToMyU1AZmL7J+greHUHN1OYQFluVK30Cu5f3HtTlFGkF4HuRpJeo1gWYL
	Wejo9BThQWyt1ZbSPIkrZjzbuWcZ8C4OxqWvTuGaJcshJUovi7uy8OANxYuDJpc8UWLDoPc9itH8W
	TItX8f0MIa+13wqUNw/AtQCWE0o/L5n4bHNLLRkS6jAEPMQCJxxVX0sfwnVI495KN1RstiS/68odX
	ZV7c4F1rmbiYt/MypJ2LSgo3ZDh2q62USIq77K5YUT3hXcmgsoVx+9LXeKmyrjRD1+eu0wU7ckJ1c
	MoLFPP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Qh-0000000A93Y-0LER;
	Fri, 12 Sep 2025 15:11:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Qg-0000000A926-1nQA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 15:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TgoQ+woT/93cBsRw8kKeoK5/i5b3BJOE5ioHeOB3mNE=; b=pIxkPGubDoMoMlPoW49RZJ+iH6
	Pfw35zCffYB16WVOYuUoyoz/30xyuP4C4/x1n635+WjgXmvb9hKriZcAw3/Igb3k7fgaWHb7pldHi
	oxjoXQJsKPWet6q+ZnWVhIBiSSJHuPT/PjgDK0cCqNJSIHPmTt2Z21vPC83qrM0pff1Mn5g3g1TgT
	Dmab3Hiw78l7E9Jg9sWVQuRIjaUzRuPBHQedD2o6KkyEbVWQt3/U6Z3DXP6d9q1I+ddfpASOk/zBl
	/O5X3vJiqakxg1j+6PzawJeqQTYJjhgryowqoj7m+ZbKPg9I1sVe4zJX28QA+j4yz9vnGVzXc9ZCU
	qD8Snfsw==;
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5Qc-00000006NZl-42go
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:11:13 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-72267c05111so15230497b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 08:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689868; x=1758294668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgoQ+woT/93cBsRw8kKeoK5/i5b3BJOE5ioHeOB3mNE=;
        b=jRaRQCefIbzIsbTPvctzhT9XzXnDPsTMTI3lW8JzmpK+S2FPTzBzDJVJM9V8WMk0C/
         pbhieAWbCiqRp4OkLuxeTkDQ0abkgQ4f9zJPm5Bgkf6xstykvDG7XFa1Jk0JNS8mTF+7
         YkcQdr1JsNsZSKUFQ4UZyb9JnJoPlJEVPYpewY1aMOROa3yqFx147R5RWRncaZomRHgT
         bPL4BUNp1PFq+xXAw5QEWruS0mXPfX0YNxKEVNHBZF+82QMI+ZU2LkStu8bmnengPcaa
         Tly0Mpv7T2eM5YHmGcI0muT8dqOuzb2M3UawGqnap6zLLYHtuyD/HTn3OvN3O54Cn2u1
         OtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689868; x=1758294668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgoQ+woT/93cBsRw8kKeoK5/i5b3BJOE5ioHeOB3mNE=;
        b=CsOtW8SQrNPIrc4xVeIqt+L7flVaAboh6ZC7SxB49KVSh3zOD77vD3BN2RF7wQ4q+4
         RGdZS+KRa0i5OM6LLNUySX8dPtbDU6N6aDUDxfmBDktti19qBu/W/rQ5cH0qWjpAS42c
         x/8wR024dByIkmSn7TzhnvWaftEnPDrDwfb2GDZXRVn7OCsem+g/H07BrVArLjHriG4N
         67Ju2H3W710BUVm5aQRNHbOBvzBbx2vBDg5s6GgA/Zdp3mPWRM/yV8v2WG6JR/Kgm+cQ
         BO1iVSEyVd7wQ1QJZ+agNNpal4GP1yc5e3aC99XPOfVi47gb1CrJhhsnbn9KfV72Et1i
         Zlsg==
X-Forwarded-Encrypted: i=1; AJvYcCV2k76ybJvvK0nMGClonTRbDBiUEgjjkFB0DLqlNDPkxogJkQde0UYemrmKX3guQj55hADk6C2bE/pJJ8nDc4l0@lists.infradead.org
X-Gm-Message-State: AOJu0YyEwtUDY/Go1/SxfPiiciFjaJhoI6TPpgeLbEWzh0tv4gRp2rDH
	pIVIXP6/z5y5oxSr77UE1gNgT8WNhP33GvpWkNsRyGwSsiUOS7h9HtnVuCQO6Y9BjgY=
X-Gm-Gg: ASbGncvTAPKbqdtPh8hNfNCchBl86f6SBTCNPrUDSWWohdqgm4rmSk+L9ZqHYRdVNas
	YQlKt9IuvkEOR4no3xDoWL+BtgQJeeTUyrJpbVKkIVzzkMLV/7DeZ6jDAdkaDLMRKFTa32bP9PK
	FAce/bXSIAbYDCiG/fq6CDEdIbHcEEJtJ9nvxh/Tx1gKxDxVK8bDFSLleQfBbi9XjOxE4WrcDYl
	hjbtvH43FoHXQ7Oel5fHasSatA1k3gyeRELkMGzVXwojwOZRH1XB/H0QEjMhlTDCGyMWeFPwNnR
	S9DE7IvynhR7WjiVdR1eR9Rg2ImI9ImDLuJ0PgAeOLF594J/vD6EQaXgMifBLtahIf0cwmXMYTF
	4GlgHnWpVxe1/OuwdsoU4lLuC47w976icew==
X-Google-Smtp-Source: AGHT+IGUcGV4IM3PVToM3wIMhJFlncT19Inxpe70tej0adAKBemPa7cOoqolhGXuc6qPV6B9GeZ9vg==
X-Received: by 2002:a05:690c:f92:b0:70e:2d17:84b5 with SMTP id 00721157ae682-7305f99fd82mr33784177b3.0.1757689867582;
        Fri, 12 Sep 2025 08:11:07 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:11:07 -0700 (PDT)
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
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 15/16] kmemdump: Add Kinfo backend driver
Date: Fri, 12 Sep 2025 18:08:54 +0300
Message-ID: <20250912150855.2901211-16-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_161111_169244_F02111C9 
X-CRM114-Status: GOOD (  26.53  )
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

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 MAINTAINERS               |   5 +
 mm/kmemdump/Kconfig.debug |  13 ++
 mm/kmemdump/Makefile      |   1 +
 mm/kmemdump/kinfo.c       | 293 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 312 insertions(+)
 create mode 100644 mm/kmemdump/kinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8234acb24cbc..65d9e5db46a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13818,6 +13818,11 @@ F:	include/linux/kmemdump.h
 F:	mm/kmemdump/kmemdump.c
 F:	mm/kmemdump/kmemdump_coreimage.c
 
+KMEMDUMP KINFO BACKEND DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+S:	Maintained
+F:	mm/kmemdump/kinfo.c
+
 KMEMDUMP QCOM MINIDUMP BACKEND DRIVER
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
diff --git a/mm/kmemdump/Kconfig.debug b/mm/kmemdump/Kconfig.debug
index 91cec45bc3ca..ff88bf8017ae 100644
--- a/mm/kmemdump/Kconfig.debug
+++ b/mm/kmemdump/Kconfig.debug
@@ -38,3 +38,16 @@ config KMEMDUMP_QCOM_MINIDUMP_BACKEND
 	  into the minidump table of contents. Further on, the firmware
 	  will be able to read the table of contents and extract the
 	  memory regions on case-by-case basis.
+
+config KMEMDUMP_KINFO_BACKEND
+	tristate "Shared memory KInfo compatible backend"
+	depends on KMEMDUMP
+	select VMCORE_INFO
+	help
+	  Say y here to enable the Shared memory KInfo compatible backend
+	  driver.
+	  With this backend, the registered regions are copied to a shared
+	  memory zone at register time.
+	  The shared memory zone is supplied via OF.
+	  This backend will select only regions that are of interest,
+	  and keep only addresses. The format of the list is Kinfo compatible.
diff --git a/mm/kmemdump/Makefile b/mm/kmemdump/Makefile
index 6ec3871203ef..1ec94ee6c008 100644
--- a/mm/kmemdump/Makefile
+++ b/mm/kmemdump/Makefile
@@ -3,3 +3,4 @@
 obj-y += kmemdump.o
 obj-$(CONFIG_KMEMDUMP_COREIMAGE) += kmemdump_coreimage.o
 obj-$(CONFIG_KMEMDUMP_QCOM_MINIDUMP_BACKEND) += qcom_minidump.o
+obj-$(CONFIG_KMEMDUMP_KINFO_BACKEND) += kinfo.o
diff --git a/mm/kmemdump/kinfo.c b/mm/kmemdump/kinfo.c
new file mode 100644
index 000000000000..9f0ec8a1aaa2
--- /dev/null
+++ b/mm/kmemdump/kinfo.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
+ * Copyright 2021 Google LLC
+ * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
+ */
+#include <linux/platform_device.h>
+#include <linux/kallsyms.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
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
+static int register_kinfo_region(const struct kmemdump_backend *be,
+				 enum kmemdump_uid id, void *vaddr, size_t size)
+{
+	struct debug_kinfo *kinfo = be_to_kinfo(be);
+	struct kernel_all_info *all_info = kinfo->all_info_addr;
+	struct kernel_info *info = &all_info->info;
+	struct uts_namespace *uts;
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
+		info->_relative_pa = (u64)__pa(*(u64 *)vaddr);
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
+	case KMEMDUMP_ID_COREIMAGE_init_uts_ns:
+		uts = vaddr;
+		strscpy(info->last_uts_release, uts->name.release, __NEW_UTS_LEN);
+		break;
+	default:
+		break;
+	};
+
+	update_kernel_all_info(all_info);
+	return 0;
+}
+
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
+MODULE_DESCRIPTION("kmemdump Kinfo Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


