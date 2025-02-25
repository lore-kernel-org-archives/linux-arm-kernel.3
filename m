Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE24C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/Jb54THTfDypOaw3j9QTlja8nsXEGzKOXd88jtbmz0=; b=cMvd9uJi2uo4PwmdKBx8/bLOaA
	CeLmQrQF/f/ORXMelPMJxAgtNj8zHNBMlFgAAOdeqSzMov9zsieefg54HjiOqSqJpiSE5FgZrgtfO
	vuE9Ue4V+uipVLcNGdhgMcEGItB3QWeJsxmQszP9Ia4aQo//SZuzELyvyoeZtmk9x0szvPQ1lvh6P
	9bznafcNb2DHy//iXOSRY6vno59btB4fOwGzcqkLXwUkvdT/pGoRZty3Bfscq4LBILQyyg5Xp56fL
	XCsYBJduQzTAhn9+l7JcbcGcZfxWL68aLUrUTUPK8heNzSPs/hfqIQ/4MzNzQpGuQG5Lj7fSc9n+C
	EszE5Tvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyZR-00000000a0K-2S4X;
	Tue, 25 Feb 2025 17:18:13 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmyOn-00000000Xac-45CX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:07:15 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PEv1Fd023213;
	Tue, 25 Feb 2025 18:07:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	T/Jb54THTfDypOaw3j9QTlja8nsXEGzKOXd88jtbmz0=; b=FcPQ9JeyT9/q5+3h
	OsRL5WzXhKeLYyKAIBd/2RaNwppTEw4jT6g4cu9RW8r/S6xSfzlzVqMDH1FQD+qS
	J1Q+eaPbzyEHnEH3aqOMdTOZygNqXR2w1SVcEkkZRxSssvNzJbVX1BOe0jKyzUqC
	6WOOBKh32TcuCXyJL6Siwpg08uBKinAOivi3qiocwu6pj1IJeJNSgrl5R5jyv2el
	FnQnT82E8iRK/B3VE3RTxyrEJI8510s0dRia93BYHFf3Bw64g0y6mYZlSgUYxtXe
	Jx+yWTYEQjtOcdJSRBg0wh4hdF+g0/NuVKNv6Pt+M61ZD4cXV0xQtJYIrIYeccmr
	BbACLw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp4ua5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 18:07:04 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9DA5D40065;
	Tue, 25 Feb 2025 18:05:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 694ED4F37FF;
	Tue, 25 Feb 2025 16:46:19 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 16:46:18 +0100
Message-ID: <7bc5c425-1d6e-4e25-b913-287478d4149f@foss.st.com>
Date: Tue, 25 Feb 2025 16:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Subject: Re: [PATCH 1/9] dt-bindings: pinctrl: stm32: Add HDP includes for
 stm32mp platforms
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-1-9d049c65330a@foss.st.com>
 <f17eadf3-eb2d-470d-ad77-909f00584d44@kernel.org>
Content-Language: en-US
In-Reply-To: <f17eadf3-eb2d-470d-ad77-909f00584d44@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_090714_313355_6F06CA4B 
X-CRM114-Status: GOOD (  16.25  )
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

On 2/25/25 14:01, Krzysztof Kozlowski wrote:
> On 25/02/2025 09:48, Clément Le Goffic wrote:
>> Each file introduces helpers to choose the signal to monitor through the
>> HDP pin.
>> Signals are different for each platforms: stm32mp13, stm32mp15, stm32mp25.
> 
> Headers are part of bindings commit, assuming this stays...

Ok will squash with the next patch

>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   include/dt-bindings/pinctrl/stm32mp13-hdp.h | 130 +++++++++++++++++++++++++
>>   include/dt-bindings/pinctrl/stm32mp15-hdp.h | 116 ++++++++++++++++++++++
>>   include/dt-bindings/pinctrl/stm32mp25-hdp.h | 144 ++++++++++++++++++++++++++++
>>   3 files changed, 390 insertions(+)
>>
>> diff --git a/include/dt-bindings/pinctrl/stm32mp13-hdp.h b/include/dt-bindings/pinctrl/stm32mp13-hdp.h
>> new file mode 100644
>> index 000000000000..a3487e700143
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/stm32mp13-hdp.h
>> @@ -0,0 +1,130 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
>> +/*
>> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
>> + * Author: Clément Le Goffic <clement.legoffic@foss.st.com> for STMicroelectronics.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_STM32MP13_HDP_H
>> +#define _DT_BINDINGS_STM32MP13_HDP_H
>> +
>> +/* define a macro for each function a HDP pin can transmit */
>> +#define HDP0_PWR_PWRWAKE_SYS			 "0"
> 
> 
> Why this is a string not a number?
> 
> Where is it used? I don't see usage in the driver, so this does not look
> like binding (and DTS is not a driver).

Those files are helpers for the devicetrees and may be included in 
stm32mp*-pinctrl.dtsi files.
It is a string because it is an helper for the `function` property of 
`pinmux-node.yaml` which is a string.

I understand that having a number as a string is not easily understandable.
I'll consider it in a V2 by trying to use the `pinmux` property.

> Best regards,
> Krzysztof

Best regards,

Clément


