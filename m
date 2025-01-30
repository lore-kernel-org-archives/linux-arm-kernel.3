Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6031C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s976OaYE2e3BsM2Yyt8pmWRwKwvFpBCgGfn39LD9zkw=; b=k+gI21+VhI299XM9orD7ACXqEe
	X36rg51DCCm7DOb4tnKM4sxYR3kcC9htjOGECxpDWCkON+lxgdPf9818RExy4MZgCFTeavZyDoya8
	mXaPpzCFEANNAAvoesoeghLTcHSIDzUiXR8sEh1h1f+QvojQqs6wdfdlWKMIc/CjbYkHuugAvT0+2
	R5+/5TFDSAvIIqlVUMtbcgMYYLyAPjs/dlbB/CRIhdV0nwwXkhgLEXukB0KxCLwvMfDkIlDgYZk0G
	IOE+iTJ0KuXCuHSldK+wcZ+KFQJMq/YSb0iqsTN4Cm5SjaGZVHWD3uK3fLbG0bN0Nns0VodAgLYe4
	EQLUDliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQQ0-00000008TGQ-1xto;
	Thu, 30 Jan 2025 09:01:00 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQNe-00000008SvB-2CqA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 08:58:35 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U6Qiup019883;
	Thu, 30 Jan 2025 09:58:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	s976OaYE2e3BsM2Yyt8pmWRwKwvFpBCgGfn39LD9zkw=; b=d3G/Qm44ZvEs6Pm1
	MFIt92MrrZ7GkJEc1sMOsAsWaPjDpugbhSSWoD5CB/JjJEwBd5HOC/kB7O0wDcIe
	Mto+B7CcU9xb+DYxKAd//M/HIupe0ifZzjajnMAYL1QkYMqHkCXwsTESRyhSeOp7
	+BDxhIEVuA5BOdxoWMjBcQ6GwYqZ8wsd5bOv/9iif0e5Fa1WtwLjc5o96HmybiLr
	aVawqJDqZ+YjjyVbhk4vqRR9meCxiwF1LpJL76uweEmGEOAEzW7KAJ1FxIovGQDy
	BnQQRYrx/zdyXT5QCo7ZTJ4WFkMEDNJr7GYYpHWePrdt+eTQhJnpMfwIIeGI5DNo
	zeivdg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44f26x6wd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 09:58:24 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1A47F4002D;
	Thu, 30 Jan 2025 09:57:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4DE822D5871;
	Thu, 30 Jan 2025 09:56:02 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 30 Jan
 2025 09:56:01 +0100
Message-ID: <b5d7fce0-f726-4b54-a038-d3e0526cdde0@foss.st.com>
Date: Thu, 30 Jan 2025 09:56:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable STM32 OctoSPI driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-10-patrice.chotard@foss.st.com>
 <df76be38-cf62-417a-85f4-a1a95af0db74@kernel.org>
 <36560385-ff90-4f7c-8e5c-2bfb014a4c7f@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <36560385-ff90-4f7c-8e5c-2bfb014a4c7f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_05,2025-01-29_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_005834_861997_80B328EA 
X-CRM114-Status: UNSURE (   9.09  )
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



On 1/29/25 11:30, Krzysztof Kozlowski wrote:
> On 29/01/2025 10:36, Krzysztof Kozlowski wrote:
>> On 28/01/2025 09:17, patrice.chotard@foss.st.com wrote:
>>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>>
>>> Enable the STM32 OctoSPI driver.
>>>
>> Please squash this patches. It's not one driver per one defconfig change.
> 
> 
> s/this/these two/
> 
> So only one defconfig patch.

ok

Thanks
Patrice

> 
> Best regards,
> Krzysztof

