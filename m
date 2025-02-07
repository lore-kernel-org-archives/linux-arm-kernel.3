Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179FAC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PqLAn/53hD5bzHEF3DH1g9kKveGsXY5lagU+X8oybEw=; b=MXvH0aqN/t9Dilqwq1dCSuXSGU
	A3m7PpKlZVVxSW6vImiMIFf0knFEW8gXemj5te0KLV6addBj+Xqs1KGVEbMlDmnyYKk0/cgRem/6d
	UgkjRcHkAl1i+jcWfXwyxxf2/TtTp4MUV2wl1qcW3q+R61HnwxNLg4iOveUpzCVkRY8C0vmIDgXc8
	hhvf2J0xbJEbBkG0QaOJmhFvsJIzWDyU58VJyjV/raBEVjhInf/GVaXcEUEsF1CeQEKiYsNQjgeeC
	hx8FybDFxiP1Tt2aOv4f2ZJ9L8/BSgb/f8YCHsDphCCN7qvGWJSHgtyZhMbbvzOCAtLU1NnjNcIP1
	LDvfRiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDlE-000000081dn-2Vxw;
	Fri, 07 Feb 2025 02:06:28 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDjq-000000081Jc-0vm2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:05:03 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so3308306a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893901; x=1739498701; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PqLAn/53hD5bzHEF3DH1g9kKveGsXY5lagU+X8oybEw=;
        b=18w8EjpG4OVNamXAoBYGiHLZLfx2j/3Q4T67j7+5O0bXI4l1VbJzXuFlZNY+w5eiu0
         67imeUZcWOzgz7ugLbLol6VB9SdERMTs4fANlJWpSRep2i2ZY5aLoqvWjP3BSYLt/8xE
         kcBSKhSL/YgKu067CZIvATnfSpKvPzd3Ws3pQCbYJFv8kTrEKKnLkQieXdJNmE0oU7aM
         NKZlZUfSYetFNt2lpnp8fIc11XX+j2qKFG+n2S8ruRQSVTzPkm9uAp3By5eiJYrG7bpG
         enWhJmA5U3/XRRxfJw4Rp23YWSCmt0N+l1vyYGnLeO5z9JteimCtCBK4Up/Km9Z9t/1W
         hiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893901; x=1739498701;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PqLAn/53hD5bzHEF3DH1g9kKveGsXY5lagU+X8oybEw=;
        b=XBQOwkAjwo62jHYEqnk+HT08u7kevHEtm8NWId+QD6FsfPdExXaAJ94LYc+054EInb
         kRHha2XezbuVEz9TEz7o/57ivUCrZVjkUIkMHlJb9j6hGgixiexq2BCUMN6xIK9xoS7P
         eXFYQ+Yt6tReFHJZ8x0Da+zrVZVQ5O8p/avzap0EMTXv2maciRaucNickBAmHtPBGgv+
         PGi+ePe4/oZPusr7SfHaRBVA4mJFdBMA5975oar3Irh4YhSPVBpfrhRIIW1jqeyzgN7t
         Mtik5xWw/1TnLOqmAx/hh6gkpMdhOdkaYwRXQxTBq9UnATO3BEQ+vfv3TQDcDBCX6/MH
         CQCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV0fLwkKtHLNNb7Tsd60egpAKHqPWTeuJrRaVjC1uBPKHtJTKjrWLzHWSwyAZL0gHdR5yiOu4+tvBbh/Mr7Lm8@lists.infradead.org
X-Gm-Message-State: AOJu0YzF2hNsvKatWTipNZV0U10Lne+rhWJ9ML7gYbH4dX6zY3IlW7gj
	7DPL3y00Do0NxjQqL0t9I1GrCKIJcs0+3XECCf1zrC9/gCrdl+oGS9VF82XH6iIB6w08MXFxw9L
	RwdTZIy7NSw==
X-Google-Smtp-Source: AGHT+IFI+zjtKAOB2+wQvSyOruCXfpfwBdWdB7zywXf/dZud1XWE0JoQzOJjfbv2/vxSfhxiEaFJeYbvg0pWGQ==
X-Received: from pfey8.prod.google.com ([2002:a62:b508:0:b0:728:958a:e45c])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:9283:b0:72a:bcc2:eefb with SMTP id d2e1a72fcca58-7305d421c08mr2090191b3a.2.1738893900877;
 Thu, 06 Feb 2025 18:05:00 -0800 (PST)
Date: Fri,  7 Feb 2025 02:04:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <cover.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 0/9] Introduce load-acquire and store-release BPF instructions
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
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_180502_285030_9F352FFC 
X-CRM114-Status: GOOD (  15.76  )
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
instructions (for background, please see [1]), mainly including
core/verifier, arm64 JIT compiler, and Documentation/ changes.  x86-64
and riscv64 are also planned to be supported.  The corresponding LLVM
changes can be found at:
  https://github.com/llvm/llvm-project/pull/108636

An atomic load/store is a BPF_STX | BPF_ATOMIC instruction, with the
lowest 8 bits of the 'imm' field in the following format:

  +-+-+-+-+-+-+-+-+
  | type  | order |
  +-+-+-+-+-+-+-+-+

  o 'type' indicates ATOMIC_LOAD (0x1) or ATOMIC_STORE (0x2)
  o 'order' is one of RELAXED (0x0), ACQUIRE (0x1), RELEASE (0x2),
    ACQ_REL (0x3, acquire-and-release) and SEQ_CST (0x4, sequentially
    consistent)

Currently only two combinations are legal:

  o LOAD_ACQ (0x11: ATOMIC_LOAD, ACQUIRE)
  o STORE_REL (0x22: ATOMIC_STORE, RELEASE)

During v1 there was a discussion on whether it is necessary to have a
dedicated 'order' field and define all possible values, considering that
we only allow two combinations at the moment.  Please refer to [2] for
more context.

v1: https://lore.kernel.org/all/cover.1737763916.git.yepeilin@google.com/
v1..v2 notable changes:

  o (Eduard) for x86 and s390, make
             bpf_jit_supports_insn(..., /*in_arena=*/true) return false
	     for load_acq/store_rel
  o add Eduard's Acked-by: tag
  o (Eduard) extract LDX and non-ATOMIC STX handling into helpers, see
             PATCH v2 3/9
  o allow unpriv programs to store-release pointers to stack
  o (Alexei) make it clearer in the interpreter code (PATCH v2 4/9) that
             only W and DW are supported for atomic RMW
  o test misaligned load_acq/store_rel
  o (Eduard) other selftests/ changes:
    * test load_acq/store_rel with !atomic_ptr_type_ok() pointers:
      - PTR_TO_CTX, for is_ctx_reg()
      - PTR_TO_PACKET, for is_pkt_reg()
      - PTR_TO_FLOW_KEYS, for is_flow_key_reg()
      - PTR_TO_SOCKET, for is_sk_reg()
    * drop atomics/ tests
    * delete unnecessary 'pid' checks from arena_atomics/ tests
    * avoid depending on __BPF_FEATURE_LOAD_ACQ_STORE_REL, use
      __imm_insn() and inline asm macros instead

RFC v1: https://lore.kernel.org/all/cover.1734742802.git.yepeilin@google.com
RFC v1..v1 notable changes:

  o 1-2/8: minor verifier.c refactoring patches
  o   3/8: core/verifier changes
         * (Eduard) handle load-acquire properly in backtrack_insn()
         * (Eduard) avoid skipping checks (e.g.,
                    bpf_jit_supports_insn()) for load-acquires
         * track the value stored by store-releases, just like how
           non-atomic STX instructions are handled
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

Please see the individual kernel patches (and LLVM commits) for details.
The LLVM GitHub PR will be split into three (each containing a single
commit) soon.  Feedback is much appreciated!

[1] https://lore.kernel.org/all/20240729183246.4110549-1-yepeilin@google.com/
[2] https://lore.kernel.org/bpf/Z5srM--fdH_JAgYT@google.com

Thanks,
Peilin Ye (9):
  bpf/verifier: Factor out atomic_ptr_type_ok()
  bpf/verifier: Factor out check_atomic_rmw()
  bpf/verifier: Factor out check_load_mem() and check_store_reg()
  bpf: Introduce load-acquire and store-release instructions
  arm64: insn: Add BIT(23) to {load,store}_ex's mask
  arm64: insn: Add load-acquire and store-release instructions
  bpf, arm64: Support load-acquire and store-release instructions
  selftests/bpf: Add selftests for load-acquire and store-release
    instructions
  bpf, docs: Update instruction-set.rst for load-acquire and
    store-release instructions

 .../bpf/standardization/instruction-set.rst   | 114 ++++++--
 arch/arm64/include/asm/insn.h                 |  12 +-
 arch/arm64/lib/insn.c                         |  29 ++
 arch/arm64/net/bpf_jit.h                      |  20 ++
 arch/arm64/net/bpf_jit_comp.c                 |  87 +++++-
 arch/s390/net/bpf_jit_comp.c                  |  14 +-
 arch/x86/net/bpf_jit_comp.c                   |   4 +
 include/linux/bpf.h                           |  11 +
 include/linux/filter.h                        |   2 +
 include/uapi/linux/bpf.h                      |  13 +
 kernel/bpf/core.c                             |  63 ++++-
 kernel/bpf/disasm.c                           |  12 +
 kernel/bpf/verifier.c                         | 234 +++++++++++-----
 tools/include/uapi/linux/bpf.h                |  13 +
 .../selftests/bpf/prog_tests/arena_atomics.c  |  50 ++++
 .../selftests/bpf/prog_tests/verifier.c       |   4 +
 .../selftests/bpf/progs/arena_atomics.c       |  88 ++++++
 .../bpf/progs/verifier_load_acquire.c         | 190 +++++++++++++
 .../selftests/bpf/progs/verifier_precision.c  |  47 ++++
 .../bpf/progs/verifier_store_release.c        | 262 ++++++++++++++++++
 20 files changed, 1164 insertions(+), 105 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_load_acquire.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_store_release.c

-- 
2.48.1.502.g6dc24dfdaf-goog


