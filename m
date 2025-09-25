Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D5BCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQT9GVOZ/CxFSAsNeM0e+TLbohQwdWAcTdknJofRraM=; b=jDCQv6lnubahcTPeasPBnyzG7Y
	i1jeepP8U+P948xkJXGJBPOOSDLgkTj9GDDk8R8CizqySvlncQsXpNcl3TuQ3Q2jBiM+0dXJuzYla
	O9d0aT7SemjJp2DQjaw+cj6RNP5yfvvfjxQGoBmptHqDOsa/mgjyH4fjLs8lmZy6pmrjLWGXdpWQF
	lx9tzOtkmV/aYrXAUEKIUHA9n7/94qCVpRnR0l/x9ktgo7M2fgnH2Q2zcpK3CRajMAvCOXtPvc63c
	wVzvzoUt6HJluk8l5HpfFawNI1hefx6joAvAtovcUenVsPlxmZUMUQlRJB6aSG/guDB7nXG3ID8rj
	XT7xBLOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nxI-0000000AevO-0Ch3;
	Thu, 25 Sep 2025 15:32:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nx8-0000000AeoL-1j5K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C8624537B;
	Thu, 25 Sep 2025 15:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FFFC4CEF7;
	Thu, 25 Sep 2025 15:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758814333;
	bh=nJtC9h9+MFddQfow64tKhZDUie+SLtMhzJFDXayXg1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bJhomZjcuVQrsHtrwBqbU+0MZQ0FrWB1VHntRw2PT8v8rBNupBnMn33m3k4k9UV8K
	 YZnj3knKOay2cX3MtpylgvUzKVndJtBYnW2Gi+sYrsdiQs670EN5OqM5BGm3lGwCQ3
	 nIMDTD0aGLZpRwy2MtdkVa0YMXWbEc22xktR+l0p5evgMyAOthM2CHVcc6qrkrKunf
	 N7dI23kY6Ry7Yoz3hn2VVAibpDeTSvoLSO6VdS2AE3bDnswUpL5hbbfnnwm3/UDNwj
	 nqJn3PaNjQcbb2wKbjMtkZUwxkYPQuhwXgn7/2KR98ki2uBY3LN0rhEf7KPKTgkR1i
	 MTt4XfjJb6KVQ==
From: Will Deacon <will@kernel.org>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	olsajiri@gmail.com,
	andrii@kernel.org,
	ast@kernel.org,
	Feng Yang <yangfeng59949@163.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH] tracing: Fix the bug where bpf_get_stackid returns -EFAULT on the ARM64
Date: Thu, 25 Sep 2025 16:32:02 +0100
Message-Id: <175880516935.3262599.14788507714084459007.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250925020822.119302-1-yangfeng59949@163.com>
References: <20250925020822.119302-1-yangfeng59949@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_083214_472218_5DC8FD55 
X-CRM114-Status: GOOD (  12.67  )
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

On Thu, 25 Sep 2025 10:08:22 +0800, Feng Yang wrote:
> When using bpf_program__attach_kprobe_multi_opts on ARM64 to hook a BPF program
> that contains the bpf_get_stackid function, the BPF program fails
> to obtain the stack trace and returns -EFAULT.
> 
> This is because ftrace_partial_regs omits the configuration of the pstate register,
> leaving pstate at the default value of 0. When get_perf_callchain executes,
> it uses user_mode(regs) to determine whether it is in kernel mode.
> This leads to a misjudgment that the code is in user mode,
> so perf_callchain_kernel is not executed and the function returns directly.
> As a result, trace->nr becomes 0, and finally -EFAULT is returned.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] tracing: Fix the bug where bpf_get_stackid returns -EFAULT on the ARM64
      https://git.kernel.org/arm64/c/fd2f74f8f3d3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

