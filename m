Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67A3CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ey6wtgDcQ116K7LfiiQ+bxQUIrUIywSYa0E8sps1NXc=; b=v9iEd4K2+qbImUuSlM2ZxNRWSQ
	ORmfApJ0wHWof3S3AialFsc8I408GcWzDDpGh+S24cfzOlbhXqxltUhyfHEEQZbLFFZjVHQR5NjsO
	soI4VtGcd7egrWmY05gn8bQa64bIxugUx2H5ZamKObXmRtAOsSuFhfUZNXOUYyM3z2fpTdP1g6Srd
	5Mq4se9Eodn2LJhkipYEcgX1VvF6WuVc59mSqX0FQCgudtZYkB0lQLdvad9/w/B5TGT04Nv1y0u88
	bpAEwhVurqZcSdmtYLPnRyYSIRv0s8M9+8zwz38r6MRXzPQiBAsoGQg115NntwHQgW/pxUaDaaZuZ
	XfyfXH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQ2f-00000005PHQ-1sum;
	Tue, 02 Dec 2025 13:03:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQQ2b-00000005PGa-3J45
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 13:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764680614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ey6wtgDcQ116K7LfiiQ+bxQUIrUIywSYa0E8sps1NXc=;
	b=IbjlIVHEEexRMBkBbTpwQzIPXVd4O/mbz2eLxYGcfYMLPWUV/GQZ4kfdjVGXYpSZDdNKgV
	GssSGDWFgYFDfRZFUVKGKI4O4nO0JYpLDrJIHUrbB+BM0t83U/ShQPl2LvsRAzOxqFSO8/
	5rENaXxNrmkurEqn71zqqRlRWL8+qnE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-s4r92gHNMnOAtj_6_IHQ7w-1; Tue, 02 Dec 2025 08:03:33 -0500
X-MC-Unique: s4r92gHNMnOAtj_6_IHQ7w-1
X-Mimecast-MFC-AGG-ID: s4r92gHNMnOAtj_6_IHQ7w_1764680612
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477563a0c75so32715735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 05:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764680611; x=1765285411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ey6wtgDcQ116K7LfiiQ+bxQUIrUIywSYa0E8sps1NXc=;
        b=hCIYHh7hhnjJqlk9v0rzdWYdb5QiVcyiBUTNRy/dVkTS5pDIqVj61hz6mTLoOBLC1s
         XL0U9obi+hN8SEpqi2Lx2lWhtwfk9Zz6wi2Nu/pEg1nDnh3y5fWWJnwfrAXf8Eof5lyU
         wWx0oBQkI4mPYXj/qlgFpQqrON2gMtrJlVFRdMStGSOn9Wo0/429Dv9t9b0mmWl+rrAh
         fhDyMv5WR4w2FnAcVoOQElL4d49TNz0pLB3YiIvJmFwkxeBtoHyAnpJbrMnGy0oFiCxV
         GttS3cTTodIlilctGKN60iS/PNG6JWgU8SohUx62vJUFcVnd5EIWw6Y1mtF/x0RMPjQn
         NCnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfCPvoy3uZ61F7/C7YpztQWc0RgPVAUm0fx2Usq/1Zkw78luYo9FdtwCH5+e8Om+qWANuDb8YOgvoVTCGPXHWw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4oTRUH2tl4orpOL4uert6Fr/re4gkuw1O8HMpxG8+YxxF9FUv
	07MgfJaGXifO6M/HLw1AFXli8Z6Utm2+XJvU2b4CI0gSv6Ugnxw9ifXrARxdKIidKrD9jaMYyKT
	m+fjcPNt59dEULhbcINkAgUsK3ZzN7WFx6vxbRFjr90lR7TYRpmJAh743K3a6EaY4qNUqn+71RN
	EBKNJLphJX
X-Gm-Gg: ASbGnctvUS3tHEgPFqfz2YjeUr0Qng+SXzknZwfZoiK7EbgAgBpNev0hFmlKvcaYtA6
	/s1I6shWUyh4PUEGqDJN0EuI9szxC/cUh9I3w5ZbmwmTDGTICPlRHdmbgULwj4XwegJ6mI1ai3M
	kGdpAoRCjrH592hY2IEDLhMZR9UMzPgL/nNPqdZKg020qUcIhzI3Ed3601yHboVtcNms5BizLoT
	2FPdY6Hjj+Nau6SV336/vjb72pkUV4RPhu7uiTaa5SeSgElTj8byHDQEQl+PRjcLXkgWmLcJVBC
	pPv3kRqT+UHLZ4nfW70XhWw10Lq/ndVD1s+/4i3irT5QxPCyAVJReFVqysq1uJ/rRchXiijsf+S
	UewaZGUJ5eigWcg==
X-Received: by 2002:a05:600c:35d2:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47904ae214emr355760555e9.15.1764680611289;
        Tue, 02 Dec 2025 05:03:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmafT5DyC4RoGwnfp5MmrgkftnBIjDmLkHPcVwpalWPTKpHlhk1u8H7c9dIZ7UKqeyugJgdw==
X-Received: by 2002:a05:600c:35d2:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-47904ae214emr355760035e9.15.1764680610815;
        Tue, 02 Dec 2025 05:03:30 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add60e2sm355758785e9.6.2025.12.02.05.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 05:03:30 -0800 (PST)
Message-ID: <298e982d-7796-4e46-ad1d-a7f57c573f35@redhat.com>
Date: Tue, 2 Dec 2025 14:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v21 02/14] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Tariq Toukan <tariqt@nvidia.com>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-3-maxime.chevallier@bootlin.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251129082228.454678-3-maxime.chevallier@bootlin.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uRWvVckHb7BT1yTCrKJ-wHX-2VVgXycKMsVO4sx8EAg_1764680612
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_050338_273151_B31916B3 
X-CRM114-Status: GOOD (  12.07  )
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

On 11/29/25 9:22 AM, Maxime Chevallier wrote:
> @@ -298,138 +321,149 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
>  		.speed	= SPEED_UNKNOWN, \
>  		.lanes	= 0, \
>  		.duplex	= DUPLEX_UNKNOWN, \
> +		.mediums = BIT(ETHTOOL_LINK_MEDIUM_NONE), \
>  	}
>  
>  const struct link_mode_info link_mode_params[] = {
> -	__DEFINE_LINK_MODE_PARAMS(10, T, Half),
> -	__DEFINE_LINK_MODE_PARAMS(10, T, Full),
> -	__DEFINE_LINK_MODE_PARAMS(100, T, Half),
> -	__DEFINE_LINK_MODE_PARAMS(100, T, Full),
> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Half),
> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Full),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Half, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Full, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Half, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Full, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Half, T),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Full, T),
>  	__DEFINE_SPECIAL_MODE_PARAMS(Autoneg),
>  	__DEFINE_SPECIAL_MODE_PARAMS(TP),
>  	__DEFINE_SPECIAL_MODE_PARAMS(AUI),
>  	__DEFINE_SPECIAL_MODE_PARAMS(MII),
>  	__DEFINE_SPECIAL_MODE_PARAMS(FIBRE),
>  	__DEFINE_SPECIAL_MODE_PARAMS(BNC),
> -	__DEFINE_LINK_MODE_PARAMS(10000, T, Full),
> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10000, T, 4, 4, Full, T),
>  	__DEFINE_SPECIAL_MODE_PARAMS(Pause),
>  	__DEFINE_SPECIAL_MODE_PARAMS(Asym_Pause),
> -	__DEFINE_LINK_MODE_PARAMS(2500, X, Full),
> +	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(2500, X, Full,
> +					  __MED(C) | __MED(S) | __MED(L)),
>  	__DEFINE_SPECIAL_MODE_PARAMS(Backplane),
> -	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full),
> -	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full),
> -	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full),
> +	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full, K),
> +	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full, K),
> +	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full, K),
>  	[ETHTOOL_LINK_MODE_10000baseR_FEC_BIT] = {
>  		.speed	= SPEED_10000,
>  		.lanes	= 1,
>  		.duplex = DUPLEX_FULL,

The AI review points that medium is not initialized here:

https://netdev-ai.bots.linux.dev/ai-review.html?id=437cd013-c6a6-49e1-bec1-de4869930c7a#patch-1

Is that intentional? It should deserve at least an explanation in the
commit message.

Somewhat related, AI raised on the first patch the same question raised
on a previous iteration, and I assumed you considered that valid,
according to:

https://lore.kernel.org/netdev/f753719e-2370-401d-a001-821bdd5ee838@bootlin.com/

Otherwise I think some wording in the commit message explaining why the
AI feedback is incorrect would be useful.

/P


