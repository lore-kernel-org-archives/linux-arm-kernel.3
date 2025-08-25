Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B1ACA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6mp0ANcd+Pr7E6PQSCFRqS0dJA0MEuArVkkJfe2LY8=; b=tEYu0iyGR2qvLkSUuCeHuylN+S
	DVvo4xIOWPpdOOxV+iIhtEAdmdBt4d+FX30HQLIgKpVVdaLPaj4b+iUh++3+M6kn+QvHs7ALNaFtv
	MHCr5JawIxH4eV3dFg5yzhrAyLfUAOcHo4HHjhkrNxxYQvwNezBLJhr6Z1lz5ofq3nk82O71NatRi
	TvwVCSBzKTYrpEf0QnEUFNykF+6i2CA/g+3SpIAeEaMjGXUbCwSBPEw1t40wwgvO8OAhBAVrReJB4
	C3RGeXpFu8JfKXRSczHuRTZOsitWt5E/HsabqKl/rEHK2lMTA2+L/2bJh9tArqSLeYdNS9TNSkxQq
	VdvFWpqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYnx-00000008SLf-2uy4;
	Mon, 25 Aug 2025 15:08:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXwD-00000008D8V-0Vve
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 14:12:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756131165; x=1787667165;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=1lal/u6tfSHx7ceTTPaVrc7Gdd+y9Us7DI3mlTbeenU=;
  b=d93q1JnGxkIwtYi0HKBUX6MuM53Pg0RY7qx7TDALDOcft9xHVwNnECUq
   6TzORJDXhaQDukCPTPfIqEEEqoNoq2tEfxx6thRbjpaUke6z3k5FAZo1n
   HKYI0EoKBjA9JB8z/fHV3GBoS8k71DfvHGrd8EUlnjyX8f23PuXidpQi9
   WA27qwZjo3tNDH38EXqG/vyMVHmHgnPpnWwf7YwtAVhtp/MjB+f7Uwufe
   U8m2Md3cK9r2mcw2VBfedf6sfQoDt2lAiuwSg3/iGh4Xts2g5mE2fQGOW
   SnGctI1Mr36BJ0aJ2j+i6FpUhV/ttGN+7ycVziuvdD6VkC1DwLyCVpAu6
   Q==;
X-CSE-ConnectionGUID: 9RI5R/ZQQFmyNKTAGoYg0Q==
X-CSE-MsgGUID: Ar3/3EubTdWBlEV8DvtZ5Q==
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="46191898"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2025 07:12:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 25 Aug 2025 07:12:15 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 25 Aug 2025 07:12:14 -0700
Message-ID: <084255fb-ab0a-41f0-adea-78b567a95b80@microchip.com>
Date: Mon, 25 Aug 2025 16:12:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ISSUE + PATCH] Interrupts were enabled early by spinlock guard
From: Nicolas Ferre <nicolas.ferre@microchip.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, Thomas Gleixner
	<tglx@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
References: <280dd506-e1fc-4d2e-bdc4-98dd9dca6138@grenoble.cnrs.fr>
 <0173f6c5-b50e-499d-8c6c-cba236b42336@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <0173f6c5-b50e-499d-8c6c-cba236b42336@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_071245_231052_A374DD89 
X-CRM114-Status: GOOD (  37.85  )
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

On 25/08/2025 at 14:33, Nicolas Ferre wrote:
> On 14/08/2025 at 14:59, Edgar Bonet wrote:
>> Hello everybody!
>>
>> I am facing an "Interrupts were enabled early" kernel warning which, as
>> far as I can tell, is caused by a spinlock guard in an ARM/Microchip
>> IRQCHIP driver. I think I solved the issue, and I am proposing a patch
>> below, after the scissor. But I must first disclose that:
>>
>>     * I am completely new to Linux internals and its development process.
>>       This is why I chose to err on the side of providing too much
>>       information on my issue. It is not unlikely that I am doing
>>       something very wrong.
>>
>>     * I am not subscribed to either of the linux-{,arm-}kernel mailing
>>       lists
>>
>>     * I will be far from the Internet in the few days to come. I should be
>>       connected an responsive starting from 2025-08-24.
> 
> Edgar,
> 
> Thanks a lot for having investigated this.
> 
> 
>> ## Context
>>
>> I am playing with an Acmesystems Acqua[1] system on module, which is
>> based on a SAMA5D31 SoC (single core Cortex-A5). I maintain the
>> Buildroot defconfig for this board,[2] which is currently based on a
>> vanilla Linux kernel v6.12.41.
>>
>> As I wanted to check that the board runs fine on newer kernels, I built
>> a v6.16 for it using gcc 14, binutils 2.43, the in-tree sama5_defconfig
>> merged with this fragment:
>>
>>       # CONFIG_BRIDGE is not set
>>       # CONFIG_MODULES is not set
>>       # CONFIG_NET_DSA is not set
>>       # CONFIG_WIRELESS is not set
>>       # CONFIG_USB_NET_DRIVERS is not set
>>       # CONFIG_WLAN is not set
>>       # CONFIG_MEDIA_SUPPORT is not set
>>       # CONFIG_SOUND is not set
>>       # CONFIG_AUTOFS_FS is not set
>>
>> and the Buildroot-provided device tree, patched for compatibility with
>> Linux commit 510a6190cf5e ("ARM: dts: microchip: fix faulty ohci/ehci
>> node names").
>>
>> The defconfig fragment above is meant to remove module support (with
>> some unused drivers along the way), which makes testing easier for me.
>>
>>
>> ## Issue
>>
>> While booting, Linux v6.16 printed this message on the serial console:
>>
>>       ------------[ cut here ]------------
>>       WARNING: CPU: 0 PID: 0 at init/main.c:1024 start_kernel+0x4d0/0x5dc
>>       Interrupts were enabled early
>>       CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.16.0 #1 NONE
>>       Hardware name: Atmel SAMA5
>>       Call trace:
>>        unwind_backtrace from show_stack+0x10/0x14
>>        show_stack from dump_stack_lvl+0x38/0x48
>>        dump_stack_lvl from __warn+0x78/0xd4
>>        __warn from warn_slowpath_fmt+0x98/0xc8
>>        warn_slowpath_fmt from start_kernel+0x4d0/0x5dc
>>        start_kernel from 0x0
>>       ---[ end trace 0000000000000000 ]---
> 
> Indeed, reproduced on sam9x75 (which has AIC5), on 6.17.0-rc3.
> 
>> The board seemed to work fine, so maybe this warning is completely
>> harmless. It looked, however, scary enough to deserve some
>> investigation.
>>
>>
>> ## Bug hunting
>>
>> I could not reproduce the issue on a qemu virtual machine. All tests
>> were then done on the real hardware.
>>
>> I looked for the Linux commit that introduced the issue. ‘git bisect’
>> told me this was 195298c3b116 ("genirq/generic-chip: Convert core code
>> to lock guards"). I then checked out a recent mainline kernel, namely
>> v6.17-rc1, and tried to revert that commit. For this, I first had to
>> revert two follow-up commits, namely 7ae844a6650c ("genirq/generic-chip:
>> Remove unused lock wrappers") and 771487050f83 ("genirq/generic-chip:
>> Fix incorrect lock guard conversions"). This was unsuccessful: I still
>> had the warning.
>>
>> I went back to a clean v6.17-rc1 and tried to find the thing that was
>> enabling interrupts early. After lots of printk() debugging, I
>> discovered it was a guard(raw_spinlock_irq) destructor. The call chain
>> is this (line numbers are for v6.17-rc1):
>>
>>       start_kernel (init/main.c:1011)
>>       -> time_init (arch/arm/kernel/time.c:96)
>>       -> timer_probe (drivers/clocksource/timer-probe.c:30)
>>       => tcb_clksrc_init (drivers/clocksource/timer-atmel-tcb.c:413)
>>       -> of_irq_get (drivers/of/irq.c:474)
>>       -> irq_create_of_mapping (kernel/irq/irqdomain.c:980)
>>       -> irq_create_fwspec_mapping (kernel/irq/irqdomain.c:848)
>>       => aic5_irq_domain_xlate (drivers/irqchip/irq-atmel-aic5.c:287)
>>       -> guard destructor (raw_spin_unlock_irq?)
>>
>> where (=>) is an indirect call through a function pointer.
>>
>>
>> ## Tentative fix
>>
>> Commit 771487050f83 gave me the inspiration. The guard in question was
>> introduced by b00bee8afaca ("irqchip: Convert generic irqchip locking to
>> guards"), which replaced calls to irq_gc_lock_irq{save,restore}() by
>> guard(raw_spinlock_irq) (with no “save” in the name). The commit log
>> states that this is “intended and correct”, but I could not make sense
>> of the explanation. My (possibly faulty) understanding is that the guard
>> constructor disables interrupts, and the destructor either
>> unconditionally enables them (raw_spinlock_irq), or restores the
>> previous interrupt state (raw_spinlock_irqsave).
>>
>> I then replaced guard(raw_spinlock_irq) with guard(raw_spinlock_irqsave)
>> and that seemed to do the job: the warning is gone. See the patch below
>> the scissors.
>>
>> Best regards, and thank-you for reading so far.
>>
>> Edgar Bonet.
>>
>> [1] https://www.acmesystems.it/acqua
>> [2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.08-rc1/configs/acmesystems_acqua_a5_512mb_defconfig
>>
>> ------------------------------------------------------------------ >8 --
>> Subject: [PATCH] irqchip/atmel-aic5: Fix incorrect lock guard conversion
>>
>> Commit b00bee8afaca ("irqchip: Convert generic irqchip locking to guards")
>> replaced calls to irq_gc_lock_irq{save,restore}() with
>> guard(raw_spinlock_irq). However, in irq-atmel-aic5.c, one such guard is
>> created early in the boot process, before interrupts are initially enabled.
>> As its destructor enables interrupts, this results in the following warning
>> on a SAMA5D31-based system:
>>
>>       ------------[ cut here ]------------
>>       WARNING: CPU: 0 PID: 0 at init/main.c:1024 start_kernel+0x4d0/0x5dc
>>       Interrupts were enabled early
>>       CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.16.0 #1 NONE
>>       Hardware name: Atmel SAMA5
>>       Call trace:
>>        unwind_backtrace from show_stack+0x10/0x14
>>        show_stack from dump_stack_lvl+0x38/0x48
>>        dump_stack_lvl from __warn+0x78/0xd4
>>        __warn from warn_slowpath_fmt+0x98/0xc8
>>        warn_slowpath_fmt from start_kernel+0x4d0/0x5dc
>>        start_kernel from 0x0
>>       ---[ end trace 0000000000000000 ]---
>>
>> Fix this by using guard(raw_spinlock_irqsave) instead.
>>
>> Fixes: b00bee8afaca ("irqchip: Convert generic irqchip locking to guards")
>> Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> 
> Indeed. Thanks for the detailed explanation and the patch:
> 
> Tested-by: Nicolas Ferre <nicolas.ferre@microchip.com> # on sam9x75

For you Thomas, also this test:
Tested-by: Nicolas Ferre <nicolas.ferre@microchip.com> # on sam9x35 (for 
similar changes to irq-atmel-aic.c)

Thanks, best regards,
   Nicolas


> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com> (if needed)
> 
> Best regards,
>     Nicolas
> 
>> ---
>>    drivers/irqchip/irq-atmel-aic5.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
>> index 60b00d2c3d7a..1f14b401f71d 100644
>> --- a/drivers/irqchip/irq-atmel-aic5.c
>> +++ b/drivers/irqchip/irq-atmel-aic5.c
>> @@ -279,7 +279,7 @@ static int aic5_irq_domain_xlate(struct irq_domain *d,
>>           if (ret)
>>                   return ret;
>>
>> -       guard(raw_spinlock_irq)(&bgc->lock);
>> +       guard(raw_spinlock_irqsave)(&bgc->lock);
>>           irq_reg_writel(bgc, *out_hwirq, AT91_AIC5_SSR);
>>           smr = irq_reg_readl(bgc, AT91_AIC5_SMR);
>>           aic_common_set_priority(intspec[2], &smr);
>> --
>> 2.43.0
> 


