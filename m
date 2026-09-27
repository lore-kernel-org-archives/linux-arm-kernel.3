Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BCFC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 11:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BahgNxldR+zhNYXoIFgfqTGGLt20GpjDdoyoUM4NqZ0=; b=cBS4XmIScj0kq/5ucErCkF+wvj
	qRnP7WNYuAlF8hwbC6QE1+DPgTtlZexhLReNivIk7rAGOeczx6Yo/iX3eC5m8+KJkgkI6KxTgYRIL
	+dgjs9CpAv2/V273Ep7oVtVFBikR6A2oZEyzr8itTst7tqvnubTwD7L+PC9PRjBNdJQCTTkxyR724
	1y1PdIKw343LrIJJR79htUth6ReKtn95lVKEuZzoTeVcdZvFDzOWePNeqWoeKcr+AgxfxrZPADCQ9
	Arz5kA0PWvTfNeEM5DzcD3ZqMmMfbmAAuf2DGYeDgNqS3Cpt8Ifh3uiGTtAjS86L8xwm81LZxhxDU
	h86NKWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnOF-0000000GGZQ-2wfl;
	Sun, 27 Sep 2026 11:49:55 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnOD-0000000GGXi-0jiR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 11:49:54 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a003bd18e5so463185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 04:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1790509791; x=1791114591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BahgNxldR+zhNYXoIFgfqTGGLt20GpjDdoyoUM4NqZ0=;
        b=g8Rd8miI4xsrd3idvWL5648OBHW7P6PkxuZCcEM0eE5kGyfikI5r1axK4sHPrquJn6
         jJ9PpJYV5ef5hxz2yWeUlgWyLNoE63/fmI06fcZxyDDwohPVlWBzmETYTlLYOsMbQaQ/
         M8P2cNUy9tHLwDIiWf1/OZLUSqO1edT14cw6tfhIN4JMEjqE46rzjV4LxZ4DqqTNgn8x
         VzmiAg/pqapERc2jL6pvIeMbh91GpTVjERjBS6VGMyd2kTMn4FhH+o8B4apJuPCWA/4K
         pWtU8HGSBAmfkSInIzmEfb3CDkNSR7aN4LiWQPPr3AHIb6WS93gFUKCpYeGSlIspe6UH
         hXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509791; x=1791114591;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BahgNxldR+zhNYXoIFgfqTGGLt20GpjDdoyoUM4NqZ0=;
        b=vryJSw2ee9+yP/t8HeXJKa0z6HrW2jZzsiFyffG2VsPnRozS9MqqkGg9SKBhu8f5AY
         cTJc9YirqnD8mxS6i0fl7K65mLndqlIixGa7gk8Zt88GA3/UcEm83QT/yTKva5PWKwrK
         xKZsAATt/swCzw0umoegXZ2FZ9RERd9XfRfbqWsETRI5Td/LAn3LUTkvLj/SN4y/75oy
         LYsAtU0I/WN+mmhtsZLxfIvOtyF/e0aHf3GWy4t9KUpmBaZZ1sMlFNCEf6DAKwDy+Qst
         ebUzcLL9TLkndUnO0X4D+913+2YgA5vP2gYJx+LBMBdGAKlmsTJks12dBwo7BpTczvby
         Hlpw==
X-Forwarded-Encrypted: i=1; AKwUvBzhnEWpoBijAW6gKiMKcjSpDWlA1OkxOTqv3DaTa3H8tz2XJaij7fDbmbv9+npd8pC3c4rlEU7sRy92zPnT3Ybx@lists.infradead.org
X-Gm-Message-State: AFuF++kA/PDy/BXSoadfnp1K32RWy3/2xnaQmqfnsb2pEc4Fm3v4iIis
	PjqhF6JIl+0fHaCn/e23abja4JUkmtSKdfe69wrEx6NW2WXahmr+xK2r334DKJDnVOeg
X-Gm-Gg: AYBFou3TNWL+L041gb8f9yNxy2aqucstv0cv809TUH5DZg3WK2t8ijcFjqxfdvneJym
	zkocS0mU26AQ3E9WaULS1So5KrwApUHlDiSrYO19bmbvsh2DgBzkFg21pbiTWzmYq1g6yt4LBS4
	L8hXZlUsxqo2nF0yPEgwa9bMGQKQ9dXqu3zTAQr5lR9mELK6iRqGiTH/ZXZhE7N77Oz90KkgNRt
	aIIylGuGD3QkCfhOKGv3e7Dob4ujopH6elT2XTTzm8LLgrWkbuC4OVqw0oDNIj+i7qIVvXt+Um3
	MmIwqgl+QzSOPS6DR/uIuDhcaVylwEfOi3CY9zMh8oV52Vsh/09K/5FsPga7Xgi2XLCcZ9/HuzB
	awp90j7vhVtQq5eaR2WNIL52hMnIsEB59PuBIAFI1nSk9++5VPcky7wIg0ZhCe9yNZHQi0s07+9
	ioKRHob1+r2CkqykKHzXhpiL2mfunF5jKMboStHb4TPcrra4sOL8uWtEIKmsN7JcJqnOIGIgI5h
	1WWNlJdTaEXrfalRUE=
X-Received: by 2002:a05:600c:a012:b0:49f:ce73:7ac with SMTP id 5b1f17b1804b1-49ff06fc82emr122574895e9.35.1790509791448;
        Sun, 27 Sep 2026 04:49:51 -0700 (PDT)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:6d6e:8514:ff1c:6c57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm57095935e9.11.2026.09.27.04.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:49:50 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] virt: bao: add IPC shared-memory driver
Date: Sun, 27 Sep 2026 12:49:22 +0100
Message-ID: <d5b8553918e16173aaf4767e32daeb47b656a253.1790357735.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790357735.git.jpeixoto@osyx.tech>
References: <cover.1790357735.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044953_399913_0CB7DE23 
X-CRM114-Status: GOOD (  31.44  )
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

Add a driver that lets guests running on the Bao static-partitioning
hypervisor communicate through shared memory. Each guest is assigned a
read and a write region within a shared-memory area.

The IPC channels are a pure software contract between the Bao hypervisor
and its guests, so they are not described in the device tree. Each
channel is instead declared on the kernel command line:

  bao_ipcshmem.channels=<channel>[;<channel>...]

where each <channel> is

  <id>,<read_base>,<read_size>,<write_base>,<write_size>

Userspace accesses the regions through a misc character device using
read(), write() and mmap(). The read region is written by the peer and
mapped read-only at stage 2, so a writable mapping of it is refused. A
write() notifies the peer guest through a hypercall issued with the
architecture's standard hypervisor call convention: an SMCCC fast call
in the vendor-specific hypervisor service range (HVC) on arm/arm64 and
an SBI extension call (ecall) on RISC-V. The helpers live in the driver
directory, built on the generic SMCCC and SBI support, so no
architecture code is needed.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v4:
- Drop the device-tree binding and the platform driver; the channels are
  declared on the kernel command line (bao_ipcshmem.channels=<id>,<read_base>,
  <read_size>,<write_base>,<write_size>[;...]) and the misc devices are
  created from module init (Krzysztof Kozlowski).
- Move the hypercall helper out of arch/ into drivers/virt/bao/bao_hypercall.h,
  built on arm_smccc_hvc() (arm/arm64) and sbi_ecall() (RISC-V); the hypercall
  ID is defined there, folding the v3 "consolidate the IPC hypercall ID" patch
  (Will Deacon, Andrew Jones).
- Kconfig: depend on HAVE_ARM_SMCCC || RISCV; the module is now bao_ipcshmem,
  so the documented parameter name is real.
- Add wmb() before the notify hypercall; refuse writable mappings of the read
  region and clear VM_MAYWRITE; require page-aligned regions and reject ranges
  that do not fit phys_addr_t/size_t; add .llseek; enlarge the label buffer;
  do the mmap offset arithmetic in u64 (Sashiko review).
- Devices live and die with the module and open files pin it, closing the
  unbind use-after-free of v3.

 drivers/virt/Kconfig                 |   2 +
 drivers/virt/Makefile                |   1 +
 drivers/virt/bao/Kconfig             |   3 +
 drivers/virt/bao/Makefile            |   3 +
 drivers/virt/bao/bao_hypercall.h     |  90 +++++++
 drivers/virt/bao/ipcshmem/Kconfig    |  16 ++
 drivers/virt/bao/ipcshmem/Makefile   |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c | 358 +++++++++++++++++++++++++++
 8 files changed, 476 insertions(+)
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/bao_hypercall.h
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c

diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 52eb7e4ba71f..cb98c4c52fd1 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -47,6 +47,8 @@ source "drivers/virt/nitro_enclaves/Kconfig"
 
 source "drivers/virt/acrn/Kconfig"
 
+source "drivers/virt/bao/Kconfig"
+
 endif
 
 source "drivers/virt/coco/Kconfig"
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index f29901bd7820..ff873bfd453e 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -10,3 +10,4 @@ obj-y				+= vboxguest/
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
 obj-y				+= coco/
+obj-y				+= bao/
diff --git a/drivers/virt/bao/Kconfig b/drivers/virt/bao/Kconfig
new file mode 100644
index 000000000000..4f7929d57475
--- /dev/null
+++ b/drivers/virt/bao/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+source "drivers/virt/bao/ipcshmem/Kconfig"
diff --git a/drivers/virt/bao/Makefile b/drivers/virt/bao/Makefile
new file mode 100644
index 000000000000..68f5d3f282c4
--- /dev/null
+++ b/drivers/virt/bao/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_BAO_SHMEM) += ipcshmem/
diff --git a/drivers/virt/bao/bao_hypercall.h b/drivers/virt/bao/bao_hypercall.h
new file mode 100644
index 000000000000..9875e27f312d
--- /dev/null
+++ b/drivers/virt/bao/bao_hypercall.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Bao Hypervisor hypercall interface
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ *
+ * Bao exposes its hypercalls through the architecture's standard hypervisor
+ * call convention: SMCCC fast calls in the vendor-specific hypervisor service
+ * range, issued with HVC, on arm/arm64 and an SBI extension, issued with
+ * ecall, on RISC-V. The helpers below are built on the generic SMCCC and SBI
+ * support, so no architecture-specific code is needed.
+ */
+
+#ifndef __BAO_HYPERCALL_H
+#define __BAO_HYPERCALL_H
+
+#include <linux/types.h>
+
+/* IPC through shared-memory hypercall ID */
+#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
+
+#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
+
+#include <linux/arm-smccc.h>
+
+#ifdef CONFIG_ARM64
+#define BAO_SMCCC_CONV ARM_SMCCC_SMC_64
+#else
+#define BAO_SMCCC_CONV ARM_SMCCC_SMC_32
+#endif
+
+/* Bao hypercalls are fast calls in the vendor-specific hypervisor range. */
+#define BAO_HYPERCALL_FID(id)						\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, BAO_SMCCC_CONV,		\
+			   ARM_SMCCC_OWNER_VENDOR_HYP, (id))
+
+/**
+ * bao_ipcshmem_hypercall - Notify the peer of an IPC shared-memory channel
+ * @ipcshmem_id: Hypervisor-assigned channel identifier
+ *
+ * Return: The hypervisor status code, 0 on success.
+ */
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_hvc(BAO_HYPERCALL_FID(BAO_IPCSHMEM_HYPERCALL_ID), ipcshmem_id,
+		      0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+#elif defined(CONFIG_RISCV)
+
+#include <asm/sbi.h>
+
+/*
+ * Bao SBI extension ID.
+ *
+ * This currently lives in the SBI experimental extension space
+ * (0x08000000-0x08FFFFFF). A permanent ID has to be assigned through the
+ * RISC-V SBI specification before the RISC-V support can be considered
+ * stable; until then the RISC-V backend is experimental.
+ */
+#define BAO_SBI_EXT_ID 0x08000ba0
+
+/**
+ * bao_ipcshmem_hypercall - Notify the peer of an IPC shared-memory channel
+ * @ipcshmem_id: Hypervisor-assigned channel identifier
+ *
+ * Return: The SBI error code, 0 on success.
+ */
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long ipcshmem_id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(BAO_SBI_EXT_ID, BAO_IPCSHMEM_HYPERCALL_ID, ipcshmem_id,
+			0, 0, 0, 0, 0);
+
+	return ret.error;
+}
+
+#endif
+
+#endif /* __BAO_HYPERCALL_H */
diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshmem/Kconfig
new file mode 100644
index 000000000000..afc904c8c78e
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+config BAO_SHMEM
+	tristate "Bao hypervisor shared memory support"
+	depends on HAVE_ARM_SMCCC || RISCV
+	help
+	  This enables support for Bao shared memory communication.
+	  It allows the kernel to interface with guests running under
+	  the Bao hypervisor, providing a character device interface
+	  for exchanging data through dedicated shared-memory regions.
+	  Channels are declared on the kernel command line via
+	  "bao_ipcshmem.channels=".
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called bao_ipcshmem.
+
+	  If unsure, say N.
diff --git a/drivers/virt/bao/ipcshmem/Makefile b/drivers/virt/bao/ipcshmem/Makefile
new file mode 100644
index 000000000000..2fa38c301ee0
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_BAO_SHMEM) += bao_ipcshmem.o
+bao_ipcshmem-y := ipcshmem.o
diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcshmem/ipcshmem.c
new file mode 100644
index 000000000000..f8f4b615200a
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor IPC Through Shared-memory Driver
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * The IPC shared-memory channels are a pure software contract between the Bao
+ * hypervisor and its guests, so they are not described in the device tree.
+ * Each channel is instead declared on the kernel command line:
+ *
+ *   bao_ipcshmem.channels=<channel>[;<channel>...]
+ *
+ * where each <channel> is
+ *
+ *   <id>,<read_base>,<read_size>,<write_base>,<write_size>
+ *
+ * Addresses and sizes are parsed with kstrtoull() (so "0x" hex is accepted)
+ * and must be page-aligned.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/io.h>
+#include <linux/list.h>
+#include <linux/miscdevice.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/wordpart.h>
+#include "../bao_hypercall.h"
+
+/* "baoipc" + up to 10 digits of a u32 + NUL. */
+#define BAO_IPCSHMEM_NAME_LEN 24
+
+static char *channels;
+module_param(channels, charp, 0444);
+MODULE_PARM_DESC(channels,
+		 "Bao IPC channels: <id>,<read_base>,<read_size>,<write_base>,<write_size>[;...]");
+
+/**
+ * struct bao_ipcshmem - a single Bao IPC shared-memory channel
+ * @list: entry in the global channel list
+ * @miscdev: character device exposing the channel to userspace
+ * @id: hypervisor-assigned channel identifier, passed to the notify hypercall
+ * @label: backing storage for @miscdev.name
+ * @read_base: kernel mapping of the region this guest reads from
+ * @read_phys: physical base of the read region
+ * @read_size: size of the read region
+ * @write_base: kernel mapping of the region this guest writes to
+ * @write_phys: physical base of the write region
+ * @write_size: size of the write region
+ */
+struct bao_ipcshmem {
+	struct list_head list;
+	struct miscdevice miscdev;
+	u32 id;
+	char label[BAO_IPCSHMEM_NAME_LEN];
+	void *read_base;
+	phys_addr_t read_phys;
+	size_t read_size;
+	void *write_base;
+	phys_addr_t write_phys;
+	size_t write_size;
+};
+
+static LIST_HEAD(bao_ipcshmem_devices);
+
+static int bao_ipcshmem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	unsigned long vsize = vma->vm_end - vma->vm_start;
+	u64 offset = (u64)vma->vm_pgoff << PAGE_SHIFT;
+	phys_addr_t region_phys;
+	size_t region_size;
+	bool read_region;
+
+	if (!vsize)
+		return -EINVAL;
+
+	/*
+	 * The read region is exposed at offset 0 and the write region right
+	 * after it. A single mapping cannot span both regions, since they are
+	 * not guaranteed to be physically contiguous.
+	 */
+	if (offset < bao->read_size) {
+		region_phys = bao->read_phys;
+		region_size = bao->read_size;
+		read_region = true;
+	} else if (offset < (u64)bao->read_size + bao->write_size) {
+		offset -= bao->read_size;
+		region_phys = bao->write_phys;
+		region_size = bao->write_size;
+		read_region = false;
+	} else {
+		return -EINVAL;
+	}
+
+	/*
+	 * The read region is written by the peer and is read-only for this
+	 * guest; the hypervisor maps it read-only at stage 2, so refuse a
+	 * writable mapping rather than let userspace take a stage-2 fault,
+	 * and make sure a later mprotect(PROT_WRITE) cannot re-enable it.
+	 */
+	if (read_region) {
+		if (vma->vm_flags & VM_WRITE)
+			return -EACCES;
+		vm_flags_clear(vma, VM_MAYWRITE);
+	}
+
+	if (vsize > region_size - offset)
+		return -EINVAL;
+
+	region_phys += offset;
+	if (!PAGE_ALIGNED(region_phys))
+		return -EINVAL;
+
+	return remap_pfn_range(vma, vma->vm_start, region_phys >> PAGE_SHIFT,
+			       vsize, vma->vm_page_prot);
+}
+
+static ssize_t bao_ipcshmem_read(struct file *filp, char __user *buf,
+				 size_t count, loff_t *ppos)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	size_t available;
+
+	if (*ppos >= bao->read_size)
+		return 0;
+
+	available = bao->read_size - *ppos;
+	count = min(count, available);
+
+	if (copy_to_user(buf, bao->read_base + *ppos, count))
+		return -EFAULT;
+
+	*ppos += count;
+	return count;
+}
+
+static ssize_t bao_ipcshmem_write(struct file *filp, const char __user *buf,
+				  size_t count, loff_t *ppos)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	size_t available;
+
+	if (*ppos >= bao->write_size)
+		return 0;
+
+	available = bao->write_size - *ppos;
+	count = min(count, available);
+
+	if (copy_from_user(bao->write_base + *ppos, buf, count))
+		return -EFAULT;
+
+	*ppos += count;
+
+	/*
+	 * Ensure the data written above is globally visible before the
+	 * hypercall notifies the peer guest (SMCCC requires the caller to make
+	 * memory updates visible before the SMC/HVC).
+	 */
+	wmb();
+
+	/* Notify Bao hypervisor */
+	bao_ipcshmem_hypercall(bao->id);
+
+	return count;
+}
+
+static int bao_ipcshmem_open(struct inode *inode, struct file *filp)
+{
+	struct bao_ipcshmem *bao;
+
+	bao = container_of(filp->private_data, struct bao_ipcshmem, miscdev);
+	filp->private_data = bao;
+
+	return 0;
+}
+
+static int bao_ipcshmem_release(struct inode *inode, struct file *filp)
+{
+	filp->private_data = NULL;
+	return 0;
+}
+
+static const struct file_operations bao_ipcshmem_fops = {
+	.owner = THIS_MODULE,
+	.read = bao_ipcshmem_read,
+	.write = bao_ipcshmem_write,
+	.mmap = bao_ipcshmem_mmap,
+	.open = bao_ipcshmem_open,
+	.release = bao_ipcshmem_release,
+	.llseek = default_llseek,
+};
+
+static void bao_ipcshmem_free(struct bao_ipcshmem *bao)
+{
+	if (bao->write_base)
+		memunmap(bao->write_base);
+	if (bao->read_base)
+		memunmap(bao->read_base);
+	kfree(bao);
+}
+
+/*
+ * A region must be non-empty and page-aligned, must not wrap around and must
+ * be addressable on this architecture (the command line values are 64-bit).
+ */
+static bool bao_ipcshmem_region_valid(u64 base, u64 size)
+{
+	u64 end;
+
+	if (!size || !PAGE_ALIGNED(base) || !PAGE_ALIGNED(size))
+		return false;
+
+	end = base + size - 1;
+	if (end < base)
+		return false;
+
+	if (sizeof(phys_addr_t) < sizeof(u64) && upper_32_bits(end))
+		return false;
+
+	if (sizeof(size_t) < sizeof(u64) && upper_32_bits(size))
+		return false;
+
+	return true;
+}
+
+static int bao_ipcshmem_add(u32 id, u64 read_base, u64 read_size,
+			    u64 write_base, u64 write_size)
+{
+	struct bao_ipcshmem *bao;
+	int ret;
+
+	if (!bao_ipcshmem_region_valid(read_base, read_size) ||
+	    !bao_ipcshmem_region_valid(write_base, write_size)) {
+		pr_err("channel %u: invalid region\n", id);
+		return -EINVAL;
+	}
+
+	bao = kzalloc(sizeof(*bao), GFP_KERNEL);
+	if (!bao)
+		return -ENOMEM;
+
+	bao->id = id;
+	bao->read_phys = read_base;
+	bao->read_size = read_size;
+	bao->write_phys = write_base;
+	bao->write_size = write_size;
+
+	bao->read_base = memremap(bao->read_phys, bao->read_size, MEMREMAP_WB);
+	if (!bao->read_base) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
+	bao->write_base = memremap(bao->write_phys, bao->write_size,
+				   MEMREMAP_WB);
+	if (!bao->write_base) {
+		ret = -ENOMEM;
+		goto err_free;
+	}
+
+	scnprintf(bao->label, sizeof(bao->label), "baoipc%u", id);
+	bao->miscdev.minor = MISC_DYNAMIC_MINOR;
+	bao->miscdev.name = bao->label;
+	bao->miscdev.fops = &bao_ipcshmem_fops;
+
+	ret = misc_register(&bao->miscdev);
+	if (ret) {
+		pr_err("channel %u: misc_register failed: %d\n", id, ret);
+		goto err_free;
+	}
+
+	list_add_tail(&bao->list, &bao_ipcshmem_devices);
+	return 0;
+
+err_free:
+	bao_ipcshmem_free(bao);
+	return ret;
+}
+
+static void bao_ipcshmem_remove_all(void)
+{
+	struct bao_ipcshmem *bao, *tmp;
+
+	list_for_each_entry_safe(bao, tmp, &bao_ipcshmem_devices, list) {
+		list_del(&bao->list);
+		misc_deregister(&bao->miscdev);
+		bao_ipcshmem_free(bao);
+	}
+}
+
+/* Parse one "<id>,<rbase>,<rsize>,<wbase>,<wsize>" channel descriptor. */
+static int bao_ipcshmem_parse_one(char *desc)
+{
+	u64 vals[4];
+	char *tok;
+	u32 id;
+	int i;
+
+	tok = strsep(&desc, ",");
+	if (!tok || kstrtou32(tok, 0, &id))
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(vals); i++) {
+		tok = strsep(&desc, ",");
+		if (!tok || kstrtoull(tok, 0, &vals[i]))
+			return -EINVAL;
+	}
+
+	if (desc && *desc)
+		return -EINVAL;
+
+	return bao_ipcshmem_add(id, vals[0], vals[1], vals[2], vals[3]);
+}
+
+static int __init bao_ipcshmem_init(void)
+{
+	char *buf, *p, *desc;
+	int ret = 0;
+
+	if (!channels || !*channels)
+		return 0;
+
+	buf = kstrdup(channels, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	p = buf;
+	while ((desc = strsep(&p, ";")) != NULL) {
+		if (!*desc)
+			continue;
+		ret = bao_ipcshmem_parse_one(desc);
+		if (ret) {
+			pr_err("bad 'channels' descriptor\n");
+			bao_ipcshmem_remove_all();
+			break;
+		}
+	}
+
+	kfree(buf);
+	return ret;
+}
+
+static void __exit bao_ipcshmem_exit(void)
+{
+	bao_ipcshmem_remove_all();
+}
+
+module_init(bao_ipcshmem_init);
+module_exit(bao_ipcshmem_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("David Cerdeira <davidmcerdeira@osyx.tech>");
+MODULE_AUTHOR("José Martins <jose@osyx.tech>");
+MODULE_AUTHOR("João Peixoto <jpeixoto@osyx.tech>");
+MODULE_DESCRIPTION("Bao Hypervisor IPC Through Shared-memory Driver");
-- 
2.43.0


