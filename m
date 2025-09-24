Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F77CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 12:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAcYijQUw8JH6Gkhzh4E9b+3rGXrtBQWE/aPaFL/C5k=; b=J01kmfxWI9dBg7/hXQm2aHXEMl
	bi615DtFDl9LTWBs8pyfHxRDNEINQ8kx6Oe3gnFnSpu4XLdHPi+D92/Hs7J6KzXcgBkJ+IMV2IU3k
	3uggTCTQ2wkTCXVnDN/EXRoguaCXyqQ78Vi94SRc939NzMOrZ9sgzzx5Jk+m2dojRYEQChwaTONQx
	seAHFaev0+8ylTdusII5mEwKIhn8h8N45bb7fNhbO6Iq1O5EuVSIOdQj1i13FI0y+2JulU5EJdYy7
	FDRrty7q6X5g6eQmsSEZPS8d2ERqEHzvNMX6ev8ajDk7Po9y8+gPn+zQeL/neNpIOYAQXYb3Pk4Rn
	pxXb9nEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OPg-0000000HHt0-1LxN;
	Wed, 24 Sep 2025 12:16:00 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1OPc-0000000HHqZ-3a53
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 12:15:58 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58OCFd4B1694403;
	Wed, 24 Sep 2025 07:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758716139;
	bh=GAcYijQUw8JH6Gkhzh4E9b+3rGXrtBQWE/aPaFL/C5k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BMQL5iYff0pDWxgw/etrsl5Bm22SIRImKSxHGIc+UEoIAgYx58P0FgozpQveQJns+
	 WZeRyMa2FFd+73mw2gV4/3nEo2NP9k4fCQaap7HIKD3U+0v95vEwXLXvfLepzfhwkK
	 AtClVyqAfQdZStyEVVPNpL6dDlchvd0vBT4t/GPs=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58OCFc7H2420511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 24 Sep 2025 07:15:38 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 07:15:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 07:15:38 -0500
Received: from [172.24.233.14] (shark.dhcp.ti.com [172.24.233.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58OCFW1H1982020;
	Wed, 24 Sep 2025 07:15:33 -0500
Message-ID: <c34157c5-cd13-4e85-a9ee-22446111f633@ti.com>
Date: Wed, 24 Sep 2025 17:45:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] clk: scmi: Support Spread Spectrum for NXP i.MX95
To: Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Marco Felsch
	<m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Brian Masney
	<bmasney@redhat.com>,
        Dhruva Gole <d-gole@ti.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>,
        Geert Uytterhoeven
	<geert@linux-m68k.org>,
        "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
References: <20250915-clk-ssc-version1-v4-0-5a2cee2f0351@nxp.com>
 <20250915-clk-ssc-version1-v4-5-5a2cee2f0351@nxp.com>
 <5f508f1d-2d08-4687-86cd-d1944caa0a49@ti.com>
 <PAXPR04MB8459CE9F22CD56A9BFDB5E78881DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <082735e7-956b-4574-952e-06ba69db41f1@ti.com>
 <PAXPR04MB84590D5AAAB56ED7E1CBDE05881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Sebin Francis <sebin.francis@ti.com>
In-Reply-To: <PAXPR04MB84590D5AAAB56ED7E1CBDE05881CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_051556_990026_D6B3E8B4 
X-CRM114-Status: GOOD (  21.29  )
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

Hi Peng,

On 24/09/25 17:13, Peng Fan wrote:
>> Subject: Re: [PATCH v4 5/5] clk: scmi: Support Spread Spectrum for
>> NXP i.MX95
> ...
>>>>>         SCMI_CLOCK_CFG_OEM_START = 0x80,
>>>>> +     SCMI_CLOCK_CFG_IMX_SSC = 0x80,
>>>>
>>>> TI is also planning to implement the same in our upcoming platform.
>>>> so can we use a generic ID instead of vender specfic message ID?
>>>
>>> I tried to push to new generic ID [1] in half a year ago, but in the
>>> end ARM decided not to add generic ID for spread spectrum support.
>>>
>>> To i.MX, it is too late to use a generic ID and waiting spec, i.MX
>>> firmware has been public for quite some time and passed several
>> external releases.
>>> So I need to use what our firmware adds and spec allows: vendor
>>> extension.
>>
>> Thanks for the quick response,
>> Since this implementation is specific to i.MX, can you move this to a
>> vendor specific file, so that it will not break i.MX's firmware and TI can
>> implement SSC in TI specific file.
> 
> i.MX has encountered issue with pinctrl-scmi.c and pinctrl-imx-scmi.c
> both supports SCMI PINCTRL. Current linux scmi does not support
> both drivers built in kernel image, because scmi devlink issue.
> 
> Sudeep said he would address the devlink issue in 6.19 cycle.
> 
> Given the current situation, I'm hesitant to introduce a new driver
> saying clk-imx-scmi.c.
> 
> What I'm unclear about is whether moving to a vendor-specific file
> implies creating a new driver (i.e., clk-imx-scmi.c), or if it could be
> handled via a callback or another mechanism. Could you help
> clarify the intended direction?

My intended was to handle it via callback or something similar, so that 
TI can its own callback for the TI's SSC implementation.

> 
> Sudeep, Cristian
> 
> Would you please jump in and say something?
> 
> Thanks,
> Peng.
> 
>>
>>>
>>> [1]
>>>
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2F
>> lore
>>> .kernel.org%2Farm-
>> scmi%2FZ8iKErarE0lHWxEy%40pluto%2F&data=05%7C02%7Cpe
>>>
>> ng.fan%40nxp.com%7C4bd4c6b93ff146fbfc4c08ddfb4c5ab5%7C686ea
>> 1d3bc2b4c6f
>>>
>> a92cd99c5c301635%7C0%7C0%7C638943027585856649%7CUnknow
>> n%7CTWFpbGZsb3d8
>>>
>> eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiI
>> sIkFOIjoiTW
>>>
>> FpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=zEREeXuiaC5wWS
>> C%2FUAIe6wfiTf
>>> MG5AEY5vZ7D4OEIGI%3D&reserved=0
>>>
>>> Regards,
>>> Peng.
>>
>> Thanks
>> Sebin

