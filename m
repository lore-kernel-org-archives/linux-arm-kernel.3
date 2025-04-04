Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78304C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 12:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lf1R2wPEeyp7BvissUb4r5z/yKuNxD0GifSjKPShPOI=; b=z5HdWqIdMSlmL+xm/fHin1cCmF
	qUK5pp7Pm0rhIMqNyf8DQBOb1wQMqpqPPaG3XNJuiZB+sXBdrPMqr5OnRkwzTjGXgFZubR1vJV2zG
	VlVaGI1i27uwxcTwEbp07PsQMxJV+TfXiEcTBdThaAVzCOs7yI3vt2BqgmJszxmA8ka7A/8BzCUkd
	647+84ZYTmyWqNYwgmlhAH55YtRg7g6lJFHU3Viom96fv59w1PJLEw0saXJjzvljZWwNLllvq4NNR
	BBaaaHIXXJrd7JuRwwNCT+jYbU4WZJbay1e7aesvfB56ba0hLtrskXbZXfJy5BPTZNFxV+ajNjTiu
	NbV5jwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gCa-0000000BgJg-3s0C;
	Fri, 04 Apr 2025 12:31:16 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gAo-0000000Bg4w-44cW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 12:29:28 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534C4rlK019849;
	Fri, 4 Apr 2025 14:29:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Lf1R2wPEeyp7BvissUb4r5z/yKuNxD0GifSjKPShPOI=; b=OxYRj0LJdcDYnhCf
	LJnjgquJDsFxwwN3stfNTh14sb4P7Bh38hOWYcgI/BFzH0hjlygSB9NJlCVVxstn
	P7s5uGeDVU3HpFyFouY+coiwePFg8qi4TwpjJ1l7SexelwghQSeP7JMK/qGN/ej7
	v07csiTrNGllJfVNMv55Sw8kl0V+g9ZfsjQheCTs2TQR0NTd819hZL5GrwL8aXV2
	Jptt5RanEzR/F5ycRksZsfYOd6mF7fo/bKC1rP4ciMx1TuJzY5lgGkK5aw6LwCHx
	GjqSBjezxCgScLecSGTMfeyX1jGlBuDbaQ6Gc6761OX/3HECEfz9rXFTf78dGyJb
	3GR2xQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45t2cqk4s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 14:29:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A2B994005F;
	Fri,  4 Apr 2025 14:28:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E97BE9234AC;
	Fri,  4 Apr 2025 14:27:32 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Apr
 2025 14:27:32 +0200
Message-ID: <1c9a49cb-35a1-4bcc-abd5-b14a49d4d094@foss.st.com>
Date: Fri, 4 Apr 2025 14:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: st: add st,stm32mp2-cortex-a7-gic in intc
 node in stm32mp251.dtsi
To: Marc Zyngier <maz@kernel.org>
CC: <tglx@linutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
        <alexandre.torgue@foss.st.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
 <20250403122805.1574086-4-christian.bruel@foss.st.com>
 <874iz5yx2c.wl-maz@kernel.org>
From: Christian Bruel <christian.bruel@foss.st.com>
Content-Language: en-US
In-Reply-To: <874iz5yx2c.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_052927_596175_4905D522 
X-CRM114-Status: GOOD (  12.20  )
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



On 4/3/25 19:27, Marc Zyngier wrote:
> On Thu, 03 Apr 2025 13:28:05 +0100,
> Christian Bruel <christian.bruel@foss.st.com> wrote:
>>
>> Add st,stm32mp2-cortex-a7-gic to enable the GICC_DIR register remap
>>
>> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> index f3c6cdfd7008..030e5da67a7e 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> @@ -115,7 +115,7 @@ scmi_vdda18adc: regulator@7 {
>>   	};
>>   
>>   	intc: interrupt-controller@4ac00000 {
>> -		compatible = "arm,cortex-a7-gic";
>> +		compatible = "st,stm32mp2-cortex-a7-gic", "arm,cortex-a7-gic";
> 
> What nonsense is this? This is an *arm64* machine, with I expect a
> GIC400. Where is this A7 compat coming from?

Probably historical, as the first port was for aarch32. I will fix this 
separately. thanks for the head up!

Christian

> 
> 	M.
> 

