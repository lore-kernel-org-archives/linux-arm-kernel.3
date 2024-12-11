Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DC9E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 07:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hgj/swZP8U2JwRbd491xhu1gQETSCS/Bsf1F8xEIYK0=; b=SFK7TND9fMSS3DDVuPy/UnqPNc
	labxoKzMhD/44ibi1xS/6sfOVGCJJcRIIGjtZY71d7pnuo1kh1vjkaTxsvnqPsX6Kj8POIJ/k8PqO
	BzTOqj6rmdycJl04YU9vPtNGVHQ48TUoQDU+Ok5aVZUSsUH76OKEgOK0gu0zMpYBqL7AlWU4er3Ta
	9kjR4wHMUiDPS8WEQC6ou/TOkybfMaB/tApEJxD2eEKEiafay/+0BdRfI/5+y8rFHd0KdFzaQorOq
	HEci/RM/6rfG1flGf9BrU60exw/uzrv4+FGlvQ+i+QujzLtrVVgf2OAV2ury4jBRYC7toF7Nqn3nr
	acsqvRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGpO-0000000E0sT-2zv0;
	Wed, 11 Dec 2024 07:08:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLGoK-0000000E0ly-2rD2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 07:07:05 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tLGo6-0008Lz-67; Wed, 11 Dec 2024 08:06:50 +0100
Message-ID: <ff7b4769-245c-4c3b-9b15-b8f2c032d3c1@pengutronix.de>
Date: Wed, 11 Dec 2024 08:06:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] i2c: imx: support DMA defer probing
To: Carlos Song <carlos.song@nxp.com>, "mkl@pengutronix.de"
 <mkl@pengutronix.de>, Frank Li <frank.li@nxp.com>,
 "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20241127083818.2108201-1-carlos.song@nxp.com>
 <153e8e36-7b0e-4379-9cc3-6dacb5d705be@pengutronix.de>
 <AM0PR0402MB39370E69BC4B71C761EE8377E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <6b39268b-7487-427d-aff5-f3ca3b2afd42@pengutronix.de>
 <AM0PR0402MB39378417A496F13B201A1907E8312@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB39378417A496F13B201A1907E8312@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_230704_726154_CC2DC201 
X-CRM114-Status: GOOD (  34.31  )
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

On 06.12.24 10:07, Carlos Song wrote:
>> -----Original Message-----
>> From: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Sent: Friday, December 6, 2024 2:50 AM
> Refer previous history:
> https://lore.kernel.org/linux-arm-kernel/6b39268b-7487-427d-aff5-f3ca3b2afd42@pengutronix.de/


> Before replying to your question, I think we should synchronize SDMA and eDMA firstly.

[snip]

> SDMA initialization in i2c-imx driver:
> 
> +       dma->chan_tx = dma_request_chan(dev, "rx-tx");
> +       if (IS_ERR(dma->chan_tx)) {
> +               ret = PTR_ERR(dma->chan_tx);
> +               goto fail_dma;
> +       }
> +
> +       dma->chan_rx = dma->chan_tx;
> +       i2c_imx->dma = dma;
> 
> eDMA initialization in i2c-imx driver:
> 
> ...
> +       dma->chan_tx = dma_request_chan(dev, "tx");
> ....
> +       dma->chan_rx = dma_request_chan(dev, "rx");
> ....
>         i2c_imx->dma = dma;

Thanks for the clarification, I missed that.

> So if need to enable SDMA, should define a separate dma_request function and should not reuse the current i2c_imx_dma_request function.
> Also according to different platforms i2c-imx driver need to choose to use eDMA or SDMA.

Understood.

> So now we start to discuss about your confusion:
> 
>> My concern is this configuration:
>>
>>   - A user has eDMA/SDMA module or disabled, but enabled in DT
> [Carlos]:
> I delete edma channel at dts to disable eDMA before. It works in PIO mode.
> I also test your case : when enable dma channel in DT but disable eDMA module. It will meet error:
> 
> +++ b/arch/arm64/configs/defconfig
> ....
> -CONFIG_FSL_EDMA=y
> ....
> 
> root@ls1043ardb:~# dmesg | grep i2c
> [    4.697392] i2c_dev: i2c /dev entries driver
> [   18.357685] platform 2180000.i2c: deferred probe pending: (reason unknown)
> root@ls1043ardb:~# i2cdetect -y -l
> 
> The case you mentioned is completely inconsistent with the actual usage. Since you have defined the dma channel in dts, it means that you need to
> use DMA mode in i2c, but you disabled the eDMA module when building the Image. This makes no sense at all. I think this is a usage error.
> And the deferred probe pending error is predictable. Since there is no DMA driver loaded, I2C will keep defer probe and be hanged.

I (or rather the user) didn't knowingly define anything though. They just
used the upstream DT, which always enables the DMA nodes and it worked
fine without DMA support enabled in the config for years.
Now they update the kernel after your patches are merged and then the
I2C driver is no longer being probed.

> 
>>   - The I2C has a PMIC, which is needed for eMMC VCC
> [Carlos]:
> PMIC is critical for the whole board, so PMIC will finish all critical system power-on configuration(include eMMC VCC) in the uboot not at kernel.
> So pmic driver probe in kernel won't and shouldn't effect system boot.
> 
>>   - System startup is stuck or considerably delayed
>>
> The purpose of defer probe is to solve the problem of interdependence of module loading, and to try to load again after a while is to ensure that the required functions
> will not be unavailable because the resources are not ready. This delay is unavoidable. If a defer probe occurs, the first consideration should be to reasonably adjust the
> loading order of each module, rather than directly giving up the functions that should be enabled.

If I2C is a critical dependency, the system becomes unbootable instead of the
user just having to wait a little longer. To me that is a regression.

You clarified though that this is only for Layerscape, so the breakage is
more limited, because e.g. on LS1046A-RDB only EEPROM/sensors/RTC won't be
available and system should still be able to boot.

So while I am not yet convinced an equivalent of this change to be a good
idea for i.MX, which tends to have critical peripherals like PMIC on the
I2C, I don't object to it being done for Layerscape. You may add my:

Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Cheers,
Ahmad

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

