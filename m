Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D14CA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqB+RxFLCfImZ6UmkKViGK5qwzMQHfvLRhF4fTXgNjw=; b=RL3b2SSo8tvyMUIhNmTPNB3mx/
	MjexQ8iaGAK8hVjjAXsyx1gqbBBl/g7lv5EuAah4WAk2Gvv/70AD9lWAOHZJuzGG6ubFRT3ViuKxs
	O4ere4dbWPs6QmRQs2Hd3j9+uaHLfHMU+DC6kIsYeAtaLVDN3zB5oN/kNhE25g+x2bl5u3Szx6P5/
	pPiFF50dB0ghHRDCZoHYtTSJf58c0XQfY0dC8lvk0W7Q2YMWzQzVXjxXiupEG5Xo8m3GdUtP20i3i
	fMlFbMXI0eUOQWctfNGSDuckew6qZnCIuYKa5TSMZY0kMtvcxXU7qUsxrq6chiWzvZahl70UQVCNo
	UpLu57Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjbT-0000000CSfN-3dqu;
	Fri, 02 Oct 2026 20:11:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjbL-0000000CSdh-0zPf;
	Fri, 02 Oct 2026 20:11:30 +0000
Date: Fri, 2 Oct 2026 22:11:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790971884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqB+RxFLCfImZ6UmkKViGK5qwzMQHfvLRhF4fTXgNjw=;
	b=SF95Crev/XuD1MCbySkyccf7KRssYxWaZq0cvpTjZQkacZHbmRXLpwviB3vOX50MHp+L5M
	xwLeAgSy/6SqavW7hYNFrR0sv4DcvzGs4yKHT0ULfNMs5cN7PWer+8CeYwBpOGRgX/35Ii
	VwchqZitPNL6mzYQyZIn0mg6rqQ1xCBBKvQrrUf5/ABB+92q8gMeYNkRhj1wnE8aR3oaNW
	YFFg5R6HpPkET1hobHHabYawCkDsn44LU9VJNiH+KhdLTeEQIaS6+A8NVOw5WnNYoCMrbQ
	TOv1yfTkahf9JEsglyVQaPUVR9Wbx/G97fjjUgvyYhk5ZYP5QVmfTN031CKKrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790971884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqB+RxFLCfImZ6UmkKViGK5qwzMQHfvLRhF4fTXgNjw=;
	b=oYuZtst9XgU2a9UGd+kRieoVN2nRc2Z1EcUR9tvs51mjoXRe7NQMr0KvktCznuJh1lKIVN
	ZlAOG5BCqT66s1Cg==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbrobinson@gmail.com
Subject: Re: [PATCH v10 3/3] rtc: Add Raspberry Pi 5 RTC driver
Message-ID: <jpyqdcsn6jm355rbbmu4z5ungtmrnt2xlewbrxspry7dkxdwfl@obpofquubbny>
References: <20261002102419.830595-1-sander.speetjens@gmail.com>
 <20261002102419.830595-4-sander.speetjens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002102419.830595-4-sander.speetjens@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_131127_419211_4FC32B9A 
X-CRM114-Status: GOOD (  33.33  )
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

Hi,

On Fri, Oct 02, 2026 at 12:24:19PM +0200, Sander Speetjens wrote:
...
>  
> +static void rpi_register_rtc_driver(struct device *dev)
> +{
> +	struct device_node *firmware;
> +
> +	// Check if our model of Raspberry Pi board is from the 5th gen
> +	// as the RTC is only present on that model.
Multiline comments should be /* */.
> +	if (!of_machine_is_compatible("brcm,bcm2712"))
> +		return;
> +
> +	firmware = of_get_compatible_child(dev->of_node,
> +					   "raspberrypi,firmware-rtc");
If you don't have a "raspberrypi,firmware-rtc" compatible this is not needed.
For the other drivers this is here because it needs to be compatible with old devicetrees.
> +	if (firmware) {
> +		of_node_put(firmware);
> +		return;
> +	}
> +
> +	rpi_rtc = platform_device_register_data(dev, "raspberrypi-rtc",
> +						-1, NULL, 0);
> +}
...
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 05b9233b9418..6dae4c069be2 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1999,6 +1999,18 @@ config RTC_DRV_R7301
>  	   This driver can also be built as a module. If so, the module
>  	   will be called rtc-r7301.
>  
> +config RTC_DRV_RPI
> +	tristate "Raspberry Pi RTC"
> +	depends on RASPBERRYPI_FIRMWARE || (COMPILE_TEST && !RASPBERRYPI_FIRMWARE)
> +	depends on ARCH_BRCMSTB || COMPILE_TEST
> +	default ARCH_BRCMSTB
> +	help
> +		If you say yes here you get support for the RTC found on
> +		Raspberry Pi devices.
You should mention here on which Raspberry devices.
> +
> +		This driver can also be built as a module. If so, the module
> +		will be called rtc-raspberrypi.
> +
>  config RTC_DRV_STM32
>  	tristate "STM32 RTC"
>  	select REGMAP_MMIO
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 0347645b021f..46f1a0fc2416 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -144,6 +144,7 @@ obj-$(CONFIG_RTC_DRV_PS3)	+= rtc-ps3.o
>  obj-$(CONFIG_RTC_DRV_PXA)	+= rtc-pxa.o
>  obj-$(CONFIG_RTC_DRV_R7301)	+= rtc-r7301.o
>  obj-$(CONFIG_RTC_DRV_R9701)	+= rtc-r9701.o
> +obj-$(CONFIG_RTC_DRV_RPI)	+= rtc-raspberrypi.o
>  obj-$(CONFIG_RTC_DRV_RC5T583)	+= rtc-rc5t583.o
>  obj-$(CONFIG_RTC_DRV_RC5T619)	+= rtc-rc5t619.o
>  obj-$(CONFIG_RTC_DRV_RK808)	+= rtc-rk808.o
> diff --git a/drivers/rtc/rtc-raspberrypi.c b/drivers/rtc/rtc-raspberrypi.c
> new file mode 100644
> index 000000000000..0496851cfc30
> --- /dev/null
> +++ b/drivers/rtc/rtc-raspberrypi.c
> @@ -0,0 +1,276 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/**
> + * rtc-raspberrypi.c
> + *
> + * RTC driver using firmware mailbox
> + * Supports battery backed RTC and wake alarms
> + *
> + * Based on rtc-meson-vrtc by Neil Armstrong
> + *
> + * Copyright (c) 2023, Raspberry Pi Ltd.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/of.h>
> +#include <soc/bcm2835/raspberrypi-firmware.h>
> +
> +#define	RTC_TIME 		0
There is a space before a tab. You should run the scripts/checkpatch.pl script
before sending patches.
> +#define	RTC_ALARM		1
> +#define	RTC_ALARM_PENDING	2
> +#define	RTC_ALARM_ENABLE	3
> +#define	RTC_BBAT_CHG_VOLTS	4
> +#define	RTC_BBAT_CHG_VOLTS_MIN	5
> +#define	RTC_BBAT_CHG_VOLTS_MAX	6
> +#define	RTC_BBAT_VOLTS		7
> +
> +struct rpi_rtc_data {
> +	struct rtc_device *rtc;
> +	struct rpi_firmware *fw;
> +	u32 bbat_vchg_millivolts;
> +	u32 bbat_vchg_min_millivolts;
> +	u32 bbat_vchg_max_millivolts;
> +};
> +
> +struct rpi_rtc_reg {
> +	__le32 reg;
> +	__le32 val;
> +} __packed;
> +
> +static int rpi_rtc_read_time(struct device *dev, struct rtc_time *tm)
> +{
> +	struct rpi_rtc_data *vrtc = dev_get_drvdata(dev);
I find the name vrtc confusing. It is probably a leftover of that above
mentioned rtc-meson-vrtc driver.

...
> +static int rpi_rtc_probe(struct platform_device *pdev)
> +{
> +	struct rpi_rtc_data *vrtc;
> +	struct device *dev = &pdev->dev;
> +	struct rpi_firmware *firmware;
> +	int ret;
> +
> +	// Get the firmware device from the parent device
> +	firmware = devm_rpi_firmware_get(dev, dev->parent->of_node);
> +
> +	if (!firmware)
> +		return -EPROBE_DEFER;
> +
> +	vrtc = devm_kzalloc(dev, sizeof(*vrtc), GFP_KERNEL);
> +	if (!vrtc)
> +		return -ENOMEM;
> +
> +	vrtc->fw = firmware;
> +
> +	ret = devm_device_init_wakeup(dev);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, vrtc);
> +
> +	vrtc->rtc = devm_rtc_allocate_device(dev);
> +	if (IS_ERR(vrtc->rtc))
> +		return PTR_ERR(vrtc->rtc);
> +
> +	vrtc->rtc->range_max = U32_MAX;           /* 2106-02-07 */
> +
> +	set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, vrtc->rtc->features);
> +	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, vrtc->rtc->features);
> +
> +	vrtc->rtc->ops = &rpi_rtc_ops;
> +
> +	rpi_rtc_alarm_clear_pending(dev);
> +
> +	/*
> +	 * The trickle-voltage property lives on the parent firmware node
> +	 * because we deliberately do not create a DT child node just to
> +	 * instantiate this driver (see DT maintainer guidance).
> +	 * The firmware driver registers us as a platform device at runtime.
> +	 */
> +	vrtc->bbat_vchg_millivolts = 0;
> +	of_property_read_u32(dev->parent->of_node, "trickle-voltage-millivolt",
> +			     &vrtc->bbat_vchg_millivolts);
> +
> +	rpi_rtc_set_limits(dev);
> +	rpi_rtc_set_charge_voltage(dev);
> +
> +	return devm_rtc_register_device(vrtc->rtc);
> +}
> +
> +static const struct of_device_id rpi_rtc_dt_match[] = {
> +	{ .compatible = "raspberrypi,firmware-rtc" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rpi_rtc_dt_match);
Without dt-compatible this is not needed. Checkpatch also complains about this
undocumented compatible string.

I think this should be:

static const struct platform_device_id raspberrypi_rtc_id[] = {
	{ "raspberrypi-rtc" },
	{ /* sentinel */ }
};
MODULE_DEVICE_TABLE(platform, raspberrypi_rtc_id);
This should also construct your alias and you can remove the MODULE_ALIAS.
> +
> +static struct platform_driver rpi_rtc_driver = {
> +	.driver = {
> +		.name = "raspberrypi-rtc",
> +		.of_match_table = of_match_ptr(rpi_rtc_dt_match),
> +	},
> +	.probe = rpi_rtc_probe
> +};
> +
> +module_platform_driver(rpi_rtc_driver);
> +
> +MODULE_AUTHOR("Jonathan Bell <jonathan@raspberrypi.com>");
> +MODULE_AUTHOR("Sander Speetjens <sander.speetjens@gmail.com>");
> +MODULE_DESCRIPTION("Raspberry Pi RTC driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:raspberrypi-rtc");
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index 975bef529854..e13994d8281c 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -75,6 +75,8 @@ enum rpi_firmware_property_tag {
>  	RPI_FIRMWARE_GET_THROTTLED =                          0x00030046,
>  	RPI_FIRMWARE_GET_CLOCK_MEASURED =                     0x00030047,
>  	RPI_FIRMWARE_NOTIFY_REBOOT =                          0x00030048,
> +	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
> +	RPI_FIRMWARE_SET_RTC_REG =                            0x00038087,
>  	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
>  	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
>  	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,

Best regards
Gregor Herburger

