Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD04FE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzKJtkY+MJUb5JMhu78TtdXOKjCWS6RnEjQeUjrVomI=; b=OrX5moIpoXaDgIRt6xVbv1jriW
	+c9aRTdMZj4/OueXbcFj6ffdz+qAtxUs43a4pWyeLxzV6FOi9NJC7MoSWlBsl1C2DH57CyvQIvn8D
	PCsldQMc1W7YuH0h0Y9ZfnZaTdLDkTWtLOG1DNnM+BiaM1bgC1iFdKOfIs7qFQ6fUzxyPZlxTmPXw
	06hgi0S6X1uIS0Cy1oniwT3t+aBECupGQMDfPUnq5MUNLmjFqs82LL6YUIix/hcr0Q1HN/r0uEFKs
	+PuTdtHFGzeE2koASlZh2rtqS+7W0kk1SOrWKMCJrarPjOzR4Aeilxl4toq8PkZ7X1T7x6FGa71o4
	dUMK0MUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFiy-0000000Fb3V-2LBm;
	Fri, 10 Jan 2025 14:10:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFe5-0000000Fa2S-289Z
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Jan 2025 14:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SzKJtkY+MJUb5JMhu78TtdXOKjCWS6RnEjQeUjrVomI=; b=L71DMbGzBALJChaI3IERp79eHs
	0jRifBoCRe4DBBKtjRfPC1Npfo/U/mHzy3I9ZdMIyxkIRaoX2h6Dy3tDHsH8ynDSX5F5UD6ArxfE2
	sq1gvVoIT22bF+oDQ905f9InCVmaubUUdkK6xf9z18mCH5cswvOO6cWybMcPI6stg8FBi+503+CPZ
	43CS3WGPs3zjltExZwMg0f74lsmpf2OUwAqLIFYFNaiQr2atS3jzLjJEsdxHa6h/P++xN+oum5Z2E
	QASfvpayP8pvV+pzOtBfjI1KsNUWTNFOlnD05/MK/5Etg61tch8g4cLU9jHI9CHy9WD1gbf6S49wZ
	sWBdbouA==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFe1-00000009nE6-2mCx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 14:05:52 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A3qQbG013130;
	Fri, 10 Jan 2025 14:05:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SzKJtk
	Y+MJUb5JMhu78TtdXOKjCWS6RnEjQeUjrVomI=; b=At/YlyB0ExjZ8DYF7gwLF6
	TcYu0vC3QfTl67c6tQsHTvPkg2AocXyd8Z+XEtNmUKugCJGqb/NDQgDue3C8yqW5
	84t2sOHRYcbw1XXSLpDubeN8s+X9v0fyaHMhiKP3ij2AK/iX3z6iKJx7+c5V2wAZ
	kMo1WjsTJ5lO3+UjWKBfUz0+iXpbyxHnNPq+v/Nn0iKk9zUMi5VwgdmUNhgcjykt
	a68PQqhFfT9ojMrCEnC5qGtUuxSe8Pb3sSP9zMWU/1afFUOXuGgZ6TLNlcwlHl+O
	U7UIM/N4sZzpkCphjDqkRhTpoIReA+ua8lYTV0AstDT/3BEijnjFlBrukw8wjwWw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442v1btb0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 14:05:08 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50ADrLxL024750;
	Fri, 10 Jan 2025 14:05:07 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442v1btb0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 14:05:07 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50ADgQTm013663;
	Fri, 10 Jan 2025 14:05:06 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygapagfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 14:05:06 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50AE55p832375454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 14:05:05 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A6AE5805F;
	Fri, 10 Jan 2025 14:05:05 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B06C5805D;
	Fri, 10 Jan 2025 14:05:01 +0000 (GMT)
Received: from [9.61.139.65] (unknown [9.61.139.65])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jan 2025 14:05:01 +0000 (GMT)
Message-ID: <d80f5916-4918-4849-bf4e-2ef608ece09d@linux.ibm.com>
Date: Fri, 10 Jan 2025 08:05:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuimhjog5Zue6KaGOiBbUEFUQ0ggdjIgMDUvMTBdIEFSTTog?=
 =?UTF-8?Q?dts=3A_aspeed=3A_system1=3A_Add_RGMII_support?=
To: Jacky Chou <jacky_chou@aspeedtech.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
        "andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
        "edumazet@google.com" <edumazet@google.com>,
        "joel@jms.id.au"
 <joel@jms.id.au>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "minyard@acm.org" <minyard@acm.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
        "robh@kernel.org" <robh@kernel.org>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
 <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
 <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <8042c67c-04d3-41c0-9e88-8ce99839f70b@lunn.ch>
 <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
 <c05c0476-c8bd-42f4-81da-7fe96e8e503b@lunn.ch>
 <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MeLhr7O8jd-8ePzsQCuKHXgiTwl7M1Df
X-Proofpoint-GUID: pZcWXJhEmsFDJ3lvW_ilyppMTvEAo7cz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_140550_195994_8AFFA6F0 
X-CRM114-Status: GOOD (  25.75  )
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

Hi Jacky,

On 1/10/25 03:15, Jacky Chou wrote:
> Hi Andrew,
>
> Thank you for your reply.
>
>>> I think the code already exist in the mainline:
>>> https://github.com/torvalds/linux/blob/master/drivers/clk/clk-ast2600.
>>> c#L595
>>>
>>> It is configuring SCU register in the ast2600 SOC to introduce delays.
>>> The mac is part of the SOC.
>> I could be reading this wrong, but that appears to create a gated clock.
>>
>> hw = clk_hw_register_gate(dev, "mac1rclk", "mac12rclk", 0,
>> 	       		scu_g6_base + ASPEED_MAC12_CLK_DLY, 29, 0,
>> 			&aspeed_g6_clk_lock);
>>
>> /**
>>   * clk_hw_register_gate - register a gate clock with the clock framework
>>   * @dev: device that is registering this clock
>>   * @name: name of this clock
>>   * @parent_name: name of this clock's parent
>>   * @flags: framework-specific flags for this clock
>>   * @reg: register address to control gating of this clock
>>   * @bit_idx: which bit in the register controls gating of this clock
>>   * @clk_gate_flags: gate-specific flags for this clock
>>   * @lock: shared register lock for this clock  */
>>
>> There is nothing here about writing a value into @reg at creation time to give
>> it a default value. If you look at the vendor code, it has extra writes, but i don't
>> see anything like that in mainline.
> Agree. You are right. This part is used to create a gated clock.
> We will configure these RGMII delay in bootloader like U-boot.
> Therefore, here does not configure delay again.
>
> Currently, the delay of RGMII is configured in SCU region not in ftgma100 region.
> And I studied ethernet-controller.yaml file, as you said, it has defined about rgmii
> delay property for MAC side to set.
> My plan is that I will move this delay setting to ftgmac100 driver from SCU.
> Add a SCU syscon property for ftgmac100 driver configures the RGMII delay.
>
> // aspeed-g6.dtsi
> mac0: ethernet@1e660000 {
> 			compatible = "aspeed,ast2600-mac", "faraday,ftgmac100";
> 			reg = <0x1e660000 0x180>;
> 			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> 			clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>;
> 			aspeed,scu = <&syscon>;    ------> add
> 			status = "disabled";
> 		};
>
> Because AST2600 MAC1/2 RGMII delay setting in scu region is combined to one 32-bit register,
> MAC3/4 is also. I will also use 'aliase' to get MAC index to set delay in scu.
>
> // aspeed-g6.dtsi
> aliases {
> 		..........
> 		mac0 = &mac0;
> 		mac1 = &mac1;
> 		mac2 = &mac2;
> 		mac4 = &mac3;
> 	};
>
> Then, we can use rx-internal-delay-ps and tx-internal-delay-ps property to configure delay
> In ftgmac100 driver.

Thanks. When are you planning to push this change? I might need to hold 
on to mac changes until then.

Regards,

Ninad

>
> If you have any questions, please let me know. Thank you.
>
> Thanks,
> Jacky

