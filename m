Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD30E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMxSZutg00vXvr44EHaUd78mFUfx7ownohlph3k0Skc=; b=mp2Z9Phqf679K2V3QnPVwtjdPV
	8B+R2wmbyTJXl6++7wVQd5Aud7PBPtuH6tkPwrQ9Hl2D92EOE+C8c5ceUyAdVlzgUlIkswRPeJ/yn
	IF+jSpMiD7WkFPTHF4jMjQlaKUDgmqodHAzvRhTDAJO4Vn2G/JdftM7wsJUUhbezi/gdo+DvIdxOI
	Fe2TJby3LnzqpGtj+Edi8s2UPtgUbVYxfh/L9Av49ahcI4jZ3gs2yfaBIUKkc78cLbmHTP0MOTs+f
	xH4wK2+PPwUdpHV3cOZbKaWpgr34Ju+STe0ZhEd6vTAD2OMJMwm8NUHi4/wfPWOnJQalQtLCN1EM/
	Vemqipgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWNM-00000008elW-2fRH;
	Wed, 08 Jan 2025 13:45:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWAd-00000008cg1-2hAK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1736343147; x=1767879147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dAxFgrzG1HoxwzIUMYTk3N5n2IDUrRKAA4lDY4FZYFY=;
  b=oFkmEA5aBFi1q6XGx60RH/maW/ZFYxiKjVlmmK9LjlTI9gItGqpx0svr
   iyQCII9p4hpLbRYut99iifG+Cd5mau3u47p5ZVYgSNp/S/ZMFKLcmUnn2
   L3pMoNszuhWk4pTLgRxALLWoSp2lcciB9LypbD/nXPt/X7EKhqDvtiaKB
   SkrW5UQMX/G+8DDwnGc5kS+sb3qQRJYssnFlQlh+HCrUvhGp9rkr/7jFb
   zZF8N1uCq4dm5mRDTzy7nV4EbOMHlC90AwK5tYLHfYXc6RW2N4rizAxrG
   KhBrVEWHwlq9DnQ/AAQJkRRZhlnRQ+m/nsy9pUXm0C0rspDA6nAv72zVo
   Q==;
X-CSE-ConnectionGUID: 8yblzpFQSpy0mdJMe/argg==
X-CSE-MsgGUID: 9tr49NP3TOGm+epbvodq0Q==
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="267567432"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Jan 2025 06:32:25 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 Jan 2025 06:32:22 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 8 Jan 2025 06:32:20 -0700
Date: Wed, 8 Jan 2025 13:32:20 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <lee@kernel.org>,
	<gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <arnd@kernel.org>,
	<lars.povlsen@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<luka.perkov@sartura.hr>
Subject: Re: [PATCH v3 1/3] arm64: lan969x: Add support for Microchip LAN969x
 SoC
Message-ID: <20250108133220.xysvfof4puzr3jgr@DEN-DL-M70577>
References: <20250108131045.40642-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250108131045.40642-1-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_053227_758098_9AFC3B38 
X-CRM114-Status: GOOD (  16.87  )
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

> This adds support for the Microchip LAN969x ARMv8-based SoC switch family.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v3:
> * Rebase on top of next-20250107
> 
> Changes in v2:
> * Add forgotten LAN969x architecture support itself
> 
>  arch/arm64/Kconfig.platforms | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index e2638e5118a7..cd29480be792 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -133,6 +133,20 @@ config ARCH_SPARX5
>           security through TCAM-based frame processing using versatile
>           content aware processor (VCAP).
> 
> +config ARCH_LAN969X
> +       bool "Microchip LAN969X SoC family"
> +       select PINCTRL
> +       select DW_APB_TIMER_OF
> +       help
> +         This enables support for the Microchip LAN969X ARMv8-based
> +         SoC family of TSN-capable gigabit switches.
> +
> +         The LAN969X Ethernet switch family provides a rich set of
> +         switching features such as advanced TCAM-based VLAN and QoS
> +         processing enabling delivery of differentiated services, and
> +         security through TCAM-based frame processing using versatile
> +         content aware processor (VCAP).
> +
>  config ARCH_K3
>         bool "Texas Instruments Inc. K3 multicore SoC architecture"
>         select PM_GENERIC_DOMAINS if PM
> --
> 2.47.1
>

Acked-by: Daniel Machon <daniel.machon@microchip.com>
 

