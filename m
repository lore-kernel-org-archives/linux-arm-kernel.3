Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F3C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHReatZjTtUpe1C3asy2R8IM8Kcv0kDyXvZK9XlQ+lk=; b=usBI7mA29qSgl6+K9D+MNmH3Im
	Jy7Lx6Q/tymF0sUoFcqCIqnbqzINTlrmNK2YQ/q90dGuZnAcuvB0ThTeIlyFWPccsiWvmUHCXdOi8
	jDAJmcgqqUbjRBI08Lt7j68YMDN1gxLSOQ3po2BSz18CSAHMlU8OnYUFcfPiJmgzHaAMDJIpLtJc/
	H6F1DuRPTQIXZy/2eykCBC5jlterB8FEMYIPwfvdvJdixca7TvL+Dk8OnUkQ8VhJvLpkq/yaL0pxy
	mkTxWelz7JZJx9I/yDoeEARAeYb9Ar0aIJDrbxV4A61lnQe3AxB+Q8j8ag0Phj/sxVsw/vciDE5Wj
	tIPsnrAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeUJ-0000000528Z-0EQI;
	Tue, 15 Jul 2025 12:10:23 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeAl-00000004zER-3buB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:50:13 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FAMQbh029486;
	Tue, 15 Jul 2025 13:50:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	hHReatZjTtUpe1C3asy2R8IM8Kcv0kDyXvZK9XlQ+lk=; b=fh1rHRZFK1nk6lOl
	QbM6QkNeuozHJiMlDadg5eg4wTOYpYUEAqkTUs/wyIKHs5Zgzpg+pLlxiN8MgaKm
	bYyrWD2O1fcy3KvdQuvn5Fg9A1fZapLlwseM31NycwEJBo0KtooSCux9wrY5uz80
	BV/lSVKPFfmiz2MtxFR0I7C5E/ywPZsJm+KsXnT0xFjJUl4dx8mGSpBEBlN/ME4n
	FrIgVucwo7SYOMDj9zZBZ7Af9SlkxNRHYeEeKLjFZacUSW4Zl2w5Rh/jWbdEyof4
	5q5IF/tl04yy90VT9LKnTtqbHEjaicGs8F5dMrjP1vooB4JeAOeTs1reIt+9hneq
	2MmeQA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47uf22n5c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 13:50:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BF21B4002D;
	Tue, 15 Jul 2025 13:48:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0025EB23763;
	Tue, 15 Jul 2025 13:47:39 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 13:47:38 +0200
Message-ID: <cfeaa4b0-6894-4363-ba43-25eee31ed497@foss.st.com>
Date: Tue, 15 Jul 2025 13:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] dt-bindings: stm32: stm32mp25: add
 `access-controller-cell` property
To: Rob Herring <robh@kernel.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
 <20250711-ddrperfm-upstream-v2-2-cdece720348f@foss.st.com>
 <20250715031717.GA4144523-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250715031717.GA4144523-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_045012_404134_C615CF7D 
X-CRM114-Status: GOOD (  17.48  )
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

Hi Rob,

On 7/15/25 05:17, Rob Herring wrote:
> On Fri, Jul 11, 2025 at 04:48:54PM +0200, Clément Le Goffic wrote:
>> RCC is able to check the availability of a clock.
>> Allow to query the RCC with a firewall ID.
> 
> If it is tied to a clock, do we need another provider? We have the
> "protected clocks" thing, but that might be a bit different.

What I understand is that the "protected-clocks" list is here to flag 
clocks as protected and the access to it and its register by the kernel 
may cause the reboot of the platform.
The current qcom implementation just drop clocks so no one can access to 
it after they are registered.
For my understanding if you know why the kernel needs the information 
"this clock can't be accessed", I would be interested/

Without the STM32 RCC driver modification, if we access to the DDRPERFM 
peripheral register when the clock is secured we face the same issue, we 
end up rebooting the platform.

Our RCC peripheral is able to know if our DDR subsystem clock (that is 
shared between our DDR controller and DDRPERFM peripheral) is secured or 
not, so we can access or not to DDRPERFM register.
It is the aim of the "access-controller" related code.

Correct me if I'm wrong but to me the difference might be that the 
"protected-clocks" property is here to list in the DT clocks that can't 
be accessed and that this information is not in the hardware.

In the STM32MP25 we are able to get this information through RCC 
dedicated register. You can look at the `stm32_rcc_get_access()` 
function in drivers/clk/stm32/clk-stm32mp25.c if needed.

Best regards,
Clément

