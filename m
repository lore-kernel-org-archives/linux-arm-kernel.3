Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90076C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFXgb0s+IYJqr9jWmdPiymgN4kIkfeX4NU0o6gBVPfI=; b=ZmKvKkawFNEE0rcRBYyyNmpVTe
	v3cQGrmZKWML9W/UnnpZvgQbczyIBcPjM0VQWvi0jBtBpRUeEWSc5Y5mdL8t4e4Mtw+udDFFqIu9c
	YvZBugi0EZODUpybiP5J6JEi6d4uTsQtWnaIN3t4d2jPEVS9PeX8T1LiJww7sRLxyn+qldYzTe/ZM
	w85+xF2cq0hVdazRqxxiSaYKrUEktW6jmTxk59Wns19S32Ijzkm7nctglQOca0W9Ue52Mygihq5m9
	+Qcy/B5HEmbXSfrsN3kwXd7oCFqekvwTQAsjC3D4IDdEgFsy8N0a3j+VdPUtgM1N7GhdWwrR7eAuZ
	sfdgku4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeyG-0000000EHvf-0dOw;
	Fri, 04 Jul 2025 11:52:48 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcqm-0000000DwrI-0QGO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 09:36:57 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647ZtkU028698;
	Fri, 4 Jul 2025 11:36:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	GFXgb0s+IYJqr9jWmdPiymgN4kIkfeX4NU0o6gBVPfI=; b=hU0tCFXHvr+dCiAS
	6Rm8b/FkxRWvkvOZmSbIVq7pEw3FTHO9afQGrN01sm+qrdT1yKvVW6bxkaKU1R/p
	q2eFkqD8byzZO+6nxEGUWGTTPiHrfl/VOkgElDJyz+iQaH2vyX3RM80F5EUtuFxo
	0nsEaKWdholSf9mlnB3S0rdIfTO/g/xVVAb6y5YdmP4E6tNOjm8JNgrdVImbh0JW
	Pf8ZDaJ/oRHUdecw1zUcCf2SZMCHzUIG/TRHxMqBGlm4B1iWg9O7oLxypMtXvdGu
	bALlGlmcBGOaYaRBqEgls1Va9P930hkO392icIriy+hCBJjX9969Q4PRBQr9OF3s
	Eah4qQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47jsy59w9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 11:36:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 7967340046;
	Fri,  4 Jul 2025 11:36:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60CCEAAF64F;
	Fri,  4 Jul 2025 11:35:52 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 11:35:51 +0200
Message-ID: <64d4d444-1317-4b55-be47-67fe7d1184d3@foss.st.com>
Date: Fri, 4 Jul 2025 11:35:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] arm64: defconfig: Enable STM32 Octo Memory Manager
 and OcstoSPI driver
To: Patrice Chotard <patrice.chotard@foss.st.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250630-upstream_omm_ospi_defconfig-v11-1-6e934fabe698@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250630-upstream_omm_ospi_defconfig-v11-1-6e934fabe698@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_023656_446165_D5D9D487 
X-CRM114-Status: GOOD (  13.69  )
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

Hi Patrice

On 6/30/25 10:44, Patrice Chotard wrote:
> Enable STM32 OctoSPI driver.
> Enable STM32 Octo Memory Manager (OMM) driver which is needed
> for OSPI usage on STM32MP257F-EV1 board.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Changes in v11:
>    - rebase on top of next-20250627.
>    - Add Alexandre in recipients.
> 
> Changes in v10:
>    - rebase on top of next-20250509.
>    - Link to v9: https://lore.kernel.org/r/20250428-upstream_omm_ospi_defconfig-v9-1-66c1bbac5461@foss.st.com
> 
> Changes in v9:
>    - split patchset by susbsystem, current one include only defconfig related
>      patch.
>    - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 2211c385195456f8609edfad40202002df0abb5f..978bcd554ee18b0fa1975a984b9eb9058727df81 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -582,6 +582,7 @@ CONFIG_SPI_QUP=y
>   CONFIG_SPI_QCOM_GENI=m
>   CONFIG_SPI_S3C64XX=y
>   CONFIG_SPI_SH_MSIOF=m
> +CONFIG_SPI_STM32_OSPI=m
>   CONFIG_SPI_SUN6I=y
>   CONFIG_SPI_TEGRA210_QUAD=m
>   CONFIG_SPI_TEGRA114=m
> @@ -1528,6 +1529,7 @@ CONFIG_EXTCON_USB_GPIO=y
>   CONFIG_EXTCON_USBC_CROS_EC=y
>   CONFIG_FSL_IFC=y
>   CONFIG_RENESAS_RPCIF=m
> +CONFIG_STM32_OMM=m
>   CONFIG_IIO=y
>   CONFIG_EXYNOS_ADC=y
>   CONFIG_IMX8QXP_ADC=m
> 
> ---
> base-commit: 2aeda9592360c200085898a258c4754bfe879921
> change-id: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a
> 
> Best regards,


Applied on stm32-next.

thanks
Alex

