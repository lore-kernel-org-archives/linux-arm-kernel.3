Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A03E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFUAKGbkjzpol5FudiEAelKXEGfl5qCcVmUlRgdMuW0=; b=RsW6m5Tr+C5nRWvYyU6bMaidS3
	VB2mvYddmMsiSj66SW2n1Hj7FVOTYZ6aGfSz1qlW5B0x9BHb5mVx9mNk0iCAaG4gD3IV3MpSjFRHm
	0xHVJRzziYgG9D0ZELvtTGb6cGOwY4ZgouVjsBYrP0tP+/XQSnl4dpw9BeamzeZmqw7AreihDY6uC
	fgj5OzAT0cVJaWQcfjFIg8qbechubr3DVsLZZBaMlMeUW7/v5LqLao3Y4WJpgOXJxN8G5cND6XQqA
	3u9IGvvP9Sdqx9vpeSpyzALcNAzxGLCdNyZND74XxQPUvjbqskrQ0E+EJAZb1fDQNWqdEffgbCV3K
	TS351hfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkxe-00000000zHK-3IjT;
	Mon, 06 Jan 2025 11:07:54 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUkuu-00000000yaB-315L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 11:05:06 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506B06Oa004709;
	Mon, 6 Jan 2025 12:04:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	AFUAKGbkjzpol5FudiEAelKXEGfl5qCcVmUlRgdMuW0=; b=YgNUVIazqpMyFm+L
	+nO+YwEc/nZoNFH1JPK48GIix9bL2emzDXVmFdTvb6tSIMpYmWFubHhgB4aPmnla
	yHuXiaqZkJ5bOqyvzGe7eo0GNNDvbrh8M46g1wutH0LgaI2ulgJX4gnGajY5yByQ
	omFMegDlWc9mNwMd+zUxeJef+lQbTCg5d9kSCPbD6BoTpCYzgmLm+V8WvjSB1qSb
	8Gj5R/vrMkQZO6j4ICK996qCwDlJ7Js2cMrNnIXS6dp6BI4ARhmsfnYOmuqQtEXu
	ODLjBcu81pO9uhiWCzxb2jArXICljLFvnM+VpUa614SHEFrZpg2T4e671EpguHrC
	A5tN8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4407n9hd53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 12:04:54 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2C8FB40056;
	Mon,  6 Jan 2025 12:03:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C95725D411;
	Mon,  6 Jan 2025 12:01:36 +0100 (CET)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 12:01:35 +0100
Message-ID: <a03d16e5-18e5-4627-8209-9559cdc8bc36@foss.st.com>
Date: Mon, 6 Jan 2025 12:01:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ARM: dts: st: enable the MALI gpu on the
 stih410-b2260
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
 <20241006-sti-gpu-v2-3-c6bb408d6903@me.com>
 <9c6a316b-10bd-4ed0-b925-babf84b125e5@foss.st.com>
Content-Language: en-US
In-Reply-To: <9c6a316b-10bd-4ed0-b925-babf84b125e5@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_030505_067994_C07C68E7 
X-CRM114-Status: GOOD (  13.46  )
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
>> Enable the GPU on the stih410-b2260 board.
>>
>> Signed-off-by: Alain Volmat <avolmat@me.com>
>> ---
>>  arch/arm/boot/dts/st/stih410-b2260.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/st/stih410-b2260.dts b/arch/arm/boot/dts/st/stih410-b2260.dts
>> index 240b62040000b8c0357d39504d3475186958bf31..736b1e059b0a8f122d1b824e1f4e5db0a668ec2c 100644
>> --- a/arch/arm/boot/dts/st/stih410-b2260.dts
>> +++ b/arch/arm/boot/dts/st/stih410-b2260.dts
>> @@ -206,5 +206,9 @@ hdmiddc: i2c@9541000 {
>>  		sata1: sata@9b28000 {
>>  			status = "okay";
>>  		};
>> +
>> +		gpu: gpu@9f00000 {
>> +			status = "okay";
>> +		};
>>  	};
>>  };
>>
> 
> Hi Alain
> 
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Thanks
Applied on sti-next

