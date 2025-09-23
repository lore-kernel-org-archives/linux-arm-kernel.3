Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D460CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 21:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jaR+rIrkKHdtFyf5J8JSiCCCZ6+tXraI4jSBe7wwV40=; b=iCfL9mmUVEYN00R5CoXH/9NKD8
	5B1PVP83Si/Zw5HNiwwUQxLsbVcQZjXRTQzaXz6EVlO9fboU/xeESfmxf+ZGn5DjOwMwTO/TAaOTz
	mH2CRHDMbKBI03g8kxDgX5cvg6/v785DSXK6sryfkPi+AY1M9eSgPnYMwKBeTdWpD8PS7hPygRUYU
	q4yOGmB/Xmnt693tRaXooBzW73YrxFB/ZEQsOaUiqtxA1wsVBIYJlAu2aISLjVS1brFIHqXJWOFxW
	QF+NasMII+dpzYmvAcQEjU7U56a9A5fiPSRtoZF/PF8rxtuuTVyh7+lPezgUKiNsq8yjASpk/+BC5
	XTcHDI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1AvY-0000000F0ig-3e1k;
	Tue, 23 Sep 2025 21:52:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1AvX-0000000F0hj-2kRw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 21:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA9996028C;
	Tue, 23 Sep 2025 21:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17100C4CEF5;
	Tue, 23 Sep 2025 21:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758664318;
	bh=p2j7MDsIv5UEmLCpN5Vf/Kx8rWPcuDGKJUfRsR6Fgkg=;
	h=From:To:Cc:Subject:Date:From;
	b=Gz0GSTbB02KXVz5VBCKMOLCJc+mR5coG9Hi1m9fmyC0VshtTZnnTWoKpWSv8a5hAb
	 9Gdcds0jdc9fdeD5raXVOl21kwSXZOHzMVE10slAMpd7mTs6y8B5EjVaodfFL+lK6J
	 1c3vjMF2SPnDu9Is7KyOrZniH2/ixR8lthGpguoigVXiB6M8K/Ln+grYzZ0uDoMd2C
	 Up0ippNga6koLTUJiFK6iASoV8F92hsOGRnjtKfojAzUs734K2wYwXZikPMSmW2vuj
	 dP07UlmnrAzSh89p9PAEKpc0HnrEg6kEzsNm65MAZQUM3OTS7FS0rfqJTeSlp9YdeC
	 jsmLp4WylgRrw==
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
	Menglong Dong <menglong8.dong@gmail.com>
Subject: [PATCH 0/9] ftrace,bpf: Use single direct ops for bpf trampolines
Date: Tue, 23 Sep 2025 23:51:38 +0200
Message-ID: <20250923215147.1571952-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
I got following speed up when measuring simple attach/detach 300 times [1].

- with current code:

  perf stat -e cycles:k,cycles:u,instructions:u,instructions:k -- ./test_progs -t krava -w0
  #158     krava:OK
  Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

  Performance counter stats for './test_progs -t krava -w0':

     12,003,420,519      cycles:k                                                       
         63,239,794      cycles:u                                                       
        102,155,625      instructions:u                   #    1.62  insn per cycle     
     11,614,183,764      instructions:k                   #    0.97  insn per cycle     

       35.448142362 seconds time elapsed

        0.011032000 seconds user
        2.478243000 seconds sys


- with the fix:

  perf stat -e cycles:k,cycles:u,instructions:u,instructions:k -- ./test_progs -t krava -w0
  #158     krava:OK
  Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED

  Performance counter stats for './test_progs -t krava -w0':

     14,327,218,656      cycles:k                                                       
         46,285,275      cycles:u                                                       
        102,125,592      instructions:u                   #    2.21  insn per cycle     
     14,620,692,457      instructions:k                   #    1.02  insn per cycle     

        2.860883990 seconds time elapsed

        0.009884000 seconds user
        2.777032000 seconds sys


The speedup seems to be related to the fact that with single ftrace_ops object
we don't call ftrace_shutdown anymore (we use ftrace_update_ops instead) and
we skip the 300 synchronize rcu calls (each ~100ms) at the end of that function.

v1 changes:
- make the change x86 specific, after discussing with Mark options for
  arm64 [Mark]

thanks,
jirka


[1] https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?h=test&id=1b7fc74c36a93e90816f58c37a84522f0949095a
---
Jiri Olsa (9):
      ftrace: Make alloc_and_copy_ftrace_hash direct friendly
      ftrace: Add register_ftrace_direct_hash function
      ftrace: Add unregister_ftrace_direct_hash function
      ftrace: Add modify_ftrace_direct_hash function
      ftrace: Export some of hash related functions
      ftrace: Use direct hash interface in direct functions
      bpf: Add trampoline ip hash table
      ftrace: Factor ftrace_ops ops_func interface
      bpf, x86: Use single ftrace_ops for direct calls

 arch/x86/Kconfig              |   1 +
 include/linux/bpf.h           |   7 +-
 include/linux/ftrace.h        |  48 ++++++++++---
 kernel/bpf/trampoline.c       | 128 +++++++++++++++++++++++++--------
 kernel/trace/Kconfig          |   3 +
 kernel/trace/ftrace.c         | 477 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------------
 kernel/trace/trace.h          |   8 ---
 kernel/trace/trace_selftest.c |   5 +-
 8 files changed, 447 insertions(+), 230 deletions(-)

