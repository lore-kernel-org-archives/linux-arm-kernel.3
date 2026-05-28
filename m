Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC72CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uBkuRsS+rErMRAlS6K+s/SZuTdHmBlHVgvNB3VgULIE=; b=ED2/EsfPqylTxxJOm5vTqL0Nv4
	MIS3l3Mye8nlJzHs5/F06Lf78lyLuLGntOV7ypUG6QWRarOnT4g2IZF++8tzsKIjcE+gTXjT9xCLv
	0WOxpPQEZam3IroMy8UDOwfrr2GnqF7Q3krrO3yM5RvFlyzDoca2womZUSh979/Is57A2STmRTsGf
	oLWR5vQSQ00pdC0gnmaQWVY1HtTiWJjAGrTpyulo5MwaEref0uo7y9X83cYSgkG/OssY8dTgWGPP/
	AVqJyysdPGGqrgAB5HFWtoC0Ul54Qb3zYvn1PMmPWWCbdMoVNBE8lwf5XA6h/K5Yt7xUjHubQp5dU
	UQH1PRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdQw-00000005yth-1Ayz;
	Thu, 28 May 2026 16:18:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSdQs-00000005yt9-1MBY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 16:18:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3125643484;
	Thu, 28 May 2026 16:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09C51F000E9;
	Thu, 28 May 2026 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779985085;
	bh=uBkuRsS+rErMRAlS6K+s/SZuTdHmBlHVgvNB3VgULIE=;
	h=From:To:Cc:Subject:Date;
	b=PzCiPbSI+wQAsHCg5hnpbNRPphANWT6Bot+H8muCKNrpMiNln5SRsgTl4+kIWIaMp
	 sXa5IGzXc0UP9m/ddpaQS3g8tiIrQ6riAhllFoBVFqJC5dUQSzPpWxVBM7pnevLdFX
	 7+EmzORjZQchfX6UiIx29w9UDII16yuU48mjJO9TLUu5Lhb+HkTjaak9rkiJHdp4Ib
	 G/JKNkXeXzrulnGavxLwTwwKbESS1oMopGKL4ENiWCyfxTAje7pZgkwZN8A/inK8Qw
	 MKW0aWVm5M4aQkitU8mGtXV7R6JfNkxIANWoqyCCvkneGMMZKTE/LM+Y4cyqIE0BXW
	 QYADqjoIl01FQ==
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
Subject: [PATCH bpf-next 0/2] bpf, arm64: Stack argument fixes
Date: Thu, 28 May 2026 09:17:46 -0700
Message-ID: <20260528161750.1900674-1-puranjay@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_091806_381175_6C75CB21 
X-CRM114-Status: UNSURE (   7.02  )
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

Patch 1 fixes a redundant MOV in the arm64 JIT's
emit_stack_arg_store_imm() and clarifies the stack layout comments. This
is not a bug fix but an improvement.

Patch 2 bumps the stack argument tests from 6-8 args to at least 10 so
they actually exercise the native stack on arm64, where x0-x7 cover the
first 8 arguments.

Puranjay Mohan (2):
  bpf, arm64: Fix redundant MOV and clarify stack arg comments
  selftests/bpf: Use at least 10 args in stack argument tests

 arch/arm64/net/bpf_jit_comp.c                 | 12 +--
 .../selftests/bpf/prog_tests/stack_arg.c      | 30 +++----
 tools/testing/selftests/bpf/progs/stack_arg.c | 90 +++++++++++--------
 .../selftests/bpf/progs/stack_arg_kfunc.c     | 24 ++---
 .../selftests/bpf/test_kmods/bpf_testmod.c    | 25 ++++--
 .../bpf/test_kmods/bpf_testmod_kfunc.h        | 11 ++-
 6 files changed, 115 insertions(+), 77 deletions(-)


base-commit: e42e53ae23b7d41df22ccd7788192bf578f24da2
-- 
2.53.0-Meta


