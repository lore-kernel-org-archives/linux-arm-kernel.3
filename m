Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D53C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zf7OKH4SxpZlk0E2lKNTLJ5v90lmRZkdQg/cKzqxaY8=; b=LDa+1FDAimGb01VLWVk8dVxAR5
	IzgTuTy5EykRt/2/14vkmBWReXmD4kuEaz1UqGLvXGP/2Dp6d/dvZ3zyifCW3IqHsLAkDn0r/nPh+
	0jDjvxama9cGb7ugOzIljiK5fBxq2dCBxMauyIXEBqwCZ7I9vjrldBys6PLAe+q/BKCHHDxf2UoLI
	gZ+EzWMVcgsuLoobOcFwPjvmEnby7Cv1u/LVuIizY/IobbOGzUhQ5+VmRMQI4d6SX1gnpQVyznUln
	+LmlKwnm95Dg1o42iouW8k0nLdAwk6Mvj+XxJfSh3qB13AbYp6j0AWpWqcAN8MFd2IWcU746ri9Pi
	8Ed2Gs/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCh-00000007GH2-1Kru;
	Fri, 07 Aug 2026 07:41:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCU-00000007G0f-2RlE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:41:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso1084436f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088465; x=1786693265; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zf7OKH4SxpZlk0E2lKNTLJ5v90lmRZkdQg/cKzqxaY8=;
        b=kelvRM2inSUMT86rxuZ0wFmNV69FDLvIiBJ6WVgPmoa5y7E04w71nmgSxGOr9+KA2z
         7oM3ULFQs7HOB5E/kceGUPVw0abUx67agp37pZCCGWcy9K4cev5O7EIhSyLkyO8fIoQF
         R3brqDxvQ4or6p1vvaxCk1tcF7zIE1Ftzfvpdrf4NJUwrSeonF37D9tQsA78EQCLmneF
         qIi/+T2hwgjEH6Z+sjpS3hnOMaBHYojNreSv3dO3GnjxBDnSsbyWda1XLi04b+DmRJwg
         90TW4Zja6fB1dvuqYeYwuitbItqbZ/3oW7OmDszIR6OMubrZSeqFlmzKoEhCS/6fBHp2
         3utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088465; x=1786693265;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zf7OKH4SxpZlk0E2lKNTLJ5v90lmRZkdQg/cKzqxaY8=;
        b=q6fzrY9++WjYevRqpqtF1sezUDmXlz6c4rhCxmuqaFmlD6LwRPWMSUVOBBQyHsa5te
         J0VEJiTi2bD+Z2yFAh30nYflh+148kSlryESgAE0t+QVww+GSAk+TvHZggRBgPDaPaZR
         WuTGM/Om6CncQDYltfL2ukNNRcXNUXxk5/4eOUza41gPVUMKWpDh2DeFG9sChrpiVugE
         OfFuEeNPZVyQu9TMLlWZL2J2Xc9c55D+kW9RLf0Q/S0hg3lY8GAYzWd0IkM27FyaI+dg
         1yMSmy+36h4bH9cu0AI4cxtHKilcA4Rz9F/W8Tcu+aoufVNNlL8N/yk+6iTWKa0tGvWL
         hoeg==
X-Forwarded-Encrypted: i=1; AHgh+RrMiTQ37OsG1DMVpWeD68hktdBR/QuSvhjoSgi8u0R5kQGotQ5A5TQ75paKhTy9B2rvDtC2qgAahDCHLO8Ol+3M@lists.infradead.org
X-Gm-Message-State: AOJu0YzhgL3IQcwbh8cZ+/Cu1LPuGu9qlCCONbGgoOncmmmjP5gYP6yW
	RDKJWC5IWYoVqEGcoIkZ+MFsK9hkxTkWRagLzWY8a64jS3Q74KLApz8d5W0/BkfBc3i5
X-Gm-Gg: AR+sD11i+rVC+UzDKMjZK2lJL3IbO+FDjtrOt9HoRPt1apXUFbn3R9Nq8xEA6WZkhO2
	+hPTfqeT1YKc10N77C08ePzdQRDwSTMeHGSMolNh3Agkt+XPJjugY58ySOt2hHmgjm/xWsF+fD6
	aZtkSGhTmAD6wYQEaz/G54nfRr1jn4W0l4ZW5CjjYqopQYAak2C+LrH3nadze+5m1frZiQVlxiE
	SgeUkULDkak6fvlsVIOIQbnwNm9nqxPuXDvL+hD16tG6eUF3uipKi6N87QZ6hzNz0dxc9fAxa7U
	yH9qEEH1oCsnrWvyf5FDgO9/yxmwJ+r6Ch0cqd3YgY5TyGS/e3ewQ6JBII4w1xlBsQglS1do2zH
	CaZC1jnn3kYYHzOgVT0wjRZETCsWcIoOHR8yzQDX71hRcMu/4TJXnjNoD2bmYc+jUSJzN3Glwb6
	OnPxXate6Nl0qRL+CLo/IprAgIQ6PfIvO6RCYy3rfgbyPQqT7NsQrKwUOOBZsq6uu1
X-Received: by 2002:a05:6000:491e:b0:47d:ee9d:90c8 with SMTP id ffacd0b85a97d-47fec4e2910mr37918191f8f.3.1786088464244;
        Fri, 07 Aug 2026 00:41:04 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:41:03 -0700 (PDT)
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
Subject: [RFC PATCH v3 4/6] virt: bao: add I/O dispatcher driver
Date: Fri,  7 Aug 2026 08:39:31 +0100
Message-ID: <2190b6e083a2f2e0485b27e5e203647189bb1d1d.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786010512.git.jpeixoto@osyx.tech>
References: <cover.1786010512.git.jpeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004107_102055_09FD8028 
X-CRM114-Status: GOOD (  23.88  )
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

Add the Bao I/O dispatcher, used by backend VMs to service I/O on behalf
of frontend guests. It bridges Bao's Remote I/O mechanism to userspace
VirtIO backend device models.

Each backend device has a contiguous shared-memory region for exchanging
I/O buffers with its frontend and an interrupt the hypervisor uses to
signal pending requests. Userspace drives the dispatcher through a set of
ioctls on a misc character device.

Co-developed-by: José Martins <jose@osyx.tech>
Signed-off-by: José Martins <jose@osyx.tech>
Co-developed-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: David Cerdeira <davidmcerdeira@osyx.tech>
Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v3:
- Bind one platform device per device model and expose one /dev/bao-dmX each;
  drop the global DM list and its locking, the anonymous-inode fd, and the
  dispatcher indirection ioctl (BAO_IOCTL_DM_GET_INFO now lives in the DM fops).
- Fix the DM leak on remove, free the misc-device name, and unwind the probe
  error path fully; validate "bao,id" against BAO_IO_MAX_DMS.
- Initialise virtio_requests_lock and the hypercall context fields; drop the
  redundant control-client dispatch loop.
- riscv: reference BAO_SBI_EXT_ID consistently, document that it uses the SBI
  experimental extension space (RISC-V stays experimental until an SBI
  implementation ID is registered), and drop the redundant ecall input
  constraints (Andrew Jones).
- Use kzalloc_obj() instead of kzalloc(sizeof(*x)).
- Add José's and David's Co-developed-by/Signed-off-by.

 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 arch/arm/include/asm/bao.h                    |  30 ++
 arch/arm64/include/asm/bao.h                  |  30 ++
 arch/riscv/include/asm/bao.h                  |  37 ++
 drivers/virt/Makefile                         |   1 +
 drivers/virt/bao/Kconfig                      |   2 +
 drivers/virt/bao/Makefile                     |   1 +
 drivers/virt/bao/io-dispatcher/Kconfig        |  16 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 349 +++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 316 ++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  95 +++++
 drivers/virt/bao/io-dispatcher/intc.c         |  64 +++
 drivers/virt/bao/io-dispatcher/io_client.c    | 401 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 181 ++++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 323 ++++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 314 ++++++++++++++
 include/linux/bao.h                           |  41 ++
 include/uapi/linux/bao.h                      |  96 +++++
 19 files changed, 2303 insertions(+)
 create mode 100644 drivers/virt/bao/io-dispatcher/Kconfig
 create mode 100644 drivers/virt/bao/io-dispatcher/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/bao_drv.h
 create mode 100644 drivers/virt/bao/io-dispatcher/dm.c
 create mode 100644 drivers/virt/bao/io-dispatcher/driver.c
 create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
 create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
 create mode 100644 include/linux/bao.h
 create mode 100644 include/uapi/linux/bao.h

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 3f0ef1e27eb0..3c6b0c060bab 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -346,6 +346,8 @@ Code  Seq#    Include File                                             Comments
                                                                        <mailto:luzmaximilian@gmail.com>
 0xA5  20-2F  linux/surface_aggregator/dtx.h                            Microsoft Surface DTX driver
                                                                        <mailto:luzmaximilian@gmail.com>
+0xA6  all    uapi/linux/bao.h                                          Bao hypervisor
+                                                                       <mailto:info@bao-project.org>
 0xAA  00-3F  linux/uapi/linux/userfaultfd.h
 0xAB  00-1F  linux/nbd.h
 0xAC  00-1F  linux/raw.h
diff --git a/arch/arm/include/asm/bao.h b/arch/arm/include/asm/bao.h
index ba64d1a18f91..eca258cc94e3 100644
--- a/arch/arm/include/asm/bao.h
+++ b/arch/arm/include/asm/bao.h
@@ -14,6 +14,7 @@
 #define __ASM_ARM_BAO_H
 
 #include <linux/arm-smccc.h>
+#include <linux/bao.h>
 
 static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
 						   unsigned long ipcshmem_id)
@@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
 	return res.a0;
 }
 
+static inline unsigned long
+bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
+{
+	register int r0 asm("r0") =
+		ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32,
+				   ARM_SMCCC_OWNER_VENDOR_HYP, BAO_REMIO_HYPERCALL_ID);
+	register u32 r1 asm("r1") = ctx->dm_id;
+	register u32 r2 asm("r2") = ctx->addr;
+	register u32 r3 asm("r3") = ctx->op;
+	register u32 r4 asm("r4") = ctx->value;
+	register u32 r5 asm("r5") = ctx->request_id;
+	register u32 r6 asm("r6") = 0;
+
+	asm volatile("hvc 0\n\t"
+		     : "=r"(r0), "=r"(r1), "=r"(r2), "=r"(r3), "=r"(r4),
+		       "=r"(r5), "=r"(r6)
+		     : "r"(r0), "r"(r1), "r"(r2), "r"(r3), "r"(r4), "r"(r5)
+		     : "memory");
+
+	ctx->addr = r1;
+	ctx->op = r2;
+	ctx->value = r3;
+	ctx->access_width = r4;
+	ctx->request_id = r5;
+	ctx->npend_req = r6;
+
+	return r0;
+}
+
 #endif /* __ASM_ARM_BAO_H */
diff --git a/arch/arm64/include/asm/bao.h b/arch/arm64/include/asm/bao.h
index ab9b283168e3..1dc09a2c261b 100644
--- a/arch/arm64/include/asm/bao.h
+++ b/arch/arm64/include/asm/bao.h
@@ -14,6 +14,7 @@
 #define __ASM_ARM64_BAO_H
 
 #include <linux/arm-smccc.h>
+#include <linux/bao.h>
 
 static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
 						   unsigned long ipcshmem_id)
@@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
 	return res.a0;
 }
 
+static inline unsigned long
+bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
+{
+	register int x0 asm("x0") =
+		ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
+				   ARM_SMCCC_OWNER_VENDOR_HYP, BAO_REMIO_HYPERCALL_ID);
+	register u64 x1 asm("x1") = ctx->dm_id;
+	register u64 x2 asm("x2") = ctx->addr;
+	register u64 x3 asm("x3") = ctx->op;
+	register u64 x4 asm("x4") = ctx->value;
+	register u64 x5 asm("x5") = ctx->request_id;
+	register u64 x6 asm("x6") = 0;
+
+	asm volatile("hvc 0\n\t"
+		     : "=r"(x0), "=r"(x1), "=r"(x2), "=r"(x3), "=r"(x4),
+		       "=r"(x5), "=r"(x6)
+		     : "r"(x0), "r"(x1), "r"(x2), "r"(x3), "r"(x4), "r"(x5)
+		     : "memory");
+
+	ctx->addr = x1;
+	ctx->op = x2;
+	ctx->value = x3;
+	ctx->access_width = x4;
+	ctx->request_id = x5;
+	ctx->npend_req = x6;
+
+	return x0;
+}
+
 #endif /* __ASM_ARM64_BAO_H */
diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
index d2c79a6a4ade..6dc0cb13c94c 100644
--- a/arch/riscv/include/asm/bao.h
+++ b/arch/riscv/include/asm/bao.h
@@ -14,7 +14,16 @@
 #define __ASM_RISCV_BAO_H
 
 #include <asm/sbi.h>
+#include <linux/bao.h>
 
+/*
+ * Bao SBI extension ID.
+ *
+ * This currently lives in the SBI experimental extension space
+ * (0x08000000-0x08FFFFFF). A permanent ID has to be assigned through the
+ * RISC-V SBI specification before the RISC-V support can be considered
+ * stable; until then the RISC-V backend is experimental.
+ */
 #define BAO_SBI_EXT_ID 0x08000ba0
 
 static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
@@ -28,4 +37,32 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
 	return ret.error;
 }
 
+static inline unsigned long
+bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
+{
+	register uintptr_t a0 asm("a0") = (uintptr_t)(ctx->dm_id);
+	register uintptr_t a1 asm("a1") = (uintptr_t)(ctx->addr);
+	register uintptr_t a2 asm("a2") = (uintptr_t)(ctx->op);
+	register uintptr_t a3 asm("a3") = (uintptr_t)(ctx->value);
+	register uintptr_t a4 asm("a4") = (uintptr_t)(ctx->request_id);
+	register uintptr_t a5 asm("a5") = (uintptr_t)(0);
+	register uintptr_t a6 asm("a6") = (uintptr_t)(BAO_REMIO_HYPERCALL_ID);
+	register uintptr_t a7 asm("a7") = (uintptr_t)(BAO_SBI_EXT_ID);
+
+	asm volatile("ecall"
+		     : "+r"(a0), "+r"(a1), "+r"(a2), "+r"(a3), "+r"(a4),
+		       "+r"(a5), "+r"(a6), "+r"(a7)
+		     :
+		     : "memory");
+
+	ctx->addr = a2;
+	ctx->op = a3;
+	ctx->value = a4;
+	ctx->access_width = a5;
+	ctx->request_id = a6;
+	ctx->npend_req = a7;
+
+	return a0;
+}
+
 #endif /* __ASM_RISCV_BAO_H */
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index 623a671f8711..8bffc7ccd29e 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
 obj-y				+= coco/
 obj-$(CONFIG_BAO_SHMEM)		+= bao/
+obj-$(CONFIG_BAO_IO_DISPATCHER)	+= bao/
diff --git a/drivers/virt/bao/Kconfig b/drivers/virt/bao/Kconfig
index 4f7929d57475..ab08a20db8c4 100644
--- a/drivers/virt/bao/Kconfig
+++ b/drivers/virt/bao/Kconfig
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 source "drivers/virt/bao/ipcshmem/Kconfig"
+
+source "drivers/virt/bao/io-dispatcher/Kconfig"
diff --git a/drivers/virt/bao/Makefile b/drivers/virt/bao/Makefile
index 68f5d3f282c4..c463f04cf206 100644
--- a/drivers/virt/bao/Makefile
+++ b/drivers/virt/bao/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_BAO_SHMEM) += ipcshmem/
+obj-$(CONFIG_BAO_IO_DISPATCHER) += io-dispatcher/
diff --git a/drivers/virt/bao/io-dispatcher/Kconfig b/drivers/virt/bao/io-dispatcher/Kconfig
new file mode 100644
index 000000000000..cf3e8df0f2f4
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+config BAO_IO_DISPATCHER
+	tristate "Bao Hypervisor I/O Dispatcher"
+	select EVENTFD
+	help
+	  The Bao I/O Dispatcher is a kernel module for backend Linux VMs
+	  running under the Bao hypervisor. It establishes the connection
+	  between the Remote I/O system (Bao's mechanism for forwarding
+	  I/O requests from frontend VMs to the backend VMs) and the
+	  VirtIO backend device.
+
+	  This provides a unified API to support various VirtIO backends,
+	  allowing Bao guests to perform I/O through the hypervisor
+	  transparently.
+
+	  If unsure, say N.
diff --git a/drivers/virt/bao/io-dispatcher/Makefile b/drivers/virt/bao/io-dispatcher/Makefile
new file mode 100644
index 000000000000..e18de1d1a026
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_BAO_IO_DISPATCHER) += bao.o
+bao-objs += ioeventfd.o io_client.o io_dispatcher.o irqfd.o dm.o intc.o driver.o
+
diff --git a/drivers/virt/bao/io-dispatcher/bao_drv.h b/drivers/virt/bao/io-dispatcher/bao_drv.h
new file mode 100644
index 000000000000..a93386028947
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/bao_drv.h
@@ -0,0 +1,349 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Provides some definitions for the Bao Hypervisor modules
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef __BAO_DRV_H
+#define __BAO_DRV_H
+
+#include <linux/fs.h>
+#include <linux/miscdevice.h>
+#include <linux/bao.h>
+#include <uapi/linux/bao.h>
+
+#define BAO_NAME_MAX_LEN 16
+#define BAO_IO_MAX_DMS 16
+
+#define BAO_IOEVENTFD_FLAG_DATAMATCH BIT(1)
+#define BAO_IOEVENTFD_FLAG_DEASSIGN BIT(2)
+#define BAO_IRQFD_FLAG_DEASSIGN 1U
+#define BAO_IO_CLIENT_DESTROYING 0U
+
+struct bao_dm;
+struct bao_io_client;
+
+typedef int (*bao_io_client_handler_t)(struct bao_io_client *client,
+				       struct bao_virtio_request *req);
+
+/**
+ * enum bao_io_op - Bao hypervisor I/O operation types
+ * @BAO_IO_WRITE:   Write operation
+ * @BAO_IO_READ:    Read operation
+ * @BAO_IO_ASK:     Request operation information (e.g., MMIO address)
+ * @BAO_IO_NOTIFY:  Notify I/O completion
+ */
+enum bao_io_op {
+	BAO_IO_WRITE = 0,
+	BAO_IO_READ,
+	BAO_IO_ASK,
+	BAO_IO_NOTIFY,
+};
+
+/**
+ * struct bao_io_client - Bao I/O client
+ * @name: Client name
+ * @dm: The DM that the client belongs to
+ * @list: List node for this bao_io_client
+ * @is_control: If this client is the control client
+ * @flags: Flags (BAO_IO_CLIENT_*)
+ * @virtio_requests: List of free I/O requests
+ * @range_list: I/O ranges
+ * @handler: I/O request handler for this client
+ * @thread: Kernel thread executing the handler
+ * @wq: Wait queue used for thread parking
+ * @priv: Private data for the handler
+ */
+struct bao_io_client {
+	char name[BAO_NAME_MAX_LEN];
+	struct bao_dm *dm;
+	struct list_head list;
+	bool is_control;
+	unsigned long flags;
+	struct list_head virtio_requests;
+
+	/* protects virtio_requests list */
+	struct mutex virtio_requests_lock;
+
+	struct list_head range_list;
+
+	/* protects range_list */
+	struct rw_semaphore range_lock;
+
+	bao_io_client_handler_t handler;
+	struct task_struct *thread;
+	wait_queue_head_t wq;
+	void *priv;
+};
+
+/**
+ * struct bao_dm - Bao backend device model (DM)
+ * @info: DM information (id, shmem_addr, shmem_size, irq)
+ * @name: Backing storage for the misc device name
+ * @shmem_base_addr: The base address of the shared memory
+ * @ioeventfds: List of all ioeventfds
+ * @ioeventfd_client: Ioeventfd client
+ * @irqfds: List of all irqfds
+ * @irqfd_server: Workqueue responsible for irqfd handling
+ * @io_clients: List of all bao_io_client
+ * @control_client: Control client
+ * @miscdev: Character device exposing this DM to userspace
+ */
+struct bao_dm {
+	struct bao_dm_info info;
+	char name[BAO_NAME_MAX_LEN];
+	void *shmem_base_addr;
+
+	struct list_head ioeventfds;
+
+	/* protects ioeventfds list */
+	struct mutex ioeventfds_lock;
+
+	struct bao_io_client *ioeventfd_client;
+
+	struct list_head irqfds;
+
+	/* protects irqfds list */
+	struct mutex irqfds_lock;
+
+	struct workqueue_struct *irqfd_server;
+
+	/* protects io_clients list */
+	struct rw_semaphore io_clients_lock;
+
+	struct list_head io_clients;
+	struct bao_io_client *control_client;
+
+	struct miscdevice miscdev;
+};
+
+/**
+ * struct bao_io_range - Represents a range of I/O addresses
+ * @list: List node for linking multiple ranges
+ * @start: Start address of the range
+ * @end: End address of the range (inclusive)
+ */
+struct bao_io_range {
+	struct list_head list;
+	u64 start;
+	u64 end;
+};
+
+/**
+ * bao_dm_create - Create a backend device model (DM)
+ * @info: DM information (id, shmem_addr, shmem_size, irq)
+ * @dev: Parent device (the backing platform device)
+ *
+ * Return: Pointer to the created DM on success, NULL on error.
+ */
+struct bao_dm *bao_dm_create(struct bao_dm_info *info, struct device *dev);
+
+/**
+ * bao_dm_destroy - Destroy a backend device model (DM)
+ * @dm: DM to be destroyed
+ */
+void bao_dm_destroy(struct bao_dm *dm);
+
+/**
+ * bao_io_client_create - Create a backend I/O client
+ * @dm: DM this client belongs to
+ * @handler: I/O client handler for requests
+ * @data: Private data passed to the handler
+ * @is_control: True if this is the control client
+ * @name: Name of the I/O client
+ *
+ * Return: Pointer to the created I/O client, NULL on failure.
+ */
+struct bao_io_client *bao_io_client_create(struct bao_dm *dm,
+					   bao_io_client_handler_t handler,
+					   void *data, bool is_control,
+					   const char *name);
+
+/**
+ * bao_io_clients_destroy - Destroy all I/O clients of a DM
+ * @dm: DM whose I/O clients are to be destroyed
+ */
+void bao_io_clients_destroy(struct bao_dm *dm);
+
+/**
+ * bao_io_client_attach - Attach a thread to an I/O client
+ * @client: I/O client to attach
+ *
+ * The thread will wait for I/O requests on this client.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_io_client_attach(struct bao_io_client *client);
+
+/**
+ * bao_io_client_range_add - Add an I/O range to monitor in a client
+ * @client: I/O client
+ * @start: Start address of the range
+ * @end: End address of the range (inclusive)
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_io_client_range_add(struct bao_io_client *client, u64 start, u64 end);
+
+/**
+ * bao_io_client_range_del - Remove an I/O range from a client
+ * @client: I/O client
+ * @start: Start address of the range
+ * @end: End address of the range (inclusive)
+ */
+void bao_io_client_range_del(struct bao_io_client *client, u64 start, u64 end);
+
+/**
+ * bao_io_client_request - Retrieve the oldest I/O request from a client
+ * @client: I/O client
+ * @req: Pointer to virtio request structure to fill
+ *
+ * Return: 0 on success, negative error code if no request is available.
+ */
+int bao_io_client_request(struct bao_io_client *client,
+			  struct bao_virtio_request *req);
+
+/**
+ * bao_io_client_push_request - Push an I/O request into a client
+ * @client: I/O client
+ * @req: I/O request to push
+ *
+ * Return: True if a request was pushed, false otherwise.
+ */
+bool bao_io_client_push_request(struct bao_io_client *client,
+				struct bao_virtio_request *req);
+
+/**
+ * bao_io_client_pop_request - Pop the oldest I/O request from a client
+ * @client: I/O client
+ * @req: Buffer to store the popped request
+ *
+ * Return: True if a request was popped, false if the list was empty.
+ */
+bool bao_io_client_pop_request(struct bao_io_client *client,
+			       struct bao_virtio_request *req);
+
+/**
+ * bao_io_client_find - Find the I/O client for a given request
+ * @dm: DM that the I/O request belongs to
+ * @req: I/O request to locate
+ *
+ * Return: Pointer to the I/O client handling the request, NULL if none found.
+ */
+struct bao_io_client *bao_io_client_find(struct bao_dm *dm,
+					 struct bao_virtio_request *req);
+
+/**
+ * bao_ioeventfd_client_init - Initialize the Ioeventfd client for a DM
+ * @dm: DM that the Ioeventfd client belongs to
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_ioeventfd_client_init(struct bao_dm *dm);
+
+/**
+ * bao_ioeventfd_client_destroy - Destroy the Ioeventfd client for a DM
+ * @dm: DM that the Ioeventfd client belongs to
+ */
+void bao_ioeventfd_client_destroy(struct bao_dm *dm);
+
+/**
+ * bao_ioeventfd_client_config - Configure an Ioeventfd client
+ * @dm: DM that the Ioeventfd client belongs to
+ * @config: Ioeventfd configuration to apply
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_ioeventfd_client_config(struct bao_dm *dm,
+				struct bao_ioeventfd *config);
+
+/**
+ * bao_irqfd_server_init - Initialize the Irqfd server for a DM
+ * @dm: DM that the Irqfd server belongs to
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_irqfd_server_init(struct bao_dm *dm);
+
+/**
+ * bao_irqfd_server_destroy - Destroy the Irqfd server for a DM
+ * @dm: DM that the Irqfd server belongs to
+ */
+void bao_irqfd_server_destroy(struct bao_dm *dm);
+
+/**
+ * bao_irqfd_server_config - Configure an Irqfd server
+ * @dm: DM that the Irqfd server belongs to
+ * @config: Irqfd configuration to apply
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_irqfd_server_config(struct bao_dm *dm, struct bao_irqfd *config);
+
+/**
+ * bao_io_dispatcher_init - Initialize the I/O Dispatcher for a DM
+ * @dm: DM to initialize on the I/O Dispatcher
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_io_dispatcher_init(struct bao_dm *dm);
+
+/**
+ * bao_io_dispatcher_destroy - Destroy the I/O Dispatcher for a DM
+ * @dm: DM to destroy on the I/O Dispatcher
+ */
+void bao_io_dispatcher_destroy(struct bao_dm *dm);
+
+/**
+ * bao_dispatch_io - Acquire and dispatch I/O requests from the Bao Hypervisor
+ * @dm: DM whose I/O clients will handle the requests
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_dispatch_io(struct bao_dm *dm);
+
+/**
+ * bao_io_dispatcher_pause - Pause the I/O Dispatcher for a DM
+ * @dm: DM to pause
+ */
+void bao_io_dispatcher_pause(struct bao_dm *dm);
+
+/**
+ * bao_io_dispatcher_resume - Resume the I/O Dispatcher for a DM
+ * @dm: DM to resume
+ */
+void bao_io_dispatcher_resume(struct bao_dm *dm);
+
+/**
+ * bao_intc_init - Register the interrupt controller for a DM
+ * @dm: DM that the interrupt controller belongs to
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int bao_intc_init(struct bao_dm *dm);
+
+/**
+ * bao_intc_destroy - Unregister the interrupt controller for a DM
+ * @dm: DM that the interrupt controller belongs to
+ */
+void bao_intc_destroy(struct bao_dm *dm);
+
+/**
+ * bao_intc_setup_handler - Setup the interrupt controller handler
+ * @handler: Function pointer to the interrupt handler
+ * @dm: DM that the interrupt controller belongs to
+ */
+void bao_intc_setup_handler(void (*handler)(struct bao_dm *dm));
+
+/**
+ * bao_intc_remove_handler - Remove the interrupt controller handler
+ */
+void bao_intc_remove_handler(void);
+
+#endif /* __BAO_DRV_H */
diff --git a/drivers/virt/bao/io-dispatcher/dm.c b/drivers/virt/bao/io-dispatcher/dm.c
new file mode 100644
index 000000000000..d8e2832e1c05
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/dm.c
@@ -0,0 +1,316 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor Backend Device Model (DM)
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#include "bao_drv.h"
+#include <linux/io.h>
+#include <linux/mm.h>
+#include <linux/miscdevice.h>
+#include <asm/bao.h>
+
+static int bao_dm_open(struct inode *inode, struct file *filp)
+{
+	struct bao_dm *dm = container_of(filp->private_data, struct bao_dm,
+					 miscdev);
+
+	filp->private_data = dm;
+
+	return 0;
+}
+
+static int bao_dm_release(struct inode *inode, struct file *filp)
+{
+	filp->private_data = NULL;
+	return 0;
+}
+
+static long bao_dm_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	struct bao_dm *dm = filp->private_data;
+	int rc;
+
+	if (WARN_ON_ONCE(!dm))
+		return -ENODEV;
+
+	switch (cmd) {
+	case BAO_IOCTL_DM_GET_INFO: {
+		struct bao_dm_info info = dm->info;
+
+		if (copy_to_user((void __user *)arg, &info, sizeof(info)))
+			return -EFAULT;
+
+		rc = 0;
+		break;
+	}
+	case BAO_IOCTL_IO_CLIENT_ATTACH: {
+		struct bao_virtio_request *req;
+
+		req = memdup_user((void __user *)arg, sizeof(*req));
+		if (IS_ERR(req)) {
+			rc = PTR_ERR(req);
+			break;
+		}
+
+		if (!dm->control_client) {
+			rc = -ENOENT;
+			goto out_free;
+		}
+
+		rc = bao_io_client_attach(dm->control_client);
+		if (rc)
+			goto out_free;
+
+		rc = bao_io_client_request(dm->control_client, req);
+		if (rc)
+			goto out_free;
+
+		if (copy_to_user((void __user *)arg, req, sizeof(*req))) {
+			rc = -EFAULT;
+			goto out_free;
+		}
+
+		rc = 0;
+
+out_free:
+		kfree(req);
+		break;
+	}
+	case BAO_IOCTL_IO_REQUEST_COMPLETE: {
+		struct bao_virtio_request *req;
+		struct bao_remio_hypercall_ctx ctx;
+
+		req = memdup_user((void __user *)arg, sizeof(*req));
+		if (IS_ERR(req)) {
+			rc = PTR_ERR(req);
+			break;
+		}
+
+		ctx.dm_id = req->dm_id;
+		ctx.addr = req->addr;
+		ctx.op = req->op;
+		ctx.value = req->value;
+		ctx.access_width = req->access_width;
+		ctx.request_id = req->request_id;
+
+		rc = bao_remio_hypercall(&ctx);
+		kfree(req);
+
+		break;
+	}
+	case BAO_IOCTL_IOEVENTFD: {
+		struct bao_ioeventfd ioeventfd;
+
+		if (copy_from_user(&ioeventfd, (void __user *)arg,
+				   sizeof(struct bao_ioeventfd)))
+			return -EFAULT;
+
+		rc = bao_ioeventfd_client_config(dm, &ioeventfd);
+		break;
+	}
+	case BAO_IOCTL_IRQFD: {
+		struct bao_irqfd irqfd;
+
+		if (copy_from_user(&irqfd, (void __user *)arg,
+				   sizeof(struct bao_irqfd)))
+			return -EFAULT;
+
+		rc = bao_irqfd_server_config(dm, &irqfd);
+		break;
+	}
+	default:
+		rc = -ENOTTY;
+		break;
+	}
+
+	return rc;
+}
+
+/**
+ * bao_dm_mmap - mmap backend DM shared memory to userspace
+ * @filp: File pointer for the DM device
+ * @vma: Virtual memory area for mapping
+ *
+ * Return: 0 on success, negative errno on failure
+ */
+static int bao_dm_mmap(struct file *filp, struct vm_area_struct *vma)
+{
+	struct bao_dm *dm = filp->private_data;
+	unsigned long vsize;
+	unsigned long offset;
+	phys_addr_t phys;
+
+	if (WARN_ON_ONCE(!dm))
+		return -ENODEV;
+
+	vsize = vma->vm_end - vma->vm_start;
+	offset = vma->vm_pgoff << PAGE_SHIFT;
+
+	if (!vsize || offset)
+		return -EINVAL;
+
+	if (vsize > dm->info.shmem_size)
+		return -EINVAL;
+
+	phys = dm->info.shmem_addr;
+	if (!PAGE_ALIGNED(phys))
+		return -EINVAL;
+
+	if (remap_pfn_range(vma, vma->vm_start, phys >> PAGE_SHIFT, vsize,
+			    vma->vm_page_prot))
+		return -EFAULT;
+
+	return 0;
+}
+
+/**
+ * bao_dm_llseek - Adjust file offset for backend DM device
+ * @file: File pointer for the DM device
+ * @offset: Offset to seek
+ * @whence: Reference point (SEEK_SET, SEEK_CUR, SEEK_END)
+ *
+ * Return: New file position on success, negative errno on failure
+ */
+static loff_t bao_dm_llseek(struct file *file, loff_t offset, int whence)
+{
+	struct bao_dm *dm = file->private_data;
+	loff_t new_pos;
+
+	if (WARN_ON_ONCE(!dm))
+		return -ENODEV;
+
+	switch (whence) {
+	case SEEK_SET:
+		new_pos = offset;
+		break;
+	case SEEK_CUR:
+		new_pos = file->f_pos + offset;
+		break;
+	case SEEK_END:
+		new_pos = dm->info.shmem_size + offset;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (new_pos < 0 || new_pos > dm->info.shmem_size)
+		return -EINVAL;
+
+	file->f_pos = new_pos;
+	return new_pos;
+}
+
+static const struct file_operations bao_dm_fops = {
+	.owner = THIS_MODULE,
+	.open = bao_dm_open,
+	.release = bao_dm_release,
+	.unlocked_ioctl = bao_dm_ioctl,
+	.llseek = bao_dm_llseek,
+	.mmap = bao_dm_mmap,
+};
+
+struct bao_dm *bao_dm_create(struct bao_dm_info *info, struct device *dev)
+{
+	struct bao_dm *dm;
+	int ret;
+
+	if (WARN_ON(!info))
+		return NULL;
+
+	dm = kzalloc_obj(*dm, GFP_KERNEL);
+	if (!dm)
+		return NULL;
+
+	INIT_LIST_HEAD(&dm->io_clients);
+	init_rwsem(&dm->io_clients_lock);
+
+	dm->info = *info;
+
+	ret = bao_io_dispatcher_init(dm);
+	if (ret) {
+		dev_err(dev, "failed to init I/O dispatcher for DM %u\n",
+			dm->info.id);
+		goto err_free;
+	}
+
+	snprintf(dm->name, sizeof(dm->name), "bao-ioctlc%u", dm->info.id);
+	dm->control_client = bao_io_client_create(dm, NULL, NULL, true,
+						  dm->name);
+	if (!dm->control_client) {
+		dev_err(dev, "failed to create control client for DM %u\n",
+			dm->info.id);
+		goto err_destroy_dispatcher;
+	}
+
+	if (bao_ioeventfd_client_init(dm)) {
+		dev_err(dev, "failed to initialize ioeventfd for DM %u\n",
+			dm->info.id);
+		goto err_destroy_io_clients;
+	}
+
+	if (bao_irqfd_server_init(dm)) {
+		dev_err(dev, "failed to initialize irqfd for DM %u\n",
+			dm->info.id);
+		goto err_destroy_io_clients;
+	}
+
+	dm->shmem_base_addr = memremap(dm->info.shmem_addr, dm->info.shmem_size,
+				       MEMREMAP_WB);
+	if (!dm->shmem_base_addr) {
+		dev_err(dev, "failed to map memory region for DM %u\n",
+			dm->info.id);
+		goto err_destroy_irqfd;
+	}
+
+	snprintf(dm->name, sizeof(dm->name), "bao-dm%u", dm->info.id);
+	dm->miscdev.minor = MISC_DYNAMIC_MINOR;
+	dm->miscdev.name = dm->name;
+	dm->miscdev.fops = &bao_dm_fops;
+	dm->miscdev.parent = dev;
+
+	ret = misc_register(&dm->miscdev);
+	if (ret) {
+		dev_err(dev, "failed to register misc device for DM %u: %d\n",
+			dm->info.id, ret);
+		goto err_unmap;
+	}
+
+	return dm;
+
+err_unmap:
+	memunmap(dm->shmem_base_addr);
+err_destroy_irqfd:
+	bao_irqfd_server_destroy(dm);
+err_destroy_io_clients:
+	bao_io_clients_destroy(dm);
+err_destroy_dispatcher:
+	bao_io_dispatcher_destroy(dm);
+err_free:
+	kfree(dm);
+
+	return NULL;
+}
+
+void bao_dm_destroy(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	misc_deregister(&dm->miscdev);
+
+	if (dm->shmem_base_addr)
+		memunmap(dm->shmem_base_addr);
+
+	bao_irqfd_server_destroy(dm);
+	bao_io_clients_destroy(dm);
+	bao_io_dispatcher_destroy(dm);
+
+	kfree(dm);
+}
diff --git a/drivers/virt/bao/io-dispatcher/driver.c b/drivers/virt/bao/io-dispatcher/driver.c
new file mode 100644
index 000000000000..1e90737e51c7
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/driver.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor I/O Dispatcher Kernel Driver
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/of_irq.h>
+#include "bao_drv.h"
+
+static int bao_io_dispatcher_driver_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct bao_dm_info dm_info;
+	struct bao_dm *dm;
+	struct resource *r;
+	int irq;
+	u32 id;
+	int ret;
+
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		dev_err(dev, "missing shared memory resource\n");
+		return -ENODEV;
+	}
+
+	ret = of_property_read_u32(dev->of_node, "bao,id", &id);
+	if (ret) {
+		dev_err(dev, "missing or invalid 'bao,id' property\n");
+		return ret;
+	}
+
+	if (id >= BAO_IO_MAX_DMS) {
+		dev_err(dev, "'bao,id' %u out of range (max %u)\n", id,
+			BAO_IO_MAX_DMS - 1);
+		return -EINVAL;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	dm_info.id = id;
+	dm_info.shmem_addr = r->start;
+	dm_info.shmem_size = resource_size(r);
+	dm_info.irq = irq;
+
+	dm = bao_dm_create(&dm_info, dev);
+	if (!dm)
+		return -EINVAL;
+
+	ret = bao_intc_init(dm);
+	if (ret) {
+		dev_err(dev, "failed to register interrupt %d for DM %u\n", irq,
+			id);
+		bao_dm_destroy(dm);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, dm);
+
+	return 0;
+}
+
+static void bao_io_dispatcher_driver_remove(struct platform_device *pdev)
+{
+	struct bao_dm *dm = platform_get_drvdata(pdev);
+
+	bao_intc_destroy(dm);
+	bao_dm_destroy(dm);
+}
+
+static const struct of_device_id bao_io_dispatcher_driver_dt_ids[] = {
+	{ .compatible = "bao,io-dispatcher" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, bao_io_dispatcher_driver_dt_ids);
+
+static struct platform_driver bao_io_dispatcher_driver = {
+	.probe = bao_io_dispatcher_driver_probe,
+	.remove = bao_io_dispatcher_driver_remove,
+	.driver = {
+		.name = "bao-io-dispatcher",
+		.of_match_table = bao_io_dispatcher_driver_dt_ids,
+	},
+};
+
+module_platform_driver(bao_io_dispatcher_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("João Peixoto <jpeixoto@osyx.tech>");
+MODULE_AUTHOR("David Cerdeira <davidmcerdeira@osyx.tech>");
+MODULE_AUTHOR("José Martins <jose@osyx.tech>");
+MODULE_DESCRIPTION("Bao Hypervisor I/O Dispatcher Kernel Driver");
diff --git a/drivers/virt/bao/io-dispatcher/intc.c b/drivers/virt/bao/io-dispatcher/intc.c
new file mode 100644
index 000000000000..d9d2f0861639
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/intc.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor I/O Dispatcher Interrupt Controller
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#include <linux/interrupt.h>
+#include "bao_drv.h"
+
+/* Top-level handler registered by the Bao interrupt controller */
+static void (*bao_intc_handler)(struct bao_dm *dm);
+
+/**
+ * bao_interrupt_handler - Top-level interrupt handler for Bao DM
+ * @irq: Interrupt number
+ * @dev: Pointer to the Bao device model (struct bao_dm)
+ *
+ * Invokes the registered Bao interrupt controller handler, if any.
+ */
+static irqreturn_t bao_interrupt_handler(int irq, void *dev)
+{
+	struct bao_dm *dm = (struct bao_dm *)dev;
+
+	if (bao_intc_handler)
+		bao_intc_handler(dm);
+
+	return IRQ_HANDLED;
+}
+
+void bao_intc_setup_handler(void (*handler)(struct bao_dm *dm))
+{
+	bao_intc_handler = handler;
+}
+
+void bao_intc_remove_handler(void)
+{
+	bao_intc_handler = NULL;
+}
+
+int bao_intc_init(struct bao_dm *dm)
+{
+	char name[BAO_NAME_MAX_LEN];
+
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	scnprintf(name, sizeof(name), "bao-iodintc%d", dm->info.id);
+
+	return request_irq(dm->info.irq, bao_interrupt_handler, 0, name, dm);
+}
+
+void bao_intc_destroy(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	free_irq(dm->info.irq, dm);
+}
diff --git a/drivers/virt/bao/io-dispatcher/io_client.c b/drivers/virt/bao/io-dispatcher/io_client.c
new file mode 100644
index 000000000000..849631bad2f0
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/io_client.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor I/O Client
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#include <linux/kthread.h>
+#include <asm/bao.h>
+#include "bao_drv.h"
+
+/**
+ * struct bao_io_request - Bao I/O request structure
+ * @list: List node linking all requests
+ * @virtio_request: The VirtIO request payload
+ *
+ * Represents a single I/O request for a Bao I/O client.
+ */
+struct bao_io_request {
+	struct list_head list;
+	struct bao_virtio_request virtio_request;
+};
+
+/**
+ * bao_io_client_has_pending_requests - Check if an I/O client has pending requests
+ * @client: The bao_io_client to check
+ *
+ * Return: True if has pending I/O requests, false otherwise.
+ */
+static inline bool
+bao_io_client_has_pending_requests(struct bao_io_client *client)
+{
+	if (WARN_ON_ONCE(!client))
+		return false;
+
+	return !list_empty(&client->virtio_requests);
+}
+
+/**
+ * bao_io_client_is_destroying - Check if an I/O client is being destroyed
+ * @client: The bao_io_client to check
+ *
+ * Return: True if the client is being destroyed, false otherwise.
+ */
+static inline bool bao_io_client_is_destroying(struct bao_io_client *client)
+{
+	if (WARN_ON_ONCE(!client))
+		return true;
+
+	return test_bit(BAO_IO_CLIENT_DESTROYING, &client->flags);
+}
+
+bool bao_io_client_push_request(struct bao_io_client *client,
+				struct bao_virtio_request *req)
+{
+	struct bao_io_request *io_req;
+
+	if (WARN_ON_ONCE(!client || !req))
+		return false;
+
+	io_req = kzalloc_obj(*io_req, GFP_KERNEL);
+	if (!io_req)
+		return false;
+
+	io_req->virtio_request = *req;
+
+	mutex_lock(&client->virtio_requests_lock);
+	list_add_tail(&io_req->list, &client->virtio_requests);
+	mutex_unlock(&client->virtio_requests_lock);
+
+	return true;
+}
+
+bool bao_io_client_pop_request(struct bao_io_client *client,
+			       struct bao_virtio_request *ret)
+{
+	struct bao_io_request *req;
+
+	if (WARN_ON_ONCE(!client || !ret))
+		return false;
+
+	mutex_lock(&client->virtio_requests_lock);
+
+	req = list_first_entry_or_null(&client->virtio_requests,
+				       struct bao_io_request, list);
+	if (!req) {
+		mutex_unlock(&client->virtio_requests_lock);
+		return false;
+	}
+
+	list_del(&req->list);
+	*ret = req->virtio_request;
+
+	mutex_unlock(&client->virtio_requests_lock);
+
+	kfree(req);
+
+	return true;
+}
+
+/**
+ * bao_io_client_destroy - Destroy an I/O client
+ * @client: The bao_io_client to destroy
+ */
+static void bao_io_client_destroy(struct bao_io_client *client)
+{
+	struct bao_io_client *range;
+	struct bao_io_client *next;
+	struct bao_dm *dm;
+
+	if (WARN_ON_ONCE(!client))
+		return;
+
+	dm = client->dm;
+
+	bao_io_dispatcher_pause(dm);
+
+	set_bit(BAO_IO_CLIENT_DESTROYING, &client->flags);
+
+	if (client->is_control) {
+		wake_up_interruptible(&client->wq);
+	} else {
+		bao_ioeventfd_client_destroy(dm);
+		if (client->thread)
+			kthread_stop(client->thread);
+	}
+
+	down_write(&client->range_lock);
+	list_for_each_entry_safe(range, next, &client->range_list, list) {
+		list_del(&range->list);
+		kfree(range);
+	}
+	up_write(&client->range_lock);
+
+	down_write(&dm->io_clients_lock);
+	if (client->is_control)
+		dm->control_client = NULL;
+	else
+		dm->ioeventfd_client = NULL;
+
+	list_del(&client->list);
+	up_write(&dm->io_clients_lock);
+
+	bao_io_dispatcher_resume(dm);
+
+	kfree(client);
+}
+
+void bao_io_clients_destroy(struct bao_dm *dm)
+{
+	struct bao_io_client *client, *next;
+
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	list_for_each_entry_safe(client, next, &dm->io_clients, list) {
+		bao_io_client_destroy(client);
+	}
+}
+
+int bao_io_client_attach(struct bao_io_client *client)
+{
+	if (WARN_ON_ONCE(!client))
+		return -EINVAL;
+
+	if (client->is_control) {
+		wait_event_interruptible(client->wq,
+					 bao_io_client_has_pending_requests(client) ||
+					 bao_io_client_is_destroying(client));
+		if (bao_io_client_is_destroying(client))
+			return -EPERM;
+	} else {
+		wait_event_interruptible(client->wq,
+					 bao_io_client_has_pending_requests(client) ||
+					 bao_io_client_is_destroying(client) ||
+					 kthread_should_stop());
+		if (bao_io_client_is_destroying(client) ||
+		    kthread_should_stop()) {
+			if (kthread_should_stop())
+				bao_io_client_destroy(client);
+			return -EPERM;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * bao_io_client_kernel_thread - Thread for processing a kernel I/O client
+ * @data: Pointer to the bao_io_client structure
+ *
+ * Return: 0 on completion
+ */
+static int bao_io_client_kernel_thread(void *data)
+{
+	struct bao_io_client *client = data;
+	struct bao_virtio_request req;
+	struct bao_remio_hypercall_ctx ctx;
+	bool stop = false;
+	int ret;
+
+	if (WARN_ON_ONCE(!client))
+		return -EINVAL;
+
+	while (!stop && !kthread_should_stop()) {
+		ret = bao_io_client_attach(client);
+		if (ret < 0) {
+			stop = true;
+			break;
+		}
+
+		while (bao_io_client_has_pending_requests(client) && !stop) {
+			if (!bao_io_client_pop_request(client, &req)) {
+				pr_err("%s: failed to pop I/O request\n",
+				       __func__);
+				stop = true;
+				break;
+			}
+
+			ret = client->handler(client, &req);
+			if (ret < 0) {
+				pr_warn("%s: client handler returned %d\n",
+					__func__, ret);
+				break;
+			}
+
+			ctx.dm_id = req.dm_id;
+			ctx.op = req.op;
+			ctx.addr = req.addr;
+			ctx.value = req.value;
+			ctx.access_width = req.access_width;
+			ctx.request_id = req.request_id;
+
+			if (bao_remio_hypercall(&ctx)) {
+				stop = true;
+				break;
+			}
+		}
+	}
+
+	return 0;
+}
+
+struct bao_io_client *bao_io_client_create(struct bao_dm *dm,
+					   bao_io_client_handler_t handler,
+					   void *data, bool is_control,
+					   const char *name)
+{
+	struct bao_io_client *client;
+
+	if (WARN_ON_ONCE(!dm || !name))
+		return NULL;
+
+	if (!handler && !is_control)
+		return NULL;
+
+	client = kzalloc_obj(*client, GFP_KERNEL);
+	if (!client)
+		return NULL;
+
+	client->handler = handler;
+	client->dm = dm;
+	client->priv = data;
+	client->is_control = is_control;
+	if (name)
+		strscpy(client->name, name, sizeof(client->name));
+
+	INIT_LIST_HEAD(&client->virtio_requests);
+	mutex_init(&client->virtio_requests_lock);
+	init_rwsem(&client->range_lock);
+	INIT_LIST_HEAD(&client->range_list);
+	init_waitqueue_head(&client->wq);
+
+	if (client->handler) {
+		client->thread = kthread_run(bao_io_client_kernel_thread,
+					     client, "%s-kthread",
+					     client->name);
+		if (IS_ERR(client->thread)) {
+			kfree(client);
+			return NULL;
+		}
+	}
+
+	down_write(&dm->io_clients_lock);
+	if (is_control)
+		dm->control_client = client;
+	else
+		dm->ioeventfd_client = client;
+
+	list_add(&client->list, &dm->io_clients);
+	up_write(&dm->io_clients_lock);
+
+	return client;
+}
+
+int bao_io_client_request(struct bao_io_client *client,
+			  struct bao_virtio_request *req)
+{
+	if (WARN_ON_ONCE(!client))
+		return -EINVAL;
+
+	if (!bao_io_client_pop_request(client, req))
+		return -EFAULT;
+
+	return 0;
+}
+
+int bao_io_client_range_add(struct bao_io_client *client, u64 start, u64 end)
+{
+	struct bao_io_range *range;
+
+	if (WARN_ON_ONCE(!client))
+		return -EINVAL;
+
+	if (end < start)
+		return -EINVAL;
+
+	range = kzalloc_obj(*range, GFP_KERNEL);
+	if (!range)
+		return -ENOMEM;
+
+	range->start = start;
+	range->end = end;
+
+	down_write(&client->range_lock);
+	list_add(&range->list, &client->range_list);
+	up_write(&client->range_lock);
+
+	return 0;
+}
+
+void bao_io_client_range_del(struct bao_io_client *client, u64 start, u64 end)
+{
+	struct bao_io_range *range;
+	struct bao_io_range *tmp;
+
+	if (WARN_ON_ONCE(!client))
+		return;
+
+	down_write(&client->range_lock);
+	list_for_each_entry_safe(range, tmp, &client->range_list, list) {
+		if (range->start == start && range->end == end) {
+			list_del(&range->list);
+			kfree(range);
+			break;
+		}
+	}
+	up_write(&client->range_lock);
+}
+
+/**
+ * bao_io_request_in_range - Check if the I/O request is in the range
+ * @range: The I/O request range
+ * @req: The I/O request to be checked
+ *
+ * Return: True if the I/O request is in the range, false otherwise
+ */
+static bool bao_io_request_in_range(struct bao_io_range *range,
+				    struct bao_virtio_request *req)
+{
+	if (WARN_ON_ONCE(!range || !req))
+		return false;
+
+	if (req->addr >= range->start &&
+	    (req->addr + req->access_width - 1) <= range->end)
+		return true;
+
+	return false;
+}
+
+struct bao_io_client *bao_io_client_find(struct bao_dm *dm,
+					 struct bao_virtio_request *req)
+{
+	struct bao_io_client *client;
+	struct bao_io_client *found = NULL;
+	struct bao_io_range *range;
+
+	if (WARN_ON_ONCE(!dm || !req))
+		return NULL;
+
+	list_for_each_entry(client, &dm->io_clients, list) {
+		down_read(&client->range_lock);
+		list_for_each_entry(range, &client->range_list, list) {
+			if (bao_io_request_in_range(range, req)) {
+				found = client;
+				break;
+			}
+		}
+		up_read(&client->range_lock);
+
+		if (found)
+			break;
+	}
+
+	return found ? found : dm->control_client;
+}
diff --git a/drivers/virt/bao/io-dispatcher/io_dispatcher.c b/drivers/virt/bao/io-dispatcher/io_dispatcher.c
new file mode 100644
index 000000000000..82161ae47cb6
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/io_dispatcher.c
@@ -0,0 +1,181 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor I/O Dispatcher
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#include <asm/bao.h>
+#include "bao_drv.h"
+
+/**
+ * struct bao_io_dispatcher_work - Work item for I/O dispatching
+ * @work: Work struct for scheduling on workqueue
+ * @dm: Pointer to the associated Bao device model
+ *
+ * Represents a single work item that dispatches I/O requests
+ * for a specific Bao device model.
+ */
+struct bao_io_dispatcher_work {
+	struct work_struct work;
+	struct bao_dm *dm;
+};
+
+/* Array of I/O dispatcher work items, one per Bao DM */
+static struct bao_io_dispatcher_work io_dispatcher_work[BAO_IO_MAX_DMS];
+
+/* Workqueues dedicated to dispatching I/O requests for each Bao DM */
+static struct workqueue_struct *bao_io_dispatcher_wq[BAO_IO_MAX_DMS];
+
+void bao_io_dispatcher_destroy(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	if (bao_io_dispatcher_wq[dm->info.id]) {
+		bao_io_dispatcher_pause(dm);
+
+		destroy_workqueue(bao_io_dispatcher_wq[dm->info.id]);
+		bao_io_dispatcher_wq[dm->info.id] = NULL;
+
+		bao_intc_remove_handler();
+	}
+}
+
+int bao_dispatch_io(struct bao_dm *dm)
+{
+	struct bao_io_client *client;
+	struct bao_remio_hypercall_ctx ctx;
+	struct bao_virtio_request req;
+
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	ctx.dm_id = dm->info.id;
+	ctx.op = BAO_IO_ASK;
+	ctx.addr = 0;
+	ctx.value = 0;
+	ctx.request_id = 0;
+	ctx.access_width = 0;
+	ctx.npend_req = 0;
+
+	if (bao_remio_hypercall(&ctx))
+		return -EFAULT;
+
+	req.dm_id = ctx.dm_id;
+	req.op = ctx.op;
+	req.addr = ctx.addr;
+	req.value = ctx.value;
+	req.access_width = ctx.access_width;
+	req.request_id = ctx.request_id;
+
+	down_read(&dm->io_clients_lock);
+	client = bao_io_client_find(dm, &req);
+	if (!client) {
+		up_read(&dm->io_clients_lock);
+		return -ENODEV;
+	}
+
+	if (!bao_io_client_push_request(client, &req)) {
+		up_read(&dm->io_clients_lock);
+		return -EINVAL;
+	}
+
+	wake_up_interruptible(&client->wq);
+	up_read(&dm->io_clients_lock);
+
+	return ctx.npend_req;
+}
+
+/**
+ * io_dispatcher - Workqueue handler for dispatching I/O
+ * @work: Work struct representing this dispatch operation
+ *
+ * Handles all pending I/O requests for the associated Bao DM.
+ * Executed in process context by the workqueue.
+ */
+static void io_dispatcher(struct work_struct *work)
+{
+	struct bao_io_dispatcher_work *bao_dm_work;
+	struct bao_dm *dm;
+
+	if (WARN_ON_ONCE(!work))
+		return;
+
+	bao_dm_work = container_of(work, struct bao_io_dispatcher_work, work);
+	dm = bao_dm_work->dm;
+
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	while (bao_dispatch_io(dm) > 0)
+		cpu_relax();
+}
+
+/**
+ * io_dispatcher_intc_handler - Interrupt handler for I/O requests
+ * @dm: Bao device model that triggered the interrupt
+ *
+ * Invoked by the interrupt controller when a new I/O request is available.
+ * Queues the corresponding work item onto the I/O dispatcher workqueue
+ * for processing in process context.
+ */
+static void io_dispatcher_intc_handler(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm || !bao_io_dispatcher_wq[dm->info.id]))
+		return;
+
+	queue_work(bao_io_dispatcher_wq[dm->info.id],
+		   &io_dispatcher_work[dm->info.id].work);
+}
+
+void bao_io_dispatcher_pause(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm || !bao_io_dispatcher_wq[dm->info.id]))
+		return;
+
+	bao_intc_remove_handler();
+
+	drain_workqueue(bao_io_dispatcher_wq[dm->info.id]);
+}
+
+void bao_io_dispatcher_resume(struct bao_dm *dm)
+{
+	if (WARN_ON_ONCE(!dm || !bao_io_dispatcher_wq[dm->info.id]))
+		return;
+
+	bao_intc_setup_handler(io_dispatcher_intc_handler);
+
+	queue_work(bao_io_dispatcher_wq[dm->info.id],
+		   &io_dispatcher_work[dm->info.id].work);
+}
+
+int bao_io_dispatcher_init(struct bao_dm *dm)
+{
+	char name[BAO_NAME_MAX_LEN];
+
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	snprintf(name, sizeof(name), "bao-iodwq%u", dm->info.id);
+
+	if (bao_io_dispatcher_wq[dm->info.id])
+		return -EBUSY;
+	bao_io_dispatcher_wq[dm->info.id] =
+		alloc_workqueue(name, WQ_HIGHPRI | WQ_MEM_RECLAIM, 1);
+	if (!bao_io_dispatcher_wq[dm->info.id])
+		return -ENOMEM;
+
+	io_dispatcher_work[dm->info.id].dm = dm;
+	INIT_WORK(&io_dispatcher_work[dm->info.id].work, io_dispatcher);
+
+	bao_intc_setup_handler(io_dispatcher_intc_handler);
+
+	return 0;
+}
+
diff --git a/drivers/virt/bao/io-dispatcher/ioeventfd.c b/drivers/virt/bao/io-dispatcher/ioeventfd.c
new file mode 100644
index 000000000000..8c6a69df7a51
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/ioeventfd.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor Ioeventfd Client
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#include <linux/eventfd.h>
+#include "bao_drv.h"
+
+/**
+ * struct ioeventfd - Properties of an I/O eventfd
+ * @list: List node linking this ioeventfd
+ * @eventfd: Associated eventfd context
+ * @addr: Start address of the I/O range
+ * @data: Data used for matching (if not wildcard)
+ * @length: Length of the I/O range
+ * @wildcard: True if data matching is not required
+ *
+ * Represents an I/O eventfd registered for a Bao device model.
+ */
+struct ioeventfd {
+	struct list_head list;
+	struct eventfd_ctx *eventfd;
+	u64 addr;
+	u64 data;
+	int length;
+	bool wildcard;
+};
+
+/**
+ * bao_ioeventfd_shutdown - Release and remove an ioeventfd
+ * @dm: Bao device model owning the ioeventfd
+ * @p: Ioeventfd to shut down
+ */
+static void bao_ioeventfd_shutdown(struct bao_dm *dm, struct ioeventfd *p)
+{
+	lockdep_assert_held(&dm->ioeventfds_lock);
+
+	if (WARN_ON_ONCE(!p))
+		return;
+
+	eventfd_ctx_put(p->eventfd);
+	list_del(&p->list);
+	kfree(p);
+}
+
+/**
+ * bao_ioeventfd_config_valid - Validate ioeventfd configuration
+ * @config: Ioeventfd configuration
+ *
+ * Return: True if config is non-NULL, address+length does not wrap,
+ * and length is 1, 2, 4, or 8 bytes.
+ */
+static bool bao_ioeventfd_config_valid(struct bao_ioeventfd *config)
+{
+	if (WARN_ON_ONCE(!config))
+		return false;
+
+	if (config->addr + config->len < config->addr)
+		return false;
+
+	if (!(config->len == 1 || config->len == 2 || config->len == 4 ||
+	      config->len == 8))
+		return false;
+
+	return true;
+}
+
+/**
+ * bao_ioeventfd_is_conflict - Check if an ioeventfd conflicts with existing ones
+ * @dm: Bao device model
+ * @ioeventfd: Ioeventfd to check
+ *
+ * Return: True if an existing ioeventfd matches address, eventfd,
+ * and optionally data.
+ */
+static bool bao_ioeventfd_is_conflict(struct bao_dm *dm,
+				      struct ioeventfd *ioeventfd)
+{
+	struct ioeventfd *p;
+
+	lockdep_assert_held(&dm->ioeventfds_lock);
+
+	if (WARN_ON_ONCE(!dm || !ioeventfd))
+		return true;
+
+	list_for_each_entry(p, &dm->ioeventfds, list) {
+		if (p->eventfd == ioeventfd->eventfd &&
+		    p->addr == ioeventfd->addr &&
+		    (p->wildcard || ioeventfd->wildcard ||
+		     p->data == ioeventfd->data)) {
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/**
+ * bao_ioeventfd_match - Find ioeventfd matching an I/O request
+ * @dm: Bao device model
+ * @addr: I/O request address
+ * @data: I/O request data
+ * @len: I/O request length
+ *
+ * Return: The matching ioeventfd, NULL if none matches.
+ */
+static struct ioeventfd *bao_ioeventfd_match(struct bao_dm *dm, u64 addr,
+					     u64 data, int len)
+{
+	struct ioeventfd *p;
+
+	lockdep_assert_held(&dm->ioeventfds_lock);
+
+	if (WARN_ON_ONCE(!dm))
+		return NULL;
+
+	list_for_each_entry(p, &dm->ioeventfds, list) {
+		if (p->addr == addr && p->length >= len &&
+		    (p->wildcard || p->data == data)) {
+			return p;
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * bao_ioeventfd_assign - Assign and create an eventfd for a DM
+ * @dm: Bao device model to assign the eventfd to
+ * @config: Configuration of the eventfd to create
+ *
+ * Creates a new ioeventfd associated with the given eventfd and
+ * adds it to the Bao DM. Validates the configuration, checks for
+ * conflicts with existing ioeventfds, and registers the corresponding
+ * I/O client address range. Supports optional data matching for
+ * virtio 1.0 notifications; if not set, wildcard matching is used.
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_ioeventfd_assign(struct bao_dm *dm, struct bao_ioeventfd *config)
+{
+	struct eventfd_ctx *eventfd;
+	struct ioeventfd *new;
+	int rc = 0;
+
+	if (WARN_ON_ONCE(!dm || !config))
+		return -EINVAL;
+
+	if (!bao_ioeventfd_config_valid(config))
+		return -EINVAL;
+
+	eventfd = eventfd_ctx_fdget(config->fd);
+	if (IS_ERR(eventfd))
+		return PTR_ERR(eventfd);
+
+	new = kzalloc_obj(*new, GFP_KERNEL);
+	if (!new) {
+		rc = -ENOMEM;
+		goto err_put_eventfd;
+	}
+
+	INIT_LIST_HEAD(&new->list);
+	new->addr = config->addr;
+	new->length = config->len;
+	new->eventfd = eventfd;
+	new->wildcard = !(config->flags & BAO_IOEVENTFD_FLAG_DATAMATCH);
+	if (!new->wildcard)
+		new->data = config->data;
+
+	mutex_lock(&dm->ioeventfds_lock);
+
+	if (bao_ioeventfd_is_conflict(dm, new)) {
+		rc = -EEXIST;
+		goto err_unlock_free;
+	}
+
+	rc = bao_io_client_range_add(dm->ioeventfd_client, new->addr,
+				     new->addr + new->length - 1);
+	if (rc < 0)
+		goto err_unlock_free;
+
+	list_add_tail(&new->list, &dm->ioeventfds);
+	mutex_unlock(&dm->ioeventfds_lock);
+
+	return 0;
+
+err_unlock_free:
+	mutex_unlock(&dm->ioeventfds_lock);
+	kfree(new);
+err_put_eventfd:
+	eventfd_ctx_put(eventfd);
+	return rc;
+}
+
+/**
+ * bao_ioeventfd_deassign - Deassign and destroy an eventfd from a DM
+ * @dm: Bao device model to deassign the eventfd from
+ * @config: Configuration of the eventfd to remove
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_ioeventfd_deassign(struct bao_dm *dm,
+				  struct bao_ioeventfd *config)
+{
+	struct ioeventfd *p;
+	struct eventfd_ctx *eventfd;
+
+	if (WARN_ON_ONCE(!dm || !config))
+		return -EINVAL;
+
+	eventfd = eventfd_ctx_fdget(config->fd);
+	if (IS_ERR(eventfd))
+		return PTR_ERR(eventfd);
+
+	mutex_lock(&dm->ioeventfds_lock);
+
+	list_for_each_entry(p, &dm->ioeventfds, list) {
+		if (p->eventfd != eventfd)
+			continue;
+
+		bao_io_client_range_del(dm->ioeventfd_client, p->addr,
+					p->addr + p->length - 1);
+
+		bao_ioeventfd_shutdown(dm, p);
+		break;
+	}
+
+	mutex_unlock(&dm->ioeventfds_lock);
+	eventfd_ctx_put(eventfd);
+
+	return 0;
+}
+
+/**
+ * bao_ioeventfd_handler - Handle an Ioeventfd client I/O request
+ * @client: Ioeventfd client associated with the request
+ * @req: I/O request to process
+ *
+ * Processes I/O requests from the Bao I/O client kernel thread
+ * (bao_io_client_kernel_thread). For READ operations, the value is
+ * ignored and set to 0 since virtio MMIO drivers only write to the
+ * `QueueNotify` field. WRITE operations are checked against the
+ * registered ioeventfds, and the corresponding eventfd is signaled
+ * if a match is found.
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_ioeventfd_handler(struct bao_io_client *client,
+				 struct bao_virtio_request *req)
+{
+	struct ioeventfd *p;
+
+	if (WARN_ON_ONCE(!client || !req))
+		return -EINVAL;
+
+	if (req->op == BAO_IO_READ) {
+		req->value = 0;
+		return 0;
+	}
+
+	mutex_lock(&client->dm->ioeventfds_lock);
+
+	p = bao_ioeventfd_match(client->dm, req->addr, req->value,
+				req->access_width);
+	if (p)
+		eventfd_signal(p->eventfd);
+
+	mutex_unlock(&client->dm->ioeventfds_lock);
+
+	return 0;
+}
+
+int bao_ioeventfd_client_config(struct bao_dm *dm, struct bao_ioeventfd *config)
+{
+	if (WARN_ON_ONCE(!dm || !config))
+		return -EINVAL;
+
+	if (config->flags & BAO_IOEVENTFD_FLAG_DEASSIGN)
+		bao_ioeventfd_deassign(dm, config);
+
+	return bao_ioeventfd_assign(dm, config);
+}
+
+int bao_ioeventfd_client_init(struct bao_dm *dm)
+{
+	char name[BAO_NAME_MAX_LEN];
+
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	mutex_init(&dm->ioeventfds_lock);
+	INIT_LIST_HEAD(&dm->ioeventfds);
+
+	snprintf(name, sizeof(name), "bao-ioevfdc%u", dm->info.id);
+
+	dm->ioeventfd_client = bao_io_client_create(dm, bao_ioeventfd_handler,
+						    NULL, false, name);
+	if (!dm->ioeventfd_client)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void bao_ioeventfd_client_destroy(struct bao_dm *dm)
+{
+	struct ioeventfd *p;
+	struct ioeventfd *next;
+
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	mutex_lock(&dm->ioeventfds_lock);
+	list_for_each_entry_safe(p, next, &dm->ioeventfds, list)
+		bao_ioeventfd_shutdown(dm, p);
+	mutex_unlock(&dm->ioeventfds_lock);
+}
diff --git a/drivers/virt/bao/io-dispatcher/irqfd.c b/drivers/virt/bao/io-dispatcher/irqfd.c
new file mode 100644
index 000000000000..07b20365ecae
--- /dev/null
+++ b/drivers/virt/bao/io-dispatcher/irqfd.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Bao Hypervisor Irqfd Server
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#include <linux/eventfd.h>
+#include <linux/file.h>
+#include <linux/poll.h>
+#include <asm/bao.h>
+#include "bao_drv.h"
+
+/**
+ * struct irqfd - Properties of an IRQ eventfd
+ * @dm: Associated Bao device model
+ * @wait: Wait queue entry for blocking/waking
+ * @shutdown: Work struct for async shutdown
+ * @eventfd: Eventfd used to signal interrupts
+ * @list: List node within &bao_dm.irqfds
+ * @pt: Poll table for select/poll on the eventfd
+ *
+ * Represents an IRQ eventfd registered to a Bao device model.
+ */
+struct irqfd {
+	struct bao_dm *dm;
+	wait_queue_entry_t wait;
+	struct work_struct shutdown;
+	struct eventfd_ctx *eventfd;
+	struct list_head list;
+	poll_table pt;
+};
+
+/**
+ * bao_irqfd_shutdown - Release and remove an irqfd
+ * @irqfd: IRQ eventfd to shut down (lock must be held)
+ */
+static void bao_irqfd_shutdown(struct irqfd *irqfd)
+{
+	u64 cnt;
+
+	if (WARN_ON_ONCE(!irqfd || !irqfd->dm))
+		return;
+
+	lockdep_assert_held(&irqfd->dm->irqfds_lock);
+
+	list_del_init(&irqfd->list);
+
+	eventfd_ctx_remove_wait_queue(irqfd->eventfd, &irqfd->wait, &cnt);
+
+	eventfd_ctx_put(irqfd->eventfd);
+
+	kfree(irqfd);
+}
+
+/**
+ * bao_irqfd_inject - Inject a notify hypercall into the Bao hypervisor
+ * @id: Bao DM ID
+ *
+ * Return: 0 on success, -EFAULT if the hypercall fails.
+ */
+static int bao_irqfd_inject(int id)
+{
+	struct bao_remio_hypercall_ctx ctx = {
+		.dm_id = id,
+		.addr = 0,
+		.op = BAO_IO_NOTIFY,
+		.value = 0,
+		.access_width = 0,
+		.request_id = 0,
+	};
+
+	if (bao_remio_hypercall(&ctx))
+		return -EFAULT;
+
+	return 0;
+}
+
+/**
+ * bao_irqfd_wakeup - Custom wake-up handler for eventfd signaling
+ * @wait: Wait queue entry
+ * @mode: Mode flags
+ * @sync: Sync indicator
+ * @key: Poll bits (cast from void *)
+ *
+ * Called by the Linux kernel poll table when the underlying eventfd is signaled.
+ * Injects a Bao notify hypercall on POLLIN or schedules shutdown on POLLHUP.
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_irqfd_wakeup(wait_queue_entry_t *wait, unsigned int mode,
+			    int sync, void *key)
+{
+	struct irqfd *irqfd;
+	struct bao_dm *dm;
+	unsigned long poll_bits;
+
+	if (WARN_ON_ONCE(!wait || !key))
+		return -EINVAL;
+
+	irqfd = container_of(wait, struct irqfd, wait);
+	dm = irqfd->dm;
+	poll_bits = (unsigned long)key;
+
+	if (poll_bits & POLLIN)
+		bao_irqfd_inject(dm->info.id);
+
+	if (poll_bits & POLLHUP)
+		queue_work(dm->irqfd_server, &irqfd->shutdown);
+
+	return 0;
+}
+
+/**
+ * bao_irqfd_poll_func - Register an IRQFD with a poll table
+ * @file: File to poll
+ * @wqh: Wait queue head
+ * @pt: Poll table
+ *
+ * Adds the irqfd's wait queue entry to the kernel wait queue for event monitoring.
+ */
+static void bao_irqfd_poll_func(struct file *file, wait_queue_head_t *wqh,
+				poll_table *pt)
+{
+	struct irqfd *irqfd;
+
+	if (WARN_ON_ONCE(!pt || !wqh))
+		return;
+
+	irqfd = container_of(pt, struct irqfd, pt);
+	add_wait_queue(wqh, &irqfd->wait);
+}
+
+/**
+ * irqfd_shutdown_work - Workqueue handler to shutdown an irqfd
+ * @work: Work struct for the shutdown operation
+ *
+ * Removes and frees the irqfd from the DM under lock if it is still linked.
+ */
+static void irqfd_shutdown_work(struct work_struct *work)
+{
+	struct irqfd *irqfd;
+	struct bao_dm *dm;
+
+	if (WARN_ON_ONCE(!work))
+		return;
+
+	irqfd = container_of(work, struct irqfd, shutdown);
+	dm = irqfd->dm;
+
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	mutex_lock(&dm->irqfds_lock);
+	if (!list_empty(&irqfd->list))
+		bao_irqfd_shutdown(irqfd);
+	mutex_unlock(&dm->irqfds_lock);
+}
+
+/**
+ * bao_irqfd_assign - Assign an eventfd to a DM and create an irqfd
+ * @dm: Bao device model to assign the eventfd
+ * @args: Configuration of the irqfd to assign
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_irqfd_assign(struct bao_dm *dm, struct bao_irqfd *args)
+{
+	struct eventfd_ctx *eventfd = NULL;
+	struct irqfd *irqfd;
+	struct irqfd *tmp;
+	__poll_t events;
+	struct fd f;
+	int ret = 0;
+
+	if (WARN_ON_ONCE(!dm || !args))
+		return -EINVAL;
+
+	irqfd = kzalloc_obj(*irqfd, GFP_KERNEL);
+	if (!irqfd)
+		return -ENOMEM;
+
+	irqfd->dm = dm;
+	INIT_LIST_HEAD(&irqfd->list);
+	INIT_WORK(&irqfd->shutdown, irqfd_shutdown_work);
+
+	f = fdget(args->fd);
+	if (!fd_file(f)) {
+		ret = -EBADF;
+		goto out_free_irqfd;
+	}
+
+	eventfd = eventfd_ctx_fileget(fd_file(f));
+	if (IS_ERR(eventfd)) {
+		ret = PTR_ERR(eventfd);
+		goto out_fdput;
+	}
+	irqfd->eventfd = eventfd;
+
+	init_waitqueue_func_entry(&irqfd->wait, bao_irqfd_wakeup);
+	init_poll_funcptr(&irqfd->pt, bao_irqfd_poll_func);
+
+	mutex_lock(&dm->irqfds_lock);
+	list_for_each_entry(tmp, &dm->irqfds, list) {
+		if (irqfd->eventfd == tmp->eventfd) {
+			ret = -EBUSY;
+			mutex_unlock(&dm->irqfds_lock);
+			goto out_put_eventfd;
+		}
+	}
+	list_add_tail(&irqfd->list, &dm->irqfds);
+	mutex_unlock(&dm->irqfds_lock);
+
+	events = vfs_poll(fd_file(f), &irqfd->pt);
+	if (events & EPOLLIN)
+		bao_irqfd_inject(dm->info.id);
+
+	fdput(f);
+	return 0;
+
+out_put_eventfd:
+	eventfd_ctx_put(eventfd);
+out_fdput:
+	fdput(f);
+out_free_irqfd:
+	kfree(irqfd);
+	return ret;
+}
+
+/**
+ * bao_irqfd_deassign - Deassign an eventfd and destroy the associated irqfd
+ * @dm: Bao device model to remove the irqfd from
+ * @args: Configuration of the irqfd to deassign
+ *
+ * Return: 0 on success, a negative error code on failure
+ */
+static int bao_irqfd_deassign(struct bao_dm *dm, struct bao_irqfd *args)
+{
+	struct irqfd *irqfd;
+	struct irqfd *tmp;
+	struct eventfd_ctx *eventfd;
+
+	if (WARN_ON_ONCE(!dm || !args))
+		return -EINVAL;
+
+	eventfd = eventfd_ctx_fdget(args->fd);
+	if (IS_ERR(eventfd))
+		return PTR_ERR(eventfd);
+
+	mutex_lock(&dm->irqfds_lock);
+	list_for_each_entry_safe(irqfd, tmp, &dm->irqfds, list) {
+		if (irqfd->eventfd == eventfd) {
+			bao_irqfd_shutdown(irqfd);
+			break;
+		}
+	}
+	mutex_unlock(&dm->irqfds_lock);
+
+	eventfd_ctx_put(eventfd);
+
+	return 0;
+}
+
+int bao_irqfd_server_config(struct bao_dm *dm, struct bao_irqfd *config)
+{
+	if (WARN_ON_ONCE(!dm || !config))
+		return -EINVAL;
+
+	if (config->flags & BAO_IRQFD_FLAG_DEASSIGN)
+		return bao_irqfd_deassign(dm, config);
+
+	return bao_irqfd_assign(dm, config);
+}
+
+int bao_irqfd_server_init(struct bao_dm *dm)
+{
+	char name[BAO_NAME_MAX_LEN];
+
+	if (WARN_ON_ONCE(!dm))
+		return -EINVAL;
+
+	mutex_init(&dm->irqfds_lock);
+	INIT_LIST_HEAD(&dm->irqfds);
+
+	snprintf(name, sizeof(name), "bao-ioirqfds%u", dm->info.id);
+
+	dm->irqfd_server = alloc_workqueue(name, WQ_UNBOUND | WQ_HIGHPRI, 0);
+	if (!dm->irqfd_server)
+		return -ENOMEM;
+
+	return 0;
+}
+
+void bao_irqfd_server_destroy(struct bao_dm *dm)
+{
+	struct irqfd *irqfd;
+	struct irqfd *next;
+
+	if (WARN_ON_ONCE(!dm))
+		return;
+
+	if (dm->irqfd_server)
+		destroy_workqueue(dm->irqfd_server);
+
+	mutex_lock(&dm->irqfds_lock);
+	list_for_each_entry_safe(irqfd, next, &dm->irqfds, list)
+		bao_irqfd_shutdown(irqfd);
+	mutex_unlock(&dm->irqfds_lock);
+}
diff --git a/include/linux/bao.h b/include/linux/bao.h
new file mode 100644
index 000000000000..076f071086b6
--- /dev/null
+++ b/include/linux/bao.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Bao Hypervisor Linux Kernel Header file
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef _LINUX_BAO_H
+#define _LINUX_BAO_H
+
+#include <linux/types.h>
+
+/* Remote I/O Hypercall ID */
+#define BAO_REMIO_HYPERCALL_ID 0x2
+
+/**
+ * struct bao_remio_hypercall_ctx - REMIO hypercall context
+ * @dm_id: Device model identifier
+ * @addr: Target address
+ * @op: Operation code
+ * @value: Value to read/write
+ * @access_width: Access width in bytes
+ * @request_id: Request identifier
+ * @npend_req: Number of pending requests
+ */
+struct bao_remio_hypercall_ctx {
+	u64 dm_id;
+	u64 addr;
+	u64 op;
+	u64 value;
+	u64 access_width;
+	u64 request_id;
+	u64 npend_req;
+};
+
+#endif /* _LINUX_BAO_H */
diff --git a/include/uapi/linux/bao.h b/include/uapi/linux/bao.h
new file mode 100644
index 000000000000..5c97595637e6
--- /dev/null
+++ b/include/uapi/linux/bao.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Provides the Bao Hypervisor IOCTLs and global structures
+ *
+ * Copyright (c) Bao Project and Contributors. All rights reserved.
+ *
+ * Authors:
+ *	João Peixoto <jpeixoto@osyx.tech>
+ *	José Martins <jose@osyx.tech>
+ *	David Cerdeira <davidmcerdeira@osyx.tech>
+ */
+
+#ifndef _UAPI_BAO_H
+#define _UAPI_BAO_H
+
+#include <linux/types.h>
+
+/**
+ * struct bao_virtio_request - Parameters of a Bao VirtIO request
+ * @dm_id: Device model ID
+ * @addr: MMIO register address accessed
+ * @op: Operation type (WRITE = 0, READ, ASK, NOTIFY)
+ * @value: Value to write or read
+ * @access_width: Access width (VirtIO MMIO supports 4-byte aligned accesses)
+ * @request_id: Request ID of the I/O request
+ */
+struct bao_virtio_request {
+	__u64 dm_id;
+	__u64 addr;
+	__u64 op;
+	__u64 value;
+	__u64 access_width;
+	__u64 request_id;
+};
+
+/**
+ * struct bao_ioeventfd - Parameters of an ioeventfd request
+ * @fd: Eventfd file descriptor associated with the I/O request
+ * @flags: Logical OR of BAO_IOEVENTFD_FLAG_*
+ * @addr: Start address of the I/O range
+ * @len: Length of the I/O range
+ * @reserved: Reserved, must be 0
+ * @data: Data for matching (used if data matching is enabled)
+ */
+struct bao_ioeventfd {
+	__u32 fd;
+	__u32 flags;
+	__u64 addr;
+	__u32 len;
+	__u32 reserved;
+	__u64 data;
+};
+
+/**
+ * struct bao_irqfd - Parameters of an IRQFD request
+ * @fd: File descriptor of the eventfd
+ * @flags: Flags associated with the eventfd
+ */
+struct bao_irqfd {
+	__s32 fd;
+	__u32 flags;
+};
+
+/**
+ * struct bao_dm_info - Parameters of a Bao device model
+ * @id: Virtual ID of the DM
+ * @shmem_addr: Base address of the shared memory
+ * @shmem_size: Size of the shared memory
+ * @irq: IRQ number
+ */
+struct bao_dm_info {
+	__u32 id;
+	__u64 shmem_addr;
+	__u64 shmem_size;
+	__u32 irq;
+};
+
+/*
+ * The ioctl type for Bao, documented in
+ * Documentation/userspace-api/ioctl/ioctl-number.rst
+ */
+#define BAO_IOCTL_TYPE 0xA6
+
+/*
+ * Bao userspace IOCTL commands
+ * Follows Linux kernel convention, see Documentation/driver-api/ioctl.rst
+ */
+#define BAO_IOCTL_DM_GET_INFO _IOWR(BAO_IOCTL_TYPE, 0x01, struct bao_dm_info)
+#define BAO_IOCTL_IO_CLIENT_ATTACH \
+	_IOWR(BAO_IOCTL_TYPE, 0x02, struct bao_virtio_request)
+#define BAO_IOCTL_IO_REQUEST_COMPLETE \
+	_IOW(BAO_IOCTL_TYPE, 0x03, struct bao_virtio_request)
+#define BAO_IOCTL_IOEVENTFD _IOW(BAO_IOCTL_TYPE, 0x04, struct bao_ioeventfd)
+#define BAO_IOCTL_IRQFD _IOW(BAO_IOCTL_TYPE, 0x05, struct bao_irqfd)
+
+#endif /* _UAPI_BAO_H */
-- 
2.43.0


