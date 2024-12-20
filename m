Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A0AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pYEpJLHLmynLvPvYUw9aBkkJjdq6u3b4fGi7lX/QDQ=; b=s4xSTUDQUqJOXOi9glyfObctS7
	JHlzfSgAKVewk7rgOEr0n1hqVDaVAvf2xbnvbtkPfD/du7qzDApEXMbGjp3HYWhsDp8eKIrUCGulR
	oOK934b9Lj+m2Le1I9tTkjgFacGVcFFNaLfG0nLZzrUo1QHqq1N+NaN+APBhX2geIcB+iOh2K0CK3
	lPly6aU5FxTQ0D8fuq4HD0utS7qhYcaxDCYloNNL0+RG2gsdX0NIUj91buHz/ODJA959xqrAc/7+E
	W/i85dXUOvWUHyf9Pxz9ENqyerP2sCsHp3YPnkeCuqIrJYEj09CZz9zrquzaIpqzn1xDy7R3ZxyNA
	BEi5SBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYZg-00000004Jbt-2hGa;
	Fri, 20 Dec 2024 08:41:32 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOYYW-00000004JFY-2rML
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 08:40:22 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOYYJ-0003lY-5P; Fri, 20 Dec 2024 09:40:07 +0100
Message-ID: <89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de>
Date: Fri, 20 Dec 2024 09:40:06 +0100
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
References: <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <b919e252-6ff4-4e55-9bd6-4d610dda5348@pengutronix.de>
 <Z2UeKZcpeRUt2OQ4@pengutronix.de>
 <AM0PR0402MB393739E1D91ED2A539B5A2C7E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2Ugt8NVued0_4c4@pengutronix.de>
 <AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_004020_738244_98816D70 
X-CRM114-Status: GOOD (  25.90  )
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

On 20.12.24 09:06, Carlos Song wrote:
>> -----Original Message-----
>> On Fri, Dec 20, 2024 at 07:38:47AM +0000, Carlos Song wrote:
>>>> -----Original Message-----
>>>> From: Oleksij Rempel <o.rempel@pengutronix.de>
>>>> Sent: Friday, December 20, 2024 3:35 PM
>>>> To: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>> Cc: Carlos Song <carlos.song@nxp.com>; Andi Shyti
>>>> <andi.shyti@kernel.org>; Frank Li <frank.li@nxp.com>;
>>>> kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
>>>> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>>>> linux-arm-kernel@lists.infradead.org;
>>>> linux-kernel@vger.kernel.org; Clark Wang <xiaoning.wang@nxp.com>
>>>> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing

>>>>>> I think this is what you want to see, right?
>>>>>
>>>>> This loses the information why the error happens (ret). Using
>>>>> dev_err_probe even if no probe deferral is expected in that branch
>>>>> is perfectly fine and the kernel-doc even points it out:
>>>>>
>>>>>   Using this helper in your probe function is totally fine even if @err
>>>>>   is known to never be -EPROBE_DEFER.
>>>>
>>>> Thank you for the feedback. While I recognize the benefits of
>>>> dev_err_probe() for compact and standardized error handling, using
>>>> it without returning its result raises a red flag.

Agreed, which is what spawned this thread in the first place.

If we want to ignore errors intentionally, I think a comment
like the following would make this clearer:

  /*
   * As we can always fall back to PIO, let's ignore the error setting up
   * DMA and see if we run into errors while setting up PIO mode.
   */


>>>> The function's primary purpose is to combine error logging with
>>>> returning the error code. If the return value is not used, it can
>>>> create confusion and suggests potential oversight or unintended
>>>> behavior. This misuse might mislead readers into thinking that the
>>>> function always returns at that point, which is not the case here.
>>>>
>>>> In this scenario, using dev_err() directly is more explicit and
>>>> avoids any ambiguity about the control flow or error handling
>>>> intent. It keeps the code clear and aligned with its actual behavior.

This is a fair point. I don't mind whether we use dev_err_probe or
dev_err with a return code, it's up to you ultimately. I just wanted
the error code to be included and I think a comment would be a good
idea to avoid confusion (provided we keep behavior as-is).

>>> how about this?
>>>
>>> +       ret = i2c_imx_dma_request(i2c_imx, phy_addr);
>>> +       if (ret) {
>>> +               if (ret == -EPROBE_DEFER)
>>> +                       goto clk_notifier_unregister;
>>> +               else if (ret == -ENODEV)
>>> +                       dev_dbg(&pdev->dev, "Only use PIO mode\n");
>>> +               else
>>> +                       dev_err(&pdev->dev, "Failed to setup DMA (%d),
>> only use PIO mode\n", ret);
>>> +       }
>>
>> Please use human readable version of error value. In this case it will
>> be:
>>   dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
>> ERR_PTR(ret));

Sounds good to me.

> Hi, the ret is from i2c_imx_dma_request() and look like that ret has been converted by PTR_ERR,
> So the ret error has been human readable version?

I am not sure I understand the question. ERR_PTR() makes an error pointer and %pe
formats that pointer as error message. So you don't need to change any function
return types unless needed, just at the end print it with %pe instead of %d
(and after error pointer conversion if needed).

Cheers,
Ahmad


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

