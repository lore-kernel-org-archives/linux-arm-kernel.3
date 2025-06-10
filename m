Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512CFC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JoIjs0rN0Mef0RCPvvnCGsgeRN+4kOPLLI4ZD9o2Mw=; b=TbOGQnRWLAqW8urPdcqs4WIrwg
	IcXOBiIBjEWW2gZKh/Wel0ULa7ngcDPEPNJ9FL/cFHxtsFf6UxG4BRHHyXya1z4k5BrkqsBZukzzA
	APcxx/0v2pfYiXH6CRO+gbCT3BhLa4Gwc+ZrNaVQu2uIjGWt86+Sak/+nzA8uzt28cHXRX8oesBbP
	gt+25TzUVP6n8Y+F2HZrLkG8RPb1e4dab6CnBys3xblO/A08bIujsw65QK15tya+JuaunS+CKXvbh
	1DVHKWnU87hJlUn7Sb939ilgC4poxJccronixItdu7+7NAZ6lS0ST8idp+GVUZ8xmlXcnCFCeGWug
	Q004L4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyWN-00000006r8m-1FmG;
	Tue, 10 Jun 2025 12:56:07 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxqW-00000006jo6-3SFE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:12:54 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AC97NU007654;
	Tue, 10 Jun 2025 14:12:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3JoIjs0rN0Mef0RCPvvnCGsgeRN+4kOPLLI4ZD9o2Mw=; b=IBiW8Pd2ALdNOtHN
	XRPdHmX5cTFMzfSFGNahSDjWx6E60NVZHz7RlKXUmNwfGV20G7xd9V9G3HiR6ujB
	s+AZQL0BORu4XoQQw2qgCAB1ogBecjXstW5BDDTJ1IdEXR5HIP5dzWhaDQwR2xTr
	DN++VSdsEGrCF7mKiFWci9lVp2CO6zMKD0zCB5hhG1erz3Wu/jwuqg/GKdjloTbj
	tBUQ6/vo43atWvHUG7qXWWX2LRMnpUjlBn8AmANT14iUFewIlwezop9IJIL2CRl5
	Q6Pbbq/R0mNtnUVfPtNb2+Az+ReLy0hp7cE7LzTFCBZ5rEOk5XssMErKjm6G6nvk
	K0WZLg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2mt3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:12:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C66614006E;
	Tue, 10 Jun 2025 14:11:39 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AB802B39A25;
	Tue, 10 Jun 2025 14:11:27 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:11:26 +0200
Message-ID: <e4a1bbd0-3886-4a88-bfaf-1e5ce5b27625@foss.st.com>
Date: Tue, 10 Jun 2025 14:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
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
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-5-7e9b3ad2036d@foss.st.com>
 <c0336f46-1fbc-4766-9e0a-a3812d48083e@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <c0336f46-1fbc-4766-9e0a-a3812d48083e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_051253_149933_9ED85CDF 
X-CRM114-Status: GOOD (  11.61  )
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

On 5/29/25 11:13, Krzysztof Kozlowski wrote:
> On 28/05/2025 15:30, Clément Le Goffic wrote:
>> Add the hdp devicetree node for stm32mp13 SoC family
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> ---
>>   arch/arm/boot/dts/st/stm32mp131.dtsi | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> index 8512a6e46b33..9e3797ee1f7b 100644
>> --- a/arch/arm/boot/dts/st/stm32mp131.dtsi
>> +++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
>> @@ -954,6 +954,13 @@ dts: thermal@50028000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		hdp: pinctrl@5002a000 {
>> +			compatible = "st,stm32mp131-hdp";
>> +			reg = <0x5002a000 0x400>;
>> +			clocks = <&rcc HDP>;
>> +			status = "disabled";
> Don't send new versions while discussion is going.
> 
> My comments are still valid here.
> 
> Best regards,
> Krzysztof

Ok keep discussing in the V3 so.

Clément

