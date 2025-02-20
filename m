Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072C4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 01:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=90DsHdVzBzjp5RPvlkSTbOgHqDCYIc4EKhmpQ2T52VA=; b=k6IY87683be+Ye+wlUOK/syHUu
	Q5KCa4ElhqwI6U2+TIDHF1M/Knx17pTp92dZohUtPRcF3VxfGencby2T2SD4hApYaKRqEYY9wxNS6
	YaY+MWfG8ACOWgFmjxF9eBn08BW1y4+5dtyLXP+IHZv25ufrrvErgJd8TOrl1wo2XTHAYr1GZ+z/r
	ixN0O22WLfMoexIj6YZ4gcBik/KFtWEsdQ7YTcKFhoKvFBcJmVI3wTOu+iq7popSVRraq7aknXRj7
	TVVOBLPdjdS10QBMSqAXfYGLdGQNXsevek/aJTid4HA6LxWcgay7dk0BEBoNKZbUD/m0pHDvzk0xr
	WEMEhnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvFZ-0000000G4zW-1Ngb;
	Thu, 20 Feb 2025 01:21:13 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkvE4-0000000G4bj-1qm9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 01:19:41 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc1c7c8396so1090303a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 17:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740014379; x=1740619179; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=90DsHdVzBzjp5RPvlkSTbOgHqDCYIc4EKhmpQ2T52VA=;
        b=yRCXA8CZUGbtwgjrxpahT87vm5uPry36oy+LoKW9HAsrH1NsMtGRzE/wCsdT7LYgQp
         oSs/G2hvUwhHQJY70PTsAgou56/k+jccJpqgPdgrRgFu4Q2b2Oegk1s2moSdLz02hR8C
         G+hcVI6tksQk/q59GP9Gv5ZvZVmy3DX/SAiVgDQHDjEVr36qakHavR+OVtH3kOILOpk8
         AqzBidmIlOvOSWgasRWbWhoHmNiD049ahHVml89PTl2ZrpC9Zl9P3zZQRFkOqp0IGavS
         ikKefqP5NnBr9E2LUtmmIOqxa5uahV9Rgo5PBtd2T4XfrYMKIOjzDhp0DqS3JXRjSYg2
         fdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740014379; x=1740619179;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=90DsHdVzBzjp5RPvlkSTbOgHqDCYIc4EKhmpQ2T52VA=;
        b=XmzadwYI/+aqAUUY+/LKQ7XAM48K8WGg7Jg9LAwKXhzAUPvy7mYfwoOSe2n98kcgTt
         tyt1doD5qgaXrjAPWh0Nt/LsnwEbDQjd7PQ018OvS1sLkYq7uA3wql5OH4c1GGllrKgS
         gC3oLnpt4j+SS+jGDfXB/aoTyghOBIyUkPDD47wqHB+aLYvrUn9ErgDP0h8bHlg2bwYL
         rdsghqYvkBaLZtGbHpGlugZN5FqBzAvlv8lryi5GZG1Lv2tETtLmIJEH5QxbuXZM+/Rh
         /fhZ4Uuz4Nq1HBq9L2m4WFmGcgFAs4hdeZ7h3fB/GoZw4fws2SccEP64eM/lCTIerVNZ
         QAeA==
X-Forwarded-Encrypted: i=1; AJvYcCWloTLlu9fxlDfW7G8P1CoB5emH0ShQm2q3c/c62e/xuaQo88CoiwF5XC8Xz67Fi/hiZyQQ0sxET1xgYH/4Gr1i@lists.infradead.org
X-Gm-Message-State: AOJu0YzRroI3cjOKxUobb63FOPsvS+XmOwCbKrpkl+85HV0yVjNvrgfM
	Qykll0HzDNbdrFm5EY9Iyg6I4ZmfFxiG+FUUC3LTLvzqM3LxFRnm0OwAl3SKjX8HOW0POlBeTa3
	UTV4n0U/TnQ==
X-Google-Smtp-Source: AGHT+IHTZJIfwdAPmaRcC/AMICF8Oev4ATVZBir52JFY3k0h8M5BqldtCyuNDkfc9kCd9Vz6uKu+/MDd0uXK1g==
X-Received: from pjbpv10.prod.google.com ([2002:a17:90b:3c8a:b0:2d8:8340:8e46])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2887:b0:2f9:bcd8:da33 with SMTP id 98e67ed59e1d1-2fc40f23246mr28257178a91.21.1740014378820;
 Wed, 19 Feb 2025 17:19:38 -0800 (PST)
Date: Thu, 20 Feb 2025 01:19:27 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <cover.1740009184.git.yepeilin@google.com>
Subject: [PATCH bpf-next v3 0/9] Introduce load-acquire and store-release BPF instructions
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
X-CRM114-CacheID: sfid-20250219_171940_485304_FAE3FE41 
X-CRM114-Status: GOOD (  15.43  )
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

  [2] https://github.com/llvm/llvm-project/pull/108636

Tested using PLATFORM=aarch64 CROSS_COMPILE=aarch64-linux-gnu-
vmtest.sh, with llvm-17, llvm-18 and [2].

Please refer to the LLVM PR and individual kernel patches for details.
Feedback is much appreciated!

v2: https://lore.kernel.org/bpf/cover.1738888641.git.yepeilin@google.com/
v2..v3 notable changes:

  o (Alexei) change encoding to BPF_LOAD_ACQ=0x100, BPF_STORE_REL=0x110
  o add Acked-by: tags from Ilya and Eduard
  o make new selftests depend on:
    * __clang_major__ >= 18, and
    * ENABLE_ATOMICS_TESTS is defined (currently this means -mcpu=v3 or
      v4), and
    * JIT supports load_acq/store_rel (currenty only arm64)
  o work around llvm-17 CI job failure by conditionally define
    __arena_global variables as 64-bit if __clang_major__ < 18, to make
    sure .addr_space.1 has no holes
  o add Google copyright notice in new files

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

[1] https://lore.kernel.org/all/20240729183246.4110549-1-yepeilin@google.com/

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

 .../bpf/standardization/instruction-set.rst   |  78 ++++--
 arch/arm64/include/asm/insn.h                 |  12 +-
 arch/arm64/lib/insn.c                         |  29 ++
 arch/arm64/net/bpf_jit.h                      |  20 ++
 arch/arm64/net/bpf_jit_comp.c                 |  87 +++++-
 arch/s390/net/bpf_jit_comp.c                  |  14 +-
 arch/x86/net/bpf_jit_comp.c                   |   4 +
 include/linux/bpf.h                           |  15 +
 include/linux/filter.h                        |   2 +
 include/uapi/linux/bpf.h                      |   3 +
 kernel/bpf/core.c                             |  63 ++++-
 kernel/bpf/disasm.c                           |  12 +
 kernel/bpf/verifier.c                         | 234 +++++++++++-----
 tools/include/uapi/linux/bpf.h                |   3 +
 .../selftests/bpf/prog_tests/arena_atomics.c  |  66 ++++-
 .../selftests/bpf/prog_tests/verifier.c       |   4 +
 .../selftests/bpf/progs/arena_atomics.c       | 118 +++++++-
 .../bpf/progs/verifier_load_acquire.c         | 197 +++++++++++++
 .../selftests/bpf/progs/verifier_precision.c  |  48 ++++
 .../bpf/progs/verifier_store_release.c        | 264 ++++++++++++++++++
 20 files changed, 1165 insertions(+), 108 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_load_acquire.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_store_release.c

-- 
2.48.1.601.g30ceb7b040-goog


