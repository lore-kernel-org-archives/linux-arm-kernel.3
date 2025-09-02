Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3285CA100D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWK5LjYNDXJb1VRRWLnTGxLcmQ0F3SifvZSboP4ZaLo=; b=lxRm4iZHxLrdIy4wKNY/77tjMs
	y1dDAAF4Q+t/MV+EXHuaLoOmUZVWvh1FZ160JsiJ4IOZXpe7/Q0K2gsRP+wnQ5B27siBY9pERxTtZ
	TMtt9dFq7y9/ZbLuWjM4NEVN9k68PXol0KfaKi8LmnLlF9tMYe6wADwb0Diko9pqMgudxWmAggNhg
	tU9Q//kVlzOrtXtaTBUYhN1tCMQ+y7rc5zjCS4jRKH3Cr4+yioFEl5V/t2A5bKlku6LptF3D01zdz
	E9Nau1L8R1kgU6sRUEWp1U+pujjbyMygiLjxM927GwrbBZE8GEqmkDAJsqbwaLdT7jwPxQVHchfhs
	KlOT+Vug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWNQ-00000001Yyi-44fe;
	Tue, 02 Sep 2025 19:09:09 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQGQ-0000000HMmr-0ncM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 12:37:31 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582CXPwC010299;
	Tue, 2 Sep 2025 14:37:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	xWK5LjYNDXJb1VRRWLnTGxLcmQ0F3SifvZSboP4ZaLo=; b=sxUBENY9z1oeaQHw
	M1iHcy8NoLBIUzDfpqy3OpvGE+eNMD7FZpT0IsisQBl+ReuUChLMC4vUw49jN23p
	W9anD+Jrv5Su7COecZmfw3tfv2fDl7D4jTHsEInThvvu52PbalpdF4X49GB1uSyy
	mEUq84xvFgp7NXQ2/9/Sum7DATQczFGChM5Z+01DvU+drc4q3a97IEfCvvP/U9fv
	DYathoeSLQYz9VVq5qzqTePnvq5yWv+jBSVpXXXveKL4CzDe5vaZh+otaU+rF13d
	s1utOxI3xBGCTI/GpXhlI5JAZptYIrTcFoWanY/v+k9h6Pk3dLe5rHT8Bo+DEB7/
	AEL1rQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upe7bxyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 14:37:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 37E9D40046;
	Tue,  2 Sep 2025 14:35:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfcas1node2.st.com [10.75.129.73])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BE9B39EDA7;
	Tue,  2 Sep 2025 14:34:39 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFCAS1NODE2.st.com
 (10.75.129.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 2 Sep
 2025 14:34:39 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 2 Sep
 2025 14:34:38 +0200
Message-ID: <f335dfa3-be7e-4321-8625-d6862bb4d574@foss.st.com>
Date: Tue, 2 Sep 2025 14:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
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
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <20250818204420.794554-1-shenwei.wang@nxp.com>
 <20250818204420.794554-4-shenwei.wang@nxp.com>
 <CACRpkdZq25n4gZSesV8z8zrBs6kqU1a8=vwVkPBwM+hFb9JKwg@mail.gmail.com>
 <bb5cb154-0f7a-4e21-afe3-453ff5ee9373@foss.st.com>
 <PAXPR04MB91859E0AACFBC1FC913019848907A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <PAXPR04MB91859E0AACFBC1FC913019848907A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_053730_491665_5F5C17D8 
X-CRM114-Status: GOOD (  22.81  )
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



On 9/1/25 19:22, Shenwei Wang wrote:
>
>> -----Original Message-----
>> From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
>> Sent: Monday, September 1, 2025 2:27 AM
>> To: Linus Walleij <linus.walleij@linaro.org>; Shenwei Wang
>> <shenwei.wang@nxp.com>; Bjorn Andersson <andersson@kernel.org>; Mathieu
>> Poirier <mathieu.poirier@linaro.org>
>> Cc: Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>;
>> Conor Dooley <conor+dt@kernel.org>; Shawn Guo <shawnguo@kernel.org>;
>> Sascha Hauer <s.hauer@pengutronix.de>; Bartosz Golaszewski <brgl@bgdev.pl>;
>> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
>> <festevam@gmail.com>; Peng Fan <peng.fan@nxp.com>; linux-
>> remoteproc@vger.kernel.org; devicetree@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; dl-linux-imx
>> <linux-imx@nxp.com>
>> Subject: [EXT] Re: [PATCH 3/4] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
>>
>>
>> Hello,
>>
>> On 8/21/25 11:01, Linus Walleij wrote:
>>> Hi Shenwei,
>>>
>>> thanks for your patch!
>>>
>>> On Mon, Aug 18, 2025 at 10:45 PM Shenwei Wang <shenwei.wang@nxp.com>
>> wrote:
>>>> On i.MX SoCs, the system may include two processors:
>>>>           - An MCU running an RTOS
>>>>           - An MPU running Linux
>>>>
>>>> These processors communicate via the RPMSG protocol.
>>>> The driver implements the standard GPIO interface, allowing the Linux
>>>> side to control GPIO controllers which reside in the remote processor
>>>> via RPMSG protocol.
>>>>
>>>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>>> Since this is a first RPMSG GPIO driver, I'd like if Björn and/or
>>> Mathieu have a look at it so I'm sure it is RPMSG-proper!
>> Could this driver be generic (platform independent) ?
>> Perhaps i missed something, but it seems to me that there is no IMX specific
>> code.
>> Making it generic would allow other platforms to reuse it instead of duplicating it.
>>
> The driver uses the RPMSG channel just as a transport layer, so the implementation is actually
> platform-independent. However, it requires the remote side to implement the same communication
> protocol and behavior for the GPIO controller.
>

Yes, pending implementation is needed on the remote processor, as is 
already the case for the rpmsg_char and
rpmsg_tty Linux drivers. If a generic remote implementation is needed 
for this series, then it could be
implemented in  the OpenAMP project as done for the rpmsg_tty and 
rpmsg_char [1].

The idea here would be to have an equivalent of the virtio-gpio driver 
but based on the RPMsg protocol instead of the
virtio one.

[1] 
https://github.com/OpenAMP/openamp-system-reference/tree/main/examples/zephyr/rpmsg_multi_services

Thanks,
Arnaud

>
> Thanks,
> Shenwei
>
>> Thanks,
>> Arnaud
>>
>>>> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig index
>>>> a437fe652dbc..2ce4e9b5225e 100644
>>>> --- a/drivers/gpio/Kconfig
>>>> +++ b/drivers/gpio/Kconfig
>>>> @@ -402,6 +402,17 @@ config GPIO_ICH
>>>>
>>>>             If unsure, say N.
>>>>
>>>> +config GPIO_IMX_RPMSG
>>>> +       tristate "NXP i.MX SoC RPMSG GPIO support"
>>>> +       depends on IMX_REMOTEPROC && RPMSG && GPIOLIB
>>>> +       default IMX_REMOTEPROC
>>>> +       help
>>>> +         Say yes here to support the RPMSG GPIO functions on i.MX SoC based
>>>> +         platform.  Currently supported devices: i.MX7ULP, i.MX8ULP, i.MX8x,
>>>> +         and i.MX9x.
>>>> +
>>>> +         If unsure, say N.


