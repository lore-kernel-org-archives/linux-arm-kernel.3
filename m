Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5508CDE002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1NRetAvDj6Zysapf6Nj83QBBrbnYgH2f7DVXGRpPmQ=; b=yiRwuMTRKkVw+d4dO979pynHxZ
	UKFtKc/9uVwFaVYy3iHPHxga9jEgEcQ6nMpplQV8+NxjAZ/5ohvOzGPFSdGK49hnnOytSiKHOBH5D
	T5XgZdTlskBoSGs4N8KxQZYgUuc3NG1YZwjEGGTbth/nhRlRqTZI0gMgWoPwnW/o2ZK5zeFU4wcn0
	qRypDjYpA5z0/+FvfiiS68R9IFghRUC+YVModwKkVKSGB3jOVR7xDBM4g+BDv9YAjMxsr0NUKCMts
	MWdCWk+cnBqlVZzG5n3igNfow/qBUnbUStMgj+5T46C5YCFmbzQNDkNh7XW5Xg4lT6B9AnZvVTl/v
	Eh+JnbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5nx-0000000BJeT-0ZjK;
	Fri, 26 Jun 2026 12:37:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd5nu-0000000BJde-1ntc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 12:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q1NRetAvDj6Zysapf6Nj83QBBrbnYgH2f7DVXGRpPmQ=; b=AtCJJF3CcxC2+M7yQPBFpgOu9U
	prM/53Pc76uGqFwtrN7d1fQxaRRiDmqUu0hEOVQUC2+W/CjOXzvu8RLB1xDEZw7TwtkUSe9kMTIaF
	YsnDtVp5/r4HUQbN+o9vcM6m2OOfZzwb28D5ACBGuamFTiR+y/nSDG5s4BflKMfqxcE/dxPOMvc2Z
	R3e0TyFQBm19fEDRomlwngHvU0Iw1Ngd/MlEJgo4DUoQqj/Qg+1EqDI+A227TWxrh/pl2PfBGEgy1
	NPlZuWVUtcEEFQUN84kMHmKa9trbN2eVDxX6DQt2mwv6CEXuVWp7PQOgWXMSrOQMGeZS+j318gaMo
	qwTNNvUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58358)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wd5nq-000000002EX-2RZt;
	Fri, 26 Jun 2026 13:37:02 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wd5no-0000000032I-2G2O;
	Fri, 26 Jun 2026 13:37:00 +0100
Date: Fri, 26 Jun 2026 13:37:00 +0100
From: Russell King <linux@armlinux.org.uk>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: xiqi2@huawei.com, akpm@linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	sunnanyong@huawei.com
Subject: Re: [PATCH v3 2/2] ARM: mm: protect show_pte() in do_DataAbort()
 fallback path
Message-ID: <aj5ybKcDxl1tOIx4@shell.armlinux.org.uk>
References: <20260626073048.3595106-3-xiqi2@huawei.com>
 <20260626101615.60920-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626101615.60920-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_053706_471875_942C18AD 
X-CRM114-Status: GOOD (  16.01  )
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

On Fri, Jun 26, 2026 at 06:16:15PM +0800, Xie Yuanbin wrote:
> On Fri, 26 Jun 2026 15:30:48 +0800, Qi Xi wrote:
> > @@ -638,7 +638,10 @@ do_DataAbort(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
> > 	pr_alert("8<--- cut here ---\n");
> > 	pr_alert("Unhandled fault: %s (0x%03x) at 0x%08lx\n",
> > 		inf->name, fsr, addr);
> > -	show_pte(KERN_ALERT, current->mm, addr);
> > +	if (mmap_read_trylock(current->mm)) {
> > +		show_pte(KERN_ALERT, current->mm, addr);
> > +		mmap_read_unlock(current->mm);
> > +	}
> 
> For kernel faults, `current->mm` maybe NULL, and
> `mmap_read_trylock(current->mm)` may cause a panic.
> Also, interrupts may be disabled here.
> 
> I suggest that waiting for this patch to be merged first:
> https://lore.kernel.org/20260625122612.43501-1-xieyuanbin1@huawei.com
> which make sure that interrupts are enabled here.

No, it doesn't ensure that.

show_pte() is also called from die_kernel_fault() and
__do_kernel_fault(), which can be from a path that has interrupts
disabled. See the comments in do_kernel_address_page_fault().

We are not "fixing" show_pte(), which is a diagnostic function when
things go wrong in the kernel, and is there to *try* to give us
information to diagnose what happened. It is *not* a function that
is used routinely in the kernel.

The fact it is racy with other CPUs may be a problem, but it isn't
a big problem because when it's called, the system is practically
dead anyway.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

