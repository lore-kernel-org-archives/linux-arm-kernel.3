Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3833AC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBjN96Vc9/YNSk2Vr1T4bmQLG/82VFC8eOZQTen3I6w=; b=ADI532rQIgDfGfB80F7GZklBcL
	zOerizsirki8pzFn0UKihfYAB0ONhHO8wSJ2OoFQUj5FMSsM63ZCvt+HEqn6cTHw9sxiDoqUGyLUI
	F4JjhMejxRRiTOLYhyzya/xj7Zes54gbFiGjSFG+DDg39dTXjUBdpT1uoPBCbPOKEZAnrOpaD5fKi
	4aY0UF+qGRsfHIzxmrBAChe7xfXmN0CLrVbmwzjV01OrLp8KQsO21wEGOR7gEhecpMSbKJYyb61rx
	XX5dxixut4wXEm2cXBKhXVE19VXdkcQli0+VEG3bxe6GZ1U1DuS1GGB/TMFRAbgdmMWce6B/dQSK3
	sMNQtKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubbuH-00000004fTF-2lFT;
	Tue, 15 Jul 2025 09:25:01 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubb7v-00000004XR1-387H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 08:35:05 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F7msBA003670;
	Tue, 15 Jul 2025 10:34:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	FBjN96Vc9/YNSk2Vr1T4bmQLG/82VFC8eOZQTen3I6w=; b=6Kz8zsOss7e1leYL
	0yWjGq2eCmjxyopEMUGq5nLk/lVCP/5UuwaEGdk9eHB1lVOA14Y5v8e7v2604bDj
	9dOg4+XxUcy4mGdA849Vq7OwKKFV7ZLQHQTB+p/eKdHt2M+5IPYOA4d4i+X1PUGZ
	XEy/fzBIOvT/BlICLrxEkHQXkHWIGMcf1b4i2aDBkhx0i7rknVKNeiGM0syvgazC
	Im6F3srR/14ZUbNY+qlLPq/qN4Lln86FmW4SZslYjcNMM8HxZdKK9MTvAQEsn88e
	prIiVBPYZ9tXi8+eZrm+cwnqSWVVmpKf//bprensYcG5yp7g/iwgnuWZAeO20PrH
	uNtETQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47ud4mmg2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Jul 2025 10:34:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A93E84002D;
	Tue, 15 Jul 2025 10:33:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C23DEB63555;
	Tue, 15 Jul 2025 10:32:10 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 10:32:09 +0200
Message-ID: <ae960a16-65ad-4b22-b9fb-89efbffacd3e@foss.st.com>
Date: Tue, 15 Jul 2025 10:32:09 +0200
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
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250715032020.GB4144523-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_013504_108694_C7EA7B67 
X-CRM114-Status: GOOD (  17.31  )
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

Thanks for the review !

On 7/15/25 05:20, Rob Herring wrote:
> On Fri, Jul 11, 2025 at 04:48:58PM +0200, Clément Le Goffic wrote:
>> Add 32bits LPDDR4 channel to the stm32mp257f-dk board.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
>> index a278a1e3ce03..a97b41f14ecc 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
>> +++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
>> @@ -54,6 +54,13 @@ led-blue {
>>   		};
>>   	};
>>   
>> +	lpddr_channel: lpddr4-channel {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		compatible = "jedec,lpddr4-channel";
> 
> Not tested because this doesn't match the binding.

Hmm, I've tested with make dtbs_check and dt_binding_check and it didn't 
complain on my side.
What I have miss ?


> 
>> +		io-width = <32>;
>> +	};
> 
> What would multiple channels look like? I think this needs some work.
> Like it should perhaps be within the memory node. It's a lot to just say
> 32-bit LPDDR4 x1.

I guess something like two channels node following each other in the DT.
It can be in the memory node I don't know what are the stakes here.
I was inspired by the lpddr node here:
arch/arm/boot/dts/samsung/exynos5422-odroid-core.dtsi:336

Best regard,
Clément

