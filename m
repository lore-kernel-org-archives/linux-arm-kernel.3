Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7528AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4e3+vQC7jXYNsVDluYv45Cizxg84x2l6/EsV/UN5RrA=; b=OTmQLkegGXGB3PUwlkNzPKWmsI
	8RU/NjySZtrbi7KADyinaYq0O9Y1CpR468aeD9IOiDcJy3VRGkPGUYM+nfoKiA1frCnsnyaz6G1nt
	W9ulcsFqrSoRxDzNVu+lK9Joh0VgfwqkDHnOB32W36mYwhPGfQUt9cPdoTJ5mE4NNVDw5pp1hpQkE
	zCCvMnKQWMMX/jqnEgkrwJiZslKAElTx9E2VeLRJcs+Wp1ztaBNvF180CczDbU3otOBAyvRBtQmiC
	fweoyNfXK9snofNuCgnUfHjbUEV/0zXgriesfkz9gRlpsobXYgsdewKi5qtKfMf351//fkRMc6t4y
	qFUdGCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJ52-00000002vVo-472s;
	Fri, 09 May 2025 08:27:40 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDITH-00000002oKp-2FAZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 07:48:41 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5497mYic1338029
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 May 2025 02:48:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746776914;
	bh=4e3+vQC7jXYNsVDluYv45Cizxg84x2l6/EsV/UN5RrA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=LsNxdgh3gojJqGeRhZ57VCZixcngOvhwEVRwU4kGNf66o8780ILuReluAeb4hJpvj
	 3So/V3RiXReOHTZbWod4SReP02ZLxnrQQD7FJcD4wHegNapOQwdwgOvNrg2xEAqvR5
	 bNvGyVou+rMVmz+aFXGt0w92DkRrKBGC/jVLwJcE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5497mYPV112184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 May 2025 02:48:34 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 May 2025 02:48:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 May 2025 02:48:33 -0500
Received: from [172.24.19.187] (lt5cd2489kgj.dhcp.ti.com [172.24.19.187])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5497mTof084167;
	Fri, 9 May 2025 02:48:30 -0500
Message-ID: <fed0d761-2793-4204-aff5-f65ba7dbc4bd@ti.com>
Date: Fri, 9 May 2025 13:18:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: ti: j722s-evm: Add MUX to control
 CSI2RX
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
 <20250508155134.2026300-3-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250508155134.2026300-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_004839_705283_FFA7C6EC 
X-CRM114-Status: GOOD (  14.28  )
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


On 5/8/2025 9:21 PM, Yemike Abhilash Chandra wrote:
> J722S EVM has the CSI2RX routed to a MIPI CSI connector and to 22-pin RPi
> camera connector through an analog mux with GPIO control, model that so
> that an overlay can control the mux state according to connected cameras.

In case you are another version,

consider to change in commit message "model that so that" to "model mux 
so that".

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> index 0f18fe710929..43256c71a19c 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
> @@ -266,6 +266,20 @@ transceiver2: can-phy2 {
>   		max-bitrate = <5000000>;
>   		standby-gpios = <&exp1 17 GPIO_ACTIVE_HIGH>;
>   	};
> +
> +	csi01_mux: mux-controller-0 {
> +		compatible = "gpio-mux";
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&exp1 6 GPIO_ACTIVE_HIGH>;
> +		idle-state = <0>;
> +	};
> +
> +	csi23_mux: mux-controller-1 {
> +		compatible = "gpio-mux";
> +		#mux-state-cells = <1>;
> +		mux-gpios = <&exp1 7 GPIO_ACTIVE_HIGH>;
> +		idle-state = <0>;
> +	};
>   };
>   
>   &main_pmx0 {

