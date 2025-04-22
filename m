Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F38C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 12:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OefwBLy5C9nQRNf2nMOiIbJOsB3W42el5vzyC2W690w=; b=byRtPlCegLkwoUt0HZBNAYq8xI
	pgN3tEraBSQT0maRwnVw5UkhPJ2ARp8TsAYm7elLt3n6cH4zrIeq5J7to5VhNQnS7K82l7hVOswCG
	EX1XPoSTrbHPL/BmBBl/OEjxsUsSV/gOi6RyYOzYx8SgWNGueMpdghDAsYNTdceGaJwCGoRN9Uc9c
	6iGxNeNbJxNxuGza8N5n4JnM+b9+8iY8zIPQBUBTGchF225eMhFxHerAkSEdJsXfSXJZux8ExkC0m
	/P6LtS3nsMQjFNDncRejX0Ap9i8UwpiOTkbx9OvZ6LzVtbx3V2hp8ffIcbGud+k5ry38+hsjFjfIP
	XWvhR34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CSK-000000073u3-0JCG;
	Tue, 22 Apr 2025 12:10:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrL-00000006x35-2ftY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Apr 2025 11:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=OefwBLy5C9nQRNf2nMOiIbJOsB3W42el5vzyC2W690w=; b=OqOpEUz70xDZ7vpM4a652Xx9yK
	NMgniP2zJK3euCs6A6r9id2AEHrMP5L4fr9/jJHII1k5QMhAOaokNLHtRmFqVgx0wORyah63+Vhnc
	uCkye5YHiMr/s5W2IgjuaIm48ElKMqiV+nHhVkcnbQE3oqGiF/10PZDXE0KwHRKB+lTygBOk1zrec
	hgu1oGc3TTP4xR+uUI6kCUpKjUUbdnNi6JgnkzO1CYt+0RgGb8eHbxKekaw1gqmJq8Y6qK78au+xH
	uKsNYo+9HT61fB158FGy6fGImRkarUOZfv7OUDpw8AQ2eP6FfPiIrkgNfv5N25T8dnd4uKdC7AT0d
	rRvXMkVw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7BrI-0000000BCEW-0iyB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:14 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3441743f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 04:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321529; x=1745926329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OefwBLy5C9nQRNf2nMOiIbJOsB3W42el5vzyC2W690w=;
        b=TFHGjYMgbIVNnFx1hUGu3YGfAmQHjiP1CjlvuUPpP96bkQA1JbCc9MWoMBHWoupWon
         Ic7Vb3HJJjDXvgChiYH8UIBCAc3WRZnAlLBhMLR1N2DECfLtI8/Zpbr51wdGJRDBVZY0
         bDF88wMFhuzINh5Vm+oDJDc6Cxa355fJ0ZRmQ32oLM+pIoJAUYj4ClSf4M5I/TCYZDpU
         dVxR5JbtzBWlvTGd6kixAlSodLjfWNPeFejKatdP2ItAPjlr598gMPVsHMccRZ9RhvNZ
         dwBd8+TliJjrlTp2dl2wZviQ/77+DZa4N22LKnfcGYQLkWqiQDHqbWr4niYXcIZsYbXF
         ayFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321529; x=1745926329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OefwBLy5C9nQRNf2nMOiIbJOsB3W42el5vzyC2W690w=;
        b=r4KIqIGR1BIKmX45ZgHdpxdijgWcTctR1WJjbbtsrRnFTI7rKhQagfXZOAcQoI+ryH
         vY/OfOrPEIbTz4k8mWrxARvjQhr6KSq/HQIZ3JPtXnAvvLMsNqcUBCF8WAnH4G9jkdmz
         VL63wJp/x106Mpp1DeuEhhNk5g0i5SFwKJHCp49um8mFmpelsKJsCOAKZIxhgoHIPeFz
         gIGOVHWiX1xGEt5Ocw+Clfhm3+KTFes0hLwFD1qNIfjRc/U5QerWmLzkD1GUNnGV/iN4
         tHPamAh+buNNqUbvWluU1hTypH3yyDj8FxGort4Npv2oqX/W3SH4GkaakQUDL9y7zsge
         dBXw==
X-Forwarded-Encrypted: i=1; AJvYcCVcbTfkNhp24ZjGahUYRlAnpTBPtBqu2LrBUEvA+/yHrtJkGHUrNEsR61mXdL9vhlzOZcKi03EL3kwlVAhakEcQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxpAm9A9vpcnOsO8Z/IQHncB6HoSp315IelCAyrOfl/fQX/T+ld
	cogWJ0IiaAo1Pgmd16eYuTc0GbOxxkXlvJOhCdJVG9HrrqfrvLUfhDCH0SF13ys=
X-Gm-Gg: ASbGncu7svxCVFA26koKaYgY9fF8bhPiqXjiyEU1KYYw6Lx4W3x8ao0PRRo1+6uIX4L
	YcZsKDYu1p0dmymEp4mezg1V2acJLNOmUYIeM5by5dGAva24RJRxMg+RbUK77O2neGD2s9r3MeI
	aeJTaMDS8IGo4T/mhQFbUrE47CkhOG9lhs+gIJY1LF1WBQKY+RK8aWYHqZr28R/XVsV7KTYEsAS
	AeLk5hQc3n1bBMHoYiP7ESxojSNFnD8YyQy84ISmWWhwMnIF7lgXF5pEn06lF5gR+JweYXGga/H
	mezVtIPXGg6v5Ng2ywTe4iIIPGtq/EOssB5PJN572xiUTVqha+tN
X-Google-Smtp-Source: AGHT+IH0nb8o7hKQyGVq2JnvWNqH5INVMxoDkBitlvauZDO1uWFUGhcBewPYsW8bzlAMjNtYGE2jiA==
X-Received: by 2002:a5d:5f90:0:b0:39c:dcc:6451 with SMTP id ffacd0b85a97d-39efbace334mr11602293f8f.43.1745321529180;
        Tue, 22 Apr 2025 04:32:09 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:08 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 00/14] introduce kmemdump
Date: Tue, 22 Apr 2025 14:31:42 +0300
Message-ID: <20250422113156.575971-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_123212_390370_27894296 
X-CRM114-Status: GOOD (  18.99  )
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

kmemdump is a mechanism which allows the kernel to mark specific memory
areas for dumping or specific backend usage.
Once regions are marked, kmemdump keeps an internal list with the regions
and registers them in the backend.
Further, depending on the backend driver, these regions can be dumped using
firmware or different hardware block.
Regions being marked beforehand, when the system is up and running, there
is no need nor dependency on a panic handler, or a working kernel that can
dump the debug information.
The kmemdump approach works when pstore, kdump, or another mechanism do not.
Pstore relies on persistent storage, a dedicated RAM area or flash, which
has the disadvantage of having the memory reserved all the time, or another
specific non volatile memory. Some devices cannot keep the RAM contents on
reboot so ramoops does not work. Some devices do not allow kexec to run
another kernel to debug the crashed one.
For such devices, that have another mechanism to help debugging, like
firmware, kmemdump is a viable solution.

kmemdump can create a core image, similar with /proc/vmcore, with only
the registered regions included. This can be loaded into crash tool/gdb and
analyzed.
To have this working, specific information from the kernel is registered,
and this is done at kmemdump init time, no need for the kmemdump user to
do anything.

The implementation is based on the initial Pstore/directly mapped zones
published as an RFC here:
https://lore.kernel.org/all/20250217101706.2104498-1-eugen.hristev@linaro.org/

The back-end implementation for qcom_smem is based on the minidump
patch series and driver written by Mukesh Ojha, thanks:
https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/

I appreciate the feedback on this series, I know it is a longshot, and there
is a lot to improve, but I hope I am on the right track.

Thanks,
Eugen

PS. Here is how crash tool reports the dump:

     KERNEL: /home/eugen/linux-minidump/vmlinux  [TAINTED]
    DUMPFILE: /home/eugen/eee
        CPUS: 8 [OFFLINE: 7]
        DATE: Thu Jan  1 02:00:00 EET 1970
      UPTIME: 00:00:28
    NODENAME: qemuarm64
     RELEASE: 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty
     VERSION: #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
     MACHINE: aarch64  (unknown Mhz)
      MEMORY: 0
       PANIC: ""

crash> log
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd4b2]
[    0.000000] Linux version 6.14.0-rc5-next-20250303-00014-g011eb2aaf7b6-dirty (eugen@eugen-station) (aarch64-none-linux-gnu-gcc (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 13.3.1 20240614, GNU ld (Arm GNU Toolchain 13.3.Rel1 (Build arm-13.24)) 2.42.0.20240614) #169 SMP PREEMPT Thu Apr 17 14:12:21 EEST 2025
[    0.000000] KASLR enabled
[...]

Eugen Hristev (14):
  Documentation: add kmemdump
  kmemdump: introduce kmemdump
  kmemdump: introduce qcom-md backend driver
  soc: qcom: smem: add minidump device
  Documentation: kmemdump: add section for coreimage ELF
  kmemdump: add coreimage ELF layer
  printk: add kmsg_kmemdump_register
  kmemdump: coreimage: add kmsg registration
  genirq: add irq_kmemdump_register
  kmemdump: coreimage: add irq registration
  panic: add panic_kmemdump_register
  kmemdump: coreimage: add panic registration
  sched: add sched_kmemdump_register
  kmemdump: coreimage: add sched registration

 Documentation/debug/index.rst      |  17 ++
 Documentation/debug/kmemdump.rst   |  83 +++++
 drivers/Kconfig                    |   2 +
 drivers/Makefile                   |   2 +
 drivers/debug/Kconfig              |  39 +++
 drivers/debug/Makefile             |   5 +
 drivers/debug/kmemdump.c           | 197 ++++++++++++
 drivers/debug/kmemdump_coreimage.c | 293 ++++++++++++++++++
 drivers/debug/qcom_md.c            | 467 +++++++++++++++++++++++++++++
 drivers/soc/qcom/smem.c            |  10 +
 include/linux/irqnr.h              |   1 +
 include/linux/kmemdump.h           |  77 +++++
 include/linux/kmsg_dump.h          |   6 +
 include/linux/panic.h              |   1 +
 include/linux/sched.h              |   1 +
 kernel/irq/irqdesc.c               |   7 +
 kernel/panic.c                     |   8 +
 kernel/printk/printk.c             |  13 +
 kernel/sched/core.c                |   7 +
 19 files changed, 1236 insertions(+)
 create mode 100644 Documentation/debug/index.rst
 create mode 100644 Documentation/debug/kmemdump.rst
 create mode 100644 drivers/debug/Kconfig
 create mode 100644 drivers/debug/Makefile
 create mode 100644 drivers/debug/kmemdump.c
 create mode 100644 drivers/debug/kmemdump_coreimage.c
 create mode 100644 drivers/debug/qcom_md.c
 create mode 100644 include/linux/kmemdump.h

-- 
2.43.0


