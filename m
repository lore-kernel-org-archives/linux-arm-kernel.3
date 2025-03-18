Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1AAC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5Rcbgn/brE4cN4OsGqZWT0WB9w/pQoLq5p5/1dQ7Kk=; b=di3Dedtw2jq/z04d1YYiXvm9EW
	wg7lRN8RO9aqI8OYFQWsMGUhlWmx+I0wNVkAKLDxkNKhsuCF/nKmJ91u32c9As+uhLxY7aJ965N2g
	ncyT+3YZ+lzOWckqZfa2mKd4Bw+3X7/ypdi3rdecBZ7ZziXuXy55PwsfRavxFzp0BZhwcbQJCNeyX
	E/AzS43nG6fshwhzhjwKXMmHyh2/6Oy6uP6eGX/aQaR3tT5Lkfv6oFPG/VxiVHlqdFIi5HByaawkp
	MWw5KSz3KzmmHyUVP4PKTYMGJMbLg3uhnewwWzYtHkTQpGBF2prJJnkFxI22UBb8VRjAn0MLMHBjo
	yFkom8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuarJ-00000006hQx-0TZr;
	Tue, 18 Mar 2025 17:36:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuapb-00000006hFs-2Sns
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1742319263; x=1773855263;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=cK9UHCFIEHZ/bkxqhlNI7AlSj2scvOiHMU0q9c34Odg=;
  b=V8WfS9IOmpEIHDX9s0MOAjQ/2ssZjBKU8mMzswKyGjCX5I9IIElY1DSY
   GFJWFDYC6pN2w71mIttrKQLdyjtCH4JR8lhwkVU2nmdgNHJif3ZvXqyl1
   GRkHo6KmQ/eFBQUWEgRR7zaC8s9GZM3mkGqHElhaZF7likyXi7eFO3jYI
   YT6XAdxZyVOunebXxdvbZDEjP9DnaigJ/7rZJbYTU3jLOMlMHDJlNBwH5
   ItQoZ/C8jbQEGVfOADsgQpo3wY6XCgsZDMnLackF8uvxiWtZR6GLJpiuA
   P5xA7EMPA4T6wiljWGgw7TzkI8LwSIPUJoCpNuEde4GYQ4Blfaj5N7fbW
   A==;
X-CSE-ConnectionGUID: XsMgAJqqTzCZZegGml5tOg==
X-CSE-MsgGUID: NeEHDmQcTyKxJFzoXGsl+g==
X-IronPort-AV: E=Sophos;i="6.14,257,1736838000"; 
   d="scan'208";a="43603654"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Mar 2025 10:34:20 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Mar 2025 10:33:39 -0700
Received: from [10.10.179.162] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 18 Mar 2025 10:33:39 -0700
Message-ID: <7512d7fb-30dd-41f6-8936-45ff0d949876@microchip.com>
Date: Tue, 18 Mar 2025 10:33:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] AT91 Clock Adjustments
From: Ryan Wanner <ryan.wanner@microchip.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <mripard@kernel.org>
References: <cover.1738864727.git.Ryan.Wanner@microchip.com>
 <7dd5a0a2-4f56-48b4-8861-c7d75754faab@tuxon.dev>
 <b76108c1-3282-4b98-a210-b350e8ec0ec2@microchip.com>
Content-Language: en-US
In-Reply-To: <b76108c1-3282-4b98-a210-b350e8ec0ec2@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_103423_851078_44E84673 
X-CRM114-Status: GOOD (  28.70  )
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

On 2/26/25 08:36, Ryan wrote:
> On 2/26/25 02:06, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 06.02.2025 20:14, Ryan.Wanner@microchip.com wrote:
>>> From: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>
>>> This set has clock system adjustments for the AT91 clock system.
>>>
>>> The first is to adjust the slow clock driver to account for the updated
>>> DT node-naming for clocks and xtals and ensuring the driver is still
>>> backwards compatible.
>>>
>>> The second is a adding a missing clk_hw struct that is not added into
>>> parent_data struct causing a incorrect parent for main_osc.
>>>
>>> Ryan Wanner (2):
>>>   clk: at91: sckc: Fix parent_data struct for slow osc
>>>   clk: at91: sama7d65: Add missing clk_hw to parent_data
>>>
>>>  drivers/clk/at91/sama7d65.c |  1 +
>>>  drivers/clk/at91/sckc.c     | 12 ++++++------
>>>  2 files changed, 7 insertions(+), 6 deletions(-)
>>>
>>
>> There are boot failures on sama7g5 with this series on top of at91-next and
>> the following diff on sama7g5 dts to mimic the sama7d65 use case:
>>
>> diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
>> b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
>> index 0f5e6ad438dd..1bce9f999431 100644
>> --- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
>> +++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
>> @@ -35,16 +35,6 @@ aliases {
>>                 i2c2 = &i2c9;
>>         };
>>
>> -       clocks {
>> -               slow_xtal {
>> -                       clock-frequency = <32768>;
>> -               };
>> -
>> -               main_xtal {
>> -                       clock-frequency = <24000000>;
>> -               };
>> -       };
>> -
>>         gpio-keys {
>>                 compatible = "gpio-keys";
>>
>> @@ -132,6 +122,15 @@ spdif_out: spdif-out {
>>         };
>>  };
>>
>> +&slow_xtal {
>> +       clock-frequency = <32768>;
>> +};
>> +
>> +&main_xtal {
>> +       clock-frequency = <24000000>;
>> +};
>> +
>> +
>>  &adc {
>>         vddana-supply = <&vddout25>;
>>         vref-supply = <&vddout25>;
>> diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi
>> b/arch/arm/boot/dts/microchip/sama7g5.dtsi
>> index 17bcdcf0cf4a..3158c2f0b4c0 100644
>> --- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
>> +++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
>> @@ -117,12 +117,12 @@ map1 {
>>         };
>>
>>         clocks {
>> -               slow_xtal: slow_xtal {
>> +               slow_xtal: clk-slowxtal {
>>                         compatible = "fixed-clock";
>>                         #clock-cells = <0>;
>>                 };
>>
>> -               main_xtal: main_xtal {
>> +               main_xtal: clk-mainxtal {
>>                         compatible = "fixed-clock";
>>                         #clock-cells = <0>;
>>                 };
>>
>> I've identified the following:
>>
>>
>> cpu cpu0: _opp_config_clk_single: failed to set clock rate: -22
>> cpufreq: __target_index: Failed to change cpu frequency: -22
>> ------------[ cut here ]------------
>> kernel BUG at drivers/cpufreq/cpufreq.c:1523!
>> Internal error: Oops - BUG: 0 [#1] ARM
>> Modules linked in:
>> CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.14.0-rc1+ #11
>> Hardware name: Microchip SAMA7
>> PC is at cpufreq_online+0x8d8/0xa30
>> LR is at __wake_up+0x20/0x30
>> pc : [<c063cca0>]    lr : [<c0151254>]    psr: a0000013
>> sp : e0821d30  ip : 00000000  fp : c0e50508
>> r10: c434830c  r9 : c4348204  r8 : c0e97230
>> r7 : c4348264  r6 : 00000000  r5 : 000ca511  r4 : c4348200
>> r3 : 047e0d67  r2 : 047e0d67  r1 : 00000003  r0 : ffffffea
>> Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>> Control: 10c53c7d  Table: 60004059  DAC: 00000051
>> Register r0 information: non-paged memory
>> Register r1 information: non-paged memory
>> Register r2 information: non-paged memory
>> Register r3 information: non-paged memory
>> Register r4 information: slab kmalloc-512 start c4348200 pointer offset 0
>> size 512
>> Register r5 information: non-paged memory
>> Register r6 information: NULL pointer
>> Register r7 information: slab kmalloc-512 start c4348200 pointer offset 100
>> size 512
>> Register r8 information: non-slab/vmalloc memory
>> Register r9 information: slab kmalloc-512 start c4348200 pointer offset 4
>> size 512
>> Register r10 information: slab kmalloc-512 start c4348200 pointer offset
>> 268 size 512
>> Register r11 information: non-slab/vmalloc memory
>> Register r12 information: NULL pointer
>> Process swapper (pid: 1, stack limit = 0x08d7ca6b)
>> Stack: (0xe0821d30 to 0xe0822000)
>> 1d20:                                     00000000 e0821d98 c4348208 c0c00250
>> 1d40: 00000001 00000000 e0821d98 c0e50508 c4048000 00000000 c406f480 c4048000
>> 1d60: c4341ec0 c0e50508 c4341ec8 c063ce8c c0e593a8 c4048000 c406f4bc c406f480
>> 1d80: c4048000 c04c8bb0 c406f4cc c40704b0 00000000 047e0d67 3b9aca03 c0e5986c
>> 1da0: c0e5931c c0e97230 00000000 c063a618 00000000 c4048000 c0e59858 c40d0a10
>> 1dc0: c0e597f0 c063f80c c0d31830 00000000 00000000 00000000 00000000 00000000
>> 1de0: 00000000 00000000 e0821df4 00000000 00000000 c0ba32fc 00000000 047e0d67
>> 1e00: c40d75d8 00000000 c40d0a10 c0e59804 00000000 00000000 c0d31830 c0c2b5a0
>> 1e20: c0c776b0 c04cc8dc c40d0a10 00000000 c0e59804 c04ca1f4 c40d0a10 c0e59804
>> 1e40: c40d0a10 00000000 00000000 c04ca47c 00000000 c0be8598 c0e94b28 c0e59804
>> 1e60: c40d0a10 00000000 00000000 c04ca658 c40d0a10 c0e59804 c40d0a54 c4048000
>> 1e80: 00000000 c04ca8c4 c0e59804 c04ca834 c406f3c0 c04c8494 c4048000 c406f40c
>> 1ea0: c4070d30 047e0d67 c0e59804 c4341e00 00000000 c406f3c0 c4341e34 c04c959c
>> 1ec0: c0c00c14 c0e6c000 c0e59804 c0d2113c c4070800 00000000 c0e6c000 c04cb598
>> 1ee0: c4048000 c0d2113c c4070800 c010d21c 000003c0 00000000 c407084e c4070800
>> 1f00: c407084d c013e9e0 c0bee764 000000c0 00000000 00000000 c0d004d0 c4048000
>> 1f20: 00000006 00000006 373126cc c407086a 00000000 047e0d67 00000012 047e0d67
>> 1f40: 00000007 c0d42bd8 00000007 c4070800 000000c0 c0d31850 c0d31830 c0d011f4
>> 1f60: 00000006 00000006 00000000 c0d004d0 e0821f6c c0d004d0 00000000 c0e03380
>> 1f80: c0905828 00000000 00000000 00000000 00000000 00000000 00000000 c0905844
>> 1fa0: 00000000 c0905828 00000000 c010014c 00000000 00000000 00000000 00000000
>> 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
>> Call trace:
>>  cpufreq_online from cpufreq_add_dev+0x84/0x94
>>  cpufreq_add_dev from subsys_interface_register+0xf0/0x108
>>  subsys_interface_register from cpufreq_register_driver+0x13c/0x2e4
>>  cpufreq_register_driver from dt_cpufreq_probe+0xb4/0x380
>>  dt_cpufreq_probe from platform_probe+0x5c/0xb8
>>  platform_probe from really_probe+0xc8/0x2c8
>>  really_probe from __driver_probe_device+0x88/0x19c
>>  __driver_probe_device from driver_probe_device+0x30/0x104
>>  driver_probe_device from __driver_attach+0x90/0x178
>>  __driver_attach from bus_for_each_dev+0x6c/0xb4
>>  bus_for_each_dev from bus_add_driver+0xcc/0x1ec
>>  bus_add_driver from driver_register+0x7c/0x114
>>  driver_register from do_one_initcall+0x40/0x21c
>>  do_one_initcall from kernel_init_freeable+0x194/0x1f8
>>  kernel_init_freeable from kernel_init+0x1c/0x128
>>  kernel_init from ret_from_fork+0x14/0x28
>> Exception stack(0xe0821fb0 to 0xe0821ff8)
>> 1fa0:                                     00000000 00000000 00000000 00000000
>> 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> Code: e3a02000 ebfff87e e3500000 0a000043 (e7f001f2)
>> ---[ end trace 0000000000000000 ]---
>> note: swapper[1] exited with irqs disabled
>> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>> ---[ end Kernel panic - not syncing: Attempted to kill init!
>> exitcode=0x0000000b ]---
>>
>>
>> And this one:
>>
>> Starting kernel ...
>>
>> Booting Linux on physical CPU 0x0
>> Linux version 6.14.0-rc1+ (claudiu@claudiu-X670E-Pro-RS)
>> (arm-none-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture
>> 10.3-2021.07 (arm-10.29)) 10.3.1 20210621, GNU ld (GNU Toolchain for the
>> A-profile Architecture 10.3-2021.07 (arm-10.29)) 2.36.1.20210621) #11 Wed
>> Feb 26 11:01:10 EET 2025
>> CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c53c7d
>> CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
>> OF: fdt: Machine model: Microchip SAMA7G5-EK
>> printk: legacy bootconsole [earlycon0] enabled
>> Memory policy: Data cache writeback
>> cma: Reserved 192 MiB at 0x70000000 on node -1
>> Zone ranges:
>>   Normal   [mem 0x0000000060000000-0x000000007fffffff]
>> Movable zone start for each node
>> Early memory node ranges
>>   node   0: [mem 0x0000000060000000-0x000000007fffffff]
>> Initmem setup node 0 [mem 0x0000000060000000-0x000000007fffffff]
>> OF: reserved mem: Reserved memory: No reserved-memory node in the DT
>> CPU: All CPU(s) started in SVC mode.
>> Kernel command line: console=ttyS0,115200 root=/dev/mmcblk1p2
>> rootfstype=ext4 rw rootwait cma=192m atmel.pm_modes=standby,ulp0 earlyprintk
>> printk: log buffer data + meta data: 65536 + 204800 = 270336 bytes
>> Dentry cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
>> Inode-cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
>> Built 1 zonelists, mobility grouping on.  Total pages: 131072
>> mem auto-init: stack:off, heap alloc:off, heap free:off
>> SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
>> NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
>> Main crystal frequency not set, using approximate value
>> timer_probe: no matching timers found
>> Console: colour dummy device 80x30
>> sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every
>> 21474836475000000ns
>>
>>
>> I suspect parent_data in sama7g5_pmc_setup() need to be initialized with zero.
> 
> With this series I did not see any boot issues with the sama7g54. But
> when doing the DTS and DTSI changes that you made above I did see boot
> issues with the sama7g54.
> 
> It seems that the 2/2 patch also needs to have a similar patch for the
> sama7g54 clock driver.

Would it be better to have this change to all the SoCs and their clock
drivers to match the correct naming? Since this set is mainly to adjust
for sama7d65 and a separate change to sama7g5.c clock driver would be
needed to fix the error that you are seeing above.
> 
> Best,
> Ryan
>>
>> Thank you,
>> Claudiu
>>
>>
>>
> 


