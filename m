Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232AEC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TelY/e6rhqBnbaI//+7mxab5yF5lSU4GighDsL8mjtU=; b=SBJ2N0+8y+aUMPgQJE/u0Ie5W0
	FpKJ0fNgnbBEn2mdxcdYS1WeeKejOge6fNtHpyxF2Zjh84CISR6QYDZSM6m2i4j5QsuIlpX5opX+6
	iyq4WYv4nNCTFnF36btPpkneEY5CuTifQqReo39LTiWQkJgNHabV3oLWbakb5f97tgUJKfwTWL0xL
	LwEl0tNaJ8XRDtwmrBf1UEY7MPS+cvZMuDovldFrbX1S0yxpaZ/LFBUN3VQVP0ZoivorTYoNNdemv
	xpfuDl2jK58Y/zI2N0rR2iTcJPS07jHugavDNHVOEsb697Vse2o1yHlEI4gbiCTyWCfyxn+EldCg3
	nA9dSE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woML6-00000002zji-2JHg;
	Mon, 27 Jul 2026 14:29:56 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woML1-00000002zho-1xFL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:29:52 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785162589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TelY/e6rhqBnbaI//+7mxab5yF5lSU4GighDsL8mjtU=;
	b=ZyLvmu/MHYpDNbUorLcBJbddnw77+HeD/DLH4+630pkX74zlnxiewseIkfb1Qk4Jrr5wk1
	p/eTme8zssK5AaRtUalWpSb6uaj87dcJkyHuzHz+PqgI2S2cA7G0GafjxFncbd3VXndOc0
	h047oJQZ2gXZPMmOr+7CsnF2v8yKmCE=
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
Subject: [PATCH 1/2] arm64: ftrace: enable single ftrace_ops for direct calls
Date: Mon, 27 Jul 2026 22:28:43 +0800
Message-ID: <20260727142844.21212-2-leon.hwang@linux.dev>
In-Reply-To: <20260727142844.21212-1-leon.hwang@linux.dev>
References: <20260727142844.21212-1-leon.hwang@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_072951_654278_6BEED391 
X-CRM114-Status: GOOD (  11.76  )
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

The BPF tracing multi link updates several direct-call sites through one
ftrace_ops. Its implementation is therefore gated by
HAVE_SINGLE_FTRACE_DIRECT_OPS in addition to
DYNAMIC_FTRACE_WITH_DIRECT_CALLS.

Select HAVE_SINGLE_FTRACE_DIRECT_OPS whenever arm64 enables dynamic ftrace
direct calls. This enables BPF tracing multi links on arm64. Also
generalize the unreachable-trampoline comment because the single-ops path
does not use ops->direct_call.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 arch/arm64/Kconfig         | 2 ++
 arch/arm64/kernel/ftrace.c | 3 +--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 0de419ed780f..c98dca76859b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -188,6 +188,8 @@ config ARM64
 		    CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS)
 	select HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS \
 		if DYNAMIC_FTRACE_WITH_ARGS
+	select HAVE_SINGLE_FTRACE_DIRECT_OPS \
+		if DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS \
 		if (DYNAMIC_FTRACE_WITH_ARGS && !CFI && \
 		    (CC_IS_CLANG || !CC_OPTIMIZE_FOR_SIZE))
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index e1a3c0b3a051..56ba72a87dfa 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -301,8 +301,7 @@ static bool ftrace_find_callable_addr(struct dyn_ftrace *rec,
 
 	/*
 	 * If a custom trampoline is unreachable, rely on the ftrace_caller
-	 * trampoline which knows how to indirectly reach that trampoline
-	 * through ops->direct_call.
+	 * trampoline which knows how to indirectly reach that trampoline.
 	 */
 	if (*addr != FTRACE_ADDR && !reachable_by_bl(*addr, pc))
 		*addr = FTRACE_ADDR;
-- 
2.55.0


