Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1EDF531C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8wwTbqAk1/v1m7wW2LqSmKK5iRKdfUxdCX7mcszWNIw=; b=dS7RdEwl1BhHem
	Q621PZ9YKZehyuGwxQafnabPrXwgz3uLTzzWrwX2ULp3IXq1VkmtFxVhKw3fR4Y3muctPxhSsEpHc
	Niw6kuLaPIYCzxKJlu8w0mNOpwX/ZmdjDoRfmfT+4C+sT5EbeegdoXAaQcKVGULXI/uimGmB5eFdk
	Cmun0zYo8KLMNDqe9/iB8Jsx2m3J6knTHdp7fbbo8NzckPggPeziogyBkJXFgLea7KojHvWqmBs0C
	dqglBZ4HHfnUa3g4tIH56XBAjBVZOhiBQ7va4bppL+w35K6f/tERo3HEHkud4kZ3+jetGR9Bp/QqQ
	Nlm1/8huLGqX+teKpEbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM1y-0000000GC3M-3hUu;
	Mon, 13 Apr 2026 18:29:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM1v-0000000GC1v-0YB1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:29:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 64B3C1A31EE;
	Mon, 13 Apr 2026 18:28:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 24AAB5FFB9;
	Mon, 13 Apr 2026 18:28:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57AC3104504B7;
	Mon, 13 Apr 2026 20:28:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776104935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=8wwTbqAk1/v1m7wW2LqSmKK5iRKdfUxdCX7mcszWNIw=;
	b=A6txoxr1XcmG6tEbbCTyhur5lWgPF7QbN2kOqQ54tYUX88h9fiDrus4Hjzv6K1aTBvZ2CO
	bjdVtAPCZTUuxgjc6RPvbXX0F56K9Ade5XwS7muo/TOF1Tvpmck0wAWs4AVubunqSm+Ndd
	6f01OPXyrIg/4lsYV6IK/RMy3MjbBTauAl1B50TjTV2IxPVcJuSQrO4S+u7TZwMR/mU033
	FVILOV9EtBmoXp1r76CWS2aoAmzpBnQyc2Izig6DLjirZ630fRVBYFhCLMDQGNkhc32w4F
	Q3k01keahidyZQVCTHur9l743MSGM6UBhfKfPB0DM8ZaeCot7DW4hlmohhjJyw==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Subject: [PATCH RFC bpf-next 0/8] bpf: add support for KASAN checks in
 JITed programs
Date: Mon, 13 Apr 2026 20:28:40 +0200
Message-Id: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMz3ezE4sQ83bTkFDOLNDOT5BTzJCWg2oKi1LTMCrA50UpBbs4gsaS
 CNN281IoSpdjaWgCGQM1aaAAAAA==
X-Change-ID: 20260126-kasan-fcd68f64cd7b
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com, 
 linux-mm@kvack.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_112903_438657_710285B3 
X-CRM114-Status: GOOD (  18.55  )
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
programs. This follows the first RFC posted in [1].

KASAN allows to spot memory management mistakes by reserving a fraction
of memory as "shadow memory" that will map to the rest of the memory and
allow its monitoring. Each memory-accessing instruction is then
instrumented at build time to call some ASAN check function, that will
analyze the corresponding bits in shadow memory, and if it detects the
access as invalid, trigger a detailed report. The goal of this series is
to replicate this mechanism for BPF programs when they are being JITed
into native instructions: that's then the (runtime) JIT compiler who is
in charge of inserting calls to the corresponding kasan checks, when a
program is being loaded into the kernel. This task involves:
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
  - it focuses on STX/LDX instructions
  - it discards instructions accessing BPF program stack (already
    monitored by page guards)
  - it discards possibly faulting instructions, like BPF_PROBE_MEM or
    BPF_PROBE_ATOMIC insns

The series is marked and sent as RFC:
- to allow collecting feedback early and make sure that it goes into the
  right direction
- because it depends on Xu's work to pass data between the verifier and
  JIT compilers. This work is not merged yet, see [2]. I have been
  tracking the various revisions he sent on the ML and based my local
  branch on his work
- because tests brought by this series currently can't run on BPF CI:
  they expect kasan multishot to be enabled, otherwise the first test
  will make all other kasan-related tests fail.
- because some cases like atomic loads/stores are not instrumented yet
  (and are still making me scratch my head)
- because it will hopefully provide a good basis to discuss the topic at
  LSFMMBPF (see [3])

Despite this series not being ready for integration yet, anyone
interested in running it locally can perform the following steps to run
the JITed KASAN instrumentation selftests:
- rebasing locally this series on [2]
- building and running the corresponding kernel with kasan_multi_shot
  enabled
- running `test_progs -a kasan`

And should get a variety of KASAN tests executed for BPF programs:

  #162/1   kasan/bpf_kasan_uaf_read_1:OK
  #162/2   kasan/bpf_kasan_uaf_read_2:OK
  #162/3   kasan/bpf_kasan_uaf_read_4:OK
  #162/4   kasan/bpf_kasan_uaf_read_8:OK
  #162/5   kasan/bpf_kasan_uaf_write_1:OK
  #162/6   kasan/bpf_kasan_uaf_write_2:OK
  #162/7   kasan/bpf_kasan_uaf_write_4:OK
  #162/8   kasan/bpf_kasan_uaf_write_8:OK
  #162/9   kasan/bpf_kasan_oob_read_1:OK
  #162/10  kasan/bpf_kasan_oob_read_2:OK
  #162/11  kasan/bpf_kasan_oob_read_4:OK
  #162/12  kasan/bpf_kasan_oob_read_8:OK
  #162/13  kasan/bpf_kasan_oob_write_1:OK
  #162/14  kasan/bpf_kasan_oob_write_2:OK
  #162/15  kasan/bpf_kasan_oob_write_4:OK
  #162/16  kasan/bpf_kasan_oob_write_8:OK
  #162     kasan:OK
  Summary: 1/16 PASSED, 0 SKIPPED, 0 FAILED

[1] https://lore.kernel.org/bpf/DG7UG112AVBC.JKYISDTAM30T@bootlin.com/
[2] https://lore.kernel.org/bpf/cover.1776062885.git.xukuohai@hotmail.com/
[3] https://lore.kernel.org/bpf/DGGNCXX79H8O.2P6K8L1QW1M8K@bootlin.com/

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
Alexis Lothoré (eBPF Foundation) (8):
      kasan: expose generic kasan helpers
      bpf: mark instructions accessing program stack
      bpf: add BPF_JIT_KASAN for KASAN instrumentation of JITed programs
      bpf, x86: add helper to emit kasan checks in x86 JITed programs
      bpf, x86: emit KASAN checks into x86 JITed programs
      selftests/bpf: do not run verifier JIT tests when BPF_JIT_KASAN is enabled
      bpf, x86: enable KASAN for JITed programs on x86
      selftests/bpf: add tests to validate KASAN on JIT programs

 arch/x86/Kconfig                                   |   1 +
 arch/x86/net/bpf_jit_comp.c                        | 106 +++++++++++++
 include/linux/bpf.h                                |   2 +
 include/linux/bpf_verifier.h                       |   2 +
 include/linux/kasan.h                              |  13 ++
 kernel/bpf/Kconfig                                 |   9 ++
 kernel/bpf/core.c                                  |  10 ++
 kernel/bpf/verifier.c                              |   7 +
 mm/kasan/kasan.h                                   |  10 --
 tools/testing/selftests/bpf/prog_tests/kasan.c     | 165 +++++++++++++++++++++
 tools/testing/selftests/bpf/progs/kasan.c          | 146 ++++++++++++++++++
 .../testing/selftests/bpf/test_kmods/bpf_testmod.c |  79 ++++++++++
 tools/testing/selftests/bpf/test_loader.c          |   5 +
 tools/testing/selftests/bpf/unpriv_helpers.c       |   5 +
 tools/testing/selftests/bpf/unpriv_helpers.h       |   1 +
 15 files changed, 551 insertions(+), 10 deletions(-)
---
base-commit: 7990a071b32887a1a883952e8cf60134b6d6fea0
change-id: 20260126-kasan-fcd68f64cd7b

Best regards,
--  
Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>


