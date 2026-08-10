Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E84C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 10:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2rdagmXWfGPAIzO27YZsC0M9W0VZdij5BhCuKZjYSw=; b=hZdhxWldm5AOU/we7GG1wDP69t
	RdlsckeYk0U47VgBNgogtc50/bVG2Zp3OGxf832LglXxg6rddqiiWg99pVRHoGVc6XBFXYVhFO/zs
	1vGaoWTAUW35heqL4t4O/ZtMnTd9918BnHvIeFvZxyuQibu0v1T3BmFjNQbfSiCTGPMVpCOxI5i0K
	AL0X8kyqiBW0OT6fzNhJvARBGUyO4ges0Ceh1cJzyl0/xKibDVWSEW6MS9nL1UDqc6Md5R9LcAtFK
	i9wzC3cITux1mfGwa6xeTuKFfgFoif+qFUIQ87l3axXCSTMk9elBiWj/sTIx87vBrjrt9lvSCybqt
	WD2C1rug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNHq-0000000BW62-31UQ;
	Mon, 10 Aug 2026 10:31:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtNHp-0000000BW5p-2yJG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 10:31:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C8B00600AB;
	Mon, 10 Aug 2026 10:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696901F000E9;
	Mon, 10 Aug 2026 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786357876;
	bh=T2rdagmXWfGPAIzO27YZsC0M9W0VZdij5BhCuKZjYSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A6utgY3LlJYWRMPuC8wdlIE0qKmJ4qA+6NPGz7UORV9rorxpaxw5NZAHYWukKfQ8U
	 glXgp06JMMtMIuNpYLyBiQLRu4an7OgUgZV9S0jtIWEdu67gs4wjZAaaAMuG6vyIyh
	 t02gjfWlF/peX2XVlpNoqOgcdfr00m+r03D1t76AcGeJ3uR94RYAPK78cz3WB/asrB
	 kWhxEZHKNGVeTnjTRRHs3eKDO0nIg5WDcgEYNimF6ATH2/+lwdjVEuXAyq/wMC6Qds
	 gOqKod//7rfFRkA+1+/BD0T14oFQEJUIlZcFmD2fwJw3C9A/SP1LaAHsONs47nEchy
	 x8fyX9kdGHfEA==
Date: Mon, 10 Aug 2026 11:31:10 +0100
From: Will Deacon <will@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, live-patching@vger.kernel.org,
	Song Liu <song@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang 21+
Message-ID: <anmobvJXiBQqWn6S@willie-the-truck>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
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

On Fri, Aug 07, 2026 at 02:46:11PM -0700, Josh Poimboeuf wrote:
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
> reached by a direct branch.  That's fine for ordinary modules which only
> branch to global exported functions.  But livepatch modules use klp
> relocations to reference arbitrary kernel symbols, and with
> CONFIG_RANDOMIZE_MODULE_REGION_FULL the module is far enough from the
> kernel that every R_AARCH64_CALL26 needs a PLT.
> 
> RET is exempt from BTI checking, so use it instead of BR when the target
> has no landing pad, similar to what ftrace and BPF do.

Hmm, doesn't that somewhat undermine the purpose of using BTI in the
kernel? Now we're going to create PLTs that can branch to arbitrary
addresses.

> This was found by testing with klp-build and Clang 21, but the issue is
> not specific to klp-build.  It's inherent to any livepatch module use of
> klp relocations.
> 
> Previous tests with Clang 20 did not show this problem, as older Clang
> unconditionally emits "bti c" for every C function.

Is there an option to restore that behaviour if CONFIG_LIVEPATCH=y?
Otherwise, I think I'd be more inclined to add yet-another dependency
to CONFIG_ARM64_BTI_KERNEL so it's disabled if LIVEPATCH is selected.

Will

