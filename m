Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DB4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9CGQSY2Py+TZMZxIwRcfvLPf3wajH5A3vCs0pp3i9Q=; b=t2+uxYoMQNV2y+aFIfeBtGRjMS
	+dTik8CtdGkkMGXGs78uoN+KDuGDoaBiqeSKPar67ptQPw7G8JT7JXEY+u6+7kKHQU6+cAMTVKUnj
	0qIVQq0LmbvHPQNs0LB/zeTlN9mfLd2poOVTRkVQkbtrKAbTgZa3JFvcQYEbOmEcZzUwkEzYTlTex
	a+XsNGwEf/7HLQO/rip4T4UF2UKdsfFClEo5xL6+SNgd1Hj8cATIQ4CiRCQFGg8e4wi9VM5tYDynd
	yNHmk4eH45gY+NwGfWM461kPsWJ+i0Z0zljLfEVzdjcaN9hmfEk5FNCDM7kWlP80B44/m9Bwq2w9I
	X4kUCsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUgs-00000004M73-2IzN;
	Wed, 23 Jul 2025 08:19:06 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueULt-00000004J1I-3TvA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 07:57:27 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N7qgYZ031584;
	Wed, 23 Jul 2025 09:57:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	B9CGQSY2Py+TZMZxIwRcfvLPf3wajH5A3vCs0pp3i9Q=; b=di8j4sub3XTf9LsH
	X3dV4EP7HD0tF4hOkMzn7by90Vv+bnZ5O/eS2q7mX0dzb+5Z+3EI9uKK417Nvut0
	HAut6dDHExdJRkhXw/hVUHj1nPUY0vSgbcIX/Tv8aB6IIy4jsAturVe4pFr8jJam
	QJR6cRH7YRTfk0rZDL74wL1QYCCYPfMZ7LbftKm9bS/BVIg3YtAUjv1mewRUQoox
	M5Ls81AP09y/0lwCpD6kIrOJbbUtCBcwHTFRTuhywhxRNyQBzyMueaqDtwxh48g+
	oVJvJg2Dq5WRioKvQaUVZ/x/ybQmwrQxFlfx5sazxaBcOUpMAEl1izE6Fwm55F5O
	OLZfXA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8tc0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 09:57:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3848D40048;
	Wed, 23 Jul 2025 09:55:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5064A6BAAD0;
	Wed, 23 Jul 2025 09:54:33 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 09:54:32 +0200
Message-ID: <d9432ec2-7075-4fef-ab39-aa93f4e91eb9@foss.st.com>
Date: Wed, 23 Jul 2025 09:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
To: Julius Werner <jwerner@chromium.org>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
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
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
 <CAODwPW-kVcnVtVakXs7aBcwb_nv0bLTaK5PKNo4zmJaJ=VC8Wg@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CAODwPW-kVcnVtVakXs7aBcwb_nv0bLTaK5PKNo4zmJaJ=VC8Wg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_005726_127505_94233C09 
X-CRM114-Status: GOOD (  16.68  )
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

On 7/22/25 23:58, Julius Werner wrote:
>> +  purpose of this node is to overall memory topology of the system, including the
> 
> nit: Might take the opportunity to fix the typo here (missing words:
> "is to describe the overall memory topology").

Yes true.

> 
>>     - Julius Werner <jwerner@chromium.org>
> 
> Why remove me? (Although I'm also not really sure why I'm maintainer
> for this file and Krzysztof for all the others, tbh.)

I didn't remove you. It is just the minus of the maintainer list :-)

> 
>>   examples:
>>     - |
> 
> I think that's a load-bearing pipe character you're removing here?

Didn't remove either. There are spaces before so it it is not the git 
minus char.

> 
>> -    lpddr-channel0 {
>> +    memory-channel0 {
> 
> Just to double-check, the name of this node doesn't really mean
> anything and isn't directly interpreted by the kernel, right? I'm fine
> with changing the example here to fit better with the new expanded
> scope of the schema, but we have existing firmware that generates
> nodes with the `lpddr-channel0` name, I want to make sure that it
> won't break from making changes here.

Oh ok didn't know about that and didn't find it though.
For now no pattern has been defined for the node name so it shouldn't 
break anything.

Best regards,
Clément

