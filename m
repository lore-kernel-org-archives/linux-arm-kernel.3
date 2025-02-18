Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F4DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4eYCNtATnwN1ZIKmyX0+Wk2XGtLI3NIn3i0ikesTwU=; b=YA0UYd6teWNX2w2ixsMfOhqGE0
	PpZD4pjA0bPOa9t1CYx3LiiOrB8JSTkA+DQtHr7Mx7dhTmJrqJrmT3dddP8oYbmXE7ALzSJNTnhNt
	NCMLylXLTcHhKN0oE/RJxC+jofo5gxcPIhuY5oZUT4DQoU3lGvMYZmxIKUTpi+NlkVs0KNrZa0SKV
	/FBIyzGJEVdmYZGlHUpePaZ+YRVqLinwIw9p4AjSyL8YahCGBJ9e9cZ/8TZMLRd1qvyguaQTn9BRN
	JvCEp5hxAcixcJFz+mkAlVBLoU8mu/eW7nh9MFDD0fD7FdjwbfhOeWlsKpKHYL6tlAyef+ae34ykz
	FTfirRaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkL4u-00000007os1-2HsF;
	Tue, 18 Feb 2025 10:43:48 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkL2q-00000007oR2-1NF9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:41:41 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IAdTCW012257;
	Tue, 18 Feb 2025 11:41:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	V4eYCNtATnwN1ZIKmyX0+Wk2XGtLI3NIn3i0ikesTwU=; b=APp4fQxusozWDrY6
	juXOk6kxHRZCNbdFr2OT91Sr8enp6bZGWGhFyTEGIAte+D8JGCKboLnN71ZQb639
	dohF5cO7IsMWw+dIWHuixxSkC/C0ZEFj+TeQdt13h1rw+kdQFv8iLnfCd7rbm8R8
	gqvNoOand5i3pxQFGHFlpwZMmuzJE0tEQSz0QgYdxjbQDDj0W1JHZ58xrgz45lCb
	o+FPDATKCjr2lRFJhxKeaUdWYIf/1PpGMxt2sdHEEHCtLYRGHQ3sqE5QVtwgN49B
	3J+xOkyEjxOmpXh/uUoRFVdcpjTbHyNIl504sjtgZcQSetZo79h9BJ0k3rovVpdn
	9it76w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44tm1uba39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 11:41:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1EA4340047;
	Tue, 18 Feb 2025 11:40:09 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4E91E3BE6A5;
	Tue, 18 Feb 2025 11:39:04 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 18 Feb
 2025 11:39:02 +0100
Message-ID: <d2a2feed-a2f0-430d-a872-23d22afd937a@foss.st.com>
Date: Tue, 18 Feb 2025 11:39:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Add STM32MP25 SPI NOR support
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250210131826.220318-1-patrice.chotard@foss.st.com>
 <20250213-lush-rainbow-moth-0f5e18@krzk-bin>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250213-lush-rainbow-moth-0f5e18@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_04,2025-02-18_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_024140_659722_E1AF623F 
X-CRM114-Status: GOOD (  10.83  )
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



On 2/13/25 08:56, Krzysztof Kozlowski wrote:
> On Mon, Feb 10, 2025 at 02:18:18PM +0100, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics,
>> for that it adds support for:
>>   - Octo Memory Manager driver.
>>   - Octo SPI driver.
>>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
>>
> 
> You combined three different subsystems in one patchset and nothing here
> explains why and what is the merging intention. Either split your work
> or explain dependencies/merging.

Ok i will add an explaination about OMM and OSPI relationship.

Thanks
Patrice

> 
> Best regards,
> Krzysztof
> 

