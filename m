Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D03CD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 05:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVmqcnVsjodgCjG3U/o5eRCKAusFzgiBIJq4ut+6lTg=; b=vSGpOcnT+qhXUKVw7UBGuvVsla
	zWYxTIj+5MKrsI/6QeYHv5vd3AhiW/tbmU6hV2Vhiw2Lf2wEK7/xEw/5NeuzJ+7k6lN3F1UstdR5l
	3Tt74HguwQrS0cRWl8c+HBrrvz+BdBvcsKmRZTpZsE0uZwsgARBSmdn1s77zRSSPvlrpy6+ef0S5H
	Yptljt47uWNmNoJTOt5dliQnN+2J9r9xDUgked5Uq5pJojQogb98CH5EZViZ9IofmNNs8O5Uxk6Yy
	6VL/FrZ9qYQNj68Pv3H/n9npnku+CPSBA35sosn5pFKuLLtSWZfCjRF9DauYlEEVN2Hyurj/t8EKn
	W0MBWWtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWosl-00000004kMf-43PA;
	Tue, 09 Jun 2026 05:20:11 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWosi-00000004kJF-2JOJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 05:20:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780982394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VVmqcnVsjodgCjG3U/o5eRCKAusFzgiBIJq4ut+6lTg=;
	b=CsQ6WOywrUqfG/jYS6DeCAEfy3Mucvl8747hxez4wCFKgNWvESAh7FrW/4ZrkN16ffN0Y9
	+gND0uCghNRWgOOIsMvrrag32fn5ube0Ku/eHm644yqIC9NWjOyzOihlw59ti4993532TT
	p6nytidjYkMGT1uWj9o1t0V2BZ9ZC2Q=
From: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Date: Tue, 09 Jun 2026 05:19:26 +0000
Subject: [PATCH 1/2] arm64: ftrace: prepare ftrace_modify_call() for use
 without CALL_OPS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-arm64-ftrace-direct-calls-v1-1-4a46f266697f@linux.dev>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
In-Reply-To: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
 bpf@vger.kernel.org, Florent Revest <revest@chromium.org>, 
 Puranjay Mohan <puranjay@kernel.org>, Xu Kuohai <xukuohai@huawei.com>, 
 "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_222008_751846_395E13D3 
X-CRM114-Status: GOOD (  11.57  )
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

ftrace_modify_call() is guarded by CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
and calls ftrace_rec_set_ops(rec, arm64_rec_get_ops(rec)) directly,
which only exists when CALL_OPS is enabled.

Generic ftrace also needs ftrace_modify_call() when
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS is enabled, to retarget a
callsite between two non-FTRACE_ADDR destinations, as happens when a
direct trampoline is modified. The next patch allows DIRECT_CALLS without
CALL_OPS, so widen the guard to cover both configurations and switch
the body to the ftrace_rec_update_ops() wrapper, which already has a
stub for the !CALL_OPS case. ftrace_make_call() already uses the same
wrapper today.

No functional change: with CALL_OPS enabled, ftrace_rec_update_ops()
expands to the exact call this replaces.

Assisted-by: Claude:unspecified
Signed-off-by: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
---
 arch/arm64/kernel/ftrace.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 5a1554a441628..e1a3c0b3a0514 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -409,7 +409,8 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 	return ftrace_modify_code(pc, old, new, true);
 }
 
-#ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
+#if defined(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS) || \
+	defined(CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS)
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 		       unsigned long addr)
 {
@@ -417,7 +418,7 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
 	u32 old, new;
 	int ret;
 
-	ret = ftrace_rec_set_ops(rec, arm64_rec_get_ops(rec));
+	ret = ftrace_rec_update_ops(rec);
 	if (ret)
 		return ret;
 

-- 
2.52.0


