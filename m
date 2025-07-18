Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1996C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8G9viKp190Snv9/y4e9WNoJDJ/21KIBMuhohTjZv+R8=; b=NKHUFeWIYCsV8UThcTuEloF6OF
	oyNMMZqXs0msOkRLHQ8z5lD3wvjLpPr6X+EoF9wORRBhxdxK7z5dMmH3ZK8tRInl3JHJea2LJnfNH
	2LU/UNhTV/zOsfLD+r31uZL8KepHDFhl5/EAWyPAEeTRb4W5nLqYB3kX5y+T2ZO7MZsnMBrXkDpIt
	UT+q14G1f62nirkYwYOb7zWSDA/sBXfUScVdX9rE7ugNBUL203FMyuyDQyD2syyyjCSf6NFF3DMjT
	bjXaxNrBUUnue7mf0nAbBxsGlqQH/L+0+UhXhtYjbxKcY7lRdU6xaFVmBpFG9wVv2oeVSNgngDRue
	yOS3fiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucjuB-0000000CY6f-1vnJ;
	Fri, 18 Jul 2025 12:09:35 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucipE-0000000CNnm-1CMY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 11:00:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ad572ba1347so263333966b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1752836423; x=1753441223; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8G9viKp190Snv9/y4e9WNoJDJ/21KIBMuhohTjZv+R8=;
        b=qt5TD10doM4BeVsYCHRGefyFqtVJr8RcDP3DSyN63iwtYb9P6KdweOnX73fHtp/peT
         2EZMNlIZDl+tBh2HZSjBJ2GsjqtdgOiBwnAQyOyw/mWSXZpKRF6GfyvQ60NU0M6xWue6
         +CnMVsDiR1/wl69WYND6GdoU28qwSeo5mXtGUkW8tJvyR75xLl7eu18IwpNKtpbKT0Tx
         XFID0F65pxUdmPZU9dn5eaPprZzwAGa6riMOloHynab3zxMe5mALeWYUo/j+yX6wxaEB
         fJJx6B2/22wzfMfB946n9paDaPMu2EZM/RT4tS6mQh+V7CXcQlKrtgqeZR3stuho6zBT
         RwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752836423; x=1753441223;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8G9viKp190Snv9/y4e9WNoJDJ/21KIBMuhohTjZv+R8=;
        b=FeL6CFSwX3RwOWHlMxx1VD2WJjctArVPwUGijBlZE10P+WbeR3OapHwV+hgkxU2N/q
         iEHHqC49Xd7KX3/oYt/rMQNdLkoadc7hKRB3WJZdCf309E/4qhhYsthOqxyenqLa4UhJ
         FjWiSqriP18USvSLJCurCEpQ/rLfJtoeJCILddaD4TjwI3LOSjJRu0hqceRL/pTtnFAj
         0eXyj8W8dC8wWkwY2FWQOHUzVXP40fMsdeFXnieA438exbH40bLDktuoleZ1ksdpC8lX
         s8DExgMFXTUEjbOTvw3vcJ6/w56u5d/wGj5vXLpL2b/9aWoMiOO5Ry2NdsfB3ZglW3Ww
         vKjA==
X-Forwarded-Encrypted: i=1; AJvYcCXxji0MPr93T4W2pkXpRbWF9CwP5fmfkFYigRPiEaEsuBJpIrlUbu6Khpvtr7zVqPNfXPwaAyKNdbhgdJywQvR/@lists.infradead.org
X-Gm-Message-State: AOJu0YzGgGFoNeDpYZM6NSptsurTABuIyjeQ928z+171FDMWWLVXA5h/
	SxEWt53cWmVroXrYGw5E8uNLHg6NfC4Id9bBXjslDYDrdvTHlMK4ZzD6973HCmbiwNE=
X-Gm-Gg: ASbGnct3o5ckoW/3ydBXw1/u0R6wOFhCumiXoGlyZ+dGgNUXHb1o8Jk6jZAew6jl5LG
	4J4iC7JgvkxP97Bfqam47FsEO8yeFG2MeBJmICJvx2YUGM68ldP6GMDRtzgeUrHZUEbFKn4/Lfg
	V7XIUEx3sTcawViXt+xxuJtAOpmOqBhnhBSg/PB2r+D8CMwPxpDqMzZPy9pzbuxOJowBw4Ppg0M
	e0/3TQ005bttHkZzMI9J2BrzFZi7JHBw80bRiVuqzJ7RRyIMs39u8DsfPNGh6fzGuI1A3+RpJLa
	+oEz0lZaz7EnrAPDCI+dn6AHgVZ9VtZkgflcWLI4ddvaZHlakNDAt9h7IZ1gY9h/2XomUVOKfop
	fkE4uXf7nhBamNAMvF4SEltSJNnOs5w==
X-Google-Smtp-Source: AGHT+IEWR5nv/oQJzwgF0qcajAF2Z8LBQapmjvceGu3HRHJPS7XWZrDCVWw4hyx2KUGl8xQpn1ru3A==
X-Received: by 2002:a17:907:c5cd:b0:ae3:6744:3661 with SMTP id a640c23a62f3a-ae9ce10c4f9mr786897166b.44.1752836422360;
        Fri, 18 Jul 2025 04:00:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79c6a7sm101144766b.26.2025.07.18.04.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 04:00:21 -0700 (PDT)
Message-ID: <fe20bc48-8532-441d-bc40-e80dd6d30ee0@tuxon.dev>
Date: Fri, 18 Jul 2025 14:00:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] net: cadence: macb: sama7g5_emac: Remove USARIO
 CLKEN flag
To: Ryan.Wanner@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <cover.1752510727.git.Ryan.Wanner@microchip.com>
 <1e7a8c324526f631f279925aa8a6aa937d55c796.1752510727.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <1e7a8c324526f631f279925aa8a6aa937d55c796.1752510727.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_040024_500936_3899E33D 
X-CRM114-Status: GOOD (  15.38  )
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

Hi, Ryan,

On 14.07.2025 19:37, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Remove USARIO_CLKEN flag since this is now a device tree argument and

s/USARIO_CLKEN/USRIO_HAS_CLKEN here and in title as well.

> not fixed to the SoC.
> 
> This will instead be selected by the "cdns,refclk-ext"
> device tree property.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 51667263c01d..cd54e4065690 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -5113,8 +5113,7 @@ static const struct macb_config sama7g5_gem_config = {
>  
>  static const struct macb_config sama7g5_emac_config = {
>  	.caps = MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII |
> -		MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_MIIONRGMII |

Will old DTBs still work with new kernels with this change?

Thank you,
Claudiu

> -		MACB_CAPS_GEM_HAS_PTP,
> +		MACB_CAPS_MIIONRGMII | MACB_CAPS_GEM_HAS_PTP,
>  	.dma_burst_length = 16,
>  	.clk_init = macb_clk_init,
>  	.init = macb_init,


