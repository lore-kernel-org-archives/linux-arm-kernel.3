Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09B7C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9YbearJ0f0UeoTdNEyEjg8H5rl/0x0qab6+g/6H7WDA=; b=s/414v7aaVQyovvgyO7fPHyCT9
	e68Bs+jadDLKo7N77/kIzkKMOuPA8+wQP0QSzufizoC65oKOJQtZ9cSzLfrFjfClK2PC2dkQCcMj9
	Fo7CsJ1xBmW7FUf5tUqX7itvyh740d266eIJcYaxxH7emhgVB3cAJl4NJsNlRFBdcGv2Hn5Z1QbW+
	i2ZoLD2ZBD8AFjwaowsoZibcOQ8SPpjuJ2OyiNtBBOQfGi5ILgeOcRCVnPGqPAiOVbh9zaT8XGu1d
	KxqMdl0E9k+AxdYMrtPBqgRyZJ+SIOctsrrajMvdikMrFQOeLdtKJvtm7umWfzKAKtl1t2XU1+K/x
	wx+EmDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCa7-0000000FMzV-2ZTd;
	Fri, 27 Jun 2025 17:09:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBJ6-0000000FA3p-35S8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:48:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D25B4380A;
	Fri, 27 Jun 2025 15:48:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AFCC4CEE3;
	Fri, 27 Jun 2025 15:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039284;
	bh=DaR0iPiYgLvh/V0Cw9KCViUO7HkP0TAN3cBYEqIZzRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZOGbJc9oYtyf7Cl09e9yVtjMtSMWUDzk2DZWFfieWiMa1QpqfXuZq01ZZEUnPZ+4
	 rC58DPJG+xf+/woJ8zB3Gfh7OaD+75Owe7j5xfq+RQvilmrqioQQ5yc4VHGFwD5M3h
	 4Uu+bHdA0+gDApQQb3HWmWTut7gIsGFzm40m/slFkU9BoEN2r0RdmwsOzPNHY1CFmW
	 lXk2Sn/9Z0OEyxZv+OBbiwel/6HqA6g8U9xijdT1KAIHAN7kuIRCg4+l62QS6tQy9v
	 QcRli+zDKePa7v0HT1675K5I77PxtdfCMJHTRQF2yar58ymLXCsVtvDU3MzMnetWkB
	 oyjR3tvYJ3q7g==
Date: Fri, 27 Jun 2025 16:48:00 +0100
From: Will Deacon <will@kernel.org>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [report] WARN_ON_ONCE() was triggered with pseudo NMI enabled
Message-ID: <aF69MAUB84bPX-Sy@willie-the-truck>
References: <ce10f231-4ecd-cb12-4b5c-1c503d9177da@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce10f231-4ecd-cb12-4b5c-1c503d9177da@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084804_791870_7CBDB02A 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 12, 2025 at 05:27:50PM +0800, Zenghui Yu wrote:
> With pseudo NMI enabled, I can trigger the following splat when running
> selftests (e.g., arm64/signal/fake_sigreturn_bad_magic, which will issue
> a BRK instruction).
> 
>  ------------[ cut here ]------------
>  WARNING: CPU: 5 PID: 386876 at ./arch/arm64/include/asm/irqflags.h:34
> send_user_sigtrap+0xc8/0xd0
>  CPU: 5 UID: 0 PID: 386876 Comm: fake_sigreturn_ Kdump: loaded Not
> tainted 6.14.0-rc6-00017-g5e35b5d3ce97-dirty
>  pstate: 204003c9 (nzCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  pc : send_user_sigtrap+0xc8/0xd0
>  lr : brk_handler+0x3c/0xbc
>  sp : ffff8000ade3be00
>  pmr: 000000f0
>  x29: ffff8000ade3be00 x28: ffff00209777c600 x27: 0000000000000000
>  x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000400e30
>  x23: ffff800082cb8458 x22: ffff800082cb83c8 x21: 00000000f200029a
>  x20: ffff8000ade3beb0 x19: ffff8000ade3beb0 x18: 0000000000000000
>  x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
>  x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>  x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
>  x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffff8000827e6638
>  x5 : 0000000000000000 x4 : ffff8000827e6638 x3 : 0000000060000000
>  x2 : ffff8000ade3c000 x1 : 0000000000000001 x0 : 00000000000000d0
>  Call trace:
>   send_user_sigtrap+0xc8/0xd0 (P)
>   brk_handler+0x3c/0xbc
>   do_debug_exception+0x68/0x110
>   el0_dbg+0x28/0xb8
>   el0t_64_sync_handler+0x50/0xcc
>   el0t_64_sync+0x1ac/0x1b0
>  ---[ end trace 0000000000000000 ]---
> 
> I use mainline and the kernel is built with defconfig + ARM64_PSEUDO_NMI
> + ARM64_DEBUG_PRIORITY_MASKING.

This is fixed by Ada's series:

https://lore.kernel.org/r/20250620211207.773980-1-ada.coupriediaz@arm.com

Will

