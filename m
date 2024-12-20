Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF9CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9Tu5pmxKRUW+3qnyQBLM/RpcLLOw//zMT1VtikaUoY=; b=R2oGZuyH0RHRc5K0DSMCIp0DBp
	iccHvUdPmK8TpMMl+aP82mUjD58q8EcX20HF935eOKbw7yri+e3dkU/TfJRtN/GbIP5X+Ax9KTuaq
	c204a+2vAkWP5UM1zqKlQzPUQRBtVsHIoQmGHIg4eGrV5rA+dR47lgj9MDFO3or9tHJMX4/48LFr9
	aeMPeQ+x3+FvDo0L1S/cdFrD1+V6itNUKY964WU1lnDrzHTB5qfew2wW+CC0t4xcWV4Q6Xrr2zCSs
	phNY5w+Aki1xzaZKmA9zcTDpUfkxlHIlggHSNLzNSn5axQfqu1yAB/4eq5sCuGfku/LJK90AsYMFy
	mlG1ATwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZNn-00000004RBz-22wM;
	Fri, 20 Dec 2024 09:33:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZMe-00000004QzG-2mhz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 09:32:10 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOZMW-0005JY-9M; Fri, 20 Dec 2024 10:32:00 +0100
Message-ID: <451e8c12-7b45-4b12-af10-63f60ba6e92e@pengutronix.de>
Date: Fri, 20 Dec 2024 10:31:59 +0100
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
 <89a3b1c9-2be2-4e7f-a0c6-abbf8b88957b@pengutronix.de>
 <AM0PR0402MB39374CFFA66D8121DB218334E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <AM0PR0402MB39374CFFA66D8121DB218334E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_013208_701087_AADA3E4F 
X-CRM114-Status: GOOD (  20.32  )
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

Hi Carlos,

On 20.12.24 10:23, Carlos Song wrote:
>>> Hi, the ret is from i2c_imx_dma_request() and look like that ret has
>>> been converted by PTR_ERR, So the ret error has been human readable
>> version?
>>
>> I am not sure I understand the question. ERR_PTR() makes an error pointer
>> and %pe formats that pointer as error message. So you don't need to change
>> any function return types unless needed, just at the end print it with %pe
>> instead of %d (and after error pointer conversion if needed).
> 
> Sorry, I don't know if I understand it incorrectly.
> I review other driver code, most choose to return error value but not an error pointer.
> Shouldn't error value ​be more readable than error pointers?
> When we see -110 we know TIMEOUT and we see -12 we know NO MEM.

I know -110, but -12 I need to look up :)
Both are cryptic to end users, which is why %pe was added
on top of the existing %p:

If CONFIG_SYMBOLIC_ERRNAME is enabled %pe expands to an error string,
e.g. "ENOMEM" or "ETIMEDOUT". If it's disabled, you get the same
error number that was printed raw before.

Cheers,
Ahmad

> 
> i2c_imx_dma_request is using PTR_ERR to convert pointer to error value[1].
> I don't know why need to use ERR_PTR to reconvert the value to pointer:
> 
> dev_err(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n", ERR_PTR(ret));
> 
> Is there some strong reason?
> 
> [1] https://lore.kernel.org/imx/AM0PR0402MB3937419BBB58B75FB8F8DE2DE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com/
>>
>> --
>> Pengutronix e.K.                           |
>> |
>> Steuerwalder Str. 21                       |
>> http://www.pen/
>> gutronix.de%2F&data=05%7C02%7Ccarlos.song%40nxp.com%7C594497db1b5
>> 44e479a8f08dd20d1e88e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
>> %7C638702808104903131%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki
>> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
>> %3D%3D%7C0%7C%7C%7C&sdata=EnhsIFlBooqjB%2FSRWF7uAqRHE3yN6rbdD
>> 1yQueTrRus%3D&reserved=0  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
>> |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:
>> +49-5121-206917-5555 |


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

