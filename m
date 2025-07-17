Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419E9C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BNV8Br8ggkW3UcK3Zf2ulHXs0ZJobMuBMxa/aid09Y=; b=prNZ6jneA+8injxm+qkHx7Q3TP
	+Ycgg/ewulbfbXZqaqUJND/CVwTF7KjPYf9zlaOY0zYqS9t96dIuWHdiqWB7tBk0PNaZa7zEZJnYh
	Sp/gOeNhBDXPi0s0PfHwGFfhbVN0lyBOIAQabsGi75ZL4acVKkirTiF+4DYjjahyZQA2rQJSWIlNF
	T2h5qYTPyMa1p92unxKZ4cOxX21KerrJhFiYkGXzsxlTn42HWq/MW5LhhcqqpEGdGz1cAL+lXIJt3
	O67IGMfMjrzD6BJbyt1Wz6WxM/DGpHC30ZHcQtSoolr1GvDmbYSfYVwlEqzAT1t3aN0zU/ECkP33D
	qo8EbvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucRQa-0000000AdY0-1nux;
	Thu, 17 Jul 2025 16:25:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucR8O-0000000AaHP-3Bgo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 16:07:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4561607166aso9069395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752768418; x=1753373218; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/BNV8Br8ggkW3UcK3Zf2ulHXs0ZJobMuBMxa/aid09Y=;
        b=cM5flDbsnenJhqNhuESLMUP2EfgwLgJAA++8WxSKqtZTCXas3H+dSffUQMDA+DNS1y
         kNd4M5oQmllSCBw7WTbk+eru6I7oBaXY3yi7vtqdTpW6WX59loshwQdl9cuiWf31szuD
         9gTMSgnGw99mpAjMHBMcrS6aoiIiqn3FpVJwU9vjQJz+Uh3Vjg5jsqg9wQYtyg86L8i2
         iJXrbf0YvyhitusBZjQBQKTeBR/M8qogXKOb9oRuJEGiQ6PTdozdK/OdJwu1ROTK3jX0
         WPfSDJ67oirvsl2/M8+tj/wA4fYVAgmPWXaq0l1mClOUUv7J4e3eKT5CJ6EuAcUA+yIw
         43+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752768418; x=1753373218;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BNV8Br8ggkW3UcK3Zf2ulHXs0ZJobMuBMxa/aid09Y=;
        b=tB/o78MiSDxGKAvjlli/ESXAchUqIrrppbLGL0ypDBaD9a2sdB8G5lOhktYD7YPUWX
         exK+8lhVvs5MNDELS7uF4LMI8uP3ktywuko9nJdd7tHF8+lZ1h4g2Hz+3KkAWLm7hzY7
         HZ0ftXNs/M0J+stiLXi1H3j7IIkAgryZq7YZ4hHXnrxZMGUxsbAJfjLBUJciJOzHU+xH
         zeHay7f6tK4IUObFstFUWeHD0HgyaTPt5wXkCXyau/5m1yK3UYS6VMZ60Cs3AXmQqLWV
         57yNQMlBZOdiUgIso5J/u0DriDSwYwWinVqQHyxWgYLqbov13sOQIPep1AZBKvanyz0y
         O3EQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6iVYclTDttmW8WpM/gXrMHQXfBevV/5NYNqWRLMlbkSxw5DYup/cSNpd1uRbvisF9Fu9V/wg8PGSZU1pERfeo@lists.infradead.org
X-Gm-Message-State: AOJu0YxWVRlkEHft2qQKV3Uhsj08D58uKqczsV6sZzle2IFACz5zsC9P
	BX4qvC3KqK4A8iWGuTj5h3k/42attGBGJemVru1blPGAJ8sLRLooEEg6vRkiYdA6gaA=
X-Gm-Gg: ASbGncuxCuxTdg8xvIoZ6Lhcoca9O5157hEFxwx1mqUVBgTGTX9huk8R6k78jZQu6iE
	UQDVyVsMYYgLlbk72MCDyM077NG/pNda64EGvOVkxANKipngYVUIpTDYoIC+GoNjBelqzgSpP7k
	RGkDvL8jckpHPt/aSao64Ed89xfem0Uy+9fiuuhMXnS0aDZdCWI7851hM6EEC8dpXj96U4tNwSh
	hfO3Cr4zQVUh8QM7BUzPyl+4SHsjcjClzqq/Km4u9pac5jACy9+1+KjwHirmXpaIq2MHwA6JPKd
	h+t5mzyVmbEWosa1PO+nn/u6F5NpWSyu2i++0vrNd4qCTj72FXH4Iiih3icXacflS82huJTpUSw
	XSx9KrelH27WyPSNFlx1+0UE=
X-Google-Smtp-Source: AGHT+IFd2pFskydzsXLxySJ86ae4Z4yBIdNrJZXhbrxV4zrWoKjgQmJQTRCDmqhUCimFVeIudsKmoA==
X-Received: by 2002:a5d:5f4e:0:b0:3a5:2653:7322 with SMTP id ffacd0b85a97d-3b60dd643bbmr6867126f8f.3.1752768418467;
        Thu, 17 Jul 2025 09:06:58 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e2fasm20802147f8f.77.2025.07.17.09.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 09:06:58 -0700 (PDT)
Message-ID: <c5d60a2a-7b3e-4adb-bd75-bd7c3437bfa7@suse.com>
Date: Thu, 17 Jul 2025 18:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: s32g2: Re-order usbmisc device tree
 section
To: Dan Carpenter <dan.carpenter@linaro.org>, Xu Yang <xu.yang_2@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1752703107.git.dan.carpenter@linaro.org>
 <14d3cfde-57bd-452e-afa6-8a468281e5e7@sabinyo.mountain>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <14d3cfde-57bd-452e-afa6-8a468281e5e7@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_090700_806731_5BCF3343 
X-CRM114-Status: GOOD (  13.08  )
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



On 17/07/2025 00:46, Dan Carpenter wrote:
> The compatible line is supposed to be first.
> 
> Reported-by: Xu Yang <xu.yang_2@nxp.com>
> Closes: https://lore.kernel.org/all/u7glt7mn33lbdeskbr4ily6tjjifvffy64llwpi5b2rrhx5tnv@y2h2y3oz3xc4/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   arch/arm64/boot/dts/freescale/s32g2.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 089f54415571..6f700085dec2 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -424,8 +424,8 @@ spi2: spi@401dc000 {
>   		};
>   
>   		usbmisc: usbmisc@44064200 {
> -			#index-cells = <1>;
>   			compatible = "nxp,s32g2-usbmisc";
> +			#index-cells = <1>;
>   			reg = <0x44064200 0x200>;
>   		};
>   


