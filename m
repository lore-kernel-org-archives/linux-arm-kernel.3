Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49908C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 06:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bA51Zuh3QHyfv5qHUZZLHXnEb+OC900pTf+oGAOd+Mg=; b=mFeyl4s9A1VvFNfV4vQBzzEPz1
	vz/AeNvXNzZA3Zp2HMzTq/lHWdhNuJ/PDTu4s+W5uyyDilNy9kvA8/4BvwkxD52TwUQplr17f55bG
	GtFcM2ea8pqaxi44j7RmYTL4XoOqJu3fksl5yfPTICRLO4ibcIZKUVH48+j2/VGBrqcj0Jkos0K3Y
	GBduFYgUhyjZRSPa/TmW/vvMchaSgCLtqYVHVXYRfGBtF1ejFQTEshWKus1j15RqmmzfRMFEdeQio
	NHcGWZhLysaA5BfjIB6hEr20rpxMeHdaggqIrYTfbvFLVpA4n7a988uG+KhmqsFQBUI7UYlMjEx8h
	DqeiobbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNzY-00000008JL0-3YlQ;
	Thu, 30 Jan 2025 06:25:32 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdNyE-00000008JGW-3dsJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 06:24:12 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50U6O2WW1481981
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 30 Jan 2025 00:24:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738218242;
	bh=bA51Zuh3QHyfv5qHUZZLHXnEb+OC900pTf+oGAOd+Mg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TVoktNGzZKMDt7b+3DZmQ/cFYnjgOLEevPdChJO5B2+Y7oUqi1rgp91AQqchHOOXp
	 NFcT1Vua0EYUbwDr4RSpn6rsDc5xgRZKme63gBPOi5qpyIXZkuSRe/nktE9uiQOUNT
	 VlFJQmDtlItii5UWTr95p2ByFH48FgX/jSMWnqI4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U6O2m6088002;
	Thu, 30 Jan 2025 00:24:02 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 Jan 2025 00:24:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 Jan 2025 00:24:02 -0600
Received: from [172.24.227.241] (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50U6Nx2W036439;
	Thu, 30 Jan 2025 00:24:00 -0600
Message-ID: <c00ae17b-b006-4b28-86e8-e82d1067e7d3@ti.com>
Date: Thu, 30 Jan 2025 11:53:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Enable SPI NAND flashes
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <krzk@kernel.org>, <vigneshr@ti.com>, <p-mantena@ti.com>,
        <s-k6@ti.com>
References: <20250116035145.370734-1-s-k6@ti.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <20250116035145.370734-1-s-k6@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_222410_960543_A3655F56 
X-CRM114-Status: GOOD (  13.40  )
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

Hi, all,

On 16/01/25 09:21, Santhosh Kumar K wrote:
> Add support for SPI NAND flashes on ARM64 boards/EVMs such as:
> 
> 1. W35N01JW on AM62x LP SK, AM62A7 SK, J721S2 EVM, J784S4 EVM,
>     J722S EVM, J742S2 EVM
> 2. W25N01JW on AM62Lx EVM
> 
> by enabling the MTD_SPI_NAND config as a module.
> 
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---

Gentle ping.

Regards,
Santhosh.

> 
> Changes in v2:
>   - Fix commit message
>   - Rebase on next
>   - Link to v1: https://lore.kernel.org/linux-arm-kernel/20250102120043.1404843-1-s-k6@ti.com/
>   
> Repo: https://github.com/santhosh21/linux/tree/uL_next
> Test results: https://gist.github.com/santhosh21/71ab6646dccc238a0b3c47c0382f219a
> 
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e729948b7d69..35f312a39e38 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -283,6 +283,7 @@ CONFIG_MTD_NAND_BRCMNAND=m
>   CONFIG_MTD_NAND_FSL_IFC=y
>   CONFIG_MTD_NAND_QCOM=y
>   CONFIG_MTD_SPI_NOR=y
> +CONFIG_MTD_SPI_NAND=m
>   CONFIG_MTD_UBI=m
>   CONFIG_MTD_HYPERBUS=m
>   CONFIG_HBMC_AM654=m

