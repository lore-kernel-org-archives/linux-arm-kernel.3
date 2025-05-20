Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779AFC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DptsIhmH3OyfRoJnZOG3jvZZODFkToOPq0CogRo1m2I=; b=zzPwUkv37AioNVqljA3PYF60+Y
	XKDTktSKk6RlgygepMFO8Ox+Kxrsj5aW6erq6HlQzldi+bfYXOfzPoqM0SAPT2UD9eYxlqCqmmtmK
	7Bx1+ElkEv5wCkaBzsaGuicYYEKiKwQUjBwqSDUXrRZIHRFAkTybdPgLnIZGHKZ1Xu4zJGvqRhRCH
	aziWnFy+zs4VX57D5lQhsd0xJBtxNIa8wfcVSQdJ1MMVX6yPZrltnV6U3U4FEH2pGQwh7hKbLmpp4
	OW08zPWMKJpRAhMzAL3VXyjRiQAb7EWDi+UN/truADSI+OPoBLAHo+UMvItsJXOSaomKz1zmIamee
	+aiey0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNWJ-0000000D5km-2iQw;
	Tue, 20 May 2025 14:00:39 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHNUA-0000000D5R4-0zgl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 13:58:27 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KDMYcr016869;
	Tue, 20 May 2025 15:58:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	DptsIhmH3OyfRoJnZOG3jvZZODFkToOPq0CogRo1m2I=; b=hVZYxZQOidEFsBG6
	jRT1erh8mm2vwBgbMCsnw3uabEaV0pgnRZEhw6XGXXUN9UDt6iNiQT+CO7LOuFmI
	+w/hh2B7k77xfQj6eQLFLwld+l+jQ9/Nw48di9mnJLdOsHN+J1w2k4t1eeiQLgtX
	M5YqZudcOrjA5qKBbEJDZbKNi16t7QF/XpnK7sSaDnZoCk+t0gEjTcptYXJF3mES
	NMVvspuXXhsFoJdgayQwHxhP1rX5EgN9EffFhLRlKEVrv4BGgGhyBrKhuwYdtfUg
	NPrP00mTkWDvWCKLGsOTEFhdLjNK+B1jrOtaPWIQvlbwDZvoQkM2zqhzG7CSBYlu
	tsQKtQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46pfvke0ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 May 2025 15:58:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B91E140048;
	Tue, 20 May 2025 15:56:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FFC3B1082D;
	Tue, 20 May 2025 15:55:25 +0200 (CEST)
Received: from [10.48.87.146] (10.48.87.146) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 May
 2025 15:55:24 +0200
Message-ID: <dcea023e-9dac-4921-b405-4fd16477902a@foss.st.com>
Date: Tue, 20 May 2025 15:55:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: stm32: add STM32MP21 clocks and reset
 bindings
To: ALOK TIWARI <alok.a.tiwari@oracle.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nicolas Le Bayon <nicolas.le.bayon@st.com>
References: <20250519142057.260549-1-gabriel.fernandez@foss.st.com>
 <20250519142057.260549-2-gabriel.fernandez@foss.st.com>
 <83ce3ca8-c014-4814-8c51-9f7fd5151a41@oracle.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <83ce3ca8-c014-4814-8c51-9f7fd5151a41@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.146]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_065826_566062_C871937A 
X-CRM114-Status: UNSURE (   9.10  )
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


On 5/19/25 16:42, ALOK TIWARI wrote:
>
>> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
>> @@ -0,0 +1,200 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: 
>> https://urldefense.com/v3/__http://devicetree.org/schemas/clock/st,stm32mp21-rcc.yaml*__;Iw!!ACWV5N9M2RV99hQ!Nqfcj0yvl-cb4Mu6XFbLz7FVSHkQfpdQGRbVtM1EqANq9n_cdZZNBg-YGSqb-Nkm16LDOQ7TsRAIi2iDug6DIO8uPU0kq3E$
>> +$schema: 
>> https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!ACWV5N9M2RV99hQ!Nqfcj0yvl-cb4Mu6XFbLz7FVSHkQfpdQGRbVtM1EqANq9n_cdZZNBg-YGSqb-Nkm16LDOQ7TsRAIi2iDug6DIO8uLNFOSgg$
>> +
>> +title: STM32MP21 Reset Clock Controller
>> +
>> +maintainers:
>> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>> +
>> +description: |
>> +  The RCC hardware block is both a reset and a clock controller.
>> +  RCC makes also power management (resume/supend).
>
> typo supend
>
Hi Alok,

Thanks for you review

done


>> +
>> +  See also::
>> +    include/dt-bindings/clock/st,stm32mp21-rcc.h
>> +    include/dt-bindings/reset/st,stm32mp21-rcc.h
>> +
> [clip]
>> +      - description: CK_SCMI_ICN_APB2 Peripheral bridge 2
>> +      - description: CK_SCMI_ICN_APB3 Peripheral bridge 3
>> +      - description: CK_SCMI_ICN_APB4 Peripheral bridge 4
>> +      - description: CK_SCMI_ICN_APB5 Peripheral bridge 5
>> +      - description: CK_SCMI_ICN_APBDBG Peripheral bridge for degub
>
> typo degub

done

Best regards,

Gabriel

>
>> +      - description: CK_SCMI_TIMG1 Peripheral bridge for timer1
>> +      - description: CK_SCMI_TIMG2 Peripheral bridge for timer2
>
> Thanks,
> Alok

