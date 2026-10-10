Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E53CA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iek8VipYwbptAyUrMEWu1ntqexeiiQemt/HWdWWCSec=; b=CHVCj7/rixe7Jg9rglWUdk81G6
	4Fc4srKmoTY9fFc6wO7gJvSkpwehUiWo3nNmjTc/MbGpaP4Q/1h+PrLQGpLbiEYY1ZnwSjua26djg
	8QB4Ct+F53/jGkXnJQq6XlDmPZzqowd9FX8jpI69sLk2EE3OGZLqQT6vwK4jZcNGiFCHz/6h8c43W
	BcsfiD/8zRKY6gHvIx/5aUWDmqn97ZUYu1pJJuxPhOTYSi8q5Zd0u0g04BRnYqZmPyQ6IZdFlZsU5
	VLc/uAawEBOR/MOW6Sh4FsUq9+BDHleYzYnyujWWcwjg3P40gxiHHThsRO5TEloYsiQwFjVaq8hFI
	rxcAkcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFYiB-00000008D3Z-1abr;
	Sat, 10 Oct 2026 15:10:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFYi9-00000008D3Q-3um6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 15:10:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4B1144491;
	Sat, 10 Oct 2026 15:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F5FD1F000FF;
	Sat, 10 Oct 2026 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791645008;
	bh=iek8VipYwbptAyUrMEWu1ntqexeiiQemt/HWdWWCSec=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=N/2X/yKlCQBzE0039rrT3agz6Cj3CWMvqOlT9HQxvHkEp+tSVbI1b/fY2V+FtghAG
	 ySXod3OSWF7zgEoXh6jzTD0OcLawU3mDe7bLf9trSFpvMo4xt1dU7Tm8YEZrp5vahO
	 XVr3ayaDQ2T/5wBj7SfHBhYZACtFpvLyNwM3lipHzove8WnJdpc+tl2OovWzSGB6qN
	 wni/4FhxDYqyTxKZ0v1PNBsoSxgmB8RUgt+ODPenVGYvalhSVEYfrHKPLmvJ0HPh4/
	 ruDE5h6siC/tIAwOTfdAFaXJr5LLedFpKX6ly5xOycPaDiiF5AyC0VlORNGLH0oWRP
	 PdjHiphnZFwTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772EB380DBDA;
	Sat, 10 Oct 2026 15:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf v3] bpf,
 arm64: Fix racy plt target update in bpf_arch_text_poke()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179164500701.1749710.14140149592072860929.git-patchwork-notify@kernel.org>
Date: Sat, 10 Oct 2026 15:10:07 +0000
References: <20261009173802.1248441-1-thepacketgeek@gmail.com>
In-Reply-To: <20261009173802.1248441-1-thepacketgeek@gmail.com>
To: Matthew Wood <thepacketgeek@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, puranjay@kernel.org, xukuohai@huaweicloud.com,
 catalin.marinas@arm.com, will@kernel.org, leitao@debian.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri,  9 Oct 2026 10:37:59 -0700 you wrote:
> When a long-jump trampoline is attached to or detached from a bpf prog,
> bpf_arch_text_poke() updates the plt target at the end of the prog by
> temporarily making the page writable:
> 
> 	set_memory_rw(page);
> 	WRITE_ONCE(plt->target, plt_target);
> 	set_memory_ro(page);
> 
> [...]

Here is the summary with links:
  - [bpf,v3] bpf, arm64: Fix racy plt target update in bpf_arch_text_poke()
    https://git.kernel.org/bpf/bpf-next/c/6335e6719fd3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



