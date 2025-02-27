Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCABC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOxsqz5lmxXPH64l2epflbTQhqz10HA2W4ktSeXgbXE=; b=06EGb/Ct7IACOs8d7JI54Sg89X
	0hYdcpn5GXR0ro0mAusIv9jMDPw3/uem9IODruPLipJ1pKc4WIvhA/erlGf9fts7ZR9b+EPWvJmHI
	Jpd4La78rTpEw4rfehmbLiZfmn1CcA0kmA1PU90iQhydVoRsXSVkHp1VwKmg+DeWSQQQt4B4AzBXo
	mowJwntONhW6L00tEGK/J910VmoEEErmjSc8xQyEC3xXxab2a+oBWGM9FARq8Qw7M+ujmkeEcgXDD
	3Ii16MfsrTb1X7g3u6KxLw7Qpqk/KJXnbBEpruNYsAw04X/OS+uogmPNif+2AG5Wa3M8BcXOV+kXt
	xlwTmqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZSI-00000006jEA-33U5;
	Thu, 27 Feb 2025 08:41:18 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZQk-00000006iwr-3x2V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:39:44 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51R3i9mS022215;
	Thu, 27 Feb 2025 09:39:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	jOxsqz5lmxXPH64l2epflbTQhqz10HA2W4ktSeXgbXE=; b=473uiRl9Y1yCMnX3
	DofNQhz/bYfvPlQ3IhdHea3NbcOFdIxBmZPRVlvDKdxrqUBU6FKRhvKVKDW0OIJA
	4YAzwEHYTfZ2KXhUK1FtpKyIdXqhIlnCA2lz5seH+5Kk6e7bsZ2NV+ncYeIjph8F
	5bIytUs1ivYqZwML4rOIFTVJ+JFNoLjE09uPLTpDzUK2Y8RQPZVuTFFoNMFHVbq/
	MbX+CaODUh15mZdxLZ8cvtK5ObMiNZXmVNHfqW/8ZFw9Fm1heGoCI2dKpvjkUS12
	ddnuOTYcj69xOhOUMW2eh5gNtHeOFWlYM20e4Nb8QFOMaT9JE46TMw9tfnKlIVqs
	6aei3g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 451psrhd2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 09:39:34 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 66C5840063;
	Thu, 27 Feb 2025 09:38:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7426D37F76F;
	Thu, 27 Feb 2025 09:37:53 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:37:52 +0100
Message-ID: <59e547fd-8301-4757-9343-8919f5625d0e@foss.st.com>
Date: Thu, 27 Feb 2025 09:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: stm32: add push button to stm32f746
 Discovery board
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        <linux-kernel@vger.kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Rob
 Herring <robh@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20250217114332.1098482-1-dario.binacchi@amarulasolutions.com>
 <20250217114332.1098482-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250217114332.1098482-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_04,2025-02-26_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_003943_536201_DC3771E0 
X-CRM114-Status: GOOD (  11.37  )
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



On 2/17/25 12:43, Dario Binacchi wrote:
> Add node for user push button.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm/boot/dts/st/stm32f746-disco.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
> index 8bdd10644bf1..b57dbdce2f40 100644
> --- a/arch/arm/boot/dts/st/stm32f746-disco.dts
> +++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
> @@ -86,6 +86,16 @@ led-usr {
>   		};
>   	};
>   
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +		button-0 {
> +			label = "User";
> +			linux,code = <KEY_HOME>;
> +			gpios = <&gpioi 11 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
>   	usbotg_hs_phy: usb-phy {
>   		#phy-cells = <0>;
>   		compatible = "usb-nop-xceiv";

Series applied on stm32-next.

thanks
Alex

