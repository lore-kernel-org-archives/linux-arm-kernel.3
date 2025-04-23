Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C45DC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih2ce5Z0GGSSdmgbjeP4Hq/VrwWqi3AxBYu8iHAwmac=; b=XVzPoGhJCl4ySyPLv1MkTnRz67
	WVkW5p0j15sKQdqSsODXBGkXVgvyxmmFGxlfhsZlR7Vtb7steyrG/ce3V6iUh1C97ENlI2tDXkjpR
	1cgh5PTOX6BxJPN5tu6vlTtTGNINy0cNJhye+I66pM2x2IvkYnJkx5c2vso/cf8x4qslvraJGWiWy
	3a5MxwXoVtO6+u369r4k6Kuqh7N1XpMpLowPc4OCGCDFkDLkp+BlVUDdj5Emb0NibfSoOaxBl7riW
	I5n+iOxnWAK8fT61ojwtMO1eO1SOkqXN8ZfM5hjM/Y1/zuI0IiSewgb63+uf+BsTqT+Upwcvyk3Dh
	yowoYA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e7k-0000000BM5c-1Ofh;
	Wed, 23 Apr 2025 17:43:04 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bwU-0000000AxEj-3SrH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:23:20 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53NFN5Fn2338674
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 10:23:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745421785;
	bh=Ih2ce5Z0GGSSdmgbjeP4Hq/VrwWqi3AxBYu8iHAwmac=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Xuw0024RJ6ZKugtUegTeW9kcQK0QAykUipGgY/++v3U9pXpM2NQ1xLHtOVYZWfvFE
	 bom6wAfrhl4O50IigZst5cn/RXpuhL0W3s1Dy5uHck5WCYAiIlly/fs/xzQDdYIEiT
	 tG5kdgtTRrgFrZ9XFLHVUZijSzTejhkOUEgD7H5U=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53NFN5mm045971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 10:23:05 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 10:23:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 10:23:04 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53NFN4xD062058;
	Wed, 23 Apr 2025 10:23:04 -0500
Message-ID: <ac10eeeb-ab9e-4eaf-bf7c-7810c7ba64a5@ti.com>
Date: Wed, 23 Apr 2025 10:23:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Add CDNS_DSI and CDNS_PHY config
To: Jayesh Choudhary <j-choudhary@ti.com>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <nm@ti.com>, <linux-kernel@vger.kernel.org>
CC: <bjorn.andersson@oss.qualcomm.com>, <krzysztof.kozlowski@linaro.org>,
        <geert+renesas@glider.be>, <lumag@kernel.org>,
        <nfraprado@collabora.com>, <quic_tdas@quicinc.com>,
        <elinor.montmasson@savoirfairelinux.com>, <ebiggers@google.com>,
        <ross.burton@arm.com>, <linux-arm-kernel@lists.infradead.org>
References: <20250416182930.32132-1-j-choudhary@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250416182930.32132-1-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_082318_960530_5F7CFEE1 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Jayesh,

On 4/16/25 1:29 PM, Jayesh Choudhary wrote:
> Enable configs for cdns-dsi and cdns-dphy drivers required for DSI
> display on the following TI platforms:
> J721E-EVM, J721E-BeagleBone-AI64, J721S2-EVM, AM68-SK, J722S-EVM,
> BeagleY-AI, AM62P5-SK, J784S4-EVM and J742S2-EVM
> 
> The dsi wrapper driver used by all the above mentioned platforms,
> cdns-dsi-j721e is enabled by default if cdns-dsi config is enabled.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

LGTM, thanks for adding AM62P5-SK to patch description.

Reviewed-by: Judith Mendez <jm@ti.com>

> ---
> 
> Changelog v1->v2:
> - Change commit message to add the platforms that needs cadence dsi
>    and dphy driver enabled.
> 
> Link to v1 patch:
> <https://lore.kernel.org/linux-arm-kernel/20250411095043.272488-1-j-choudhary@ti.com/>
> 
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5c85e5da152f..4c0eb2711bbe 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -938,6 +938,7 @@ CONFIG_DRM_TI_SN65DSI86=m
>   CONFIG_DRM_ANALOGIX_ANX7625=m
>   CONFIG_DRM_I2C_ADV7511=m
>   CONFIG_DRM_I2C_ADV7511_AUDIO=y
> +CONFIG_DRM_CDNS_DSI=m
>   CONFIG_DRM_CDNS_MHDP8546=m
>   CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
>   CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
> @@ -1579,6 +1580,7 @@ CONFIG_PHY_CAN_TRANSCEIVER=m
>   CONFIG_PHY_NXP_PTN3222=m
>   CONFIG_PHY_SUN4I_USB=y
>   CONFIG_PHY_CADENCE_TORRENT=m
> +CONFIG_PHY_CADENCE_DPHY=m
>   CONFIG_PHY_CADENCE_DPHY_RX=m
>   CONFIG_PHY_CADENCE_SIERRA=m
>   CONFIG_PHY_CADENCE_SALVO=m


