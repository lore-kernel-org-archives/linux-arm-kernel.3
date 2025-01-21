Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B921C02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OmIbVSBxCrvBjAdO8eLjGzfDpvYZ4LSoIcp75CzZqk=; b=FRLTuKwFOyUIqa+TCiMOwJt29h
	aEtbHn90Obw4H2eDFczIqlzko+MzwPkChKLAVBHb9EBsB6k+cO/0MFpWG+FWNLUBesd6JTu2xlVKo
	Rnlzl0MMNlom8SvnTZww+HeNog4BK+4Pbj0ab1OK9yoDxm3oEm+HEcI3NUWFGmGspvIdNDz8fzf8n
	gVqiyfPhG1fAPsZw2jsGoFxVtSIHtnX8JnN1rm9OiO1Lv491QKrn0WBDARvf4CpAB3rzpILyJkQR9
	Zkz/AiWvk1hLX2O1Gdc8C/wPWqDf+i2jZ4BHIqDISVmXk4FyYdtwEJ9jjXIsD/FMSRTl9vO60zkrM
	+iB4D1tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBUN-00000007Zd3-44yW;
	Tue, 21 Jan 2025 10:28:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBT6-00000007ZJq-0MFH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:26:49 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taBSt-0006uR-6B; Tue, 21 Jan 2025 11:26:35 +0100
Message-ID: <449b4618-7d06-49c8-b521-5fdd02a2ba1b@pengutronix.de>
Date: Tue, 21 Jan 2025 11:26:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gpiolib: add opt-out for existing drivers with static
 GPIO base
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Whitcroft <apw@canonical.com>,
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
 <20250113-b4-imx-gpio-base-warning-v1-1-0a28731a5cf6@pengutronix.de>
 <CAHp75VcnB37ET8mW=m5sXwP4qDQDUPKL0yRy8n49m++zShqPMA@mail.gmail.com>
 <97baffcd-35cc-49a0-95e9-d1ceac966dc3@pengutronix.de>
 <CAHp75VfAmqzKxgXTc9TqeFOeGSr_D3NmCa0M7+4Zf37CofrHeg@mail.gmail.com>
 <40531a5e-993f-4532-b071-6f233d6923f8@pengutronix.de>
 <20250115130432.GA159787@rigel>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250115130432.GA159787@rigel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_022648_122739_82687311 
X-CRM114-Status: GOOD (  27.18  )
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

Hi Kent,

On 15.01.25 14:04, Kent Gibson wrote:
> On Wed, Jan 15, 2025 at 08:07:38AM +0100, Ahmad Fatoum wrote:
>> On 14.01.25 20:38, Andy Shevchenko wrote:
>>> On Tue, Jan 14, 2025 at 12:06 PM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>> On 14.01.25 10:49, Andy Shevchenko wrote:
>>>>> On Tue, Jan 14, 2025 at 12:20 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>>>>
>>>>>> Some drivers have had deterministic GPIO numbering for most of
>>>>>> their existence, e.g. the i.MX GPIO since commit 7e6086d9e54a
>>>>>> ("gpio/mxc: specify gpio base for device tree probe"), more than
>>>>>> 12 years ago.
>>>>>>
>>>>>> Reverting this to dynamically numbered will break existing setups in
>>>>>> the worst manner possible: The build will succeed, the kernel will not
>>>>>> print warnings, but users will find their devices essentially toggling
>>>>>> GPIOs at random with the potential of permanent damage.
>>>>>>
>>>>>> As these concerns won't go away until the sysfs interface is removed,
>>>>>> let's add a new struct gpio_chip::legacy_static_base member that can be
>>>>>> used by existing drivers that have been grandfathered in to suppress
>>>>>> the warning currently being printed:
>>>>>>
>>>>>>   gpio gpiochip0: Static allocation of GPIO base is deprecated,
>>>>>>   use dynamic allocation.
>>>>>
>>>>> Warning is harmless and still a good reminder for the stuff that needs
>>>>> more love.
>>>>> NAK.
>>>>
>>>> A warning is a call-to-action and it's counterproductive to keep tricking
>>>> people into removing the static base and breaking other users' scripts.
>>>
>>> Are you prepared to say the same when the entire GPIO SYSFS will be
>>> removed? Because that's exactly what I referred to in the reply to the
>>> cover letter as an impediment to move forward.
>>
>> No. But this gives me an idea: We could make the warning dependent
>> on CONFIG_GPIO_SYSFS and add a comment to the i.MX code suggesting
>> users do that instead. What do you think?
>>
> 
> AIUI, the purpose of the warning is to remind driver authors, not end users,
> to update their drivers, as the old behaviour is deprecated. That is
> independent of GPIO SYSFS - that just happens to be something that makes the
> change visible to userspace.
> 
> Rather than making the warning conditional, how about making the fix for the
> warning in your driver, so switching to dynamic allocation, conditional on
> CONFIG_GPIO_SYSFS not being set?
> That would provide a path forward for users that want to dispense with
> the warning - as long as they dispense with GPIO SYSFS.

That could work for gpio-mxc, provided that SysFS is the only user for which
the static base matters. I assume that's the case, but I am not sure.

An argument for suppressing the warning selectively in the GPIO core is that
this doesn't only affect gpio-mxc, but also e.g. gpio-zynq or gpio-mxs.

Cheers,
Ahmad



> 
> Cheers,
> Kent.
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

