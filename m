Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B63E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 07:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9G0sn3xYJ1534yAllD+T/qPtDutwf37TtG1eLFZyEg=; b=wLQfD+w8ua4/pgG3mx80zSMxRc
	9U+gVeVH8Bu2bF6KL3cjFg51nNiPgp1uWdLTsPjMbGq4/53EJCa+HBsvPijrEeGMBOMkZ40jvygbU
	hJhXNKFuXtWCaSAZcvelWNHrJ48yAp62wLYYoNwJ62J1wXHgdmJRmOE3sGuj0Nboa+JIXPJWzHZav
	p1/tdIYRc3fH1Io7BkY1FHLnieGZLgoqIo7vGoItquZ/t1w6RkBPbaaKjxSpdIzFloTry+4cF4jjR
	NFoRL27y7gG5Jj4q2px9jVlXMpC2tFWeLuZXdA6LwbTCwhmVMAho8B1NxHvdVR9UC/vbvlQQfvTxZ
	6T6dgW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOX6x-000000048ed-2XWG;
	Fri, 20 Dec 2024 07:07:47 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOX5o-000000048Wy-1wrj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 07:06:37 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOX5e-0007sl-Dz; Fri, 20 Dec 2024 08:06:26 +0100
Message-ID: <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
Date: Fri, 20 Dec 2024 08:06:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
To: Carlos Song <carlos.song@nxp.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Clark Wang <xiaoning.wang@nxp.com>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_230636_515472_CF20511B 
X-CRM114-Status: GOOD (  25.94  )
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

Hello Carlos,

On 20.12.24 07:58, Carlos Song wrote:
> 
> 
>> -----Original Message-----
>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>> Sent: Friday, December 20, 2024 2:13 PM
>> To: Carlos Song <carlos.song@nxp.com>
>> Cc: Andi Shyti <andi.shyti@kernel.org>; Frank Li <frank.li@nxp.com>;
>> kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
>> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Clark Wang
>> <xiaoning.wang@nxp.com>; Ahmad Fatoum <a.fatoum@pengutronix.de>
>> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
>>
>> Caution: This is an external email. Please take care when clicking links or
>> opening attachments. When in doubt, report the message using the 'Report this
>> email' button
>>
>>
>> On Fri, Dec 20, 2024 at 05:59:38AM +0000, Carlos Song wrote:
>>>>> So we make this logic. Anyway we let the I2C controller registered
>>>>> whether
>>>> DMA is available or not(except defer probe).
>>>>> Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing
>>>>> happened if
>>>> DMA is defer probed or not enabled(This is an expected).
>>>>> However we still need i2c DMA status is known when meet an
>>>>> unexpected
>>>> error, so we use dev_err_probe() to print error.
>>>>
>>>> Why dev_err_probe() instead of dev_err()?
>>>>
>>> Hi,
>>> In patch V2 discussion, Marc suggested just return dev_err_probe(),
>>> but I don't accept it so I choose to use dev_err_probe() to print error in V3.[1]
>> In this case, the two APIs have the same function, do you mean dev_err() is more
>> suitable?
>>
>> Yes, dev_err_probe() should be used in combination with return. For
>> example:
>>   return dev_err_probe(...);
>>
>> It will pass the return value on exit of the function and optionally print of the
>> error message if it is not EPROBE_DEFER. Practically it replace commonly used
>> coding pattern:
>>   if (ret == -EPROBE_DEFER) {
>>     return ret;
>>   } else if (ret) {
>>     dev_err(..);
>>     return ret;
>>   }
>>
> Hi,
> 
> Get your good point. I will change my code in V6:
> +       ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> +       if (ret) {
> +               if (ret == -EPROBE_DEFER)
> +                       goto clk_notifier_unregister;
> +               else if (ret == -ENODEV)
> +                       dev_dbg(&pdev->dev, "Only use PIO mode\n");
> +               else
> +                       dev_err(&pdev->dev, "Failed to setup DMA, only use PIO mode\n");
> +       }
> 
> I think this is what you want to see, right?

This loses the information why the error happens (ret). Using dev_err_probe
even if no probe deferral is expected in that branch is perfectly fine
and the kernel-doc even points it out:

  Using this helper in your probe function is totally fine even if @err
  is known to never be -EPROBE_DEFER.

Cheers,
Ahmad

> 
>> --
>> Pengutronix e.K.                           |
>> |
>> Steuerwalder Str. 21                       |
>> http://www.pen/
>> gutronix.de%2F&data=05%7C02%7Ccarlos.song%40nxp.com%7C2950266755a
>> 241c00a9208dd20bd5cf2%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
>> %7C638702719862691439%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki
>> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
>> %3D%3D%7C0%7C%7C%7C&sdata=aIuzJP0v5C6HzOCGnCHobK9Llml3thHclTwu
>> CjD13IM%3D&reserved=0  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
>> |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:
>> +49-5121-206917-5555 |
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

