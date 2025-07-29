Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E39C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 10:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1HBlta0H4Jx7bvZ1b7rM6/tQhHSL1Aapm4R8KLGYAI0=; b=JpBRpO5UKCDSd1zKbuHUZshpBR
	WBvYliCo8Xpt5xdORxO0xjrohdwy+zcx3VuL2Y8sVPAqE6n+snQz+oMlcDD0dSNlAzT4SdP7jFzd5
	A5nF8LMw1Ovx0aWuOrwdPqZZ+SN4uXf/K2q1mtYhlYdoQ9aZwfMcw8K5pDCM2ZzqAa4IMHZlEQ2bA
	VsFEsCwdq2NDld13NyB57gcwUkKGfhIMy/2xhEYisufHiV5vS8RVOb61Dstkq3onzpeoJWQVfY0Gu
	oeDB+9+11CtTPhFCi7Ac8Bi/SF1UcYGVOVNm4rIve/YSzmKgaTDmR46UNnb2Hir/o9/KoIbWvRI1v
	erHwXeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughcU-0000000GXNi-06dv;
	Tue, 29 Jul 2025 10:31:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ughZF-0000000GWdG-1O7A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 10:28:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 31915601F4;
	Tue, 29 Jul 2025 10:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC27EC4CEF5;
	Tue, 29 Jul 2025 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753784898;
	bh=OdjL2rd1addmR1OyPctySgVMlUNEtBw1AyeTREwXlmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=mV11jTfEzIy7cXmLJFY4fmn7U37r6DX9yP3lmPbtt5dwSA8KG2y8881YwOB9Ph2Yy
	 VIUnsq5ImkMQynvHIL+M/tHcOdifQU+3r3vVSx+LLvxK09rlboMz57EWaRtXTL9JTb
	 pcuU3wegX6QusUMJ+C2DHhigdbSxGlGAucMF6Lf7U84UYBDKqCXCNAnzEL3tiQvLLa
	 C3Ipovo2vCe4hCQ3YVczf3Lq7eZCZme3EWVq+b4a42V/p4hEdCnTm+nFwbbiati9CO
	 LM0tmHvSAf1ANu0mhOSLoCrNUJn2zy2UZZyI+Sp6Lq26SVD+mG8GU/+Ez0PIp5IJd4
	 JWL2XmaqlEdHw==
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
Subject: [RFC 00/10] ftrace,bpf: Use single direct ops for bpf trampolines
Date: Tue, 29 Jul 2025 12:28:03 +0200
Message-ID: <20250729102813.1531457-1-jolsa@kernel.org>
X-Mailer: git-send-email 2.50.1
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
while poking the multi-tracing interface I ended up with just one
ftrace_ops object to attach all trampolines.

This change allows to use less direct API calls during the attachment
changes in the future code, so in effect speeding up the attachment.

However having just single ftrace_ops object removes direct_call
field from direct_call, which is needed by arm, so I'm not sure
it's the right path forward.

Mark, Florent,
any idea how hard would it be to for arm to get rid of direct_call field?

thougts? thanks,
jirka


---
Jiri Olsa (10):
      ftrace: Make alloc_and_copy_ftrace_hash direct friendly
      ftrace: Add register_ftrace_direct_hash function
      ftrace: Add unregister_ftrace_direct_hash function
      ftrace: Add modify_ftrace_direct_hash function
      ftrace: Export some of hash related functions
      ftrace: Use direct hash interface in direct functions
      bpf: Add trampoline ip hash table
      ftrace: Factor ftrace_ops ops_func interface
      bpf: Remove ftrace_ops from bpf_trampoline object
      Revert "ftrace: Store direct called addresses in their ops"

 include/linux/bpf.h           |   8 +-
 include/linux/ftrace.h        |  51 ++++++++++---
 kernel/bpf/trampoline.c       |  94 +++++++++++++-----------
 kernel/trace/ftrace.c         | 481 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------------------------------------------
 kernel/trace/trace.h          |   8 --
 kernel/trace/trace_selftest.c |   5 +-
 6 files changed, 395 insertions(+), 252 deletions(-)

