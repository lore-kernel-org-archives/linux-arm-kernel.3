Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B17CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 04:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrDJJJ8htZeJE59VEer7OcT8rYZqd9oQ8hHDpoiwQaA=; b=EOnG0Jegryo+b4a/styRLeoaqb
	eTzdjUt2sbaZ/SM7OInxgoHD5Ze30yjo+b8c/s9TbML3M1MZCRoSC38d7uf9YyH4cqrihnNbR+i10
	woaklqRIkkFaEARVnqyiRrAUTlQNypOcVWxzcmF3sh7nBhEaYyJGNTxGGeZv1z6n/8dex2Gq6IvAa
	eaxO3bcoebTX5r4yHmvPtGveRtxjm57YcGf++3d+6fZcRTJ6G6UxMNyyFsTzgp0xgQM/aTDZQZSkk
	0BbE8LeVvZU9+u9yXz3cMajGECgGWuDA8EO5r1YA+6c4AjJCIHZnXs2EgSxsOgXAVWmyQAG41lvsk
	gBIel/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7oWZ-0000000CpdW-40HC;
	Thu, 24 Apr 2025 04:49:24 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7oUa-0000000CpY9-24fr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 04:47:22 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O4lGOP2392035
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 23:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745470037;
	bh=DrDJJJ8htZeJE59VEer7OcT8rYZqd9oQ8hHDpoiwQaA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=L7dhHa4NU6Ygz2ievXXnriN0s0NFREqiVIIFI5ZKr5Osn2y0B7ZcaSgLMK8Eohzfo
	 uGOFCVDFU0nQK9en93w2sXRGb+GEnJ2O1cXgE+fBGhdLI8novRgMd23buBKOHdjWtV
	 cKjBR5J3HNE3y3GSGAzgy8B95bn88vTbNg+GhuFc=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O4lG52120139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 23:47:16 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 23:47:16 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 23:47:16 -0500
Received: from [172.24.22.140] (lt5cd2489kgj.dhcp.ti.com [172.24.22.140])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O4lBk7042147;
	Wed, 23 Apr 2025 23:47:13 -0500
Message-ID: <03bc9327-cf4e-4bd1-aa39-3f943a2d02f6@ti.com>
Date: Thu, 24 Apr 2025 10:17:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: defconfig: Enable TMP102 as module
To: Dominik Haller <d.haller@phytec.de>, <robh@kernel.org>,
        <kristo@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>,
        <w.egorov@phytec.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <upstream@lists.phytec.de>, <u-kumar1@ti.com>
References: <20250423133635.29897-1-d.haller@phytec.de>
 <20250423133635.29897-3-d.haller@phytec.de>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250423133635.29897-3-d.haller@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_214720_590649_ACC5153C 
X-CRM114-Status: GOOD (  15.24  )
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


On 4/23/2025 7:06 PM, Dominik Haller wrote:
> Enable the driver for the TI TMP102 temperature sensors used on the Phytec
> phyCORE-AM68x/TDA4x and the phyGATE-Tauri-L-iMX8MM.
>
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> ---
>
> Notes:
>      Changes in v4:
>      - no changes
>      
>      Changes in v3:
>      - no changes
>      
>      Changes in v2:
>      - new patch in series
>
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5bb8f09422a2..54e6705f9752 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -702,6 +702,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
>   CONFIG_SENSORS_SL28CPLD=m
>   CONFIG_SENSORS_INA2XX=m
>   CONFIG_SENSORS_INA3221=m
> +CONFIG_SENSORS_TMP102=m

Reviewed-by: Udit Kumar <u-kumar1@ti.com>


>   CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
>   CONFIG_CPU_THERMAL=y
>   CONFIG_DEVFREQ_THERMAL=y

