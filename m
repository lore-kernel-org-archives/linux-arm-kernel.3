Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7184CC4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+eMYlOGfJ10tYybtvyrsW1lB+RoAnjB3FfjZYdMkZkE=; b=tHNtGqcdsDYOZ7WgSIAxibmyTU
	QtG34gusWFaa7QuXzKPUPkeUfQtyr3fQSshWEB+VQpDN//jD0Y1WFGjHZCQsEOdTY7njn9m6aRz/C
	jxY2/+Xtmypaacg5nxdCLdVbJBhEL7jhgelE91aCUbwbyat3dWjjj3hV3Y7j52n+VWsduB93A9fBC
	06J9sraifQ9+QJl+XxUdc1HZ7PMIGMyKSMC0uyzuDFY8P/k6eor4BHlQUiBCTuMaNPc8isMRQ3ZZ8
	jotZMeORTs9XODLvaP33CBGgdw2yolGpzxm6hJz0KiVAXmXAXeI5D21shIzu0LOHUhmdnOxi0Ee/D
	jmuksieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeg0-0000000CpXm-3SYU;
	Wed, 22 Jul 2026 21:40:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefm-0000000CpSE-0XPa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A480B43FE5;
	Wed, 22 Jul 2026 21:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19DB1F00A3D;
	Wed, 22 Jul 2026 21:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756413;
	bh=+eMYlOGfJ10tYybtvyrsW1lB+RoAnjB3FfjZYdMkZkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AUPZN7pWFQ8uxNPRAe4YDaLWmhexm824Tfmx7Fb/7Qj8Xjp1s+JDFfA0QfJ2sC2Hn
	 aXnEEM6d1eIruBNgHtfE6cnyP2fxiBhmrHGdhcKL9yUmaxwS6wfPTbyYPNdxfLMvaI
	 GLwleQEecZXVWfg2JhxChcVGypsbOvolr65aisR/x1JfjW/gX+OsHFLF8x8GvzXL+N
	 lhiquT01UYjN0fDVSZ6aS3PGWTFq++8xZO62wmfSy6ZllHAU3wb5OWHmfirAWz4qtX
	 Al+yVvDRcGgr4+p8XPw8aHh+sfIYnsv0DuFQtCPky6xPCFeDiLsy6CemEV0iTUUL4u
	 cneF5UJf738sA==
From: Will Deacon <will@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev,
	bpf@vger.kernel.org,
	Florent Revest <revest@chromium.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huawei.com>
Subject: Re: [PATCH 0/2] arm64: ftrace: support DIRECT_CALLS without CALL_OPS
Date: Wed, 22 Jul 2026 22:39:25 +0100
Message-ID: <178475345276.2109707.13204683362381752837.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
References: <20260609-arm64-ftrace-direct-calls-v1-0-4a46f266697f@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Tue, 09 Jun 2026 05:19:25 +0000, Jose Fernandez (Anthropic) wrote:
> On arm64, HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS is currently selected
> only when DYNAMIC_FTRACE_WITH_CALL_OPS is available. CALL_OPS, in
> turn, is mutually exclusive with kCFI: the pre-function NOPs it needs
> would change the offset of the pre-function type hash (see
> baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS")),
> and the compiler support needed to reconcile the two does not exist
> yet.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/2] arm64: ftrace: prepare ftrace_modify_call() for use without CALL_OPS
      https://git.kernel.org/arm64/c/123b4fc0f857
[2/2] arm64: ftrace: allow DIRECT_CALLS without CALL_OPS
      https://git.kernel.org/arm64/c/9315e22b0c0a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

