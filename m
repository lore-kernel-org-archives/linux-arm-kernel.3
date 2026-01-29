Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6036DD6B07A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ctcQwPUhn/CREyCgaiX/XAgOXE8OMZeTnRPpvn+cap4=; b=gFtMS7w07ygHbMV4ItQx67G948
	b3BK0XNM+vlQdvFS8Vs3ZxI8M6Jx5vIyLgzfJCKYWH+g73EUSCAs8mqAPWh271Oegb6+Fo9vegKeh
	5ghfm0xK5CZeM27Y03ZH1Jz3BFua4OJJPFKB7kf0m1S9mVYcil9AZ8Lz7kyDcPD+/w3e5k5nKmIOc
	PKK30GE6eVyiBa9X9JZbyppJtWlEdDyBwD2nMhOxALUl/ocN4UIw9xfnl0LZSudiDbz5uGQKUyDv5
	wrfJcNuwNsnLU70RoOkiAWUoqIjgaYNGH0m467bz2UuMXYLo7RHGNpfx3loY1xYEahPdBhkj3GjGa
	/hDZDOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUIq-00000000IMP-3wWr;
	Thu, 29 Jan 2026 15:51:28 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUIm-00000000IM5-3Hy2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 15:51:27 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769701879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ctcQwPUhn/CREyCgaiX/XAgOXE8OMZeTnRPpvn+cap4=;
	b=KzP36po8UqEg9VMmawwQF6A37EPdHBRGn3LJLrA/7uop7MwuIh3oPAbeSkS7/g3a9z9a3E
	292g6Bj9vKAGW0s2XVwOgiR6IEOHtjDYF5jyB+DL7TrldX32oIB9PR79lLhXFn0rB1KdAO
	dc7L/9fOu4AKUbMXkIqGfh4+V9w/Qog=
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-patches-bot@fb.com
Subject: [PATCH bpf-next v4 0/3] bpf, arm64: Add fsession support
Date: Thu, 29 Jan 2026 23:49:50 +0800
Message-ID: <20260129154953.66915-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_075125_753893_D805834A 
X-CRM114-Status: UNSURE (   8.21  )
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

Similar to commit 98770bd4e6df ("bpf,x86: add fsession support for x86_64"),
add fsession support on arm64.

Patch #1 adds bpf_jit_supports_fsession() to prevent fsession loading
on architectures that do not implement fsession support.

Patch #2 implements fsession support in the arm64 BPF JIT trampoline.

Patch #3 enables the relevant selftests on arm64, including get_func_ip,
and get_func_args.

All enabled tests pass on arm64:

 cd tools/testing/selftests/bpf
 ./test_progs -t fsession
 #135/1   fsession_test/fsession_test:OK
 #135/2   fsession_test/fsession_reattach:OK
 #135/3   fsession_test/fsession_cookie:OK
 #135     fsession_test:OK
 Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED

 ./test_progs -t get_func
 #138     get_func_args_test:OK
 #139     get_func_ip_test:OK
 Summary: 2/0 PASSED, 0 SKIPPED, 0 FAILED

Changes:
v3 -> v4:
* Add a log when !bpf_jit_supports_fsession() in patch #1 (per AI).
* v3: https://lore.kernel.org/bpf/20260129142536.48637-1-leon.hwang@linux.dev/

v2 -> v3:
* Fix typo in subject and patch message of patch #1 (per AI and Chris).
* Collect Acked-by, and Tested-by from Puranjay, thanks.
* v2: https://lore.kernel.org/bpf/20260128150112.8873-1-leon.hwang@linux.dev/

v1 -> v2:
* Add bpf_jit_supports_fsession().
* v1: https://lore.kernel.org/bpf/20260127163344.92819-1-leon.hwang@linux.dev/

Leon Hwang (3):
  bpf: Add bpf_jit_supports_fsession()
  bpf, arm64: Add fsession support
  selftests/bpf: Enable get_func_args and get_func_ip tests on arm64

 arch/arm64/net/bpf_jit_comp.c                 | 71 ++++++++++++++++---
 arch/x86/net/bpf_jit_comp.c                   |  5 ++
 include/linux/bpf.h                           |  7 +-
 include/linux/filter.h                        |  1 +
 kernel/bpf/core.c                             |  5 ++
 kernel/bpf/verifier.c                         |  5 ++
 .../selftests/bpf/prog_tests/fsession_test.c  | 32 ++++++---
 .../selftests/bpf/progs/get_func_args_test.c  |  2 +-
 .../selftests/bpf/progs/get_func_ip_test.c    |  2 +-
 9 files changed, 110 insertions(+), 20 deletions(-)

--
2.52.0


