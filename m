Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0396AC28B25
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Zb+NvzLUHQoq1FpAOfoO3rgYMLTUz+QxxpRaXvte7s=; b=NY1efQiO5grzGBgsJJNcTtHUYK
	vapcpDunUNrrENik271rnux43P+ISKk3SkFKUrtGfq5leF3kb7EcG3sxxWwOpYbzWN+Vo+3tNKtt+
	sY//Yt2gJJaB79zB81JAuVfUSx/9t7uLak9FkBhWb3+u1yemZ6yWAoMzJhDcjqjF6HaWwMVfQ0v4M
	noMLTsInUQjE+MxXd5NZmzyi/uxwW9gpAbFm6YeBymVM6DGdIISJo2ke3v1jyUDaGTsC+lBswQXSo
	EGxhXvkGf88VvPdY2tYCoUr2xGSGknueBYgTY8LQMTPAxgd8tf4CMhUmBT/ChSLLtCQe6Q02L8lz2
	2tjLZhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaEI-0000000EosC-13oI;
	Fri, 07 Mar 2025 16:07:18 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa9g-0000000Eo99-2weW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:02:33 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2235189adaeso34761795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741363351; x=1741968151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zb+NvzLUHQoq1FpAOfoO3rgYMLTUz+QxxpRaXvte7s=;
        b=KfuX0Dd8pd1e3ZW2iX+7+nj8NbRTrPlL2dFnEXOkwBcFP8GH8ujn8wKaxkXs+LJXwf
         83tIRdlQ1Huq4gaj/tZdjcWSg0oJTfgFIIZ/dRAdkU79p6sIQPAVpj+Ky3Cr/N8KJyXP
         I7CYQYBOu03J7n/bwcBEKwfubwKIu5/mf0H7XXvrDGKoL1oS/zZqUjYDJpwW0zO8ITd3
         Ecm7D5c72FmmO150vvWTqMaOHwHNSKEXAeG3qKxp4aB77HO/G0+22UHk64/NJL7wnviH
         ABu01kQi149Gv0NoPTebbEe7cMaI5VJxzONatxahVZXg+aZ6x3u0SYr+0fHL8gNDiS32
         NjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741363351; x=1741968151;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zb+NvzLUHQoq1FpAOfoO3rgYMLTUz+QxxpRaXvte7s=;
        b=qDGxDc9QHTK1Ai0jPVTtwQDPMsazDOjkfGbu4YSO3G4HFGfiCuyGvBRBhjvXPH4McV
         ko+cp3jugh0oze5XfgCi5mwFBQkS9EzvXiomXKajIV14mUDRrql+IfHc8LP8kFT3HlKm
         4SDiDUdv1Q8RKPAOXIqATAXa8d2W6vVJirdkdOxELs/+p7Ws2HoNm7+SCY9umEzDF5Wl
         uisIRltog+Ed+Tl+54OPnArF8/DGDtJzvCehGV5LmOYiOofoR2emCizh0TY2ZDGMu6vW
         NlOgdgYXReAMlyGtctNY05AQbXddxMNNUw5gd5WiRo84AtMDsEPplTpD8ZoqqXWVwpGs
         +DFA==
X-Forwarded-Encrypted: i=1; AJvYcCU6/efVFTlmNrjXIDZJk4iFUbnxPvdMss7aTkWA2c6BZpIGlAznqPX4LDuDCm2yJcTmtYQQcisqG3VQdPIFV3Ws@lists.infradead.org
X-Gm-Message-State: AOJu0YxgtEtk9LWkGzA/bN8cIGzWLAyYD6n4RYy3YdqIaHGv7Ay9qxFh
	DJ8EBRc2Lf88/uxcAM9zn74awkgFgq5KY3SIrN6FvwZLT2hwqDy5
X-Gm-Gg: ASbGncuFu6YStdgDc+huMe7GMjyj5PRwqdnV6mDvKTyDTToV+qDuytzvXorEbLVTZiM
	OUeO7ch0zX49po/4qBBo73mZCVsKE9brhy5Jw4bPYH64m8tzA0tJQpHJ7VlZ5sV++qNadjQ2EfA
	y6+PZ8diruC8Hw2tHSvzDuNJnVqy67iu4Ne6Br6f5oMsjoCkoOmtFYECi+ShdeQUwubaCTIV6K0
	vcsjOXWZmr58TvRkiPH3qC5+yy5LCPTUJBXs7PoR1hZayTrhzSiT1+RiVKWfGnK7dczz5GOGx53
	j4xXPBshUpra1qetQfCSuK+BG7GbSHbYVyQGDKPcdlfoWW8ciJ86zVXJkWxlIIWpT2QZCCxj6yW
	DfxpFhhXVp4QQpXvqog==
X-Google-Smtp-Source: AGHT+IGznSvrYjNrYuAgQA1A2W1jR7Q+mpt9Mdt9FcdIUUbJ2WN2Iq2LMwq9M4nmJ7MiIMinbFk74A==
X-Received: by 2002:a17:903:1a10:b0:221:8568:c00f with SMTP id d9443c01a7336-2244b098602mr1713835ad.0.1741363350733;
        Fri, 07 Mar 2025 08:02:30 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af512724c14sm468713a12.37.2025.03.07.08.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 08:02:29 -0800 (PST)
Message-ID: <64d7d06b-337e-498a-87dd-03ae41e6a2de@roeck-us.net>
Date: Fri, 7 Mar 2025 08:02:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx7ulp-wdt: Add i.MX94
 support
To: Frank Li <Frank.Li@nxp.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250307154424.2613795-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250307154424.2613795-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_080232_744295_7A4AFA4A 
X-CRM114-Status: GOOD (  13.78  )
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

On 3/7/25 07:44, Frank Li wrote:
> Add compatible string "fsl,imx94-wdt" for the i.MX94 chip, which is
> backward compatible with i.MX93. Set it to fall back to "fsl,imx93-wdt".
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> change from v1 to v2
> - fix typo im94 in compatible string
> ---
>   .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> index a09686b3030db..6ec391b9723a5 100644
> --- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
> @@ -22,6 +22,10 @@ properties:
>             - const: fsl,imx8ulp-wdt
>             - const: fsl,imx7ulp-wdt
>         - const: fsl,imx93-wdt
> +      - items:
> +          - enum:
> +              - fsl,imx94-wdt
> +          - const: fsl,imx93-wdt
>   
>     reg:
>       maxItems: 1


