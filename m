Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BBBCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 09:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSdDHuNTbBGSV0Dxkyi9JWjhRYgamGr39a/WPf5G4Ms=; b=HFdTC6K0MDwYkpoMOg5gEm57wX
	nscgxOGnnxg4KKR1LGHDpTW3hdH6/AwookSLQEtskANF6GKyTToSDbo0kDmPIvbD+ghkq4tiGgeAo
	or4Aq79AHmCdgyapIkvCHr0XFMERxsIxftfzvHI5qK0ClDTzlfqDYRDqQcPa3t3Dvp9TwDKBkEANt
	La2DeF1021FIsqPf42/xVnc6NBmU3ASDwgY+1t5bcMCU09ln8yQDgkjSb1HCaLZpNRQb7Dtsem8fu
	35BBN9F82sMuLTpgvagBk6K7VtucBtbF0JfO2kUT98vrdyOYcMBvvhUcdFe90G29I7xEHapq3Bljz
	WD2mzUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Ll1-0000000G2By-1vrG;
	Wed, 24 Sep 2025 09:25:51 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Lkx-0000000G2Aq-3aWo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 09:25:49 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58O9PXRa1670036;
	Wed, 24 Sep 2025 04:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758705933;
	bh=iSdDHuNTbBGSV0Dxkyi9JWjhRYgamGr39a/WPf5G4Ms=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=BsH8sE9oRTYt0VY8L6tl0yYe7pp3QSlwbFtl+TGPOcosWaqHsYbIJW3HCMYZHkHTu
	 7lMqkGrN1g6k9BFbjZLj6NoJQlxUerf/deYgqAyEGswaptTc5UEjeyOV7wkRbyYMO0
	 KplMgOrJ6oEGOUgyLGoTfYQ4kgRgwBLpxyLVGFyU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58O9PWva2336456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 24 Sep 2025 04:25:32 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 04:25:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 04:25:32 -0500
Received: from [172.24.233.14] (shark.dhcp.ti.com [172.24.233.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58O9PRpR1784191;
	Wed, 24 Sep 2025 04:25:28 -0500
Message-ID: <082735e7-956b-4574-952e-06ba69db41f1@ti.com>
Date: Wed, 24 Sep 2025 14:55:26 +0530
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
	<bmasney@redhat.com>
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
Content-Language: en-US
From: Sebin Francis <sebin.francis@ti.com>
In-Reply-To: <PAXPR04MB8459CE9F22CD56A9BFDB5E78881DA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_022548_055520_EF39DF48 
X-CRM114-Status: GOOD (  17.17  )
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

On 23/09/25 17:27, Peng Fan wrote:
> Hi Sebin,
> 
>> Subject: Re: [PATCH v4 5/5] clk: scmi: Support Spread Spectrum for
>> NXP i.MX95
>>
>>> --- a/include/linux/scmi_protocol.h
>>> +++ b/include/linux/scmi_protocol.h
>>> @@ -80,9 +80,14 @@ enum scmi_clock_oem_config {
>>>        SCMI_CLOCK_CFG_DUTY_CYCLE = 0x1,
>>>        SCMI_CLOCK_CFG_PHASE,
>>>        SCMI_CLOCK_CFG_OEM_START = 0x80,
>>> +     SCMI_CLOCK_CFG_IMX_SSC = 0x80,
>>
>> TI is also planning to implement the same in our upcoming platform. so
>> can we use a generic ID instead of vender specfic message ID?
> 
> I tried to push to new generic ID [1] in half a year ago, but in the end ARM
> decided not to add generic ID for spread spectrum support.
> 
> To i.MX, it is too late to use a generic ID and waiting spec, i.MX firmware
> has been public for quite some time and passed several external releases.
> So I need to use what our firmware adds and spec allows: vendor
> extension.

Thanks for the quick response,
Since this implementation is specific to i.MX, can you move this to a 
vendor specific file, so that it will not break i.MX's firmware and TI 
can implement SSC in TI specific file.

> 
> [1] https://lore.kernel.org/arm-scmi/Z8iKErarE0lHWxEy@pluto/
> 
> Regards,
> Peng.

Thanks
Sebin

