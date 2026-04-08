Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E11F10F995F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 16:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCQjPImbcEftTAPwYhgLEQBY2m96YlirY0cCMCw5db8=; b=S9Z8u2UETmL9jCTzubItVAIK7X
	TykmFSxgamRZveIS71Nnl8+ADVZGpAwLnaL+EhmJZNJmJyw6gS64Ub3TWY1EolCEq89LqWPHit7px
	YUUEyD19Cx9A3jAI8YQUWN9Tv/VfeKTdHGpGkaoKRVinCF7AQXyXkbRypor4CpqPDYSGBrqMGGPJi
	02C3+JmBbOKQLQTIPZuvLPlp+19MQYp/HOU7U56wKOT8ionreLpQTipJ5Pd/YzGOHWeKOCKxXh0Kh
	0PqZjry+SxYVHOVJZTkR5d8nDtMtA8LLGrEKIowveesQ0Vep9kcofi5I5EM7d1lYtOIxVq0imiFGY
	s333VfAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAVxX-000000098Bo-2pDq;
	Wed, 08 Apr 2026 16:40:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAVxU-000000098BG-3BrQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 16:40:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A6E62BC4;
	Wed,  8 Apr 2026 09:40:45 -0700 (PDT)
Received: from [10.57.85.157] (unknown [10.57.85.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 952A73F632;
	Wed,  8 Apr 2026 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775666450; bh=X7uwi1mTnlblHvnMF6Xvi2utMBucdMig04mZXn3jTOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F849nA4URN+RFi4j0f5jgoLpZlywmk3Pu6hMnA0qQncicSUV1k8+YOOGBYJZSzaWa
	 WMsa+sEqQWvwY50XlMrAdxLbQ+BeLEJsklz01UjQB01Siqe8pKdIb3MTS2FbTKw0vy
	 rIz0XlbsMeH2E12h1gNYQj8sc9EisZyfYvo/NbKo=
Message-ID: <3a1d0520-3402-47b2-9d7b-4e14a3cd07a4@arm.com>
Date: Wed, 8 Apr 2026 17:40:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: net-next (7.0-rc6 based and later) fails to boot on Jetson
 Xavier NX
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, dmaengine@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Theodore Ts'o
 <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
References: <adZTGOjjJrVJOcT8@shell.armlinux.org.uk>
 <adZfTi3R6jtsjXx-@shell.armlinux.org.uk>
 <adZ9grUg71f518Fg@shell.armlinux.org.uk>
 <adZ_ZmjcE8S22vR1@shell.armlinux.org.uk>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <adZ_ZmjcE8S22vR1@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_094052_953538_4A215C0C 
X-CRM114-Status: GOOD (  14.04  )
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

On 2026-04-08 5:16 pm, Russell King (Oracle) wrote:
> On Wed, Apr 08, 2026 at 05:08:34PM +0100, Russell King (Oracle) wrote:
>> The rebase is still progressing, but it's landed on:
>>
>> c7d812e33f3e dmaengine: xilinx: xilinx_dma: Fix unmasked residue subtraction

FWIW I don't see a Tegra having the Xilinx IP in it anyway - judging by 
the DT it has their own tegra-gpcdma engine...

There's a fair chance this could be 90c5def10bea ("iommu: Do not call 
drivers for empty gathers"), which JonH also reported causing boot 
issues on Tegras - in short, SMMU TLB maintenance may not be completed 
properly which could lead to recycled DMA addresses causing exactly this 
kind of random memory corruption. I CC'd you on a patch:

https://lore.kernel.org/linux-iommu/20260408162846.GE3357077@nvidia.com/T/#t

Thanks,
Robin.

>>
>> and while this boots to a login prompt, it spat out a BUG():
>>
>> BUG: sleeping function called from invalid context at kernel/locking/mutex.c:591
>> in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 56, name: kworker/u24:3
>> preempt_count: 0, expected: 0
>> RCU nest depth: 0, expected: 0
>> 3 locks held by kworker/u24:3/56:
>>   #0: ffff000080042148 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work+0x184/0x780
>>   #1: ffff80008299bdf8 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1ac/0x780
>>   #2: ffff0000808b48f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x2c/0x188
>> irq event stamp: 10872
>> hardirqs last  enabled at (10871): [<ffff80008013a410>] ktime_get+0x130/0x180
>> hardirqs last disabled at (10872): [<ffff800080d61ac8>] _raw_spin_lock_irqsave+0x84/0x88
>> softirqs last  enabled at (9216): [<ffff80008002807c>] fpsimd_save_and_flush_current_state+0x3c/0x80
>> softirqs last disabled at (9214): [<ffff800080028098>] fpsimd_save_and_flush_current_state+0x58/0x80
>> CPU: 5 UID: 0 PID: 56 Comm: kworker/u24:3 Not tainted 7.0.0-rc1-bisect+ #654 PREEMPT
>> Hardware name: NVIDIA NVIDIA Jetson Xavier NX Developer Kit/Jetson, BIOS 6.0-37391689 08/28/2024
>> Workqueue: events_unbound deferred_probe_work_func
>> Call trace:
>>   show_stack+0x18/0x30 (C)
>>   dump_stack_lvl+0x6c/0x94
>>   dump_stack+0x18/0x24
>>   __might_resched+0x154/0x220
>>   __might_sleep+0x48/0x80
>>   __mutex_lock+0x48/0x800
>>   mutex_lock_nested+0x24/0x30
>>   pinmux_disable_setting+0x9c/0x180
>>   pinctrl_commit_state+0x5c/0x260
>>   pinctrl_pm_select_idle_state+0x4c/0xa0
>>   tegra_i2c_runtime_suspend+0x2c/0x3c
>>   pm_generic_runtime_suspend+0x2c/0x44
>>   __rpm_callback+0x48/0x1ec
>>   rpm_callback+0x74/0x80
>>   rpm_suspend+0xec/0x630
>>   rpm_idle+0x2c0/0x420
>>   __pm_runtime_idle+0x44/0x160
>>   tegra_i2c_probe+0x2e4/0x640
>>   platform_probe+0x5c/0xa4
>>   really_probe+0xbc/0x2c0
>>   __driver_probe_device+0x78/0x120
>>   driver_probe_device+0x3c/0x160
>>   __device_attach_driver+0xbc/0x160
>>   bus_for_each_drv+0x70/0xb8
>>   __device_attach+0xa4/0x188
>>   device_initial_probe+0x50/0x54
>>   bus_probe_device+0x38/0xa4
>>   deferred_probe_work_func+0x90/0xcc
>>   process_one_work+0x204/0x780
>>   worker_thread+0x1c8/0x36c
>>   kthread+0x138/0x144
>>   ret_from_fork+0x10/0x20
>>
>> This is reproducible.
> 
> I've just realised that it's the Tegra I2C bug that is already known
> about, but took ages to be fixed in mainline - it's unrelated to the
> memory corruption, so can be ignored. Sorry for the noise.
> 


