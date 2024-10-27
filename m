Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B337D13561
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyF+CPmg7y8b5jhdBKkIs0uJmDgstxj8ER8tB1KSh4Q=; b=ZqOncDsoeQygszDJrJ7dFI8GF0
	wT12O9DAfCSATmhg+XXt9WlRrZYfJjucQrSOE1stWEJJEB4UH5IcLKiwYzKX40q4PeJG1oj6KNfXU
	vba0NINNyxT7CBkPHvZJpus9h71aCMk5CXhucVUY66Fh9SBLeLZMpEws3gsoYKUTJ63DWg/JzCmJ2
	X+4Yx33egZjrjNCfhnn4wlQOOJpa07mUQR5i/h2Y8cq+laqBedCc+5SnLFoZLV0fdS6QEk7xIRzkD
	f6SfP8/YcZzJJ0JTSkvWK8ZyGq1FriSjFoezPJ5f1lfIl2fGw/f0oI/ZDpX8PplKKux7qP0xc81Ci
	aQjitxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t53zt-00000008JAs-1Jpq;
	Sun, 27 Oct 2024 14:12:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t53yH-00000008J33-20gO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 14:10:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DEE965C4237;
	Sun, 27 Oct 2024 14:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903E8C4CEC3;
	Sun, 27 Oct 2024 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730038218;
	bh=wbqIozrq2BqN3Qh0GIEmkRGN7pQWpNjoIAQs3t3WMs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pbgWxow1mk7tTiQt7wW1mgbMVb/6Q9YobN7L8wy2AkjpON3qb9UcNI8lSGZ2LpfbH
	 uBoY+tJ4ICiE3lkjEb2caiKhzxYULDoQwOFtAqiynHvLk1ZoT7/P4zFsD5YcF0xWhm
	 BSLidl+RKjHUvRj0YtHDdgJehfFmOfAPmvgEJS+Bgnabt6OVFPBNClRF4nuiioN+67
	 Q3ATTB3dTm/nNJW6RRWKhrBNL84gLBOrOXjrpXxp+ds5TkPItLaLFKBXj7ZYSt3oql
	 YEX3Z4uh6qY9Tk26WVXq5HzaeFe1VglXdlsOJDQehND4j433sfrxhaCzM/1h36f9vB
	 BY2MrxdjD7Oyg==
Date: Sun, 27 Oct 2024 23:10:13 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Liao Chang <liaochang1@huawei.com>,
 catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
 oleg@redhat.com, peterz@infradead.org, ast@kernel.org, puranjay@kernel.org,
 andrii@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH] arm64: uprobes: Simulate STP for pushing fp/lr into
 user stack
Message-Id: <20241027231013.434c071d7554e3f2aac7cef3@kernel.org>
In-Reply-To: <CAEf4Bzb9fM+hx8quHpCCeRh2p7UVk9Kk6yGj3XvyJLTQu9C-2w@mail.gmail.com>
References: <20240910060407.1427716-1-liaochang1@huawei.com>
	<ZxpUX1rbppLqS0bD@J2N7QTR9R3.cambridge.arm.com>
	<CAEf4Bzb9fM+hx8quHpCCeRh2p7UVk9Kk6yGj3XvyJLTQu9C-2w@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_071021_598109_DFB60B82 
X-CRM114-Status: GOOD (  15.49  )
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

On Fri, 25 Oct 2024 13:51:14 -0700
Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:

> All good ideas for sure, we should do them, IMO. But we'll still be
> paying an extra kernel->user->kernel switch, which almost certainly is
> slower than doing a simple stack push emulation just like we do in
> x86-64 case, no?
> 
> 
> BTW, I did a quick local profiling run. I don't think XOL management
> is the main source of overhead. I see 5% of CPU cycles spent in
> arch_uprobe_copy_ixol, but other than that XOL doesn't figure in stack
> traces. There are at least 22% CPU cycles spent in some
> local_daif_restore function, though, not sure what that is, but might
> be related to interrupt handling, right?
> 
> 
> The take away I'd like to communicate here is avoiding the
> single-stepping need is *the best way* to go, IMO. So if we can
> emulate those STP instructions for uprobe *cheaply*, that would be
> awesome.

+1.
Unlike the kprobe, uprobe singlestep needs to go userspace (for
sacurity), which can introduce much bigger overhead. If we can just
emulate the instruction safely in the kernel, it should be done.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

