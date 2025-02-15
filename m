Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78D2C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKNgPwxPTpEHwpx/M/J7FVTa4EA7x/rrnTMQC1k6qOg=; b=3EXRUjCDBdolg8M51JmySADQyd
	r62V3mYIVcpcI9eJMLJxY+jfuRbqjyFZ/ZUGFPgrbYntUi1WBhBgeyqAsLlFF/nQnP/aGwnH0P4LZ
	l7r5qToX6QDQtcYqdvX2rbiF+8mXu+q9HOLtHvcvgWef9Yb2usBLNygeUgDYwLFgTATAXGekXaMYO
	Yt+xLZeG9Lmj2GLcCcnkRnE8OyoX6phSWEInJIaT75oQBKVfIKK+ANNDQTtw4B4oyBz65bupnYIYi
	M3WS2fBxVaVcPLWJHwhBoba3a1K84Mr7Lp4EmB0TdK96Q3dZFJMAOdpujE6dkK4b5yFGtf06PdaAj
	871iXIbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjERF-0000000HK9T-1PbG;
	Sat, 15 Feb 2025 09:26:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEPn-0000000HJyM-043U;
	Sat, 15 Feb 2025 09:24:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FF03A40145;
	Sat, 15 Feb 2025 09:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B917C4CEDF;
	Sat, 15 Feb 2025 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739611485;
	bh=qLlpdx2XZpTJthdJqVOlO6CbXRLajGkyRyRoDG6/yCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nW8R+LGErP81EkTm12pzbj36ijQzll9GIptmlmba3ws12mcaVoSGp50PONuhy0TOz
	 s6j4giqwOgx08ZfXn5K9ZfFX36DVUwQnMhOcYDDfFJSm0aeFG3+TdEXgq+IBRLDX6K
	 92SN0CElkDT09ulfUDautEHpgbtEZZBdM/qH0IXRHoHtZtXpUkkX7q7R3KNn7h709b
	 rX7JmFtVyQ+1OyBm+N0HPbeMu/8wM5zp1q23joFUHmIQa1cakvod2pklJ+nhMxvKfd
	 /TkBBcI3NIldzQmNvo+vjJGIPiYbLmLO8o1zcuZ2aPLYDT1fzrBL2UamlOTTYOuE2x
	 5Q+qcYG+fUYjg==
Message-ID: <b23342dd-381d-4127-9eee-c8755a0d425d@kernel.org>
Date: Sat, 15 Feb 2025 10:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] phy: exynos5-usbdrd: subscribe to orientation
 notifier if required
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <CGME20241206163109eucas1p12aea3a9a6c404cd7c678009ea11aa5b3@eucas1p1.samsung.com>
 <20241206-gs101-phy-lanes-orientation-phy-v4-6-f5961268b149@linaro.org>
 <3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <3c0b77e6-357d-453e-8b63-4757c3231bde@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_012447_188556_EFDA41DD 
X-CRM114-Status: GOOD (  20.54  )
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

On 14/02/2025 20:30, Marek Szyprowski wrote:
> On 06.12.2024 17:31, André Draszik wrote:
>> gs101's SS phy needs to be configured differently based on the
>> connector orientation, as the SS link can only be established if the
>> mux is configured correctly.
>>
>> The code to handle programming of the mux is in place already, this commit
>> now adds the missing pieces to subscribe to the Type-C orientation
>> switch event.
>>
>> Note that for this all to work we rely on the USB controller
>> re-initialising us. It should invoke our .exit() upon cable unplug, and
>> during cable plug we'll receive the orientation event after which we
>> expect our .init() to be called.
>>
>> Above reinitialisation happens if the DWC3 controller can enter runtime
>> suspend automatically. For the DWC3 driver, this is an opt-in:
>>      echo auto > /sys/devices/.../11110000.usb/power/control
>> Once done, things work as long as the UDC is not bound as otherwise it
>> stays busy because it doesn't cancel / stop outstanding TRBs. For now
>> we have to manually unbind the UDC in that case:
>>       echo "" > sys/kernel/config/usb_gadget/.../UDC
>>
>> Note that if the orientation-switch property is missing from the DT,
>> the code will behave as before this commit (meaning for gs101 it will
>> work in SS mode in one orientation only). Other platforms are not
>> affected either way.
>>
>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>
>> ---
>> v3:
>> * drop init to -1 of phy_drd->orientation (Vinod)
>> * avoid #ifdef and switch to normal conditional IS_ENABLED() for
>>    CONFIG_TYPEC
>>
>> v2:
>> * move #include typec_mux.h from parent patch into this one (Peter)
>> ---
>>   drivers/phy/samsung/Kconfig              |  1 +
>>   drivers/phy/samsung/phy-exynos5-usbdrd.c | 56 ++++++++++++++++++++++++++++++++
>>   2 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
>> index f10afa3d7ff5..fc7bd1088576 100644
>> --- a/drivers/phy/samsung/Kconfig
>> +++ b/drivers/phy/samsung/Kconfig
>> @@ -80,6 +80,7 @@ config PHY_EXYNOS5_USBDRD
>>   	tristate "Exynos5 SoC series USB DRD PHY driver"
>>   	depends on (ARCH_EXYNOS && OF) || COMPILE_TEST
>>   	depends on HAS_IOMEM
>> +	depends on TYPEC || (TYPEC=n && COMPILE_TEST)
>>   	depends on USB_DWC3_EXYNOS
>>   	select GENERIC_PHY
>>   	select MFD_SYSCON


So that explains why on recent next some of my boards don't boot. I was
about to dig over the weekend.

> 
> I've just noticed that the above disables Exynos DRD PHY driver in the 
> default exynos_defconfig for arm 32bit. Enabling CONFIG_TYPEC is 
> exynos_defconfig probably is the easiest way to fix this. I will send a 
> patch then.

No, it's just wrong. Nothing here depends on typec and ARMv7 does not
have Typec.

Best regards,
Krzysztof

