Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694BAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJdLO77RbaR9GKn+dIgYoxZbnC9pnSRo87z+ypPIZyU=; b=nt83Qvp+YByF44a8IcEYo69YDV
	lhB62MTiCREHcLdpEkfBgQLnunP9dtxwV1f/NkAnh58LV7efNbzvVazwqxjmDnGBUTbiryiReFL/o
	Dv+TD0MN8uadLpgPCzciopHZfUXxZsm8zbjWwuvnLoJvkxkohnqrOCADuOSSkv8G+dXciZK7oWM9j
	pH9YglhkHZE06TkKhAW6fq/y03CcXPo4J/KOlpx/AENqmhQRA39UHomyeuPgzfupQueiVYpWpcUQt
	d3n3dJuJ3hBIS3VKYHErgfSVi2RQudjfxp/VjKSxKPABvFt+3FUDo48JNFe7O9DPH/qxEnkZwRKSB
	i6vUEdVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taCIB-00000007jhF-1gai;
	Tue, 21 Jan 2025 11:19:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taCFi-00000007jDi-09QI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 11:17:03 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taCFV-0001Dr-Vy; Tue, 21 Jan 2025 12:16:50 +0100
Message-ID: <591d482c-cf1b-4875-b18d-8560f66e00d0@pengutronix.de>
Date: Tue, 21 Jan 2025 12:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>,
 Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Haibo Chen <haibo.chen@nxp.com>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <CAHp75Ve8d96Uw1obJVwRPyRE5E0eC8qU7uXe-UKuZeB-3XLPcA@mail.gmail.com>
 <528b6695-387e-436d-98fc-6f576636d16f@pengutronix.de>
 <CAHp75VfOhAmkpB_nhQE8m25p=3P2wvTfOnQFEsLR5KEktLy4vQ@mail.gmail.com>
 <43ecfb45-d96b-46e5-95e1-2ece32532e74@pengutronix.de>
 <CAHp75VfZHZ7Xx1SnryBX683B=gm70SE_bvhivn+ecUePebQLdA@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAHp75VfZHZ7Xx1SnryBX683B=gm70SE_bvhivn+ecUePebQLdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_031702_081390_D7F47C63 
X-CRM114-Status: GOOD (  31.99  )
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

Hi Andy,

On 15.01.25 16:16, Andy Shevchenko wrote:
> On Wed, Jan 15, 2025 at 9:03 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> Please read my cover letter / commit messages. I do nowhere object to deprecation
>> and removal of the sysfs interface. But I strongly disagree that a necessary step
>> towards that is having Linux start toggling random GPIOs after an update on
>> platforms that behaved consistently for >10 years.
>>
>> Can you explain why we can't remove the hardcoded base at the same time that
>> sysfs support is removed for good?
> 
> Because (if follow your logic!) it won't ever happen until all the
> platforms that are using the non-dynamic bases are being removed as
> well.
>
> Otherwise this situation isn't anyhow different to the broken platform
> as you described.

Sorry, it's not clear to me why non-dynamic-bases can't be removed
at the same time that SysFS itself is removed. Can you explain?

>>>> i.MX is an actively developed and widely used platform. Why should support
>>>> be dropped?
>>>
>>> Exactly, Which means "tend to get never fixed".
>>
>> Imagine ReiserFS deprecation strategy involved shipping an update that
>> just corrupted your existing file system and developers insisted on calling
>> it a fix, as ReiserFS is going to be removed anyway.
> 
> It's not the same. If you still want to compare, then it means that
> what I suggest is to move from Reiser to say XFS.

I made a chart.

Starting position is that both ReiserFS and GPIO SysFS are going to be removed.

                +------------------------------------------------------------------------+
                | File System                       | GPIO                               |
+---------------+-----------------------------------+------------------------------------+
| Sensible      | Use XFS. ReiserFS will be         | Use libgpiod. /sys/class/gpio will |
|               | removed in future.                | be removed in future               |
+---------------+-----------------------------------+------------------------------------+
| User-hostile  | Mounting will jumble your inodes  | Booting will jumble your GPIOs     |
|               | and possibly corrupt your FS.     | and possibly brick your board.     |
+---------------+-----------------------------------+------------------------------------+

I believe the second row is bad and I don't want it for i.MX
users (or any users for that matter).

>> To reiterate, my issue is with the manner of breakage:
>>
>>   - broken, because /sys/class/gpio doesn't exist: good
>>   - broken, because script executes successfully, but toggles arbitrary pins: bad
> 
> I understand that, but what the series is trying to do is to put on
> hold _any_ sysfs removal activity along with reducing test coverage
> and motivation to fix the certain platform to work with dynamic base.

Why can't consumers of the static base be removed and then when none
are left, the base goes away too. Why does it have to be the other
way round?

> So, prepare your scripts not to toggle arbitrary numbers then and use libgpiod.

The SoC's own GPIO controllers have had deterministic numbering
for a long time. What would make them arbitrary is setting the base
to -1.

> P.S. I think this discussion goes nowhere. Talk to the GPIO
> maintainers for the matter, 

I believe that's what I am doing now?

> I'm not preventing you to put on hold GPIO
> development for _this_ platform, but I'm strongly against that because
> of your platform others should also be on hold, hence my NAK for that
> gpiolib patch.

Can you explain or point me at resources to understand why a static base
is blocking GPIO development subsystem-wide?

Thanks,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

