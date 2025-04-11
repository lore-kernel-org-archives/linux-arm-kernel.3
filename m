Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B38CC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 20:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bCzKT+ja9Qq6jhqeVqHO2ah17zHLv4bpeMBebgEjtos=; b=WeGN0oLECthhLJ
	PirXe5/to5PHn1OvWIIdNUmRsdid2yAQ7qEkwnGwNAsu4AA9IA7VVe1u5Y5EXN0FjrTrhIz7WGlRw
	tcp4geH69XmWPNtCa/fYjOkH7fjgu/LgZwsEaLIeCN5QiC1bRi+yAiqpuO61oIgJpBuwTspaOyqIt
	Lp+kYmAS2EGAIOZvhHIaqOVJOlkshiKKtRjEz6DU8L3lAmhKKh5+yGwOzwxyGMIUTvF5aB+xPMaYH
	7hfbVW4ZS8I0WvfoIuUnXvw7zxg7bbeFz1M4CLH2Tu8Lrzyk8KqK5IcnuPjiVvwmy49pIZxha15FZ
	orkzxs6EhtFpva+tcl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3L4s-0000000EpPR-0Dr3;
	Fri, 11 Apr 2025 20:34:18 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3L31-0000000Ep8E-1lEf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 20:32:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BC81439EA;
	Fri, 11 Apr 2025 20:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744403539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bCzKT+ja9Qq6jhqeVqHO2ah17zHLv4bpeMBebgEjtos=;
	b=oPx3ze9zCh1zd9PRfVvpKm6NNY5fsFrG+z93cd9OPNCnCduaa1P+BOncqHqxpgYddOh2Rx
	zpjdUEqZk4PvDyOpeGvTMZOLbiV3EyKYyG123nYkM5wShB6d9H2a8TCrbTQN/XhYAmxlG1
	V9kKHS1kpAU4lSvacr5hJC2SRYVPqzQjyPXcFWWaGoGsfzNLj2hY/YjtOAEGLFijGO68eZ
	bkqd1qgSJJ6hcGvTpkou6fDP7rm3NBYSwrZ5lCwRtUtAECVnwtpEAyOWP4tBMXGQLxYUrP
	1lM5L+DzV7A3ltBe+iAluzS6CPPf2ud27oiPUvOg5R0DYuF0L9x5eI7Ymm+eJQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Subject: [PATCH RFC bpf-next 0/4] bpf, arm64: support up to 12 arguments
Date: Fri, 11 Apr 2025 22:32:09 +0200
Message-Id: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEl8+WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyMD3dzEvMr4xKL0YiCRa2aia5GUYmxuYp5qZmlioQTUVVCUmpZZATY
 xWinIzRkkllSQppuXWlGiFFtbCwADCrVOcgAAAA==
X-Change-ID: 20250220-many_args_arm64-8bd3747e6948
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Florent Revest <revest@chromium.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 ebpf@linuxfoundation.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>, 
 Xu Kuohai <xukuohai@huawei.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddvjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhorucdlvgeurffhucfhohhunhgurghtihhonhdmuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhtdeggfdvkedvgfejhfefffejkeetffduudffgeekveduffefkeeuuefgueffveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthhhusgdrtghomhdplhhinhhugigsrghsvgdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtohepshgufhesfhhomhhitghhvghvrdhmvgdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidru
 ggvvhdprhgtphhtthhopeiguhhkuhhohhgriheshhhurgifvghitghlohhuugdrtghomhdprhgtphhtthhopehjohhlshgrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmhihkohhlrghlsehfsgdrtghomhdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_133223_918301_4FD0CF60 
X-CRM114-Status: GOOD (  20.84  )
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

this series is a revival of Xu Kuhoai's work to enable larger arguments
count for BPF programs on ARM64 ([1]). His initial series received some
positive feedback, but lacked some specific case handling around
arguments alignment (see AAPCS64 C.14 rule in section 6.8.2, [2]). There
as been another attempt from Puranjay Mohan, which was unfortunately
missing the same thing ([3]).  Since there has been some time between
those series and this new one, I chose to send it as a new series
rather than a new revision of the existing series.

To support the increased argument counts and arguments larger than
registers size (eg: structures), the trampoline does the following:
- for bpf  programs: arguments are retrieved from both registers and the
  function stack, and pushed in the trampoline stack as an array of u64
  to generate the programs context. It is then passed by pointer to the
  bpf programs
- when the trampoline is in charge of calling the original function: it
  restores the registers content, and generates a new stack layout for
  the additional arguments that do not fit in registers.

This new attempt is based on Xu's series and aims to handle the
missing alignment concern raised in the reviews discussions. The main
novelties are then around arguments alignments:
- the first commit is exposing some new info in the BTF function model
  passed to the JIT compiler to allow it to deduce the needed alignment
  when configuring the trampoline stack
- the second commit is taken from Xu's series, and received the
  following modifications:
  - the calc_aux_args computes an expected alignment for each argument
  - the calc_aux_args computes two different stack space sizes: the one
    needed to store the bpf programs context, and the original function
    stacked arguments (which needs alignment). Those stack sizes are in
    bytes instead of "slots"
  - when saving/restoring arguments for bpf program or for the original
    function, make sure to align the load/store accordingly, when
    relevant
  - a few typos fixes and some rewording, raised by the review on the
    original series
- the last commit introduces some explicit tests that ensure that the
  needed alignment is enforced by the trampoline

I marked the series as RFC because it appears that the new tests trigger
some failures in CI on x86 and s390, despite the series not touching any
code related to those architectures. Some very early investigation/gdb
debugging on the x86 side seems to hint that it could be related to the
same missing alignment too (based on section 3.2.3 in [4], and so the
x86 trampoline would need the same alignment handling ?). For s390 it
looks less clear, as all values captured from the bpf test program are
set to 0 in the CI output, and I don't have the proper setup yet to
check the low level details.  I am tempted to isolate those new tests
(which were actually useful to spot real issues while tuning the ARM64
trampoline) and add them to the relevant DENYLIST files for x86/s390,
but I guess this is not the right direction, so I would gladly take a
second opinion on this.

[1] https://lore.kernel.org/all/20230917150752.69612-1-xukuohai@huaweicloud.com/#t
[2] https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst#id82
[3] https://lore.kernel.org/bpf/20240705125336.46820-1-puranjay@kernel.org/
[4] https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
Alexis Lothoré (eBPF Foundation) (3):
      bpf: add struct largest member size in func model
      bpf/selftests: add tests to validate proper arguments alignment on ARM64
      bpf/selftests: enable tracing tests for ARM64

Xu Kuohai (1):
      bpf, arm64: Support up to 12 function arguments

 arch/arm64/net/bpf_jit_comp.c                      | 235 ++++++++++++++++-----
 include/linux/bpf.h                                |   1 +
 kernel/bpf/btf.c                                   |  25 +++
 tools/testing/selftests/bpf/DENYLIST.aarch64       |   3 -
 .../selftests/bpf/prog_tests/tracing_struct.c      |  23 ++
 tools/testing/selftests/bpf/progs/tracing_struct.c |  10 +-
 .../selftests/bpf/progs/tracing_struct_many_args.c |  67 ++++++
 .../testing/selftests/bpf/test_kmods/bpf_testmod.c |  50 +++++
 8 files changed, 357 insertions(+), 57 deletions(-)
---
base-commit: 91e7eb701b4bc389e7ddfd80ef6e82d1a6d2d368
change-id: 20250220-many_args_arm64-8bd3747e6948

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


