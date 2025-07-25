Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFF2C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 12:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvHvjwd6XOG8gaFWJcVrEpn5/3TbrGK3z3uZ5mkkCQ4=; b=Wdy03dT0xsmfxeHpNsYmUH1Bcn
	fVNOfrrB6HGZ96BncBSQ6D/s6MFnqSIY4b1T7Pu5/3nuTtV6mmRCf2jcizNPUaC3cjPzldBjAJtS6
	Q6ByH1AkouTjkFIVK2D6W8i8y67Iuq32pHx3zjqP/5uccSVG3CH18ngQmijfeIPmpBYbLdb3jFhC9
	UILPToHOl30JyzHXPfwkctfBnzyMR+41Yjt4D87YIGX4RfVH+K18UhCbxleYgZnPv2hA7xggUT+U/
	f9Q7Jd20caxeM5eNYvNsz3l8xfxod2igU28Hpa8NS2oB13mujZWOjFV3NtTf6Q08WYJVB0LgtCPUW
	KiTYcqzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufH6L-00000009ln4-20Hk;
	Fri, 25 Jul 2025 12:00:37 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGPL-00000009gzI-3aNl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 11:16:13 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PAXQj6003648;
	Fri, 25 Jul 2025 13:15:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	bvHvjwd6XOG8gaFWJcVrEpn5/3TbrGK3z3uZ5mkkCQ4=; b=KwR+EWxBDubt5KZK
	KwTbP7hwmwQB918hKeREw1OoQlG78H3x+rh43s42Cjq4rbrZC2aVqeQ3H6cm2UAE
	opBjmNl9Lz/uXptDv6+oPJy5zUhCAoQzU3hMzAvDRyi8BwfSV7K7tPsZAbPaSWaC
	jc23JYGcJppcXjF4an+x9dqZ5eqShkjxIbB4sof2tZiqIgaNjv7PfkOz1afK8d5W
	iRCoF6bzj6SWpGnHhnXe/zpXEmaFMlbf3aOumMNiUjT8XCntqQXgHkuaonTeqOhS
	Rlq0blQ71ejJWutjyN9F5RvgR+qPbxDdXS0kJqCFBXqRgOGIiCNt9+ITfOSLKCOB
	Y/8O1g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3m2trd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 13:15:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DB8284004B;
	Fri, 25 Jul 2025 13:14:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1D0D137A632;
	Fri, 25 Jul 2025 13:13:24 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 13:13:23 +0200
Message-ID: <a00bb4e2-b0e8-44ef-bf14-5e4f5e60f9d0@foss.st.com>
Date: Fri, 25 Jul 2025 13:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH 09/12] arm64: dts: st: add lvds support on
 stm32mp255
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Yannick Fertre
	<yannick.fertre@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
 <20250725-drm-misc-next-v1-9-a59848e62cf9@foss.st.com>
 <85673db7-d311-47cc-be52-291d94e136e4@foss.st.com>
Content-Language: en-US
In-Reply-To: <85673db7-d311-47cc-be52-291d94e136e4@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_041612_185037_014FBBDF 
X-CRM114-Status: GOOD (  18.87  )
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

On 7/25/25 13:08, Clement LE GOFFIC wrote:
> Hi Raphael,
> 
> On 7/25/25 12:04, Raphael Gallais-Pou wrote:
>> The LVDS is used on STM32MP2 as a display interface.
>>
>> Add the LVDS node.
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp255.dtsi | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/ 
>> dts/st/stm32mp255.dtsi
>> index 
>> f689b47c5010033120146cf1954d6624c0270045..a4d965f785fa42c4597494010855aec7e1b9fdd1 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
>> @@ -6,6 +6,18 @@
>>   #include "stm32mp253.dtsi"
>>   &rifsc {
>> +    lvds: lvds@48060000 {
>> +        compatible = "st,stm32mp25-lvds";
> 
> For the compatible you now need one comaptible per SoC.
> It means your compatible should look like : "st,stm32mp251-lvds".
> This way, if on the 253 or 255 there is an issue you are able to easily 
> add match data in the driver with compatible "st,stm32mp253-lvds" or 
> "st,stm32mp255-lvds".
> A prior discussion on this subject has been raised on my V1 of HDP 
> involving Krzysztof and Alexandre :
> https://lore.kernel.org/all/418a80a9-8c08-4dd1- 
> bf49-1bd7378321aa@kernel.org/
Woops, this comment should target the add of the ltdc compatible as I 
see that lvds one already exists and can't be changed.
Though the main idea is here.

> 
>> +        #clock-cells = <0>;
>> +        reg = <0x48060000 0x2000>;
>> +        clocks = <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
>> +        clock-names = "pclk", "ref";
>> +        resets = <&rcc LVDS_R>;
>> +        access-controllers = <&rifsc 84>;
>> +        power-domains = <&CLUSTER_PD>;
>> +        status = "disabled";
>> +    };
>> +
>>       vdec: vdec@480d0000 {
>>           compatible = "st,stm32mp25-vdec";
>>           reg = <0x480d0000 0x3c8>;
>>
> 
> Best regards,
> Clément


