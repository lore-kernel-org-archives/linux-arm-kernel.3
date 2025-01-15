Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F01C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 07:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRSTiajewaW53RCvLluliwDFp0D2SHWccwDiRGyYE5w=; b=MvDRQ/b5yHdYxJax97hCFmzAOF
	Ja7Ap7mWCNEtPSyrqLsFm9akzRXmIIFliisbvdhlAzm0h5QVpnW2lAaK0NNfV7Cwt/ios+GcSm/og
	nOrNjwQ8nxGGEnRXR5Wonafi8qxD4DhXV+2wFUXFyom634rrpRZ3XVYxarr6aM6EG7xlAzxqw+Kys
	CoAnTJwyzpTCM4YOgVTUbuxRV72B/ppqV6P/EG6sqVt0fnU+LYPojmbLuUgkpdWQxx3ka9PWVxpEH
	IIMTlPVetHqSSbfNKFs5L7cLrTS2PHQkprhXZ766jgyVAFmb/6cozAJU7cZgd8CKd56FlpxvgkSg7
	bx7LIfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxSB-0000000Asw7-0oRX;
	Wed, 15 Jan 2025 07:04:39 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXxQu-0000000AshF-2bi1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 07:03:22 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXxQf-0002M8-Ds; Wed, 15 Jan 2025 08:03:05 +0100
Message-ID: <43ecfb45-d96b-46e5-95e1-2ece32532e74@pengutronix.de>
Date: Wed, 15 Jan 2025 08:03:02 +0100
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
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAHp75VfOhAmkpB_nhQE8m25p=3P2wvTfOnQFEsLR5KEktLy4vQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_230320_663853_3CA2BEDE 
X-CRM114-Status: GOOD (  26.78  )
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

Hello Andy,

On 14.01.25 20:43, Andy Shevchenko wrote:
> On Tue, Jan 14, 2025 at 11:55 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>> On 14.01.25 10:46, Andy Shevchenko wrote:
>>> On Tue, Jan 14, 2025 at 12:19 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>>>
>>>> The i.MX GPIO driver has had deterministic numbering for the GPIOs
>>>> for more than 12 years.
>>>>
>>>> Reverting this to dynamically numbered will break existing setups in the
>>>> worst manner possible: The build will succeed, the kernel will not print
>>>> warnings, but users will find their devices essentially toggling GPIOs
>>>> at random with the potential of permanent damage. We thus want to keep
>>>> the numbering as-is until the SysFS API is removed and script fail
>>>> instead of toggling GPIOs dependent on probe order.

Please read my cover letter / commit messages. I do nowhere object to deprecation
and removal of the sysfs interface. But I strongly disagree that a necessary step
towards that is having Linux start toggling random GPIOs after an update on
platforms that behaved consistently for >10 years.

Can you explain why we can't remove the hardcoded base at the same time that
sysfs support is removed for good?

>>> While I understand the issue this tends to get never fixed until the
>>> entire support of iMX boards will be dropped.
>>
>> i.MX is an actively developed and widely used platform. Why should support
>> be dropped?
> 
> Exactly, Which means "tend to get never fixed".

Imagine ReiserFS deprecation strategy involved shipping an update that
just corrupted your existing file system and developers insisted on calling
it a fix, as ReiserFS is going to be removed anyway.

>>> Personally I do not like
>>> this series at all. Rather let's try to go the hard way and understand
>>> what's going on to fix the current issues.
>>
>> /sys/class/gpio is deprecated and when it is finally removed, this series can
>> be reverted again. The alternatives are either do nothing and live with 6 kernel
>> warnings cluttering every boot or show users the finger as described in
>> the cover letter.
>>
>> Do you see a different path forward?
> 
> Yes, try to write your scripts based on the libgpiod or the tools
> provided by the project. I.o.w. follow the warning that SYSFS will be
> removed at some point and prepare yourself for that. If some kernel
> work needs to be done, contribute.

I have been using libgpiod for many years, but have in the past used sysfs
or been involved with projects using sysfs. I agree that these projects
need to switch to the GPIO character device and that they will be eventually
broken. Yet, I still get warnings despite doing everything correctly IMO and no,
I don't want to fix a warning by doing negligent stuff like jumble GPIO numbers,
with the reason that it's going to be broken for good in the future anyway.

To reiterate, my issue is with the manner of breakage:

  - broken, because /sys/class/gpio doesn't exist: good
  - broken, because script executes successfully, but toggles arbitrary pins: bad

Thanks,
Ahmad

> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

