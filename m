Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2804C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 07:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ZtlYdzWPfbUjT+3726P4tEkOyWdFs4LizgvGG0WnvQ=; b=v2o1itUDumJDbIqvHwHYyzmAc+
	1soChfX3wKKY0sR3HPp0T5zltn320GrHYWcEiAon7k2FNmQ3f95nESOM54PS9oqxOj9RaTq1u6sZ6
	xgsFccdS2tAunQk+tg/Rnn7yiQB7+Uw6s9XteZiCrzoDDb2cksykHiaQh324SEVFEGm1509EbFhRb
	/KoiqqmkSJFkKHG0JWgrhnXQNPqeCsrI8n5FLIXa2pqDVrjuSHA7PtDqc1nU14p6sXvWFwdwrmPe/
	CRrZtYtKRt3Bk1FQhQd8ljHKUGjDuX8RRfXU5HWf1aX7E5UVDZRy+mXiPltKaBkizlagF4JJrzFmy
	lumMXKLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCF-00000007FrN-2Cty;
	Fri, 07 Aug 2026 07:40:51 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFCC-00000007FqQ-0wlD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 07:40:49 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so32351325e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 00:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1786088446; x=1786693246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ZtlYdzWPfbUjT+3726P4tEkOyWdFs4LizgvGG0WnvQ=;
        b=wTbGwHeHQnruHEO/lqyFd4m0K0S6yhq5Sad7APS/kex65VL3fh9PMeVI0RvrUUaNQX
         iKotN7ocYDKPmjS+yJsXu1nK0ShXJNZpHM4HcBjpvmT9cJw4GNtAugGj7tsdReKwQtKA
         f3oVAIjTp6ZFmCWgLtA5o0evAxIWf7sSFKVEWTkug7kD5Zs8gBfx7rUptsyGiRLLjDEu
         K5yM7gW5JO/fOKsjVt8Wxi37k6LfuAEUVkwgOlYAGvkF+Bzpq2UQOS6BaE7SAUQIW93z
         +nSxJAnCOMAM168/YG3VKFz7jrhbJWQphHXm+0laRIfz54uGF2tzQnGaRLqlnNPcG8jr
         uixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088446; x=1786693246;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ZtlYdzWPfbUjT+3726P4tEkOyWdFs4LizgvGG0WnvQ=;
        b=bIrOSi+31/TTHKmhA/pJAb0Wx0CFGMPk94dcNl3PWf9VXkF4cKO9nBKSs6EW/2aKXC
         MKubSC4YxtXkVkMHxaK74Ac6vTafMUyhFJj79w4carRe1fELouKVXQkODV70T/D6Kxx5
         9WDLOzG4VfK/s2WS3DG2UHxxRDBTTUhf5qIla9tr0az9Z5hclLJ3JgchSTgOa/6VcWnc
         lC19dZdZw6sg1vS2Ilrw7cNNh9KIfi+bkT86Jg4HRMPgt/j7BT0De/edjfA1ZCevFNpz
         XYcveOQEDAJSXbyFOvAR6IubYfxPn8BU5XuOnvAaTYXI0jHmzstrauNWipDXZk0Ce4zI
         fDiw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8vODF2709z3eWL2+eNLIhI1cawDNjJ+PLRnZiWUw0MIrq6QCpKqG3xOPxN9M9sDKV6zcOy5TckGm7Y+HsYxiE@lists.infradead.org
X-Gm-Message-State: AOJu0YzFm2Pr5VhIowZDl0iSA+xoTK0Bg8mt/ylDHVA5TWiJnJbrdsgk
	WHUhgtgKD2EfnlTKLXEQPyIxOxRuYAL4l1ZMZ8w0MDptQPXgagI8JqfxT9tHswRdEUFV
X-Gm-Gg: AR+sD102NKixsU937+Lp0CpdrtRilAyx8Fe/3nYsyxVh0zjyrVe5edVdOae74Fxd7bd
	PU3RhpIBNcQJMGNk2pRgnzPLEicSrW3EEwmOuoBO/9UVzLJpBLyjh2UK/gh3RkwzfEHa4WQiO6z
	p7Sdi8crJ/2lvVZo4zhlKLQgtWvB9FBL53mIAcvpCWeACJ2kYOn8lNQxEpolPvn8GnY+tBNZMXA
	2iXySGkgP81/CnZUu1HZotoCwj4Qer8iOAjJiU4QmRH+drxps1FQqQIguJsp6GrC8+qwxf3foR1
	IFjNEqpu7aBKZcPtrsLdgohU6UeK5SioBTOyA3lzhUPgVhgUZGCh6MPhoCO7wK0Gz4eIpOXxmcG
	HdaNJoHbhuWERayMQVPLR8rmgiHqaQNx+wPvE2NO43LC8giyVldLyxUM4N4Gl9qdfrUPqemJaz/
	cabNn7ARFZ1FqZ0NgOymI25URoyV+sbnxMgEjbAF/OYmulkAN7vMk34wJ4hCyZMm0=
X-Received: by 2002:a05:600c:1f96:b0:496:c249:dd9a with SMTP id 5b1f17b1804b1-4994e71364fmr248230245e9.3.1786088445905;
        Fri, 07 Aug 2026 00:40:45 -0700 (PDT)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:2600:fba1:8d1e:1692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021f90f8sm2819904f8f.26.2026.08.07.00.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:40:45 -0700 (PDT)
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
Subject: [RFC PATCH v3 0/6] virt: bao: Add Bao hypervisor IPC and I/O dispatcher drivers
Date: Fri,  7 Aug 2026 08:39:27 +0100
Message-ID: <cover.1786010512.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_004048_555657_D9604931 
X-CRM114-Status: GOOD (  17.56  )
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
hypervisor: an IPC shared-memory driver and an I/O dispatcher, plus their
device-tree bindings, UAPI and MAINTAINERS entry.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems.
- The IPC shared-memory driver lets Bao guests exchange data through a
  shared-memory region split into a read and a write channel.
- The I/O dispatcher lets a backend guest service paravirtualised (VirtIO)
  I/O on behalf of frontend guests.

Sent as RFC: the RISC-V backend uses the SBI experimental extension space
(see "Open items" below), and the device-tree bindings were reworked in this
version and would benefit from another look.

## Changes since v2
- dt-bindings (ipcshmem): describe the two channels through reg/reg-names,
  drop read-channel/write-channel and the "id" property, use a vendor
  "bao,id", and use a generic node name (Krzysztof Kozlowski).
- dt-bindings (io-dispatcher): one node per backend device (single reg +
  interrupt) instead of one node describing many devices, modelled on the
  gunyah/Mediatek Genio bindings (Krzysztof Kozlowski).
- io dispatcher driver: one platform device per device model (/dev/bao-dmX);
  removed the global DM list, the anonymous-inode fd and the dispatcher
  indirection ioctl; fixed a leak and probe error-path bugs; initialise
  virtio_requests_lock and the hypercall context fields.
- ipcshmem driver: derive the two regions from reg; drop the success print;
  do the range arithmetic in u64.
- Kconfig: fix the help-text indentation (Randy Dunlap).
- style: unwrap the few-char line wraps; the IPC hypercall helper now takes a
  single argument and fits on one line (Andrew Jones).
- riscv: use BAO_SBI_EXT_ID consistently, document that it is in the SBI
  experimental extension space, and drop the redundant ecall input
  constraints (Andrew Jones).
- commit messages: rewritten to kernel style; the "consolidate the IPC
  hypercall ID" patch now explains why and covers the signature change
  (Greg KH).
- process: sent as a fresh thread with this changelog, and the mail setup that
  bounced v1/v2 is fixed (Krzysztof Kozlowski, Greg KH).

## Open items / still under discussion
- RISC-V uses the experimental SBI extension ID (0x08000ba0). A permanent
  implementation ID must be registered in the RISC-V SBI spec before RISC-V
  can be non-experimental; hence RFC.
- Whether the Remote I/O hypercall must follow SBI chapter-3 register rules
  (Andrew Jones) — see the reply on patch 4.
- The "bao,id" property and the "bao" vendor prefix (Krzysztof Kozlowski) —
  rationale is in the bindings; alternatives welcome.

Link to v2: https://lore.kernel.org/all/20260107162829.416885-1-joaopeixoto@osyx.tech/

João Peixoto (6):
  dt-bindings: bao: add IPC shared-memory device
  virt: bao: add IPC shared-memory driver
  dt-bindings: bao: add I/O dispatcher device
  virt: bao: add I/O dispatcher driver
  virt: bao: consolidate the IPC hypercall ID in include/linux/bao.h
  MAINTAINERS: add Bao hypervisor entry

 .../bindings/bao/bao,io-dispatcher.yaml       |  58 +++
 .../devicetree/bindings/bao/bao,ipcshmem.yaml |  59 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |  13 +
 arch/arm/include/asm/bao.h                    |  60 +++
 arch/arm64/include/asm/bao.h                  |  60 +++
 arch/riscv/include/asm/bao.h                  |  66 +++
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   2 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
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
 drivers/virt/bao/ipcshmem/Kconfig             |  10 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 228 ++++++++++
 include/linux/bao.h                           |  44 ++
 include/uapi/linux/bao.h                      |  96 +++++
 27 files changed, 2777 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bao/bao,io-dispatcher.yaml
 create mode 100644 Documentation/devicetree/bindings/bao/bao,ipcshmem.yaml
 create mode 100644 arch/arm/include/asm/bao.h
 create mode 100644 arch/arm64/include/asm/bao.h
 create mode 100644 arch/riscv/include/asm/bao.h
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
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
 create mode 100644 include/linux/bao.h
 create mode 100644 include/uapi/linux/bao.h


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.43.0


