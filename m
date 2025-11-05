Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3FACCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EmBTXZDZAUONRv7bvu1TxvWWCFKWBjn3YLchHfiGaE0=; b=THS/rf93kRS13/0zlh5XQvVexg
	gEjCau7Ph7c6kBRpYyq1O5W3093kCIO+w53qRXd7O64yyT0SQ2JvbMopTbEt+WnUZqQ6lf3l/OaxY
	jiv763UWcRdsjTTOwwVZYmUhlBiGdVyYSvoAC0dqxy7LnkIhgT53qh13eclO11FofH3bw+H99Fgu4
	1A+UoCiAnl0yI7uAx3yXQK4KcOX0TRQ0Vc2RxvHS0EM1+/4Z6i8o2QyI+d3PmWvYXKnvp56OaIGjk
	QPwN1AEuBmmoHjDWEdQMB+qhY2tX5FdRu4kRnrmNAI37m1KmTyRe1NV0TNmRddM6XLXrDhQxkKiVo
	HHlgm/Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYst-0000000DHGk-2MLw;
	Wed, 05 Nov 2025 08:28:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYso-0000000DHF2-2mO0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 08:28:50 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29524abfba3so51767215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 00:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762331325; x=1762936125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EmBTXZDZAUONRv7bvu1TxvWWCFKWBjn3YLchHfiGaE0=;
        b=ZrJdP7LPYbGX/LyxJ6P0svDqznEDWC6YJql1CWfOMl+Vhebe2vj7M7IfyD5npfVjpB
         8KWEHZiE3h8JMEVwC6L0CTtzVWk2RYxFH3aTrPadccE78H4Ugcfah4J9uYQoDjTfZRKL
         U9Hg3jZyzcxYeRwqfuJ2wcXNQ1tmUCc8hMoal6NM0ULHeofj8LMMoaTD/gNMpYMcjRVI
         TrL4Vjo29ceELzvhhxv14Ve2OV5k9paNchbk1XBZ0X7+0Wcad+ytbBn6LHt3rcjocwWL
         qhBCgyaN9iYxQou3ags+SRyEepS40M/RBG+QY1CARBL+Dk08syb79WITMMSEkfL3n/ed
         +bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762331325; x=1762936125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmBTXZDZAUONRv7bvu1TxvWWCFKWBjn3YLchHfiGaE0=;
        b=gNv7Rgb8eQfCA4eAw6Y6YNQjh8zGVsPFEYjiNy0rozkTr992INM16jJTH/yW/lAHe3
         DrX/4dRCgU3lf0jWpa0XlBWIaN/mjzxkqS1AoPSrDHMBEbPGlOOmuzI1MB/45+7qSNLb
         LbaQaE0lnKlu4nKgtxWRgsQ3tee6KoIOAp7qqtTo+5hFUBGojvTOzQ6CuuGIwF3qAxza
         0UVNdY+ZW8I/okR2pLSjxS5f9fvnr3/ou9nSRhtd6BF5wtDg6kTfNIGNx0yEtHZLGfwu
         MJ1VJ7y+SbrQoSY9EnYGuUZ2yVq/lzI4pT1Ekx3/nO4h1HefS9l22qtT+AM76GEKHmlJ
         v7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwepcF+45uNEDmGgioXPWzUyNJdpySzvxI9vNaBouxS3KKjG3jCjsTa56CtJWn7J0+oKfXm9whncCc1lGYAl4d@lists.infradead.org
X-Gm-Message-State: AOJu0YxkqQ6b4O8pNCUEnXMLI307/sZbIhplpCfo4TeR876ZCs5tWF+2
	0/5X0BGtsO7yFxT7W7lXDod+7shgYVQgNICgMR8EC9Dy4GRaTNYHIpfYPb9fxOC5AH8=
X-Gm-Gg: ASbGncvC70cqlrnYnZaCKR3iGuI6fBw12cL0uGCLvm8d43+ImTlNMSDYkgDbrNAst3p
	4nlUocs4FtuSbNL3ViULXNuBAoKa7mKqf+vmrzF8JDw3X6xVfDbdFq76ryw7ipnCZJdMo6khOJw
	vAOXho+v8dZOe4VpmkeP2QXBjjcXavKhEWHnQx5dPMvmI1o+WHM/qp9EHoDv1tku1linrdx6WPl
	oDeKW8fTJJQcfMT46NYjLwnm1XUSjfGlUoSWXvLyUeAB0NxmLtjzhYB7mf4cO6U7/sRekkAaS2d
	nllxQknXFk3yNy478UculcqHP4oSEQrO0hTMhQhk/DdCw66LYa//UQeGZS8ZpeZay7+N0qUUtfU
	tLBEmVjmQBhzrEEILIHPRbqTzJ7KQL8YIct2w3Ls7FvkQNv+McnF7Flss
X-Google-Smtp-Source: AGHT+IGlpNsdSirje6pTwpA0LOhu+sBUDNtAUUKM3zOYPx1mBTBFQyxiz58mZ3Wb4G+vpIBfR+7Tlw==
X-Received: by 2002:a17:902:d58d:b0:294:def6:5961 with SMTP id d9443c01a7336-2962ada6b42mr37732875ad.45.1762331324990;
        Wed, 05 Nov 2025 00:28:44 -0800 (PST)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a741e3sm51870875ad.98.2025.11.05.00.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 00:28:44 -0800 (PST)
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
Subject: [PATCH v8 0/5] riscv: add support for SBI Supervisor Software Events
Date: Wed,  5 Nov 2025 08:26:32 +0000
Message-ID: <20251105082639.342973-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_002846_700507_BBE59F1A 
X-CRM114-Status: GOOD (  31.43  )
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

A test suite is available as a separate kselftest module. In order to
build it, you can use the following command:

$ KDIR=<build_dir> make O=build TARGETS="riscv/sse"-j $(($(nproc)-1)) \
  -C tools/testing/selftests

Then load the module using:

$ sh run_sse_test.sh

A KVM SBI SSE extension implementation is available at [2].

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf [1]
Link: https://github.com/rivosinc/linux/tree/dev/cleger/sse_kvm [2]

---

Changes in V8:
 - Use GPL-2.0-or-later licensing for all files
 - Use sse_get_event() in sse cpu offline path
 - Remove useless sse_reset() function.
 - Removed useless cast of stack to unsigned long
 - Replace pr_err() with pr_info() when SSE is missing
 - Remove SIE set in do_sse(), irq_queue_work() will send an IPI
   to the cpu if needed via arch_irq_work_raise() so that it will be
   treated right after reenabling interrupts in interrupted context.

Changes in v7:
 - Check return values of sse_on_each_cpu()
 - Fix typos in commit
 - Rename SBI_SSE_EVENT_SIGNAL to SBI_SSE_EVENT_INJECT
 - Rename SBI_SSE_EVENT_HART_UNMASK/MASK to SBI_SSE_HART_UNMASK/MASK
 - Add tlb flush for vmap stack to avoid taking exception during sse
   handler upon stack access. (Alex)
 - Move some assembly instruction to slow path
 - Renamed sse.c to sbi_sse.c, ditto for other files
 - Renamed RISCV_SSE to RISCV_SBI_SSE
 - Renamed sse_event_handler to sse_event_handler_fn
 - Put ifdef around sse_evt in PMU SBI driver

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
 arch/riscv/kernel/sbi_sse.c                   | 162 ++++
 arch/riscv/kernel/sbi_sse_entry.S             | 178 +++++
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/riscv/Kconfig                |  15 +
 drivers/firmware/riscv/Makefile               |   3 +
 drivers/firmware/riscv/riscv_sbi_sse.c        | 694 ++++++++++++++++++
 drivers/perf/Kconfig                          |  10 +
 drivers/perf/riscv_pmu.c                      |  23 +
 drivers/perf/riscv_pmu_sbi.c                  |  71 +-
 include/linux/perf/riscv_pmu.h                |   5 +
 include/linux/riscv_sbi_sse.h                 |  57 ++
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/sse/Makefile    |   5 +
 .../selftests/riscv/sse/module/Makefile       |  16 +
 .../riscv/sse/module/riscv_sse_test.c         | 511 +++++++++++++
 .../selftests/riscv/sse/run_sse_test.sh       |  44 ++
 26 files changed, 1958 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/include/asm/sse.h
 create mode 100644 arch/riscv/kernel/sbi_sse.c
 create mode 100644 arch/riscv/kernel/sbi_sse_entry.S
 create mode 100644 drivers/firmware/riscv/Kconfig
 create mode 100644 drivers/firmware/riscv/Makefile
 create mode 100644 drivers/firmware/riscv/riscv_sbi_sse.c
 create mode 100644 include/linux/riscv_sbi_sse.h
 create mode 100644 tools/testing/selftests/riscv/sse/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/Makefile
 create mode 100644 tools/testing/selftests/riscv/sse/module/riscv_sse_test.c
 create mode 100644 tools/testing/selftests/riscv/sse/run_sse_test.sh

-- 
2.43.0


