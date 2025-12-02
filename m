Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8119FD11700
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LtK4Ifd0fkVX/Uo4rpKtUIh8+t2J8ZWZcsBiYvXHBtM=; b=QTbvAiFzSrpPfOFkZrxKdrf72o
	4NVHx4SnxznD10/aMQH3cywbPEm3LXEQHaIInFhSy9ZTpxAli7W0torbQ/A0Xu8DkzME+7WP1rOuA
	y4r/+lU4f/q/SsCMo1JjuSDI3lSPlQ7v7GbVbNU5X71Cr6DBntP/vz9tyLsVC5l7Bm5ReYhZco/XG
	S1tpTzEKg0p0A0kZtE/4aEUBbddG6vqS13kSZJbaKQZp1fcc+K+EV1DEuZLZ8MudxSy3w5Ac2f1rz
	zfrkZn+eZVFtrGS579rcylNucqZtwSyeE69H0JWZrV4/4kvaqI0q7/WyrDKIpmcllxYN4U+JhCaHm
	RAdW9XJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoH-000000057tX-3T0V;
	Tue, 02 Dec 2025 09:36:37 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoE-000000057rF-2mb8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:36:36 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-640cdaf43aeso5990827a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668192; x=1765272992; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LtK4Ifd0fkVX/Uo4rpKtUIh8+t2J8ZWZcsBiYvXHBtM=;
        b=OhcLyMOf1kkdanoivwjaMtq9hWbcL7hRz4Umz6X6iRvO03vpoOh7/8mfhcTFoiu3hg
         XdIvwfULe1G4HFVtq5YndDYy+3DCnHlG4HCA/r3vJbSt1T56HdbxQkM2hwOFFOJ3HmDo
         gAnKifIUA40pATEAW2HeKW0ERQVzc98lN8ZGS4ypdSWJcdkEHd/IoJ4sNPTaDYGkVgOP
         TX2qiB31L/0eW1ZmH7B9FUsWRCQKL3azBy7ov5cacst0qJbamCt8ezzwZbF6MmC57JcQ
         VNt6UyAD/Uz70lsIf/QXZ4SKvIddoAlgstaB7d4fDkVB0+OOXPOIUrip+ihXUFylNk93
         mTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668192; x=1765272992;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtK4Ifd0fkVX/Uo4rpKtUIh8+t2J8ZWZcsBiYvXHBtM=;
        b=l3SObMSCo6J+BwhKsTDYhV6c2hF6Fxn92SJ4c8ThJHhk8IPvKGEvamnHoJvHRS+fn8
         M3O7PrSavKVW2776PMsb6Y6xo2SjP6os5KCGdAbxq9UnFgV5kCiYESYftgIXSTOO2rrc
         dfJvehgQxZWt6k1AUnvVbXnSgvUPj4TopS+QiINWxilkanunqbJu7wUSwC6UOyVVol29
         vb5meiIjhqXvSUUXrFO95UqI/XsAPecw7jJdgT8wg8Mdk7N3z3p3LSm4KDSdW2Ewmdix
         GAYyNO3DbSnc2PTZyy+0dQ+tkMPaS/HNxsoUa9OKA9croKhmG09A3wSwG9l6dczJi4va
         iFbg==
X-Forwarded-Encrypted: i=1; AJvYcCUUF0I6c6rBm5iyVIHMehpTQFlJCIAOCyoW3Ia/hNO8gToAXPbNOw2SIcsBl693rhi/zeuILE49dzHMTiwjJEgf@lists.infradead.org
X-Gm-Message-State: AOJu0YzgPmCu9eBNe/tC3ZJxrpLMM0d/AxDUV/sdFAx7oP+GaqGAZ5ar
	knRnTMBPH5/Dg972q0oJAMNiCcDHoQmutkPWdkXTQ8m5mwCF5NNILjBWOjIHatzOfaf0fkmSwf2
	+lojHQ72Owrup8v+bO6ZKwA==
X-Google-Smtp-Source: AGHT+IFOFHbHENgTptSQGTb4XOHW2tSPL6uKolM2qbgJYuvFi98jXboqWND21yBnVqXetxMA9SC8VwF5Q563wljI
X-Received: from edf21.prod.google.com ([2002:a05:6402:21d5:b0:641:2a2d:67ee])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:42ca:b0:640:9eb3:3686 with SMTP id 4fb4d7f45d1cf-64554685822mr37407113a12.19.1764668191831;
 Tue, 02 Dec 2025 01:36:31 -0800 (PST)
Date: Tue,  2 Dec 2025 09:35:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-1-vdonnefort@google.com>
Subject: [PATCH v9 00/30] Tracefs support for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_013634_868545_3FE82A2D 
X-CRM114-Status: GOOD (  31.27  )
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

   remotes/test
	|-- buffer_size_kb
	|-- events
	|   |-- enable
	|   |-- header_event
	|   |-- header_page
	|   `-- test
	|       `-- selftest
	|           |-- enable
	|           |-- format
	|           `-- id
	|-- per_cpu
	|   `-- cpu0
	|       |-- trace
	|       `-- trace_pipe
	|-- trace
	|-- trace_pipe
	|-- tracing_on

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

Changes since v8
  - Do not enable tracing if unstable cnvct (Marc)
  - Add support for nVHE (Marc)
  - Add PKVM_DISABLE_STAGE2_ON_PANIC (Marc)
  - NVHE_EL2_TRACING depends on NVHE_EL2_DEBUG (Marc)
  - Add a reason for hyp_enter/hyp_exit events (Marc)
  - Remove PKVM_SELFTESTS in favour of NVHE_EL2_DEBUG
  - Add wrapper for arm_smccc_1_2, now used in nvhe/ffa.c

Changes since v7
  - Add missing EXPORT_SYMBOL_GPL for remote_test.ko
  - Rebase on 6.18-rc4

Changes since v6

  - Add requires field to the selftest (Masami)
  - Use guard() for ring_buffer_poll_remote (Steven)
  - Rename ring_buffer_remote() to ring_buffer_alloc_remote() (Steven)
  - kerneldoc for trace_buffer_remote and simple_ring_buffer (Steven)
  - Validate trace_buffer_desc size in trace_remote_alloc_buffer
    (Steven)
  - Add non-consuming ring-buffer read (Steven)
  - Add spinning failsafe in simple_ring_buffer (Steven)
  - Range check for hyp_trace_desc::bpages_backing_* in hyp_trace_desc_validate()
  - unsigned int cpu in hyp_trace_desc_validate()
  - Fix event/format file
  - Add tests with an offline CPU
  - Add tests for non-consuming read
  - Add documentation
  - Rebase on 6.17

Changes since v5 (https://lore.kernel.org/all/20250516134031.661124-1-vdonnefort@google.com/)

  - Add tishift lib to the hyp (Aneesh)
  - Rebase on 6.17-rc2

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

Vincent Donnefort (30):
  ring-buffer: Add page statistics to the meta-page
  ring-buffer: Store bpage pointers into subbuf_ids
  ring-buffer: Introduce ring-buffer remotes
  ring-buffer: Add non-consuming read for ring-buffer remotes
  tracing: Introduce trace remotes
  tracing: Add reset to trace remotes
  tracing: Add non-consuming read to trace remotes
  tracing: Add init callback to trace remotes
  tracing: Add events to trace remotes
  tracing: Add events/ root files to trace remotes
  tracing: Add helpers to create trace remote events
  ring-buffer: Export buffer_data_page and macros
  tracing: Introduce simple_ring_buffer
  tracing: Add a trace remote module for testing
  tracing: selftests: Add trace remote tests
  Documentation: tracing: Add tracing remotes
  tracing: load/unload page callbacks for simple_ring_buffer
  tracing: Check for undefined symbols in simple_ring_buffer
  KVM: arm64: Add PKVM_DISABLE_STAGE2_ON_PANIC
  KVM: arm64: Add clock support to nVHE/pKVM hyp
  KVM: arm64: Initialise hyp_nr_cpus for nVHE hyp
  KVM: arm64: Support unaligned fixmap in the pKVM hyp
  KVM: arm64: Add tracing capability for the nVHE/pKVM hyp
  KVM: arm64: Add trace remote for the nVHE/pKVM hyp
  KVM: arm64: Sync boot clock with the nVHE/pKVM hyp
  KVM: arm64: Add trace reset to the nVHE/pKVM hyp
  KVM: arm64: Add event support to the nVHE/pKVM hyp and trace remote
  KVM: arm64: Add hyp_enter/hyp_exit events to nVHE/pKVM hyp
  KVM: arm64: Add selftest event support to nVHE/pKVM hyp
  tracing: selftests: Add hypervisor trace remote tests

 Documentation/trace/index.rst                 |   11 +
 Documentation/trace/remotes.rst               |   59 +
 arch/arm64/include/asm/kvm_asm.h              |    8 +
 arch/arm64/include/asm/kvm_define_hypevents.h |   16 +
 arch/arm64/include/asm/kvm_hyp.h              |    4 +-
 arch/arm64/include/asm/kvm_hypevents.h        |   56 +
 arch/arm64/include/asm/kvm_hyptrace.h         |   26 +
 arch/arm64/kernel/image-vars.h                |    4 +
 arch/arm64/kernel/vmlinux.lds.S               |   18 +
 arch/arm64/kvm/Kconfig                        |   64 +-
 arch/arm64/kvm/Makefile                       |    2 +
 arch/arm64/kvm/arm.c                          |   10 +-
 arch/arm64/kvm/handle_exit.c                  |    2 +-
 arch/arm64/kvm/hyp/include/nvhe/arm-smccc.h   |   23 +
 arch/arm64/kvm/hyp/include/nvhe/clock.h       |   16 +
 .../kvm/hyp/include/nvhe/define_events.h      |   14 +
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |    2 -
 arch/arm64/kvm/hyp/include/nvhe/trace.h       |   58 +
 arch/arm64/kvm/hyp/nvhe/Makefile              |    6 +-
 arch/arm64/kvm/hyp/nvhe/clock.c               |   65 +
 arch/arm64/kvm/hyp/nvhe/events.c              |   25 +
 arch/arm64/kvm/hyp/nvhe/ffa.c                 |   28 +-
 arch/arm64/kvm/hyp/nvhe/host.S                |    2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |   91 +-
 arch/arm64/kvm/hyp/nvhe/hyp.lds.S             |    6 +
 arch/arm64/kvm/hyp/nvhe/mm.c                  |    4 +-
 arch/arm64/kvm/hyp/nvhe/psci-relay.c          |    7 +-
 arch/arm64/kvm/hyp/nvhe/setup.c               |    4 +-
 arch/arm64/kvm/hyp/nvhe/stacktrace.c          |    6 +-
 arch/arm64/kvm/hyp/nvhe/switch.c              |    5 +-
 arch/arm64/kvm/hyp/nvhe/trace.c               |  306 ++++
 arch/arm64/kvm/hyp_trace.c                    |  445 ++++++
 arch/arm64/kvm/hyp_trace.h                    |   11 +
 arch/arm64/kvm/stacktrace.c                   |    8 +-
 fs/tracefs/inode.c                            |    1 +
 include/linux/ring_buffer.h                   |   58 +
 include/linux/ring_buffer_types.h             |   41 +
 include/linux/simple_ring_buffer.h            |  120 ++
 include/linux/trace_remote.h                  |   92 ++
 include/linux/trace_remote_event.h            |   33 +
 include/trace/define_remote_events.h          |   73 +
 include/uapi/linux/trace_mmap.h               |    8 +-
 kernel/trace/Kconfig                          |   14 +
 kernel/trace/Makefile                         |   20 +
 kernel/trace/remote_test.c                    |  259 ++++
 kernel/trace/remote_test_events.h             |   10 +
 kernel/trace/ring_buffer.c                    |  356 ++++-
 kernel/trace/simple_ring_buffer.c             |  468 ++++++
 kernel/trace/trace.c                          |    2 +-
 kernel/trace/trace.h                          |    6 +
 kernel/trace/trace_remote.c                   | 1318 +++++++++++++++++
 .../ftrace/test.d/remotes/buffer_size.tc      |   25 +
 .../selftests/ftrace/test.d/remotes/functions |   88 ++
 .../test.d/remotes/hypervisor/buffer_size.tc  |   11 +
 .../ftrace/test.d/remotes/hypervisor/reset.tc |   11 +
 .../ftrace/test.d/remotes/hypervisor/trace.tc |   11 +
 .../test.d/remotes/hypervisor/trace_pipe.tc   |   11 +
 .../test.d/remotes/hypervisor/unloading.tc    |   11 +
 .../selftests/ftrace/test.d/remotes/reset.tc  |   90 ++
 .../selftests/ftrace/test.d/remotes/trace.tc  |  127 ++
 .../ftrace/test.d/remotes/trace_pipe.tc       |  127 ++
 .../ftrace/test.d/remotes/unloading.tc        |   41 +
 62 files changed, 4725 insertions(+), 119 deletions(-)
 create mode 100644 Documentation/trace/remotes.rst
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
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/hypervisor/buffer_size.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/hypervisor/reset.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/hypervisor/trace_pipe.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/hypervisor/unloading.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/reset.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/trace.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
 create mode 100644 tools/testing/selftests/ftrace/test.d/remotes/unloading.tc


base-commit: 30f09200cc4aefbd8385b01e41bde2e4565a6f0e
-- 
2.52.0.107.ga0afd4fd5b-goog


