Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B336C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TawWsmxD8SDGcsqSwYUOGoy90jC/5REKfiUF4xQzCg=; b=kev7HJI4Zh7Pm3l5KASVSxkFc6
	mlfskvqSHDwqYx/nd1tO78m9eE3t4DSLaAKq4kUQ0s0kLu5us5q7kAz+siNgqwodNaeAy4tV5muj3
	OmMUuhhWw+lZd3cjMosvobTuxiXsf0v6GT9FGMEfTuo4rixueqrVoGUfHFckT/EGPWK1/DUpzfAow
	LdJwoaDWmrj7ae8oRvNEnP7+ukdldWTeT48OYS+LdhpbiDsjWE6iS83csXgyMj0UOSPzK0ZhlC7x4
	qcf4CWRZgjrj74hCw7Q8u78eIK2Q8zKEixYxIqfoYObe5bFJJzdxIu1+YkDEP3zLfYz3UfmmxsSia
	dlQOdhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCM-00000007Fvw-0oDm;
	Fri, 07 Aug 2026 07:40:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCJ-00000007FtN-25Yc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:40:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f96c5b722so1881412f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088453; x=1786693253; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6TawWsmxD8SDGcsqSwYUOGoy90jC/5REKfiUF4xQzCg=;
        b=uq0N4a0kZCWaXkEEkziEydu/bX0QmSMwzUWb+ESF4kHhCZ1SEnYSUU7cu1eMyFDt8u
         B/dBrWs71JWFwVZNDUsEkQpsG3R6oVNG+uRpcSf04gYQFXbOOn3xWV9zuw8D0M9DpEwJ
         iPXp5wXNaM/X5VtNIklwSYIcbqp+dHQnuG8JnXM3jdNe0TcWpmdWwaBAPOOlrIeIxtPh
         x2phM1R/P5z6qfpsTPJbuNhLIY+8CZ3BCegcsCEijfZoV1SrLh2TZhkT0YOBNJlBtd/X
         QCrR4lZUGPlyfQsXidVMeML1TOSzX7+BF/VW4N4Wwj4GWjZgRIqO9ikfGAd7xFnIs5Lo
         svdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088453; x=1786693253;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6TawWsmxD8SDGcsqSwYUOGoy90jC/5REKfiUF4xQzCg=;
        b=qQQkYZtb+p3BSEgrLYq5sBgjEdmJGEA7izEzqYvFdXkZamWnQL6q4nhZmpIIKU1yTx
         /VoblKIYPDtfGJWpSOhQwqm7ubaTc+nEcJ66+qGqOFdqs+GHaoXHy3Ipu0teMIzBiH4T
         hSMVbUIjSPwKxyigyueAi/X+FbgwGXe+ia5o7jKC5bU6XH+V7vgsis0znpDHtgz35wVh
         FwKyftIXTUZIxdcIDlZZYPgeb8QY4eVtv2XOO49biXxwycJFTGQ3ZAPrhb0En9JFY3/O
         N/FjDv7QjJWCZOLOJGnh2selV4q0Y7iS6mdToluRYkRXGCnruusc3nyhaPIEqD04qdEr
         RiCA==
X-Forwarded-Encrypted: i=1; AHgh+RoZR7g7LGbM82He39QCEwaqudKFLyK1Pd7PvZLEyVG8O9OjNKYj0dyTpUcW6tIlTN4s3nMgG4Do1t0nX3CwunLA@lists.infradead.org
X-Gm-Message-State: AOJu0YwHMBSdguS6d0D9z9EpUKlEphsOxIF6Iszj0WbJZAr6apRoarjh
	XWvVDMGYZqojVYXySzR/yzD8FMia0rMKlYdRt28QLY42LtMQPf8wA+7pTZ/pu4hADGxO
X-Gm-Gg: AR+sD12HLua0xPVzDnBibHWKnLxa/5SuWwbdh8ysfpc/6rnnMtfpIZOIBzXpxek17yg
	m/DZ0bgLFKLumPaYNB+cfaN3oI1l2JJLOBm7Y6GKprH1QzThvcXxQNXDmsQmXxaqKlA3yXSsa+w
	QAcvNm3qe/mYnODWr7rZfne1aQ7JbPQLQ5eZ7oXCyBfyTM9+99ZC8cDl+M5jMIigbSY2xzae5lV
	yKB4OIbTz7Ra0OkWKcYBUJCJ+uX0yJnUuJL+U0q1P4FOghrAqpc4cYfO2wfdIicdNpxVF3PU5DV
	9jiMzwJzKuW0D899AHR4d4BPex8+JHoNhF6Vu0YqW6nIL9SF0gb0mib3WJ5sjklD4v9YatL2gv9
	fnx2wwdQDHyGq51ez20npF8nkBbUj0l2jleKpGXN2/UmzlH2oP83lu9J0t/jx2/XJ4Ei0cWzm/t
	MBu3hSrbL9jmCB1l8F5kJPtfPkNICEq8/4bU+gdsfICPnb1iQ+iF60QhqTjlkyIz0=
X-Received: by 2002:a5d:64c6:0:b0:47f:e742:91dc with SMTP id ffacd0b85a97d-47fec4f1448mr31780734f8f.7.1786088453591;
        Fri, 07 Aug 2026 00:40:53 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:40:52 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux@armlinux.org.uk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@oss.qualcomm.com,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 2/6] virt: bao: add IPC shared-memory driver
Date: Fri,  7 Aug 2026 08:39:29 +0100
Message-ID: <33a72238392b1feb519d5721b5aacf693929e15c.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004055_687788_4DD7EEAC 
X-CRM114-Status: GOOD (  25.56  )
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
read and a write region within a shared-memory area described in the
device tree.

Userspace accesses the regions through a misc character device using
read(), write() and mmap(). A write() notifies the peer guest through an
architecture-specific hypercall (HVC on arm/arm64, SBI ecall on RISC-V).

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Map the read and write regions from the two reg entries (by reg-name)
  instead of parsing read-channel/write-channel offsets; read the channel id
  from "bao,id"; mmap() now maps per region.
- Drop the noisy dev_info() on successful probe.
- Do the shared-memory range arithmetic in u64 to avoid a u32 overflow.
- Fix the Kconfig help-text indentation (Randy Dunlap).
- Add José's and David's Co-developed-by/Signed-off-by.

 arch/arm/include/asm/bao.h           |  31 ++++
 arch/arm64/include/asm/bao.h         |  31 ++++
 arch/riscv/include/asm/bao.h         |  31 ++++
 drivers/virt/Kconfig                 |   2 +
 drivers/virt/Makefile                |   1 +
 drivers/virt/bao/Kconfig             |   3 +
 drivers/virt/bao/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/Kconfig    |  10 ++
 drivers/virt/bao/ipcshmem/Makefile   |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c | 231 +++++++++++++++++++++++++++
 10 files changed, 346 insertions(+)
 create mode 100644 arch/arm/include/asm/bao.h
 create mode 100644 arch/arm64/include/asm/bao.h
 create mode 100644 arch/riscv/include/asm/bao.h
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c

diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
new file mode 100644
index 000000000000..ba64d1a18f91
--- /dev/null
+++ b/arch/arm/include/asm/bao.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Bao Hypervisor Hypercall Interface
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef __ASM_ARM_BAO_H
+#define __ASM_ARM_BAO_H
+
+#include <linux/arm-smccc.h>
+
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
+						   unsigned long ipcshmem_id)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_hvc(ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,
+					 ARM_SMCCC_OWNER_VENDOR_HYP,
+					 hypercall_id),
+		      ipcshmem_id, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+#endif /* __ASM_ARM_BAO_H */
diff --git a/arch/arm64/include/asm/bao.h b/arch/arm64/include/asm/bao.h
new file mode 100644
index 000000000000..ab9b283168e3
--- /dev/null
+++ b/arch/arm64/include/asm/bao.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Bao Hypervisor Hypercall Interface
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef __ASM_ARM64_BAO_H
+#define __ASM_ARM64_BAO_H
+
+#include <linux/arm-smccc.h>
+
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
+						   unsigned long ipcshmem_id)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_hvc(ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
+					 ARM_SMCCC_OWNER_VENDOR_HYP,
+					 hypercall_id),
+		      ipcshmem_id, 0, 0, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
+#endif /* __ASM_ARM64_BAO_H */
diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
new file mode 100644
index 000000000000..d2c79a6a4ade
--- /dev/null
+++ b/arch/riscv/include/asm/bao.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Bao Hypervisor Hypercall Interface
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef __ASM_RISCV_BAO_H
+#define __ASM_RISCV_BAO_H
+
+#include <asm/sbi.h>
+
+#define BAO_SBI_EXT_ID 0x08000ba0
+
+static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
+						   unsigned long ipcshmem_id)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(BAO_SBI_EXT_ID, hypercall_id, ipcshmem_id, 0, 0, 0, 0,
+			0);
+
+	return ret.error;
+}
+
+#endif /* __ASM_RISCV_BAO_H */
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
index 000000000000..b789e5ea1264
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: GPL-2.0
+config BAO_SHMEM
+	tristate "Bao hypervisor shared memory support"
+	help
+	  This enables support for Bao shared memory communication.
+	  It allows the kernel to interface with guests running under
+	  the Bao hypervisor, providing a character device interface
+	  for exchanging data through dedicated shared-memory regions.
+
+	  If unsure, say N.
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
index 000000000000..0d46d89ee788
--- /dev/null
+++ b/drivers/virt/bao/ipcshmem/ipcshmem.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor IPC Through Shared-memory Driver
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/miscdevice.h>
+#include <linux/of.h>
+#include <linux/mm.h>
+#include <linux/io.h>
+#include <asm/bao.h>
+
+#define BAO_IPCSHMEM_NAME_LEN 16
+
+/* IPC through shared-memory hypercall ID */
+#define BAO_IPCSHMEM_HYPERCALL_ID 0x1
+
+struct bao_ipcshmem {
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
+static int bao_ipcshmem_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct bao_ipcshmem *bao = filp->private_data;
+	unsigned long vsize = vma->vm_end - vma->vm_start;
+	unsigned long offset = vma->vm_pgoff << PAGE_SHIFT;
+	phys_addr_t region_phys;
+	size_t region_size;
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
+	} else if (offset < bao->read_size + bao->write_size) {
+		offset -= bao->read_size;
+		region_phys = bao->write_phys;
+		region_size = bao->write_size;
+	} else {
+		return -EINVAL;
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
+	/* Notify Bao hypervisor */
+	bao_ipcshmem_hypercall(BAO_IPCSHMEM_HYPERCALL_ID, bao->id);
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
+};
+
+static int bao_ipcshmem_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct resource *read_res;
+	struct resource *write_res;
+	struct bao_ipcshmem *bao;
+	u32 id;
+	int ret;
+
+	read_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "read");
+	if (!read_res) {
+		dev_err(dev, "missing 'read' shared memory region\n");
+		return -ENODEV;
+	}
+
+	write_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "write");
+	if (!write_res) {
+		dev_err(dev, "missing 'write' shared memory region\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(np, "bao,id", &id);
+	if (ret) {
+		dev_err(dev, "missing or invalid 'bao,id' property\n");
+		return ret;
+	}
+
+	bao = devm_kzalloc(dev, sizeof(*bao), GFP_KERNEL);
+	if (!bao)
+		return -ENOMEM;
+
+	bao->read_base = devm_memremap(dev, read_res->start,
+				       resource_size(read_res), MEMREMAP_WB);
+	if (IS_ERR(bao->read_base))
+		return PTR_ERR(bao->read_base);
+
+	bao->write_base = devm_memremap(dev, write_res->start,
+					resource_size(write_res), MEMREMAP_WB);
+	if (IS_ERR(bao->write_base))
+		return PTR_ERR(bao->write_base);
+
+	bao->id = id;
+	bao->read_phys = read_res->start;
+	bao->read_size = resource_size(read_res);
+	bao->write_phys = write_res->start;
+	bao->write_size = resource_size(write_res);
+
+	scnprintf(bao->label, BAO_IPCSHMEM_NAME_LEN, "baoipc%u", id);
+
+	bao->miscdev.minor = MISC_DYNAMIC_MINOR;
+	bao->miscdev.name = bao->label;
+	bao->miscdev.fops = &bao_ipcshmem_fops;
+	bao->miscdev.parent = dev;
+
+	ret = misc_register(&bao->miscdev);
+	if (ret) {
+		dev_err(dev, "failed to register misc device: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, bao);
+
+	return 0;
+}
+
+static void bao_ipcshmem_remove(struct platform_device *pdev)
+{
+	struct bao_ipcshmem *bao = platform_get_drvdata(pdev);
+
+	misc_deregister(&bao->miscdev);
+}
+
+static const struct of_device_id of_bao_ipcshmem_match[] = {
+	{ .compatible = "bao,ipcshmem" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, of_bao_ipcshmem_match);
+
+static struct platform_driver bao_ipcshmem_driver = {
+	.probe = bao_ipcshmem_probe,
+	.remove = bao_ipcshmem_remove,
+	.driver = {
+		.name = "baoipc",
+		.of_match_table = of_bao_ipcshmem_match,
+	},
+};
+
+module_platform_driver(bao_ipcshmem_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("David Cerdeira <davidmcerdeira@osyx.tech>");
+MODULE_AUTHOR("José Martins <jose@osyx.tech>");
+MODULE_AUTHOR("João Peixoto <jpeixoto@osyx.tech>");
+MODULE_DESCRIPTION("Bao Hypervisor IPC Through Shared-memory Driver");
-- 
2.43.0


