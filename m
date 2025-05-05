Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCECC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U80q0hzQWb189zleA5rq0bDksV/4Kegvk1geyPQh0Ow=; b=YWZypk6sVo661zz2qOidFdW8R7
	Du9F4r4+Q7KJmnJ7ju8MpJ38+6Eh6VpsXbfOtQduOVQvtJxYEfEc9cKrMfcFf6rePfYf2RJU/XhtP
	I8NALoEfgpgA61xEidoOgKyPZcc+u0vjIhttu0pSpm3w1ZNG8eqlRKQ8IsDGzSaUad1f600LD7FDn
	B4MIbY6o3ajTHZBNNb6jX6avqmCQkjeDj1WS9yQWdnxB9WgmVTcuAyJ7loSUbd3MHmjl5gyqkZjS9
	EwZnV8UbDXE/wJjeqpNEqMmhTzTrQrVx5s7t87w00XljN3IGXLoFadIScnogTxftTTXu7btLigllh
	dM1oPz+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvFN-00000007O7R-0PXk;
	Mon, 05 May 2025 12:48:37 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBv3m-00000007Kyi-256i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 12:36:45 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545CaFTc245758
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746448575;
	bh=U80q0hzQWb189zleA5rq0bDksV/4Kegvk1geyPQh0Ow=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=qvDbs6wjymtJHDViK9gI15el8zjzDwELIN6Xuwjay5RSoozV0BUWsUBowDqo7yKmX
	 XA9lum/jaw+/uwdKdrmjxaXx4K75RTUE3fFH6zH6L+CMXaehwKey0PJhXfIeKpkM3k
	 NU9eZu1UDi1Z9BVSP6zsw5yckNFq5Bt6AsHmd2q4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545CaFGi029225
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 07:36:15 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 07:36:15 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 07:36:15 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545CaFY1123903;
	Mon, 5 May 2025 07:36:15 -0500
Date: Mon, 5 May 2025 07:36:15 -0500
From: Nishanth Menon <nm@ti.com>
To: Guillaume La Roque <glaroque@baylibre.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Davis <afd@ti.com>, <vishalm@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Message-ID: <20250505123615.yqzdv7dlel7kyojf@degrease>
References: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_053638_620512_9D90ED6C 
X-CRM114-Status: GOOD (  16.54  )
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

On 13:24-20250504, Guillaume La Roque wrote:
> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
> select on ARCH_K3 are not needed anymore.
> 
> Remove it and give possibility to enable this driver in modules.
> 
> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
> 
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
>  arch/arm64/Kconfig.platforms | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 8b76821f190f..5b63a42c4dff 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -138,8 +138,6 @@ config ARCH_K3
>  	select PM_GENERIC_DOMAINS if PM
>  	select MAILBOX
>  	select SOC_TI
> -	select TI_MESSAGE_MANAGER
> -	select TI_SCI_PROTOCOL
>  	select TI_K3_SOCINFO
>  	help
>  	  This enables support for Texas Instruments' K3 multicore SoC
> 

While at this, is it possible to remove MAILBOX and PM_GENERIC_DOMAINS
from select and make them as modules?

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

