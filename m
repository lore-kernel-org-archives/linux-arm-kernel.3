Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A873DC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QM06wsJmDFUwDTXBwOD8bKArEY6vK/Tt6RRUM1IU/M=; b=jfKCKrvyV9fO4sqZWzHwtRc0Fz
	VlDKfdx3q6ZjZZkDzcc+8Y42xljw8h1RMUg6N8p+vqSSeuX5qYoYDizS5MDu7t1qtrlcrmJsGj/FB
	YIWgR5MF1G6862LZvgME7H4VuadE2RZgZSCrWD3meQXwGhfho2bfnY/jtNUr4vgt+qE0WlgV5bnLV
	6QGUdF92BrTm1Vv46PokbEI2E21cXwc6U/nj+uVB6IsGA93BijbIltHP2TXtcAw0Yj5ZR90o8MVQB
	9AjBrPvJWJDChUbifDAzNruBEsJLKyOA2lwy/xVQF6BdLIIELnK58yCAKjP9lebmOtnmy9ioA+5aX
	lwfPdi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZCY-0000000Dd6l-17Mq;
	Thu, 10 Sep 2026 07:28:06 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZCW-0000000Dd66-0IsU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 07:28:05 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1ceb47d55so578678a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789025283; x=1789630083; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6QM06wsJmDFUwDTXBwOD8bKArEY6vK/Tt6RRUM1IU/M=;
        b=Ly1Bo46fqM7X5v8Ihbr3ooX+Ujue7ZC4D3LSlvJAitVRwqpu6pV0Kd0tyEC+WwlVAR
         pS+TsDXBnYQf/zsT1FWCDGOyDDY65wiTQiIKXWWnAQMohduaiuMYyP0xEyibPCElntop
         NZuZssQ6PRNeTFPvkofQ3u4gUCK4XtmW/GeBtE10BylHNpQIQZ3c0xAhE6OT3PtwUC7e
         hRQYikW/+YdIuIjgtIMqT01o+xjkkZoIl/TLaWl/Jy00/wq0pkGXOjw6e8SPuUhgPsfK
         Pfp5/GrCrvpl2m43YtQPI8BYlhhdQn2YPYS7y/8LQVfr4D6iEEUS361iNqh17c+kIs9i
         ljXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025283; x=1789630083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QM06wsJmDFUwDTXBwOD8bKArEY6vK/Tt6RRUM1IU/M=;
        b=Sv7JLv7gA95m47DaxUbh8aVD/7r1bV8PX8hzP79oOB4R4JKsV6Zr03Z+rGtbGp1/i7
         0pi2LiFrkKVG8u4We9DbN4ms98sEAb3bMNTAN6qaFcgUws8wARxTxlhvYisdTi8JKEt/
         iX+dqE6sFHQdXu3nMrmawGKRCcPlSu+a9VhoIZ8agtwGv3xt9dhtTsa1/509ZrP+fjX8
         pnOLYtnOsZOlbasNrhwU5kxlQgn3AgVudKi5QBeH88ALjmQ553/sTUPypnGjG9o2A+l7
         911xNxd94oB+xvIg2xua5qyi3DXiDEg30w1BTY0AlOO6nqKIsips8jsu+mulH679Ik5L
         TEEA==
X-Forwarded-Encrypted: i=1; AKwUvBxa2p1LvVeudFcJ3ep90UevOJtKC1HWnQuALZlvQsiKFshPvs1KvOVzYff6r2Lhp/BPGzLoyDaOH2WzBJhO7HLW@lists.infradead.org
X-Gm-Message-State: AFuF++kg8vByGJwGXR8nH/SNlqVwWCByNsiZvmbl/ALugiKbh9MRCKzx
	/f/z+UfZToY6Q11vjkMSas+WEsLTb1z/6wWqVga6hj/Q4Z3acL9+vXKs
X-Gm-Gg: AYBFou1TWsGMEFCSnD5XSUQeMFT4P5mNI8iMJPOfupGyHO2OfEGYp6fr2LwRUggdMp6
	1cbRqbAKWsXa8qPMBkxeE/2Xb+3EJdNgRe+vRxnPyL4u3uJPWVD3KcZEy7UXmr2F5zxLRWPUD/l
	aXh+JIKDrQLspkQzXH2Ro9y5E8jOS1tFSBhYtjyLM+7uFB0gcSwohMwvKDtl4/auMCxlBkx98K+
	pgFvd7lK6hSgqORE5AVb7pQiFwXtTdwjwohAJnX85LMykODtcwxEECUSZyhpiN/S9gpKfom4O6p
	vFvOhWiydns9AHnX9/fo+xFCrIiX+v274MyDfcG3208ZouXfwk8Y5BHtVWnsBKkkwpAqe9C3xD3
	qYHcE0bU5t9v3A/mDtRVpM9Xce7HZ14pqPXpJ0cNTMaVwqSG50b1qF6tSigk0kwMY74Ul+7v0D2
	Rl/CrEDFe6RWFY5eyJSs8lOoe+3gtiU2UdFomTJ6zUO9cbOolZgvFMAZiPSGNfEk1gsFyWAjqVM
	3BTckiuVEX/PWPjniiztjQZYByEYdsguxJb1VCKu+FGNbps5gk53977
X-Received: by 2002:a17:90b:3e46:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-39d77bcba5emr3182903a91.14.1789025282698;
        Thu, 10 Sep 2026 00:28:02 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d770bc9f5sm4178071a91.2.2026.09.10.00.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:28:02 -0700 (PDT)
Message-ID: <7d4b5db1-7b0d-466b-9432-d80882e2720d@gmail.com>
Date: Thu, 10 Sep 2026 15:27:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: Joey Lu <a0987203069@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Hui-Ping Chen <hpchen0nvt@gmail.com>, Joey Lu <yclu4@nuvoton.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260720102222.251179-1-a0987203069@gmail.com>
 <20260720102222.251179-3-a0987203069@gmail.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260720102222.251179-3-a0987203069@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_002804_114341_65ED0271 
X-CRM114-Status: GOOD (  11.84  )
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

  Hi Joey,

Thanks for v4.

> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> index 7228ad4735b5..5a7a39b1b514 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -88,6 +88,14 @@ sys: system-management@40460000 {
>                          #reset-cells = <1>;
>                  };
>
> +               usb_phy: usb-phy {
> +                       compatible = "nuvoton,ma35d1-usb2-phy";
> +                       clocks = <&clk HUSBH0_GATE>;
> +                       nuvoton,sys = <&sys>;
> +                       #phy-cells = <1>;
> +                       status = "disabled";
> +               };
> +
>

The usb-phy node is placed directly under /soc, which is a simple-bus, 
but it has no <reg> or <ranges> property.
This triggers DT validation warnings.

Please move the usb-phy node outside /soc.


Regards Regards,
Jacky Huang


