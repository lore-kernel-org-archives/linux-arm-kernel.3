Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46274C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 19:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2hJc4hUnpKA+D5XoufJNAk6lZn4GYmwTvIaYpB/Ywo=; b=EvXVLFcyUodELQ9nLQOLZt7kXX
	wU4YRQmK8CXq03wUQc5DQzWpzvrJrEqfsphY2Q9qSaXZVfgjJM71MBE1hjzwIX4V6dFiVa7SpwvBO
	yNZnX6BEvoP3sN+Ds0lKOkq7i1tkqMkNUWnglu3eFFRhORz6kMdYKVPegCeBcU6aKiBeNTFsZzzCU
	M0MYO5FaVTkpwB2Mk8ZPdmamgstuiFsFfHVd4I8gm+0TbZlm6XF7N8iCTo/efTLq2BkTMVbFrixun
	2Q0ABGgQY7hifVIYl2MBoR1+7XOxi6ut8pfrF3Stp/VVgY6xxliQaAInOnJpULf4P5bfvyt+PcnYm
	IhqKj5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9jE-00000006fSx-3xAt;
	Tue, 24 Jun 2025 19:54:48 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU6I0-00000006FPH-3rT6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 16:14:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-adfb562266cso127627966b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 09:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781667; x=1751386467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B2hJc4hUnpKA+D5XoufJNAk6lZn4GYmwTvIaYpB/Ywo=;
        b=Z5Ejouz+PhmrG107h0jqDeJ91ehsr8PAgYz4M49hN7K8JX3yxFi7/ewrZE5OOpuhJ8
         xniyzIalVqGMmECblRQs+MXtXW/f3ftUq5GI0i33Vb5Hyf+rxoHMf4bHyG68jWzAoJwo
         thwU2e3PEQaFB/Sg7xIRHFhfusx0j9ZMwYL6HEh1cCA80dUAG1HluhNKeeqldJwLyvOh
         5u+BrwGbNykKbJLF18z5G1JCXzuGd7LfpnLWvAMe9tiaT6xYoIsaQGOecdFQ/s87Nd9l
         L5+JHHsmVdfVDQB7qnqoKZeU/Z+09ZJKSKdDUaNCeyxgAczSavicTOSd22NHRJTFBnR3
         mZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781667; x=1751386467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hJc4hUnpKA+D5XoufJNAk6lZn4GYmwTvIaYpB/Ywo=;
        b=aqnEaGo3gi+aGXEEJH/mtNW2DRsuqePLlejMEF4m5wrxBWDuIFDKjCGj9uj5f1in1H
         WtAfhaHGgRSXG/2/Fgryq2rDSn15P7oqo8N5yjFlxaROarQYOJPOSdxwTu0SXWfJRFaH
         Jq5C0YpvmeNMFy8uc4WKEsT7+2DQRFyo3YvaVt1g72eyW6JocG5j8fOsO5G9qkECKdaT
         hKN1ZUgYqVTOeXDmTo8fKSGA1yc4+vDVO/yIENovh5IPeKnp/21zN+NCf6BTBe+5kJqZ
         MK2u55vN2rXaVuIyuGJJop11j2Ejxhl0GIJLKeV024TjPdGOaKzuUDcNQwqZ9ZQogxdh
         0Zag==
X-Forwarded-Encrypted: i=1; AJvYcCWJcMLsdBN58/6p/L/KSYHHhh0/SQkgEeDLUSEU2/qmRNFNrbNazc1XhWoHnyNd4h9zjxfEpGdjO8BTzfJtwcuN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm+bo6Gn+c4NdBnpFauBm+A7Gkf+W/hif2Xo7jIdNNaridPmiY
	EQTwRMq8tt09r0pZY1RTdSefj354pJL8Oyn3GP+E4oNeFJXw4cHI7p5v
X-Gm-Gg: ASbGncuE/0Wzb7kBvgyf1MUchA5aNHomSsDmzQj+bEp/4Mpz844Wqc6arpyDOm87QP3
	gOPtBec9bMh1pJR8fLE1NxoLYycKkICfoxlisaVW/SSxk+DxRiKgC+pAlCv9Ec0pvErGkAm733B
	aiOHpc2CCup259VAmYyo0qEEJQufmNLWqtiXTnxc4zalFhdb01mRcvOw0r5ARJYiIM6+zcdmlFP
	klDtSF2MOLRxKQ9mT7Tw3YGD10nP3EW7i5tUA/OdIj3Dko512ydQ8V3k+FnvUqe+Yidr7y/n5QJ
	c7BV1lt8wtkOfiWdvXuGz4IVvGWJ8SKa+fvlXHupT5iy1JX+fM7/KEzAjKZjvPGShDl5cb2W9R6
	RnMhsVkut37kpVjkNysSNw2n5jdCikhcHB5Q=
X-Google-Smtp-Source: AGHT+IETVYqdcYw9iMsIySmRYZrHTjx3OIsh3aRt5hqLHb7AOMHCIRNujIA0merX9VFaG5IGMjGEsw==
X-Received: by 2002:a17:907:d70b:b0:ae0:b06d:1fb1 with SMTP id a640c23a62f3a-ae0b06d2370mr278552966b.37.1750781666584;
        Tue, 24 Jun 2025 09:14:26 -0700 (PDT)
Received: from ?IPV6:2a02:8109:8617:d700:9227:164e:14d5:9967? ([2a02:8109:8617:d700:9227:164e:14d5:9967])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7c6fdsm888167166b.3.2025.06.24.09.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 09:14:26 -0700 (PDT)
Message-ID: <49977010-65a5-4ad7-b86d-5e779d0de3de@gmail.com>
Date: Tue, 24 Jun 2025 18:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/19] dt-bindings: media: i2c: max96717: add support
 for MAX96793
To: Cosmin Tanislav <demonsingur@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Julien Massot <julien.massot@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open "list:GPIO"
 "SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)"
 <linux-gpio@vger.kernel.org>, Cosmin Tanislav <cosmin.tanislav@analog.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
 <20250618095858.2145209-7-demonsingur@gmail.com>
Content-Language: en-US
From: Martin Hecht <mhecht73@gmail.com>
In-Reply-To: <20250618095858.2145209-7-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_091428_964085_4CDB2DD4 
X-CRM114-Status: GOOD (  16.40  )
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

Hi Cosmin,

I'm preparing a test with Alvium + max96717 + max96716. I can't see away 
to overwrite cfg settings to force pixel mode or tunnel mode. Any plans 
to add this? Sometimes it is required to force the other mode than set 
by pin-strapping.

BR Martin

On 6/18/25 11:58, Cosmin Tanislav wrote:
> MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
> links.
> 
> Document this compatibility.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index ab46a5f0bd7e..23f611177a87 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -30,6 +30,8 @@ description:
>   
>     MAX9295A only supports pixel mode.
>   
> +  MAX96793 also supports GMSL3 mode.
> +
>   properties:
>     compatible:
>       oneOf:
> @@ -39,6 +41,7 @@ properties:
>         - items:
>             - enum:
>                 - maxim,max96717
> +              - maxim,max96793
>             - const: maxim,max96717f
>   
>     '#gpio-cells':


