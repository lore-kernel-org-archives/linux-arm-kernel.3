Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FE6D5B86E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ejv9XSsvZ6giI0+GtPsAWhp3m8N70yN4ctXKuLRtz84=; b=gdwN27mRgQhuQura9YoLPwU8bJ
	o1waFOnxzhY3pn+7JrU1X7SHaPEw9PfcV73X4vh+MWE/U2xLnQYCNpHIlMQgYVZGylh+1AWuUqy/p
	HFrMMF0Ol2zJm8MfkC3hc5PcoFAtpDbB9gSMIuQU8NQ2ysER6n7bayf6IAUg8weg2zY2e82XaeU3A
	8ekQ63o8obW654j7zU9dkB9tVjO2bKTuxBNVpdxdiUfrb2l5RvC7vj0nTHe/z0ZylleFy65KMs6ie
	9IL5c0+21h4ktwCYXIph9FsaBpmITOD/OUM2TjpjEOh8ZY+v3nEyhuyjfJnUHmhzx3Mdf7ohty42P
	dPo3/pnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVFtb-00000004G45-028R;
	Mon, 15 Dec 2025 21:14:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVFtY-00000004G3d-2aDi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:14:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66C1040212;
	Mon, 15 Dec 2025 21:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE87C4CEF5;
	Mon, 15 Dec 2025 21:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765833255;
	bh=fgCax+1QA4JX7mjeSem02vMC6sFoOmpIV5v+inJBvVw=;
	h=From:To:Cc:Subject:Date:From;
	b=VigJ21rhzP/FEbMdr93dxQRxWkMroGdNKUClwePiv0lrZodOORaIuyezOniZ1cLqr
	 KfEllhAE6+k7E1F7DyK6ZUhm+ifuDl650Zju501qFqmqsKon8UgwPGyHVfv0dyt0Ym
	 dvihCSMt+yQJl0YOQAAVrmxG69T1YV1yMLjl+OdXZUf54Yg+21psAgYrigmbf9uVj7
	 unhngcKQzUJRxEzYJG4ggphqalKNXqhMdveMMCpBCO7c3cqt9eYCbY87cnvH8fA85G
	 ZhQ0X5fi9SUmCQcRnSoF/FCVlXxRG3mpimfnpcp0gX9J8Bu91wYEFqL+R4YGch5U3/
	 oSgc6cue7KhOw==
From: Jiri Olsa <jolsa@kernel.org>
To: Steven Rostedt <rostedt@kernel.org>,
	Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: [PATCHv5 bpf-next 0/9] ftrace,bpf: Use single direct ops for bpf trampolines
Date: Mon, 15 Dec 2025 22:13:53 +0100
Message-ID: <20251215211402.353056-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_131416_702986_2E4C2628 
X-CRM114-Status: GOOD (  14.89  )
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

hi,
while poking the multi-tracing interface I ended up with just one ftrace_ops
object to attach all trampolines.

This change allows to use less direct API calls during the attachment changes
in the future code, so in effect speeding up the attachment.

In current code we get a speed up from using just a single ftrace_ops object.

- with current code:

  Performance counter stats for 'bpftrace -e fentry:vmlinux:ksys_* {} -c true':

     6,364,157,902      cycles:k
       828,728,902      cycles:u
     1,064,803,824      instructions:u                   #    1.28  insn per cycle
    23,797,500,067      instructions:k                   #    3.74  insn per cycle

       4.416004987 seconds time elapsed

       0.164121000 seconds user
       1.289550000 seconds sys


- with the fix:

   Performance counter stats for 'bpftrace -e fentry:vmlinux:ksys_* {} -c true':

     6,535,857,905      cycles:k
       810,809,429      cycles:u
     1,064,594,027      instructions:u                   #    1.31  insn per cycle
    23,962,552,894      instructions:k                   #    3.67  insn per cycle

       1.666961239 seconds time elapsed

       0.157412000 seconds user
       1.283396000 seconds sys



The speedup seems to be related to the fact that with single ftrace_ops object
we don't call ftrace_shutdown anymore (we use ftrace_update_ops instead) and
we skip the synchronize rcu calls (each ~100ms) at the end of that function.

rfc: https://lore.kernel.org/bpf/20250729102813.1531457-1-jolsa@kernel.org/
v1:  https://lore.kernel.org/bpf/20250923215147.1571952-1-jolsa@kernel.org/
v2:  https://lore.kernel.org/bpf/20251113123750.2507435-1-jolsa@kernel.org/
v3:  https://lore.kernel.org/bpf/20251120212402.466524-1-jolsa@kernel.org/
v4:  https://lore.kernel.org/bpf/20251203082402.78816-1-jolsa@kernel.org/

v5 changes:
- do not export ftrace_hash object [Steven]
- fix update_ftrace_direct_add new_filter_hash leak [ci]

v4 changes:
- rebased on top of bpf-next/master (with jmp attach changes)
  added patch 1 to deal with that
- added extra checks for update_ftrace_direct_del/mod to address
  the ci bot review

v3 changes:
- rebased on top of bpf-next/master
- fixed update_ftrace_direct_del cleanup path
- added missing inline to update_ftrace_direct_* stubs

v2 changes:
- rebased on top fo bpf-next/master plus Song's livepatch fixes [1] 
- renamed the API functions [2] [Steven]
- do not export the new api [Steven]
- kept the original direct interface:

  I'm not sure if we want to melt both *_ftrace_direct and the new interface
  into single one. It's bit different in semantic (hence the name change as
  Steven suggested [2]) and I don't think the changes are not that big so
  we could easily keep both APIs.

v1 changes:
- make the change x86 specific, after discussing with Mark options for
  arm64 [Mark]

thanks,
jirka


[1] https://lore.kernel.org/bpf/20251027175023.1521602-1-song@kernel.org/
[2] https://lore.kernel.org/bpf/20250924050415.4aefcb91@batman.local.home/
---
Jiri Olsa (9):
      ftrace,bpf: Remove FTRACE_OPS_FL_JMP ftrace_ops flag
      ftrace: Make alloc_and_copy_ftrace_hash direct friendly
      ftrace: Export some of hash related functions
      ftrace: Add update_ftrace_direct_add function
      ftrace: Add update_ftrace_direct_del function
      ftrace: Add update_ftrace_direct_mod function
      bpf: Add trampoline ip hash table
      ftrace: Factor ftrace_ops ops_func interface
      bpf,x86: Use single ftrace_ops for direct calls

 arch/x86/Kconfig        |   1 +
 include/linux/bpf.h     |   7 ++-
 include/linux/ftrace.h  |  31 ++++++++++-
 kernel/bpf/trampoline.c | 234 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------
 kernel/trace/Kconfig    |   3 ++
 kernel/trace/ftrace.c   | 357 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------
 6 files changed, 560 insertions(+), 73 deletions(-)

