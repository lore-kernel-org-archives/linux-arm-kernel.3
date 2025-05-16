Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26DDC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 13:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gFjcNM1DqPRHLRj8Hg0Ysyr3OR4VV1DA42g230FdsY4=; b=D2Cr/whRijayNH5c+/wfKQ3se8
	YpyZAmZ7rzdzCm7Dd3L5tBPLIgXnNs25uroqAS5k84Cp9xyx9blneLMhn8+/LILbF9YAMGNzalkZ2
	vmZu+YjB1S9LoG99h87Kxo96ZooKhopvIida2pKxJuERHPH4Lgl1CGUYMWU34G6nyVPu/aSDxfJjF
	hHZNUlAMDPzMAKcGECjgyY6eh72ySlgqrLVmH2N1e5HsBgL199Gw1zKEWzAPDVzT8OGhEcTIBq5US
	0xLYgK/cIGUXHDGsmptpI5biKELPEOQc1TDw3V55iycppScvbMOxYxl6rMKCB2ovorvOBIgt6VagP
	FcGnkAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvKl-00000003YG8-1bjJ;
	Fri, 16 May 2025 13:42:43 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvIi-00000003XkZ-3TNk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:40:38 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso16834005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402834; x=1748007634; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gFjcNM1DqPRHLRj8Hg0Ysyr3OR4VV1DA42g230FdsY4=;
        b=eoZ6nnfN06rfFReNujtDDUMZ3OuzVO7Q+/KF5GjkZRQ+YefRaOm43nxCHDifrauiKJ
         PVwPros4o3D6ITeBLMXRyjDdv5HdVmELXkQzmFsYyrrshElfTv/qbSMK7+cVxEzhblei
         2M/SHZ3nEmGK0br7JLixlu3hDXOr/z9U6BRMlUYB0EXU4WxWztKUO5hbmbwEZZfN0CoG
         xBtO+bcGvXOTIrTaVrP07QzcUALcWDN3B/RawOpe3dZmYNT4rEhNafBv4a4slCgCUzI3
         6khi7g//zpdSDKcOV3GuoHBVsypJ3BUW6MC0iw/hFJ5tqKbr8GceaLkdDBQldzx72H1h
         R74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402834; x=1748007634;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFjcNM1DqPRHLRj8Hg0Ysyr3OR4VV1DA42g230FdsY4=;
        b=u/o9TybJ0HAokMvq+bsc5aeKvjnLAvu47EKfhtB1vD5wtIq8vaWutINXOmr2O6GzdH
         L/Ez/olt/S1uU5xNYIonDs1ehWVz15c/Kqtt8qoDCnhlYcpvzja2ig2KS40MN5xFKK+n
         jsLoKX7dXBgmy3doJDIlwf1YqldgZCFPTB2eIr1oCGn7yjqfzxHct24/JkvWrpVJxAO4
         sMeNu4WPUdMlmfVpoRzE+1b8cv0m9IpsOGnEG/EKl9yGAW5FwPuLWB1n3LXPvK+rzeXS
         R1qoxsyjACIj2bSCpfEoRDodUwrJjuQ7pc36BpZSCiztJc9ji0V6uy0S29gUd8AzsyoF
         lGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB2lWAsuuSRsyWKAkusvocUG9zlwZuTQZigEOT+cUIuQW4v793nSwRjinPbIuT9NUKton9H1ifqTw49Xv0zVAv@lists.infradead.org
X-Gm-Message-State: AOJu0YzqnkwCWU93NqRKYzbN6WoaCrXVvJmEsBXmgDUFJoI3Wha40oIs
	cTfyqP0w4L7/3SQttbZELa8po43ePSgLhcEHJY33Lfxp/CwV/uO1Nvo56X8Z5Zc7BH2rMGbi9cc
	h+bnh3diLN9CpzV0E4pYqRQ==
X-Google-Smtp-Source: AGHT+IHOKmBEIjaF1gEAYGHczeF9IZs3iniqD/QvCRyWO8xSETKFmOAwCrapzHq+30c40/xw6PcyEuC1a3udRwBW
X-Received: from wmbfj9.prod.google.com ([2002:a05:600c:c89:b0:43c:fd72:aae1])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec6:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442fd950bd4mr33356585e9.11.1747402834643;
 Fri, 16 May 2025 06:40:34 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:06 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-1-vdonnefort@google.com>
Subject: [PATCH v5 00/25] Tracefs support for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_064036_869500_9E6D5109 
X-CRM114-Status: GOOD (  31.18  )
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

The growing set of features supported by the hypervisor in protected
mode necessitates debugging and profiling tools. Tracefs is the
ideal candidate for this task:

  * It is simple to use and to script.

  * It is supported by various tools, from the trace-cmd CLI to the
    Android web-based perfetto.

  * The ring-buffer, where are stored trace events consists of linked
    pages, making it an ideal structure for sharing between kernel and
    hypervisor.

This series first introduces a new generic way of creating remote events and
remote buffers. Then it adds support to the pKVM hypervisor.

1. ring-buffer
--------------

To setup the per-cpu ring-buffers, a new interface is created:

  ring_buffer_remote:	Describes what the kernel needs to know about the
			remote writer, that is, the set of pages forming the
			ring-buffer and a callback for the reader/head
			swapping (enables consuming read)

  ring_buffer_remote():	Creates a read-only ring-buffer from a
			ring_buffer_remote.

To keep the internals of `struct ring_buffer` in sync with the remote,
the meta-page is used. It was originally introduced to enable user-space
mapping of the ring-buffer [1]. In this case, the kernel is not the
producer anymore but the reader. The function to read that meta-page is:

  ring_buffer_poll_remote():
			Update `struct ring_buffer` based on the remote
			meta-page. Wake-up readers if necessary.

The kernel has to poll the meta-page to be notified of newly written
events.

2. Tracefs
----------

This series introduce a new trace_remote that does the link between
tracefs and the remote ring-buffer.

The interface is found in the remotes/ directory at the root of the
tracefs mount point. Each remote is like an instance and you'll find
there a subset of the regular Tracefs user-space interface:

  remotes/test/
     buffer_size_kb
     trace_clock
     trace_pipe
     trace
     per_cpu/
             cpuX/
                 trace
                 trace_pipe
     events/

            test/
                selftest/
                          enable
                          id

Behind the scenes, kernel/trace/trace_remote.c creates this tracefs
hierarchy without relying on kernel/trace/trace.c. This is due to
fundamental differences:

  * Remote tracing doesn't support trace_array's system-specific
    features (snapshots, tracers, etc.).

  * Logged event formats differ (e.g., no PID for remote events).

  * Buffer operations require specific remote interactions.

3. Simple Ring-Buffer
---------------------

As the current ring-buffer.c implementation has too many dependencies to
be used directly by the pKVM hypervisor. A new simple implementation is
created and can be found in kernel/trace/simple-ring-buffer.c.

This implementation is write-only and is used by both the pKVM
hypervisor and a trace_remote test module.

4. Events
---------

A new REMOTE_EVENT() macro is added to simplify the creation of events
on the kernel side. As remote tracing buffer are read only, only the
event structure and a way of printing must be declared. The prototype of
the macro is very similar to the well-known TRACE_EVENT()

 REMOTE_EVENT(my_event, id,
     RE_STRUCT(
         re_field(u64, foobar)
     ),
     RE_PRINTK("foobar=%lld", __entry->foobar)
     )
  )

5. pKVM
-------

The pKVM support simply creates a "hypervisor" trace_remote on the
kernel side and inherits from simple-ring-buffer.c on the hypervisor
side.

A new event macro is created HYP_EVENT() that is under the hood re-using
REMOTE_EVENT() (defined in the previous paragaph) as well as generate
hypervisor specific struct and trace_<event>() functions.

5. Limitations:
---------------

Non-consuming reading of the buffer isn't supported (i.e. cat trace ->
-EPERM) due to current the lack of support in the ring-buffer meta-page.

[1] https://tracingsummit.org/ts/2022/hypervisortracing/
[2] https://lore.kernel.org/all/20240510140435.3550353-1-vdonnefort@google.com/

Changes since v4 (https://lore.kernel.org/all/20250506164820.515876-1-vdonnefort@google.com/)

  - Extend meta-page with pages_touched and pages_lost
  - Create ring_buffer_types.h
  - Fix simple_ring_buffer build for 32-bits arch and x86
  - Try unload buffer on reset (+ test)
  - Minor renaming and comments

Changes since v3 (https://lore.kernel.org/all/20250224121353.98697-1-vdonnefort@google.com/)

  - Move tracefs support from kvm/hyp_trace.c into a generic trace_remote.c.
  - Move ring-buffer implementation from nvhe/trace.c into  a generic
    simple-ring-buffer.c
  - Rebase on 6.15-rc4.

Changes since v2 (https://lore.kernel.org/all/20250108114536.627715-1-vdonnefort@google.com/)

  - Fix ring-buffer remote reset
  - Fix fast-forward in rb_page_desc()
  - Refactor nvhe/trace.c
  - struct hyp_buffer_page more compact
  - Add a struct_len to trace_page_desc
  - Extend reset testing
  - Rebase on 6.14-rc3

Changes since v1 (https://lore.kernel.org/all/20240911093029.3279154-1-vdonnefort@google.com/)

  - Add 128-bits mult fallback in the unlikely event of an overflow. (John)
  - Fix ELF section sort.
  - __always_inline trace_* event macros.
  - Fix events/<event>/enable permissions.
  - Rename ring-buffer "writer" to "remote".
  - Rename CONFIG_PROTECTED_NVHE_TESTING to PKVM_SELFTEST to align with
    Quentin's upcoming selftest
  - Rebase on 6.13-rc3.

Changes since RFC (https://lore.kernel.org/all/20240805173234.3542917-1-vdonnefort@google.com/)

  - hypervisor trace clock:
     - mult/shift computed in hyp_trace.c. (John)
     - Update clock when it deviates from kernel boot clock. (John)
     - Add trace_clock file.
     - Separate patch for better readability.
  - Add a proper reset interface which does not need to teardown the
    tracing buffers. (Steven)
  - Return -EPERM on trace access. (Steven)
  - Add per-cpu trace file.
  - Automatically teardown and free the tracing buffer when it is empty,
    without readers and not currently tracing.
  - Show in buffer_size_kb if the buffer is loaded in the hypervisor or
    not.
  - Extend tests to cover reset and unload.
  - CC timekeeping folks on relevant patches (Marc)

David Brazdil (1):
  KVM: arm64: Add .hyp.data section

Vincent Donnefort (24):
  ring-buffer: Add page statistics to the meta-page
  ring-buffer: Introduce ring-buffer remotes
  tracing: Introduce trace remotes
  tracing: Add reset to trace remotes
  tracing: Add init callback to trace remotes
  tracing: Add events to trace remotes
  tracing: Add events/ root files to trace remotes
  tracing: Add helpers to create trace remote events
  ring-buffer: Export buffer_data_page and macros
  tracing: Introduce simple_ring_buffer
  tracing: Add a trace remote module for testing
  tracing: selftests: Add trace remote tests
  tracing: load/unload page callbacks for simple_ring_buffer
  tracing: Check for undefined symbols in simple_ring_buffer
  KVM: arm64: Support unaligned fixmap in the pKVM hyp
  KVM: arm64: Add clock support for the pKVM hyp
  KVM: arm64: Add tracing capability for the pKVM hyp
  KVM: arm64: Add trace remote for the pKVM hyp
  KVM: arm64: Sync boot clock with the pKVM hyp
  KVM: arm64: Add trace reset to the pKVM hyp
  KVM: arm64: Add event support to the pKVM hyp and trace remote
  KVM: arm64: Add hyp_enter/hyp_exit events to pKVM hyp
  KVM: arm64: Add selftest event support to pKVM hyp
  tracing: selftests: Add pKVM trace remote tests

 arch/arm64/include/asm/kvm_asm.h              |   8 +
 arch/arm64/include/asm/kvm_define_hypevents.h |  21 +
 arch/arm64/include/asm/kvm_hyp.h              |   1 -
 arch/arm64/include/asm/kvm_hypevents.h        |  41 +
 arch/arm64/include/asm/kvm_hyptrace.h         |  26 +
 arch/arm64/include/asm/sections.h             |   1 +
 arch/arm64/kernel/image-vars.h                |   6 +
 arch/arm64/kernel/vmlinux.lds.S               |  36 +-
 arch/arm64/kvm/Kconfig                        |  18 +
 arch/arm64/kvm/Makefile                       |   2 +
 arch/arm64/kvm/arm.c                          |  11 +
 arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h   |  13 +
 arch/arm64/kvm/hyp/include/nvhe/clock.h       |  16 +
 .../kvm/hyp/include/nvhe/define_events.h      |  21 +
 arch/arm64/kvm/hyp/include/nvhe/trace.h       |  60 ++
 arch/arm64/kvm/hyp/nvhe/Makefile              |   1 +
 arch/arm64/kvm/hyp/nvhe/clock.c               |  65 ++
 arch/arm64/kvm/hyp/nvhe/events.c              |  36 +
 arch/arm64/kvm/hyp/nvhe/ffa.c                 |   2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  86 ++
 arch/arm64/kvm/hyp/nvhe/hyp.lds.S             |   8 +
 arch/arm64/kvm/hyp/nvhe/mm.c                  |   2 +-
 arch/arm64/kvm/hyp/nvhe/psci-relay.c          |   5 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               |   4 +
 arch/arm64/kvm/hyp/nvhe/switch.c              |   5 +-
 arch/arm64/kvm/hyp/nvhe/trace.c               | 286 ++++++
 arch/arm64/kvm/hyp_trace.c                    | 385 ++++++++
 arch/arm64/kvm/hyp_trace.h                    |  11 +
 arch/arm64/kvm/pkvm.c                         |   1 +
 include/linux/ring_buffer.h                   |  58 ++
 include/linux/ring_buffer_types.h             |  41 +
 include/linux/simple_ring_buffer.h            |  58 ++
 include/linux/trace_remote.h                  |  27 +
 include/linux/trace_remote_event.h            |  33 +
 include/trace/define_remote_events.h          |  73 ++
 include/uapi/linux/trace_mmap.h               |   8 +-
 kernel/trace/Kconfig                          |  14 +
 kernel/trace/Makefile                         |  20 +
 kernel/trace/remote_test.c                    | 263 +++++
 kernel/trace/remote_test_events.h             |  10 +
 kernel/trace/ring_buffer.c                    | 259 ++++-
 kernel/trace/simple_ring_buffer.c             | 413 ++++++++
 kernel/trace/trace.c                          |   2 +-
 kernel/trace/trace.h                          |   6 +
 kernel/trace/trace_remote.c                   | 923 ++++++++++++++++++
 .../ftrace/test.d/remotes/buffer_size.tc      |  24 +
 .../selftests/ftrace/test.d/remotes/functions |  33 +
 .../ftrace/test.d/remotes/pkvm/buffer_size.tc |  10 +
 .../ftrace/test.d/remotes/pkvm/reset.tc       |  10 +
 .../ftrace/test.d/remotes/pkvm/trace_pipe.tc  |  10 +
 .../ftrace/test.d/remotes/pkvm/unloading.tc   |  10 +
 .../selftests/ftrace/test.d/remotes/reset.tc  | 105 ++
 .../ftrace/test.d/remotes/trace_pipe.tc       |  57 ++
 .../ftrace/test.d/remotes/unloading.tc        |  40 +
 54 files changed, 3629 insertions(+), 56 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_define_hypevents.h
 create mode 100644 arch/arm64/include/asm/kvm_hypevents.h
 create mode 100644 arch/arm64/include/asm/kvm_hyptrace.h
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/clock.h
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/define_events.h
 create mode 100644 arch/arm64/kvm/hyp/include/nvhe/trace.h
 create mode 100644 arch/arm64/kvm/hyp/nvhe/clock.c
 create mode 100644 arch/arm64/kvm/hyp/nvhe/events.c
 create mode 100644 arch/arm64/kvm/hyp/nvhe/trace.c
 create mode 100644 arch/arm64/kvm/hyp_trace.c
 create mode 100644 arch/arm64/kvm/hyp_trace.h
 create mode 100644 include/linux/ring_buffer_types.h
 create mode 100644 include/linux/simple_ring_buffer.h
 create mode 100644 include/linux/trace_remote.h
 create mode 100644 include/linux/trace_remote_event.h
 create mode 100644 include/trace/define_remote_events.h
 create mode 100644 kernel/trace/remote_test.c
 create mode 100644 kernel/trace/remote_test_events.h
 create mode 100644 kernel/trace/simple_ring_buffer.c
 create mode 100644 kernel/trace/trace_remote.c
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/buffer_size.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/functions
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/pkvm/buffer_size.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/reset.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/unloading.tc


base-commit: 088d13246a4672bc03aec664675138e3f5bff68c
-- 
2.49.0.1101.gccaa498523-goog


