Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA55C19778
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFqjJ5s+Z0xnd9r2pX3ADIi2my/okJGh5BKAReVcsKc=; b=yEhFiMCksHm+VEzZJ+ObGqcmDA
	K65p6u5tb7RatuTdV86V1CxfQv25s1Yx26LflM5jY2/KVEnyNFssw9nHWcN7JdIG6r9bv7ItiSohf
	Nt3yvAHUOQGM6uZJRmbm9L8XDie6d3GuRkpRKOTmEtvquLQCB+zMxAfh2eTultx4n5WW80mB0DWXM
	4kV92Qg+x7CFEpQO66MK58W0sAPC/Xc0w5FtfSZ2/pdGWNl632L7XuCvk8+PkwFhv2Vx5cXW+EjDE
	0MPZFnf/gzdbsNQ9GBnEypSwq07PHYrE90ZzvPhNLYrUVOEm6o/Xzba/ProO/V2Y+MT7qQc6BroZb
	vaXnFQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDd9-000000033xO-1GIg;
	Wed, 26 Feb 2025 09:23:03 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDMt-000000030nQ-2BxJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:06:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so63123805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 01:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740560773; x=1741165573; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wFqjJ5s+Z0xnd9r2pX3ADIi2my/okJGh5BKAReVcsKc=;
        b=It5Dss+LPIeym0pKtQ2wkygeLN4FWeaBNxtr2R3dHWm6DyVAmUuv8Ub4lCQdeImSIz
         LO3rJXMOrSGi5Bzmdo30T0B9fZr9ist/Sal0q0S2pbjJ7AuKtpAG3wmrN7ngYZVAyVCX
         FFh9NR2c6wz11oMVF3K+sJ0xQ0145Gw1tUU+/pesAeQeLLJffcI2NNYdVoClKt1Fo1Nz
         MdMTi+Xqm3+HUx4VfoDvOQ3EdJZXa3uA7MY3TEjikeq90ZdHpHE4qa2YUa4bbQuDxdzw
         82HtQZF6+3P0rvzZsqRRRpuinmAJVewVGhYb3QEuAjPBa/3ludBFZSmOyg4UgWcy2+FF
         98UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740560773; x=1741165573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wFqjJ5s+Z0xnd9r2pX3ADIi2my/okJGh5BKAReVcsKc=;
        b=Qlz66EEqCRORjG7iQZUOt94Pte3jEzESguEr4m2DZgy7QR9X/wjnpKWnOTs7sIafhD
         G/SqHpbkayALvqwZhgW79dT2J1fkLCS1V76TdVpxYGoFxsxX/7NT2SttFPv8ZUwoYSn7
         6Eup2S2ykTLHgdPs+Py040Mtjp8J+a+eBx7cims8CgrGG/Wl0rESTdvGFTpi+SzVEuW9
         MCBTICMwykAeCCK8S68SIFuLQGbOGfKXVdbxRUrcqYxbmR70Ya52vc2xfqwF5bOXZarS
         VuILYlhVy1g7bl2p1UMexSPbFT5Zq76/qg4byLQ8Ic/UULP+PEwbtrufUW6w4bAvLrki
         YMuQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2FnOWKNRS4C3FMJHU/nDoSjGxXIaK5IjH8CiUktgoX6F2624QdxBPFpSVk2Aqb0MPnd3uMRH2RIEW5OmILSAL@lists.infradead.org
X-Gm-Message-State: AOJu0YzY495sYdnQT9m8yYA+E4LohWKUDgi31enUFjRVxynKyzVRQSdl
	DmsIgK8epiOZvA+Zm2uVhI9m0UgAza90HWCWK2tiR7b10OX8mhCBmqV5fRV+49TBTa2lTinoH9w
	odM8=
X-Gm-Gg: ASbGncsG6ceWoMNchdp+7wmsj6EsCYXcxNnRB6zHummdIxTsVgr1Ux98CQgnzXa90iX
	fnCpDpbmDuNobNyqFw9jgZZdTvrDGeB36Ppd4Dreh7vyNlzm5g8yWHoMxnMT4QW02lozL20myII
	ByjAW41K9/Z37HCNtNkDpXVsSOnzwvIQ9d18yj1ZhrpYRUXD7JBPA83ZO2cJouWxdvAPWXMOghY
	XhVf9kbVWyS42xFHT7tKvhBcBAXEMRAMWWqnioApZHT5XSHMpVfn69aalAU4B/+gIwvrCZNL2Ob
	gAOQ4wHacxtaWCO93aDuABZrque9WlpPmA==
X-Google-Smtp-Source: AGHT+IF2jL/6HEshRKQgvDuJGZdSFLJT33KiaiMqikmoObJ0F4VSY/h7X0zQKfIsnmcQGTgCryyo3w==
X-Received: by 2002:a05:600c:190c:b0:439:3d5c:8c19 with SMTP id 5b1f17b1804b1-43ab0f6440emr52386245e9.24.1740560773326;
        Wed, 26 Feb 2025 01:06:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba52b7ecsm13869615e9.3.2025.02.26.01.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 01:06:12 -0800 (PST)
Message-ID: <7dd5a0a2-4f56-48b4-8861-c7d75754faab@tuxon.dev>
Date: Wed, 26 Feb 2025 11:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] AT91 Clock Adjustments
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mripard@kernel.org
References: <cover.1738864727.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cover.1738864727.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_010615_787940_E9C1B61A 
X-CRM114-Status: GOOD (  21.63  )
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



On 06.02.2025 20:14, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> This set has clock system adjustments for the AT91 clock system.
> 
> The first is to adjust the slow clock driver to account for the updated
> DT node-naming for clocks and xtals and ensuring the driver is still
> backwards compatible.
> 
> The second is a adding a missing clk_hw struct that is not added into
> parent_data struct causing a incorrect parent for main_osc.
> 
> Ryan Wanner (2):
>   clk: at91: sckc: Fix parent_data struct for slow osc
>   clk: at91: sama7d65: Add missing clk_hw to parent_data
> 
>  drivers/clk/at91/sama7d65.c |  1 +
>  drivers/clk/at91/sckc.c     | 12 ++++++------
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 

There are boot failures on sama7g5 with this series on top of at91-next and
the following diff on sama7g5 dts to mimic the sama7d65 use case:

diff --git a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
index 0f5e6ad438dd..1bce9f999431 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7g5ek.dts
@@ -35,16 +35,6 @@ aliases {
                i2c2 = &i2c9;
        };

-       clocks {
-               slow_xtal {
-                       clock-frequency = <32768>;
-               };
-
-               main_xtal {
-                       clock-frequency = <24000000>;
-               };
-       };
-
        gpio-keys {
                compatible = "gpio-keys";

@@ -132,6 +122,15 @@ spdif_out: spdif-out {
        };
 };

+&slow_xtal {
+       clock-frequency = <32768>;
+};
+
+&main_xtal {
+       clock-frequency = <24000000>;
+};
+
+
 &adc {
        vddana-supply = <&vddout25>;
        vref-supply = <&vddout25>;
diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi
b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index 17bcdcf0cf4a..3158c2f0b4c0 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -117,12 +117,12 @@ map1 {
        };

        clocks {
-               slow_xtal: slow_xtal {
+               slow_xtal: clk-slowxtal {
                        compatible = "fixed-clock";
                        #clock-cells = <0>;
                };

-               main_xtal: main_xtal {
+               main_xtal: clk-mainxtal {
                        compatible = "fixed-clock";
                        #clock-cells = <0>;
                };

I've identified the following:


cpu cpu0: _opp_config_clk_single: failed to set clock rate: -22
cpufreq: __target_index: Failed to change cpu frequency: -22
------------[ cut here ]------------
kernel BUG at drivers/cpufreq/cpufreq.c:1523!
Internal error: Oops - BUG: 0 [#1] ARM
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.14.0-rc1+ #11
Hardware name: Microchip SAMA7
PC is at cpufreq_online+0x8d8/0xa30
LR is at __wake_up+0x20/0x30
pc : [<c063cca0>]    lr : [<c0151254>]    psr: a0000013
sp : e0821d30  ip : 00000000  fp : c0e50508
r10: c434830c  r9 : c4348204  r8 : c0e97230
r7 : c4348264  r6 : 00000000  r5 : 000ca511  r4 : c4348200
r3 : 047e0d67  r2 : 047e0d67  r1 : 00000003  r0 : ffffffea
Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
Control: 10c53c7d  Table: 60004059  DAC: 00000051
Register r0 information: non-paged memory
Register r1 information: non-paged memory
Register r2 information: non-paged memory
Register r3 information: non-paged memory
Register r4 information: slab kmalloc-512 start c4348200 pointer offset 0
size 512
Register r5 information: non-paged memory
Register r6 information: NULL pointer
Register r7 information: slab kmalloc-512 start c4348200 pointer offset 100
size 512
Register r8 information: non-slab/vmalloc memory
Register r9 information: slab kmalloc-512 start c4348200 pointer offset 4
size 512
Register r10 information: slab kmalloc-512 start c4348200 pointer offset
268 size 512
Register r11 information: non-slab/vmalloc memory
Register r12 information: NULL pointer
Process swapper (pid: 1, stack limit = 0x08d7ca6b)
Stack: (0xe0821d30 to 0xe0822000)
1d20:                                     00000000 e0821d98 c4348208 c0c00250
1d40: 00000001 00000000 e0821d98 c0e50508 c4048000 00000000 c406f480 c4048000
1d60: c4341ec0 c0e50508 c4341ec8 c063ce8c c0e593a8 c4048000 c406f4bc c406f480
1d80: c4048000 c04c8bb0 c406f4cc c40704b0 00000000 047e0d67 3b9aca03 c0e5986c
1da0: c0e5931c c0e97230 00000000 c063a618 00000000 c4048000 c0e59858 c40d0a10
1dc0: c0e597f0 c063f80c c0d31830 00000000 00000000 00000000 00000000 00000000
1de0: 00000000 00000000 e0821df4 00000000 00000000 c0ba32fc 00000000 047e0d67
1e00: c40d75d8 00000000 c40d0a10 c0e59804 00000000 00000000 c0d31830 c0c2b5a0
1e20: c0c776b0 c04cc8dc c40d0a10 00000000 c0e59804 c04ca1f4 c40d0a10 c0e59804
1e40: c40d0a10 00000000 00000000 c04ca47c 00000000 c0be8598 c0e94b28 c0e59804
1e60: c40d0a10 00000000 00000000 c04ca658 c40d0a10 c0e59804 c40d0a54 c4048000
1e80: 00000000 c04ca8c4 c0e59804 c04ca834 c406f3c0 c04c8494 c4048000 c406f40c
1ea0: c4070d30 047e0d67 c0e59804 c4341e00 00000000 c406f3c0 c4341e34 c04c959c
1ec0: c0c00c14 c0e6c000 c0e59804 c0d2113c c4070800 00000000 c0e6c000 c04cb598
1ee0: c4048000 c0d2113c c4070800 c010d21c 000003c0 00000000 c407084e c4070800
1f00: c407084d c013e9e0 c0bee764 000000c0 00000000 00000000 c0d004d0 c4048000
1f20: 00000006 00000006 373126cc c407086a 00000000 047e0d67 00000012 047e0d67
1f40: 00000007 c0d42bd8 00000007 c4070800 000000c0 c0d31850 c0d31830 c0d011f4
1f60: 00000006 00000006 00000000 c0d004d0 e0821f6c c0d004d0 00000000 c0e03380
1f80: c0905828 00000000 00000000 00000000 00000000 00000000 00000000 c0905844
1fa0: 00000000 c0905828 00000000 c010014c 00000000 00000000 00000000 00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
Call trace:
 cpufreq_online from cpufreq_add_dev+0x84/0x94
 cpufreq_add_dev from subsys_interface_register+0xf0/0x108
 subsys_interface_register from cpufreq_register_driver+0x13c/0x2e4
 cpufreq_register_driver from dt_cpufreq_probe+0xb4/0x380
 dt_cpufreq_probe from platform_probe+0x5c/0xb8
 platform_probe from really_probe+0xc8/0x2c8
 really_probe from __driver_probe_device+0x88/0x19c
 __driver_probe_device from driver_probe_device+0x30/0x104
 driver_probe_device from __driver_attach+0x90/0x178
 __driver_attach from bus_for_each_dev+0x6c/0xb4
 bus_for_each_dev from bus_add_driver+0xcc/0x1ec
 bus_add_driver from driver_register+0x7c/0x114
 driver_register from do_one_initcall+0x40/0x21c
 do_one_initcall from kernel_init_freeable+0x194/0x1f8
 kernel_init_freeable from kernel_init+0x1c/0x128
 kernel_init from ret_from_fork+0x14/0x28
Exception stack(0xe0821fb0 to 0xe0821ff8)
1fa0:                                     00000000 00000000 00000000 00000000
1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
Code: e3a02000 ebfff87e e3500000 0a000043 (e7f001f2)
---[ end trace 0000000000000000 ]---
note: swapper[1] exited with irqs disabled
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b ]---


And this one:

Starting kernel ...

Booting Linux on physical CPU 0x0
Linux version 6.14.0-rc1+ (claudiu@claudiu-X670E-Pro-RS)
(arm-none-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture
10.3-2021.07 (arm-10.29)) 10.3.1 20210621, GNU ld (GNU Toolchain for the
A-profile Architecture 10.3-2021.07 (arm-10.29)) 2.36.1.20210621) #11 Wed
Feb 26 11:01:10 EET 2025
CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c53c7d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
OF: fdt: Machine model: Microchip SAMA7G5-EK
printk: legacy bootconsole [earlycon0] enabled
Memory policy: Data cache writeback
cma: Reserved 192 MiB at 0x70000000 on node -1
Zone ranges:
  Normal   [mem 0x0000000060000000-0x000000007fffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000060000000-0x000000007fffffff]
Initmem setup node 0 [mem 0x0000000060000000-0x000000007fffffff]
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
CPU: All CPU(s) started in SVC mode.
Kernel command line: console=ttyS0,115200 root=/dev/mmcblk1p2
rootfstype=ext4 rw rootwait cma=192m atmel.pm_modes=standby,ulp0 earlyprintk
printk: log buffer data + meta data: 65536 + 204800 = 270336 bytes
Dentry cache hash table entries: 65536 (order: 6, 262144 bytes, linear)
Inode-cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
Built 1 zonelists, mobility grouping on.  Total pages: 131072
mem auto-init: stack:off, heap alloc:off, heap free:off
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
Main crystal frequency not set, using approximate value
timer_probe: no matching timers found
Console: colour dummy device 80x30
sched_clock: 32 bits at 100 Hz, resolution 10000000ns, wraps every
21474836475000000ns


I suspect parent_data in sama7g5_pmc_setup() need to be initialized with zero.

Thank you,
Claudiu




