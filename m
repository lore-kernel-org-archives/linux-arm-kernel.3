Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26391C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 18:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsZKe67h58zD6TPYh/iONlX3wxFqEjCYjEE0t327lqs=; b=JLrhQ45fPE27ED9mldrg4ILf6c
	M3LTX0SQL0zpYJRi6zsWfWbO362+fgCN+WdsskH25zRPm+r40EgUcSFE/OWs5Z7wCvXU9b2cjJ7Xu
	VsZnNz11iQM6U4fAeCMmwK0rMI+Q3xmW3im9eb62KZvZDNv4/wGsllrcJ94vCST/ShxTAlbWnTN9N
	8OYGjrEWYIkUciK25+LoR75lueg/Mzt2LQvQxRJeSDVrqdnoa7nKD6osNXP21ahvXHMYh+92yuk48
	aZ7W9ggOxkFiR3vK8P8jZrXAYwKYDId7yuCUophQ3PGiCWgNHQGVet7HOAmtJpz6mp1tM+zekVHch
	GleFc3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmbXI-0000000CYm4-3SC4;
	Wed, 22 Jul 2026 18:19:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmbXF-0000000CYlh-1mMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 18:19:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FDE21595;
	Wed, 22 Jul 2026 11:19:05 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B5263F59E;
	Wed, 22 Jul 2026 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784744349; bh=gexUY3MO1NYMIt5+4b+Z9AIUlrWUUcj9/Dzpwo5+F+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bolhfH6nwRwlZ9Rt3oQdeQtyGNQNwRenYiTJbVSlKyM4HgMURSH7uIWdk9u24659s
	 2k1ZgV/+heCaAiqMwoGsFmvLA+hXuMW6ELfIoI9wb6jJ4oFjYfiYROeaVy0CbVald8
	 470GVt3Ty9QsOpWvz+uIJHVKDIrr1Y+DFPdxaTBY=
Date: Wed, 22 Jul 2026 19:18:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Linus Walleij <linusw@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v17 15/15] arm64: vdso: Expose sigreturn address on vdso
 to the kernel
Message-ID: <amEJkyKFvVOkiGao@J2N7QTR9R3>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
 <20260721081858.1169276-16-ruanjinjie@huawei.com>
 <CAD++jL=Ou_HF5VchexnjUf9qwzrz0xgY+NhA5gZhOwiwdxUi-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=Ou_HF5VchexnjUf9qwzrz0xgY+NhA5gZhOwiwdxUi-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_111913_583130_1290C636 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: thuth@redhat.com, wad@chromium.org, anshuman.khandual@arm.com, kees@kernel.org, catalin.marinas@arm.com, yeoreum.yun@arm.com, kevin.brodsky@arm.com, linux-kernel@vger.kernel.org, oleg@redhat.com, luto@amacapital.net, pengcan@kylinos.cn, peterz@infradead.org, broonie@kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, ryan.roberts@arm.com, will@kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 10:55:03AM +0200, Linus Walleij wrote:
> On Tue, Jul 21, 2026 at 10:19 AM Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
> > Syscall User Dispatch (SUD) must not intercept the signal trampoline
> > code, otherwise returning from a signal with a locked selector may
> > cause infinite recursion into the signal handler.
> >
> > Provide an arm64 implementation of arch_syscall_is_vdso_sigreturn()
> > to exclude these sigreturn syscalls from dispatch.
> >
> > For native 64-bit tasks, check whether the current PC matches the 'svc #0'
> > instruction inside the vDSO sigreturn trampoline (defined in
> > arch/arm64/kernel/vdso/sigreturn.S as below).
> >
> >         SYM_CODE_START(__kernel_rt_sigreturn)
> >                 mov     x8, #__NR_rt_sigreturn
> >                 svc     #0
> >         SYM_CODE_END(__kernel_rt_sigreturn)
> >
> > For COMPAT tasks, verify that the instruction falls within the dedicated
> > 'sigpage' range, since compat signal handlers use this architecture-
> > specific page (not the vDSO) for their return trampoline. This prevents
> > SUD from incorrectly dispatching syscalls issued during signal return.
> >
> > Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> > Suggested-by: kemal <kmal@cock.li>
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> I'm a bit scared about SUD.
> 
> Certainly we can merge patches 1-14 first and iron out
> any trouble related to that and split this off so a separate
> series to be applied lated?

I had already asked Jinie to drop SUD back in v14, and he had agreed:

  https://lore.kernel.org/lkml/akegeU59jSK9t7FX@J2N7QTR9R3/
  https://lore.kernel.org/lkml/3ac6d4be-7c57-44c2-80a0-408e2c6f8136@huawei.com/

Jinjie, please drop this for now, as we had _already_ agreed.

I will look over the rest of the series soon.

Mark.

