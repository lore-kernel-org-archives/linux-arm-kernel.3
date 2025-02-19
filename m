Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B4CC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 08:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bBJS43pvAXXysK32UqQ0DdYgo9OZo0TPX7SlCS/zbM=; b=Cxz5FCsKzcPbwDoankIjb27Dnh
	jVXCtvkT3Yw60M7Pv0DrCS8MKEyRP7A4PqftbEutTzFMO3NmZs1HUThSitEAUugP+1+3Q9hAfAAzc
	z0PLLzikteNA0v3UUYQ7tUiEDOURIf4tpgc4x0+9f5XWNnKN2lVtKkz0rnPzWbKmjkIMBw2QBnZ+c
	p7oLa/m0w1IoEV8TvI1pu8/VVEM5w/s2iJtjF+rkE/j3paWlqL7bgco2kSMIhKXpRbWDD+XTMqBjq
	PaFGt5IjDAM8KeIZDp7lQ1qmsOOTkHldPQ6IXiJu7Jm6Tb61Hw9XQFyd0x9eUz5R7OAKHhG6fOUth
	VWS4tXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkezt-0000000BNzO-2Cu3;
	Wed, 19 Feb 2025 07:59:57 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkeyP-0000000BNTx-0D50
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 07:58:26 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J4sKAc024666;
	Wed, 19 Feb 2025 08:58:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3bBJS43pvAXXysK32UqQ0DdYgo9OZo0TPX7SlCS/zbM=; b=qrofjjdIBjqjCtpb
	eXbj5Hjt98R97RAEso4phh094s2/DGVfjhBk9wOuOFTSjnzyQ5GMt39Hca+VHeI6
	+6F0WqQwbljBlbKo6DUQxa/d/zVrSybRz6RwlkD5sEiYRUcSqf2+q0IpeANXZe5f
	5hY7cOmdN5AmovgJE1ctS/U1beNebFZVyMVEBLJlkbcBdN1b1j6Kr1HwCqdLNL3G
	tkHAg7150dqPbTeV4UPFl9zR2pqPNubn7WuB4ZDo12AdH8eiT26dfvvsUeSbKdYG
	jW57vPUdO4wnQQmlNx1vp4EzwNmWoNEjqdGVx+p5yoLyseOiK4Xw06QG7HfllL7G
	jptJmA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44vyyn25qe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 08:58:07 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BB48C40053;
	Wed, 19 Feb 2025 08:56:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D4984026F8;
	Wed, 19 Feb 2025 08:52:52 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Feb
 2025 08:52:51 +0100
Message-ID: <df73976e-12a5-4af9-b312-503ae68edcfc@foss.st.com>
Date: Wed, 19 Feb 2025 08:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Add STM32MP25 SPI NOR support
To: Rob Herring <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Will Deacon <will@kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>
References: <20250218130000.87889-1-patrice.chotard@foss.st.com>
 <20250218212138.GA1092771-robh@kernel.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250218212138.GA1092771-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_235825_599083_12F8DBD1 
X-CRM114-Status: GOOD (  13.31  )
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



On 2/18/25 22:21, Rob Herring wrote:
> On Tue, Feb 18, 2025 at 01:59:52PM +0100, patrice.chotard@foss.st.com wrote:
>> From: Patrice Chotard <patrice.chotard@foss.st.com>
>>
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
>> Changes in v4:
>>   - Add default value requested by Krzysztof for st,omm-req2ack-ns, 
>>     st,omm-cssel-ovr and st,omm-mux properties in st,stm32mp25-omm.yaml
>>   - Remove constraint in free form test for st,omm-mux property.
>>   - Fix drivers/memory/Kconfig by replacing TEST_COMPILE_ by COMPILE_TEST.
>>   - Fix SPDX-License-Identifier for stm32-omm.c.
>>   - Fix Kernel test robot by fixing dev_err() format in stm32-omm.c.
>>   - Add missing pm_runtime_disable() in the error handling path in
>>     stm32-omm.c.
>>   - Replace an int by an unsigned int in stm32-omm.c
>>   - Remove uneeded "," after terminator in stm32-omm.c.
>>   - Update cover letter description to explain dependecies between 
>>     Octo Memory Manager and its 2 Octo SPI children.
>>   - Add Reviewed-by Krzysztof Kozlowski for patch 1 and 3.
> 
> No, you didn't.

Argh, sorry, i will send a v5

Patrice

