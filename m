Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9987FD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NHYKLJf5Ydgc00OY0GYJfIRrC+yABsa0iV0edOQ3TlE=; b=sSqxa3pLgsbt8CuAVDktv62V3F
	1V/eyh5p6aKc6hmcrpQ47GfiDDfiPP8b7DydGf4rhZ5PbD/wjdiu63x8M6U+51ZYu9pDSAxGxt/gI
	6W7oRd78ZnopJkODhCWdziumP5R9qd8Iw55e74k8ssuws2eUmyuuDA+83s9NtMQP75UKUzbIfGD84
	o6k2nu/uOPJ8ZGdIhBo0qyTpoYTZ+RBkwV4oBe+IQNwAhyF6xvQTI/AfmQnRqZK2GkznVbEO5mapr
	DbAwaK1ptJA7is520sQ3F44AFbNVReGCZWKToQRVulSuGU2ZhOw2ZHxXSQdjBAScJp7nH+GCGNrxY
	C0Fyr8xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSeOa-0000000DKEQ-2ZnQ;
	Mon, 08 Dec 2025 16:47:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSeOX-0000000DKDc-1Nd9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 16:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NHYKLJf5Ydgc00OY0GYJfIRrC+yABsa0iV0edOQ3TlE=; b=Y+b+tNDiUihO5IAIDug+Vcm1Xk
	6U52YpK5KhiQmhWWMkRB3TyP1U8+4xWe5QBkZJBMB8irzhRYPeDOHED96+OXDWiDyT7iTUPKzRPgp
	lMSqtiF7HxR/7bSoCQ/+y+hLsL2tgibbMjP9Dj69xv9TeU3tUgNyJMnw4N0Q8Tx2kBhgwj2u25UIw
	cOuHGB6J0FoxIs9r6CieWJcu4Gp0Pe3I2nMeuS1A+/SLB71CQODijwP/SwOP+7Zx37fkQsuyxmWKI
	QjbcpPW7H1M9VpPYT1jniIBpoxVZyL+5D/6TbBLfieyeJuVek3mPA/WPP9LR9gZULowlTPOxZaGzH
	XNmQ8/Tw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41288)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vSeOT-000000007y3-42kG;
	Mon, 08 Dec 2025 16:47:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vSeOS-000000005Bd-1NRZ;
	Mon, 08 Dec 2025 16:47:24 +0000
Date: Mon, 8 Dec 2025 16:47:24 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, torvalds@linux-foundation.org,
	viro@zeniv.linux.org.uk, will@kernel.org
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Message-ID: <aTcBHKFDBkSEp5mi@shell.armlinux.org.uk>
References: <aTbF009476Iufory@shell.armlinux.org.uk>
 <20251208150840.92209-1-xieyuanbin1@huawei.com>
 <aTb19aN_8PNduyDY@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTb19aN_8PNduyDY@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_084729_372605_68C83282 
X-CRM114-Status: GOOD (  33.80  )
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

On Mon, Dec 08, 2025 at 03:59:49PM +0000, Russell King (Oracle) wrote:
> On Mon, Dec 08, 2025 at 11:08:40PM +0800, Xie Yuanbin wrote:
> > On Mon, 8 Dec 2025 12:34:27 +0000, Russell King wrote:
> > > The first patch adds an additional check in __do_kernel_fault() to
> > > detect this condition. This patch is a non-obvious dependency for the
> > > next patch.
> > >
> > > The second patch handles faults above the top of userspace entirely
> > > separately, meaning we have a simpler and more obvious fault path,
> > > which avoids any possibility of taking any MM mutexes, which is the
> > > cause of the hash_name() problem.
> > >
> > > The third patch moves harden_branch_predictor() out of
> > > __do_user_fault() and to appropriate places in the parent functions.
> > > The reason this has been avoided thus far is because do_page_fault()
> > > can be a hot path (since it's used for page aging as well) but with
> > > kernel address faults being handled by an entirely separate path,
> > > this avoids adding to that overhead.
> > 
> > I don't have any objections to the first and second patches. However,
> > for the third patch, I feel it complicates some things. It removes
> > harden_branch_predictor() from __do_user_fault() and adds it to various
> > previous calling points.
> > 
> > This seems to be solely for adapting to the scenario of do_alignment() &&
> > user_mode(regs) && addr >= TASK_SIZE. Does this scenario really exist?
> 
> As explained in the other thread, alignment faults are the first thing
> that are checked when enabled, before permission fauls, so we can end
> up entering do_alignment() from userspace with an address in the
> kernel address space.
> 
> However, there is a user accessible page above TASK_SIZE, that is the
> vectors page which can have userspace helpers in. Userspace can read
> from this page, and thus can perform unaligned loads to this page.
> 
> The system behaviour of unaligned loads has been configurable, ARMv4,
> for example, had the ability to check for alignment faults and raise
> this exception. If that was disabled, then unaligned loads would
> load the equivalent 32-bit aligned address and rotate the data in
> the register. Compilers knew about this, and would code for it,
> which made it ABI. Later compilers stopped using that which cut down
> on the unaligned loads that userspace issued. Modern CPUs (ARMv7)
> tend to behave "sanely" in that unaligned loads are generally
> supported in hardware.

Also, would you mind giving ASAP some tested-by/reviewed-by for these
patches so they can be pushed out to linux-next for a bit of testing
there pelase? I'm on vacation from Thursday, so time is very short
to get these out - if we're not ready by Wednesday, then it'll be the
new year, possibly after the 11th January, before I can do anything
further (medical stuff.)

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

