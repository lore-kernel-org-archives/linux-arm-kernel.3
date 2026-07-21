Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EBFC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Y7k8VMwT1bRXBYuL9ekYtg1ggRsuHighus6g94A0VY=; b=p8vkOnyXwcWCHY2TejRcFJMM+u
	Zfy+fIDjd4eBwH47oWWpp3zQjFA7DtBnm7VXfV7MSMbizA2rIgugJxK1lhJ0sRBvYGNI+nOTOZ9hf
	+/x3lidAgJt4BN092kXUk8meA3oD7RUydvbmlksxe2xPPkgCD0w9DIituPaZ9yx/MG7KzsmhiqJ9+
	fzuAFEFo80lcaLpc3QWGNpbWuJ88ZDFtrDI0C9TbtHHoU2KhcqSsytDYGcbSYEzbSOnDVXtGHNMyG
	aZ8CdB1dGTHDywv3i1IpXa+qNu6qcXVdEmBA2NAcvMcNKW22cIp5JHA/HnNu3c6TzBDPJmsWJhDhH
	ALXqDoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7C1-000000092BS-1jcg;
	Tue, 21 Jul 2026 09:55:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm7Bz-000000092Ac-1ktW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 09:55:16 +0000
Date: Tue, 21 Jul 2026 11:55:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784627711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Y7k8VMwT1bRXBYuL9ekYtg1ggRsuHighus6g94A0VY=;
	b=ieXOW78fIWAjILQMVsYlTUOZ1UTgK8bzK0a9FGCLHBVf+9rJVR11OSiOV1xzKLS3a1S0//
	Re3fyKkq+qMt8XgqYK9oCvX/SEM4S544qgCeb2EofVA0v4iDdLfyrUfOu0ruRQppDtdT9p
	6rI/DBNxmaEzr3YcthdQBlwEQS/D1PEY/TPSeYksauOhv38rt9m5C4S300wuso+drGtZLz
	47jfhk9A2PElP8BwDUGVGougT/xvXYsf6lb82kuj7yFPI44Zef+ziOettVNCmN/UxywR+6
	69Rvg0aU+hzzuVEq/JP5JIi9stsz1BOhS/mnGeAZ0QSBevQa4z0tUvE+NVFnoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784627711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Y7k8VMwT1bRXBYuL9ekYtg1ggRsuHighus6g94A0VY=;
	b=SSRyXgIna5kbI0lsCs29JBLwLjxGcAQ7pWRKEzxzXMHb+ely0WM5K0ctSAcuhDto54q6sR
	7/ZVqpBaC9Y718Bg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v17 15/15] arm64: vdso: Expose sigreturn address on vdso
 to the kernel
Message-ID: <20260721115248-df7f647a-7031-438b-b79c-248d5b403cab@linutronix.de>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
 <20260721081858.1169276-16-ruanjinjie@huawei.com>
 <20260721104810-0a8ab042-2705-43e8-90d2-74e221f3fab5@linutronix.de>
 <8a1c8c38-e89b-4e22-9b46-aa53b0ed30f8@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a1c8c38-e89b-4e22-9b46-aa53b0ed30f8@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_025515_597165_41C54CBE 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, will@kernel.org, peterz@infradead.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linux-mm@kvack.org, linusw@kernel.org, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, yeoreum.yun@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 05:23:38PM +0800, Jinjie Ruan wrote:
(...)

> >>  arch/arm64/Kconfig                 |  1 +
> >>  arch/arm64/include/asm/elf.h       |  1 +
> >>  arch/arm64/kernel/vdso.c           | 16 ++++++++++++++++
> >>  arch/arm64/kernel/vdso/sigreturn.S |  1 +
> >>  arch/arm64/kernel/vdso/vdso.lds.S  |  1 +
> >>  5 files changed, 20 insertions(+)
> >>
> >> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >> index aea686dce3d5..a41d2b593899 100644
> >> --- a/arch/arm64/Kconfig
> >> +++ b/arch/arm64/Kconfig
> >> @@ -86,6 +86,7 @@ config ARM64
> >>  	select ARCH_SUPPORTS_SCHED_SMT
> >>  	select ARCH_SUPPORTS_SCHED_CLUSTER
> >>  	select ARCH_SUPPORTS_SCHED_MC
> >> +	select ARCH_SUPPORTS_SYSCALL_USER_DISPATCH
> > 
> > From the subject and description I would not have expected this to be in here.
> > Split into its own patch?
> 
> If ARCH_SUPPORTS_SYSCALL_USER_DISPATCH is not implemented, then it seems
> pointless to implement arch_syscall_is_vdso_sigreturn() separately,

Absolutely. Although a preparatory patch can introduce infrastructure like this.

> or perhaps we should revise the title to indicate support for SUD on arm64?

That works, too.

> >>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
> >>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
> >>  	select ARCH_WANT_DEFAULT_BPF_JIT
> > 
> > (...)
> > 
> > For the rest:
> > 
> > Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> Thanks for the review.

You're welcome!

Just to make it clear: This is only for this patch, not the whole series.


Thomas

