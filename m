Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DE7D64076
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 00:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ko5ntTtP2w+Sz2PCh54+SIltSsYjcVHYUqvHuhsGxIM=; b=TRMrBKFO6zsA48FR9pF6rHft9m
	JO8cwRjI2jANUpyJCqB7SH+zu8LOhcAmlohEDZg8ZhQMAl8xPk0TFTE9oWF7beGlQwkrTttNuQSBI
	xuSjYbTgVcBkbc+l7QCDJVrlYO4AGZ0pmLjLzXQkhE2Xi/S0JwCaW27xs8F6c0ms2A/APIgh7JUI2
	Da6DGZbDz+CISJIweKGEhsQC0qyySJzxFDOGACbqY4IxV/fq8xu5h6clIa6rklgs5gB6WxSu/olHV
	TLfmCeQCVy/8qFU2gcRuHv/FED4dOMcFWpOeokawopg2AYGXxf6zfW1yYxOSbCcgPeqThdRih09Xw
	BazI0O1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZKh-0000000CLIp-16HT;
	Sat, 09 Nov 2024 00:28:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ypy-0000000CHL3-2Eq4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 Nov 2024 23:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ko5ntTtP2w+Sz2PCh54+SIltSsYjcVHYUqvHuhsGxIM=; b=TIpT5vkhtyJ1BUgeKNExY1eW+l
	34mYYjxz21YHeDeP2DjY7S+qkbl01diUfDhyWqGoha2HJJpz+1jMoTvNKrg643xlsuMBRlKoOJrRn
	m8Uj9rYHi2g1IJirvct8tbbG/cb2xaIBatq51mii7tjWrABEO8gOOQwvKT5KXaqmbaUxkhCinybpn
	fcojhlCOHUHBdpB3AGOJfCRgZ3asGaC3E4W22NA1+DqZohx5cucOTY6XoXfldb9mYX5cWR7GV4Fq8
	B7y8cEiT4Ur+1hAqI0Qj3Gx/5d/lmaAZaE84Trd9IAn3krMugYm5mE3KEjpOmTUIOorZ+EN0mS9sM
	cbBd7BVg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ypu-0000000COor-3exy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 23:56:21 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20ca1b6a80aso31497635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 15:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731110176; x=1731714976; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko5ntTtP2w+Sz2PCh54+SIltSsYjcVHYUqvHuhsGxIM=;
        b=Da3kFo29NIgVZT5Drr7jyZ/VrtUA+fp3DD6wc25KiW+x0fD87FueHcwgYgVhq+Ky6q
         PJIXTCcA7GUwbLflogBzHyvJk137BAf3L4mapNyc4ICCmctY3Xu7Ksgu7NTgweMqwPnB
         CZit5BCde3wZiwyteSPtf/eJukEyIb+MKTw5lpee933oqf+2R5RXrJ7PJfx8yUhIjAuv
         eGCbhBu57L8cSIM3VuqdCYpNFQatqgox0v8cJElaEKeUwooydJVN/WnPjerDVHMJYRlR
         LaiQT87CK7HEhEaXh/WzKFoKzhox737IW711kTKABKEznlnBHfGiBLLbSVK3Tvp9FlgK
         8wTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731110176; x=1731714976;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ko5ntTtP2w+Sz2PCh54+SIltSsYjcVHYUqvHuhsGxIM=;
        b=iv0rO/OZVUSExIJ5Bjc3STKy4DmsErOdHO0w235zbqe9rd19w920ls9zbALAszmtNN
         Glpl7De9+1YvwufINwPR3cesfqpnqf8sDE5lBM6K2Wb0YfqnGzxXSvYWnbkspGTC41eZ
         IxUXSqLIxBBiRr7IGR5YOJAmc7REM4YXXnVCbPSvMJTg3UHWbHjjAQQCKEQzeciaJtcz
         2bWeXU+HrvMC3XVnGxUk1yhAGQw9Ruby9FOkwnCMOJZcn56cuZzD0Y3Rhl5aCbsnC/nQ
         p3ETiebaMiGT/VVx8GOZ8h4jV7eSWPY9o56n0/mQOwc+NlCCUtUyMsRz7NhkrOpVMomU
         oLvA==
X-Forwarded-Encrypted: i=1; AJvYcCW+v24t8OJGDy4M5RCwxCoduPw/KjU2IR2n91+nGYL09mbRPmxPLY2PqlBRFBnTUuyEgzXw6NknfTrxtai8s84j@lists.infradead.org
X-Gm-Message-State: AOJu0YwZD/4jrFF/yJZyxnRKHp1xWFf75hweCerxF7fcnu/UV80Ly8as
	FimLHz8DKdUqsSypAFwoq8qlMeFTvguFKoIC/J6PKKCCETXuln53
X-Google-Smtp-Source: AGHT+IHEarQoWl4dFgmCs28SBfigzcnSWnoyL4xgpkZl9Jj3lgLAj0yFFM0e/MUEUbjsP+pQ2Qtcog==
X-Received: by 2002:a17:90b:1f8b:b0:2e5:5ff9:bee1 with SMTP id 98e67ed59e1d1-2e9b177bd4fmr6176123a91.29.1731110175789;
        Fri, 08 Nov 2024 15:56:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e59f1dsm36081805ad.182.2024.11.08.15.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 15:56:15 -0800 (PST)
Message-ID: <94871adf-c2d7-496b-bf05-c3a773f9c919@roeck-us.net>
Date: Fri, 8 Nov 2024 15:56:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] iio: temperature: Add support for P3T1085
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-hwmon@vger.kernel.org
References: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241108-p3t1085-v2-0-6a8990a59efd@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_235619_172260_D55BC960 
X-CRM114-Status: GOOD (  13.83  )
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

On 11/8/24 14:26, Frank Li wrote:
> Add basic function support for P3T1085 temperature sensor.
> - reuse tmp108 driver
> - Update imx93-9x9-qsb.dts
> 

Subject 'iio' is now misleading.

Thanks,
Guenter

> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Jonathan Cameron <jic23@kernel.org>
> To: Lars-Peter Clausen <lars@metafoo.de>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> To: Jean Delvare <jdelvare@suse.com>
> To: Guenter Roeck <linux@roeck-us.net>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> Changes in v2:
> - Amost rewrite and reuse existed TMP108 driver
> - Link to v1: https://lore.kernel.org/r/20241107-p3t1085-v1-0-9a76cb85673f@nxp.com
> 
> ---
> Frank Li (4):
>        dt-bindings: hwmon: ti,tmp108: Add nxp,p3t1085 compatible string
>        hwmon: tmp108: Add help function tmp108_common_probe()
>        hwmon: tmp108: Add support for I3C device
>        arm64: dts: imx93-9x9-qsb: add temp-sensor nxp,p3t1085
> 
>   .../devicetree/bindings/hwmon/ti,tmp108.yaml       |  8 ++-
>   arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  5 ++
>   drivers/hwmon/tmp108.c                             | 71 ++++++++++++++++------
>   3 files changed, 64 insertions(+), 20 deletions(-)
> ---
> base-commit: 74741a050b79d31d8d2eeee12c77736596d0a6b2
> change-id: 20241107-p3t1085-fbd8726cbc0e
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
> 


