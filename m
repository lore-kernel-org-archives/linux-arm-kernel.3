Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3C8C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 11:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=71g56uPtScUsuXicGPFTJJ9Hw3/l51368qJ69c37ce0=; b=VVhHNR+7KZlB6ANcj0zqOykDjq
	J0wBuroEcg0oyMs6yOoTw/jWZ6xgE5BflARR6JtKBcaIgenxx6BjLcNglYnQLR3DU+s5hk/U90ymq
	to4IBJ1R4xS6QF9SEQqExQqaCCZMGreKxR080n8d1+FVKgvlJwBskaLb6xk0r/cgyk6VHlm484Lhy
	1IVff06khVyyN4auq+lrsi5ofaU2cXph+cYVjP3uU8pMA5vvpmZQhKL5JGQg4ER3XrRKDmZqUpt3o
	QBoxg+mehGiapQHSIkfpBU/pbM6AVu3dPDuFeTNcvCbohR3LluFEcDKwHTMF71dR/w5SRGzMOyzg2
	mps/lYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnOE-0000000GGYW-1ncq;
	Sun, 27 Sep 2026 11:49:54 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAnOA-0000000GGX5-2SNT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 11:49:53 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49fff6f0f87so3961765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 04:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1790509788; x=1791114588; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71g56uPtScUsuXicGPFTJJ9Hw3/l51368qJ69c37ce0=;
        b=LHIZfo26yHNdN1I9TUkofy91/6ta9nBiPSQ7D0izhaiXdFK6xZ0J7SdOrLfK5FZx9/
         9jOuozilQ6JTK1FW5mTf0SMENHI5TBEJHfCkEQ9wV9dMuQ0GXj8zPp5OH0n/ZoJr+JF2
         MToHnYioaeJyQLKxoSHviMBZPVMI4LdIs/FuUmMgMXBFlhp00cmFFscyuPoK6fgPOjk/
         6U9UyYs+PTzFEocKR8vpLas/X5Fl9AuJW+/ytUHD8KrtEONGWF6eNRGtvKA3qhxHoiGs
         e2na3ecoDGaRW+0wvHjf5Ns46QgDdCGFGdZ4nEgMdgCDEZGZxkbNeAJc/qLurPBzDRp5
         adzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509788; x=1791114588;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=71g56uPtScUsuXicGPFTJJ9Hw3/l51368qJ69c37ce0=;
        b=KrmwrcaEMguEsVzDn9lqGCT75Imajn9XkGSDcuP4a3UgdmtpEZ9KnNVGh7cgBaXvtD
         gTOWbhW8NJ8p2bfwO06amrWfjGxgM1eNfLMb7nfHpIJwUiEZlIhPCeDqrllO+P+x4JFO
         d/cXmIIq3L/pRXE6aZjG393a1j/SMU0lVu2DDSfny6NUzloi68IuxmLutpch68IE6pf3
         iHdjyBbVYrHbVhDXxZlaacwMQyn2nFURDpPeqr29hMCA2h72c2j5RfGCuuS/mGrw6PNR
         yljpZ0Ol5OWFuHcfg4NYOGquYfY3V5ssUvemPW5sGtbqbnTbZXnKlUCcJvpWmfeWqxzE
         KE5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxRR2RYIaVXqK8jx2tlVBPaMQQEOtUzFspWyuidllmOiTd8tRgWMESKFMN5fh45sLkIecYFO610hJBmlV5o6a/j@lists.infradead.org
X-Gm-Message-State: AFuF++mANJJ/F7E5yeaD172RXsxVff7xEaXqtmvlg1FcBeIZJ+iCe3Yp
	4ao+X2v+0TwiVhZh5cLwQxHvX9tKLIGSQRK1k4AOA/4aLk9oG1rmV2wAV/zzXMM4mxuS
X-Gm-Gg: AYBFou3+d2hRvF3d8n7NSoVdcQ2vIu2xiUp/6DjeK4Q2iQ0rHRL38ql1CImoULo2o/d
	H18rbQH5fkMmouZmTsBM67cSEfQYV9c003dCWcdPqs9gSm8jk0c1Xln/uIsg23JKTEK3X7zftzQ
	6WOkA2QZkesd1UN5INbwptZL+g/YTn64fhsTxZpn5ZeMGos6pf4wX5CgvOMycIwBT3QEh1A1/PF
	KdFbr125iq208D8JShu7bBo+REXcHuHo49Hoc2Kb5I7HJO5X5swba0TPfh6hjGIZpilcaWRdvlV
	ydpTKi/S61+eTkVInxco6Aomwk97xIQ5zTRz5tcssm3s352XIuMw8VkKBgFLofJLWyW/Nxwg8Rf
	uPIaDDrkSBSyu8MwLGduAdnDlTdmuaACZiG6ruaUJZTDmwZzcjefwsuk9CeaEYpRsAMh/BKXUps
	BMehV7IRL2lOF6GAOWosoTF52McS1IwAL4N1RBPkVSJmjtF0mpiBPp8GvhyWFC0T4QUQcQ8eXFv
	KaqGuPda3We4oVvl3s7paFosQ4ACA==
X-Received: by 2002:a05:600c:4744:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49fe7b6371bmr185299995e9.12.1790509788255;
        Sun, 27 Sep 2026 04:49:48 -0700 (PDT)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:6d6e:8514:ff1c:6c57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm57095935e9.11.2026.09.27.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:49:47 -0700 (PDT)
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
Subject: [PATCH v4 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Sun, 27 Sep 2026 12:49:21 +0100
Message-ID: <cover.1790357735.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_044950_919422_661D8EF7 
X-CRM114-Status: GOOD (  24.87  )
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

This series adds guest-side drivers for the Bao static-partitioning
hypervisor: an IPC shared-memory driver, an I/O dispatcher that lets a
backend guest service VirtIO I/O for frontend guests, their UAPI and a
MAINTAINERS entry.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems (https://github.com/bao-project).

- The IPC shared-memory driver lets Bao guests exchange data through a
  shared-memory region split into a read and a write channel, exposed
  as a misc character device (read(), write(), mmap()).
- The I/O dispatcher bridges Bao's Remote I/O mechanism to a userspace
  VMM: the VMM creates each device model from /dev/bao, receives the
  frontend's MMIO accesses and completes them, with ioeventfd/irqfd
  support for the fast paths.

Changes since v3
----------------
The two design comments on v3 changed the shape of the series, which
went from six patches to three.

- No device tree (Krzysztof Kozlowski): both bindings and the "bao"
  vendor prefix are dropped. The IPC channels are a software contract
  between the hypervisor and the guest and are now declared on the
  kernel command line (bao_ipcshmem.channels=...). The set of device
  models a backend serves is a contract between the hypervisor and the
  VMM, so, following drivers/virt/acrn, the I/O dispatcher exposes a
  single /dev/bao control device and the VMM creates each device model
  with BAO_IOCTL_CREATE_DM (shared-memory region + notification line),
  which returns a per-DM file descriptor; the DM lives as long as the
  descriptor. The notification line is resolved against the device
  tree's root interrupt parent, like any device's interrupt.
- No architecture code (Will Deacon): the hypercall helpers moved to
  drivers/virt/bao/bao_hypercall.h and use arm_smccc_hvc() for the IPC
  hypercall and, because the Remote I/O hypercall returns the request
  in x1-x6, the SMCCC v1.2 arm_smccc_1_2_hvc(). RISC-V uses sbi_ecall()
  for IPC and a local ecall for Remote I/O (see open items). 32-bit Arm
  has no SMCCC v1.2 helper, so the I/O dispatcher is limited to arm64
  and RISC-V for now; the IPC driver still supports 32-bit Arm through
  SMCCC v1.1 (HAVE_ARM_SMCCC).
- The standalone "consolidate the IPC hypercall ID" patch is folded into
  the driver patches (Andrew Jones).
- All findings of the Sashiko review of v3 are addressed, among them:
  the DM id is taken from the file descriptor instead of userspace; the
  irqfd/ioeventfd teardown races and the ioeventfd deassign fall-through
  are fixed; the interrupt handler is per DM and the request_irq() name
  is persistent; queued requests are capped and requests that cannot be
  delivered are completed back to the hypervisor; the UAPI structures
  have no implicit padding; signals return -ERESTARTSYS; the IPC driver
  orders the shared-memory writes before the notify hypercall, refuses
  writable mappings of the read region, validates page-aligned regions
  and has an llseek. Details are in the per-patch changelogs.
- The ioctl type is now 0xA7: 7.3-rc1 registered 0xA6 for memory
  allocation profiling.
- Found while testing: the two modules were both named bao.ko (now
  bao_ipcshmem and bao_io_dispatcher), the ioeventfd kernel thread could
  exit before kthread_stop(), per-DM dispatcher state was kept in static
  arrays, a list walk used the wrong structure type, the UAPI header did
  not include linux/ioctl.h, and the dispatcher workqueue now passes
  WQ_PERCPU as required since 7.x.

Testing
-------
Built on v7.3-rc1 with GCC (W=1, sparse) for arm64, arm and riscv, as
modules and built-in, and with clang for arm64 and riscv. Run-time tested
under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64 virt with the
bao-demos demos: the IPC driver exchanging messages in both directions
between a Linux 7.3-rc1 guest and a FreeRTOS guest (linux+freertos demo),
and the I/O dispatcher with a Linux backend serving console, network and
block device models to a FreeRTOS guest and two Linux guests (virtio
demo). 32-bit Arm is compile-tested only.

Open items
----------
- RISC-V: the Bao SBI extension still uses the experimental extension
  space (0x08000ba0), and the Remote I/O hypercall returns the request
  in a2-a7, which does not follow the SBI calling convention (Andrew
  Jones, v2). Changing that means a hypervisor ABI change (status in
  a0/a1, request through shared memory); the RISC-V support is marked
  experimental until then, or it can be split out of this series if
  preferred.
- Bao does not implement the SMCCC vendor-hypervisor UID call, so the
  drivers cannot detect the hypervisor yet; adding it is planned on the
  hypervisor side.

v3: https://lore.kernel.org/all/cover.1786010512.git.jpeixoto@osyx.tech/

João Peixoto (3):
  virt: bao: add IPC shared-memory driver
  virt: bao: add I/O dispatcher driver
  MAINTAINERS: add Bao hypervisor entry

 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   8 +
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/bao_hypercall.h              | 190 ++++++++
 drivers/virt/bao/io-dispatcher/Kconfig        |  20 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 389 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 334 ++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  70 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 150 +++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 423 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 159 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 326 ++++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 315 +++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 358 +++++++++++++++
 include/uapi/linux/bao.h                      | 116 +++++
 21 files changed, 2895 insertions(+)
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/bao_hypercall.h
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
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
 create mode 100644 include/uapi/linux/bao.h


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0


