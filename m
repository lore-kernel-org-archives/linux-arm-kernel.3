Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C67CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zO17xD6fVEncCUQRFi4FEtuaNS1prWDROZS9ASYU5to=; b=u6tEBr+YwpcxzptDd7b+TOr7or
	SpE7m+mRDe5o4PJlyIPh3BDzQlz8CZ0rAJ4kS3amFWs+ya++VvhZPD0j4HZWZT5DsOJ8S8knsZNaz
	4fd6MWqnEgAmQeWbq2N9Cg2UeCwiNhmfe3BIGJ3fOGIry6zWC/piqU49Dmc7SxOQSOcSGMh2KEBxv
	VV6J5IyIuX9oOrruEmAsqZF1Q+70OtTu8xWpPyusmm1rcVd2q3RhMkbBLoLWuRAzDYX02el1AYAho
	WZc/gd6OxWmJC+yv2FyjqadjhH2Sxn3g63wAnnFoWuMDK9j44d8Tk0OHE2ieVJbNbSLgjIImrG/+C
	vlRKLDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd37G-0000000B14v-00oM;
	Fri, 26 Jun 2026 09:44:54 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd37C-0000000B13P-2bQY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zO17xD6fVEncCUQRFi4FEtuaNS1prWDROZS9ASYU5to=; b=bFINEHwWCcOm/GC2KPSl4Sto2l
	89WifYVCpx0fYRkgalv1HFMY/DqG12zLyATQG2o0iTJlSYZ4KDUxyyh1WRLlX69Bh+tpCjkVVSSfy
	PbJ1ID4RmvaKBUR8JNc7mMESwc0lPxAUQi9oaC6S7+896F90Y2yZbTGZMVebsLe5TtIvexuhP8Sv9
	DXKOQ+McLu+eKD7t+hfzEIAmlAk79JAbyuTJxhYoi5MvJV58Yherw+J65BaW1XK1S5r70xkTmo2i7
	gH9QJPa1oxSEf50MNsanAyjYDjNj1dYxqmvSbsHmzmMR4Vgy6oO3Vdj+oFpCkE9NHm2K1gr1FHcQV
	I66q4E8w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38334)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wd376-0000000024R-3rzm;
	Fri, 26 Jun 2026 10:44:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wd374-000000002wP-1kdy;
	Fri, 26 Jun 2026 10:44:42 +0100
Date: Fri, 26 Jun 2026 10:44:42 +0100
From: Russell King <linux@armlinux.org.uk>
To: Qi Xi <xiqi2@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yuanbin Xie <xieyuanbin1@huawei.com>,
	Nanyong Sun <sunnanyong@huawei.com>
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
Message-ID: <aj5KCj1cRX3_IpPN@shell.armlinux.org.uk>
References: <20260626073048.3595106-1-xiqi2@huawei.com>
 <20260626073048.3595106-2-xiqi2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626073048.3595106-2-xiqi2@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_024450_937952_6EA8621C 
X-CRM114-Status: GOOD (  14.67  )
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

On Fri, Jun 26, 2026 at 03:30:47PM +0800, Qi Xi wrote:
> When CONFIG_DEBUG_USER is enabled with user_debug=31 on 32-bit ARM,
> a user page fault triggers show_pte() via __do_user_fault() after
> do_page_fault() has already released mmap_read_lock. If another
> thread concurrently calls munmap(), the page table pages can be
> freed while show_pte() is still reading them, causing a
> use-after-free in show_pte().
> 
> The race can be reproduced on multi_v7_defconfig with:
>     CONFIG_DEBUG_USER=y
>     CONFIG_ARM_LPAE=y
>     kernel command line: user_debug=31
> 
> A delay inserted in show_pte() for testing widens the race window and
> makes the UAF reliably reproducible. On LPAE, the race works as
> follows:
> 
>   CPU 0 (fault path)                       CPU 1 (munmap)
>   munmap(page 0) -> clears PTE[0]
>   PTE/PMD pages remain
> 
>   read page 0 -> page fault
>     -> do_DataAbort()
>       -> do_page_fault()
>         -> lock_mm_and_find_vma() -> no VMA
>            (mmap_read_lock released)
>         -> __do_user_fault()
>           -> show_pte(tsk->mm, addr)
>             -> *pgd (valid)
>             -> p4d/pud checks pass
> 
>             -> [delay]                     munmap(page 1)
>                                              -> clears PTE[1]
>                                              -> PTE/PMD pages freed
>                                              -> PGD cleared
> 
>             -> pmd_offset(pud, addr)
>               -> *pud=0 -> __va(0)
>               -> dereference
>               -> secondary data abort (kernel)
> 
> Fix by taking mmap_read_lock() around show_pte() in __do_user_fault().
> __do_user_fault() is called from process context with interrupts
> enabled, so the context can sleep and mmap_read_lock() is safe here.

This is a fault path which should only be called when something is
already wrong, the mm lock may already be held (e.g. a kernel
fault while already holding the mmap lock.) We can't take any locks
here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

