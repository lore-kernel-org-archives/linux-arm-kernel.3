Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACD9C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8iB9CL9H56AsWLWFYl9WTRB72BfvQk27blvdGiG6aA=; b=REk1AUWgjdu6lgHQ/fOsDXsy26
	ztBa83cOo0kpqy+GYFhX+V74F8akNAdpXxPj0xDZaPsJs3qQOcF9fUsC1DdEdMC6ga3/6cUVy//Aw
	YqoqHlqcCOtoL6JTS1RQva9ZLd9/WyJaCFvJLCJcDKqCjVi3O8SaXaV1skjSKIuiRlwdGvVEptpdM
	fzXAHw3ey/doVw6kKRl+tYvKCn7xlnzQVE0xxKA8VQm6ilbTldscPS1r9aaixZ2s2sr1BkahTZ/UG
	I4K24OrF3sbgW3cOGApbFegdpCMs6vdOkHqAcEcHKLfT2Z0DKzoM0qtfEy8UQEkH1UNaphIF2Aaab
	eh/snrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvB84-00000003idz-1cbL;
	Sat, 15 Aug 2026 09:56:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvB83-00000003ido-117Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 09:56:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42B06600AD;
	Sat, 15 Aug 2026 09:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3F01F000E9;
	Sat, 15 Aug 2026 09:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786787798;
	bh=h8iB9CL9H56AsWLWFYl9WTRB72BfvQk27blvdGiG6aA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=H9p3w86od7Pm+NnRVQk2/qkje8DFWJHo1+loL+VyM4x7UuXJwxgKJLB0t3UOUJuPw
	 cs3AxUoA9II9mkH36xh3qSi5azlx+CbzFL+ed9byQEfdi9qtidae9cNBcxnHoTp2Wx
	 yXkuL7ZzBZCayofpiA9smMOCN/89Tv2ZIInpTv2c4/tVnXPJQ7tSHbUcb9fQABaBhg
	 v8AXo4T94d20nbSD9D3QYW2lolQDnv2os5tQEcOuL7RRxNJDMJOp0SYxMfKEBbHHMv
	 7c6OAA5+/hpW0RhVlVQNXiD2mjt4JyQqTWWz6by5yJqoh89gNmABuKJXvv88CCP53S
	 1goF1renfOOtQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 6DD5E1980045;
	Sat, 15 Aug 2026 05:56:35 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Sat, 15 Aug 2026 05:56:35 -0400
X-ME-Sender: <xms:0DeAasum-5ZZrUIQFtx2br4ibarKj_fCMSllYBjanvXxSKGaxFNe5g>
    <xme:0DeAakQ6swmH_Au_dwEktcAP-Y1TASKZYIYDlaRLq4aLf099i337BPBVdGvq9RKXQ
    XsFkHyTFnB8FI6HyQGOqoCbtfEjte6be9Z0YJPLLZd-lvokoJRwIg>
X-ME-Proxy-Cause: dmFkZTFAuNCeEMW1VZsk3N7nJ7FTcPUlmBAIVDXKd94kL40rK668Sal6yRseJvtMcPr6gT
    GUEQjJzLqdPY31I48yMJe280VaWtgDwXFq8AxDYPOp7XFhkALnCMTlDmWzenCfMWYPPkCU
    o5eGqaU+GBxjcDva9JVSjncnVy6jvtlb0f4b2BMUyv+BEHDbHpSjSJFjX3EQhv6xbccHJG
    7W6XiLbxA6ezzBnXoXy4RVQF3oJ2YShIyGr7Kq9C6XZhoI2PpzkKcaW7+nyYwfPkWdvakU
    exujjLhz8wgaJUZY1Z+JKeBl/Qw0q8w4VhF2pDJ2nrs6F0xhy06gsLPkCdvBrhpLKSIwjx
    ntuozu13E+hIgRbHlzNXxzdGWeBdHSWLISWfOsE/D42l3SltMmRxpM4TgoTyEh9ZnQ/kVG
    f2jfdeQ0mTEH9z5JeoM4aQKnk9LRpZIQm+mvE3O33zndlFqO1nYYNjSxU1Gc2NBQ2m7s0q
    z1MpV05jvXR0Xv3r1fPPId/CjFamr5mqhIvuABcfWz4i7wqeq+brVw0d0Tw/NKKUNXZLUN
    hzE7XRTRRPA3cHyZuURaDzxcr5APmnNbJy6Q9Du+HWOq80bAjprnj0R+JqdxV6L73HNzuw
    4JndE5ZvBNjxQVBA/jU4TKbtN0/GKy/zlIo/NuOJGxVKsiNEF/bK7UyDcACQ
X-ME-Proxy: <xmx:0zeAapyE9qt4py2GaFwQsOtFZnLnE8ey_hdOdYm_rYZbtoGJYGZLfg>
    <xmx:0zeAairqUAzUQwfW2G4jGlMnKsp4vB0lK5YlD2yzg_9oB1ymsgDaZw>
    <xmx:0zeAar2tjAvoWIEZ13sB0D1X2wrUjIr9c5lbMPfzTwXUkWcjUo6FRQ>
    <xmx:0zeAarBFcpvt6Bxh-Q0gR1l0S4JSxGFNETALmq8HVv7-XBNhWzC2-Q>
    <xmx:0zeAasPRMJdaz4JsSKW8dNeQmF8R-h-yq7AUEFMDrubyqVxXJT_TjdHI>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 688EDF8006E; Sat, 15 Aug 2026 05:56:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 12:56:11 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Josh Poimboeuf" <jpoimboe@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 live-patching@vger.kernel.org, "Song Liu" <song@kernel.org>,
 "Miroslav Benes" <mbenes@suse.cz>, "Petr Mladek" <pmladek@suse.com>,
 "Joe Lawrence" <joe.lawrence@redhat.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mark Brown" <broonie@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>, "Kees Cook" <kees@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, linux-toolchains@vger.kernel.org
Message-Id: <6bc20c00-21a9-4315-8ec3-33c7ad6ae95f@app.fastmail.com>
In-Reply-To: <2ff1b2482406c61ca5979d6284ba5f948a3fbc20.1786768375.git.jpoimboe@kernel.org>
References: <cover.1786768375.git.jpoimboe@kernel.org>
 <2ff1b2482406c61ca5979d6284ba5f948a3fbc20.1786768375.git.jpoimboe@kernel.org>
Subject: Re: [PATCH 02/12] arm64/module: Fix BTI exceptions caused by omitted landing
 pads in Clang 21
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

Hi Josh,

On Sat, 15 Aug 2026, at 07:45, Josh Poimboeuf wrote:
> The following BTI exception was seen when loading a livepatch module:
>
>   Internal error: Oops - BTI: 0000000036000001 [#1]  SMP
>   pstate: 634004c9 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=jc)
>   pc : kill_orphaned_pgrp+0x0/0x150
>   lr : do_exit+0x498/0xaf0 [livepatch_combined]
>
> The problem is that the patch module's do_exit() is branching to a
> static function in vmlinux using a module PLT veneer (indirect branch),
> but the target function doesn't have a BTI landing pad.
>
> Clang 21+ omits the landing pad for static functions which can only be
> reached by a direct branch.  But livepatch modules use klp relocations
> to reference arbitrary kernel symbols, and with
> CONFIG_RANDOMIZE_MODULE_REGION_FULL the module is far enough away that
> every call to vmlinux needs a PLT.
>
> Note this problem is actually not specific to livepatch.  It's possible
> for any module's .init section to be allocated > 128MB away from its
> .text section.  So calls from .init to .text via a PLT can trigger a BTI
> exception when the target function doesn't have a landing pad.
>
> GCC has always omitted the landing pad when possible, so kernel BTI is
> already considered incompatible with GCC since commit c0a454b9044f
> ("arm64/bti: Disable in kernel BTI when cross section thunks are
> broken").
>
> When missing landing pads are detected, allocate a page close to the
> target which can be used to hold BTI veneers which receive PLT veneer
> indirect branches and direct branch to the final target:
>

This does not work for cross-section calls from .init.text to .text.

If .init.text is far away from .text, it is likely because .text
ended up in the 128M 'near' module region, and .init.text did not.
(They tend to end up in direct branching range of each otherwise.)

Given that the module init code is typically small, I don't think
it is safe to assume that allocating a single page close enough to
.text is going to be possible if allocating the space for .init.*
was not.

IOW, the fix I proposed for cross-section calls is still needed
with this approach.


