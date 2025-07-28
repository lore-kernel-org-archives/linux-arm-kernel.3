Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCC9C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/1C0ecdmCsSKInhz4z8SdSet/WiKzIt/u3FdhjILhQ=; b=WnRgp64gYER9tXnWI1c/iFzC0V
	/64zc3eK3ukwsjQl+Zogn6dEu7V+1qOJOU7Yii7REQ4Rkac7rpg5LBumcNhOo4v7go4YQoS+UsySo
	UMO+P2pq3jxwqftE2yLrgLchi1rdEtjiVZqn+xSsBk3UqWJtBZhjoqUdilY1ens5xwL9xl4arIOGD
	6wfZCkIw2dDwVm5R6xBYkQGs0NvlIevI1w2JwLw6xMd4nVPVOGia8mn+SEzWcV69bWY6y7VLR00Pf
	EqtMocMtKFeYFTJpv/xe8DrRXf6Y+TNGONfEGvsvSyfjgtRf7kbXThgfb/lhDiPrJADnFnjF6OVa2
	98JIs13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugJ5c-0000000DxVA-0F0k;
	Mon, 28 Jul 2025 08:20:08 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugJ34-0000000DxD6-2TFx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 08:17:31 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S78cGN007928;
	Mon, 28 Jul 2025 10:17:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	l/1C0ecdmCsSKInhz4z8SdSet/WiKzIt/u3FdhjILhQ=; b=C3cAEzX0Fw+6SVHZ
	E8pdcAyNbkxOsLM6zze7ldv5v6FI6fSHTEBYzrybHm4PPNdaQGX0wjYVgskvgYWc
	/FEfbHh5uPHrr++YWsgK3NiRUfZZQO/3Q3haGaO3CNNABtgHZpKphcAROYJGKkJV
	JsizCNbYoAZUmkl29WrI44TlHudLZ4xzQMq8UfIBeSpw8S4YMQwqh/n+u0ujmezW
	jZe8kBp9+IQIY9RtIQpR4lS+uvTQvj/insHisUxR3trrLvINZe76FKXp3iZZ7x/Z
	oitKiKvYlDvFswyryoFPxNAAPsOHg00F4c8IbFXMWSwyTtpRYVd5KYaivSAY47iS
	HqpYbw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484m58xx6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 10:17:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1565B40049;
	Mon, 28 Jul 2025 10:15:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07AEE6EF690;
	Mon, 28 Jul 2025 10:15:13 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 10:15:12 +0200
Message-ID: <424f8bbd-10b2-468c-aac8-edc71296dabb@foss.st.com>
Date: Mon, 28 Jul 2025 10:15:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/2] net: stmmac: allow generation of flexible
 PPS relative to MAC time
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran
	<richardcochran@gmail.com>, <netdev@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
 <20250725172547.13d550a4@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250725172547.13d550a4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_011730_894174_18A736E8 
X-CRM114-Status: GOOD (  20.36  )
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


On 7/26/25 02:25, Jakub Kicinski wrote:
> On Thu, 24 Jul 2025 14:31:17 +0200 Gatien Chevallier wrote:
>> When doing some testing on stm32mp2x platforms(MACv5), I noticed that
>> the command previously used with a MACv4 for genering a PPS signal:
>> echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
>> did not work.
>>
>> This is because the arguments passed through this command must contain
>> the start time at which the PPS should be generated, relative to the
>> MAC system time. For some reason, a time set in the past seems to work
>> with a MACv4.
>>
>> Because passing such an argument is tedious, introduce
>> STMMAC_RELATIVE_FLEX_PPS config switch so that the MAC system time
>> is added to the args to the stmmac_ptp driver.
>>
>> Example to generate a flexible PPS signal that has a 1s period 3s
>> relative to when the command was entered before and after setting
>> STMMAC_RELATIVE_FLEX_PPS:
>>
>> Before: echo "0 175xxxxxxx 0 1 1" > /sys/class/ptp/ptp0/period
>>
>> After: echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period
> 
> Kconfig doesn't seem like a great way of achieving the outcome.
> Some per-platform knob would be better.
> But ideally we wouldn't do either. Could we possibly guess which
> format user has chosen based on the values, at runtime?

Hello Jakub,

There are two reasons for which I chose this approach:
1) I did not want to affect other platforms and possibly
break scripts that work with the current behavior. Is it
acceptable to do otherwise? If so, maybe there's no need
for a config switch or a per-platform implementation.
2) SoCs may implement more than one MAC and the system
time for these MACs may or may not be synced + the system
time maintained by a MAC may not be a value that represents
a date.

For these reasons, I'm not sure we can rely on the values
that were given to stmmac_enable() to deduce what behavior
we choose. The ptp_clock_request() structure does not hold
loads of information as well.

Maybe we could compare the time to the current MAC system
time and, if the start time is in the past, consider the
value to be an offset. Therefore, any value set in the past
would be considered as an offset. I see some implementations
doing either that or replacing any value set in the past to
a safe start + a fixed offset.

Best regards,
Gatien

