Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88F51099B37
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 20:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w0eYaGcB3V+rZa//1YtvXJWbgZGhvz6cAIvDXCZsJEQ=; b=G4TrbV6x1Iwe4VOJjjG1g149Ld
	960+QPXaxSkpm07Kp1d5asffXqRBqJVhClD9WwAy5m/gubFBNF+6G9huZookE82rDFDiMYIlhU+2p
	89rlTSozmkvdOnUFctMdgEwASP2cWYkv70BghcF0Ptd+rJN+HMJ7AJrAWLhn4WaUaVxFCNdk4ORkN
	zMd/OpGYjBTotTgzxIPsbdkfMA3bF79X+4ae3q/dT0Rx1qgCzOMon1LM06OAdRzb4qKMJ++uN1FNF
	aW6nHPo2gmd75av/sjH9hm1/j+2g8lrU3MeOl9BKq7sesNtJ3LZFrjdAuBHPCsymTZmbAaLnlmxIy
	9/a9oe1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3g6l-0000000DXle-3iz5;
	Fri, 20 Mar 2026 20:06:11 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3g6i-0000000DXlE-41lG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 20:06:10 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2c107ef474fso823717eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774037168; x=1774641968; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w0eYaGcB3V+rZa//1YtvXJWbgZGhvz6cAIvDXCZsJEQ=;
        b=TPksx/8NZqNWrwe1H7dCnaCYH2jIukxVg+Yq2QcSWV43GNSrFof7kt46SnKfUq/5xK
         s4pnCeluN+iWBwaSWf7AQLS9g54eEMRbSssPpyN5hvjnCX2NQ985wtLGs8tSaK1SXut5
         Ts4rRsAibKFZmOor/HrM+clNTtDPjcYs0mAro2VnO2tL9tV0svepkIMuzZGDoByJ56gP
         P7SGBLMkG8gMGuPih3T/KfH6jTqNxlvLl5CPQ+smt4Xmz4OubZyEE+z0u8ZM1xFX7k6X
         mmV5oJyIPmkaErlQUJK6uBae3Q8dAWONpNKG+poGk2UCnnDVeqUAwDyK8ZycBQOgXsDr
         eumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774037168; x=1774641968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0eYaGcB3V+rZa//1YtvXJWbgZGhvz6cAIvDXCZsJEQ=;
        b=W1Sw+peaB9MtxK+kJYRiy3xxiTswZBibUU59eLQQH0nXj9wd8lXrSCmboXZS09VHv5
         Tqub0skU8E2BimoBG++uoTgi1u3+hgdBwH/oErNRQd78ooB6QZtFtQG9oIBJhSHIADB6
         s1bW9Qkm1GiOPKm6Drb/vQqlImckn1Anl6vEnao04nnWs8p7cXCrcsp2yngjMwucuVEV
         IBYY+9LOf365bRGEB09m4VgnixttBpn4m3dkPgT5NA5bg/AhfXlW1am0pyJNvHxWyLIY
         Gc2JRBmLn3sFMSWDCrCdPA9e5TzfZo2czKJeJQrF1xhlMXG4uVUDDgsI9Vc+MFuUXJry
         h30g==
X-Forwarded-Encrypted: i=1; AJvYcCU8BIZbVCgFHbqqfp0b+/UmpNrSawomUT3Uk6aIUI7MMclR3OFmp4PjZasHzvM4viYhPoKSCzwRWbTiPwG+sakK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp/NDj0ZfDD34Nm6gXydU//Yg/w5thqt8rxSx4n2/5478dDZZJ
	tcUTuz0oiVjTsexvFTVzMVxwofgQz9W1tE3gugwvBxUHDnIjq5NdpAd+
X-Gm-Gg: ATEYQzxas7YU9qzE1GKev4FhG3uhrIDpCB/7aYT3iRFQuuR5XtuSDur7VQFuelHc1yq
	Pd3PCuN04MqXDI2s53SDCVTGQBf/x6xNNp0jBpYXWC4hdxNXWD0t0RkhAK/NUGJoBU3V8SEs9Cj
	WxKL3shCdhfBNgvhBNz901H3uVJzPb9Qaegdg6gGiV4IV1juEKAN6oC40kuJVFAmKnmNXZEqgkD
	BWK4qV/dbUjwIFTpch9bNI/tdxxxbk9vqLDyGVXCRyUk3NFxc1yeivDR3GE4QgnS+fjmRx6LTnU
	Gf1sIyyssKKu40Bd09CU9pHLm0KvgTXhGwJNQWImMC/j1PzSmNY/KOSiNnS1v5RWOhbxsyTTDUu
	rBazXfVWvpenOBw3NKtzWoJ94MpM73C4mKOLE7/LoSf6nI7Jq23Dy9Zy4ZgPXpOe2J5ecdeSnf+
	UoDjuGXlVbaOvBFoasYzT0KTdLaoX8iRhyamJpXClZiGXl61F922Dj2kFb3ISkYl2iWo9qttPd2
	vyaXHU8I3k=
X-Received: by 2002:a05:693c:300b:b0:2c0:d92c:2c68 with SMTP id 5a478bee46e88-2c1098092b8mr2171432eec.31.1774037167545;
        Fri, 20 Mar 2026 13:06:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14bac4sm5869488eec.4.2026.03.20.13.06.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 13:06:06 -0700 (PDT)
Message-ID: <52642e6e-cd86-46e2-ad73-3775ff9531b0@roeck-us.net>
Date: Fri, 20 Mar 2026 13:06:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] hwmon: emc2305: Support configurable fan PWM at
 shutdown
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260320152959.1575978-1-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_130609_010288_1352E1EB 
X-CRM114-Status: GOOD (  14.10  )
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

On 3/20/26 08:29, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> This series adds support for configuring the fan PWM duty cycle applied
> during system shutdown for the EMC2305 fan controller.
> 
> Some platforms require fans to transition to a predefined safe state
> during shutdown or reboot handoff until firmware or the next boot stage
> reconfigures the controller.
> 
> The new optional Device Tree property "fan-shutdown-percent" allows the
> shutdown PWM duty cycle to be configured per fan output.
> 

Sashiko stil finds some problems. Please check.

https://sashiko.dev/#/patchset/20260320152959.1575978-1-florin.leotescu%40oss.nxp.com

Thanks,
Guenter

> Changes in v4:
> - Initialize pwm_shudown array to EMC2305_PWM_SHUTDOWN_UNSET in probe,
>    to avoid treating unconfigured channels as valid and written 0
>    during shutdown
> Changes in v3:
> - Rebased on current upstream
> - Dropped already upstreamed of_node_put(child) fix
> Changes in v2:
> - Address feedback from Guenter Roeck
> - Make shutdown behavior configurable via Device Tree
> - Add optional fan-shutdown-percent property
> - Apply shutdown PWM only for channels defining the property
> 
> Florin Leotescu (2):
>    dt-bindings: hwmon: emc2305: Add fan-shutdown-percent property
>    hwmon: emc2305: Support configurable fan PWM at shutdown
> 
>   .../bindings/hwmon/microchip,emc2305.yaml     |  8 +++++
>   drivers/hwmon/emc2305.c                       | 35 +++++++++++++++++++
>   2 files changed, 43 insertions(+)
> 


