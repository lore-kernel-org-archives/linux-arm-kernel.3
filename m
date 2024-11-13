Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5568D41C23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hp24S5i2Pk28DZAbH97tK+N9cfrs3EfX5xRbl8zmPhU=; b=KZM4seN6ypePauK/NRhgj420At
	GVO006EsKB1WpIINaEqjiqcP03oiqXFHERLLGEGQqkYnptGylHj/DBa7gp2UlvTx6c4ieGhCZmBue
	U5CxWqalbIZRC5uzzPiao0GGEwGAn9MGgSgJhiZzfd4JcOIfMKwRGIWqsnNMmocntpH60XsiNnc/T
	UwMmh/eXiGuJT7SsT/qSSoc8BfLNhiZyl73elxEJK0aUcDGKIYlpg5qCSPZgxukPMZs/fXiv2e8+K
	O58OJ1QJFIAEaXQx74HMQ++DZsYxw+RDtnuqz7Z1Pu3ReBkWCG8XyIn33rxbHu1FpyD25VMh7vwYZ
	Qpq5l3CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9fb-00000006FBX-0hlX;
	Wed, 13 Nov 2024 09:28:15 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9d7-00000006Emp-21wB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 09:25:43 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AD9PSx2002157;
	Wed, 13 Nov 2024 03:25:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731489928;
	bh=Hp24S5i2Pk28DZAbH97tK+N9cfrs3EfX5xRbl8zmPhU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZqmZO5RsBxvo+4qr2dXzEc+EqGPlLi22GFzvqmn6osDgrAY0crlfj48wX9czk0sDv
	 G0JbqHiSD0copaGVEVzWk8/X/rk2p97KvTf1Mfcx+Jkr+41G8I+v1s3jfHr+Xg5M8q
	 wMRXkuRHlTOihLVH0q9iOKxcuQ192Th5hFWIjbs8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AD9PS9c125462
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Nov 2024 03:25:28 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 03:25:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 03:25:27 -0600
Received: from [172.24.227.220] (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AD9POIa087478;
	Wed, 13 Nov 2024 03:25:24 -0600
Message-ID: <32200597-9c02-4d43-bf91-3fe0b8ce83bc@ti.com>
Date: Wed, 13 Nov 2024 14:55:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62x-sk-common: Add bootph-all
 property in cpsw_mac_syscon node
To: Vignesh Raghavendra <vigneshr@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero
 Kristo <kristo@kernel.org>,
        Nishanth Menon <nm@ti.com>
CC: <s-vadapalli@ti.com>, <srk@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241011110207.600678-1-c-vankar@ti.com>
 <b2dadb0a-fd85-42fc-b340-6c77fe5ded0a@ti.com>
Content-Language: en-US
From: Chintan Vankar <c-vankar@ti.com>
In-Reply-To: <b2dadb0a-fd85-42fc-b340-6c77fe5ded0a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_012541_722658_4CDD720C 
X-CRM114-Status: GOOD (  12.96  )
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



On 28/10/24 22:06, Vignesh Raghavendra wrote:
> 
> 
> On 11/10/24 16:32, Chintan Vankar wrote:
>> Add bootph-all property in CPSW MAC's eFuse node cpsw_mac_syscon.
>>
> 
> Why?
> 
> Please make sure commit message is verbose enough to say why the change
> is needed vs what that change is (latter is obvious lookng at the diff)
> 

Sure Vignesh. I will update the commit message accordingly in next
version.

>> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
>> ---
>>
>> This patch is based on linux-next tagged next-20241011.
>>
>>   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> index 44ff67b6bf1e..82d34dfb91ed 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
>> @@ -303,6 +303,10 @@ AM62X_MCU_IOPAD(0x028, PIN_OUTPUT, 0) /* (C5/C6) WKUP_UART0_TXD */
>>   	};
>>   };
>>   
>> +&cpsw_mac_syscon {
>> +	bootph-all;
>> +};
>> +
>>   &wkup_uart0 {
>>   	/* WKUP UART0 is used by DM firmware */
>>   	bootph-pre-ram;
> 

