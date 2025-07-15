Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECB6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kPWakNl6Nt1auqo/Co1iCdgQw/f2/7pOJv4u9JLkkOE=; b=OIZJlnhmIz1pKWorzd6mOGgkoq
	e3ZIL61TovJ47K8eNgTUBeQ301j6cJEDfw5DFveCfrU5qipfBpDIXBFhI+vcHbH10on2AKYxu5EVm
	VkJjNeIFMhQFXaHXEhZyjdExN0WRewWsDa1FKx4QEyQ3fI3+4FC03pmxWqEbXFzvGswKcfUjntD7b
	yWVlUyWqyICVs0XqUO0DXFQ4u2fRZ1VN7aXu8ls9zqmQOEF230tTHC490KArS8SK1aQeuwucjdFTB
	lPEvtdDQ/SjjcJNUmpz5RRhcdGplbSnX0I4mjjjdS4NsvIaXVI7Ruw6pECvaOQSz8toXf7Cbh9zRx
	ZXwhHGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubl7N-00000005ygD-0y1G;
	Tue, 15 Jul 2025 19:15:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubi7d-00000005gbf-0HR7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 16:03:15 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-74ce477af25so3557113b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752595392; x=1753200192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPWakNl6Nt1auqo/Co1iCdgQw/f2/7pOJv4u9JLkkOE=;
        b=VsdzuR4rLddguj/Af1MohK2+bkP7yjuy/KfiSPWSsEN7/i5+Lv2xE97JLCwgDT9L7u
         KhZs44s1YDxLUfgJg31l9GPRsZ5+CQPfRfOiKGP/TETSDsP55rFgCx4IBFkEAQv0WfC6
         H8ZUq/1lQEaZLccwpndIf7saSbT4BK+WuOhrqoKGdRpdUdlE5iVu1nhplDAZ/qSccYcz
         tJ9kUUL5uElF/usgf7fHFyoB/ZOvkkKRAqMpvqm9+gJO2xeYk1h79HzYoDkUCPluZ0YO
         fu8O82kjJa9ktaElXfRptP57VWf+QVeV0JQPYGA3BHCCye07xuC5w+j2AiOt+pw9mJpS
         Jp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752595392; x=1753200192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPWakNl6Nt1auqo/Co1iCdgQw/f2/7pOJv4u9JLkkOE=;
        b=QoqQjQej/pbnl0Y5M9w4NRGDSEX1ZItUeFtXhgQ9vlGJGtNh4vouFp9RmJELemH/Gl
         yALCZBHGIDsdU4djRvU5S68bkjLc2twntLDVm8oXkEAP0smS2e4yZ6+8pR1hlOmc1yHf
         g73IoWTUM9PYeuXl1ArXX2UP6L0AksvfHQlO//wWXr8paeiwzuMShffzk/Qxh3AAXIw5
         RP7Y4TOj82cCEcvvHyehYtL56x//XqscUdpRXhWeiZOJckwAgpnmOyJpe3D7/EAO5TG3
         aT0IxDLfMS2O48ytxDCpxMKd73u4NHIDFK7ySLmUyC31wijhdCRPtZ/aylA5X9q3zqJG
         GI0w==
X-Forwarded-Encrypted: i=1; AJvYcCWlf4ut6EzpnTKiIgPhAzF0xdZo0TY+jMNzZsumhnb24wH12PPlg7PQ1MtVtR36GWyvRkBQO7YdZyY0DjsjEcYT@lists.infradead.org
X-Gm-Message-State: AOJu0YyTCLmyzkTZWBPQu76mh0tBR8hkVBoFMuj7LWhu/JMU7Lg1HvRe
	xwlzlUFHiREceyMJbwWZecmUOmtuHRow0fQ5kb/0bz3zGjzYe6izNqjs+ssMZWh933U=
X-Gm-Gg: ASbGncsWaz6eB4xzQTt2s3aaHswNpGosu/rY98tDMrfWZHscrpMxcMGhgpRI+27AtmV
	QYangB03+y++4UPB1VrulBw9zEV92sZgyZBQiCahys+TmQRJzZqsPfCXxxkTdEVD+bDy3xJehh4
	tT2f7Kyes8Gs1IhPb44TgAHYMriU6f0mTYeRJm7DHtANCFtudTCyp/uaEJElRwETnDCM1jSOds0
	XW9aIJI5iLZ2qH2vLVVWrpJCVPRXkvkVMVu/W1jPDnfM9q1GKfwvqzUpGKZi5flfiSaAqCVfFBU
	+67ArMp/MdZSdrX6GXw8qxFyJRE6YOSLQ760he5I9rKxr8cE3nBF6OYFRWaQ1xPblnDrrUD916B
	hDH0=
X-Google-Smtp-Source: AGHT+IERXdT/1rHxdfHQMtu0WaRW27EhlCa0642a2ZFdQn6l17jgLFMA7Hf4EhoGjKiVshHT2eI/Ug==
X-Received: by 2002:a05:6a21:a912:b0:232:7c7b:1c7b with SMTP id adf61e73a8af0-2327c7b1d5bmr16827947637.14.1752595391669;
        Tue, 15 Jul 2025 09:03:11 -0700 (PDT)
Received: from cleger.eu.int ([2001:41d0:420:f300::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f856fdsm12546532b3a.144.2025.07.15.09.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:03:10 -0700 (PDT)
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
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v5 0/5] riscv: add support for SBI Supervisor Software Events
Date: Tue, 15 Jul 2025 16:02:28 +0000
Message-ID: <20250715160234.454848-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_090313_221743_DDEBC685 
X-CRM114-Status: GOOD (  29.65  )
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

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf [1]

---

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
 arch/riscv/include/asm/sse.h                  |  44 ++
 arch/riscv/include/asm/switch_to.h            |  14 +
 arch/riscv/include/asm/thread_info.h          |   1 +
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/asm-offsets.c               |  12 +
 arch/riscv/kernel/sse.c                       | 146 ++++
 arch/riscv/kernel/sse_entry.S                 | 169 +++++
 drivers/firmware/Kconfig                      |   1 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/riscv/Kconfig                |  15 +
 drivers/firmware/riscv/Makefile               |   3 +
 drivers/firmware/riscv/riscv_sse.c            | 672 ++++++++++++++++++
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
 26 files changed, 1901 insertions(+), 14 deletions(-)
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


