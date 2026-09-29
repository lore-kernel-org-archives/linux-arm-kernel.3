Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397EFCA5FAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJHLsnpcNA0uTePr2GlOIQUb3XJZmhtwsyzzBMfiqjs=; b=v/jXlRs41af04Z0bbfYPbE2eX3
	FCkoLAeTpYKXvspLZCO1fKntBUDSv80t4RW4CK2GNzvyEkizLZXQhwwI3DwJQs8JBwlfJNXDxaVWn
	f5oXu1R9ItX7+5cWMGT1oi//v2HZBqIUKF4f3rPjriTZbSJjyNflIkSNiBxv9wHyXpWQjNnYfqbkw
	5PGyDj1aSncErjRxk3nuYOUNi/CEQMxKVX+7ucS+aX9InR30f6h33Ol5OGHwkusvvtUmytkqoeYzz
	HwYyA6uW8CUFR5r6UB0KiIBZxaor5m9Qyd1bRNF0Bk0Hg5lx42RcR+LOu0N/y56MFhGZUF1P1cL11
	Lph4Blcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYtZ-00000003nY4-2uKc;
	Tue, 29 Sep 2026 14:33:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYtY-00000003nXs-0i9X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:33:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C11860008;
	Tue, 29 Sep 2026 14:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84491F000FF;
	Tue, 29 Sep 2026 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790692403;
	bh=hJHLsnpcNA0uTePr2GlOIQUb3XJZmhtwsyzzBMfiqjs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QMk7n7fK582l2SG6gvpFPcNiwSIAWgS/JHPXyyx/xyD9rd4yc0MFOaQ5CHanM5wDX
	 wPHjijvU1QRKT0q7i424r4ppLn8RMpZydfTaEulN5vZAL4Di83V939/W0Z0Ymfpluo
	 p1J9aF+eisnKXsh9pqX1+TLfVhLAoGmsGJnaqpt2ffNiJMwc1fUIUITXFMIcKuY7b5
	 /d0fac8HxoIqoCsGP+3H0M5kN9myuetgA5FEX2IjIif6Eti66NfTkBpSVdclRIHKcR
	 Uqnw5emfULHcHJm9txWntjFpm22TbC6pQ1FjZV0vabEbJfE7LOJAKc9YJKaLQhooge
	 CKfjvxI6LVPWQ==
Date: Tue, 29 Sep 2026 15:33:18 +0100
From: Will Deacon <will@kernel.org>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	syzbot+635d160c0d4133481520@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [RFC PATCH] arm64: mm: recover from kernel-mode SEA via
 exception table
Message-ID: <arvMLr8Mdh6ZKCtq@willie-the-truck>
References: <20260912135546.55977-1-ngocthang2710.1999@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912135546.55977-1-ngocthang2710.1999@gmail.com>
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

On Sat, Sep 12, 2026 at 08:55:46PM +0700, Nguyen Ngoc Thang wrote:
> do_sea() unconditionally calls die() for a synchronous external
> abort taken at EL1, without ever consulting the exception table.
> This is inconsistent with __do_kernel_fault(), which does check
> fixup_exception() before giving up.
> 
> A SEA at EL1 is reachable and recoverable: futex's LL/SC atomic ops
> (__llsc_futex_cmpxchg/__llsc_futex_atomic_*) carry
> _ASM_EXTABLE_UACCESS_ERR entries, but if the user address is mapped
> to Device memory (e.g. a PCI BAR obtained via sysfs "resourceN" and
> mmap'd MAP_FIXED), the LDXR/STLXR pair faults with a SEA instead of
> a translation fault, and the extable fixup is never reached, so the
> kernel oopses instead of returning -EFAULT to userspace.
> 
> Check fixup_exception() for kernel-mode SEAs before dying, mirroring
> __do_kernel_fault(). No taint is added on the recovered path since
> this is a userspace-triggerable condition, not a hardware failure;
> a ratelimited warning keeps a trace of it.
> 
> Reported-by: syzbot+635d160c0d4133481520@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=635d160c0d4133481520
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
> ---
> Sent as RFC: verified by code inspection (ESR/DFSC decode matches
> the extable-carrying LL/SC futex path) but not yet reproduced under
> QEMU on my end; would appreciate a look before I chase the aarch64
> repro further.
> 
>  arch/arm64/mm/fault.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

I guess this is trying to solve same issue that was reported here:

https://lore.kernel.org/all/apsIH2hDpeiGiazJ@willie-the-truck/

however, I suspect you don't have to try too hard to make the abort
asynchronous and then this won't help. At least, if we want to go down
this route (or having a fixup), we need a way to guarantee that these
things are always synchronous.

Will

