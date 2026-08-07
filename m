Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57CBC5AD2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 23:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itKP/luZUo3Ldz8OJ7wrr1SQkDgbCS31ssYxUZVwy7Y=; b=XwPtadeQi5+toHRAJVKU6LhGoI
	NviuLn/acZiHVmo7VkRTlYPuXNdcyV7OVtM86bEvg2oNRMGtfH2lbsg2HUfdIetI7haBGYFMif3RC
	de0G2Ops+Ev02oZxexqqBjLRO+itkD8VPdlB+ccfZy1X8IG9A0huRmoUCPDYgMFat2MQW4ntzRjAL
	aQ4FE8+57uYTmbQAwlRBfbf7WIYg87iL2p/fMMAubU4GsdVaqytf+HOgOie7uRgOITfry/Mujd6PG
	fMjWGjbJ/vxfV1TdbV73OU2rDHbrD7NpqmtT5+EEAJ/rA1W/AXTAn8NSzeVjmtZ+pXIXxXFzpwn3k
	tO6Bem4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUB9-00000008skL-0UcD;
	Fri, 07 Aug 2026 23:40:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsUB5-00000008skB-1502
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 23:40:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 471956001A;
	Fri,  7 Aug 2026 23:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3A71F000E9;
	Fri,  7 Aug 2026 23:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786146038;
	bh=itKP/luZUo3Ldz8OJ7wrr1SQkDgbCS31ssYxUZVwy7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OgRIrG5pRos8h8lfONzMyx050dIhhOGub3B32Bxg4y8jDSqLXd08RqhWyJYIFsgrY
	 YMber64ZrKQ4WcueROkthKjBInFfH8zErIjEySus8ZC4E+dhvvXLBHtTPxcXdhqFPM
	 VBPezQDaEPRrfGIoQxTBIYjZ3lzeDXKJrNtXOfcZ80mAu+i3+cozqBFXI9FCeRMgIg
	 9hjcDJ6KEtxWdWyx8lNPk8qGsjucAPGF+fqDuFFqMepx2GYEdXcuQpPh4Rt+qHAca3
	 xC3rXyv9DvwOLJiX3FCU3qNL97p3CGRPJGUab8L/h0IVcJR0j32TKsMefSugfxY0T1
	 vgLs8c5eklR5Q==
Date: Fri, 7 Aug 2026 16:40:34 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org, Joe Lawrence <joe.lawrence@redhat.com>, 
	Song Liu <song@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v3 11/21] objtool: Allow empty alternatives
Message-ID: <jbjmteak3slp5jxytozuaxvh34lv5uvqzvq7gv47ch363mc4s3@frpc2izplmhp>
References: <cover.1778642120.git.jpoimboe@kernel.org>
 <3c474673ec5ddc9f27fbf5ddb1fd0f66ef6a779f.1778642120.git.jpoimboe@kernel.org>
 <20260513073711.GI1889694@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513073711.GI1889694@noisy.programming.kicks-ass.net>
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

On Wed, May 13, 2026 at 09:37:11AM +0200, Peter Zijlstra wrote:
> On Tue, May 12, 2026 at 08:33:45PM -0700, Josh Poimboeuf wrote:
> > arm64 can have empty alternatives, which are effectively no-ops.  Ignore
> > them.  While at it, fix a memory leak.
> 
> How does this happen?

Yeah, that commit log sucks...

The case I stumbled on was the dcache_by_myline_op_nosync macro:

alternative_if ARM64_WORKAROUND_4311569
	.ifnc	\op, cvau
	mov	\start, \tmp
	mov	\tmp, xzr
	cbnz	\start, .Ldcache_op\@
	.endif
alternative_else_nop_endif

That's actually a bit weird, the .ifnc should probably be outside the
alternative_if.  Let me try fixing that instead.

-- 
Josh

