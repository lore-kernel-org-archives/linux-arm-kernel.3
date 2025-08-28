Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047E2CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umk9iWJI80083siMMEl+CA2tkGjcz41y3WD2Fn8H0Ic=; b=4ORTUrz8YosJ/4s4UguyFkJ6dv
	2hs3xpf6KZXjYmXCPQiM9jnogf69OxIHC3JbUcycR0yTfgPemD4wUoQxZn08otT7I7YZIAooXg8Mp
	oy4txE34aGVBy1w/xj8zkS5/7yIvn3FyDbum4ajOaKeTFp9DJxj34dyP259E/xXWtcxkSVcm2wn+R
	3DrHWJbgJdCMfsS1tjxqFeOTqT6Amm4hsr7gdnC9hVCGcWv3W1NWi5wNbW7C6hw97MZ4bsoy1de7e
	kSuXIHKclADqc4U6seOTG3ns3J2uLw5IdRNQrKSr3XpVO3fgLtK5vlm4xAOvqtM+d25brhvwYXp+N
	iAVisMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urneQ-00000003yIv-2BsP;
	Fri, 29 Aug 2025 01:11:34 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urkrI-00000003TPt-1nP2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 22:12:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 930041A095A;
	Thu, 28 Aug 2025 22:12:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5248C60303;
	Thu, 28 Aug 2025 22:12:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF0B91C2282D4;
	Fri, 29 Aug 2025 00:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756419154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=umk9iWJI80083siMMEl+CA2tkGjcz41y3WD2Fn8H0Ic=;
	b=TfM05Iot5cnVPUd+7CT5hHAFGGdx3Wi+hnTehL7TC1loZXNHtBwRJB1bDydItFHFCUjds4
	6XdfgO5G5hisGu3ehZz/a0X/jv6btLjl4hQiaoLkfRPtbv0cBka3LnqI4LFCE8J1qGG6P1
	0v+rZPq6GDA//du7YZ9+PRivJXiUBE99st4zy5u9pClr4rAqfSSZhYZcMknbpXlnLCD38N
	jf4uNvQVAxaVGp1HHHXmC2oijgL8+ivkSlEzAviwt3odii7Je/6SGLCtBVtCJQcI1vLEoB
	I9SAK4aG+XE+lvktkk8TNNXTcLEP2LYZXkIcQek3zI+1VYG7tAi7Wo3D6KThxA==
Date: Fri, 29 Aug 2025 00:12:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
Message-ID: <202508282212139a74f113@mail.local>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_151241_090295_AEFF450D 
X-CRM114-Status: GOOD (  32.07  )
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

Hello,

On 27/08/2025 21:22:34+1000, James Calligeros wrote:
> Hi all,
> 
> This series adds support for the remaining SMC subdevices. These are the
> RTC, hwmon, and HID devices. They are being submitted together as the RTC
> and hwmon drivers both require changes to the SMC DT schema.
> 

How do you expect this to be merged? From what I get, I could just take
1 and 3 as there doesn't seem to be any actual dependencies on any of
the other patches and the MFD change doesn't depend on the RTC changes.

> The RTC driver is responsible for getting and setting the system clock,
> and requires an NVMEM cell. This series replaces Sven's original RTC driver
> submission [1].
> 
> The hwmon function is an interesting one. While each Apple Silicon device
> exposes pretty similar sets of sensors, these all seem to be paired to
> different SMC keys in the firmware interface. This is true even when the
> sensors are on the SoC. For example, an M1 MacBook Pro will use different
> keys to access the LITTLE core temperature sensors to an M1 Mac mini. This
> necessitates describing which keys correspond to which sensors for each
> device individually, and populating the hwmon structs at runtime. We do
> this with a node in the device tree. This series includes only the keys
> for sensors which we know to be common to all devices. The SMC is also
> responsible for monitoring and controlling fan speeds on systems with fans,
> which we expose via the hwmon driver.
> 
> The SMC also handles the hardware power button and lid switch. Power
> button presses and lid opening/closing are emitted as HID events, so we
> add a HID subdevice to handle them.
> 
> Note that this series is based on a branch with three additional commits
> applied to add the parent SMC nodes to the relevant Devicetrees. This
> was done to silence build errors. The series applies cleanly to 6.17-rc1.
> 
> Regards,
> 
> James
> 
> [1] https://lore.kernel.org/asahi/CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com/T/#t
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
> Changes in v2:
> - Added Rob's R-b tag to RTC DT binding
> - Removed redundant nesting from hwmon DT binding
> - Dedpulicated property definitions in hwmon DT schema
> - Made label a required property for hwmon DT nodes
> - Clarified semantics in hwmon DT schema definitions
> - Split mfd tree changes into separate commits
> - Fixed numerous style errors in hwmon driver
> - Addressed Guenter's initial feedback on the hwmon driver
> - Modified hwmon driver to reflect DT schema changes
> - Added compatible property to hwmon node
> - Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com
> 
> ---
> Hector Martin (2):
>       rtc: Add new rtc-macsmc driver for Apple Silicon Macs
>       input: macsmc-hid: New driver to handle the Apple Mac SMC buttons/lid
> 
> James Calligeros (7):
>       dt-bindings: hwmon: Add Apple System Management Controller hwmon schema
>       mfd: macsmc: Wire up Apple SMC RTC subdevice
>       hwmon: Add Apple Silicon SMC hwmon driver
>       mfd: macsmc: Wire up Apple SMC hwmon subdevice
>       mfd: macsmc: Wire up Apple SMC HID subdevice
>       arm64: dts: apple: Add common hwmon sensors and fans
>       arm64: dts: apple: t8103, t600x, t8112: Add common hwmon nodes to devices
> 
> Sven Peter (2):
>       dt-bindings: rtc: Add Apple SMC RTC
>       arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
> 
>  .../bindings/hwmon/apple,smc-hwmon.yaml  | 132 ++++
>  .../bindings/mfd/apple,smc.yaml          |  45 ++
>  .../bindings/rtc/apple,smc-rtc.yaml      |  35 +
>  MAINTAINERS                              |   5 +
>  .../boot/dts/apple/hwmon-common.dtsi     |  37 ++
>  .../boot/dts/apple/hwmon-fan-dual.dtsi   |  24 +
>  arch/arm64/boot/dts/apple/hwmon-fan.dtsi |  19 +
>  .../boot/dts/apple/hwmon-laptop.dtsi     |  35 +
>  .../boot/dts/apple/hwmon-mac-mini.dtsi   |  17 +
>  .../arm64/boot/dts/apple/t6001-j375c.dts |   2 +
>  .../arm64/boot/dts/apple/t6002-j375d.dts |   2 +
>  .../arm64/boot/dts/apple/t600x-die0.dtsi |   6 +
>  .../boot/dts/apple/t600x-j314-j316.dtsi  |   4 +
>  .../arm64/boot/dts/apple/t600x-j375.dtsi |   2 +
>  arch/arm64/boot/dts/apple/t8103-j274.dts |   2 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts |   3 +
>  arch/arm64/boot/dts/apple/t8103-j313.dts |   2 +
>  arch/arm64/boot/dts/apple/t8103-j456.dts |   2 +
>  arch/arm64/boot/dts/apple/t8103-j457.dts |   2 +
>  .../arm64/boot/dts/apple/t8103-jxxx.dtsi |   2 +
>  arch/arm64/boot/dts/apple/t8103.dtsi     |   6 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts |   2 +
>  arch/arm64/boot/dts/apple/t8112-j473.dts |   2 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts |   3 +
>  .../arm64/boot/dts/apple/t8112-jxxx.dtsi |   2 +
>  arch/arm64/boot/dts/apple/t8112.dtsi     |   6 +
>  drivers/hwmon/Kconfig                    |  12 +
>  drivers/hwmon/Makefile                   |   1 +
>  drivers/hwmon/macsmc_hwmon.c             | 848 +++++++++++++++++++++++++
>  drivers/input/misc/Kconfig               |  11 +
>  drivers/input/misc/Makefile              |   1 +
>  drivers/input/misc/macsmc-hid.c          | 209 ++++++
>  drivers/mfd/macsmc.c                     |   3 +
>  drivers/rtc/Kconfig                      |  11 +
>  drivers/rtc/Makefile                     |   1 +
>  drivers/rtc/rtc-macsmc.c                 | 141 ++++
>  36 files changed, 1637 insertions(+)
> ---
> base-commit: 876d6a70b24869f96ebc8672caf86cb4bae72927
> change-id: 20250816-macsmc-subdevs-87032c017d0c
> 
> Best regards,
> -- 
> James Calligeros <jcalligeros99@gmail.com>
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

