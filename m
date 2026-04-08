Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18CCF10F9958
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfdyWJ3Qr80V1uKZXTFnDLnM4nsCDmkZ8bNVSdiS6I4=; b=BhoBd01XT7IBaAcHRm1lb3vK6D
	TfOr9bBICnq4sE1kdZN6X0qM7hnQnLtYI8JC+V4Gc5/y6uRMPMZPpgjup9UFs0K01xIkmmKAGCjyx
	4o89f9RzXF6tNNzF1SJd+by9zFt5EGYHnQ1biWcXqUp1Ot5Dy4RucUsmAnDqY92jWtvAY41ZEr3ie
	mW29nAwYaJO/OnjZjwRRKzjmyG2KQUm+bJS5m3/F+zzdFwcN7T9XhEocZV9tDqqQK5LU1GnP5gDfC
	izJOxj0BTca4c0ktF861Gg/9iA+phYl+h+TOh/dN/rkPuBP+JXqmgFg30v61ASbGmZ9M1A3QCxW6T
	iP2eOBSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAVaB-000000096UO-3GKh;
	Wed, 08 Apr 2026 16:16:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAVa8-000000096U3-33Jr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 16:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CfdyWJ3Qr80V1uKZXTFnDLnM4nsCDmkZ8bNVSdiS6I4=; b=ITMYpG4U+EmGmjq/YNIMceE19n
	Y0SKNHfYZ24VAtlLKbvBPlyGJ/hqHSRCP7MJRMJGXUlkvoLDqoZqP8dAY2T3Je0M45/r+lVzKHVRC
	pA2V3Pw0dXjbpWGy9MjKsX1FJSVP1OdeW7D3NvdVR01jvh7BHtGQJq/wFd9MniTpJVDR6WkasS8IG
	GxXuJ773xL7bv2fxezmkDS1T0xwLOmVCXLN7v/hYOO+3NrtOnOOMamUkdPJNgheAsg9p0UggVhzvk
	q/Ph0j5x8sftCAYnHEqknVfE1XG9zwZC5vb5LL7eefI1GxLB1Gglgs1ryd5SMM5aR5/zdXSj6vI+0
	7XCB/rKQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46498)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wAVa5-000000002Xb-0zoE;
	Wed, 08 Apr 2026 17:16:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wAVa2-000000003TA-2L3h;
	Wed, 08 Apr 2026 17:16:38 +0100
Date: Wed, 8 Apr 2026 17:16:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-ext4@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	dmaengine@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Subject: Re: BUG: net-next (7.0-rc6 based and later) fails to boot on Jetson
 Xavier NX
Message-ID: <adZ_ZmjcE8S22vR1@shell.armlinux.org.uk>
References: <adZTGOjjJrVJOcT8@shell.armlinux.org.uk>
 <adZfTi3R6jtsjXx-@shell.armlinux.org.uk>
 <adZ9grUg71f518Fg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adZ9grUg71f518Fg@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_091644_768359_EFDCBB6D 
X-CRM114-Status: GOOD (  12.08  )
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

On Wed, Apr 08, 2026 at 05:08:34PM +0100, Russell King (Oracle) wrote:
> The rebase is still progressing, but it's landed on:
> 
> c7d812e33f3e dmaengine: xilinx: xilinx_dma: Fix unmasked residue subtraction
> 
> and while this boots to a login prompt, it spat out a BUG():
> 
> BUG: sleeping function called from invalid context at kernel/locking/mutex.c:591
> in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 56, name: kworker/u24:3
> preempt_count: 0, expected: 0
> RCU nest depth: 0, expected: 0
> 3 locks held by kworker/u24:3/56:
>  #0: ffff000080042148 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work+0x184/0x780
>  #1: ffff80008299bdf8 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1ac/0x780
>  #2: ffff0000808b48f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x2c/0x188
> irq event stamp: 10872
> hardirqs last  enabled at (10871): [<ffff80008013a410>] ktime_get+0x130/0x180
> hardirqs last disabled at (10872): [<ffff800080d61ac8>] _raw_spin_lock_irqsave+0x84/0x88
> softirqs last  enabled at (9216): [<ffff80008002807c>] fpsimd_save_and_flush_current_state+0x3c/0x80
> softirqs last disabled at (9214): [<ffff800080028098>] fpsimd_save_and_flush_current_state+0x58/0x80
> CPU: 5 UID: 0 PID: 56 Comm: kworker/u24:3 Not tainted 7.0.0-rc1-bisect+ #654 PREEMPT
> Hardware name: NVIDIA NVIDIA Jetson Xavier NX Developer Kit/Jetson, BIOS 6.0-37391689 08/28/2024
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>  show_stack+0x18/0x30 (C)
>  dump_stack_lvl+0x6c/0x94
>  dump_stack+0x18/0x24
>  __might_resched+0x154/0x220
>  __might_sleep+0x48/0x80
>  __mutex_lock+0x48/0x800
>  mutex_lock_nested+0x24/0x30
>  pinmux_disable_setting+0x9c/0x180
>  pinctrl_commit_state+0x5c/0x260
>  pinctrl_pm_select_idle_state+0x4c/0xa0
>  tegra_i2c_runtime_suspend+0x2c/0x3c
>  pm_generic_runtime_suspend+0x2c/0x44
>  __rpm_callback+0x48/0x1ec
>  rpm_callback+0x74/0x80
>  rpm_suspend+0xec/0x630
>  rpm_idle+0x2c0/0x420
>  __pm_runtime_idle+0x44/0x160
>  tegra_i2c_probe+0x2e4/0x640
>  platform_probe+0x5c/0xa4
>  really_probe+0xbc/0x2c0
>  __driver_probe_device+0x78/0x120
>  driver_probe_device+0x3c/0x160
>  __device_attach_driver+0xbc/0x160
>  bus_for_each_drv+0x70/0xb8
>  __device_attach+0xa4/0x188
>  device_initial_probe+0x50/0x54
>  bus_probe_device+0x38/0xa4
>  deferred_probe_work_func+0x90/0xcc
>  process_one_work+0x204/0x780
>  worker_thread+0x1c8/0x36c
>  kthread+0x138/0x144
>  ret_from_fork+0x10/0x20
> 
> This is reproducible.

I've just realised that it's the Tegra I2C bug that is already known
about, but took ages to be fixed in mainline - it's unrelated to the
memory corruption, so can be ignored. Sorry for the noise.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

