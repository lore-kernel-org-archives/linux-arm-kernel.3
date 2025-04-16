Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B01C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 18:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8LL977dbkymvSQK4ivUClHaDB3bJ8D34+HYE6+9SqpM=; b=zeQHMDI5MNB12E8SMhYJQy4x0U
	/7Q11mpmmfRz88TKFFwk63IzF4QR7V7yFNiXep8gA6lL/7+2LO38biFM0dwNx/C4BS9YCGLhYExKF
	AnM46lV8eoJabjHr4swiqYEtRSxpJpBmbhES08089bL23moDyGyRGkvwfJxW+54sLWZs+j8IEtYNt
	wZKSml/3a0EKtUUP8ZQHkadd7Je97SuDQ/GzYZ69VE9mWiX/BEwUesRhyX1JYzcoK/LsRPdi4ZrE2
	GdCZnd2VUJuU0kiit+WpHZX4IJrNtQwpZtMS5Iucwxhow0jApj1SvyezIggFMURrmr11nmgsZnne8
	b3zIv7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57gc-0000000AaYK-1C2l;
	Wed, 16 Apr 2025 18:40:38 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u57ZC-0000000AZZA-2vOL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 18:33:00 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53GIWl3M424996
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 13:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744828367;
	bh=8LL977dbkymvSQK4ivUClHaDB3bJ8D34+HYE6+9SqpM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=lkHT60FWwEMF9Kfnk03FqA8UaYB3TT3DzazCRdTXJWlV1AxR8VI1YlN0GqydumRgH
	 bSHNEMU7xw+wJrmyitE2XBQNd0TAYloI/I8JpI0OXOlRPfHRY+vL62TuOzOquK3scR
	 L9t5ES8u5naQZM7H47b0zuZJOmTRtHkzVAtu3g0w=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53GIWlwN009498
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Apr 2025 13:32:47 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 16
 Apr 2025 13:32:47 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 16 Apr 2025 13:32:47 -0500
Received: from [10.24.72.182] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53GIWhiW095159;
	Wed, 16 Apr 2025 13:32:43 -0500
Message-ID: <eb6c1dfc-11aa-421a-9b46-2fcaecb04435@ti.com>
Date: Thu, 17 Apr 2025 00:02:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
To: Nishanth Menon <nm@ti.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>,
        <linux-kernel@vger.kernel.org>, <bjorn.andersson@oss.qualcomm.com>,
        <krzysztof.kozlowski@linaro.org>, <geert+renesas@glider.be>,
        <lumag@kernel.org>, <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>
References: <20250411095043.272488-1-j-choudhary@ti.com>
 <20250411112802.x2q4f7cq4hwilxoe@blasphemy>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20250411112802.x2q4f7cq4hwilxoe@blasphemy>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_113258_846827_D290758A 
X-CRM114-Status: GOOD (  11.84  )
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

Hello Nishanth,

On 11/04/25 16:58, Nishanth Menon wrote:
> On 15:20-20250411, Jayesh Choudhary wrote:
>> Enable configs for cdns-dsi and cdns-dphy. (dsi wrapper for
>> j721e is enabled by default if cdns-dsi config is enabled)
> 
> What upstream supported boards need this change? Add that to the commit
> message. Beagley-AI64? or others - please enumerate.
> 

Posted v2 with the list of platforms that require these drivers:
https://lore.kernel.org/all/20250416182930.32132-1-j-choudhary@ti.com/


>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> ---
>>   arch/arm64/configs/defconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 5c85e5da152f..4c0eb2711bbe 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -938,6 +938,7 @@ CONFIG_DRM_TI_SN65DSI86=m
>>   CONFIG_DRM_ANALOGIX_ANX7625=m
>>   CONFIG_DRM_I2C_ADV7511=m
>>   CONFIG_DRM_I2C_ADV7511_AUDIO=y
>> +CONFIG_DRM_CDNS_DSI=m
>>   CONFIG_DRM_CDNS_MHDP8546=m
>>   CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
>>   CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
>> @@ -1579,6 +1580,7 @@ CONFIG_PHY_CAN_TRANSCEIVER=m
>>   CONFIG_PHY_NXP_PTN3222=m
>>   CONFIG_PHY_SUN4I_USB=y
>>   CONFIG_PHY_CADENCE_TORRENT=m
>> +CONFIG_PHY_CADENCE_DPHY=m
>>   CONFIG_PHY_CADENCE_DPHY_RX=m
>>   CONFIG_PHY_CADENCE_SIERRA=m
>>   CONFIG_PHY_CADENCE_SALVO=m
>> -- 
>> 2.34.1
>>
> 

Warm Regards,
Jayesh

