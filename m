Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22548CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLPbwj85v90l93eEK3Le8Huyt9tCmBVKSc/s7w2usfs=; b=Mn6LWSJpwEG1ufz+4pmv+wCh1u
	b1f9WeCF3WTi1G2T95wvKVR/qJ/C6m0y0yk+CWE7k+tu0xRl0JV4iMi7pUobfeMnB9cNOvprfr5en
	Sgemi3RHEVPAfZeGO01/NpQxgZ6Sr8aGDpwGoGV3omN9e7yeNcHYn+5oHGU2RT/mN5FQQGNGMpqR9
	8a4f4fwNNMLw+8BgBwVZ/Xftx8E/e4IHdoMpxIOa7Q6L5Pv5VePqS8cKzgdM5h/BQm6yaiD+jYP6M
	tz6lltOmGyPi7/xqMr1eHhf0c8VAAgBsHCd9TS1rN6ncHbAU3zGBjim6dw1CUjdbSpVzlEv1EEGt/
	kCxSl3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCL9-0000000CyO1-16F3;
	Mon, 27 Oct 2025 01:48:07 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDCL5-0000000CyMY-3Fd3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:48:06 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-654f209c809so323859eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 18:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761529680; x=1762134480; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLPbwj85v90l93eEK3Le8Huyt9tCmBVKSc/s7w2usfs=;
        b=kcHTs/4TNlhL5BzK8W1PekvZXwsb5xr8atfwJVyVxqRwYxwlojvIBgJPOyiivjm9Kk
         IVElmteuopwTaiebELSxY+zZrrz9NEeFgaprAONYn4FPC3AzVrXygnV7yixeuNunr/uK
         im0VkngqJufkGJ4KbmhRM6AzuVn9kdIWH1CjLAA1pI9zNAZwdVoSvXenVPnLbJA5Qg2q
         z/LNnZ6qIZ9MMnIEXx8sj6fYO2OTDpVKhQhPD5MbL5AgHWZDtKs2sGWCa/u1KVDsI3xm
         tCLiJmvlDTB5EmtTujK5c3NpnVUeHpqn7s1T+K3WXNI1ciXRkAMzGFyEREzvwzByk5sj
         hP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761529680; x=1762134480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uLPbwj85v90l93eEK3Le8Huyt9tCmBVKSc/s7w2usfs=;
        b=hOZ1rJo12T/RINif9L09p+IN2asFohuyzl2ao7EA94GWeFHwJxmEdmMCuTaYyAHtde
         +c4YgvApY0me3fcUdMs9TL3qKm7/7hig/3dau8JrgUMFqgOkoQWLc3SDLBYsecZzAZsB
         yzCdIm0y4dJs1LEQEJWNhbYHRI1L7Dcmigc+jFAPidUXb0g34oVWNhe/NkXpIm+cFAcw
         9Y4dP6PzCf7rkG+tfR9PDWBjEVpArIPqxaG7vDyzaSwYtto8mOgwT/8T9wAnMIScuejC
         KXWu0WnuKBjWHj0wCKpq8g1pWF1TDjz7KUFQp3jok1cbBAC08tZ9PRVWuAq8XvmS+h9V
         4JbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIg43zXbO109FkgmxEWRDzjdkz1ivm0YpbbQAmOGiM3mmL9WrUejQ0ukZxbS5Fl66IWaTi1hI1zWKsDBaN4SXt@lists.infradead.org
X-Gm-Message-State: AOJu0YzaFGWrKy49XoVP5xRSo0KL0v4r9SyfrjgA9O3UsPDlKMOIOAtG
	mn60wUE+1/FJL/Jz7lQ2WP18pZKSZPEHy/8jQs6peR6+Z/nseb1HRFX8ePXh/3tHLyIUspBXSW0
	tejrI8tvsSJlbpT1L8oqLGVIWdMXi2cb8Vwp7bV0tRw==
X-Gm-Gg: ASbGncsXX9KyKW0N8WYhA4hsmrx52NqtVPzMPhukymR4F7jAqgDDsL39wkeUl2kxii8
	9PnyQiYCqc8SbGcuGD+4heETZ873BmqXaGfXbQj3ZjoVUsI9hHcF+zmhB7jwqVFrgL3O/4eGPuE
	m1I0AfeNULvRrtcviTgl+tAzL+HZ/ux9jiddVpgNOrNt0Ph4qNySNjT78HcQEuGbCYolOqGQVoO
	YhgK2UK9wu/yAVRZJXuNnhSWSfjX6zm1SW43Y7vmRyElvQd+Bdh1hGeqX3t0HC/aGY=
X-Google-Smtp-Source: AGHT+IG7bxA+PHV99Aw4iB0z55T1gP3l3ESJv9wNHSuFIiEE56H1vWz5R07p7Qxhtux+BEUsHU7Fn7qQblr/M8e8DV0=
X-Received: by 2002:a05:6820:80c3:b0:654:f659:3b8a with SMTP id
 006d021491bc7-654f65953afmr1755651eaf.5.1761529679819; Sun, 26 Oct 2025
 18:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250908181717.1997461-1-cleger@rivosinc.com>
In-Reply-To: <20250908181717.1997461-1-cleger@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 27 Oct 2025 09:47:48 +0800
X-Gm-Features: AWmQ_bnnLbizvhHaiJiQlgXoDyG0L8tIG5yzbvOD1RakpwNGIdqeb0Lk0rDxEkQ
Message-ID: <CAEEQ3w=6F-QHvvA-tEhM2CnYqumQfobLje--d7i61-EdK6uxZw@mail.gmail.com>
Subject: Re: [External] [PATCH v7 0/5] riscv: add support for SBI Supervisor
 Software Events
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Himanshu Chauhan <hchauhan@ventanamicro.com>, Anup Patel <apatel@ventanamicro.com>, 
	Xu Lu <luxu.kernel@bytedance.com>, Atish Patra <atishp@atishpatra.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_184803_821665_F64BE3E8 
X-CRM114-Status: GOOD (  46.39  )
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

Hi Cl=C3=A9ment,

On Tue, Sep 9, 2025 at 2:19=E2=80=AFAM Cl=C3=A9ment L=C3=A9ger <cleger@rivo=
sinc.com> wrote:
>
> The SBI Supervisor Software Events (SSE) extensions provides a mechanism
> to inject software events from an SBI implementation to supervisor
> software such that it preempts all other supervisor level traps and
> interrupts. This extension is introduced by the SBI v3.0 specification[1]=
.
>
> Various events are defined and can be send asynchronously to supervisor
> software (RAS, PMU, DEBUG, Asynchronous page fault) from SBI as well
> as platform specific events. Events can be either local (per-hart) or
> global. Events can be nested on top of each other based on priority and
> can interrupt the kernel at any time.
>
> First patch adds the SSE definitions. Second one adds support for SSE
> at arch level (entry code and stack allocations) and third one at driver
> level. Finally, the last patch add support for SSE events in the SBI PMU
> driver. Additional testing for that part is highly welcomed since there
> are a lot of possible path that needs to be exercised.
>
> Amongst the specific points that needs to be handle is the interruption
> at any point of the kernel execution and more specifically at the
> beginning of exception handling. Due to the fact that the exception entry
> implementation uses the SCRATCH CSR as both the current task struct and
> as the temporary register to switch the stack and save register, it is
> difficult to reliably get the current task struct if we get interrupted
> at this specific moment (ie, it might contain 0, the task pointer or tp).
> A fixup-like mechanism is not possible due to the nested nature of SSE
> which makes it really hard to obtain the original interruption site. In
> order to retrieve the task in a reliable manner, add an additional
> __sse_entry_task per_cpu array which stores the current task. Ideally,
> we would need to modify the way we retrieve/store the current task in
> exception handling so that it does not depend on the place where it's
> interrupted.
>
> Contrary to pseudo NMI [2], SSE does not modifies the way interrupts are
> handled and does not adds any overhead to existing code. Moreover, it
> provides "true" NMI-like interrupts which can interrupt the kernel at
> any time (even in exception handling). This is particularly crucial for
> RAS errors which needs to be handled as fast as possible to avoid any
> fault propagation.
>
> A test suite is available as a separate kselftest module. In order to
> build it, you can use the following command:
>
> $ KDIR=3D<build_dir> make O=3Dbuild TARGETS=3D"riscv/sse"-j $(($(nproc)-1=
)) -C tools/testing/selftests
>
> Then load the module using:
>
> $ sh run_sse_test.sh
>
> A KVM SBI SSE extension implementation is available at [2].
>
> Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3=
.0-rc7/riscv-sbi.pdf [1]
> Link: https://github.com/rivosinc/linux/tree/dev/cleger/sse_kvm [2]
>
> ---
>
> Changes in v7:
>  - Check return values of sse_on_each_cpu()
>  - Fix typos in commit
>  - Rename SBI_SSE_EVENT_SIGNAL to SBI_SSE_EVENT_INJECT
>  - Rename SBI_SSE_EVENT_HART_UNMASK/MASK to SBI_SSE_HART_UNMASK/MASK
>  - Add tlb flush for vmap stack to avoid taking exception during sse
>    handler upon stack access. (Alex)
>  - Move some assembly instruction to slow path
>  - Renamed sse.c to sbi_sse.c, ditto for other files
>  - Renamed RISCV_SSE to RISCV_SBI_SSE
>  - Renamed sse_event_handler to sse_event_handler_fn
>  - Put ifdef around sse_evt in PMU SBI driver
>
> Changes in v6:
>  - Fix comment in assembly argument
>  - Check hart id to be the expected one in order to skip CPU id
>    matching in sse assembly.
>
> Changes in v5:
>  - Added a SSE test module in kselftests
>  - Removed an unused variable
>  - Applied checkpatch.pl --strict and fix all errors
>  - Use scope_guard(cpus_read_lock) instead of manual cpus_read_lock()
>  - Fix wrong variable returned in sse_get_event
>  - Remove useless init of events list
>  - Remove useless empty for loop on cpus
>  - Set sse_available as  __ro_after_init
>  - Changed a few pr_debug to pr_warn
>  - Fix event enabled stated updated in case of failure
>  - Change no_lock to nolock
>  - Rename attr_buf to attr
>  - renamed sse_get_event_phys() to sse_event_get_attr_phys() and removed
>    the second argument
>  - Simplify return value in sse_event_attr_set_nolock()
>  - Remove while loop(-EINVAL) for event cpu set call
>  - Renamed interrupted_state_phys to interrupted_phys
>  - Use scoped_guards/guard for sse_mutex
>  - Remove useless struct forward declaration in sse.h
>  - Add more explanations as to why we set SIE bit in IP
>  - Unconditionnally set SIE in SIP
>  - Move SSE_STACK_SIZE adjustement in sse_stack_alloc/free()
>  - Replace move instructions with mv
>  - Rename NR_CPUS asm symbol to ASM_NR_CPUS
>  - Restore SSTATUS first in sse_entry return path so that it works for
>    double trap without any modification later.
>  - Implement proper per cpu revert if enable/register fails
>
> Changes in v4:
>  - Fix a bug when using per_cpu ptr for local event (Andrew)
>  - Add sse_event_disable/enable_local()
>  - Add pmu_disable/pmu_enable() to disable/enable SSE event
>  - Update event ID description according to the latest spec
>  - Fix comment about arguments in handle_sse()
>  - Added Himanchu as a SSE reviewer
>  - Used SYM_DATA_*() macros instead of hardcoded labels
>  - Invoke softirqs only if not returning to kernel with irqs disabled
>  - Remove invalid state check for write attribute function.
>  - Remove useless bneq statement in sse_entry.S
>
> Changes in v3:
>  - Split arch/driver support
>  - Fix potential register failure reporting
>  - Set a few pr_err as pr_debug
>  - Allow CONFIG_RISCV_SSE to be disabled
>  - Fix build without CONFIG_RISCV_SSE
>  - Remove fixup-like mechanism and use a per-cpu array
>  - Fixed SSCRATCH being corrupted when interrupting the kernel in early
>    exception path.
>  - Split SSE assembly from entry.S
>  - Add Himanchu SSE mask/unmask and runtime PM support.
>  - Disable user memory access/floating point/vector in SSE handler
>  - Rebased on master
>
> v2: https://lore.kernel.org/linux-riscv/20240112111720.2975069-1-cleger@r=
ivosinc.com/
>
> Changes in v2:
>  - Implemented specification v2
>  - Fix various error handling cases
>  - Added shadow stack support
>
> v1: https://lore.kernel.org/linux-riscv/20231026143122.279437-1-cleger@ri=
vosinc.com/
>
> Cl=C3=A9ment L=C3=A9ger (5):
>   riscv: add SBI SSE extension definitions
>   riscv: add support for SBI Supervisor Software Events extension
>   drivers: firmware: add riscv SSE support
>   perf: RISC-V: add support for SSE event
>   selftests/riscv: add SSE test module
>
>  MAINTAINERS                                   |  15 +
>  arch/riscv/include/asm/asm.h                  |  14 +-
>  arch/riscv/include/asm/sbi.h                  |  61 ++
>  arch/riscv/include/asm/scs.h                  |   7 +
>  arch/riscv/include/asm/sse.h                  |  47 ++
>  arch/riscv/include/asm/switch_to.h            |  14 +
>  arch/riscv/include/asm/thread_info.h          |   1 +
>  arch/riscv/kernel/Makefile                    |   1 +
>  arch/riscv/kernel/asm-offsets.c               |  14 +
>  arch/riscv/kernel/sbi_sse.c                   | 174 +++++
>  arch/riscv/kernel/sbi_sse_entry.S             | 178 +++++
>  drivers/firmware/Kconfig                      |   1 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/riscv/Kconfig                |  15 +
>  drivers/firmware/riscv/Makefile               |   3 +
>  drivers/firmware/riscv/riscv_sbi_sse.c        | 701 ++++++++++++++++++
>  drivers/perf/Kconfig                          |  10 +
>  drivers/perf/riscv_pmu.c                      |  23 +
>  drivers/perf/riscv_pmu_sbi.c                  |  71 +-
>  include/linux/perf/riscv_pmu.h                |   5 +
>  include/linux/riscv_sbi_sse.h                 |  57 ++
>  tools/testing/selftests/riscv/Makefile        |   2 +-
>  tools/testing/selftests/riscv/sse/Makefile    |   5 +
>  .../selftests/riscv/sse/module/Makefile       |  16 +
>  .../riscv/sse/module/riscv_sse_test.c         | 513 +++++++++++++
>  .../selftests/riscv/sse/run_sse_test.sh       |  44 ++
>  26 files changed, 1979 insertions(+), 14 deletions(-)
>  create mode 100644 arch/riscv/include/asm/sse.h
>  create mode 100644 arch/riscv/kernel/sbi_sse.c
>  create mode 100644 arch/riscv/kernel/sbi_sse_entry.S
>  create mode 100644 drivers/firmware/riscv/Kconfig
>  create mode 100644 drivers/firmware/riscv/Makefile
>  create mode 100644 drivers/firmware/riscv/riscv_sbi_sse.c

These newly added files use different GPL-xxx licenses respectively:
arch/riscv/kernel/sbi_sse.c: // SPDX-License-Identifier: GPL-2.0-or-later
drivers/firmware/riscv/riscv_sbi_sse.c: // SPDX-License-Identifier: GPL-2.0=
-only
arch/riscv/include/asm/sse.h: /* SPDX-License-Identifier: GPL-2.0-only */
Should they be consistent, or is this by design?


>  create mode 100644 include/linux/riscv_sbi_sse.h
>  create mode 100644 tools/testing/selftests/riscv/sse/Makefile
>  create mode 100644 tools/testing/selftests/riscv/sse/module/Makefile
>  create mode 100644 tools/testing/selftests/riscv/sse/module/riscv_sse_te=
st.c
>  create mode 100644 tools/testing/selftests/riscv/sse/run_sse_test.sh
>
> --
> 2.43.0
>

Thanks,
Yunhui

