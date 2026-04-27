Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631DFFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 23:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E/KEMjV1z3PRPAKFC2KKNiLmeHYb/k7znwRdijdHRR4=; b=o1WkXa5avdYEuXec7xb2B64qz3
	+vrgS3DEDQAPFZ5pM2JPXemRmM7dd9KPrhOfjTMuO/qalvAPJgvyqfaBVKbV6c/kP2fhkBLOdeOv9
	QF2jTJOzPWJ1q+gtKRmdFjlkxZp/D9vukaQWrbkAc1x8PzLhGhW4OxW1QMN6jWQsOqlCUtN67e4pm
	yi6NG+x5nbaHcysTDNIACybAaJSCcWFWSoUDzthaLUlS0n37tKK1R4IbX/TJ22BYS8yeHVCL49AAa
	h0sdaJmZqI5W3ve0QYySzFJ0BlaQeVSY9PkekkVIyEjawBlvGTU8ftggrMsTQxGrrlw2/8qhgSEAe
	lrGA7osg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVgb-00000000J08-075L;
	Mon, 27 Apr 2026 23:48:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVgY-00000000Izk-2rTW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 23:48:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 764CF40B17;
	Mon, 27 Apr 2026 23:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E12C19425;
	Mon, 27 Apr 2026 23:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777333697;
	bh=7ZSjU9xPABO0VNkykQD6IzSg9ytkyuoyVc1vl27bXqE=;
	h=From:To:Cc:Subject:Date:From;
	b=ThF7ufNwWp1cmKMAQPbt5+cMVRyiGgAtySqzTmrOmrqGfjFhXYa8pxDwFOcCE/Rx5
	 UJm8lP4HEcvGmXvOWJPcsPDLvKqe4AVhaQp6POQVzhKve8fJEDVg5CNTmxtXnQO3fN
	 MKADrvJJrYcGYeXhyor41pNLnaYsaTEXyZDD8DbxgK7lpKcqrmWdRRgX+HXfvptRhV
	 stRFTWuMQqEy2eW6TYpbF6ojLAX1IbDlEG1MxHwQ2Cc865D+oZVrkemCmgkzd4vno4
	 xyX0Ai0OkoC575bQRRYmhu6vePlkaQ3cACp8B3p23cZJup/SynSOp9GWUzBnbt0WkQ
	 4sZ53u21bRDSw==
From: Puranjay Mohan <puranjay@kernel.org>
To: bpf@vger.kernel.org,
	"Yonghong Song" <yonghong.song@linux.dev>
Cc: Puranjay Mohan <puranjay@kernel.org>,
	"Alexei Starovoitov" <ast@kernel.org>,
	"Daniel Borkmann" <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	"Martin KaFai Lau" <martin.lau@linux.dev>,
	"Eduard Zingerman" <eddyz87@gmail.com>,
	"Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
	"Song Liu" <song@kernel.org>,
	"Xu Kuohai" <xukuohai@huaweicloud.com>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH bpf-next v2 0/3] bpf, arm64: Support stack arguments
Date: Mon, 27 Apr 2026 16:47:57 -0700
Message-ID: <20260427234801.2104511-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_164818_771633_1F040B1E 
X-CRM114-Status: GOOD (  10.65  )
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

Hi Yonghong,

Please take these three patches into your next version of the stack
arguments support. I have fixed the arm64 support patch so it works
correctly with private stack.

Changelog:
v1: https://lore.kernel.org/all/20260420153603.4097618-1-puranjay@kernel.org/
Changes in v2:
- Don't add ctx->stack_arg_size to off_adj when private stack is used. (bot+bpf-ci@kernel.org)

This set add support of stack arguments to the arm64 JIT based on the
preparatory work and x86 support in [1]. Arm64 allows passing 8
arguments in registers x0-x7 and remaining ones on stack. Currently, BPF
supports passing 5 arguments all of which map to x0-x4.

BPF passes arguments in R1-R5 which map to x0-x4 on arm64, BPF reg R0 is
mapped to arm64 reg x7, but as arm64 needs this register to pass
arguments now, the first patch changes the mapping of BPF reg R0 to x8
which allows passing arguments in x0-x7 (8 arguments). 9+ arguments are
passed on the stack.

All selftest pass:

  ./test_progs -t stack_arg,stack_arg_fail,stack_arg_kfunc,verifier_stack_arg
  #431/1   stack_arg/global_many_args:OK
  #431/2   stack_arg/async_cb_many_args:OK
  #431/3   stack_arg/bpf2bpf:OK
  #431/4   stack_arg/kfunc:OK
  #431     stack_arg:OK
  #432/1   stack_arg_fail/test_stack_arg_big:OK
  #432/2   stack_arg_fail/r11 in ALU instruction:OK
  #432/3   stack_arg_fail/r11 store with non-DW size:OK
  #432/4   stack_arg_fail/r11 store with unaligned offset:OK
  #432/5   stack_arg_fail/r11 store with positive offset:OK
  #432/6   stack_arg_fail/r11 load with negative offset:OK
  #432/7   stack_arg_fail/r11 load with non-DW size:OK
  #432/8   stack_arg_fail/r11 store with zero offset:OK
  #432     stack_arg_fail:OK
  #631/1   verifier_stack_arg/stack_arg: subprog with 6 args:OK
  #631/2   verifier_stack_arg/stack_arg: two subprogs with >5 args:OK
  #631/3   verifier_stack_arg/stack_arg: read from uninitialized stack arg slot:OK
  #631/4   verifier_stack_arg/stack_arg: gap at offset -8, only wrote -16:OK
  #631/5   verifier_stack_arg/stack_arg: pruning with different stack arg types:OK
  #631/6   verifier_stack_arg/stack_arg: release_reference invalidates stack arg slot:OK
  #631/7   verifier_stack_arg/stack_arg: pkt pointer in stack arg slot invalidated after pull_data:OK
  #631/8   verifier_stack_arg/stack_arg: null propagation rejects deref on null branch:OK
  #631/9   verifier_stack_arg/stack_arg: missing store on one branch:OK
  #631/10  verifier_stack_arg/stack_arg: share a store for both branches:OK
  #631/11  verifier_stack_arg/stack_arg: write beyond max outgoing depth:OK
  #631/12  verifier_stack_arg/stack_arg: sequential calls reuse slots:OK
  #631     verifier_stack_arg:OK
  Summary: 3/24 PASSED, 0 SKIPPED, 0 FAILED

Puranjay Mohan (3):
  bpf, arm64: Map BPF_REG_0 to x8 instead of x7
  bpf, arm64: Add JIT support for stack arguments
  selftests/bpf: Enable stack argument tests for arm64

 arch/arm64/net/bpf_jit_comp.c                 | 91 ++++++++++++++++++-
 arch/arm64/net/bpf_timed_may_goto.S           |  8 +-
 .../bpf/progs/btf__stack_arg_precision.c      |  3 +-
 tools/testing/selftests/bpf/progs/stack_arg.c |  3 +-
 .../selftests/bpf/progs/stack_arg_kfunc.c     |  3 +-
 .../selftests/bpf/progs/stack_arg_precision.c |  3 +-
 .../selftests/bpf/progs/verifier_jit_inline.c |  2 +-
 .../selftests/bpf/progs/verifier_ldsx.c       |  6 +-
 .../bpf/progs/verifier_private_stack.c        | 10 +-
 .../selftests/bpf/progs/verifier_stack_arg.c  |  3 +-
 10 files changed, 111 insertions(+), 21 deletions(-)

-- 
2.52.0


