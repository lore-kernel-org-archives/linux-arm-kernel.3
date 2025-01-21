Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A23CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnOMYQghaLyPygizLArRMI9fdanC8eQnZ9YMN94H1z8=; b=PzY7sISZoyrKf9xBkELZSWyPZZ
	O7j6eTl77EQybRVXwB0DQ6lX49Bvj9/FviUlYnMErgsx8AYFnO0Mh80Z/PSmfsSiufkGQrE59o4pw
	kIaa3YErt532lSDE9b/IHIMG//GAKKxKSsIaiqsLw9dnfAit5JMkmQZdfsK1gKfnMOaNnaYEqDJSt
	fapxzWd80KycZvXuCFQt7frCkVkvmr8Q+IycJhgyP6mTEVidDqdejIvIUD5HABHGI5GaLlojIfK3E
	l1wZPX5b+Y9xmbkR/u5jSrVaEgIc79Rmo9AThfFKtCfkSPDO2nzPI7gjHp+TeS56SyRdY8PECAoe6
	rIprtyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBvq-00000007fsS-3mpU;
	Tue, 21 Jan 2025 10:56:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBdU-00000007cEZ-1Coz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:37:33 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1taBdH-0001OQ-Rz; Tue, 21 Jan 2025 11:37:19 +0100
Message-ID: <3f21523b-816e-488c-bf0a-c6677c375a18@pengutronix.de>
Date: Tue, 21 Jan 2025 11:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] gpio: mxc: silence warning about GPIO base being
 statically allocated
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Whitcroft
 <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
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
 <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <CAMRc=MdYB_XHCaurs1mO+KGX7rB5zFT3zCi=UbNY0rSbMEJdWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_023732_326584_C62B0D6D 
X-CRM114-Status: GOOD (  30.55  )
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

Hello Bartosz,

On 15.01.25 17:52, Bartosz Golaszewski wrote:
> On Tue, Jan 14, 2025 at 10:55 AM Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>>
>> Hi Andy,
>>
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
>>>
>>> While I understand the issue this tends to get never fixed until the
>>> entire support of iMX boards will be dropped.
>>
>> i.MX is an actively developed and widely used platform. Why should support
>> be dropped?
>>
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
>>
> 
> I recently wrote a user-space compatibility layer for sysfs[1]. While
> right now it doesn't support static base numbers, I'm very open to
> adding it except that I wasn't sure how to approach it.
> 
> Is this of any use to you and could it help you switch to libgpiod
> without changing your user-space set-up (given the support for static
> GPIO numbering)?

If the goal is to have a drop-in replacement for sysfs outside
of the kernel, I think it needs to maintain the same numbering.

I am not sure I see myself using it, because the new projects are using
libgpiod from the get-go. My issue is not with removal of sysfs, but with
user hostile deprecation approaches.

> If so, how would you like to see this implemented? A
> config file at /etc that would list chip labels and their desired GPIO
> base?

Many GPIOs tend to not have labels. I think the mapping config file
should rather map GPIO controllers to a base address. The same thing the
kernel is currently doing. This assumes the numbering of the built-in
GPIO controllers is deterministic, e.g. by consulting /aliases. I haven't
checked, but I hope this is already the case.

Cheers,
Ahmad

> 
> Bartosz
> 
> [1] https://github.com/brgl/gpiod-sysfs-proxy
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

