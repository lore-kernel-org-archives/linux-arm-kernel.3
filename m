Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521D9E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiCA2IlwLmUvEw9b5y74mkq5kMrsaUHvP1aNYOrBAeg=; b=t0cWmU5GmMSr4/nv8UHAWvSlRI
	53g2yAkdmqNoU2UYKbKboqExF5sWaRafYNHcpZzxHj0XMmAJ8msAR9fKS4kIZraACd03SmjCaAEIR
	Mk3z4ZzR6xrbgZFHhsszOWRBsL53cg1GRX0svt8UxdKYnEKoX12z34xe81mGRgbpcyekCBHZANVcI
	NtESVc8YRGIovMp6tACuYOKH3NBPK4lh9/Gbu1Y23f32+i9M5uhC0C7dOl5pkurp6RwnvjPVcFPKW
	/7SNWufditEnbV/3oY28XdKnPtCVOhPV9GueKEiDIn3EP3ObIG8Mrnb/fuua/k0RShNzMeQ4zdHp9
	yWXmDXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Dkt-00000009jba-3Hvf;
	Sat, 02 Nov 2024 13:01:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Ce3-00000009cYP-1ysI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E9D15C27EF;
	Sat,  2 Nov 2024 11:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E12C4CEC3;
	Sat,  2 Nov 2024 11:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730548217;
	bh=vVWUYhECZljkizsteSK5cJaOa6hP9/5kTSab4Q4jJ34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pGQ3gXYeleUEF7budwO5vhNjFQOFWnX8NLdy/WnO7UgBk5SWAHpiF5qZVjKT/5nSC
	 XugYm807w1JCLxqX29gpy0lu2dEviIzqAumdYvL/VIbUNjrO1B+gKLSebxHbUjlluJ
	 kfntz3kD2dHPYt45Fkxn1WblzOY3ISAToGqHZ5Lgh/zeqLSajLMOWa5c6hhPNIAjGh
	 UoXMDyHpAqgy1fObkPlTf0DzMD4DLYL7ILlUiYyG7FnsQs9aykZ254DQ5bdYHEyuQl
	 rSLjArut4dHq030SFzmEgZV3YGGctD0m2qJg6TKk926Oiip8wNHoPfyT55TIScY+6n
	 5C3ZDiriI5Www==
Message-ID: <f35aa5a1-96fd-4e9a-9ecc-5e900d440d4c@kernel.org>
Date: Sat, 2 Nov 2024 13:50:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usb: dwc3: core: Fix system suspend on TI AM62
 platforms
To: William McVicker <willmcvicker@google.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Dhruva Gole <d-gole@ti.com>, Vishal Mahaveer <vishalm@ti.com>,
 msp@baylibre.com, srk@ti.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Chris Morgan <macroalpha82@gmail.com>
References: <20241011-am62-lpm-usb-v3-1-562d445625b5@kernel.org>
 <ZyVfcUuPq56R2m1Y@google.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <ZyVfcUuPq56R2m1Y@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_045019_653641_3D7A9072 
X-CRM114-Status: GOOD (  27.55  )
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

Hi William,

On 02/11/2024 01:08, William McVicker wrote:
> +linux-arm-msm@vger.kernel.org
> 
> Hi Roger,
> 
> On 10/11/2024, Roger Quadros wrote:
>> Since commit 6d735722063a ("usb: dwc3: core: Prevent phy suspend during init"),
>> system suspend is broken on AM62 TI platforms.
>>
>> Before that commit, both DWC3_GUSB3PIPECTL_SUSPHY and DWC3_GUSB2PHYCFG_SUSPHY
>> bits (hence forth called 2 SUSPHY bits) were being set during core
>> initialization and even during core re-initialization after a system
>> suspend/resume.
>>
>> These bits are required to be set for system suspend/resume to work correctly
>> on AM62 platforms.
>>
>> Since that commit, the 2 SUSPHY bits are not set for DEVICE/OTG mode if gadget
>> driver is not loaded and started.
>> For Host mode, the 2 SUSPHY bits are set before the first system suspend but
>> get cleared at system resume during core re-init and are never set again.
>>
>> This patch resovles these two issues by ensuring the 2 SUSPHY bits are set
>> before system suspend and restored to the original state during system resume.
>>
>> Cc: stable@vger.kernel.org # v6.9+
>> Fixes: 6d735722063a ("usb: dwc3: core: Prevent phy suspend during init")
>> Link: https://lore.kernel.org/all/1519dbe7-73b6-4afc-bfe3-23f4f75d772f@kernel.org/
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
>> ---
>> Changes in v3:
>> - Fix single line comment style
>> - add DWC3_GUSB3PIPECTL_SUSPHY to documentation of susphy_state
>> - Added Acked-by tag
>> - Link to v2: https://lore.kernel.org/r/20241009-am62-lpm-usb-v2-1-da26c0cd2b1e@kernel.org
>>
>> Changes in v2:
>> - Fix comment style
>> - Use both USB3 and USB2 SUSPHY bits to determine susphy_state during system suspend/resume.
>> - Restore SUSPHY bits at system resume regardless if it was set or cleared before system suspend.
>> - Link to v1: https://lore.kernel.org/r/20241001-am62-lpm-usb-v1-1-9916b71165f7@kernel.org
>> ---
>>  drivers/usb/dwc3/core.c | 19 +++++++++++++++++++
>>  drivers/usb/dwc3/core.h |  3 +++
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>> index 9eb085f359ce..ca77f0b186c4 100644
>> --- a/drivers/usb/dwc3/core.c
>> +++ b/drivers/usb/dwc3/core.c
>> @@ -2336,6 +2336,11 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>>  	u32 reg;
>>  	int i;
>>  
>> +	dwc->susphy_state = (dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0)) &
>> +			    DWC3_GUSB2PHYCFG_SUSPHY) ||
>> +			    (dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0)) &
>> +			    DWC3_GUSB3PIPECTL_SUSPHY);
>> +
> 
> I'm running into an issue on my Pixel 6 device with this change when the
> dwc3-exynos device has runtime PM enabled. Basically, after the device boots up
> and I disconnect USB, the dwc3-exynos device enters runtime suspend followed by
> system suspend 15 seconds later. On system suspend, the clocks powering these
> dwc3 registers are off which results in an SError. I have verified that
> reverting this change fixes the issue.
> 
> I noticed that dwc3-qcom.c also supports runtime PM for their dwc3 device and
> most likely is affected by this as well. It would be great if someone with a
> Qualcomm device could test out dwc3 suspend as well.

Chris was facing another issue with this patch on Rockchip RK3566 [1]

Looks like we totally missed the runtime suspended case
I'll think about a solution and send something by today.

[1] - https://lore.kernel.org/all/671bef75.050a0220.e4bcd.1821@mx.google.com/

> 
> Here is the crash stack:
> 
>   SError Interrupt on CPU7, code 0x00000000be000011 -- SError
>   CPU: 7 UID: 1000 PID: 5661 Comm: binder:477_1 Tainted: G        W  OE      6.12.0-rc3-android16-0-maybe-dirty-4k #1 0439eacb3cff642033630df7ee2e250e0625f2f0
>   96 irq, BUS_DATA0 group, 0x0
>   Tainted: [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
>   Hardware name: Raven DVT (DT)
>   pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : readl+0x40/0x80
>   lr : readl+0x38/0x80
>   sp : ffffffc08baa39a0
>   x29: ffffffc08baa39a0 x28: ffffffd4dd140000 x27: ffffffd4dd140d70
>   x26: ffffffd4dd2b2000 x25: ffffff800cef2410 x24: ffffff800cef24c0
>   x23: ffffffd4dd24e000 x22: ffffff887df59440 x21: ffffffc085298100
>   x20: ffffffd4db8acf60 x19: ffffffc085298200 x18: ffffffc091b730b0
>   x17: 000000002a703c0b x16: 000000002a703c0b x15: 0000000000953000
>   x14: 0000000000000000 x13: 0000000000000030 x12: 0101010101010101
>   x11: 7f7f7f7f7f7fffff x10: 0000000000000000 x9 : ffffffd4dc0d7d48
>   x8 : 0000000000000000 x7 : 0000000000008000 x6 : 0000000000000000
>   x5 : 500020737562ffff x4 : 500020737562ffff x3 : ffffffd4db8acf60
>   x2 : ffffffd4db8a7bac x1 : ffffffc085298200 x0 : 0000000000000020
>   Kernel panic - not syncing: Asynchronous SError Interrupt
>   CPU: 7 UID: 1000 PID: 5661 Comm: binder:477_1 Tainted: G        W  OE      6.12.0-rc3-android16-0-maybe-dirty-4k #1 0439eacb3cff642033630df7ee2e250e0625f2f0
>   Tainted: [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
>   Hardware name: Raven DVT (DT)
>   Call trace:
>    dump_backtrace+0xec/0x128
>    show_stack+0x18/0x28
>    dump_stack_lvl+0x40/0x88
>    dump_stack+0x18/0x24
>    panic+0x134/0x45c
>    nmi_panic+0x3c/0x88
>    arm64_serror_panic+0x64/0x8c
>    do_serror+0xc4/0xc8
>    el1h_64_error_handler+0x34/0x48
>    el1h_64_error+0x68/0x6c
>    readl+0x40/0x80
>    dwc3_suspend_common+0x34/0x454
>    dwc3_suspend+0x20/0x40
>    platform_pm_suspend+0x40/0x90
>    dpm_run_callback+0x60/0x250
>    device_suspend+0x334/0x614
>    dpm_suspend+0xc4/0x368
>    dpm_suspend_start+0x90/0x100
>    suspend_devices_and_enter+0x128/0xad0
>    pm_suspend+0x354/0x650
>    state_store+0x104/0x144
>    kobj_attr_store+0x30/0x48
>    sysfs_kf_write+0x54/0x6c
>    kernfs_fop_write_iter+0x104/0x1e4
>    vfs_write+0x3bc/0x50c
>    ksys_write+0x78/0xe8
>    __arm64_sys_write+0x1c/0x2c
>    invoke_syscall+0x58/0x10c
>    el0_svc_common+0xa8/0xdc
>    do_el0_svc+0x1c/0x28
>    el0_svc+0x38/0x6c
>    el0t_64_sync_handler+0x70/0xbc
>    el0t_64_sync+0x1a8/0x1ac
> 
> Thanks,
> Will
> 
> <snip>
> 

-- 
cheers,
-roger

