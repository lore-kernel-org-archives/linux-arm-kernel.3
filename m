Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96ABCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Axp+Y7n48EcMK3tr2yHFXpOpdW4+znYlp/0VpLugUQ0=; b=ivpk/pKANjkmYTv5y7CfzZjTpY
	KYjAHpXA5XP8IpLOjMWf8+HaoIywSzDxfyRnZ+uZT5J4KZe+V1qrDi1ZJZLWnbzVKv8zvkHX9bEtF
	/2C3p+mcODfOPG86PJWuXNI5KeaQAdVvXyO07HaHNHhf+cIGi8gwb+J/lPNGtnzWwoIQMp/LJi+OW
	fpX/dN+qyAqwRJ+uMeaAMMFItKOv2qMLvFDH+XWeErzfZ+RV5tDSxW6K5QOW7RxUSs/EmKJrmUsor
	EoLsaG5zHjZgGmkpUZXbNiAh4sTrkWoS27OFzaQURFN+dr+isH7cZae34888YMEr22N0BfqCtVwGq
	OZ6+Vqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RuT-00000001Vf8-1Ygt;
	Wed, 24 Sep 2025 16:00:01 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RuQ-00000001VeH-2zjj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:59:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77c1814ca1dso5399390b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729597; x=1759334397; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Axp+Y7n48EcMK3tr2yHFXpOpdW4+znYlp/0VpLugUQ0=;
        b=Cj7GcCmXcjSFgszEDkIsFWBBggVDhW1pssAvkYg+bxyHfRzqSkdRD8yIkVt4vNMWZE
         S7HOkeh7ikDq4wiGSfPbujQ3F8PxCra4MxhHPmXlE4O+xoG20+6X04NU6OYXYdC94h1s
         8NnFqVZNnenlI2TtX+yDssyp/vjA+5zmZJyyx/05ijUWjqqWe5OZFtlmwYC34cPN9/jX
         bbwqTGRPJaRTFODOXinyMx15gwQMMbAoxHBb4+g6CVoS0XGJJ30vxe/HpsXt8uGFY+1C
         q0sEhNOt7LsDbaUNYcOBmyiLVw1uXFiyxOn3yGyjvN3P5cE/u9C+MsRcUPUEKkPQB3Yq
         Ft1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729598; x=1759334398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Axp+Y7n48EcMK3tr2yHFXpOpdW4+znYlp/0VpLugUQ0=;
        b=muOoifQCN8jsAPaATy8b5UDBj3yhWYY45ebho+hFMXfNknYos+bwIAb6tZZIofeF6T
         kt2HYISfzBhuAm49XoMEFXlBUNYFJAPWO3oyCX+6mXzoGadrq9vyY3mKqAyMzJh6iIkv
         H3Gq0y282czryI7hT2mq6PattUEvvmgIoCRlEyUq6ytiaIWNFfEzkNCS/1dy/5o6UaVF
         cTq7Y20X1ER8uZeRG+xwUkLfPZ9hMmMpDmAL5sz3uaPpJGcvElKvc3ehUl8rtxEEjAgd
         Ym7aUpiXdknbBy7IKzfiNe5P87F5qmwrE5PEVLMLEVQhkgdo5euLMU0djSWvGfr89lLt
         Amwg==
X-Forwarded-Encrypted: i=1; AJvYcCXRdIAzX50y5h4sakSSCkbyaDUUVQfEHXmWEJgU8OHZVL298Xi7QqTjvuk9E/ZwT1Vxo4wC4BFEEICdsZN4mUjV@lists.infradead.org
X-Gm-Message-State: AOJu0YxTdXnUenSIpn8M60ll4XevG6L5c1Qztepz9pz/FHncw8dKo1yd
	1/JXZH608bkouPIekzypWBg2KSBO1oP2NcRPE+s2QfErfEWYxzQmjUNx
X-Gm-Gg: ASbGncv7vxWDP4+vFeFl4cOgqGgV31O3hrIfJqJiKcrMl2DRE/EwwgYg2v6X1m2FVbo
	Q2Kd/owJUUJR0GJbun1H4MzOLQizy8RpoXVkEkYWpG/B9T/r8dBXKniJMckiDQqoLawCw4UA2/3
	VkBo0n+AecyiAz8ov6Vb2LHtMmuqjwGs1MwTXuIVP1clGu6Y2Sb0+7IQfaH7OFEyIiLm1StF7by
	inlqr+1NdvY3RtQ7ulBCG34S5zYmhbeb6WLxq66Nx5oWsEwQa/8HLMzixxSXqdWs41DO4qmNRDq
	M/2ioxFYwy08/DCYWBWVoqQSXfFieF0tpII+LLTdb4qM8w2Co1eJlbfgIS1LVES8qRBRlrSms/z
	GaCT6Tqt2qvtHr/0wpZvhzYdVyW6zmblCtcc=
X-Google-Smtp-Source: AGHT+IEaXCmea0lHklJdK2j0b9lkEP9FEm4EgHcCJQjQymM5qCQpNWQ5k2IXyH2sa8ZgsZ0NbBXZyg==
X-Received: by 2002:a05:6a00:3983:b0:77f:4c3e:c19d with SMTP id d2e1a72fcca58-780fce1f0a6mr534663b3a.12.1758729597476;
        Wed, 24 Sep 2025 08:59:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-780fc88c823sm416136b3a.54.2025.09.24.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:59:57 -0700 (PDT)
Date: Wed, 24 Sep 2025 08:59:56 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, Andrew Davis <afd@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/7] dt-bindings: watchdog: add SMARC-sAM67 support
Message-ID: <93fa6a60-1a12-47b6-b777-0f6f7775d49c@roeck-us.net>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-6-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-6-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_085958_757040_210BA21D 
X-CRM114-Status: GOOD (  17.77  )
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

On Fri, Sep 12, 2025 at 02:07:43PM +0200, Michael Walle wrote:
> The SMARC-sAM67 board has an on-board uC which has the same register
> interface as the older CPLD implementation on the SMARC-sAL28 board.
> Although the MCU emulates the same behavior, be prepared for any quirks
> and add a board specific compatible.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> index 872a8471ef65..0821ba0e84a3 100644
> --- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
> @@ -18,7 +18,12 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: kontron,sl28cpld-wdt
> +    oneOf:
> +      - items:
> +          - enum:
> +              - kontron,sa67mcu-wdt
> +          - const: kontron,sl28cpld-wdt
> +      - const: kontron,sl28cpld-wdt
>  
>    reg:
>      maxItems: 1

