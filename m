Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E4ACD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wOljlMat6RAb/iGwhJiSN0/00+BKRzGXIX9CN4zoVrw=; b=JP3/qJ3vhghLyP
	r55D4gxr2Sdp7h1P+e5Iv3Mi73kHPkIsKTeZvXFyQdMYX08F54GGx3+bj1CRxI2Hxf/Bt5u9b8ZLE
	Mx7XOAoJqahBeez/DidcHK3fDOxDmIVxWYsxZfR6Lj0mwGhNO9Pyk6ZRYnqWeF0X3dyhGTgJpmUgA
	oMHCVn7WUEULfMZ4Rvfeip3BLhztZxoWytUuDqO7I1g5GceJqX/SbXx4+OASHGtddeaXq4xlx5wB+
	ZX1mYiGip+oAbe0O5NkXFgElaXyazFhgX0bAYSLTutDeqN2+zgHxe0hMJU3EUdISapJwwHcwkGrmu
	DTbUjaVGV2XlHiW5jOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEaJ-0000000HGBj-0HeZ;
	Thu, 04 Jun 2026 20:22:35 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEaF-0000000HGAF-29t9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:22:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EC96A4E406AC;
	Thu,  4 Jun 2026 20:22:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A651F5FED1;
	Thu,  4 Jun 2026 20:22:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8E11106A19CA;
	Thu,  4 Jun 2026 22:22:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780604544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=wOljlMat6RAb/iGwhJiSN0/00+BKRzGXIX9CN4zoVrw=;
	b=GvDDw8u35k8xGEs3fqF3paacKHdP03w3PMEwyMaIVfGX75EedJ8YWBTHTKad7ujmELnH2j
	80H7knPMdmUaEK11JcRfoeBv+W1qgm2Wkgf8OkrEhwdUAq7AkM0q9GT/mDJXaL5v73eBd6
	JzxtWYB0/xdr5UA47rO6IbWcGp1smjMqQO47xFGChHMsy8VmHx0h43u0PiA0r0eJiW4bBl
	y/iGHkmjGLzOYIdeepjsDwpX3OcGVAhZWB4BcoOhm+B8Oyb/sQZXZHRdUhY98YlpalQKT5
	aWLmUYma0sCV9myA3ZuGLD7c6mo8UOijyvfT75GeEdsJBnTYDRrpeEjQGO4u4g==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Subject: [PATCH bpf-next v2 0/8] bpf: add support for KASAN checks in JITed
 programs
Date: Thu, 04 Jun 2026 22:21:58 +0200
Message-Id: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQ7CIBAFf6XZsxiWVmw8+R+mB6BgNyo0QJqah
 n+XEI+TeZl3QLKRbIJbd0C0GyUKvoI4dWAW5Z+W0VwZBBeSo5DspZLyzJlZjk4OZr5qqNs1Wkd
 76zxAr455u2eYqlko5RC/7WDD5ltrwP7f2pBxhuoy9ih6Pgq86xDym/zZhA9MpZQf6CODbqYAA
 AA=
X-Change-ID: 20260126-kasan-fcd68f64cd7b
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_132231_829380_2ED977FC 
X-CRM114-Status: GOOD (  16.81  )
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

Hello,
this series aims to bring basic support for KASAN checks to BPF JITed
programs. This v2 drops the RFC prefix and brings many updates regarding
the topics and issues mentioned on the RFC or at LSFMMBPF. Thanks to
Ihor's update on CI, the instrumentation can now trigger properly in CI
as well.

"Traditional" KASAN allows to spot memory management mistakes by
reserving a fraction of memory as "shadow memory" that will map to the
rest of the memory and allow its monitoring. Each memory-accessing
instruction is then instrumented at build time to call some ASAN check
function, that will analyze the corresponding bits in shadow memory, and
if it detects the access as invalid, trigger a detailed report. The goal
of this series is to replicate this mechanism for BPF programs when they
are being JITed into native instructions: that's then the JIT compiler
that is in charge of inserting calls to the corresponding kasan checks,
when a program is being loaded into the kernel. This task involves:
- identifying at program load time the instructions performing memory
  accesses
- identifying those accesses properties (size ? read or write ?) to
  define the relevant kasan check function to call
- just before the identified instructions:
  - perform the basic context saving (ie: saving registers)
  - inserting a call to the relevant kasan check function
  - restore context
- whenever the instrumented program executes, if it performs an invalid
  access, it triggers a kasan report identical to those instrumented on
  kernel side at build time.

As discussed in [1], this series is based on some choices and
assumptions:
- it focuses on x86_64 for now, and so only on KASAN_GENERIC
- not all memory accessing BPF instructions are being instrumented:
  - it discards instructions accessing BPF program stack (already
    monitored by page guards)
  - it discards possibly faulting instructions, like BPF_PROBE_MEM or
    BPF_PROBE_ATOMIC insns

---
Changes in v2:
- declare asan functions as extern in JIT compiler rather than exposing
  them in kasan header
- invert stack-accessing instructions marking to make sure not to skip
  instructions that could end up accessing to-be-checked memory
- fix stack accesses marking when verifier patches instructions
- add best effort marking for cBPF
- add missing call depth accounting in jited instrumentation
- skip unused registers in kasan instrumentation save/restore
- remove faulty stack align in kasan instrumentation
- drop commit skipping some jit-related tests
- cover missing instructions: BPF_ST and atomics
- completely rework tests: directly tune shadow memory, increase
  coverage, do not consume kernel logs
- Link to v1: https://patch.msgid.link/20260413-kasan-v1-0-1a5831230821@bootlin.com

To: Alexei Starovoitov <ast@kernel.org>
To: Daniel Borkmann <daniel@iogearbox.net>
To: Andrii Nakryiko <andrii@kernel.org>
To: Martin KaFai Lau <martin.lau@linux.dev>
To: Eduard Zingerman <eddyz87@gmail.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: Song Liu <song@kernel.org>
To: Yonghong Song <yonghong.song@linux.dev>
To: Jiri Olsa <jolsa@kernel.org>
To: John Fastabend <john.fastabend@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
To: Ingo Molnar <mingo@redhat.com>
To: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@linux.intel.com>
To: x86@kernel.org
To: "H. Peter Anvin" <hpa@zytor.com>
To: Shuah Khan <shuah@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: ebpf@linuxfoundation.org
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org

---
Alexis Lothoré (eBPF Foundation) (8):
      bpf: mark instructions accessing program stack
      bpf: add BPF_JIT_KASAN for KASAN instrumentation of JITed programs
      bpf, x86: add helper to emit kasan checks in x86 JITed programs
      bpf, x86: refactor BPF_ST management in do_jit
      bpf, x86: emit KASAN checks into x86 JITed programs
      bpf, x86: enable KASAN for JITed programs on x86
      selftests/bpf: add helper to check whether eBPF KASAN is active
      selftests/bpf: add tests to validate KASAN on JIT programs

 arch/x86/Kconfig                                   |   1 +
 arch/x86/net/bpf_jit_comp.c                        | 209 +++++++++--
 include/linux/bpf.h                                |   2 +
 include/linux/bpf_verifier.h                       |   2 +
 kernel/bpf/Kconfig                                 |   9 +
 kernel/bpf/core.c                                  |  17 +
 kernel/bpf/fixups.c                                |  16 +-
 kernel/bpf/verifier.c                              |   9 +
 tools/testing/selftests/bpf/prog_tests/kasan.c     | 356 +++++++++++++++++++
 tools/testing/selftests/bpf/progs/kasan.c          | 382 +++++++++++++++++++++
 .../testing/selftests/bpf/test_kmods/bpf_testmod.c |  22 ++
 tools/testing/selftests/bpf/unpriv_helpers.c       |   5 +
 tools/testing/selftests/bpf/unpriv_helpers.h       |   1 +
 13 files changed, 994 insertions(+), 37 deletions(-)
---
base-commit: b1c85ee71e2ab9ed7a12d7f3ee38988509baa368
change-id: 20260126-kasan-fcd68f64cd7b

Best regards,
--  
Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>


