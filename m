Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F264CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0o9VuT/lUhj5kehhZ7ULH4yOrc6OyF+CLGJrjrndiNc=; b=CchMnmbXiqoCDAbudIo+pztQdy
	8r652SoCO9Mt5s9hQloFxz/xFdjZtjRl5S6iuCi5O1IBrBz+T5t1tp69waAX//X8s0qZp9UFZgM8v
	JyfWCGqyb09Y/zDWubJAt0UWAIbCH24V78D9FVRowyO4OkgcIDVMOKIWpEi/mTm9mlrjWAIbEuvA5
	ReM3En6/7ZJU2zO4v900CGMxiEpNtyoU/w3mSi6oNh4t3tQyH9EmIs7tgd049j+k4T1t/82tw+WPb
	+kPQIRe5JKjj7+0Mf7poeUCzZuGTE3WBOYdy+56M6itogUTMlOT4NHHtKMpA9uFW9Xu+JEaXtn3yX
	RJC7JZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf53-00000009U0s-256Y;
	Thu, 11 Jun 2026 13:04:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf52-00000009U0d-2C5h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:04:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A11F4406E;
	Thu, 11 Jun 2026 13:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195281F00893;
	Thu, 11 Jun 2026 13:04:16 +0000 (UTC)
Message-ID: <9da8a414-4fef-40b0-928d-ce356c77ce7e@linux-m68k.org>
Date: Thu, 11 Jun 2026 23:04:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] add mcf54415 DAC driver
To: Angelo Dureghello <adureghello@baylibre.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
References: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260610-wip-stmark2-dac-v5-0-b76b83366d5c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Angelo,

On 11/6/26 06:35, Angelo Dureghello wrote:
> This patchset adds a minimalistic DAC driver for the NXP mcf54415/6/7/8
> builtin DACs.
> 
> Currently the driver enables the raw write only. Feature as dma, sync, or
> format are not supoprted for this version.
> 
> Additional options suppoerted by the DAC module will be added to the driver
> later on, as needed.
> 
> The same patchset prepares the m68k/coldfire architecture to support
> the driver.
> 
> Below some basic tests done on stmark2 mcf54415-based board, voltage check
> on DAC0 and DAC1:
> 
> ~ # cd /sys/bus/iio/devices/iio:device0/
> /sys/bus/iio/devices/iio:device0 # ls
> name               out_voltage_scale  uevent
> out_voltage_raw    subsystem
> /sys/bus/iio/devices/iio:device0 # cat name
> mcf54415
> /sys/bus/iio/devices/iio:device0 # echo 4095 > out_voltage_raw
> /sys/bus/iio/devices/iio:device0 # echo 2048 > out_voltage_raw
> /sys/bus/iio/devices/iio:device0 # echo 4096 > out_voltage_raw
> sh: write error: Invalid argument
> /sys/bus/iio/devices/iio:device0 # cat out_voltage_raw
> 2048
> /sys/bus/iio/devices/iio:device0 #
> 
> Same behavior for /sys/bus/iio/devices/iio:device1.
> 
> Generated a sine wave by shell script, sine shape is good.
> 
> is actually in progress:
> 
> Note: this patchset depends on mew mcf_read/mcf_write implementation that
> Link: https://lore.kernel.org/linux-m68k/209d0653-6386-4b64-9e15-e358f84453ab@app.fastmail.com/T/#t
> Link: https://lore.kernel.org/linux-m68k/20260506142644.3234270-2-gerg@kernel.org/
> ---
> Changes in v5:
> - keeping changelog in each single patch, where any
> - Link to v4: https://patch.msgid.link/20260531-wip-stmark2-dac-v4-0-7e65ab4215dd@baylibre.com
> 
> Changes in v4:
> - keeping changelog in each single patch, where any
> - Link to v3: https://patch.msgid.link/20260522-wip-stmark2-dac-v3-0-16be0ad35a67@baylibre.com
> 
> Changes in v3:
> - keeping changelog in each single patch, where any
> - Link to v2: https://patch.msgid.link/20260513-wip-stmark2-dac-v2-0-fcdae50cf51a@baylibre.com
> 
> Changes in v2:
> - keeping changelog in each single patch, where any
> - Link to v1: https://patch.msgid.link/20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com
> 
> To: Greg Ungerer <gerg@linux-m68k.org>
> To: Geert Uytterhoeven <geert@linux-m68k.org>
> To: Steven King <sfking@fdwdc.com>
> To: Arnd Bergmann <arnd@arndb.de>
> To: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> To: Alexandre Torgue <alexandre.torgue@foss.st.com>
> To: Jonathan Cameron <jic23@kernel.org>
> To: David Lechner <dlechner@baylibre.com>
> To: Nuno Sá <nuno.sa@analog.com>
> To: Andy Shevchenko <andy@kernel.org>
> Cc: Greg Ungerer <gerg@uclinux.org>
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-iio@vger.kernel.org
> 
> ---
> Angelo Dureghello (10):
>        m68k: mcf5441x: fix clocks numbering
>        m68k: mcf5441x: add clock for DAC channel 1
>        m68k: add DAC modules base addresses
>        m68k: mcf5441x: add CCM registers
>        m68k: mcf5441x: add CCR MISCCR2 bitfields
>        m68k: stmark2: use ioport.h macros for resources
>        m68k: stmark2: add mcf5441x DAC platform devices
>        m68k: stmark2: enable DACs outputs
>        iio: dac: add mcf54415 DAC
>        m68k: defconfig: update stmark2 defconfig
> 
>   arch/m68k/coldfire/m5441x.c         |  21 ++--
>   arch/m68k/coldfire/stmark2.c        |  47 +++++---
>   arch/m68k/configs/stmark2_defconfig |   2 +
>   arch/m68k/include/asm/m5441xsim.h   |  42 +++++++
>   drivers/iio/dac/Kconfig             |  11 ++
>   drivers/iio/dac/Makefile            |   1 +
>   drivers/iio/dac/mcf54415_dac.c      | 216 ++++++++++++++++++++++++++++++++++++
>   7 files changed, 316 insertions(+), 24 deletions(-)
> ---
> base-commit: dcf93520157c17ddfb1f43b66fcdda27714ff1dd
> change-id: 20260430-wip-stmark2-dac-7060f49dd94f

I am happy with patches 1 through 8, I think they are ready.
I have pushed them into the for-next branch of the m68knommu git tree.

When the driver proper (patch 9) ends in up in mainline then I will
push the defconfig update (patch 10).

Thanks
Greg



