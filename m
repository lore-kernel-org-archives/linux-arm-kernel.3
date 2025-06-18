Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77765C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Jfv7W89jcyNI5g8maM5e0NmglDrqdzJne5yo5vZPXg=; b=yP/siUgkovpyLx2A66+59dy+if
	q0DpGpCVoJyfuGPqgwZJcIyLbZKAs6/BzMa65Eyj2rVIEVM2wkLjqbUpFy9Dwk4L2IWnx2w6YYi+F
	msqzFwdVaQh4h0CfncAbY+0HmZTsPAqKj6MR1VbSde1hj53b5TKDaJ+L2m8F284Er6l/uJ0VmirCM
	H2tVLS+iXgtbqLGutpFM55iTaVwn9NQll6yO/96xtI4BrnU8R6okU82o+QY16ZeIGp//0TaJmcN+J
	zZy4ZyeI4iNUVXX7Kgi3NyeblIClITZYTltY57NCYcc5zQ8DfLEJ+7/00FKDU+lKmUWXTuADDgW0H
	CXMQ2C1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtuh-0000000AStO-05AQ;
	Wed, 18 Jun 2025 14:37:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsLf-0000000ACWM-2gIB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6Jfv7W89jcyNI5g8maM5e0NmglDrqdzJne5yo5vZPXg=; b=XRSFLSmwr/wou3Vj/G9npzZekv
	pQb7ZRqWYKXw0qmvws4ec3BZDODo3qM+96ykFH1HPkVubYWtf01gN/H5Gm35aQP1n5b4a9JcdPNs/
	5cwMRsLqg24OCXKO5QITirWDwSstL/MXR8M8rg+tz2XtkAuTZ87iUXh5Wu10s2BL8YW30TSarB0iF
	PXQUUs8WP0QqHPhXK2Yu3amMXsAtl4CLrKxX7HteG+NeMEaYggUnule3VhWZtCszNSNsnBIypjAL0
	j1DX4RwxPJa+bqx5+fcIAoDqmlqaWauQ0Iz2kKq3fR3OjrvMxUZ0FstW9xoHX49N1U2TyWlyw8F4J
	5gHl/XTA==;
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsLc-000000042Nq-3odB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:57:03 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e819aa98e7aso6189052276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251417; x=1750856217; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Jfv7W89jcyNI5g8maM5e0NmglDrqdzJne5yo5vZPXg=;
        b=jYaE/YPIhxbnwMGatatjUQ7wr7u2CUW586Frod6eE0+HRhTL98Bk14u51USZCI+Htc
         SW1dEH97lWHC9TePqPouIeutFDgvAme0HKULSeLTm81DcKbnDJ85aZv9WWB5Pm5jsRor
         DKqwZ9WhW8lVFsmqeXMChuRxE8F7gZH+cUGAPI5iIOYGrAhjAL1Xmwlm4+PQLLZNcd+I
         xWc+FxfwRaITvqoRv9u7BiLijZkeGenk7tP9MRgeabdpSQz3X+LbdZXq6fIaAP29ew8+
         6QCS/yWJ6proR13l7yBytmLKONnr5WrXJSsUoz1EATrJrIS3AM5Yu+NFLz4IjRUGOuU8
         MTSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251417; x=1750856217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Jfv7W89jcyNI5g8maM5e0NmglDrqdzJne5yo5vZPXg=;
        b=CrU0cqz6c1GY86BDUKxIPN0CiHmeTXIVqckhmOGG8fYxVL9kajCSSjTqaRv194roz4
         SSDxFBiJSd32U7ZxtffOTCT+BkqIWsXUtdvBZ1do/5/AjIvRtyMOdrW/cT6fbdcmTfbN
         R6rZ54UVOqLX0SYpfBf/LrSavuqQXPKsmRfhCZpkIVtDfavEb0qqskAVcHp+XEeEta8m
         U1xHAaFdcY8HUMMdH9NAL5eYaXavPVLTIRCVVYD1L6QM6lCWI8A7WDNLfqktBo2BiIdW
         hGbR6kKPSmEp4po/0xrPRnY8GKY8yD7Joh8rHXdwAk91EZZ/3zPcG04VmhbhvYSpsnky
         Tnnw==
X-Forwarded-Encrypted: i=1; AJvYcCXmEZE7tvj4HbN19+OeUvp9DFUIyKhK+s4n+rFEt6slSjS5dzCis/K+xa6X8UzlHLhdtL/yMO7sj3Bo1k6yEA+E@lists.infradead.org
X-Gm-Message-State: AOJu0YzofoFMbO20YdxAif7xvvvrFRWkesiDCs5oig4prkQAQSbUGZol
	7OozfyhoAGHJPA2PChGpYGcpk9gBL6DI5/CJmtE9RdbHimNOrh+QWjG6iV5Bu1ojJcxaoeKuhc8
	lC+Ugg4749ZA/97By0ZxcCwHSm7IdgglpnKdW2tJAxA==
X-Gm-Gg: ASbGncuJmIiBzY5mIRTzTgSeiu1yqR7fy2wS4YLxX2C35WuoOqEUX2tNbosKmE304wm
	DiavA9EFljUVydpVRe6l5BkoOnModKd9JQsV6C3LnSc4Dacf5/2KzAL3gYHlEkSEXHADTqf2lVS
	oNHUY7S0vyVYwN1P8n5jTbcpkvdwc1JiRrGietAnqr8/A=
X-Google-Smtp-Source: AGHT+IEF7aSd2gChdpDkWFgFxP4fyCJRIi/0rOPMDF7EBy8fifK6rpldismzyPaU5FnMtFjQSC8V5hmVyzcxyRjq81Y=
X-Received: by 2002:a05:6902:a06:b0:e81:2740:2d96 with SMTP id
 3f1490d57ef6-e822acc6cc8mr22162870276.17.1750251416986; Wed, 18 Jun 2025
 05:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250518220707.669515-1-jonas@kwiboo.se>
In-Reply-To: <20250518220707.669515-1-jonas@kwiboo.se>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:21 +0200
X-Gm-Features: AX0GCFurdlTWKY938doCIooXAEmUu9ZI2vYDArR38Vi5OuNwlGZr8B4vigPCwUY
Message-ID: <CAPDyKFrtp7MHMuXhhYm7c8TY9u5DoGV89x4d__gYLQSNU48voA@mail.gmail.com>
Subject: Re: [PATCH 0/9] rockchip: Add power controller support for RK3528
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_135701_105581_8FC68898 
X-CRM114-Status: GOOD (  20.80  )
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

On Mon, 19 May 2025 at 00:07, Jonas Karlman <jonas@kwiboo.se> wrote:
>
> The Rockchip RK3528 support multiple power domains, one PD_GPU that can
> fully be powered down, and other that can be idle requested.
>
> Vendor kernel flag all power domains on RK3528 as always-on, this takes
> a different route and instead tries to describe all devices power-domain
> in the device tree, even for controllers with unsupported runtime status.
>
> The PD_RKVDEC is used by RKVDEC and DDRPHY CRU, and is kept disabled to
> prevent a full system reset when trying to read current rate of the
> SCMI_CLK_DDR clock.
>
> Patch 1-4 prepares and makes it possible to use the PD_GPU power domain
> for a separate "Add GPU support for RK3528" series.
>
> Patch 7-9 updates dt-bindings for controllers not supporting use of the
> power-domains prop and enables the PD_RKVENC, PD_VO and PD_VPU domains.
>
> pm_genpd_summary on a Radxa E20C after this:
>
>   domain                          status          children        performance
>       /device                         runtime status                  managed by
>   ------------------------------------------------------------------------------
>   vpu                             on                              0
>       ffaf0000.gpio                   unsupported                 0           SW
>       ffb10000.gpio                   unsupported                 0           SW
>       ffbe0000.ethernet               active                      0           SW
>       ffae0000.adc                    unsupported                 0           SW
>       ffbf0000.mmc                    suspended                   0           SW
>   vo                              on                              0
>       ffb00000.gpio                   unsupported                 0           SW
>       ffc30000.mmc                    suspended                   0           SW
>   venc                            on                              0
>       ffb20000.gpio                   unsupported                 0           SW
>       ffa58000.i2c                    unsupported                 0           SW
>   gpu                             off-0                           0
>       ff700000.gpu                    suspended                   0           SW
>
> Jonas Karlman (9):
>   dt-bindings: power: rockchip: Add support for RK3528
>   pmdomain: rockchip: Add support for RK3528
>   dt-bindings: rockchip: pmu: Add compatible for RK3528
>   arm64: dts: rockchip: Add power controller for RK3528
>   dt-bindings: mmc: sdhci-of-dwcmhsc: Allow use of a power-domain
>   dt-bindings: gpio: rockchip: Allow use of a power-domain
>   dt-bindings: i2c: i2c-rk3x: Allow use of a power-domain
>   dt-bindings: iio: adc: rockchip-saradc: Allow use of a power-domain
>   arm64: dts: rockchip: Enable more power domains for RK3528
>
>  .../devicetree/bindings/arm/rockchip/pmu.yaml |  2 +
>  .../bindings/gpio/rockchip,gpio-bank.yaml     |  3 +
>  .../devicetree/bindings/i2c/i2c-rk3x.yaml     |  3 +
>  .../bindings/iio/adc/rockchip-saradc.yaml     |  3 +
>  .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  4 -
>  .../power/rockchip,power-controller.yaml      |  1 +
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi      | 87 +++++++++++++++++++
>  drivers/pmdomain/rockchip/pm-domains.c        | 27 ++++++
>  .../dt-bindings/power/rockchip,rk3528-power.h | 19 ++++
>  9 files changed, 145 insertions(+), 4 deletions(-)
>  create mode 100644 include/dt-bindings/power/rockchip,rk3528-power.h
>

Patch 1->3 applied for next, thanks! Note that patch1 and patch 3 are
also available on the immutable dt branch.

Kind regards
Uffe

