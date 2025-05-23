Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115E1C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+IFdO1usXKHPiQf33sJ74JnT4YFmfU5fTYrm93yLqI=; b=DA9H2g41x3fgfSlfMDMrZN24K9
	a2ePFT9dBfqt4X6MpC5NW/ewB69MO6BuYOmE0WnK+Ix4ICQo2Iy/N60Ci/+j9GGptl2joiuVw/RWD
	FRrlO2yuvERAdqPrabpBpN850k+J7VlHCtngb4s1NXqocYWjIUIc3HPwLBrsc9qlPXN7JDTM4aiEU
	D9BLvd1uxJgZjD4RUWy45hEK8rj8N0j6E17NVX1UuvjCuR1Gs9ipqPecEBcf9KIedCEgFiQwfgJpJ
	CdwsXTcZn9N4vngP+/CL/LndGRekCvbmDaP/cnQSzM6kmdmBokcS12YV37HKe/+G7wKDd3FQCyKbK
	/4zTsfQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITjQ-00000004913-1Bz6;
	Fri, 23 May 2025 14:50:44 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISwE-00000004271-0RmB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:59:55 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ND60Jb017699;
	Fri, 23 May 2025 15:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	e+IFdO1usXKHPiQf33sJ74JnT4YFmfU5fTYrm93yLqI=; b=Vyz/K+59SCGHceQC
	kOjfJsoERs8fnIZIOj6znI55PUoh6cU/Lvi94TMR1NtqhPDab+uVxYqR70OVE8NC
	KszErRyOOPahLPpNm5tC6/J+V6IU7AvDUsodn3S/eY2N8XJ1guulqMr3Qh3ymeLp
	6J5SWme3OF5d9p+0NQxUYxwHt6/5AjE4NTBDCEceuPkdKq/7xA5/sgqi8E8dzKU7
	8zUVsfFzfFYnfc4KFkkaQYgNA3IwuvBQH492gk/nGJSaisrmj7glHSSy8WxSELYO
	dJQKr2tJ4/p4DCl8TzeFVYhguNyD9mDwQOiCKbkUPjK5QCIqHw1xoGlcO0a+f+Vw
	SYQeUg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4ej9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 15:59:46 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E9C840045;
	Fri, 23 May 2025 15:58:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47D74A7437F;
	Fri, 23 May 2025 15:57:43 +0200 (CEST)
Received: from [10.252.20.86] (10.252.20.86) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 15:57:42 +0200
Message-ID: <89b8b7ce-cd0e-438f-95ee-2a3058728a5c@foss.st.com>
Date: Fri, 23 May 2025 15:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: stm32: introduce clocks for STM32MP21
 platform
To: ALOK TIWARI <alok.a.tiwari@oracle.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-2-cac9d8f63d20@foss.st.com>
 <3edbda17-cff1-4e8c-bac7-5cfed472fc66@oracle.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <3edbda17-cff1-4e8c-bac7-5cfed472fc66@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.20.86]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_04,2025-05-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_065954_426931_AA51573E 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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


On 5/22/25 18:21, ALOK TIWARI wrote:
>
>
> On 21-05-2025 18:08, Gabriel Fernandez wrote:
>> This driver is intended for the STM32MP21 clock family.
>>
>> Signed-off-by: Nicolas Le Bayon<nicolas.le.bayon@foss.st.com>
>> Signed-off-by: Gabriel Fernandez<gabriel.fernandez@foss.st.com>
>> ---
>>   drivers/clk/stm32/Kconfig         |    7 +
>>   drivers/clk/stm32/Makefile        |    1 +
>>   drivers/clk/stm32/clk-stm32mp21.c | 1586 
>> +++++++++++++++++++++++++++++++++++++
>>   drivers/clk/stm32/stm32mp21_rcc.h |  651 +++++++++++++++
>>   4 files changed, 2245 insertions(+)
>
>
> Reviewed-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Many thanks Alok

Best regards

Gabriel

>
> Thanks,
> Alok

