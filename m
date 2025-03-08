Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18CCC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 19:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTVbXxjWlsf93+TNBRlPrQnC9sQtCvCemMI+xBM+RLA=; b=uP77V0sofGvrMLtrH3VbDb29Wx
	8exXm1BpkopnpyPTi7gmDidp+VrVBVLENPS0m4QpmxjDySkhByrRuxugYrx4B47wshKDHvPHZLjbA
	rWi2kxH7NeYqE8jNCQ5Gz/wxOu3OXX0bRzitDx8DATdsW0QTJbMte0pZBRMgdhrN1KChiAREtkRz3
	rKxR8N8A2lJY3bMyEsayV31vowL2ghQCm5MZR3sux+eZxOd/k6OjRYqa4WJE2yXwdhWteg/CcyOWM
	AoqeohOlzTLFJZLM6+SHow+xL/Hd/1eJi1zvKjDKef0AifvGzTZFziZtsw8A12VFcf1vDxNXkO+Sj
	xGFl9tjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzeI-0000000H5nr-1UVY;
	Sat, 08 Mar 2025 19:15:50 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzSv-0000000H4TJ-3xAI;
	Sat, 08 Mar 2025 19:04:07 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso18098541fa.0;
        Sat, 08 Mar 2025 11:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741460644; x=1742065444; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTVbXxjWlsf93+TNBRlPrQnC9sQtCvCemMI+xBM+RLA=;
        b=NEFAknFBFjuW6KcMKzgk54xA1fzoRSKTGklo/MOVlRIrPnymTg6q6iefP/dHUpfBXn
         zR9FuCvl9SdvIEB84of8hCISAtXrlI1FGs6tyN6QVn8qCXipgwKZfUdfssAxkTMAmMMU
         NT0ZfBMUiR7zG3mN92clf1axHnLSEx6FjMQPW1qFXYZXmsGzD0hWgEMuyYQcA4rD5kG8
         Akr//wVwcuvviPatnMYVzoHpFqXt+s/zqD8VX9A8TcQp5M7rieGapiE8IBJ9VC7Qe7wt
         IL50UQaYO8cj22f+E+7KNabpqzasrGDdQzr+03ok4QFwR7VjFGoKIvIO9l8iEWiBEiwM
         3irQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741460644; x=1742065444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTVbXxjWlsf93+TNBRlPrQnC9sQtCvCemMI+xBM+RLA=;
        b=Vo/LIt/KMb3xxps0YUjkMGljEStKvJwGn6/upjqS47IaF9LhX9Boyj3ly9HRWSQ0dN
         uIrRbOtpmmebpMDQdxvJYQpAJbDukTgOka+vrMosfcVTdrp9u44yiDa3K4wQrPbv4F1z
         /K1mL7BGeJsQDARlsqr7hRu3zbN+s8ZC5fl1ozfojXVMgmS68g/F2VzYWEKwS7M34tdx
         JKV8nWcRXT/Lg7KJHwCpxYLB9n+z8z7sBtrdrCxSPOuztXnixIncQt8q6cmreBRbtOvI
         kkxtqmHUvX0Xs0pTKQaRCzCQHM4zHxSwkWmcaR3MRg4WkJ+nKGQEG0k4vtCCIEkMtlXG
         9SxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+erupjGOitqFJcXdi9/KigAudhXPQbzqaEqxi5uM4IAJwYlUNld/4Pc9WILOyuPCbJHRl3TLPJ/9/zaaGG4Q=@lists.infradead.org, AJvYcCUfpUh+gTQkP1jG+PLeYLuXvHXu4rpfmXJr456tHE3+VJ7jM/v25NZuv+c8+l9yH+k/t7SItK+Dw5Wo6l+L1dkg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1QlSE0pGKyMRHOJEKiKgUa6Ad98s3iny7kkVAAalmTz7RIcG8
	eKrOG8tYaM4TsvPoMdo2EJWTcu0CmBKED/+qcaY/rfXiI0TXlrZy
X-Gm-Gg: ASbGnctZz3NwxZ6qfyL2C9nma74v0DVqdah8mFvFiAIMbM9kruUiMp/cKLTBPDKbpBg
	Ls1pCbwk6LTOwin4n+NbhhlMGrpjRnSelfRGmx/9I1Ccg2+6r/IkZVccPInwAbWiD+qbaI3uwu7
	gwjsR3doctcwe+NewY+Zv766386eq3Nke7usTdvhkp0k9TeVbAvjJNbDkb5qL4V+1VhmZB+Kttq
	RpsYUwkJCtS+ebLhW9iLmwA1NzTk6b/cp0jheugfscwN+i2KF7e9P17wGmG0enT9WjTxudb8sOo
	46kZv3jHvQ37GsfkEGzf2mxdTYyne7aKDzZ78DlAibzdvOvOwOXO02w5gvk=
X-Google-Smtp-Source: AGHT+IHONdtOGFlS7xPC7CsMoQUtrhTnztXQBlowSZtaB1Dgbc0GCjes4fUV0lQgJ2cvnPRqYxqQbg==
X-Received: by 2002:a05:6512:a93:b0:545:2fa9:8cf5 with SMTP id 2adb3069b0e04-549910b7c6fmr3484311e87.49.1741460643774;
        Sat, 08 Mar 2025 11:04:03 -0800 (PST)
Received: from [192.168.3.116] ([78.56.129.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b1c3adcsm883370e87.249.2025.03.08.11.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 11:04:02 -0800 (PST)
Message-ID: <5bb045fe-89c3-46dd-bd9a-dee8800a6d58@gmail.com>
Date: Sat, 8 Mar 2025 21:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Xunlong Orange Pi 3B
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240626230319.1425316-1-jonas@kwiboo.se>
 <20240626230319.1425316-3-jonas@kwiboo.se>
 <d1c600f1-a874-4bb8-8b9f-22a3414edfcc@gmail.com>
 <29739e60-15f5-4361-a57a-2e6b93fba09c@kwiboo.se>
Content-Language: en-US
From: Arturas Moskvinas <arturas.moskvinas@gmail.com>
In-Reply-To: <29739e60-15f5-4361-a57a-2e6b93fba09c@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_110405_985187_38E09124 
X-CRM114-Status: GOOD (  11.47  )
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


On 3/8/25 6:34 PM, Jonas Karlman wrote:
> This is because of a reset issue with Ethernet PHYs in Linux, see [1].
>
> Two workarounds:
> 1. Let boot firmware reset the PHY before Linux, i.e. use U-Boot
>     v2024.10 or newer.
> 2. Use a ethernet-phy-id compatible with correct phy-id to force Linux
>     to attach the PHY.
>
> I suggest you try to wipe U-Boot from SPI flash on your board and update
> to use U-Boot v2025.01 and try again.
Wiping board SPI flash which contained old U-boot and using 2025.01 from 
SD card fixed issue hence DTS is OK.
Though I do not remember that I ever wrote anything into SPI flash in 
first place (I touched board almost year ago so potentially forgot about 
it) maybe it was shipped like that with the board...

Arturas Moskvinas

