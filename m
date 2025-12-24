Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2794E7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJkpRMY171vY3L0h7v1fPXyaunxRTtx28UxKO+p6tOY=; b=nk/WF3rD67JixdyAjgzD9vyOX8
	lHeTQSaK3p70Gx7oOU6HqH/NqDNynU0MVqTg6R3IhYD8UMlAmaZvp/yC1QKD3GLTplZND3ydzomwN
	v8cM4g/vl4EZnbQmqZuG9bUonZrJwH4RUs0cAB9gHDgkJshKA9Gl3EkvPy7zsYEhyLBRuTiX5S9dd
	SH5PTJECUqWn7NOVBxKdMJurWqV6XV/7/zuCP8yeSrvFVsQBZRiffMJilDXthLYcuQ5mnu1AQCsiJ
	lz84MRq8hwPOyBXQOEgQlXqXwHViViXTkF/en6LSHBsqQXDNIb0LBKaEDIf9lvisBMkfT5VMXjo5p
	UNd+D3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRCg-0000000HAPb-3vlf;
	Wed, 24 Dec 2025 15:55:10 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRCS-0000000HAL5-04JA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 15:54:57 +0000
Received: by mail-ed1-x542.google.com with SMTP id 4fb4d7f45d1cf-649e28dccadso9958794a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 07:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20230601.gappssmtp.com; s=20230601; t=1766591694; x=1767196494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJkpRMY171vY3L0h7v1fPXyaunxRTtx28UxKO+p6tOY=;
        b=b8iCz7bVJ7c732B26bIaex0AfXKFHzZtGBJ8VL4q9g6xmlEuWNA9/S+WQDaNhH9F0n
         limEx89fEfcj2zalR8dAKgSFds6pg7eHmLFB0rQM5Zj6ofgBhILOBSYpmyhSc1XUGhJw
         9eVLzq4n8Wn/mVw7Fzk7Ea8TUL6giZ5MRklkc3YBo+U9yrzzdwGkoDrnJK/nh5vpYwwH
         5nZdBusZ6RjANAta99BnCElLrjlTHP860z1X50QslPE1F1mHiF8wiMLbjmJLPWa19OcR
         0AEyQ9OeJ8ixEjEYuwBZ2wHmsh75WylJhhcvFhaIB/YENPuUg7UQws5X1jF+UfVkhdMj
         EW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766591694; x=1767196494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJkpRMY171vY3L0h7v1fPXyaunxRTtx28UxKO+p6tOY=;
        b=SOudTdMAyrh/PAmtnx/5Oe2wFkLQBtQmW7cBREwH60EIfgyDXSV8Scnnb/SMv6NfAL
         nPy+XRQjhOfn/3dXAOZbEDpjSGkzyp3HRu+Z2DWzYhdikWWe3b/CiYwiXSM4YTvdXUvy
         0wd09dv5r2ap7M6fY9I/fRXof+TJMSg9z3FFeKl4o7w1gQl4N7aUIU7lYdloknI9Limf
         nlJWaDbL1fz+Qa/34b3J81SMT9/CLDsLbt2EGlX2WMcidrdewtPvxJdAHIHws4AFjA40
         f5x0Qy8U9JhXEMyRPR7j0xoO9+eIpO8r2Sm4Igxz/6jNxf0lQFhXRYYGqFjh4InKLXBD
         PSSw==
X-Forwarded-Encrypted: i=1; AJvYcCVyjN8dHi8ynE2qKo16XV3yRRRXca+dv9GjBa5nMinn8Hih6bZaUu8WwYzhOcjDHBAee7tZavY0EwTRJ0w9zegI@lists.infradead.org
X-Gm-Message-State: AOJu0YyPAJnN++Ol9km+JNY7R+I59mC+XBM1AjK9yKK+AbR68Z1BrxFa
	kJgEg/yhvxYR4ZdL7Tw1m9hnjc2pOwhJWZ5nEl/bTa73j5P9ic30sFjer/V4+Px3dl0IISXLxYQ
	xHadt3acI
X-Gm-Gg: AY/fxX6qcQxEwzA9U8Sz+ecBqbA+9qNswMeo9Zsph3j2JpfYgxTjai7UqJK9V+gnZo5
	H7gQy4K5zp5SJq+QDmQl89DIopcZOPUH9knc3uqHQ7qZQmCRXfX3ty/leSrCR5U3iVYyU/AB8iF
	mtH4a/CWuxQwDcwnl07tMe0tXcheMJTEt3k5+OFqG2D2NjkCjmxqQ+wKnXlZHOzH687B/xCtfpy
	SiJ4VvIbQh2QjHkn9Gu3gZLBxqEYy0ODkOI/Fl4Kj61g50EeEHRQvK6xKn/6o6TJq2NEY/KXWj6
	5yGgpOPgGKcHgw6ozym0hH3sbiN1jU6mYc9R2SQZNFB5tRdBUD748SoJua0dRLSe0z5V61KtpU9
	CO9P6algtx269TAgujN2pV5TKFgLl2SkzYcKYqBYF03WFA69vuwbdN899Ce2o6he5L07O5jbfMM
	ux8KLBKpYzPgCowf+LpQ==
X-Google-Smtp-Source: AGHT+IFoD/NhA0rxBVvmihrITY4sie8giUtNeWvA8wocBW66o3SMKffzkvrHP32aOGkRlyEpA+8vEA==
X-Received: by 2002:a05:6000:2386:b0:430:f718:2388 with SMTP id ffacd0b85a97d-4324e4bfa20mr16996119f8f.8.1766584383195;
        Wed, 24 Dec 2025 05:53:03 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:39e4:e84d:192a:5c5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm34494677f8f.35.2025.12.24.05.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 05:53:02 -0800 (PST)
From: joaopeixoto@osyx.tech
To: linux-kernel@vger.kernel.org
Cc: ajd@linux.ibm.com,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bagasdotme@gmail.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	corbet@lwn.net,
	dan.j.williams@intel.com,
	davidmcerdeira@osyx.tech,
	devicetree@vger.kernel.org,
	dev@kael-k.io,
	gregkh@linuxfoundation.org,
	haren@linux.ibm.com,
	heiko@sntech.de,
	joaopeixoto@osyx.tech,
	jose@osyx.tech,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@armlinux.org.uk,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maddy@linux.ibm.com,
	mani@kernel.org,
	nathan@kernel.org,
	neil.armstrong@linaro.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org,
	will@kernel.org
Subject: [PATCH 2/5] virt: add Bao IPC shared memory driver
Date: Wed, 24 Dec 2025 13:52:14 +0000
Message-ID: <20251224135217.25350-3-joaopeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224135217.25350-1-joaopeixoto@osyx.tech>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_075456_414007_F22E3CF9 
X-CRM114-Status: GOOD (  26.73  )
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

From: João Peixoto <joaopeixoto@osyx.tech>

Add a new driver providing an interface for communication with guests
hosted by the Bao hypervisor using shared-memory channels. The driver
exposes read/write regions defined in device tree and notifies the
hypervisor via an architecture-specific hypercall (SMC/HVC on ARM and
SBI ecall on RISC-V).

The patch introduces:
  - drivers/bao/ with the initial Bao IPC shared-memory implementation
  - Kconfig entry enabling BAO_SHMEM
  - Makefile integration for building the driver
  - A character device interface supporting mmap(), read(), and write()
  - Platform driver support using DT properties for channel layout

Each device instance maps its assigned shared-memory region, validates
read/write channel configuration, and exposes a /dev/baoipc<N> node
used by user space to exchange data with Bao guests.

Signed-off-by: João Peixoto <joaopeixoto@osyx.tech>
---
 drivers/virt/Kconfig                 |   2 +
 drivers/virt/Makefile                |   1 +
 drivers/virt/bao/Kconfig             |   3 +
 drivers/virt/bao/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/Kconfig    |   9 +
 drivers/virt/bao/ipcshmem/Makefile   |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c | 539 +++++++++++++++++++++++++++
 7 files changed, 560 insertions(+)
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
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
index f29901bd7820..623a671f8711 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -10,3 +10,4 @@ obj-y				+= vboxguest/
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
 obj-y				+= coco/
+obj-$(CONFIG_BAO_SHMEM)		+= bao/
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
diff --git a/drivers/virt/bao/ipcshmem/Kconfig b/drivers/virt/bao/ipcshmem/Kconfig
new file mode 100644
index 000000000000..42690073e819
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/Kconfig
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+config BAO_SHMEM
+	tristate "Bao hypervisor shared memory support"
+
+	help
+	This enables support for Bao shared memory communication.
+	It allows the kernel to interface with guests running under
+	the Bao hypervisor, providing a character device interface
+	for exchanging data through dedicated shared-memory regions.
diff --git a/drivers/virt/bao/ipcshmem/Makefile b/drivers/virt/bao/ipcshmem/Makefile
new file mode 100644
index 000000000000..e027dcdb06aa
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_BAO_SHMEM) += bao.o
+bao-objs += ipcshmem.o
diff --git a/drivers/virt/bao/ipcshmem/ipcshmem.c b/drivers/virt/bao/ipcshmem/ipcshmem.c
new file mode 100644
index 000000000000..cadb79bfca6e
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
@@ -0,0 +1,539 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor IPC Through Shared-memory Driver
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	João Peixoto <joaopeixoto@osyx.tech>
+ */
+
+#include <linux/types.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/uaccess.h>
+#include <linux/fs.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/interrupt.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
+#include <linux/platform_device.h>
+#include <linux/ioctl.h>
+#include <linux/cdev.h>
+#include <linux/device.h>
+#include <linux/spinlock.h>
+#include <linux/mutex.h>
+#include <linux/wait.h>
+#include <linux/mm.h>
+
+#if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
+#include <linux/arm-smccc.h>
+#include <asm/memory.h>
+#elif CONFIG_RISCV
+#include <asm/sbi.h>
+#endif
+
+#define DEV_NAME "baoipc"
+#define MAX_DEVICES 16
+#define NAME_LEN 32
+
+static dev_t bao_ipcshmem_devt;
+struct class *cl;
+
+/**
+ * struct bao_ipcshmem - Bao IPC shared memory device
+ * @cdev: Character device interface
+ * @dev: Device structure
+ * @id: Device instance ID
+ * @label: Name/label of the device
+ * @read_base: Base address of the read channel
+ * @read_size: Size of the read channel
+ * @write_base: Base address of the write channel
+ * @write_size: Size of the write channel
+ * @physical_base: Physical memory base address
+ * @shmem_size: Total size of the shared memory region
+ */
+struct bao_ipcshmem {
+	struct cdev cdev;
+	struct device *dev;
+	int id;
+	char label[NAME_LEN];
+	void *read_base;
+	size_t read_size;
+	void *write_base;
+	size_t write_size;
+	phys_addr_t *physical_base;
+	size_t shmem_size;
+};
+
+#ifdef CONFIG_ARM64
+/**
+ * bao_ipcshmem_notify - Notify the Bao hypervisor of an IPC shared memory event (ARM64)
+ * @dev: IPC shared memory device
+ *
+ * Executes a fast SMC hypercall to notify the hypervisor of an event
+ * associated with the given IPC shared memory device.
+ *
+ * Return: Hypercall return value.
+ */
+static uint64_t bao_ipcshmem_notify(struct bao_ipcshmem *dev)
+{
+	register uint64_t x0 asm("x0") =
+		ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
+				   ARM_SMCCC_OWNER_VENDOR_HYP, 1);
+	register uint64_t x1 asm("x1") = dev->id;
+	register uint64_t x2 asm("x2") = 0;
+
+	asm volatile("hvc 0\t\n" : "=r"(x0) : "r"(x0), "r"(x1), "r"(x2));
+
+	return x0;
+}
+#elif CONFIG_ARM
+/**
+ * bao_ipcshmem_notify - Notify the Bao hypervisor of an IPC shared memory event (ARM)
+ * @dev: IPC shared memory device
+ *
+ * Executes a fast SMC hypercall to notify the hypervisor of an event
+ * associated with the given IPC shared memory device.
+ *
+ * Return: Hypercall return value.
+ */
+static uint32_t bao_ipcshmem_notify(struct bao_ipcshmem *dev)
+{
+	register uint32_t r0 asm("r0") =
+		ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,
+				   ARM_SMCCC_OWNER_VENDOR_HYP, 1);
+	register uint32_t r1 asm("r1") = dev->id;
+	register uint32_t r2 asm("r2") = 0;
+
+	asm volatile("hvc #0\t\n" : "=r"(r0) : "r"(r0), "r"(r1), "r"(r2));
+
+	return r0;
+}
+#elif CONFIG_RISCV
+/**
+ * bao_ipcshmem_notify - Notify the Bao hypervisor of an IPC shared memory event (RISC-V)
+ * @dev: IPC shared memory device
+ *
+ * Executes an SBI call to notify the Bao hypervisor of an IPC shared memory event.
+ *
+ * Return: SBI call error code.
+ */
+static uint64_t bao_ipcshmem_notify(struct bao_ipcshmem *dev)
+{
+	struct sbiret ret = sbi_ecall(0x08000ba0, 1, dev->id, 0, 0, 0, 0, 0);
+
+	return ret.error;
+}
+#endif
+
+/**
+ * bao_ipcshmem_mmap_fops - mmap handler for IPC shared memory
+ * @filp: File pointer
+ * @vma: Virtual memory area
+ *
+ * Maps the physical shared memory of the Bao IPC device into
+ * userspace using remap_pfn_range.
+ *
+ * Return: 0 on success, -EFAULT on failure.
+ */
+static int bao_ipcshmem_mmap_fops(struct file *filp, struct vm_area_struct *vma)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	unsigned long vsize = vma->vm_end - vma->vm_start;
+	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
+	phys_addr_t paddr;
+
+	if (WARN_ON_ONCE(!bao))
+		return -ENODEV;
+
+	if (!vsize)
+		return -EINVAL;
+
+	if (offset >= bao->shmem_size)
+		return -EINVAL;
+
+	if (vsize > bao->shmem_size - offset)
+		return -EINVAL;
+
+	paddr = (phys_addr_t)bao->physical_base + offset;
+
+	if (!PAGE_ALIGNED(paddr))
+		return -EINVAL;
+
+	if (remap_pfn_range(vma, vma->vm_start,
+			    paddr >> PAGE_SHIFT,
+			    vsize, vma->vm_page_prot))
+		return -EFAULT;
+
+	return 0;
+}
+
+/**
+ * bao_ipcshmem_read_fops - read handler for IPC shared memory
+ * @filp: File pointer
+ * @buf: Userspace buffer
+ * @count: Number of bytes to read
+ * @ppos: File offset
+ *
+ * Copies data from the Bao IPC read buffer to userspace.
+ *
+ * Return: Number of bytes read, or 0 if EOF.
+ */
+static ssize_t bao_ipcshmem_read_fops(struct file *filp, char __user *buf,
+				      size_t count, loff_t *ppos)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	size_t available;
+
+	if (WARN_ON_ONCE(!bao || !buf || !ppos))
+		return -EINVAL;
+
+	if (*ppos >= bao->read_size)
+		return 0;
+
+	available = bao->read_size - *ppos;
+	if (count > available)
+		count = available;
+
+	if (copy_to_user(buf, bao->read_base + *ppos, count))
+		return -EFAULT;
+
+	*ppos += count;
+	return count;
+}
+
+/**
+ * bao_ipcshmem_write_fops - write handler for IPC shared memory
+ * @filp: File pointer
+ * @buf: Userspace buffer
+ * @count: Number of bytes to write
+ * @ppos: File offset
+ *
+ * Copies data from userspace to the Bao IPC write buffer and
+ * notifies the hypervisor of the update.
+ *
+ * Return: Number of bytes written.
+ */
+static ssize_t bao_ipcshmem_write_fops(struct file *filp, const char __user *buf,
+				       size_t count, loff_t *ppos)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	size_t avail;
+
+	if (WARN_ON_ONCE(!bao || !buf || !ppos))
+		return -EINVAL;
+
+	if (*ppos >= bao->write_size)
+		return 0;
+
+	avail = bao->write_size - *ppos;
+	if (count > avail)
+		count = avail;
+
+	if (copy_from_user(bao->write_base + *ppos, buf, count))
+		return -EFAULT;
+
+	*ppos += count;
+
+	/* Notify any listeners that new data is available */
+	bao_ipcshmem_notify(bao);
+
+	return count;
+}
+
+/**
+ * bao_ipcshmem_open_fops - open handler for IPC shared memory
+ * @inode: Inode pointer
+ * @filp: File pointer
+ *
+ * Associates the file with the Bao IPC device and increments
+ * the kobject reference.
+ *
+ * Return: 0 on success.
+ */
+static int bao_ipcshmem_open_fops(struct inode *inode, struct file *filp)
+{
+	struct bao_ipcshmem *bao;
+
+	if (WARN_ON_ONCE(!inode || !filp))
+		return -EINVAL;
+
+	bao = container_of(inode->i_cdev, struct bao_ipcshmem, cdev);
+	filp->private_data = bao;
+
+	kobject_get(&bao->dev->kobj);
+
+	return 0;
+}
+
+/**
+ * bao_ipcshmem_release_fops - release handler for IPC shared memory
+ * @inode: Inode pointer
+ * @filp: File pointer
+ *
+ * Disassociates the file from the Bao IPC device and decrements
+ * the kobject reference.
+ *
+ * Return: 0 on success.
+ */
+static int bao_ipcshmem_release_fops(struct inode *inode, struct file *filp)
+{
+	struct bao_ipcshmem *bao;
+
+	if (WARN_ON_ONCE(!inode || !filp))
+		return -EINVAL;
+
+	bao = container_of(inode->i_cdev, struct bao_ipcshmem, cdev);
+	filp->private_data = NULL;
+
+	kobject_put(&bao->dev->kobj);
+
+	return 0;
+}
+
+static const struct file_operations bao_ipcshmem_fops = {
+	.owner = THIS_MODULE,
+	.read = bao_ipcshmem_read_fops,
+	.write = bao_ipcshmem_write_fops,
+	.mmap = bao_ipcshmem_mmap_fops,
+	.open = bao_ipcshmem_open_fops,
+	.release = bao_ipcshmem_release_fops
+};
+
+/**
+ * bao_ipcshmem_register - Register a Bao IPC shared memory device
+ * @pdev: Platform device
+ *
+ * Maps the shared memory region, validates channel layout, initializes
+ * the read/write buffers, registers the character device, and creates
+ * the sysfs device entry.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int bao_ipcshmem_register(struct platform_device *pdev)
+{
+	int ret = 0, id = -1;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct module *owner = THIS_MODULE;
+	struct resource *r;
+	dev_t devt;
+	resource_size_t shmem_size;
+	u32 write_offset, read_offset, write_size, read_size;
+	bool rd_in_range, wr_in_range, disjoint;
+	void *shmem_base_addr = NULL;
+	struct bao_ipcshmem *bao;
+
+	/* Get memory resource */
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		dev_err(dev, "failed to get memory resource\n");
+		return -EINVAL;
+	}
+
+	/* Read channel offsets and sizes */
+	of_property_read_u32_index(np, "read-channel", 0, &read_offset);
+	of_property_read_u32_index(np, "read-channel", 1, &read_size);
+	of_property_read_u32_index(np, "write-channel", 0, &write_offset);
+	of_property_read_u32_index(np, "write-channel", 1, &write_size);
+
+	/* Validate memory layout */
+	rd_in_range = (r->start + read_offset + read_size) <= r->end;
+	wr_in_range = (r->start + write_offset + write_size) <= r->end;
+	disjoint = ((read_offset + read_size) <= write_offset) ||
+		   ((write_offset + write_size) <= read_offset);
+
+	if (!rd_in_range || !wr_in_range || !disjoint) {
+		dev_err(dev, "invalid channel layout\n");
+		dev_err(dev, "rd_in_range=%d, wr_in_range=%d, disjoint=%d\n",
+			rd_in_range, wr_in_range, disjoint);
+		return -EINVAL;
+	}
+
+	/* Map shared memory */
+	shmem_size = r->end - r->start + 1;
+	shmem_base_addr = memremap(r->start, shmem_size, MEMREMAP_WB);
+	if (!shmem_base_addr) {
+		dev_err(dev, "failed to map shared memory\n");
+		return -ENOMEM;
+	}
+
+	/* Read device ID from device tree */
+	of_property_read_u32(np, "id", &id);
+	if (id >= MAX_DEVICES) {
+		dev_err(dev, "invalid device id %d\n", id);
+		ret = -EINVAL;
+		goto err_unmap;
+	}
+
+	/* Allocate and initialize device structure */
+	bao = devm_kzalloc(dev, sizeof(*bao), GFP_KERNEL);
+	if (!bao) {
+		ret = -ENOMEM;
+		goto err_unmap;
+	}
+
+	snprintf(bao->label, NAME_LEN, "%s%d", DEV_NAME, id);
+	bao->id = id;
+	bao->read_size = read_size;
+	bao->write_size = write_size;
+	bao->read_base = shmem_base_addr + read_offset;
+	bao->write_base = shmem_base_addr + write_offset;
+	bao->physical_base = (void *)r->start;
+	bao->shmem_size = shmem_size;
+
+	cdev_init(&bao->cdev, &bao_ipcshmem_fops);
+	bao->cdev.owner = owner;
+
+	/* Add character device */
+	devt = MKDEV(MAJOR(bao_ipcshmem_devt), id);
+	ret = cdev_add(&bao->cdev, devt, 1);
+	if (ret)
+		goto err_unmap;
+
+	/* Create device node */
+	bao->dev = device_create(cl, dev, devt, bao, bao->label);
+	if (IS_ERR(bao->dev)) {
+		ret = PTR_ERR(bao->dev);
+		goto err_cdev;
+	}
+	dev_set_drvdata(bao->dev, bao);
+
+	return 0;
+
+err_cdev:
+	cdev_del(&bao->cdev);
+err_unmap:
+	memunmap(shmem_base_addr);
+	dev_err(dev, "failed initialization\n");
+	return ret;
+}
+
+/**
+ * bao_ipcshmem_unregister - Unregister a Bao IPC shared memory device
+ * @pdev: Platform device
+ *
+ * Unmaps the shared memory region, destroys the sysfs device, and
+ * deletes the character device.
+ */
+static void bao_ipcshmem_unregister(struct platform_device *pdev)
+{
+	struct bao_ipcshmem *bao;
+	void *shmem_base;
+
+	/* Retrieve the driver data */
+	bao = dev_get_drvdata(&pdev->dev);
+	if (!bao)
+		return;
+
+	/* Unmap shared memory */
+	if (bao->read_base)
+		shmem_base = (void *)((uintptr_t)bao->read_base -
+				      ((uintptr_t)bao->read_base - (uintptr_t)bao->physical_base));
+	else
+		shmem_base = NULL;
+
+	if (shmem_base)
+		memunmap(shmem_base);
+
+	/* Destroy device node */
+	if (bao->dev)
+		device_destroy(cl, bao->cdev.dev);
+
+	/* Delete character device */
+	cdev_del(&bao->cdev);
+}
+
+static const struct of_device_id of_bao_ipcshmem_match[] = {
+	{
+		.compatible = "bao,ipcshmem",
+	},
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, of_bao_ipcshmem_match);
+
+static struct platform_driver bao_ipcshmem_driver = {
+	.probe = bao_ipcshmem_register,
+	.remove = bao_ipcshmem_unregister,
+	.driver = {
+		   .name = DEV_NAME,
+		   .of_match_table = of_bao_ipcshmem_match,
+		    },
+};
+
+/**
+ * bao_ipcshmem_init - Module initialization for Bao IPC shared memory
+ *
+ * Creates a device class, allocates a range of character device numbers,
+ * and registers the platform driver.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static int __init bao_ipcshmem_init(void)
+{
+	int ret;
+
+	/* Create device class */
+	cl = class_create(DEV_NAME);
+	if (IS_ERR(cl)) {
+		ret = PTR_ERR(cl);
+		pr_err("unable to create class %s\n", DEV_NAME);
+		return ret;
+	}
+
+	/* Allocate major/minor numbers for character devices */
+	ret = alloc_chrdev_region(&bao_ipcshmem_devt, 0, MAX_DEVICES, DEV_NAME);
+	if (ret) {
+		pr_err("unable to allocate chrdev region for %s\n", DEV_NAME);
+		goto err_class_destroy;
+	}
+
+	/* Register platform driver */
+	ret = platform_driver_register(&bao_ipcshmem_driver);
+	if (ret) {
+		pr_err("unable to register platform driver for %s\n", DEV_NAME);
+		goto err_unregister_chrdev;
+	}
+
+	return 0;
+
+err_unregister_chrdev:
+	unregister_chrdev_region(bao_ipcshmem_devt, MAX_DEVICES);
+err_class_destroy:
+	class_destroy(cl);
+	return ret;
+}
+
+/**
+ * bao_ipcshmem_exit - Module exit for Bao IPC shared memory
+ *
+ * Unregisters the platform driver, releases the character device region,
+ * and destroys the device class.
+ */
+static void __exit bao_ipcshmem_exit(void)
+{
+	/* Unregister the platform driver */
+	platform_driver_unregister(&bao_ipcshmem_driver);
+
+	/* Release the allocated character device numbers */
+	unregister_chrdev_region(bao_ipcshmem_devt, MAX_DEVICES);
+
+	/* Destroy the device class */
+	class_destroy(cl);
+}
+
+module_init(bao_ipcshmem_init);
+module_exit(bao_ipcshmem_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("David Cerdeira <davidmcerdeira@osyx.tech>");
+MODULE_AUTHOR("José Martins <jose@osyx.tech>");
+MODULE_AUTHOR("João Peixoto <joaopeixoto@osyx.tech>");
+MODULE_DESCRIPTION("Bao Hypervisor IPC Through Shared-memory Driver");
-- 
2.43.0


