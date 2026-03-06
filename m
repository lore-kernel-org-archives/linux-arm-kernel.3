Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965ADF33A92
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6ojT6B2pOAcNJA8AKYZusnktwWBE0CvG4HxrGkb5jw=; b=CvqbKYCKLm5ZVmz3T4UEJ4eiIL
	cu9AYmYfCmnG2GIlvRXbArJWTvgDSlaBmYoGiM7QLmXI3dnfPBt/9CIlJ4loRZVo3WbWAgHwVdNMP
	y4TX/qj7Lad5cDUW8IcxtOogjCEDLzeXaVFzasufoBZxiaMXTlG/AleN57umHh/SWOHMhEEqR/iW3
	zUw1Y6z2cY62NZUSYV2IMU13YlfdmX7er0LgSo7G2ufrVgnC+e6osh8mcEYGQFpiQn2LcREx8sY3X
	p78WCOHjeXqXJfvWx1VZx6f+WUKS5N4/sTPRsNV8A0zS1LJ1PjbPh5NC3bVK4n7BXeYxGfWvcrtXo
	Y5gQCk9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyW4O-00000003tqs-0HVb;
	Fri, 06 Mar 2026 14:22:24 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyW4L-00000003tpp-0Dox
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:22:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6611d20c026so4075552a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:22:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772806939; cv=none;
        d=google.com; s=arc-20240605;
        b=V/QHvI9E8aYSyLeMTeakNZ1yR8S0hpGuYZ/sjVCZtdlxjvbRkS+vckUPAlVNdyg94+
         Zzfce+ZuYzXDoaZLhUn+9aQTvG/fpNtnEPZMDrNmuXau5imz3rxMftNLfeC6rHenFfu+
         /5tFmwkNL37ZXocB4pCOLIw73cnNn7EmlxonrpjrhES/85sm6QIqwgpRFQz5v+GURfjE
         eV63NsVm/5HcVBZeJ2cv9yDijNj99N1MVUrY7y9Raf0OThcMjM0gDxLg2EaFPhqqjehH
         lVd4im6uCgvcjfrR5ZcxhUwCjJCXWyeggTC79YQ5RLzo4ljE/eGscxHeAJzfqBNSqgC0
         6J8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V6ojT6B2pOAcNJA8AKYZusnktwWBE0CvG4HxrGkb5jw=;
        fh=IFXv19YDGAhqJXmI9oeT700PTUbSkfa9+niqRkJJo24=;
        b=ScLeN1MusjTa6XCSxZIjFuN7ssS5DoczofA1OSCg74RZA8xRawTRVRiEoQtDBKwgJo
         C+1tx2ftZe6q7ZrLOs25elwrTUN+xDjOFfNPCLXhWofjJrz9Hkig1gzArejEma9EnZxi
         VBwR2c0WsrlPVNi3PKh7QO10WvojttRA+2s9i98IFW/9eDaouXehWMsXrYtLqfe4ny7c
         rAgM49mmIOokn2SeaMjtHl5WiSJ3vlJQmD3Wn+8gGz7HeFBahtxwOeWoiq9bl8P6GJZ5
         qOkJTai6D+LskYSxOTQ7MK5XBLE64+RMptIsRNdTlawHwpB1ranobVkhIdImNfeN1m+F
         O4nA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772806939; x=1773411739; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V6ojT6B2pOAcNJA8AKYZusnktwWBE0CvG4HxrGkb5jw=;
        b=PcaKR8hU6CX0OdgxiLhRyTeGXCc6ELGO6j5z0Xgd4boEXMIFl3qxzrQu/wF2DsOlg0
         5Xx8nNWFZ8kOE+9A3V+AIVQe38F0ss/wwRwBNu/rZ8pleTmtDAE5c7903zdSv0QbpcCR
         wQ8kpv7lNOgY3mjr9j/Ok+ygQ+KgMNafjMuD72X9Jy2W1caJKRPgBf3KX4OsmlpdjZxj
         XP94zbS182/yyOx2vYhd6Q5D1sOpVe6PYyG1nph+ey6cGPFMEuxDBCPMRIEWbHKYMjN5
         G0JZ/KXvtS1EdPizZpi7jAqejul86Thg2ldTGgR1Wvr6XhqHCcprHu/YvIyRTLVvXvJT
         FbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772806939; x=1773411739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6ojT6B2pOAcNJA8AKYZusnktwWBE0CvG4HxrGkb5jw=;
        b=nW21Z10E52NGPA5WFprcX8miu1AdAWEacPDmAmmPUdE2+Ft2oIwmdvc9XGzFUYZk/p
         rDKRW/d0ArJRdA/hpEEKfCiKV0WuyJUw9NoqOa1jDDyZ+Ag/0cuksQ879pHR/uqRR6j/
         e2aMnM2hOzhPOgpqKuL6BWvGxAS4Y9ADFxY5qwS2kXRN4hFWY2tP2Yrqi+s6lNqWF8cc
         C20f8s1FHPzjQT44cx7D8GBtiXvDrpqe4OPhKv5ORsMOVZT0EYRSlLfuikv8Grk2kpL5
         2SKEjUmAOcXVOQWJnXOjvwC3y8YPkmj3rkd0IR657X5eH8zUZAelpeMaHdSrKnfLiiEL
         VERQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKTiXMPWkrV+oNSWylfDpoFiIkOduuOhYuwTpGzruRXdaPSX78lDgoQKPeZ6Q4kqV2K2yLW882f5mC4BxsZFL7@lists.infradead.org
X-Gm-Message-State: AOJu0YyVojjLb3MAvEelEg3xPXqasbs91B8dkFEBsfceMbRogjZ54Lrc
	HVGIOM7zlqw5WAkKGsarSWnBVv1/Ngegn9hUpjlJaOLn/14nbSypsn9F4u2Dn6RwvEKqBYkdNpx
	mFlBQ7vkCVcS1Lu/FGNWmk2GR1T1zGx+AN/v7jByPSg==
X-Gm-Gg: ATEYQzw7s9EwSFaXQnhKxHrHGBJeBlrnrEtcgmDrePQ1jRthQGcjARYBE/axju0+Pcp
	9EEj+3HDI1Gsqe9cboftsGmi26RJOlWdcpCtFN4y5dsNDHBtyQJqUohGNIbSb38YJ8bwqrb8QdJ
	ncNXjN5O6TiKAvakoq0x/5g+f6ciVkPOZajm8oOgxp4bxIrH+AmG2Hmii7Y4NPFPmvA2mqmRTc9
	2+fJ2ALGKmispri1dj7D7ZZlwhI+ZTkjVGK5Z+VumpBmnL/0/7J3h/1csAlH0Os2NBpGHBUnTPM
	5rakQ6+pV+3oBbmPgFcdKiE7lRfCuMWV2jrtuzKCMw==
X-Received: by 2002:a05:6402:13d6:b0:660:f1a1:e8fa with SMTP id
 4fb4d7f45d1cf-6619d51f8a8mr1194732a12.15.1772806938879; Fri, 06 Mar 2026
 06:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20260226-exynos850-cpuhotplug-v1-0-71d7c4063382@linaro.org> <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
In-Reply-To: <20260226-exynos850-cpuhotplug-v1-1-71d7c4063382@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 6 Mar 2026 14:22:05 +0000
X-Gm-Features: AaiRm50tjNf_4y_LSd43JUB-JI4HV8BibVu6BzHdRNYQHYI0j8IJYTG4MdR3kHI
Message-ID: <CADrjBPpfSLN9A7jjxiVSYL_5__kZmxdP0H6+UJiK563KpvxTLg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/8] dt-bindings: soc: move and rename
 google,gs101-pmu-intr-gen schema under soc/samsung/
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_062221_107085_F9A85358 
X-CRM114-Status: GOOD (  18.04  )
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

Hi Alexey,

On Thu, 26 Feb 2026 at 15:47, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> The GS101 PMU interrupts generation block is actually a standard Samsung
> Exynos IP block found in older SoCs like the Exynos 850 and others and
> not exclusive to Google SoCs. Thus, renaming to
> samsung,exynos850-pmu-intr-gen, moving the schema file to soc/samsung
> directory to reflect its origin, since Exynos850 predates GS101 SoCs,
> and preparing for adding Exynos850 description.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

I'll leave it to Krzysztof to decide if renaming/moving makes sense
and if there are any guidelines/rules around this. From my PoV it
seems likely that there will be many more Samsung Exynos based SoCs
with this IP than Google designed ones (Google SoCs I'm aware of with
the IP being gs101, gs201, zuma and zuma pro).

regards,

Peter

>  .../samsung,exynos850-pmu-intr-gen.yaml}                              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
> similarity index 80%
> rename from Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
> rename to Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
> index 2be022ca6a7d..f9b40f3fd165 100644
> --- a/Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml
> @@ -1,10 +1,10 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/soc/google/google,gs101-pmu-intr-gen.yaml#
> +$id: http://devicetree.org/schemas/soc/samsung/samsung,exynos850-pmu-intr-gen.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Google Power Management Unit (PMU) Interrupt Generation
> +title: Samsung Power Management Unit (PMU) Interrupt Generation
>
>  description: |
>    PMU interrupt generator for handshaking between PMU through interrupts.
>
> --
> 2.51.0
>

