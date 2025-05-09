Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9654CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4Uql9FGLTVlEeTvTiR6Hv2yM3XCt18Cz9u3UYLPICs=; b=PbabdUQnTEKdTti3wZeR/bSOnt
	hnH88XeMuUDDjem/q2OJVe7JwsnDbZ8mj4Z2qYbubrb8B6vVdKzlbAOzjabzwZvaApf8ueSVQnPAq
	Nh4EqBy0cQIpP8US3CUSogM7t5FFq3TQvXeWdFcx4Fw8BvFkhQXCo8rN65hxtO0uj/bLniHGI4/fE
	D+1LBO6wY1HmMMj1Z0vj6AknAhNq9oiAwxp6NXDrKm//fgWYxR1mydA/S6AS5z3OST4lTqJkonOju
	GZ5yFGZLCA9lDoU/cKAflVA1KqlJlm4pZNGMpc8lQKqYHyXfM67Dy2wZYkPFlS+w/131LAN/mYss7
	xm4KboPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDGU3-00000002X09-1T17;
	Fri, 09 May 2025 05:41:19 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDGS1-00000002Wmg-1aKo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 05:39:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a0b201faedso243837f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 22:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746769149; x=1747373949; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w4Uql9FGLTVlEeTvTiR6Hv2yM3XCt18Cz9u3UYLPICs=;
        b=MSildAsphVK9jSrsB+n7sZttOV+HM9aPdE2zvA1DgplH9gGLwDowa34Rm1+NsuBtK2
         9Xw+/UEAdsv1ccWIBeJ+wlwPk7tUil9iG5Pm4HQvPNIPm9KNPsYoN11C9lavCGBBd56j
         Vk8IgA89z6QmRmuNUNoRqk/7sFejmCfR/touUXpx4bzkT0YivnfYBGZfKxr0oIwgBfvI
         9/6U3dyBYD7TROoCboSEyKQJMwzT4ujDjfGC6Tzyvmy5VjX1jW91zN3zHR7K7cEdIRbv
         IPbzqrlBETEE/eJB+e8+QnsPgqIw0fKde2OsVNauFkbkQxF9jddC7qX+6jpBVKedqsy1
         YvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746769149; x=1747373949;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4Uql9FGLTVlEeTvTiR6Hv2yM3XCt18Cz9u3UYLPICs=;
        b=knEbb0TGkQ7BHBiX8bUoUUZq0t9VUeNDAVbd+oBrUYnMu0R0fKMBBVNTsv535YmeWL
         o5eYZZ/eOAiFz5JNFapDFYx/0dfYIGpnoipSrLAal/x41hNlPkKpFKLixTrxKR8yAbCV
         B7dla+wiugOY1aQNRuMEqAKqTKitkeAqSvgIMHPlxX2J+uDZEG9DwBmDr6o0EV2s55ml
         PwshPFvGfO0jRapzeDLcncrzMuxKUt7s5OA8rzcLlFiWL+filAjNdSL3RVRwTedyFmJj
         hMyV+IBNOzqtI3QcG2du0FedhZy8pjmESfuL8aJsMR05AHa/UL0/vf4thpzyKy1HGMWK
         6uGw==
X-Forwarded-Encrypted: i=1; AJvYcCXLurOU0TBZkRYIv+1bnGbsJwEDlhozL2BnLjW8HaT8HqcEi87+LVv48eWTcS+z2GTlxMeKMwxYvRgg2+OFGgWL@lists.infradead.org
X-Gm-Message-State: AOJu0YzIBokw24Mvf/EtLdozHD3X6GNUJpEuXLSxQvyJezIFX6El32nG
	0RmI0TvoJ5i4J71xCtxo1+rd5kj9hNQXtg8bIX6r5OdS1sjxZyBifNko3OQGlRM=
X-Gm-Gg: ASbGncvJ9FwtgJPhBHqBBcjmDBEcvX9aBEmmz+5xfQQtYFiviN1I8Vbw2iTGVBm3X1V
	ZRWcrDNWDEU9wpTnoSBC2TetrZrQ0xX/IZ2w6qZMPm+oFM1t6WCxDJMsem6KD7TUzQlCZwIrLma
	d596PQopS68CymJzO+vEXBY8Y1KKIkfVBvbPxVeFKc0HBTKvWCq75bR4xPwPkaXqMq4WvCZ66xy
	oqEqctTSQx9c8oGhT9JZJyZ4W0UqkULAD8R3OFWCD5f8O8/ls/DglncagGJtyw1DhlKuk2NqnRA
	SyUyQtXZyByvAd7F0NsPWgN9DGIT3Q/FDTgxvd+gPK6fFppfgGP32KwarDE=
X-Google-Smtp-Source: AGHT+IGPG/rVZrbIMQc5TYblcq4TmgDizGdIwPJnmiWxzsz2F9LWgmGSpQ+eSYFI9k+rCPof4hbudg==
X-Received: by 2002:a05:600c:3490:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-442d6ddd6a8mr4892685e9.7.1746769149115;
        Thu, 08 May 2025 22:39:09 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67ee275sm17155305e9.19.2025.05.08.22.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 22:39:08 -0700 (PDT)
Message-ID: <6e119dcd-1952-488c-8456-22990f46cd83@linaro.org>
Date: Fri, 9 May 2025 07:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
To: John Clark <inindev@gmail.com>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>,
 Andrew Lunn <andrew@lunn.ch>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250508190538.22295-1-inindev@gmail.com>
 <20250508190538.22295-2-inindev@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250508190538.22295-2-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_223913_411189_DEB4CA70 
X-CRM114-Status: GOOD (  14.03  )
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

On 08/05/2025 21:05, John Clark wrote:
> Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
> produces development boards like the Luckfox Omni3576.
> 
> Signed-off-by: John Clark <inindev@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
You already got this feedback and still did not respond to it.

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
of patchset, under or above your Signed-off-by tag, unless patch changed
significantly (e.g. new properties added to the DT bindings). Tag is
"received", when provided in a message replied to you on the mailing
list. Tools like b4 can help here. However, there's no need to repost
patches *only* to add the tags. The upstream maintainer will do that for
tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

