Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BB0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NW0M5blI1g+flfpcZDgej7OD3G98bZF6Q7a2G0Rxs40=; b=PB/agLyll8AvmTxh6J+fmytPTq
	OJ91mX22UXqjB5qMevmI5995jNMOC1MqJLxKXrbm3p+1ElgZtHNtRCl22adb7fKhLgHr5r8nOWTa7
	3Bb/U2x4NAYfz2ugpGkwH4fqSidU4QI0EiG8xzDTduXdyab92KRHg+GU9mPe0K1KZUeLpNdPhuOpR
	hQop4LxqEXid+5Z1WtT3BtQT+zgMyHXxkFV/79KmU9OeOVD2gFFvGRJtxHYq4iWx77aI9vbvI7787
	rZRanzQWGXhvk0gshXVLffUAzG+Hv484Ye7pD2uRQHhvj6SfHIl18EooMzeorQxM4z5/jbs4HcZ0u
	0Ms0kvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImsH-000000076x8-3M9G;
	Tue, 11 Nov 2025 11:49:25 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vImsG-000000076w9-0Bdq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 11:49:25 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b725ead5800so538303866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 03:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762861761; x=1763466561; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NW0M5blI1g+flfpcZDgej7OD3G98bZF6Q7a2G0Rxs40=;
        b=ZgbiJyvBoHpwWMvVnGaa/GGF37g/QNjs4znRPfiXOMqbsgqhJ790kmKs7ciQTaUgOT
         v7liHmDWLsCMmjtv0uWoiAcWro+XatizJfLC5hf5W1yFMuI4tIYnQl6xbne6Y+8KG0C4
         tdbz6iFJk+Yw7rTjmHV7MfCrmorW6tafpjAw0IclJzdheGy1kCFSF2RNY+44qpKSRV5I
         9ducBTCkIeFZn/+O2o150CGUqvO4zuSFoqQJ9VA1vzkjJEo3Y2Cg8NpBTZNjQ/9FslRb
         UcCTa6xIBfy8Co2dyOAHg735wH2oT0EAz48Rrv/5fJLmvIeoh9Rm5cDariixScfg6stl
         5tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861761; x=1763466561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW0M5blI1g+flfpcZDgej7OD3G98bZF6Q7a2G0Rxs40=;
        b=oeUvg5+f2UsoMifBG6PZgI4o5vtpBaIedqI47RdiZm0uPUyGOiVP3xIL7jknUjsSzP
         h52q+y5KiJT8/qKk1RWDhiAanHi3OvjSn1nY2uTgGog7DErdkSBNhqfVcC9X90lQdVjw
         /e4oHfHw4I5pWhuRJGQ+dNWXu9uLa85fhOF/lEXINU/gYyR3NnUkGOa9yH8QDP9uXncc
         Hh21lSRjZmGZUq0aYYgrkTAhHpgruUkaCfOa5HXWs2n+6Q5qkhqxbvPtthUzGbiaGUbO
         QmN0TadFIFvSL3a0UVoycuj/qanCu7Fz6sgQ0//gB3tdkxFc5s6ECQDW35/wtVLOc6u6
         FkSg==
X-Forwarded-Encrypted: i=1; AJvYcCW5qgvgNZBWnsiDr1bTobWLDmLANTpdNaNthYSfn6OA0ZKx+jEZdtEQBDUXKRK3xlbnITosMX/vvQGGIFUDye2L@lists.infradead.org
X-Gm-Message-State: AOJu0YwPfvDBobO13AJ6lQhZ4jR/JGR/LbQ1yE7AoGCgpHgtjQAbMs1O
	w9/gQ0+KemuzUJynQLGpW2MCDgzbNWrnb09lTMTFkTNpx2U4bt8U+N5QAiV9T3GPl1Y=
X-Gm-Gg: ASbGncvLWKVUv6ctIuKc1w2L8ASgVJx8Rn+8vJzqdmPWzoNKYlE3zn8l1sg/FANIRT7
	tJwy6bQJAx4NamGvgu5+JHBwKjKkWwfnO2UyvGfzO4zZogy0NwP3Uu1nVeRqOaUa68Ev84cvE2A
	brEJ6NaqJ+ws7VT6De+/Vf5WfHlHgVn2WpNbYQpsO9i4Hj9t+HcYH4RVyEcib1/kkImF5v6bS2a
	l9lO3yWR06kqthnz91Cve/R6fW7FlwuejONJvoBjUvBaM8o2+XpShNg602+WPIGcbE0ndReX8WZ
	vVW5fcR9kzznndlSymi+QvHAgCmLEVAt9RFAQEo5u5CS8wz+yBhtqxK+TrHDnzLSuR47q98204W
	XraiSJEvufwIvWNzqS414iNXk5mFyWH7BkxBjqXd0VOzGnZpdar+TGYjEpU90My1YG+pu4g/jx0
	C/xVBz8n6yw/Voc5jF/P/RZKClzVgR1kD+v3T+1ovjEOF7cg==
X-Google-Smtp-Source: AGHT+IEur0fUlJ4dCFXlsi8JzvD/wZ2A9nQhErrr7cgLwLwwk3uLtEzsliARx6fvO2CXD/kozSEzLQ==
X-Received: by 2002:a17:907:9716:b0:b70:f2c4:bdf7 with SMTP id a640c23a62f3a-b72e04154acmr1265627866b.31.1762861761499;
        Tue, 11 Nov 2025 03:49:21 -0800 (PST)
Received: from localhost (host-79-49-235-115.retail.telecomitalia.it. [79.49.235.115])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcea51sm1319505466b.4.2025.11.11.03.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:49:21 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 11 Nov 2025 12:51:40 +0100
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Lee Jones <lee@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Willow Cunningham <willow.e.cunningham@gmail.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Saenz Julienne <nsaenz@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 1/4] pmdomain: bcm: bcm2835-power: Prepare to support
 BCM2712
Message-ID: <aRMjTHnmsw98G4iX@apocalypse>
References: <20250917063233.1270-1-svarbanov@suse.de>
 <20250917063233.1270-2-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917063233.1270-2-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_034924_105039_5C972FC3 
X-CRM114-Status: GOOD (  22.30  )
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

Hi Stan,

On 09:32 Wed 17 Sep     , Stanimir Varbanov wrote:
> BCM2712 has a PM block but lacks asb and rpivid_asb register
> spaces. To avoid unwanted results add a check for asb existence
> during probe and also add a new register offset for bcm2712 to
> control grafx_v3d power domain. The decision to use the new
> register is implicit - if asb register base is null then the
> driver is probed for bcm2712 (the other supported SoCs have
> asb register space).
> 
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
>  drivers/pmdomain/bcm/bcm2835-power.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/bcm2835-power.c
> index f5289fd184d0..1d29addfe036 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -79,6 +79,7 @@
>  #define PM_IMAGE			0x108
>  #define PM_GRAFX			0x10c
>  #define PM_PROC				0x110
> +#define PM_GRAFX_2712			0x304
>  #define PM_ENAB				BIT(12)
>  #define PM_ISPRSTN			BIT(8)
>  #define PM_H264RSTN			BIT(7)
> @@ -381,6 +382,9 @@ static int bcm2835_power_pd_power_on(struct generic_pm_domain *domain)
>  		return bcm2835_power_power_on(pd, PM_GRAFX);
>  
>  	case BCM2835_POWER_DOMAIN_GRAFX_V3D:
> +		if (!power->asb)
> +			return bcm2835_asb_power_on(pd, PM_GRAFX_2712,
> +						    0, 0, PM_V3DRSTN);
>  		return bcm2835_asb_power_on(pd, PM_GRAFX,
>  					    ASB_V3D_M_CTRL, ASB_V3D_S_CTRL,
>  					    PM_V3DRSTN);
> @@ -447,6 +451,9 @@ static int bcm2835_power_pd_power_off(struct generic_pm_domain *domain)
>  		return bcm2835_power_power_off(pd, PM_GRAFX);
>  
>  	case BCM2835_POWER_DOMAIN_GRAFX_V3D:
> +		if (!power->asb)
> +			return bcm2835_asb_power_off(pd, PM_GRAFX_2712,
> +						     0, 0, PM_V3DRSTN);
>  		return bcm2835_asb_power_off(pd, PM_GRAFX,
>  					     ASB_V3D_M_CTRL, ASB_V3D_S_CTRL,
>  					     PM_V3DRSTN);
> @@ -635,10 +642,12 @@ static int bcm2835_power_probe(struct platform_device *pdev)
>  	power->asb = pm->asb;
>  	power->rpivid_asb = pm->rpivid_asb;
>  
> -	id = readl(power->asb + ASB_AXI_BRDG_ID);
> -	if (id != BCM2835_BRDG_ID /* "BRDG" */) {
> -		dev_err(dev, "ASB register ID returned 0x%08x\n", id);
> -		return -ENODEV;
> +	if (power->asb) {
> +		id = readl(power->asb + ASB_AXI_BRDG_ID);
> +		if (id != BCM2835_BRDG_ID /* "BRDG" */) {
> +			dev_err(dev, "ASB register ID returned 0x%08x\n", id);
> +			return -ENODEV;
> +		}
>  	}
>  
>  	if (power->rpivid_asb) {
> -- 
> 2.47.0
>

Tested-by: Andrea della Porta <andrea.porta@suse.com>

Cheers,
Andrea 

