Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92C2C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRkGB3GceLUeejR3dcVm7Hu3nWcnMD2L4Z0M3mLfQKE=; b=0X88V9/sEuRPsogDHsYQYtILI4
	5mPwlj454sxdxZR6eISAME3KG6f+lOuacZ7gFtoUkpIplfxJpqFq+k5ruynO4ByB0flDmeeFjKVdj
	blAY1+oacEvvtc0IOR8GobO75wpGwXWLZ0WewWyEVmOAMO7C1C9thRoOzXf57OX860enS2PJE9Edc
	KpU2L5tItmNmyt54GLGlFdUIN8a0ILQzwMZ2UciYdTi6gSBtMomRGPo3CQmyXMKK2F5srgYabLEQm
	rdZHwtXHG6UIv9n5xv1jfyKAvxrIYK1tdthsfcac+XDRql9rCkfi73xIzh70mmjaIuB9JUeon+MEU
	EXz3qStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazAO-0000000CiIl-0KBN;
	Thu, 23 Jan 2025 15:30:48 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taz90-0000000Ci3q-18gb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:29:23 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NFT4Ug390550
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 09:29:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737646144;
	bh=CRkGB3GceLUeejR3dcVm7Hu3nWcnMD2L4Z0M3mLfQKE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kssc1V+cCJobwWgTufYIHAO98RyROnvVXJj0+kdQJYYqCKhfS1QJHXQJpauS3jOIO
	 69jx9Oz//RrEoH75a0KwnweVDXWohmJZK3reXvanhDJ/5jMu+wGTfqIS+A7xWH5AFy
	 L0ct/JcVukcUOfyBUdzSpjO+PX469wXAmp26n2JA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NFT4ko004948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 09:29:04 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 09:29:04 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 09:29:04 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NFT3qU084061;
	Thu, 23 Jan 2025 09:29:03 -0600
Message-ID: <f1e6f49c-71e2-4c6f-b78f-7608739530c9@ti.com>
Date: Thu, 23 Jan 2025 09:29:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: arch_k3: Replace select with imply for TI
 mailbox and TI SCI
To: Guillaume La Roque <glaroque@baylibre.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <nm@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <khilman@baylibre.com>,
        Mattijs Korpershoek
	<mkorpershoek@baylibre.com>, <vishalm@ti.com>,
        Nicolas Frayer
	<nfrayer@baylibre.com>
References: <20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_072922_480447_F18C7927 
X-CRM114-Status: GOOD (  18.43  )
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

On 1/23/25 6:12 AM, Guillaume La Roque wrote:
> In order to build TI mailbox and TI SCI as modules, replace
> select with imply.
> 
> Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
> Changes in v4:
> - rebase on master branch
> - Link to v3: https://lore.kernel.org/r/20241016-timodulemailboxsci-v3-1-0e7f7a6de97d@baylibre.com
> 
> Changes in v3:
> - rebase with master
> 
> Changes in v2:
> - Use imply instead of removing select altogether and dropped
> patches 2/3 and 3/3 from previous series as using imply makes
> them redundant
> ---
>   arch/arm64/Kconfig.platforms | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 02007256709e..a6e4bfffc09d 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -133,8 +133,8 @@ config ARCH_K3
>   	select PM_GENERIC_DOMAINS if PM
>   	select MAILBOX
>   	select SOC_TI
> -	select TI_MESSAGE_MANAGER
> -	select TI_SCI_PROTOCOL
> +	imply TI_MESSAGE_MANAGER
> +	imply TI_SCI_PROTOCOL

I really don't like "imply" in general, and this will be the only
instance of it now in the whole file..

Your v1 of this series was the right way to do this IMHO. The only
issue was patches 2/3 and 3/3 should have been first in the series to
prevent bisect issues. And they had to go to two different maintainers
so it shouldn't have been a single series in the first place.

Andrew

>   	select TI_K3_SOCINFO
>   	help
>   	  This enables support for Texas Instruments' K3 multicore SoC
> 
> ---
> base-commit: 21266b8df5224c4f677acf9f353eecc9094731f0
> change-id: 20241016-timodulemailboxsci-412e2a6458fc
> 
> Best regards,

