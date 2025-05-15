Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44408C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 09:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr8YDjeShMs5Dbf0Xg1ibXjoeWLBh6KvIWOpPkgrAjM=; b=NK2Hd3rotSDHWVh49dpqE9VWXT
	JOKwmkGtGyUJzqMBISBIG+OAmQJA2TZSZGdHj3cQkmqiJZLMKO0MRxBep2DZNksRBptZ6aUa36J7u
	ROyF3dN2qBQvezwaxJ4zlykmLCK1B27TSHLfAHXYBbz/Tub6cB+omtQYOglDU0xndWaWab3WusOP6
	YNuJColUacOtzx/SabrmQ5VcLYHBrvnRDG6l1k2R1c/iY0+cRPKYEK/J97Rnb8TyGBabrwp8kEhhC
	rzO+YWJJb2g3o2J4VTUKfFUSsiCc9ngC6QbEhuji1ce5OauHXnuJtC3DGrB688nMuwcxGDkEZynfh
	bc6Swx+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUtW-000000009uX-13JQ;
	Thu, 15 May 2025 09:28:50 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUlU-000000008HK-3VVH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 09:20:34 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54e8e5d2cf0so813550e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747300831; x=1747905631; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gr8YDjeShMs5Dbf0Xg1ibXjoeWLBh6KvIWOpPkgrAjM=;
        b=YeHHa2QF90ckIRFZ/s1AHIeCpgpxLIVFbKPrPjQo6XJk+iNmzg6gmFZIw7ds5ecgCJ
         oiAxkoNQsxRswnIvVkY2cIX7b9gnwXsvAwkIc+3Wt+/lfloG4m3LHkmIPj1oGsJwQp1L
         C6rXP4pgbGqWA7DLb7tNndHRB7WuQFHpqe7x7J8nefzxdYWL0qjcu4lhMkdGtnZwaspK
         d3hlzjH2tdm+eMb+gwlNS6QVxvG6OJgCHR20iyBe3EV8sQoZNJaVLpEjsjDx3ZsWIzZq
         07FbAuPa4YalB/B1InkWgAV6Lfmwvc4D5p2aVpWO+SBqMyARn+eHWAEmd8XiQZz4r3jJ
         5M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300831; x=1747905631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gr8YDjeShMs5Dbf0Xg1ibXjoeWLBh6KvIWOpPkgrAjM=;
        b=qBfIZefmrAoffNntFZOOHsGx4x+Vu51NZHankPpUkehOMBEIPjE+inu6MxsAvFlD2i
         nzF5LkQdUJA4X2CaLRIHY8v9WQmSMSSiL9pMUxb89DquRmP38Z1jjJciJAkbN81np/QS
         7IsbGhjCPYg8q/tRTVW+oG8wveT9U15NUdoNEplsn1iNEqhn1Y9Bsn3aGaUSTW0eLHHn
         M8JgwHQSpgVRM4mxR1CHoQQYo9hvFnmozbcB45L3tdhkcUCO40m2gcAIJKnKr7S9ecZX
         4UNfQILRi1CHBzpeWoruBHZJFEb+9e7pHX9pIkFSn7fxi/A51G73ToglLDeWo63ia8Sn
         TrTA==
X-Forwarded-Encrypted: i=1; AJvYcCWH+KaSfXiYHQgbMqf1Kfxmq+V69vPEv4E6TQZekQf3LLbIHSOCHW26HP5fPuKVBz8KygVbpD7qiM15RLw8ZhSx@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpf5nGy8AnjYQDa/NRhj8gEuyrpz8V6rbqmUV2OzZ9DH1vGdXi
	P93lsaoSDHeMt5pQV9NEOXYo7upDxSSqk67gl+X53Qec8V1538A5
X-Gm-Gg: ASbGncs9hR0ivmBb9AHx5tOEsmdjpwuR/nAIWkLgUL8PAYb0m/EcZh+ZEfWV8GYA9jv
	Up0nrNKOPV3KTvZI0VUUTF2HeqOI0IjMI1vLIyOI71O1aVVvva+9aDye2rXw1cM1kBy0JkJNex9
	fTb+jVb/p9NBSbroAVAR1/iKHqO/mq2iMQIPMzyPTtyzEC1V/EjZ52d4vwumvuEYlmGNkRxR4Gw
	26hY2Fwcj/OyaiPNgfI4FjVSDvcYpSLJjorXYT4RS7e8Ih0w571uJu7BXae0gceQO/z3ABNAJbz
	nEWFuIqSgMWf+/Nl8kKfJwCqe8PJYSUQJrvQS/zoMBeNAO/RKZ/zragyrNiDk30HeSrtJZVOi/p
	W52L5rE5xgCAeztsVxOz7DazU17Kkv9EdXrZUrK7u8t8=
X-Google-Smtp-Source: AGHT+IF1K2xmstWUKqRXQKvNfbx1fHA8kSSO7L0hXYxzd9u70VeGhf6RRP23AYcOT1vimL6BWWt6aw==
X-Received: by 2002:a05:6512:2392:b0:545:944:aae1 with SMTP id 2adb3069b0e04-550dcffc298mr627839e87.12.1747300830765;
        Thu, 15 May 2025 02:20:30 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc645d082sm2579696e87.76.2025.05.15.02.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:20:30 -0700 (PDT)
Message-ID: <a44cad65-1f23-43cd-83b7-bc128e9f858f@gmail.com>
Date: Thu, 15 May 2025 12:20:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum
 value for VDD_3V3
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
 Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Wolfgang Birkner <wolfgang.birkner@bshg.com>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-8-dario.binacchi@amarulasolutions.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250514082507.1983849-8-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_022032_923948_824D86D8 
X-CRM114-Status: GOOD (  14.31  )
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

On 14/05/2025 11:25, Dario Binacchi wrote:
> From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> 
> Buck4 is called Buck6 in the BD71847 datasheet. This buck supports
> 2.6...3.3V. Set the minimum allowed value.

Same comment as for 6/9. Please provide better rationale than the PMIC's 
limits.

> 
> Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>   arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> index 81fa0a8767e2..04112a83b1d3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
> @@ -144,7 +144,7 @@ buck3_reg: BUCK3 {
>   			buck4_reg: BUCK4 {
>   				/* PMIC_BUCK6 - VDD_3V3 */
>   				regulator-name = "buck4";
> -				regulator-min-microvolt = <3000000>;
> +				regulator-min-microvolt = <2600000>;
>   				regulator-max-microvolt = <3300000>;
>   				regulator-boot-on;
>   				regulator-always-on;

Yours,
	-- Matti

