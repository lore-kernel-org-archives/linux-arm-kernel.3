Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633D4C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 09:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z6Nl9GcJkkbHLxUlXdSoq7VtdD7a2NviYmzBmJ8IBE=; b=PY+ss0eFGT0jY1v9JCVH+AFEIv
	c9M9SzguUNmn50udrlYSNLzB86uhkXsmAF6/9UHOYkLeP55uJ8XBVbQ4yXG6nzBNgmOJGeYkrQYrr
	83WFGKE4+1bkPfgo0fLDyqO7OLyT+NneEDRlXSAR+w1wJ72HwthV24m7IpqBx3dP3A3S7nnJmlEln
	/GNj5vH55ovj+OAl1B0iTivV/YjnCKiFqCtMY46ZbEaeSYNx5VmMw1I5DiUy5RW+0UKINxuDgYtLL
	zfY6bcP4MNKfSd2HbGy5YlR4L53cSKTE++6Y2u8thyzjelwM1BsV7n4Y740ySNbsqmjhlm9PM2RKN
	HMR8Rx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugKAu-0000000E6cC-237o;
	Mon, 28 Jul 2025 09:29:40 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugK8O-0000000E68F-2UnV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 09:27:05 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S8WWDg024545;
	Mon, 28 Jul 2025 11:26:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	4z6Nl9GcJkkbHLxUlXdSoq7VtdD7a2NviYmzBmJ8IBE=; b=QUfQy+iKDnQEYJPx
	9ckO2BuTyIyvKwxap7G9/Nsb1P7Ts/oYR/c+nINsDXGEH2iuQ386yXtPxVVfOmfQ
	XAs8GDXPO2XSiktM/3/GihMDkCzA6fs8i75Cmjs5rECnMsMJGkGxWPLgfi/sVT44
	Gub8InmnlN+mebMqfc4BKC9dYHNJ/PTsd4H4w1eJ0t/QZMRxWLEbV0Q7A3RLnRB5
	8qIXm2WTOw2w4PKdI9JeFdpu/4ZW1USKFmH655qhzPRROq81kMvW+tmiymRsJjIu
	u/Lc3PD8SvHBpK/oA5WOI+xck4FfrqUkge9K9DmnVwwZlCokLNZ1mUh5vbNRba3f
	UQvLbA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484nwgeykj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jul 2025 11:26:55 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 399404004B;
	Mon, 28 Jul 2025 11:25:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6AC7F75E80B;
	Mon, 28 Jul 2025 11:25:15 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 11:25:14 +0200
Message-ID: <b80cc04f-aa80-4124-97de-846bebc271a2@foss.st.com>
Date: Mon, 28 Jul 2025 11:25:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: sti: removal of stih415/stih416 related
 entries
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Alain Volmat <avolmat@me.com>
References: <20250714-sti-rework-v2-0-f4274920858b@gmail.com>
 <20250714-sti-rework-v2-2-f4274920858b@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250714-sti-rework-v2-2-f4274920858b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_022704_901314_5E7D0793 
X-CRM114-Status: GOOD (  16.66  )
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



On 7/14/25 15:49, Raphael Gallais-Pou wrote:
> From: Alain Volmat <avolmat@me.com>
> 
> ST's STiH415 and STiH416 platforms have already been removed since
> a while.  Remove some remaining bits within the mach-sti.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  arch/arm/mach-sti/Kconfig    | 20 +-------------------
>  arch/arm/mach-sti/board-dt.c |  2 --
>  2 files changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
> index b3842c971d31b80edaf88ab907f4377bea0a2af5..e58699e13e1a55ce46e68908c7ef51e18b040dc9 100644
> --- a/arch/arm/mach-sti/Kconfig
> +++ b/arch/arm/mach-sti/Kconfig
> @@ -19,31 +19,13 @@ menuconfig ARCH_STI
>  	select PL310_ERRATA_769419 if CACHE_L2X0
>  	select RESET_CONTROLLER
>  	help
> -	  Include support for STMicroelectronics' STiH415/416, STiH407/10 and
> +	  Include support for STMicroelectronics' STiH407/10 and
>  	  STiH418 family SoCs using the Device Tree for discovery.  More
>  	  information can be found in Documentation/arch/arm/sti/ and
>  	  Documentation/devicetree.
>  
>  if ARCH_STI
>  
> -config SOC_STIH415
> -	bool "STiH415 STMicroelectronics Consumer Electronics family"
> -	default y
> -	help
> -	  This enables support for STMicroelectronics Digital Consumer
> -	  Electronics family StiH415 parts, primarily targeted at set-top-box
> -	  and other digital audio/video applications using Flattned Device
> -	  Trees.
> -
> -config SOC_STIH416
> -	bool "STiH416 STMicroelectronics Consumer Electronics family"
> -	default y
> -	help
> -	  This enables support for STMicroelectronics Digital Consumer
> -	  Electronics family StiH416 parts, primarily targeted at set-top-box
> -	  and other digital audio/video applications using Flattened Device
> -	  Trees.
> -
>  config SOC_STIH407
>  	bool "STiH407 STMicroelectronics Consumer Electronics family"
>  	default y
> diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-dt.c
> index 488084b61b4acafb569ee9c51f5769393d55a9ce..1aaf61184685d754de57b487aef9a6b45a759b23 100644
> --- a/arch/arm/mach-sti/board-dt.c
> +++ b/arch/arm/mach-sti/board-dt.c
> @@ -10,8 +10,6 @@
>  #include "smp.h"
>  
>  static const char *const stih41x_dt_match[] __initconst = {
> -	"st,stih415",
> -	"st,stih416",
>  	"st,stih407",
>  	"st,stih410",
>  	"st,stih418",
> 


Hi Raphael

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks

