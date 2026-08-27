Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C471C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaEqDrC5jYAKebMDLgOTjAUIE2F2Prlvaylcbrjmns0=; b=NGkjlGn1KxwFY4h8iDUaPw6eto
	y4SR5eXr8bIB0mzg+5AakVUvSIN2SzzFyl9T4s1Y3nemB57QVoWsbhHNwUPfgMrTQmpc4O+G3+uN6
	bgjnIPGAN4FAPuPjHBCcTurNrKhpP+ropeQ7+ucpddywxfeUY0WGHLX5qBglDqaAerupZm/QIPdcW
	O60wRMIAdA3tOUPikwjR8JGZcEOwTL2a/JT6jICa2y5t7cmW5iepO+NChO3d74tjh7hj910MzRs3B
	Gq77YDGYMTN06clMJo01H+la2w+iKcmJjyIfPz9yk53Cgmd1mrRMOfTO8SP0wHo9uUmZK0biyJHhn
	QcLIW6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVup-00000003h6l-3CK1;
	Thu, 27 Aug 2026 08:56:55 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVun-00000003h64-0RbZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:56:54 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3069986a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821012; x=1788425812; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaEqDrC5jYAKebMDLgOTjAUIE2F2Prlvaylcbrjmns0=;
        b=S0ui9EiTWVqsezW6pUUg+Co73c7rAEPqfqPDTOnXcrnnZIyuQAX5MsrF/f/V85LZe2
         QTgmxD5oRAlXjOs5CFNIAYo4TzLaO8S9I6zABdoM6dUFQONDvBXFUAtKXd6aGKPj0kDF
         Ytr8zQh3qhVHcJTQOvTlxBT/1VFggW9UCpCwYPuUb9Ss/2EYVyFF0JzArrZbjB29f9Qg
         T6RupTlj40OGdA3r/jcukYGnEbRhAofNmsPIeA7h2HvgX65giq5T9swAgsFjDXks8ze4
         JlR6EOmFIuK0RRPQ0wTwxCiUoJnQLohs6b10zppkzSsMGFIr6p4ymJ2EoTqnUhqCXtE7
         xkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821012; x=1788425812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaEqDrC5jYAKebMDLgOTjAUIE2F2Prlvaylcbrjmns0=;
        b=ctGMBc7pneAIViQMMdk7Fseqlz520w6MIqF6RcwVKckYRKJ7b9SRjjvTlcwlNNWITY
         OyR1MoDejg0kI3Oy4HTpoWHRX5F5PvQS/euxsMCMTVfKyRqkjDrzhZl5JwzJ5HdyJdMv
         JNGaEEW0CPrGK1FPPtUn+MXq+zKCq+Vf3/IcoUeR3kHRlzM2P9Hwk4ydz9xZw1HY6vcZ
         zBdguQBG8g3Lf+3b86t0f5ocWYtXeiLnsOFJcnfa+nZU1H+jLHV/YZVmsyxNq6GAOHqc
         qsBAaG6OgGlchuqE8796qOWsWOpyqyeiDZ0IfIbbMiOAeHZh0SbM9EoSh2gOBuDqF3V0
         HLBw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0HlqoIy/z/Xd7A1xuSlBReFwXhGgz3cOnrgi5T4wYzIU9Eue7S7w8CTgfRhBRmzTEvEfj+MJUpRZmSApuehhN@lists.infradead.org
X-Gm-Message-State: AFuF++m2iisfi1GAggf24u2FjdYPw6NhllfQrMa/YO/E6w+9JG8mKfnw
	rTb1wC//S29SJuYgamenPDEu+fmPHT1lrUnLS0Svwkko4b7S5Ymm5tkt
X-Gm-Gg: AR+sD1254iS49ynsQfAcLsMKSxxXGXSLBGtLrJJFXf2D2SAN/0KcEDVWwoVWuzivDvf
	e8uQf+s/k2/+LfnEWf4tXIGrjZSM7QavKg6FNUherkPUxtc7F+ji9HGHfy4ipCa7FCc1kt6KOH4
	wkWCq4FRAeXWArzb2UaipOz10XDEWJKGajjx4l59s0ZXYGGYIkzEk3eXDEQv1T/7E1Cwg1LlKJC
	S20yu+TG4YoSfBdICZSe24QPWuPSr1STuR9a/No2QVWCdBHVgQzt3vlL+JAxyctB3sTfvkevf77
	iNLF203+N1hEu4Lw+fDHb+kizReObTc+SjmN99/A0HFpV7uewiXZbmATCE6tdW0DVMjhQ8rXfVA
	+Q1qWngxAPGgN45NbjcTN7/L4Vd4IP4j/W7KZS6fXDj3PrM615+BTeKa10VJMRMDQbaPrLLDaf4
	HPqpIOtJ6IniQNXP22K/Tb3ASTac+VSH0WYcpiqGlbqJkYU5OimfqHHeGdsUcJYAUZjzcuIoL77
	fjV
X-Received: by 2002:a17:90b:520f:b0:38f:26c7:165e with SMTP id 98e67ed59e1d1-3966d5f8f84mr28728747a91.9.1787821011778;
        Thu, 27 Aug 2026 01:56:51 -0700 (PDT)
Received: from [10.25.160.98] ([165.85.1.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3967582e855sm2085902a91.2.2026.08.27.01.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:56:51 -0700 (PDT)
Message-ID: <0ee330e3-8c6b-4162-81fe-d769982df5de@gmail.com>
Date: Thu, 27 Aug 2026 16:56:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI
 master assignment
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Yannic Moog <y.moog@phytec.de>, Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 upstream@lists.phytec.de
References: <20260827065556.2326079-1-primoz.fiser@norik.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20260827065556.2326079-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_015653_155853_BB9F1EA4 
X-CRM114-Status: GOOD (  19.33  )
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

> The dailink_master label was incorrectly placed on the codec sub-node,
> causing simple-audio-card to configure TLV320AIC3007 as the I2S bitclock
> and frame master with SAI2 in consumer mode. This contradicts the SAI2
> node configuration (assigned-clock-parents, assigned-clock-rates,
> fsl,sai-mclk-direction-output) which requires provider/master mode.

Just a small question about the commit message. As far as I understand,
these SAI2 node configurations only describe SAI2 providing MCLK to the
codec. A topology where the SAI provides MCLK while the codec is the
bclk/fs provider is common. So the original configuration seems
self-consistent, not contradictory.

Regards,
Chancel Liu

> Restore dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK
> with the codec operating as I2S slave. Also remove the spurious clocks
> property from the codec sub-node which had no effect in this topology.
> 
> This fixes the broken audio on PHYTEC phyBOARD-Pollux-i.MX8MP board with
> PEB-AV-10 Audio/Video expansion board.
> 
> Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> index bb740f845855..8957b24a7ad2 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
> @@ -77,13 +77,12 @@ sound {
>  			"MIC3R", "Microphone Jack",
>  			"Microphone Jack", "Mic Bias";
>  
> -		simple-audio-card,cpu {
> +		dailink_master: simple-audio-card,cpu {
>  			sound-dai = <&sai2>;
>  		};
>  
> -		dailink_master: simple-audio-card,codec {
> +		simple-audio-card,codec {
>  			sound-dai = <&codec>;
> -			clocks = <&clk IMX8MP_CLK_SAI2>;
>  		};
>  	};
>  };


