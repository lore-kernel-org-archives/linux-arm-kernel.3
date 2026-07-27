Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF309C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7tHghUuh4abL0fwwnOGlOayUFDXuWG+n5PvNG2j5QBw=; b=vww9Aq53hDEDh1Ffn/wYLQtu6R
	bC5ydd7iAvFGirijS/KEVZARAkSm0bVv1gyTi0xqUgu516h4+Mz33c7QupR9H4Ql+rSI7HSsq+4/1
	qEA9duQL288mW7GsW4wdb2tEPjF7JVaaTTPIy3mFQ/LgntD3SrIJl3R3aZ8agup5AQQFhek8Y3yuh
	gXuzcD3qEGheVHx7guiJjL8OAqIggd5MZy8vl1TvTPF27/iCgzHohzBrfYumBWoftGuTwYALBVd1u
	zzN/cb9lP9NneTl2qICOAbwZWLAecF3f2heSiR9OGb0x+Idh1fp2XGGx/t/DhVtOl0uxTHQO9he2D
	cF/7WdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMKz-00000002zhV-1weM;
	Mon, 27 Jul 2026 14:29:49 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMKv-00000002zfs-3v9w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:29:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785162579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7tHghUuh4abL0fwwnOGlOayUFDXuWG+n5PvNG2j5QBw=;
	b=g3M+DqJkQz7oVE7zYcnCb3KUfo0PuPSR/Dp6zubbXXsm8bnX9toxZx/W8oEBBSpY8cvZdP
	Zkf0hJ/aJ/hY+gSQS39O/06Y3kgBfy3kLsFuLTSuVMyoRmnweLX7hJfdqk0ScnsFARuor1
	croZ7gE4Yzs+dCd/ZRysqs8/yibw01o=
From: Leon Hwang <leon.hwang@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/2] arm64: ftrace: enable single ftrace_ops for direct calls
Date: Mon, 27 Jul 2026 22:28:42 +0800
Message-ID: <20260727142844.21212-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_072946_117706_CC1DEB59 
X-CRM114-Status: UNSURE (   6.72  )
X-CRM114-Notice: Please train this message.
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

Beyond the DIRECT_CALLS support on arm64 [1], select
HAVE_SINGLE_FTRACE_DIRECT_OPS for arm64, which enables the BPF
tracing_multi link on arm64 [2].

All tracing_multi link selftests are passed on arm64.

 cd tools/testing/selftests/bpf
 ./test_progs -a 'tracing_multi_*'
 #545/1   tracing_multi_attach_rollback/put:OK
 #545/2   tracing_multi_attach_rollback/unlink:OK
 #545     tracing_multi_attach_rollback:OK
 #546     tracing_multi_bench_attach:OK
 #547/1   tracing_multi_test/skel_api:OK
 #547/2   tracing_multi_test/link_api_pattern:OK
 #547/3   tracing_multi_test/link_api_ids:OK
 #547/4   tracing_multi_test/module_skel_api:OK
 #547/5   tracing_multi_test/module_link_api_pattern:OK
 #547/6   tracing_multi_test/module_link_api_ids:OK
 #547/7   tracing_multi_test/intersect:OK
 #547/8   tracing_multi_test/cookies:OK
 #547/9   tracing_multi_test/session:OK
 #547/10  tracing_multi_test/attach_api_fails:OK
 #547/11  tracing_multi_test/fentry_direct_access:OK
 #547/12  tracing_multi_test/fexit_direct_access:OK
 #547/13  tracing_multi_test/fsession_direct_access:OK
 #547/14  tracing_multi_test/fentry_after_multi:OK
 #547     tracing_multi_test:OK
 Summary: 3/16 PASSED, 0 SKIPPED, 0 FAILED

 ./test_progs -a 'fill_link_info/tracing_multi_*'
 #132/11  fill_link_info/tracing_multi_link_info:OK
 #132/12  fill_link_info/tracing_multi_invalid_ubuff:OK
 #132     fill_link_info:OK
 Summary: 1/2 PASSED, 0 SKIPPED, 0 FAILED

Links:
[1] https://lore.kernel.org/all/20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev/
[2] https://github.com/kernel-patches/bpf/pull/12986

Leon Hwang (2):
  arm64: ftrace: enable single ftrace_ops for direct calls
  selftests/bpf: Enable tracing_multi tests on arm64

 arch/arm64/Kconfig                                     | 2 ++
 arch/arm64/kernel/ftrace.c                             | 3 +--
 tools/testing/selftests/bpf/prog_tests/tracing_multi.c | 9 +++++++--
 tools/testing/selftests/bpf/test_progs.h               | 6 ++++++
 4 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.55.0


