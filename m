Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A2FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kwoX+eC25dSedmKSp74vPoDTpAjIhl77j+RADCpc0s=; b=0o1patPay+GM0RquIhDQiEpjhN
	A9bENfUgSlab/DUV5HVayWmmLSzjvHjsDhHtrWGH19xqqX/vmFE1Ck++IjKkxdv++yUdDxDM1o+eK
	x9LD+bB+aEj2Bsq8tH4y3g8gdhN9hnNMWPK6YGP89dpEYOgz0cZ3X3n33uyr8Tu8pq9l9hh4BFUhv
	BaIGi4NRviyovDBGl/UcIaY4HjSLj0xsY0LO+WWLvH2C2WIHo2rwTBf9G/PxilekHalbjl35ziKeS
	v0nhUsNGbH8u1P8cK4hWEp+DrJobhzprPFKaC/a8lKfL0j+QPx5PSL0yw+270YOGRxJdyrVp9KUEe
	r71/s49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9wx-0000000Gh25-2yAg;
	Thu, 18 Sep 2025 08:25:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9wu-0000000Gh1C-2iZI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1758183904; x=1789719904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wBQH4x39aG6mB8iHL9yRMDxDggYzTR5vRD+YFwTuBbk=;
  b=eH0li/nGYDlmOzRcbfJpAno30/VHwrz0rh8WDFx7n9GpBG5PEg7SPDqv
   P1Z2T4hWQrO8pIlTg0qZXJcgmXqPmkebb5VnqVnvwsjfVuWeOKdvgQb6H
   YDxgx2tQs2h5gLPX36G7I0T97PaNhgMTP0dDFByapTTaeFxnl+o7Hzc/L
   lcryL0GvA0WROVd0QbUb248mlEgdGlTkaq9GbS9HCSCLymr4udX5IW5Ac
   Iegm11XWbpXOygboDTrwWfSVhpGM539L6dcVDjl9aMloq6L3zKv6Tqa2Q
   cTeT1M87aEKOPkvtcWRkNnRqwe7v84/QuSe6FiDNorqrUk5wLAdB2lv0B
   w==;
X-CSE-ConnectionGUID: lOySgYw7Rg+a7f7PqeqBrQ==
X-CSE-MsgGUID: fTczQzg1QX2hq+qTsBjoMw==
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="52529240"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2025 01:25:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 18 Sep 2025 01:24:38 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 18 Sep 2025 01:24:36 -0700
Date: Thu, 18 Sep 2025 08:24:36 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <p.zabel@pengutronix.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <lars.povlsen@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <luka.perkov@sartura.hr>,
	<benjamin.ryzman@canonical.com>
Subject: Re: [PATCH 2/2] reset: sparx5: add LAN969x support
Message-ID: <20250918082436.3nfs7lo7hv5jdqhd@DEN-DL-M70577>
References: <20250917111323.60781-1-robert.marko@sartura.hr>
 <20250917111323.60781-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250917111323.60781-2-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_012504_696658_2B50D90B 
X-CRM114-Status: GOOD (  21.45  )
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

Hi Robert,

> LAN969x uses the same reset configuration as LAN966x so lets add support
> for it as well.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  drivers/reset/Kconfig                  | 2 +-
>  drivers/reset/reset-microchip-sparx5.c | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 78b7078478d4..35cb84d1de4e 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -170,7 +170,7 @@ config RESET_LPC18XX
> 
>  config RESET_MCHP_SPARX5
>         tristate "Microchip Sparx5 reset driver"
> -       depends on ARCH_SPARX5 || SOC_LAN966 || MCHP_LAN966X_PCI || COMPILE_TEST
> +       depends on ARCH_SPARX5 || ARCH_LAN969X ||SOC_LAN966 || MCHP_LAN966X_PCI || COMPILE_TEST

Missing space at ||SOC_LAN966.

>         default y if SPARX5_SWITCH
>         select MFD_SYSCON
>         help
> diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
> index 6d3e75b33260..28ad8f1298a0 100644
> --- a/drivers/reset/reset-microchip-sparx5.c
> +++ b/drivers/reset/reset-microchip-sparx5.c
> @@ -198,6 +198,9 @@ static const struct of_device_id mchp_sparx5_reset_of_match[] = {
>         }, {
>                 .compatible = "microchip,lan966x-switch-reset",
>                 .data = &reset_props_lan966x,
> +       }, {
> +               .compatible = "microchip,lan969x-switch-reset",
> +               .data = &reset_props_lan966x,
>         },
>         { }
>  };
> --
> 2.51.0
> 

When upstreaming support for the other SoC peripherals [1] [2], I got some
push-back on the use of wildcards in the compatible string. Instead, we used a
fallback, which is the accepted ways of expressing the individual SKU's.

This boils down to: using the lan9691-switch-reset compatible string, and
documenting each individual SKU in the bindings, with a fallback to lan9691.
The linked patches should give you and idea.

[1] https://lore.kernel.org/linux-gpio/20240917-lan969x-pinctrl-v2-1-ea02cbc56831@microchip.com/
[2] https://lore.kernel.org/linux-clk/20240916-lan969x-clock-v1-1-0e150336074d@microchip.com/

/Daniel

