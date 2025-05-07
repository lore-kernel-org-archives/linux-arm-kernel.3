Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE76C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6cChK4mVXO0RSZQI0gFGItxCWM0e4VaK27NpIU1GvA=; b=YkIglQDVFns5Nagb51lUT4DQWZ
	Tp6dzSWI8iGPN9thXSjjyMpMAUX5zb9MbisuqUW0xWWp8Cnx4FXDQVtly/iz/6KZdFZgM3eybRSdx
	kchueJ/2FCBdSad6Zgg/Q6ptKn2rAswfabEGFDGpDQKHUJyLW/coRPy+pbiBT7t/93TTpWQjSYMpW
	X2Nr3FMmS5doYju4+sbGwLgVZNtHaJj65OeYVRCp3Z8YXg8pVI9njcuzBYOXYo5L/OdkhBSlmxwy6
	l5sw5Dt9dnynlANrZCybk2O+nkK3jBeJIy0UL54XJAnmMDaRHmgpRYFHEC14ouyxn2yBVaDWt7sq4
	SfqUXNEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCb3C-0000000Ewqv-3pUz;
	Wed, 07 May 2025 09:26:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCaE9-0000000EkYO-0O8B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 08:34:09 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5473dDaX032682;
	Wed, 7 May 2025 10:33:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	A6cChK4mVXO0RSZQI0gFGItxCWM0e4VaK27NpIU1GvA=; b=fN2iQhvG8a5fm6y/
	PUmlxMIL5LsXakclNUJXC7NMVqw0GyKIvoGmFz24j0FmPm9KJf7b6hihMDmiLaX/
	wCd2kRxVQb5xiGSWnWzum8y9antqrkUSSOI7xlRQEAduJshB7IrLwVftV9XqG30B
	fLGx6hWYbq2fePmXZwntC5AuVlAsNiIy2GXp0HbX/OY5f+LYGKFxxYgFH2jYbg+m
	1AoE+GrU4aAUs7YhjuSEYTxyHDiZxXAvTNcT+K/D+iz6bWkekvmDDhwb+HJ55FWs
	6XYE2e8L9UflALBq/iwm/HQUxRrNgFoJEU5FfVGVzKiMHjUefgHsSomEd/d6zwx6
	w6LyZg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46dvq45g07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 10:33:51 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A007640053;
	Wed,  7 May 2025 10:32:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F09CA23DB2;
	Wed,  7 May 2025 10:31:46 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 7 May
 2025 10:31:45 +0200
Message-ID: <956c6921-35f1-4238-9e8e-7f335f33d2f3@foss.st.com>
Date: Wed, 7 May 2025 10:31:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 0/4] Add STM32MP25 SPI NOR support
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>,
        Gatien Chevallier <gatien.chevallier@foss.st.com>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>
References: <20250507-upstream_ospi_v6-v13-0-32290b21419a@foss.st.com>
 <1f7760c6-0fdf-48b0-9c13-85fa5e01cddd@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <1f7760c6-0fdf-48b0-9c13-85fa5e01cddd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_013405_434498_F7E73FC0 
X-CRM114-Status: GOOD (  11.84  )
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



On 5/7/25 10:28, Krzysztof Kozlowski wrote:
> On 07/05/2025 09:25, Patrice Chotard wrote:
>> This series adds SPI NOR support for STM32MP25 SoCs from STMicroelectronics.
>>
>> On STM32MP25 SoCs family, an Octo Memory Manager block manages the muxing,
>> the memory area split, the chip select override and the time constraint
>> between its 2 Octo SPI children.
>>
>> Due to these depedencies, this series adds support for:
>>   - Octo Memory Manager driver.
>>   - Octo SPI driver.
>>   - yaml schema for Octo Memory Manager and Octo SPI drivers.
>>
>> The device tree files adds Octo Memory Manager and its 2 associated Octo
>> SPI chidren in stm32mp251.dtsi and adds SPI NOR support in stm32mp257f-ev1
>> board.
>>     
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Changes in v13:
>> - Make firewall prototypes always exposed.
> 
> 
> I do not see any changes here.
> 
> b4 diff suggests this is the same as v11 so I expect the same failures.
Hi Krzysztof,

In this series there is an additional patch vs previous one : "[PATCH v13 1/4] firewall: Always expose firewall prototype"

Patrice


> 
> Best regards,
> Krzysztof

