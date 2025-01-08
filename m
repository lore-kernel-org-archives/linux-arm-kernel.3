Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6025DE7719C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQC50lF8Z8baCNSIExHENS1aF1vyjNlYTvjXxdQjFiI=; b=MkzEayQlBeGLpAIUu75xmRmOpy
	OVbkvNKan16hcVxwFL7cOmgCeLCgMr8OethsQLULrsPLZdurHQTO/XPXSUTZBhA26T1qax0TA0EDT
	VWPem5EbQlJlC3EhUvA2/cH5MhU9w04T6tUOxwu0XHPdv+WvA/W8pSWny6vwjGjYhM/2dSLzkkgmm
	ZQeTW5/ivnwThf6mbAZun2miZY1Klwpfr2PBKvsVAyZNMuSRY9IQa0C4P4cg7mnFkHgpdz5NOrCIc
	NMCy+1ogf6xsGpyDfVZfKQMDAkD18ul6OzY0Kc/MuT+rj12At7MBqUEBFqy36UZSfXwnqZpfiXhb0
	1pVD4+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWNN-00000008emJ-1IXG;
	Wed, 08 Jan 2025 13:45:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWEf-00000008dHU-2Eud
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736343397; x=1767879397;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y+Cs5xbgf/BL3TuDrL23bogHa42BatxpXamUv7gZeDA=;
  b=VHAYDRQBXyTeNfil1D1qzTHGLMsrbXIyOoU/KNu+15gdzJTH7QWEl7yF
   W95n6z7bsqx68eQmznNM1rH8jaH1tXnZSXtIv+n8m8aZQFE6iWdsNAD06
   LdjjDEbz64RyUp9Y6CXbhYDvYMYP7ziMb9Db4tq3IzGbZRBTWRCLKFi7U
   VGusCnzRGoHLz6YLIEUpQ7u6DEbXtBIYeqevMh5p1IJoVhaQLAFf0xgVb
   cAApArrOKe9bIW+27+jBjPCmiBc7NDHGwCJwgwAScIiH/diL+HF5uthwz
   +ZdNFDPMNf8mK/yNzxB2Hk/EFW4sGrwyE3Wc5VRB/fcmUuYebwU6cVrGO
   A==;
X-CSE-ConnectionGUID: YYc78GS+T4KIxstOKUdH/A==
X-CSE-MsgGUID: AMoFRzCVSmGHmJlOpcnucA==
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="36301300"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Jan 2025 06:36:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 Jan 2025 06:35:39 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 Jan 2025 06:35:37 -0700
Date: Wed, 8 Jan 2025 13:35:36 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
Subject: Re: [PATCH v3 2/3] mfd: at91-usart: make it selectable for
 ARCH_LAN969X
Message-ID: <20250108133536.wlecqn362bt6nfmo@DEN-DL-M70577>
References: <20250108131045.40642-1-robert.marko@sartura.hr>
 <20250108131045.40642-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250108131045.40642-2-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_053637_575645_94E315D3 
X-CRM114-Status: GOOD (  17.11  )
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
Cc: arnd@kernel.org, luka.perkov@sartura.hr, jirislaby@kernel.org, catalin.marinas@arm.com, lee@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, gregkh@linuxfoundation.org, will@kernel.org, lars.povlsen@microchip.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> LAN969x uses the AT91 USART IP so make it selectable for ARCH_LAN969X.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Acked-by: Lee Jones <lee@kernel.org>
> ---
> Changes in v3:
> * Pickup Acked-by from Lee
> 
> Changes in v2:
> * Pickup Acked-by from Nicolas
> 
>  drivers/mfd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6b0682af6e32..ef32ac5ed75d 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -138,7 +138,7 @@ config MFD_AAT2870_CORE
>  config MFD_AT91_USART
>         tristate "AT91 USART Driver"
>         select MFD_CORE
> -       depends on ARCH_AT91 || COMPILE_TEST
> +       depends on ARCH_AT91 || ARCH_LAN969X ||COMPILE_TEST

You fixed the missing whitespace before COMPILE_TEST in 3/3, but it seems like
you are missing it here too.

>         help
>           Select this to get support for AT91 USART IP. This is a wrapper
>           over at91-usart-serial driver and usart-spi-driver. Only one function
> --
> 2.47.1
> 

