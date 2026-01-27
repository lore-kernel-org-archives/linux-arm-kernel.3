Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2B3D340A6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qVzkEJu0rwGv9GhSscFNxi7pazkxC01AqWhJ4PtbAR8=; b=Hd6wWxeYjw4PoKiXjH6ysqKEPv
	bRNE+ufFI6OydsKKJ2QLnUWI1NL9nkGbkL2VBCKuSeM2TB91jbiPV3w7zUtoCdFNDMzicBMl8ZykG
	aa7uOeddKGObEPyaBS0JvVKWOJ5GTvK4hIU+pG3+WKJNR1PeWacc53nFXt1iNdwh81LYhFnVdxNmf
	rxS22V6mns/THEVDaKTJWUBAtEPLxjxqASfX3FCo0xYEJGmoE0iUS+2QazVQxNH2/ERdFmrMM3FxY
	xnZX/+eVhcNub1rVz+NLYOkPcm3P1p6oxRgCpvU86twq/NYTZoAJZ15StAxO8LFDCgsiEbS+HD4gI
	H/H8ic3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkm1O-0000000EfGs-2Fvh;
	Tue, 27 Jan 2026 16:34:30 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkm1E-0000000EfDs-2nkA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:34:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769531645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qVzkEJu0rwGv9GhSscFNxi7pazkxC01AqWhJ4PtbAR8=;
	b=BRJK7kqFv7WhgeaGPzXl1G7bDC4goqi3TlEQzgGws2bMWxApxlNxAWLIpNoV7i70r0pTgI
	yy7NkXzI17/2bvw027HbIv+ZLZoZyC4gG2JAWdSwlcbWC3CUBUlI7SD9jc2FbdosvVs22H
	w+kGgJgFS2eWE2yyK+dt4zDkHxsww78=
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
Subject: [PATCH bpf-next 0/2] bpf, arm64: Add fsession support
Date: Wed, 28 Jan 2026 00:33:42 +0800
Message-ID: <20260127163344.92819-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_083420_852317_C287B390 
X-CRM114-Status: UNSURE (   6.18  )
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

Patch #1 implements fsession support in the arm64 BPF JIT trampoline.

Patch #2 enables the relevant selftests on arm64, including fsession,
get_func_ip, and get_func_args.

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

Leon Hwang (2):
  bpf, arm64: Add fsession support
  bpf/selftests: Enable fsession and get_func_ tests on arm64*

 arch/arm64/net/bpf_jit_comp.c                 | 66 ++++++++++++++++---
 include/linux/bpf.h                           |  7 +-
 .../selftests/bpf/prog_tests/fsession_test.c  |  2 +-
 .../selftests/bpf/progs/get_func_args_test.c  |  2 +-
 .../selftests/bpf/progs/get_func_ip_test.c    |  2 +-
 5 files changed, 66 insertions(+), 13 deletions(-)

--
2.52.0


