Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7B7CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISOV/k912KZYAhFG4p9U2tD/XPQ+DCUutG+J3uNU9k8=; b=WyZ6rnCbqiXPVRv9YYDalGwrVX
	3Fs1GJXuifp3fVLQlKL+h8zzjpXvCLyBUQOex+j5P9DxlQEzf/CscbYpGNKi2EMkEb1GHVJiT2b/q
	TJkIlai5/E7OH54MGb2aIyuuNAJYAlempbbBMOMCRS0hqxPLz2ZysRoeXfFsx0xsgeNcf26opvZF5
	Fnt0XqyA4oSDni9ohx2rS6vcYlqUYQyoCyKDDBpQstl01ccWv4i2/8E15mI+x6ImCWnVjSk9SkPjq
	56EPcAYO+AzdJ4n/0ZZsjOBlX3FCQGlbNTVcAof3bfxzOBb8uY9JAq1V3HBJYOH7Zv8/2mjUkYmLb
	TkRr+V1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2sC-00000006WS9-2i8A;
	Tue, 23 Jun 2026 15:17:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2s9-00000006WQs-17dF;
	Tue, 23 Jun 2026 15:17:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00D041A00;
	Tue, 23 Jun 2026 08:17:00 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C5383F62B;
	Tue, 23 Jun 2026 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782227824; bh=95oYhnwJjow7KcN3v08zC/1DlUFrdeFuCxK1iUP8SJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JUvMZgGlP4HRty3ryEVXkuOhRN9ySLzZNcIXnxPZvcV05cwAHn/EBq9aWDFdc96Oe
	 p3njUnNRxo6cjMwkCYAQhYYjgL8IWLfycVFDuwvOjRZ8kdq+JxpgD6ovDmRH/3GjU1
	 k7Saym62kS/LxX/5nZy4jEiPkjOx+K2V1+J2ETRA=
Message-ID: <112d2563-e650-4881-bba0-335f6a3fcb8a@arm.com>
Date: Tue, 23 Jun 2026 16:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore
 meson non-sleeping
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Viacheslav Bocharov <v@baodeep.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Heiko Stuebner <heiko@sntech.de>
References: <CGME20260610153425eucas1p29d20a835114a28b15cb12ea00534e074@eucas1p2.samsung.com>
 <20260610153329.937833-1-v@baodeep.com>
 <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <184d315b-a0a1-4792-8a40-1b4967025916@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_081709_518698_0C58EA01 
X-CRM114-Status: GOOD (  16.52  )
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

On 11/06/2026 9:26 am, Marek Szyprowski wrote:
> Hi Viachesla,
> 
> On 10.06.2026 17:32, Viacheslav Bocharov wrote:
>> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
>> the underlying chip's can_sleep, but under that lock it calls config and
>> direction ops that reach sleeping pinctrl paths. On a controller with
>> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
>> runs from atomic context:
>>
>>    BUG: sleeping function called from invalid context
>>      ... pinctrl_gpio_set_config <- gpiochip_generic_config
>>      <- gpio_shared_proxy_set_config (voting spinlock held)
>>      <- ... <- mmc_pwrseq_simple_probe
>>
>> This was reported on Khadas VIM3 and worked around for Amlogic by
>> commit 28f240683871 ("pinctrl: meson: mark the GPIO controller as
>> sleeping"), which marked the whole meson controller sleeping. That
>> workaround broke atomic value-path consumers: w1-gpio (1-Wire bitbang)
>> no longer detects devices, because its IRQ-disabled read slot calls the
>> non-cansleep gpiod_*_value() and now hits WARN_ON(can_sleep) per bit.
>>
>> Patch 1 fixes the proxy locking generically (always a sleeping mutex).
>> Patch 2 then restores meson can_sleep=false, fixing 1-Wire.
>>
>> Patch 1 has a trade-off: a proxied GPIO becomes sleeping, so consumers
>> gating on gpiod_cansleep() change behaviour. No current device needs
>> atomic (non-cansleep) value access on a shared GPIO -- every report
>> (Khadas VIM3, ODROID-M1, my test on JetHub D1+) is a shared reset line
>> (eMMC/SDIO pwrseq or PCIe reset) driven through the cansleep accessors,
>> which is what the proxy exists to vote on. An alternative that keeps
>> atomic value access (split locking) is possible but adds a second lock
>> and new race windows. I went with the simpler, verified approach and
>> would appreciate guidance on whether the atomic value path must be
>> preserved.
>>
>> The two are a unit: patch 2 must not be applied without patch 1,
>> otherwise the original VIM3 splat returns on boards that share a meson
>> GPIO -- please keep the order. I have not Cc'd stable; I will request
>> stable backports separately once both patches have landed.
>>
>> Viacheslav Bocharov (2):
>>    gpio: shared-proxy: always serialize with a sleeping mutex
>>    pinctrl: meson: restore non-sleeping GPIO access
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> This probably also affects the similar changes in Rockchip GPIO driver done
> by the following commits:
> 20cf2aed89ac ("gpio: rockchip: mark the GPIO controller as sleeping")
> 7ca497be0016 ("gpio: rockchip: Stop calling pinctrl for set_direction")
> 
> I've checked this patchset with these two reverted and no warning was reported.

If it hadn't already been fixed, then indeed I guess this might make 
20cf2aed89ac redundant. However, 7ca497be0016 is still an objective 
improvement either way, since that driver never needed to call pinctrl 
at all (it was seemingly just an artefact of how the GPIO code was 
originally implemented within the pinctrl driver itself).

Thanks,
Robin.

