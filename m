Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16074C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 02:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h3bkVoi9K3lmVDVc5ocA3NDmYedo978QaFzTUvD0tLE=; b=u80TskCP6XrCWVxppjOopRB/zV
	ENPvFvR82X4eYrePpmUBZmwNijhj6/TH1TeyLrVZBm/x2gDnE1msSZUjSaXFlf/27AeEW6nMbsIeA
	ZdDbIwmZ3wf73QX2zO7uTKW0JAiJ5FLHsywA8k5zS7igl1JjXt7bQgf5iNkLB5FDTAaHtUhbrflGr
	YwpiE3Db0syD4Yz7KSIn4hTmQ4RSWk/Wn5J9OHiKNCtijpcIx1nkQxoTtsAd0AGUs40GsgsUgyw+F
	6zJYftcVWdZ0aa7HfCK3GsiMN6u4WNciiMmakt46Id7ISuhyH4Pjcj2b8jZSR7Hj7q6nVEg/Zr6kS
	uGdZ+QEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVl0-0000000Ftxl-3GU2;
	Sat, 25 Jan 2025 02:18:46 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbVjh-0000000FtoD-3oKz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 02:17:27 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef9e38b0cfso5317771a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 18:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737771444; x=1738376244; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h3bkVoi9K3lmVDVc5ocA3NDmYedo978QaFzTUvD0tLE=;
        b=EBmRgBLCsQ8Ihr+XV60NDvExJERxvDO30M+w32JP40fjecebrByNyUN10a3sbmXSHt
         SmE3CcRBxg3ONmWU6fw/giruSGL6sv+zO1JxSbIpoVduGNPD90OO0LXO6zFgGfuvRCZ4
         nuLIcc8UpVx4o7pDiw2IArEYM1LjgHOQt+NltVfu3oVE4Qcz2zBpKx79w3aVCLCmJpiC
         zQtGZsTDE1d1dlbizpe/e8RNRoGk/WM0UAZ3BBNaPUFcy9FvGzqfh3hV5kdcpo4c6WDk
         Mt3wbD5UO/3b3fSqJwA9mDAsIVEa1ibYgRmT2H81Eo1U9tO1Ljvb9j6vavcnRcoEB66k
         te1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737771444; x=1738376244;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h3bkVoi9K3lmVDVc5ocA3NDmYedo978QaFzTUvD0tLE=;
        b=MMWkh2bXSlRm7DKGwfy+LIKmhby0f2uT5VnVY3kgtA9KQ8g4Cy21hIK4c246EbGLZs
         Tz/oZMhA3xY5tcIxqaq6cLznIYqA9bKnLAhSofQCF1+m37oFvdnDbfsfVMEmU09FqL1I
         hrqozOCTQK3zdvPrZnnBhckoBq2lhwtpGEaNkkoOoMVbJRfSaeXLHVzn3KA57EpdmrYT
         /GAx8it54JhIJwjJxasmPE/uaaN5e67RtTKtsRoaL+6hOn6xR5upMhRaQSE3nxILTBBl
         MY9GQ+mqJhYdQAh9OrkNKwbryW4yKIWjD685eaexSqKZSWx9tSobovzUcx8vLNU5yeK1
         bo0w==
X-Forwarded-Encrypted: i=1; AJvYcCWkDQHVG5XH2hUyouO/lH3GT01Y6R+w6Os4Kh64uHzz7U9s11KPIRR5kS38ZClYcNyPEMKUqSPzMTmRIH2KC0y+@lists.infradead.org
X-Gm-Message-State: AOJu0YwZh2Gou3a0PxLnjNsLzaDbu+kLh5itknpdTMFIW5LxWD0jXYS5
	oUPBshdzi8GlsaiidEatf3D5DxN7X29PnBwh042iWa0olveCGD1FsyfBE5jZ3vnrxfJRhCGPXF1
	4r1d2UGcg6A==
X-Google-Smtp-Source: AGHT+IHN3T/fppy6ufj+AIX32GgCXgIkSJTU3btPBtKv0LakDy15nE9uX+biultAZ61nn2WuE7FZK8L8XPRlfg==
X-Received: from pjbpx11.prod.google.com ([2002:a17:90b:270b:b0:2ea:5469:76c2])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:54d0:b0:2ee:bbd8:2b9d with SMTP id 98e67ed59e1d1-2f782d8c81fmr41701777a91.34.1737771443886;
 Fri, 24 Jan 2025 18:17:23 -0800 (PST)
Date: Sat, 25 Jan 2025 02:16:45 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <cover.1737763916.git.yepeilin@google.com>
Subject: [PATCH bpf-next v1 0/8] Introduce load-acquire and store-release BPF instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_181725_951395_EEC7D3D5 
X-CRM114-Status: GOOD (  16.98  )
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

Hi all!

This patchset adds kernel support for BPF load-acquire and store-release
instructions (for background, please see [1]), including core/verifier,
arm64 JIT compiler, and Documentation/ changes.  x86-64 and riscv64 are
also planned to be supported.  The corresponding LLVM changes can be
found at:
  https://github.com/llvm/llvm-project/pull/108636

Following RFC 9669, 7.3. Adding Instructions [2], this patchset adds two
conformance groups for the new instructions:

  * atomic32v2: includes "atomic32", plus the new 8-, 16- and 32-bit
                atomic load-acquire and store-release instructions

  * atomic64v2: includes "atomic64" and "atomic32v2", plus the new
                64-bit atomic load-acquire and store-release
                instructions

See patch 8/8 for details; please suggest if you believe the new
instructions should be grouped differently.

RFC v1: https://lore.kernel.org/all/cover.1734742802.git.yepeilin@google.com

This patchset has been reorganized based on comments and suggestions
from Xu and Eduard.  Notable changes since RFC v1:

  o 1-2/8: minor verifier.c refactoring patches
  o   3/8: core/verifier changes
         * (Eduard) handle load-acquire properly in backtrack_insn()
         * (Eduard) avoid skipping checks (e.g.,
                    bpf_jit_supports_insn()) for load-acquires
         * track the value stored by store-releases, just like how
           non-atomic STX instructions are handled [3]
         * (Eduard) add missing link in commit message
         * (Eduard) always print 'r' for disasm.c changes
  o   4/8: arm64/insn: avoid treating load_acq/store_rel as
           load_ex/store_ex
  o   5/8: arm64/insn: add load_acq/store_rel
         * (Xu) include Should-Be-One (SBO) bits in "mask" and "value",
                to avoid setting fixed bits during runtime (JIT-compile
                time)
  o   6/8: arm64 JIT compiler changes
         * (Xu) use emit_a64_add_i() for "pointer + offset" to optimize
                code emission
  o   7/8: selftests
         * (Eduard) avoid adding new tests to the 'test_verifier' runner
         * add more tests, e.g., checking mark_precise logic
  o   8/8: instruction-set.rst changes

Please refer to individual kernel patches (and LLVM commits) for
details.  Any feedback would be much appreciated!

[1] https://lore.kernel.org/all/20240729183246.4110549-1-yepeilin@google.com/
[2] https://www.rfc-editor.org/rfc/rfc9669.html#section-7.3
[3] Specifically, for store-releases, make sure we do that
    check_mem_access(..., BPF_WRITE, ...) call with @value_regno equals
    'src_reg' instead of -1.

Thanks,
Peilin Ye (8):
  bpf/verifier: Factor out atomic_ptr_type_ok()
  bpf/verifier: Factor out check_atomic_rmw()
  bpf: Introduce load-acquire and store-release instructions
  arm64: insn: Add BIT(23) to {load,store}_ex's mask
  arm64: insn: Add load-acquire and store-release instructions
  bpf, arm64: Support load-acquire and store-release instructions
  selftests/bpf: Add selftests for load-acquire and store-release
    instructions
  bpf, docs: Update instruction-set.rst for load-acquire and
    store-release instructions

 .../bpf/standardization/instruction-set.rst   | 114 ++++++++++--
 arch/arm64/include/asm/insn.h                 |  12 +-
 arch/arm64/lib/insn.c                         |  28 +++
 arch/arm64/net/bpf_jit.h                      |  20 +++
 arch/arm64/net/bpf_jit_comp.c                 |  92 +++++++++-
 include/linux/filter.h                        |   2 +
 include/uapi/linux/bpf.h                      |  13 ++
 kernel/bpf/core.c                             |  41 ++++-
 kernel/bpf/disasm.c                           |  12 ++
 kernel/bpf/verifier.c                         | 165 +++++++++++++++---
 tools/include/uapi/linux/bpf.h                |  13 ++
 .../selftests/bpf/prog_tests/arena_atomics.c  |  61 ++++++-
 .../selftests/bpf/prog_tests/atomics.c        |  57 +++++-
 .../selftests/bpf/prog_tests/verifier.c       |   4 +
 .../selftests/bpf/progs/arena_atomics.c       |  62 ++++++-
 tools/testing/selftests/bpf/progs/atomics.c   |  62 ++++++-
 .../bpf/progs/verifier_load_acquire.c         |  92 ++++++++++
 .../selftests/bpf/progs/verifier_precision.c  |  39 +++++
 .../bpf/progs/verifier_store_release.c        | 153 ++++++++++++++++
 19 files changed, 988 insertions(+), 54 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_load_acquire.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_store_release.c

-- 
2.48.1.262.g85cc9f2d1e-goog


