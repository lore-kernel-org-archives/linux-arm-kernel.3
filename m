Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043FBCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 18:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErnmYAOMPCkYTH8iOQbypk1c+4pLhytAoirCHv+9a74=; b=2UK6ga7KX2W+VuK5pAkbRH7Snh
	xSU5TIEVQqnQHhEObXnPBPvsU65gR4SXC09eomdOXGDjAmsoZIsOTOzv00Vv6cqCCYgTcHVAGyA+F
	HuEwdjTMecl6iX1nENz5AmhjOroRyFC23DE2xBGt6c2TWO5Orhf3a2EeEp9Wkf9OS+T9WBafGlY1T
	Rw8IWjI9ltbN6J5rTSX2edyuVGAhRaYM5KYeTByp1XLlIFzNAI0cS+TkjUaqOzUgW27AoJV1GXruo
	b5FJmZFTOfyhAibLuSZU4U5blEMtyuRekm5Xs04VRRM9jtBB7Eap4dtUo+zrZsRUajsLvrLimRsDC
	4BDm7Wpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPF5-00000002Vh3-41mD;
	Tue, 19 May 2026 18:32:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPF2-00000002Vfc-38Xy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 18:32:34 +0000
Received: from [IPV6:2a01:cb1d:8f2:800:bc20:34e7:b335:ce8c] (unknown [IPv6:2a01:cb1d:8f2:800:bc20:34e7:b335:ce8c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C734558;
	Tue, 19 May 2026 20:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779215536;
	bh=T4hekEV2c5uSIfEUMcWz5S2sRGsE5FBfHI4tPckgKoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XNSKxXCeGPHC0YUy6awL40KvTPJPEML0+KYqwuTbWXUJLk33gBxBM4rkfrPdu50BH
	 tARjC9z8TP612v4tgM9BrnyFynTblA1nDM9KlLHUBOhPfeCVuBKopjOeWYnQTMkflK
	 2JO8s8zylye/COG49eTjVGtCQAY2i3b8tfwttR6s=
Message-ID: <7d25ef23-652d-49d2-b9cb-c8747e68ddba@ideasonboard.com>
Date: Tue, 19 May 2026 20:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] i2c: imx: Don't recover bus when arbitration lost
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Andi Shyti <andi.shyti@kernel.org>,
 Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Gao Pan <b54642@freescale.com>,
 Fugang Duan <B38611@freescale.com>, Wolfram Sang <wsa@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20260424-i2c-imx-fixes-v2-0-34fb9504aaeb@ideasonboard.com>
 <20260424-i2c-imx-fixes-v2-1-34fb9504aaeb@ideasonboard.com>
 <aa1a6931-1a98-4f72-b8fc-ae05df28f931@ideasonboard.com>
 <AM0PR04MB680225F01902AD7990E4B6E5E8002@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <AM0PR04MB680225F01902AD7990E4B6E5E8002@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_113232_937055_3265ECC0 
X-CRM114-Status: GOOD (  30.34  )
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

Hi Carlos

On 19/05/2026 11:29, Carlos Song (OSS) wrote:
> 
> 
>> -----Original Message-----
>> From: Dan Scally <dan.scally@ideasonboard.com>
>> Sent: Tuesday, May 19, 2026 4:42 PM
>> To: Oleksij Rempel <o.rempel@pengutronix.de>; Pengutronix Kernel Team
>> <kernel@pengutronix.de>
>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; Andi Shyti <andi.shyti@kernel.org>; Frank
>> Li <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Fabio
>> Estevam <festevam@gmail.com>; Gao Pan <b54642@freescale.com>; Fugang
>> Duan <B38611@freescale.com>; Wolfram Sang <wsa@kernel.org>
>> Subject: Re: [PATCH v2 1/2] i2c: imx: Don't recover bus when arbitration lost
>>
>> [You don't often get email from dan.scally@ideasonboard.com. Learn why this is
>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Hello Oleksij / all
>>
>> On 24/04/2026 13:36, Daniel Scally wrote:
>>> In i2c_imx_xfer_common(), the driver attempts bus recovery whenever
>>> i2c_imx_start() fails. One of the failure modes for i2c_imx_start() is
>>> an arbitration-lost signal which results when a second I2C master on
>>> the bus tries to control the bus simultaneously, which is a normal and
>>> expected behaviour.
>>>
>>> Bus recovery is not the right response for this case. Add a check for
>>> the -EAGAIN return code to avoid running the bus recovery.
>>>
>>> Fixes: 1c4b6c3bcf30d ("i2c: imx: implement bus recovery")
>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
>>> ---
>>
>> I raised this patch after we had issues with one of the i2c controllers on imx8mp.
>> In that case, the bus had multiple masters that were causing the SoC's i2c
>> controller to lose arbitration. The result was that the framework attempted to
>> run i2c_generic_scl_recovery() and regularly hit the "SCL is stuck low, exit
>> recovery" message [1] because the bus was busy rather than stuck.
>>
>> I'm now experiencing a different issue with the imx8mp in which a different
>> controller - which isn't on a multiple-masters bus - starts transacting fine early in
>> boot, but then seems to get stuck - any attempt to start a transaction by either
>> a driver or i2ctransfer results in the IAL bit in I2C_I2SR being set and so the
>> driver reports that it's lost arbitration [2]. In this case, the bus recovery is
>> needed to fix the problem, and so this commit hurts things rather than helps
>> them. This problem isn't consistent - I get it on maybe 10% of boots.
>>
> Hi Dan,
> 
> This is the RM shows:
> 
> Arbitration lost. Set by hardware in the following circumstances (IAL must be cleared by software by
> writing a "0" to it at the start of the interrupt service routine):
> * I2Cn_SDA input samples low when the master drives high during an address or data-transmit cycle.
> * I2Cn_SDA input samples low when the master drives high during the acknowledge bit of a datareceive
> cycle.
> For the above two cases, the bit is set at the falling edge of the ninth I2Cn_SCL clock during the ACK
> cycle.
> * A Start cycle is attempted when the bus is busy.
> * A Repeated Start cycle is requested in Slave mode.
> * A Stop condition is detected when the master did not request it.
> NOTE: Software cannot set the bit.
> 0 No arbitration lost.
> 1 Arbitration is lost.
> 
>  From my understanding:
> The IAL (Arbitration Lost) bit is set not only when true arbitration is lost, but also in several other conditions:
> 
> - SDA is sampled low when the master drives it high (during address/data or ACK phase)
> - A START is attempted while the bus is busy
> - A STOP condition is detected unexpectedly
> - A repeated START occurs in slave mode
> 
> So in practice, IAL can be asserted not only by real arbitration loss, but also when the controller detects abnormal bus conditions.
> 
> Since your system is single-master, this is unlikely to be a true arbitration scenario. Instead, it is more likely caused by signal integrity or timing-related issues, such as:
> - weak pull-up / slow rising edges
> - noise or glitches on SDA
> - timing violations from the slave device
> - others
> 
> As a workaround, you can enable the 'single-master' property to disable arbitration checks in single-master systems, for example:
> 
> &i2c1 {
>      clock-frequency = <400000>;
>      pinctrl-names = "default", "gpio";
>      pinctrl-0 = <&pinctrl_i2c1>;
>      pinctrl-1 = <&pinctrl_i2c1_gpio>;
>      scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>      sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>      single-master;
>      status = "okay";
> };

Thanks! I'm away from the hardware at the moment but I'll give it a try next week and see if that 
fixes the issue.

Dan

> 
> Hope it will help some.
> 
> Carlos


