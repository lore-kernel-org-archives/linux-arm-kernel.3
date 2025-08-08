Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742E6C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 15:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ID9eOa0mJbb7Csy70BEFLYaT6HI+I5SdUw7yhJbZeM=; b=fkqAUStc4EopA8QdquVRZYVfDR
	riCxlFBF/nISjS8j2emjFt8qWH5BVWDHP53bA6C8jbX+hgD7s1J8hfLZaq+6GCFliGK/djM2XjcJG
	Cs96mW9qWEXwP7FkN1fW6JmChdKM0ztGlDM0zyVr3D++EQjABwiFWRfmM1/vtl6wclUZwJVqyjyrd
	iNJ0+ReY9+0k1A7qgh/U1wQEkccdRzXrR8xqVxbXxyQRZ3hksbwKFERA3sw29W2T46iENVCGXR57W
	2dMT9Jd6bMntDU12Jf48pF8H+NNiqgHrFd4mhhpxJT1x8zM7VMgKU6hSFkuRjSjNpOFkt2FQBW6JE
	eSa2LN5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPEF-00000003CvU-1xcm;
	Fri, 08 Aug 2025 15:41:59 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukPBe-00000003CQC-0GNP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 15:39:20 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3190fbe8536so2298462a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 08:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754667557; x=1755272357; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ID9eOa0mJbb7Csy70BEFLYaT6HI+I5SdUw7yhJbZeM=;
        b=Lo6B7ob+vClhexpcXI+XJMDALR3gEIes0kztthPtFfiF04wOmKDHeJyJAXM1lKnMR+
         id3vXZpu38adT75BzN7otBkM8t9L1rOU5g0WmHKXdzAX3LXlgy5P2gpz4ZL44TlKuI5d
         YUjdpuPheGVtbhht8P7GZsoZq0BZC8HXwZ4yQ4b2YFJyQmLQ6J21OPgXVU/fR83hbimS
         vMTvaXTBJ4KdXoHy+gTAvvco2IgWLbafJ5Em+rzP7hn41m0W7nq0lf1yBLUeu+a5I1b8
         ffALzRrcn9e+yMkWqOL6AhRQuTPBvtubO88Hd1l9HNUnQYP8ah+xUJIAR1iW3uvFzZSA
         OwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754667557; x=1755272357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ID9eOa0mJbb7Csy70BEFLYaT6HI+I5SdUw7yhJbZeM=;
        b=JuweUoL9wyJ8XnFcPne9ivHurTjLzp2QvfwETNiJfpsEaRz5Dl2YAikckS3ReTf2LO
         TBOAB2crQnnhYCu7ZOU2du1EA+9NLLAlTjttjAwFmq/fcxmUqgPz9/d9FgDo78gOFBIc
         7EvRE/Wqwni+chfEUgxtgQ8Mr1JxK6/yzxal82QxDi+wXUrIotC8im+j+WLQWwcfKMQw
         ySAI+I1opo2alsf3uSZB1MqvvsCBAh3cxFIpzFlue8ViQ8krRp7Qkozf3dAUCstQLLeR
         MGzRaf5WqSQmuwmH5Xil4WJXyVZN4Tiy1A6JflG5XRFjSLPf2wDZe3Vbx2d0S5raHtbz
         PM8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUghdJ94bjdcyBzH9vo0ldZatXf1vVnv1E62aufzV8/qMHuJ/HX2bV2oUnXk611XO0sVSofhE2u3+VJAx3gGiZc@lists.infradead.org
X-Gm-Message-State: AOJu0YzDe5Yp2QaWPl9wZ9c3bkxiconQ3ik/N9NWLasKZRs0gLvNRhl1
	yCwqyk1nXr0OXQeFkNMM3IH7VxebbfAkIlGnfpvuU7nI3GMdJJDjCwclWLw0NUvZy1c=
X-Gm-Gg: ASbGncvTYG1yYmilfCVo4VAffO2+PGK1P5VLk+OxGDGo30VHwEt3w2A2HDZ7YEgwwMm
	WeyGKQTWpfmRRvtn4X8qa9MjCAW6FvpDvYGgFXiUSi0hsZZX5oaqCccnkoU8JtNiYaXwcgPr/pM
	ak6KbbhSGuLYf4OCSVu1uxq6jwEvQg/hVO/rFeq6KeJmD2tCuma/BZBxOFxj+yi9N3x1o73crVV
	B8V9pkeZXqJXmPFGWd78HSrhzqZBB2yckcNATGS3Ne7ZVViXWdNcrY8nMDH/mZxGhWdmPK5ewok
	qQRc38KBGZVvAWjdFNJXQsy/GPUxZHBa0vQMNOvxn8a3v0dPNroBJQM/sRx6+24QeexgPRDTNHq
	JWL8f00jKHjgJ1w==
X-Google-Smtp-Source: AGHT+IGJSBB0kKDSSdvKCfj6Lqz7T7EoQAptAhpCgVH402UyN2lZVLU9xJ7ez/W/aSW1HGcmlgK4ww==
X-Received: by 2002:a17:90b:2e45:b0:31f:1744:e7fd with SMTP id 98e67ed59e1d1-32183e7ed80mr4807127a91.31.1754667556852;
        Fri, 08 Aug 2025 08:39:16 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3218c3c2d58sm1135971a91.16.2025.08.08.08.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 08:39:16 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v6 0/5] riscv: add support for SBI Supervisor Software Events
Date: Fri,  8 Aug 2025 15:38:51 +0000
Message-ID: <20250808153901.2477005-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_083918_153614_52B89605 
X-CRM114-Status: GOOD (  30.07  )
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

The SBI Supervisor Software Events (SSE) extensions provides a mechanism
to inject software events from an SBI implementation to supervisor
software such that it preempts all other supervisor level traps and
interrupts. This extension is introduced by the SBI v3.0 specification[1].

Various events are defined and can be send asynchronously to supervisor
software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
as platform specific events. Events can be either local (per-hart) or
global. Events can be nested on top of each other based on priority and
can interrupt the kernel at any time.

First patch adds the SSE definitions. Second one adds support for SSE
at arch level (entry code and stack allocations) and third one at driver
level. Finally, the last patch add support for SSE events in the SBI PMU
driver. Additional testing for that part is highly welcomed since there
are a lot of possible path that needs to be exercised.

Amongst the specific points that needs to be handle is the interruption
at any point of the kernel execution and more specifically at the
beginning of exception handling. Due to the fact that the exception entry
implementation uses the SCRATCH CSR as both the current task struct and
as the temporary register to switch the stack and save register, it is
difficult to reliably get the current task struct if we get interrupted
at this specific moment (ie, it might contain 0, the task pointer or tp).
A fixup-like mechanism is not possible due to the nested nature of SSE
which makes it really hard to obtain the original interruption site. In
order to retrieve the task in a reliable manner, add an additional
__sse_entry_task per_cpu array which stores the current task. Ideally,
we would need to modify the way we retrieve/store the current task in
exception handling so that it does not depend on the place where it's
interrupted.

Contrary to pseudo NMI [2], SSE does not modifies the way interrupts are
handled and does not adds any overhead to existing code. Moreover, it
provides "true" NMI-like interrupts which can interrupt the kernel at
any time (even in exception handling). This is particularly crucial for
RAS errors which needs to be handled as fast as possible to avoid any
fault propagation.

A KVM SBI SSE extension implementation is available at [2].

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf [1]
Link: https://github.com/rivosinc/linux/tree/dev/cleger/sse_kvm [2]

---

Changes in v6:
 - Fix comment in assembly argument
 - Check hart id to be the expected one in order to skip CPU id
   matching in sse assembly.

Changes in v5:
 - Added a SSE test module in kselftests
 - Removed an unused variable
 - Applied checkpatch.pl --strict and fix all errors
 - Use scope_guard(cpus_read_lock) instead of manual cpus_read_lock()
 - Fix wrong variable returned in sse_get_event
 - Remove useless init of events list
 - Remove useless empty for loop on cpus
 - Set sse_available as  __ro_after_init
 - Changed a few pr_debug to pr_warn
 - Fix event enabled stated updated in case of failure
 - Change no_lock to nolock
 - Rename attr_buf to attr
 - renamed sse_get_event_phys() to sse_event_get_attr_phys() and removed
   the second argument
 - Simplify return value in sse_event_attr_set_nolock()
 - Remove while loop(-EINVAL) for event cpu set call
 - Renamed interrupted_state_phys to interrupted_phys
 - Use scoped_guards/guard for sse_mutex
 - Remove useless struct forward declaration in sse.h
 - Add more explanations as to why we set SIE bit in IP
 - Unconditionnally set SIE in SIP
 - Move SSE_STACK_SIZE adjustement in sse_stack_alloc/free()
 - Replace move instructions with mv
 - Rename NR_CPUS asm symbol to ASM_NR_CPUS
 - Restore SSTATUS first in sse_entry return path so that it works for
   double trap without any modification later.
 - Implement proper per cpu revert if enable/register fails

Changes in v4:
 - Fix a bug when using per_cpu ptr for local event (Andrew)
 - Add sse_event_disable/enable_local()
 - Add pmu_disable/pmu_enable() to disable/enable SSE event
 - Update event ID description according to the latest spec
 - Fix comment about arguments in handle_sse()
 - Added Himanchu as a SSE reviewer
 - Used SYM_DATA_*() macros instead of hardcoded labels
 - Invoke softirqs only if not returning to kernel with irqs disabled
 - Remove invalid state check for write attribute function.
 - Remove useless bneq statement in sse_entry.S

Changes in v3:
 - Split arch/driver support
 - Fix potential register failure reporting
 - Set a few pr_err as pr_debug
 - Allow CONFIG_RISCV_SSE to be disabled
 - Fix build without CONFIG_RISCV_SSE
 - Remove fixup-like mechanism and use a per-cpu array
 - Fixed SSCRATCH being corrupted when interrupting the kernel in early
   exception path.
 - Split SSE assembly from entry.S
 - Add Himanchu SSE mask/unmask and runtime PM support.
 - Disable user memory access/floating point/vector in SSE handler
 - Rebased on master

v2: https://lore.kernel.org/linux-riscv/20240112111720.2975069-1-cleger@rivosinc.com/

Changes in v2:
 - Implemented specification v2
 - Fix various error handling cases
 - Added shadow stack support

v1: https://lore.kernel.org/linux-riscv/20231026143122.279437-1-cleger@rivosinc.com/

Clément Léger (5):
  riscv: add SBI SSE extension definitions
  riscv: add support for SBI Supervisor Software Events extension
  drivers: firmware: add riscv SSE support
  perf: RISC-V: add support for SSE event
  selftests/riscv: add SSE test module

 MAINTAINERS                                   |  15 +
 arch/riscv/include/asm/asm.h                  |  14 +-
 arch/riscv/include/asm/sbi.h                  |  61 ++
 arch/riscv/include/asm/scs.h                  |   7 +
 arch/riscv/include/asm/sse.h                  |  47 ++
 arch/riscv/include/asm/switch_to.h            |  14 +
 arch/riscv/include/asm/thread_info.h          |   1 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/asm-offsets.c               |  14 +
 arch/riscv/kernel/sse.c                       | 154 ++++
 arch/riscv/kernel/sse_entry.S                 | 180 +++++
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/riscv/Kconfig                |  15 +
 drivers/firmware/riscv/Makefile               |   3 +
 drivers/firmware/riscv/riscv_sse.c            | 694 ++++++++++++++++++
 drivers/perf/Kconfig                          |  10 +
 drivers/perf/riscv_pmu.c                      |  19 +
 drivers/perf/riscv_pmu_sbi.c                  |  71 +-
 include/linux/perf/riscv_pmu.h                |   3 +
 include/linux/riscv_sse.h                     |  56 ++
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/sse/Makefile    |   5 +
 .../selftests/riscv/sse/module/Makefile       |  16 +
 .../riscv/sse/module/riscv_sse_test.c         | 513 +++++++++++++
 .../selftests/riscv/sse/run_sse_test.sh       |  44 ++
 26 files changed, 1947 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/sse.h
 create mode 100644 arch/riscv/kernel/sse.c
 create mode 100644 arch/riscv/kernel/sse_entry.S
 create mode 100644 drivers/firmware/riscv/Kconfig
 create mode 100644 drivers/firmware/riscv/Makefile
 create mode 100644 drivers/firmware/riscv/riscv_sse.c
 create mode 100644 include/linux/riscv_sse.h
 create mode 100644 tools/testing/selftests/riscv/sse/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/riscv_sse_test.c
 create mode 100644 tools/testing/selftests/riscv/sse/run_sse_test.sh

-- 
2.43.0


