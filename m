Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA5FCA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 03:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/l9Dlfnsi74I8dEn7u+jvE+D6CKgaOOzNr1dfW5F0c0=; b=1ilQGQXn+0nDTYpU2XrHiBkePw
	ghbfm7Pabnhhy/93OnZk3AWlfEB9cmv3bCaLrd1Y9WsrJyFFkBylkWMCXI9tOCKmdhPdbqf0Mamo6
	e+2oLfRLJ2+th64crXOcZGTRqm32PpWq/waDEYd/D65gv4oLTHsOUBPiIxakA1xAGqBO8iU/X4rir
	JfYCeZ90J3oJsBLPJ0AaT0XX2jIkR17AJWtaMVAgemgBGTwD8oRvGkegGj8ilDjYPQuAbDRGCbQdK
	IoZ6tJAugKaPMKkO+XXo7shpMmIt6JRNji4zKzLGykqvqQWFlGaIutmhAzDFTE9tUKdFeBQ8JAJXU
	sWWmAxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG6Hk-00000009bE3-0zt6;
	Mon, 12 Oct 2026 03:01:08 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG6Hh-00000009bDe-1pVe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 03:01:06 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-3a75f960be4so11201311fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 20:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791774063; cv=none;
        d=google.com; s=arc-20260327;
        b=BToLs9vNEL3Iv32uOCrR6nK+PIMf/zqov8u8udw5TtWYsLP/S4HKdVsX9uRyUNdXLi
         vjxC5YSDlnL+5w10fSVVcxgeoSHAgkUwKQJ6gFmnujoOwkad48Kbi6JJeVN0ItT9wXf2
         CZuMnPTlZFXddrkN6T47L1LQgGG1UkrJmUXXtrz2JtGxCER12wRSgq+NqGRk3bCfF5gy
         uWpIRR3wXiznvR3dQJQJsDfW9TQNYGTS0/qnA2hfLcMDjbjxGEjVb6m0ja0gT4jvyr1M
         NRdgLjAnnONb0mgclDmk5/ep8oyF0h/VuNczeZ011pwldmcxcA30vvylRjskL4utZgPM
         XPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/l9Dlfnsi74I8dEn7u+jvE+D6CKgaOOzNr1dfW5F0c0=;
        fh=EjRRzvAF9nAGfN+55Cj1G8QM5Eq2B0aEXQ9RJIVZBHM=;
        b=ZhkrsWJ+E3k6MyWWjMh1CuyHiXoxn8E4i+Bs9iN2syCcG/+JxGcB810eN9aXy1R4QJ
         R23iUWrBWzsDFe5dlFx+exvRywjseYb+o5OK200rePEPoDneguhH0L19JDO6rm+GQ2l+
         UI6doTz+IfIxnIS+RHlQYFb7olUGrG5nYPQHjLvEbRu5sjUdZYuhNjhG5DvYcmWDaXCg
         xCCRI4D2U5FBvO5IoFyI/h7FGN3J6Mqkq/EWs8euLbnilE/WkDkT+/TGRnZaXL2QVQm7
         p3pshflF/gZEzd/sWMiFE47OxhxyJhfQHapUC7BjDRiSO6wz3apxNFMMI5tZT4gyyj3/
         AV3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791774063; x=1792378863; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/l9Dlfnsi74I8dEn7u+jvE+D6CKgaOOzNr1dfW5F0c0=;
        b=Brv+GD/kNV3Dfk6UUiFt4L6LdV0IdJ5XW1FgYXJZN72jorY5Vnj8OSv8Wua2RsExCo
         bWm+Jcbjrhx7CHuXwpxJvsCV6c7o8E6p2hGBaFBfyZ5MQOAqrXg8Ee0LZEDAiAF/MoAm
         G/iErw0dqNZkHuz6xDKWg3iWKXyljAqBwGFGzZecl+DNzUAnlMfOU49Z1k7ZrlLNyI26
         Uh1ECwEabLXB7PfHpSqAJjkFEqr0Nj3gGRRxEq8HjX/nOzp/o5vurBce7VIuC0wfHwre
         04Uv6akbEZfwRj5ka/P6WNPFWL+7Mq0iWsJIH/LcyZbpXEft2BgrOrwljMU+md7NZjOq
         9rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791774063; x=1792378863;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/l9Dlfnsi74I8dEn7u+jvE+D6CKgaOOzNr1dfW5F0c0=;
        b=fEmBRQ7VLW5kEhjZTY36Ma1CEkLOs9oqDkyhFrIqDt/+x/KmW/RJeYetASIpiOk9SJ
         2NB1D8Z36h21JAq5eJ9j6lVpnjIB+/TfMGRx5tFoUN4ZLX9Z0OVNyuPdFxyQ8PGFB307
         NwOxtu/H1RisRQSduIPoDyotVUbWqPmYRcjVjMkZzNQ0VsxxSrlH7bVP2MC3RFEdYvYP
         tbsjl2FaxnJYfIBIzDUHZdH1RmDblXSswcbd+kiRnwsqmQ/3FbQ6gv8uOI8OSZEKOAal
         GrziGIITrffiUdJ8TOI+0qIT/4GaCmqmQO1F3s3RxiUUSNHabpY4XTelwd+kra9KyNVP
         rI/w==
X-Gm-Message-State: AFq9FYKmvfL80By9ScybLV1mZbSNhBRE4l9J5o8dXiE6muiLctLiqMpn
	HWfqm+Nw0izDnLn+0NtL0o43hINbHA0TvbJ52HMxGWth6ZROcG6Il23a3lfxwCH1Fg/h49rdXkM
	Uy2/O96OHHlRjAivB5yoBeDEzi230suM=
X-Gm-Gg: AYBFou2OmAfHCrk6oFdVr0xh7f97seG7tFXVvUuYDJk2kXcNqtKXn2E60rk+5GdIyMt
	PWLX7GH5BIzNvJMyA6Ce7AN+8XpAsqWhTJCnq7EHdQo6Rc0CyNhoTD9ARLeDhD88xsNyc6TykuG
	R6m6ULEwTVJ9j8FMvXKmGXpGBhacf4xK8ebRCZi+n7TDiRUYsEhjuALKg/zSjDjEop6443EF+7D
	pqJqsCXFLgVFfRWg37bqyted3D4ewh2tzwKVkyqYYtCzB9t/h7Me+Vni7tUcRcKfn+jxU5uB0HS
	ll3mTC4KFFWyRuEtlfbFs2Xr4lr2yATz1qcywJLjwuEYfUCVv1WF/EEQ
X-Received: by 2002:a2e:a7ca:0:b0:3a5:f982:9c86 with SMTP id
 38308e7fff4ca-3a9c53b02b6mr19996551fa.7.1791774062562; Sun, 11 Oct 2026
 20:01:02 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?5q+b5Yeh?= <tybb1992@gmail.com>
Date: Mon, 12 Oct 2026 11:00:50 +0800
X-Gm-Features: AclHuK-eieH378kOEbAGG9Bn7i0MrQcV4oQQLLDgF0NPECp-r9V-wZ7RXLe471Q
Message-ID: <CACVv+F25oZ3J6-NTT+MVGxrtj=3h=zruOP0onB6Nafq7SdC6Ag@mail.gmail.com>
Subject: [BUG] arm64: PTRACE_SINGLESTEP ignored after perf HW_BREAKPOINT_X trap
To: catalin.marinas@arm.com, will@kernel.org, will.deacon@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_200105_688412_806637DA 
X-CRM114-Status: GOOD (  22.27  )
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

Hi Catalin, Will,

I'd like to confirm whether the following arm64 behaviour is expected.

After a perf hardware instruction breakpoint (PERF_TYPE_BREAKPOINT /
HW_BREAKPOINT_X) traps and is disabled, a PTRACE_SINGLESTEP issued
immediately afterwards is not honored: the tracee runs to completion,
as if PTRACE_CONT had been used.  The same single step works when the
breakpoint was armed directly through ptrace (NT_ARM_HW_BREAK).  On
x86_64 both paths single-step correctly.

This came up while investigating rr's (the debugger) async-signal replay:
in JIT memory it runs past the recorded point and hits an unrecorded SIGBUS,
and the recovery path arms a perf instruction breakpoint and then
issues one PTRACE_SINGLESTEP to step over the target instruction.
On arm64 that step is swallowed.

Environment:

  Linux ubu-aarch64 7.0.0-34-generic #34~24.04.1 SMP PREEMPT_DYNAMIC
Fri Sep 25 20:07:36 CST 2026 aarch64 aarch64 aarch64 GNU/Linux
  perf setup: perf_event_open with PERF_TYPE_BREAKPOINT, bp_type
              HW_BREAKPOINT_X, bp_len = sizeof(long), precise_ip = 0
              (0 is what this kernel accepted; see transcript)
  ptrace setup: PTRACE_SETREGSET NT_ARM_HW_BREAK, one dbg_reg slot with
              ctrl = 0x1FE5 (EL0 execution breakpoint)

Minimal reproducer: pure C, attached below.  It forks a fresh tracee
per case, arms a breakpoint on the first instruction of step_target(),
waits for the SIGTRAP stop with PC == target, disables the breakpoint,
issues exactly one PTRACE_SINGLESTEP, and checks whether the tracee
stopped just past the target or ran the whole tiny loop to completion.

Result on arm64:

  platform=aarch64  target=0xaaaab4150c14 (&step_target)  iterations=8

  Case A: stop via perf hardware breakpoint (HW_BREAKPOINT_X),
          then PTRACE_SINGLESTEP
    [info] perf_event_open ok with precise_ip=0
    breakpoint hit: SIGTRAP at 0xaaaab4150c14
    [info] tracee exited with code 0 during 'single step'
    case A (perf)  SWALLOWED: tracee ran the whole loop and EXITED --
                   PTRACE_SINGLESTEP behaved like PTRACE_CONT

  Case B: stop via ptrace-native hardware breakpoint,
          then PTRACE_SINGLESTEP
    breakpoint hit: SIGTRAP at 0xaaaab4150c14
    case B (ptrace)  clean single step: SIGTRAP just past the breakpoint

  VERDICT: reproduced on aarch64: after a perf HW_BREAKPOINT_X stop,
  PTRACE_SINGLESTEP is ignored (the tracee runs to completion); the
  ptrace-native path single-steps correctly.  The failure is specific
  to the perf breakpoint path, not to single-stepping itself.



Result on x86_64 (same program, real hardware):
Linux ubu-X99 7.0.0-31-generic #31~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC
Mon Aug 10 09:38:02 UTC 2026 x86_64 x86_64 x86_64 GNU/Linux
platform=x86_64  target=0x5e6af7af1129 (&step_target)  iterations=8


Case A: stop via perf hardware breakpoint (HW_BREAKPOINT_X), then
PTRACE_SINGLESTEP
  [info] perf_event_open ok with precise_ip=0
  breakpoint hit: SIGTRAP at 0x5e6af7af1129
  case A (perf)  clean single step: SIGTRAP just past the breakpoint

Case B: stop via ptrace-native hardware breakpoint, then PTRACE_SINGLESTEP
  breakpoint hit: SIGTRAP at 0x5e6af7af1129
  case B (ptrace) clean single step: SIGTRAP just past the breakpoint

VERDICT: both cases clean on x86_64: no anomaly observed.

So: same hardware debug exception, same single step, different outcome
depending on whether the breakpoint was armed via perf or via ptrace,
and only on arm64.

Questions:

1. Is this expected behaviour on arm64, or a kernel bug in the perf
   breakpoint path?

2. If it is a kernel quirk, what is the recommended way to fast-forward
   over a breakpointed instruction on arm64 so that one step retires
   exactly one instruction?

3. Is there anything wrong with the reproducer itself?  In particular,
   is disabling the perf event with PERF_EVENT_IOC_DISABLE before
   PTRACE_SINGLESTEP the correct sequence, or does the perf breakpoint
   need to be torn down differently on arm64?

One possibly related observation: while writing this, I found that if
PTRACE_SETREGSET(NT_ARM_HW_BREAK) is called with an iov_len covering all
16 slots of struct user_hwdebug_state, the kernel returns ENOSPC even
though only slot 0 carries a valid ctrl.  Shrinking iov_len to
dbg_info + one slot makes it succeed.  I mention it in case it is a
symptom of the same per-CPU slot bookkeeping.

Reproducer (build with: gcc -O0 -g -fno-plt -o repro repro.c):

/*
 * perf_vs_ptrace_step_min.c -- one kernel question, two stop paths.
 *
 * After a tracee is stopped on a HARDWARE INSTRUCTION BREAKPOINT, does the
 * kernel honor a PTRACE_SINGLESTEP issued immediately afterwards?
 *
 * Case A (perf path, used by rr):
 *   perf event PERF_TYPE_BREAKPOINT / HW_BREAKPOINT_X, hit delivered as an
 *   async SIGTRAP.  Then PERF_EVENT_IOC_DISABLE and PTRACE_SINGLESTEP.
 *
 * Case B (plain ptrace path):
 *   same cpu debug registers programmed directly with ptrace --
 *   aarch64 PTRACE_SETREGSET NT_ARM_HW_BREAK, x86_64 DR0/DR7 via
 *   PTRACE_POKEUSER; synchronous SIGTRAP, no perf involvement.  Then clear
 *   the breakpoint and PTRACE_SINGLESTEP.
 *
 * Observed: aarch64 7.0.0-3x -> Case A swallowed, Case B clean;
 *           x86_64  7.0.0-31 -> both clean.
 *
 * Build:
 *   gcc -O0 -g -fno-plt -o perf_vs_ptrace_step_min perf_vs_ptrace_step_min.c
 *   ./perf_vs_ptrace_step_min [iterations] (default 8)
 *
 * Exit code: 0 both clean, 1 Case A broken, 2 Case B broken,
 *            3 environment/setup error.
 */
#define _GNU_SOURCE

#include <errno.h>
#include <fcntl.h>
#include <linux/elf.h>
#include <linux/hw_breakpoint.h>
#include <linux/perf_event.h>
#include <sched.h>
#include <signal.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/ptrace.h>
#include <sys/syscall.h>
#include <sys/uio.h>
#include <sys/wait.h>
#include <unistd.h>

/* -------------------------------------------------------------------- */
/* Per-arch bits.                                                       */
/* -------------------------------------------------------------------- */

#if defined(__aarch64__)

typedef struct {
  uint64_t regs[31];
  uint64_t sp;
  uint64_t pc;
  uint64_t pstate;
} user_regs_t;

#define PLATFORM_NAME "aarch64"
#define REG_PC(regs) ((regs).pc)
/* rr uses precise_ip=3 on arm64; we try 0..3 and log which the kernel takes. */
#define PRECISE_IP_DEFAULT 0
#define STEP_PAST_TARGET(regs, target) ((REG_PC(regs)) ==
(uint64_t)(target) + 4)

#elif defined(__x86_64__)

#include <sys/user.h>
typedef struct user_regs_struct user_regs_t;

#define PLATFORM_NAME "x86_64"
#define REG_PC(regs) ((regs).rip)
#define PRECISE_IP_DEFAULT 0
#define STEP_PAST_TARGET(regs, target) ((REG_PC(regs)) > (uint64_t)(target))

#else
#error "this reproducer supports aarch64 and x86_64 only"
#endif

/* -------------------------------------------------------------------- */
/* Traced workload.                                                     */
/* -------------------------------------------------------------------- */

static volatile unsigned long g_step_sink;

__attribute__((noinline))
static void step_target(void) {
  g_step_sink++;
}

static void run_loop(long iterations) {
  while (iterations-- > 0) {
    step_target();
  }
}

/* -------------------------------------------------------------------- */
/* Shared tracee plumbing.                                              */
/* -------------------------------------------------------------------- */

typedef enum {
  CASE_PERF = 0,
  CASE_PTRACE = 1,
} test_case_t;

typedef enum {
  STEP_CLEAN = 0,   /* SIGTRAP stop just past the breakpoint */
  STEP_SWALLOWED,   /* step degraded to CONT: tracee ran on / exited */
  STEP_BROKEN,      /* stopped, but not the expected clean SIGTRAP */
  SETUP_ERROR,      /* could not set up / drive the tracee */
} test_result_t;

static pid_t fork_tracee(long iterations) {
  pid_t child = fork();
  if (child == 0) {
    if (ptrace(PTRACE_TRACEME, 0, 0, 0) < 0) {
      _exit(2);
    }
    raise(SIGSTOP);
    run_loop(iterations);
    _exit(0);
  }
  return child;
}

static int read_registers(pid_t pid, user_regs_t *regs) {
  struct iovec iov = {.iov_base = regs, .iov_len = sizeof(*regs)};
  if (ptrace(PTRACE_GETREGSET, pid, (void *)NT_PRSTATUS, &iov) < 0) {
    fprintf(stderr, "  [setup] PTRACE_GETREGSET(NT_PRSTATUS): %s\n",
            strerror(errno));
    return -1;
  }
  return 0;
}

static int wait_for_initial_stop(pid_t pid) {
  int status;
  if (waitpid(pid, &status, 0) < 0) {
    fprintf(stderr, "  [setup] waitpid initial: %s\n", strerror(errno));
    return -1;
  }
  if (!(WIFSTOPPED(status) && WSTOPSIG(status) == SIGSTOP)) {
    fprintf(stderr, "  [setup] unexpected initial stop, status 0x%x\n", status);
    return -1;
  }
  return 0;
}

static bool wait_breakpoint_stop(pid_t pid, uint64_t target) {
  int status;
  user_regs_t regs;

  if (ptrace(PTRACE_CONT, pid, 0, 0) < 0) {
    fprintf(stderr, "  [setup] PTRACE_CONT: %s\n", strerror(errno));
    return false;
  }
  if (waitpid(pid, &status, 0) < 0) {
    fprintf(stderr, "  [setup] waitpid bp: %s\n", strerror(errno));
    return false;
  }
  if (!WIFSTOPPED(status) || WSTOPSIG(status) != SIGTRAP) {
    fprintf(stderr, "  [setup] breakpoint stop failed, status 0x%x%s\n",
            status, WIFEXITED(status) ? " (tracee EXITED)" : "");
    return false;
  }
  if (read_registers(pid, &regs) < 0) {
    return false;
  }
  if (REG_PC(regs) != target) {
    fprintf(stderr, "  [setup] stopped at %#llx (want %#llx)\n",
            (unsigned long long)REG_PC(regs), (unsigned long long)target);
    return false;
  }
  return true;
}

static test_result_t single_step_and_classify(pid_t pid, uint64_t target) {
  int status;
  user_regs_t regs;

  if (ptrace(PTRACE_SINGLESTEP, pid, 0, 0) < 0) {
    fprintf(stderr, "  [setup] PTRACE_SINGLESTEP: %s\n", strerror(errno));
    return SETUP_ERROR;
  }
  if (waitpid(pid, &status, 0) < 0) {
    fprintf(stderr, "  [setup] waitpid step: %s\n", strerror(errno));
    return SETUP_ERROR;
  }

  if (WIFEXITED(status)) {
    fprintf(stderr, "  [info] tracee exited with code %d during
'single step'\n",
            WEXITSTATUS(status));
    return STEP_SWALLOWED;
  }
  if (WIFSIGNALED(status)) {
    fprintf(stderr, "  [info] tracee killed by signal %d during
'single step'\n",
            WTERMSIG(status));
    return STEP_BROKEN;
  }
  if (!WIFSTOPPED(status)) {
    return STEP_BROKEN;
  }

  if (read_registers(pid, &regs) < 0) {
    return SETUP_ERROR;
  }
  if (WSTOPSIG(status) == SIGTRAP && STEP_PAST_TARGET(regs, target)) {
    return STEP_CLEAN;
  }
  fprintf(stderr, "  [info] step stopped with sig %d pc=%#llx (want
pc=%#llx)\n",
          WSTOPSIG(status), (unsigned long long)REG_PC(regs),
          (unsigned long long)target);
  return STEP_BROKEN;
}

/* -------------------------------------------------------------------- */
/* Case A: perf hardware instruction breakpoint.                        */
/* -------------------------------------------------------------------- */

/* Try precise_ip 0..3 and log every failure, so the transcript shows what
 * the kernel actually accepts on this machine. */
static int create_perf_breakpoint(pid_t pid, uint64_t target, int
*used_precise) {
  static const int precise_candidates[] = {PRECISE_IP_DEFAULT, 1, 2, 3};
  struct perf_event_attr attr;
  int fd;

  for (size_t i = 0;
       i < sizeof(precise_candidates) / sizeof(precise_candidates[0]); i++) {
    int precise = precise_candidates[i];
    memset(&attr, 0, sizeof(attr));
    attr.type = PERF_TYPE_BREAKPOINT;
    attr.size = sizeof(attr);
    attr.bp_type = HW_BREAKPOINT_X;
    attr.bp_len = sizeof(long);
    attr.sample_period = 1;
    attr.sample_type = PERF_SAMPLE_IP;
    attr.pinned = 1;
    attr.exclude_kernel = 1;
    attr.exclude_hv = 1;
    attr.wakeup_events = 1;
    attr.precise_ip = precise;
    attr.bp_addr = target;
    attr.disabled = 0;

    fd = syscall(__NR_perf_event_open, &attr, pid, -1, -1,
                 PERF_FLAG_FD_CLOEXEC);
    if (fd >= 0) {
      *used_precise = precise;
      return fd;
    }
    fprintf(stderr, "  [setup] perf_event_open(precise_ip=%d): %s\n",
            precise, strerror(errno));
  }
  return -1;
}

static int arm_perf_breakpoint(pid_t pid, uint64_t target, int *perf_fd) {
  int used_precise = -1;
  int fd = create_perf_breakpoint(pid, target, &used_precise);
  if (fd < 0) {
    return -1;
  }

  struct f_owner_ex owner = {.type = F_OWNER_TID, .pid = pid};
  if (fcntl(fd, F_SETOWN_EX, &owner) < 0) {
    fprintf(stderr, "  [setup] fcntl(F_SETOWN_EX): %s\n", strerror(errno));
    close(fd);
    return -1;
  }
  if (fcntl(fd, F_SETFL, O_ASYNC) < 0) {
    fprintf(stderr, "  [setup] fcntl(F_SETFL, O_ASYNC): %s\n", strerror(errno));
    close(fd);
    return -1;
  }
  if (fcntl(fd, F_SETSIG, SIGTRAP) < 0) {
    fprintf(stderr, "  [setup] fcntl(F_SETSIG, SIGTRAP): %s\n",
strerror(errno));
    close(fd);
    return -1;
  }
  if (ioctl(fd, PERF_EVENT_IOC_ENABLE, 0) < 0) {
    fprintf(stderr, "  [setup] PERF_EVENT_IOC_ENABLE: %s\n", strerror(errno));
    close(fd);
    return -1;
  }

  printf("  [info] perf_event_open ok with precise_ip=%d\n", used_precise);
  *perf_fd = fd;
  return 0;
}

/* -------------------------------------------------------------------- */
/* Case B: ptrace-native hardware breakpoint.                           */
/* -------------------------------------------------------------------- */

#if defined(__aarch64__)

typedef struct {
  uint64_t addr;
  uint32_t ctrl;
  uint32_t pad;
} hw_bp_reg_t;

typedef struct {
  uint32_t dbg_info;
  uint32_t pad;
  hw_bp_reg_t dbg_regs[16];
} hw_debug_state_t;

#define AARCH64_EXEC_BP_CTRL 0x1FE5u
#define AARCH64_DEBUG_REG_MAX 16

/* Arm an EL0 execution breakpoint via PTRACE_SETREGSET(NT_ARM_HW_BREAK).
 * iov_len covers dbg_info + exactly one slot: asking for all 16 slots makes
 * the kernel try to reserve every slot and fail with ENOSPC on cores with
 * fewer hardware breakpoints.  Per-CPU slot bookkeeping means a usable CPU
 * must be picked, so retry across CPUs. */
static int set_native_breakpoint(pid_t pid, uint64_t target) {
  hw_debug_state_t state;
  memset(&state, 0, sizeof(state));
  state.dbg_regs[0].addr = target;
  state.dbg_regs[0].ctrl = AARCH64_EXEC_BP_CTRL;

  struct iovec iov = {
      .iov_base = &state,
      .iov_len = offsetof(hw_debug_state_t, dbg_regs) +
                 sizeof(state.dbg_regs[0]),
  };

  for (int cpu = 0; cpu < AARCH64_DEBUG_REG_MAX; cpu++) {
    cpu_set_t set;
    CPU_ZERO(&set);
    CPU_SET(cpu, &set);
    if (sched_setaffinity(0, sizeof(set), &set) < 0) {
      continue;
    }
    if (ptrace(PTRACE_SETREGSET, pid, (void *)NT_ARM_HW_BREAK, &iov) == 0) {
      return 0;
    }
    fprintf(stderr, "  [setup] NT_ARM_HW_BREAK on cpu %d: %s\n",
            cpu, strerror(errno));
  }
  return -1;
}

static void clear_native_breakpoint(pid_t pid) {
  hw_debug_state_t zero;
  memset(&zero, 0, sizeof(zero));
  struct iovec iov = {
      .iov_base = &zero,
      .iov_len = offsetof(hw_debug_state_t, dbg_regs) +
                 sizeof(zero.dbg_regs[0]),
  };
  if (ptrace(PTRACE_SETREGSET, pid, (void *)NT_ARM_HW_BREAK, &iov) < 0) {
    fprintf(stderr, "  [setup] clear NT_ARM_HW_BREAK: %s\n", strerror(errno));
  }
}

#elif defined(__x86_64__)

static int set_native_breakpoint(pid_t pid, uint64_t target) {
  if (ptrace(PTRACE_POKEUSER, pid,
             offsetof(struct user, u_debugreg[0]), target) < 0) {
    fprintf(stderr, "  [setup] POKEUSER DR0: %s\n", strerror(errno));
    return -1;
  }
  if (ptrace(PTRACE_POKEUSER, pid,
             offsetof(struct user, u_debugreg[7]), 0x1) < 0) {
    fprintf(stderr, "  [setup] POKEUSER DR7: %s\n", strerror(errno));
    return -1;
  }
  return 0;
}

static void clear_native_breakpoint(pid_t pid) {
  ptrace(PTRACE_POKEUSER, pid, offsetof(struct user, u_debugreg[7]), 0);
  ptrace(PTRACE_POKEUSER, pid, offsetof(struct user, u_debugreg[0]), 0);
}

#endif

/* -------------------------------------------------------------------- */
/* Per-case driver: arm -> hit -> disable/clear -> one step -> classify */
/* -------------------------------------------------------------------- */

static test_result_t run_one_case(test_case_t which, long iterations,
                                  uint64_t target) {
  pid_t child = fork_tracee(iterations);
  if (child < 0) {
    fprintf(stderr, "  [setup] fork: %s\n", strerror(errno));
    return SETUP_ERROR;
  }

  int perf_fd = -1;
  if (wait_for_initial_stop(child) < 0) {
    kill(child, SIGKILL);
    waitpid(child, NULL, 0);
    return SETUP_ERROR;
  }

  if (which == CASE_PERF) {
    if (arm_perf_breakpoint(child, target, &perf_fd) < 0) {
      kill(child, SIGKILL);
      waitpid(child, NULL, 0);
      return SETUP_ERROR;
    }
  } else {
    if (set_native_breakpoint(child, target) < 0) {
      kill(child, SIGKILL);
      waitpid(child, NULL, 0);
      return SETUP_ERROR;
    }
  }

  if (!wait_breakpoint_stop(child, target)) {
    kill(child, SIGKILL);
    waitpid(child, NULL, 0);
    return SETUP_ERROR;
  }
  printf("  breakpoint hit: SIGTRAP at %#llx\n", (unsigned long long)target);

  if (which == CASE_PERF) {
    if (ioctl(perf_fd, PERF_EVENT_IOC_DISABLE, 0) < 0) {
      fprintf(stderr, "  [setup] PERF_EVENT_IOC_DISABLE: %s\n",
strerror(errno));
    }
    close(perf_fd);
  } else {
    clear_native_breakpoint(child);
  }

  test_result_t result = single_step_and_classify(child, target);

  kill(child, SIGKILL);
  waitpid(child, NULL, 0);
  return result;
}

/* -------------------------------------------------------------------- */
/* Output helpers and main.                                             */
/* -------------------------------------------------------------------- */

static void print_result(const char *label, test_result_t result) {
  const char *text;
  switch (result) {
    case STEP_CLEAN:
      text = "clean single step: SIGTRAP just past the breakpoint";
      break;
    case STEP_SWALLOWED:
      text = "SWALLOWED: tracee ran the whole loop and EXITED -- "
             "PTRACE_SINGLESTEP behaved like PTRACE_CONT";
      break;
    case STEP_BROKEN:
      text = "BROKEN: unexpected stop after the single step";
      break;
    default:
      text = "SETUP ERROR: see the errors above";
      break;
  }
  printf("  %-14s %s\n", label, text);
}

/* Verdict is written to be pasted into a bug report verbatim: it states
 * what was observed, without over-claiming on incomplete data. */
static void print_verdict(test_result_t a, test_result_t b,
                          const char *platform) {
  printf("\nVERDICT: ");
  if (a == SETUP_ERROR || b == SETUP_ERROR) {
    printf("inconclusive on this run -- at least one case could not be "
           "set up (see the [setup] lines above); no conclusion drawn.\n");
  } else if (a == STEP_SWALLOWED && b == STEP_CLEAN) {
    printf("reproduced on %s: after a perf HW_BREAKPOINT_X stop, "
           "PTRACE_SINGLESTEP is ignored (the tracee runs to completion); "
           "the ptrace-native path single-steps correctly.  The failure is "
           "specific to the perf breakpoint path, not to single-stepping "
           "itself.\n", platform);
  } else if (b == STEP_SWALLOWED || b == STEP_BROKEN) {
    printf("unexpected on %s: the ptrace-native path also fails to "
           "single-step; the perf-vs-ptrace distinction does not hold.\n",
           platform);
  } else if (a == STEP_CLEAN && b == STEP_CLEAN) {
    printf("both cases clean on %s: no anomaly observed.\n", platform);
  } else {
    printf("no clean comparison on %s (case A=%d, case B=%d); rerun and "
           "inspect the [setup]/[info] lines above.\n", platform, a, b);
  }
}

int main(int argc, char **argv) {
  long iterations = argc > 1 ? atol(argv[1]) : 8;
  uint64_t target = (uint64_t)(uintptr_t)&step_target;

  printf("platform=%s  target=%#llx (&step_target)  iterations=%ld\n\n",
         PLATFORM_NAME, (unsigned long long)target, iterations);

  printf("Case A: stop via perf hardware breakpoint (HW_BREAKPOINT_X), "
         "then PTRACE_SINGLESTEP\n");
  test_result_t result_a = run_one_case(CASE_PERF, iterations, target);
  print_result("case A (perf)", result_a);

  printf("\nCase B: stop via ptrace-native hardware breakpoint, "
         "then PTRACE_SINGLESTEP\n");
  test_result_t result_b = run_one_case(CASE_PTRACE, iterations, target);
  print_result("case B (ptrace)", result_b);

  print_verdict(result_a, result_b, PLATFORM_NAME);

  if (result_a == STEP_SWALLOWED || result_a == STEP_BROKEN) return 1;
  if (result_b == STEP_SWALLOWED || result_b == STEP_BROKEN) return 2;
  if (result_a == SETUP_ERROR || result_b == SETUP_ERROR) return 3;
  return 0;
}


Thanks a lot for any advice.

