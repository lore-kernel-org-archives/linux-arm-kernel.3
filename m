Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395BEE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 11:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pg6uxHYIw7iP17Xn7aoTOWbawHColWpEDsTrqi1imL8=; b=p6OlIjG/MWqtV0Rct/4JxCeVvz
	KH8FLHX3Qck0/D9/5PdV8DKhIV92whuvtb1pekJbqOnWLCQo8RiJuApl6YqcWt6ledVkR2ZHwqOV5
	Mtpj3B9/7Xy49g9Leglm6S0J/5RUW50vxkcx3yjTNx/WSBLJeMR4hsJTX/37ceWCHV4ZpxWtQ1uqU
	OqgOMKXDErmqTkB3tn+QJDBHGDG0mq0c38CfBWcULmwVJuge+6ixfBCOP8Xlif2CXx8NPuPqKPFL5
	N59YMysZQbr0w/3G7j/T9gwQkwN7IRj/+gbHBVjm3c7ldAcLFewRy0WJXz37GkJFCcOS7D0IUkzvD
	lpXoK1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkyn-00000000zRK-1sHA;
	Mon, 06 Jan 2025 11:09:05 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkuu-00000000yaC-30x5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 11:05:06 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5069EF9s023840;
	Mon, 6 Jan 2025 12:04:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Pg6uxHYIw7iP17Xn7aoTOWbawHColWpEDsTrqi1imL8=; b=Va3CmMjJhFR66trf
	7syGqQszCnFH7Ip8cmioxXECxcP60fG+hkyizKrwuT+RMIxLSjlJ+bmFT7oGrFHl
	WMy0VY0d7rHScxFUBGgoJhEJM3qGbqnQjExkWEmG5J2BA21hx5NxiXLWLDaGC1q1
	wvtqW8A1N4ObarCK84ZrBXIibe6n/h/TWVK/LStJKa1coCM81LxDBpCpRmMPvuQK
	bN57cP0I1wXNKMFlqAYkir6bwE3CAaRhA1dIQoNAO05PQZS7deCWbMEHvJwTQTC4
	+u0M26DDVHtE5rwxC5kfVBODQGLMlkNnde/cPq1M213QOZA/i9b0h43BtE7H4hIy
	OTOsUw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 440cc78epq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 12:04:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D30CA40053;
	Mon,  6 Jan 2025 12:03:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACF0425C924;
	Mon,  6 Jan 2025 12:01:18 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 12:01:17 +0100
Message-ID: <492563b4-0833-4afe-b40c-3c015b59af6b@foss.st.com>
Date: Mon, 6 Jan 2025 12:01:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: st: add node for the MALI gpu on
 stih410.dtsi
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Alain Volmat <avolmat@me.com>, David Airlie <airlied@gmail.com>,
        Daniel
 Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241006-sti-gpu-v2-0-c6bb408d6903@me.com>
 <20241006-sti-gpu-v2-2-c6bb408d6903@me.com>
 <13598662-b9ee-4dc6-93be-a54842c90c18@foss.st.com>
Content-Language: en-US
In-Reply-To: <13598662-b9ee-4dc6-93be-a54842c90c18@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_030505_069823_E8436D2E 
X-CRM114-Status: GOOD (  14.40  )
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



On 1/6/25 11:39, Patrice CHOTARD wrote:
> 
> 
> On 10/6/24 22:42, Alain Volmat wrote:
>> Add the entry for the GPU (Mali400) on the stih410.dtsi
>>
>> Signed-off-by: Alain Volmat <avolmat@me.com>
>> ---
>>  arch/arm/boot/dts/st/stih410.dtsi | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stih410.dtsi b/arch/arm/boot/dts/st/stih410.dtsi
>> index a69231854f783b1b9fd685ba2822eb406e0ffdf5..d56343f44fda4e9e1de2e5efc86e2d984bad14b4 100644
>> --- a/arch/arm/boot/dts/st/stih410.dtsi
>> +++ b/arch/arm/boot/dts/st/stih410.dtsi
>> @@ -285,5 +285,39 @@ cec@94a087c {
>>  			resets = <&softreset STIH407_LPM_SOFTRESET>;
>>  			hdmi-phandle = <&sti_hdmi>;
>>  		};
>> +
>> +		gpu: gpu@9f00000 {
>> +			compatible = "st,stih410-mali", "arm,mali-400";
>> +			reg = <0x9f00000 0x10000>;
>> +			/* LIMA driver needs 2 clocks, use the same for both */
>> +			clocks = <&clk_s_c0_flexgen CLK_ICN_GPU>,
>> +				 <&clk_s_c0_flexgen CLK_ICN_GPU>;
>> +			clock-names = "bus", "core";
>> +			assigned-clocks = <&clk_s_c0_flexgen CLK_ICN_GPU>;
>> +			assigned-clock-rates = <400000000>;
>> +			resets = <&softreset STIH407_GPU_SOFTRESET>;
>> +			interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "gp",
>> +					  "gpmmu",
>> +					  "pp0",
>> +					  "ppmmu0",
>> +					  "pp1",
>> +					  "ppmmu1",
>> +					  "pp2",
>> +					  "ppmmu2",
>> +					  "pp3",
>> +					  "ppmmu3";
>> +
>> +			status = "disabled";
>> +		};
>>  	};
>>  };
>>
> Hi Alain
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
> PAtrice

Applied on sti-next

