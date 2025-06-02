Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1ABC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQnTD3sMOZ/Yz+cQ2+3tny2YWO4ikiRwRh+iaTvsl/I=; b=I7oZAQhxmyB5ar6Y3qeyPOrpiu
	eKvut0C+VEMaHGwaIAkR0LOrknSPLgFlCB1e108rYshz651IpJtCMlwb+zpuGdIO6gNRvRF08f6x7
	aYJOXU2I2hgKRsvlihB/GCObdV5rQpmsNVq8ASvxOtSlw62kwgMl0DH8qJwckkKfbs/AIy1/mYIYG
	KuVC5QxLhF2LIi7KyBOif6HBy7L9Yw9xAfnpgsXnsrSKhFx7njBnBFdFgno7R3xL1YEFjdrdHsSw9
	UE1ak3IyGduqOX8/MVc0hD4RSnNGAMc5sCyDpNcZKU+bkk7Og+UOz3cqQcIPj/FLg/iLY+7hi+I31
	gFPh58jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM0fx-0000000700X-1wv7;
	Mon, 02 Jun 2025 08:37:45 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM0bw-00000006zcY-2CiN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 08:33:38 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5524w7w7001961;
	Mon, 2 Jun 2025 10:33:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	iQnTD3sMOZ/Yz+cQ2+3tny2YWO4ikiRwRh+iaTvsl/I=; b=Lr9kmC1BNlhNb1/Y
	YnuRk7zmnmE65/CpO//gHEh9jy+8wQcYYtVsJD3O7OIPWRV9Oc1XYb2wkNd1Un+1
	WuWOChvj7ULfWPBCnk+oqSVi4Vfg/TiXeY4bsNN/sYLBWjOwO+X+sDZsVhPJcOjx
	NoDhU8va+k7rNdJ3YZ297H8oQ7+V2oLyzGGvXNSzaFNQhou700OSWi5hkrgGSGO5
	1UdHae3Pyoi8nckhw+/pEa46IHwQbDmAasSo7GK8chWsqjfmVDYS85jtNLjgQB4m
	f7QwnUczeem3HNAD6lS/AhK5wa0ckJFsr/FabtHDJGsNT4Mj0pQIdLfPS6DpSEJR
	1hjHDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46ys41x0w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jun 2025 10:33:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 68E7840051;
	Mon,  2 Jun 2025 10:32:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B9263AF26ED;
	Mon,  2 Jun 2025 10:32:23 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 2 Jun
 2025 10:32:23 +0200
Message-ID: <bfb42df1-6697-4da7-8efb-a891d0487766@foss.st.com>
Date: Mon, 2 Jun 2025 10:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] arm64: defconfig: Enable STM32 Octo Memory Manager
 and OcstoSPI driver
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250512-upstream_omm_ospi_defconfig-v10-1-4d9996911bd3@foss.st.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250512-upstream_omm_ospi_defconfig-v10-1-4d9996911bd3@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_03,2025-05-30_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_013337_183635_E8CB52EC 
X-CRM114-Status: GOOD (  13.55  )
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



On 5/12/25 08:40, Patrice Chotard wrote:
> Enable STM32 OctoSPI driver.
> Enable STM32 Octo Memory Manager (OMM) driver which is needed
> for OSPI usage on STM32MP257F-EV1 board.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Changes in v10:
>   - rebase on top of next-20250509.
>   - Link to v9: https://lore.kernel.org/r/20250428-upstream_omm_ospi_defconfig-v9-1-66c1bbac5461@foss.st.com
> 
> Changes in v9:
>   - split patchset by susbsystem, current one include only defconfig related
>     patch.
>   - Link to v8: https://lore.kernel.org/r/20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d0768584647c3b0e062b2667bc43fd7839f84c3a..03ccb3cc907114f24650d7f7ee10b20be33aa7d0 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -581,6 +581,7 @@ CONFIG_SPI_QUP=y
>  CONFIG_SPI_QCOM_GENI=m
>  CONFIG_SPI_S3C64XX=y
>  CONFIG_SPI_SH_MSIOF=m
> +CONFIG_SPI_STM32_OSPI=m
>  CONFIG_SPI_SUN6I=y
>  CONFIG_SPI_TEGRA210_QUAD=m
>  CONFIG_SPI_TEGRA114=m
> @@ -1506,6 +1507,7 @@ CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_EXTCON_USBC_CROS_EC=y
>  CONFIG_FSL_IFC=y
>  CONFIG_RENESAS_RPCIF=m
> +CONFIG_STM32_OMM=m
>  CONFIG_IIO=y
>  CONFIG_EXYNOS_ADC=y
>  CONFIG_IMX8QXP_ADC=m
> 
> ---
> base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
> change-id: 20250410-upstream_omm_ospi_defconfig-cbeda7cb302a
> 
> Best regards,

Hi Catalin, Will

Kind reminder to review this patch.

Thanks
Patrice

