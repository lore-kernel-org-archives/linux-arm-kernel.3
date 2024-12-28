Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC49E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncWYXnUi6mk+o8Emqu4x+YEeix+m7qnAVflQKfWOvnU=; b=d5hybU9ydAIPHtO1mqerYmpsMO
	ZTJhyL0pTVnviOGnPlCfmhl5rEu9csfteRzMaH+UceGnXHi1olYHaHfCPmaNG4xTG+ZFOAGofS95C
	KkU0ITv2bPapRTaIbMc1WgMAoAZ9n3WTfX7eUxGGXFiEeAt+a6jMHeAMuYjNoC3QFTkMNxd0MOdTo
	9Pj1YC/wwYdJuC0P11snaUamjvybnUEq0Qqa+lc41rNXpM9X+RrDsuPXD9ub+PKyz2RdRyJqucGPK
	qCkDwxcdUPsEKxDyhzKwNo2yVbH+nvqDu/3wx/GC+1o1xi781Ai9qiTgoVEb9f4QZtEDJFOITy8EF
	gORIb2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRTnl-00000001i7b-2MBg;
	Sat, 28 Dec 2024 10:12:09 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRTmX-00000001hz1-002o;
	Sat, 28 Dec 2024 10:10:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D9191BF203;
	Sat, 28 Dec 2024 10:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735380648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ncWYXnUi6mk+o8Emqu4x+YEeix+m7qnAVflQKfWOvnU=;
	b=XCIDTksVVP4MKIPW77YWhn5eQnvC48fM7XT38sMO4GL+S2x3Df1Ewj/szBh5xIFIqsA2Z5
	ZilzcEnS0ob4kPcYJWo88q53OLtd7SamktyTld8/ykS5ad9aHtO7ShlIBUvjk+nBt0QW5J
	myFBF+iN4oCB0jXlbMsfqtkMizt/w77iQVe9W7M9LtSxoo6OTA5KHxrcgkphpt8L5CByY1
	xg+gw54EfF9RaAE9czfc7Nlyb3vjZjVSG0fNA9q0UQtOtz8AnyO7G5irHp4pYROlBGSfmn
	c0RlJWVwKaPGic630SqefQTeKf9SJuvfmVmrN1Vmevo6n6oweZ6GjhiunOcb6w==
Date: Sat, 28 Dec 2024 11:10:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 00/12] pm: Introduce devm_pm_set_wake_irq
Message-ID: <20241228101046e64adfb2@mail.local>
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_021053_496060_E8824DED 
X-CRM114-Status: GOOD (  14.84  )
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

On 28/12/2024 09:14:36+0800, Peng Fan (OSS) wrote:
> This was a retry to address [1][2], to let common code handle
> dev_pm_clear_wake_irq. Then no need to call dev_pm_clear_wake_irq
> in each driver.remove() hook and error handling path.
> 
> In this patchset, I include input and rtc patches to show the usage
> to avoid that introducing an API without users. There are still
> other places using dev_pm_clear_wake_irq. If this patchset is
> good for you, I could start to clean up other drivers such as mmc and
> etc.
> 
> [1] https://lore.kernel.org/all/20241111092131.1693319-1-peng.fan@oss.nxp.com/
> [2] https://lore.kernel.org/all/ZymxvLMkkktRoCXZ@google.com/

It seems your patchset depends on devm_device_init_wakeup which did not
make it yet.

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Peng Fan (12):
>       PM: sleep: wakeirq: Introduce device-managed variant of dev_pm_set_wake_irq
>       input: keyboard: ep93xx_keypad: Use devm_pm_set_wake_irq
>       input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
>       input: misc: nxp-bbnsm-pwrkey: Use resource managed API to simplify code
>       input: touchscreen: ti_am335x_tsc: Use resource managed API to simplify code
>       rtc: stm32: Use resource managed API to simplify code
>       rtc: nxp-bbnsm: Use resource managed API to simplify code
>       rtc: ds1343: Use devm_pm_set_wake_irq
>       rtc: pm8xxx: Use devm_pm_set_wake_irq
>       rtc: ab8500: Use resource managed API to simplify code
>       rtc: mpfs: Use devm_pm_set_wake_irq
>       rtc: pl031: Use resource managed API to simplify code
> 
>  drivers/base/power/wakeirq.c              | 25 ++++++++++++++++++
>  drivers/input/keyboard/ep93xx_keypad.c    |  8 +-----
>  drivers/input/keyboard/omap4-keypad.c     |  8 +-----
>  drivers/input/misc/nxp-bbnsm-pwrkey.c     | 15 ++++-------
>  drivers/input/touchscreen/ti_am335x_tsc.c | 43 ++++++++++---------------------
>  drivers/rtc/rtc-ab8500.c                  | 11 ++------
>  drivers/rtc/rtc-ds1343.c                  |  8 +-----
>  drivers/rtc/rtc-mpfs.c                    |  8 +-----
>  drivers/rtc/rtc-nxp-bbnsm.c               | 29 +++++++--------------
>  drivers/rtc/rtc-pl031.c                   |  6 ++---
>  drivers/rtc/rtc-pm8xxx.c                  | 12 +--------
>  drivers/rtc/rtc-stm32.c                   | 10 ++-----
>  include/linux/pm_wakeirq.h                |  6 +++++
>  13 files changed, 70 insertions(+), 119 deletions(-)
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241227-wake_irq-b68d604dd902
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

