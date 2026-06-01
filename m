Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A832CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vy/ioHAfGgSkFdNc33HjVxuu78qVZ7b6Jf34zd+7p8M=; b=KJ0638teh2YouzcmzqOa5mbu0u
	xvHE4ISNx43qYCSmxEHImZJ8Izuujbvv60RSL2DPGXR+iPGTduPc22+9GBVTr9RnqMesjQNtIh32T
	YysiBmhCnlAVMNny+3wfG7C0DnN/xo2bHXqws2UN/aNSUs1omloML3HQn7QolmPwQJRHAT5YnM8Eb
	YR2+Jp5EFfTeUdqpWYq6EAwvH6+tT2iwVxQs/olBXrz3GHiwwjVSmS9FztB4tu46S7SaGN4arguib
	lURmNLGJoG2PufQAmwEGDIcKwbI0K/uYPF3CUFvD1ZPh0U6+ZD0ftJ98D/iuey2SRK+vcbOEucm85
	+5/7cV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1fO-0000000B6oi-0bDQ;
	Mon, 01 Jun 2026 12:22:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1fK-0000000B6o0-2p77
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 12:22:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B31064435D;
	Mon,  1 Jun 2026 12:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7CF1F00893;
	Mon,  1 Jun 2026 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780316565;
	bh=vy/ioHAfGgSkFdNc33HjVxuu78qVZ7b6Jf34zd+7p8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ozyoPr1djBhYccGfc7owfgDXZIZtffVobIwU6L6JiS+RsTf6d0Pe5KtRJ6GI/YIwV
	 byJw3B2negs9eeYk/+fbeH56VlkpRWDjDWI0WpYWS2bUlWha0H+zdXEeaaPlrR1ppS
	 mrievXjj2zAUuk24XyMRDsli0CVhElWfErksVokevtW03l9jZiQHBj98KcAqlM33mH
	 6QHqlLUZi43oDtCZOYzBeEfo3YUYzA1S5PQVoPTXLS/NXKdW43hGIZjoiL/KnqvhUA
	 VK8dkfF8d3C0BCde1m/m69ionvV6YxJ8JwCUC4sA8iuvUT2aqrB63ZwLpxU33tY0hR
	 Rf4QqHF5L0k6g==
Date: Mon, 1 Jun 2026 13:22:39 +0100
From: Will Deacon <will@kernel.org>
To: patchwork-bot+netdevbpf@kernel.org
Cc: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org,
	yonghong.song@linux.dev, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
	memxor@gmail.com, song@kernel.org, xukuohai@huaweicloud.com,
	catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH bpf-next 0/2] bpf, arm64: Stack argument fixes
Message-ID: <ah15j0WGcOz5cjnZ@willie-the-truck>
References: <20260528161750.1900674-1-puranjay@kernel.org>
 <178027501939.3441607.3307361090146995963.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178027501939.3441607.3307361090146995963.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_052246_742953_75A976AE 
X-CRM114-Status: GOOD (  13.62  )
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

On Mon, Jun 01, 2026 at 12:50:19AM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> Hello:
> 
> This series was applied to bpf/bpf-next.git (master)
> by Alexei Starovoitov <ast@kernel.org>:
> 
> On Thu, 28 May 2026 09:17:46 -0700 you wrote:
> > Patch 1 fixes a redundant MOV in the arm64 JIT's
> > emit_stack_arg_store_imm() and clarifies the stack layout comments. This
> > is not a bug fix but an improvement.
> > 
> > Patch 2 bumps the stack argument tests from 6-8 args to at least 10 so
> > they actually exercise the native stack on arm64, where x0-x7 cover the
> > first 8 arguments.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [bpf-next,1/2] bpf, arm64: Fix redundant MOV and clarify stack arg comments
>     https://git.kernel.org/bpf/bpf-next/c/12a585e607fa
>   - [bpf-next,2/2] selftests/bpf: Use at least 10 args in stack argument tests
>     https://git.kernel.org/bpf/bpf-next/c/157317ba662a

Thanks, Puranjay!

Will

