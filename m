Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E2AC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqwMMmS2ONWo8fZ8IfMKARbxAzw2PB3gfUh1zxe+ZRw=; b=FGCKYh8O2KONTjdg3NT+K/jVN1
	6VC7JWXc30wf9loe5wuqa6lLYSXIPPi9uy44aYRNqAuX5nM0svzY+mOioFKu+SUIEkdNDCRG9aQh9
	MAoWaJTCAHVvsjOZQ004x9roQVjH8HxAHSzxCSrQLInPY9s+/6O4hrlu4x/BFqT/KJlK6boK987KP
	hyYwZy6LduWkjDIpGmMcZDPGmI8Tw/++ekHhbWu2UJ7Dta/47W/3tbVHkEQIBHGq529/8/35xgZKC
	xvJZ4Kv6eMIiUutEWiEG0X+sHFuKrvyVzmNdxxQfOETMJf5R1FHWzHHLxFAsiohXLr9/vdrJVzdur
	d6nSgpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7z4-00000004CG9-3wZ2;
	Mon, 16 Jun 2025 11:26:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6xq-000000043SP-34VO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750069278; x=1781605278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NbJoM5LfG3qBcRohRdPVhQO3z/elUf1FtTUs4Rnoxr0=;
  b=h19CefhfdfWVr2b052T4xa0BogZfmikdaZYYRFJfuiNy+CtTIJqsrDBD
   eRzFqO5H9rt7DMpS3bJ5daE8SUb0CteTl8nYRNa8UTCRdyPweZMMV2Woz
   /zwfJi5hTY0ApxbfXeBKuF3pludY16Q9ROTSkoPK9c/kSw6zcj3wkTOo0
   fo/KLHcWNj/cwdsaODJROeR12ukVZuWgeqcMYZ0aCWh/cJKu3eInremIC
   7hBPjcEnOi72U/fQn0dSFdHd3ZkP16op7T627PkFSUxFGosF69ya3kMHI
   e7/+MlMpayQJJpJEd9Ac4FeO157UmPKSCqD0RNzmY7CDp+u2AB52mQPEP
   w==;
X-CSE-ConnectionGUID: NkMxLeT9QaGXvpWNNipztw==
X-CSE-MsgGUID: 7tHYdufdSRiWVAqsQ/5L5Q==
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="42842138"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Jun 2025 03:21:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Jun 2025 03:21:07 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 16 Jun 2025 03:21:04 -0700
Date: Mon, 16 Jun 2025 10:21:03 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <olivia@selenic.com>,
	<herbert@gondor.apana.org.au>, <davem@davemloft.net>, <vkoul@kernel.org>,
	<andi.shyti@kernel.org>, <broonie@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<kernel@pengutronix.de>, <ore@pengutronix.de>, <luka.perkov@sartura.hr>,
	<arnd@arndb.de>
Subject: Re: [PATCH v7 1/6] arm64: lan969x: Add support for Microchip LAN969x
 SoC
Message-ID: <20250616102103.faoc5tqp22we67zl@DEN-DL-M70577>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250613114148.1943267-2-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_032118_900869_0EED9520 
X-CRM114-Status: GOOD (  15.03  )
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
> Acked-by: Daniel Machon <daniel.machon@microchip.com>
> ---
>  arch/arm64/Kconfig.platforms | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index a541bb029aa4..834910f11864 100644
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

The lan969x SoC uses the clk-lan966x driver. Would it not make sense to select
it here?

  +       select COMMON_CLK_LAN966X

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
> 2.49.0
> 

/Daniel

