Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA1AC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1ZuzEzRREiwLydWZlhzK+dlWBAxlIhEYuf20M8l1eU=; b=wEaqWGs2JQS/a+wna5kNqC7qWG
	ekAYk9LGK3GslP8fohm4LzN8yWmp8m7vzdLCtovu2AkFzumGeZhW/958ChjmMEIqGmUpZQXVt77AY
	gPeMGXbYL5OxrsyF7J97hG/KYmN5FZNKWGMcmIZD5Npm80q2MmZDG5gslenblet/jBxku3pheCfa3
	Bup7IR+MMUFpVXA9e++oHuINS2rEwXLTSvIaOZ7d0c/uZ0w6htETh9hTwEhUJoDrVH9Gq7UYpy9B1
	P3RQFDp647COy2aoRv+g4TZ3uzkM1OK7SO46gQWBsvQTddk5oOgSQxOsL4nORbTzP2eofrIY65ccX
	OyWofHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvhl-00000000Rf0-0mcm;
	Mon, 21 Jul 2025 18:57:41 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsjn-000000006sA-3WIF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 15:47:37 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LDt62k020590;
	Mon, 21 Jul 2025 17:47:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	P1ZuzEzRREiwLydWZlhzK+dlWBAxlIhEYuf20M8l1eU=; b=3xbpjXFnyMs0SC5A
	i2NSTVksJj+qckbzFNDpYbQCrsNAuBlK574aC/pSgp9d95ovb31I7jR/KuivJ7Z7
	vrlAF+Tjwygg8on9g8Nk5p0sTilTUvoy9mumnLwxZBwjmm5NG/irpmq9NNUmkiFu
	0wrn5CM/J1V4wrupgXWM38kPE8qB0Av7ZcgyJMY415Yd2dEUQK7cZuJkMRI5BKp/
	DW2K9XPdF4dI97k5wGLSQiynVfnweB2tJ1SZhLZSWwfrcbbY7ZWOHj3Oq1ycURsO
	5wh+4Djrh+l9cQH6KWUDkkJClULDqjLBmk0Ufn2f8W5yGH6gc1qtD7k05Ef/cmMt
	a3Wd6g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4800g8hn2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:47:23 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 822DF4007D;
	Mon, 21 Jul 2025 17:46:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36E51768F09;
	Mon, 21 Jul 2025 17:44:23 +0200 (CEST)
Received: from [10.252.5.249] (10.252.5.249) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 17:44:21 +0200
Message-ID: <162aa05f-69df-4607-bf47-fbec60589f95@foss.st.com>
Date: Mon, 21 Jul 2025 17:44:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/16] arm64: dts: st: add LPDDR channel to
 stm32mp257f-dk board
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
 <20250711-ddrperfm-upstream-v2-6-cdece720348f@foss.st.com>
 <20250715032020.GB4144523-robh@kernel.org>
 <ae960a16-65ad-4b22-b9fb-89efbffacd3e@foss.st.com>
 <20250715150224.GA1319886-robh@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250715150224.GA1319886-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.5.249]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_04,2025-07-21_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_084736_363799_1FB6BBF7 
X-CRM114-Status: GOOD (  16.90  )
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

Hi Rob

On 7/15/25 17:02, Rob Herring wrote:
> On Tue, Jul 15, 2025 at 10:32:09AM +0200, Clement LE GOFFIC wrote:
>> Hi Rob,
>>
>> Thanks for the review !
>>
>> On 7/15/25 05:20, Rob Herring wrote:
>>> On Fri, Jul 11, 2025 at 04:48:58PM +0200, Clément Le Goffic wrote:
>>>> Add 32bits LPDDR4 channel to the stm32mp257f-dk board.
>>>>
>>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>>> ---
>>>>    arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 7 +++++++
>>>>    1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
>>>> index a278a1e3ce03..a97b41f14ecc 100644
>>>> --- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
>>>> +++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
>>>> @@ -54,6 +54,13 @@ led-blue {
>>>>    		};
>>>>    	};
>>>> +	lpddr_channel: lpddr4-channel {
>>>> +		#address-cells = <1>;
>>>> +		#size-cells = <0>;
>>>> +		compatible = "jedec,lpddr4-channel";
>>>
>>> Not tested because this doesn't match the binding.
>>
>> Hmm, I've tested with make dtbs_check and dt_binding_check and it didn't
>> complain on my side.
>> What I have miss ?
> 
> Oh wait, we already have a binding for that. I was confused with your
> adding "jedec,ddr4-channel". Sorry for the noise.

It's fine no worries.
However, in the patch 8, I add the property "memory-channel" that is not 
in the dtschema repo and I didn't get any reviews on it.
Is it ok for you ? or maybe should we discuss it over there ?
I can try to do a PR on the dtschema thought, if it is ok.

Best regards,
Clément

