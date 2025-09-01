Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BEACA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSUaE3wqTSGIzPy5TH46KyeqW0I91kINvSo2g7sJPRM=; b=2zB8xvnDwyqtXayFl7UEq/F9yE
	414tOn4ooswc14DMFLfaQ+mGs9zupX0CYp9vVE80HA8U+3Jozvxt9YzIbtV410XITK012c+8NAF5K
	1UWfd7WB7e+ud/Cr37VlADtP6ND1uiNOYMWsPjlZRF71lA05uI/zIywhloSA6jfxmylK8+V6Cav/c
	CzD0Y31cKcstBnxjyT/nAKXBnf5RdQnDKEl4aPaYlP11zrEGbLxWpSbtVoF1dcSsf9kZMLyALzgOm
	upYBTQVb8qR+du5/qMEQldrDsJyifKDasoP2gHwPdIS+uxsGELvTIs6nNvBXD9ZTs32olok5DOT77
	+Rq7lHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszsC-0000000BZZW-1IYN;
	Mon, 01 Sep 2025 08:26:44 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyz8-0000000BRLy-0wyB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 07:29:52 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5817Dhfm031463;
	Mon, 1 Sep 2025 09:29:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	aSUaE3wqTSGIzPy5TH46KyeqW0I91kINvSo2g7sJPRM=; b=cqC5cciIE8yW98ch
	cXidC4lmHnUy9aikCnX0CBQCkIMDZyeY3uiNpFyWAdve1b/Re/Cq0zVV0YcDPdM/
	7MbBvawblaDQ3DYA4b1OMRQTmy1XRXxRt4EFz7xK59FrGSPHWlr0IxUdmCz8t4o/
	/QBelY4CA7N61dkIlW/ynGQSah+LWsqQwziwB8WSWGe75UkkBmpOVptt9q2SQnRW
	HydaMmMP3MkMBScgrTNpu2Q7JIJPqq4X65TEKVqWbFrr6QDxQKXoaN875QzuS5aO
	MhfnmTs2OhlZsNpq/fCu7bfnd/H4ppUzu4xAeIJ62njEjf/PxFTLrTAOzaU5+6IS
	hUs89g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48ur6fdbgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Sep 2025 09:29:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9B4EF40044;
	Mon,  1 Sep 2025 09:28:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfcas1node1.st.com [10.75.129.72])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8ED8E754B3C;
	Mon,  1 Sep 2025 09:26:49 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFCAS1NODE1.st.com
 (10.75.129.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 1 Sep
 2025 09:26:49 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 1 Sep
 2025 09:26:48 +0200
Message-ID: <bb5cb154-0f7a-4e21-afe3-453ff5ee9373@foss.st.com>
Date: Mon, 1 Sep 2025 09:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Linus Walleij <linus.walleij@linaro.org>,
        Shenwei Wang
	<shenwei.wang@nxp.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Mathieu
 Poirier" <mathieu.poirier@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        "Sascha
 Hauer" <s.hauer@pengutronix.de>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-imx@nxp.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-4-shenwei.wang@nxp.com>
 <CACRpkdZq25n4gZSesV8z8zrBs6kqU1a8=vwVkPBwM+hFb9JKwg@mail.gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <CACRpkdZq25n4gZSesV8z8zrBs6kqU1a8=vwVkPBwM+hFb9JKwg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-01_03,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_002950_860311_F5ECF9D3 
X-CRM114-Status: GOOD (  41.27  )
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

On 8/21/25 11:01, Linus Walleij wrote:
> Hi Shenwei,
>
> thanks for your patch!
>
> On Mon, Aug 18, 2025 at 10:45 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>> On i.MX SoCs, the system may include two processors:
>>          - An MCU running an RTOS
>>          - An MPU running Linux
>>
>> These processors communicate via the RPMSG protocol.
>> The driver implements the standard GPIO interface, allowing
>> the Linux side to control GPIO controllers which reside in
>> the remote processor via RPMSG protocol.
>>
>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> Since this is a first RPMSG GPIO driver, I'd like if Björn and/or
> Mathieu have a look at it so I'm sure it is RPMSG-proper!

Could this driver be generic (platform independent) ?
Perhaps i missed something, but it seems to me that there is no IMX
specific code.
Making it generic would allow other platforms to reuse it instead of
duplicating it.

Thanks,
Arnaud

>
>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
>> index a437fe652dbc..2ce4e9b5225e 100644
>> --- a/drivers/gpio/Kconfig
>> +++ b/drivers/gpio/Kconfig
>> @@ -402,6 +402,17 @@ config GPIO_ICH
>>
>>            If unsure, say N.
>>
>> +config GPIO_IMX_RPMSG
>> +       tristate "NXP i.MX SoC RPMSG GPIO support"
>> +       depends on IMX_REMOTEPROC && RPMSG && GPIOLIB
>> +       default IMX_REMOTEPROC
>> +       help
>> +         Say yes here to support the RPMSG GPIO functions on i.MX SoC based
>> +         platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,
>> +         and i.MX9x.
>> +
>> +         If unsure, say N.
> This is sorted under memory-mapped GPIO, but it isn't.
>
> Create a new submenu:
>
> menu "RPMSG GPIO drivers"
>          depends on RPMSG
>
> And put it here as the first such driver.
>
> No need to have a dependency on RPMSG in the GPIO_IMX_RPMSG
> Kconfig entry after this.
>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/bitops.h>
> bitops.h or just bits.h? Check which one you actually use.
>
>> +#include <linux/err.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/imx_rpmsg.h>
>> +#include <linux/init.h>
>> +#include <linux/irqdomain.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_qos.h>
> Are you really using pm_qos?
>
>> +#include <linux/rpmsg.h>
>> +#include <linux/virtio.h>
>> +#include <linux/workqueue.h>
> (...)
>
>> +struct imx_rpmsg_gpio_port {
>> +       struct gpio_chip gc;
>> +       struct irq_chip chip;
> This irqchip doesn't look very immutable.
>
> Look at other patches rewriting irqchips to be immutable
> and break this out to a static const struct irq_chip with
> IRQCHIP_IMMUTABLE set instead.
>
>> +static int imx_rpmsg_gpio_get(struct gpio_chip *gc, unsigned int gpio)
>> +{
>> +       struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
>> +       struct gpio_rpmsg_data *msg = NULL;
>> +       int ret;
>> +
>> +       mutex_lock(&port->info.lock);
> Please use guards for all the mutexes:
>
> #include <linux/cleanup.h>
>
> guard(mutex)(&port->info.lock);
>
> and it will be released as you exit the function.
>
>> +static int imx_rpmsg_gpio_direction_input(struct gpio_chip *gc,
>> +                                         unsigned int gpio)
>> +{
>> +       struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
>> +       struct gpio_rpmsg_data *msg = NULL;
>> +       int ret;
>> +
>> +       mutex_lock(&port->info.lock);
> Dito for all these instances.
> (Saves you a bunch of lines!)
>
>> +static void imx_rpmsg_irq_bus_lock(struct irq_data *d)
>> +{
>> +       struct imx_rpmsg_gpio_port *port = irq_data_get_irq_chip_data(d);
>> +
>> +       mutex_lock(&port->info.lock);
>> +}
> Here you need to keep the classic mutex_lock() though,
> because of the irqchip locking abstraction helper.
>
>> +static struct irq_chip imx_rpmsg_irq_chip = {
> const
>
>> +       .irq_mask = imx_rpmsg_mask_irq,
>> +       .irq_unmask = imx_rpmsg_unmask_irq,
>> +       .irq_set_wake = imx_rpmsg_irq_set_wake,
>> +       .irq_set_type = imx_rpmsg_irq_set_type,
>> +       .irq_shutdown = imx_rpmsg_irq_shutdown,
>> +       .irq_bus_lock = imx_rpmsg_irq_bus_lock,
>> +       .irq_bus_sync_unlock = imx_rpmsg_irq_bus_sync_unlock,
>          .flags = IRQCHIP_IMMUTABLE,
>
> probably also:
>
>           GPIOCHIP_IRQ_RESOURCE_HELPERS,
>
> ?
>
> I think you want to properly mark GPIO lines as used for
> IRQs!
>
>> +static int imx_rpmsg_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
>> +{
>> +       struct imx_rpmsg_gpio_port *port = gpiochip_get_data(gc);
>> +       int irq;
>> +
>> +       irq = irq_find_mapping(port->domain, gpio);
>> +       if (irq > 0) {
>> +               irq_set_chip_data(irq, port);
>> +               irq_set_chip_and_handler(irq, &port->chip, handle_level_irq);
>> +       }
>> +
>> +       return irq;
>> +}
> Ugh we try to to use custom to_irq() if we can...
>
> Do you have to?
>
> Can't you use
> select GPIOLIB_IRQCHIP
> and be inspired by other chips using the irqchip
> helper library?
>
> We almost always use that these days.
>
>> +       /* create an irq domain */
>> +       port->chip = imx_rpmsg_irq_chip;
>> +       port->chip.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-gpio%d",
>> +                                        pltdata->rproc_name, port->idx);
>> +       port->dev = &pdev->dev;
>> +
>> +       irq_base = devm_irq_alloc_descs(&pdev->dev, -1, 0, IMX_RPMSG_GPIO_PER_PORT,
>> +                                  numa_node_id());
>> +       if (irq_base < 0) {
>> +               dev_err(&pdev->dev, "Failed to alloc irq_descs\n");
>> +               return irq_base;
>> +       }
>> +
>> +       port->domain = irq_domain_create_legacy(of_node_to_fwnode(np),
>> +                                               IMX_RPMSG_GPIO_PER_PORT,
>> +                                               irq_base, 0,
>> +                                               &irq_domain_simple_ops, port);
>> +       if (!port->domain) {
>> +               dev_err(&pdev->dev, "Failed to allocate IRQ domain\n");
>> +               return -EINVAL;
>> +       }
> This also looks unnecessarily custom.
>
> Try to use GPIOLIB_IRQCHIP.
>
>
>> +static struct platform_driver imx_rpmsg_gpio_driver = {
>> +       .driver = {
>> +               .name = "gpio-imx-rpmsg",
>> +               .of_match_table = imx_rpmsg_gpio_dt_ids,
>> +       },
>> +       .probe = imx_rpmsg_gpio_probe,
>> +};
>> +
>> +static int __init gpio_imx_rpmsg_init(void)
>> +{
>> +       return platform_driver_register(&imx_rpmsg_gpio_driver);
>> +}
>> +
>> +device_initcall(gpio_imx_rpmsg_init);
> No please just do:
>
> module_platform_driver(imx_rpmsg_gpio_driver);
>
> Fix up  these things to begin with and then we can
> look at details!
>
> Yours,
> Linus Walleij
>


