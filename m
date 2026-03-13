Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96D8106703D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 00:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqFmU7kx4Mq4mgXnbflh7LA6+0GpHxy9Eldmo/AcQLw=; b=ql72qfsKeTWHM6olyV1otqkAiv
	EmA3MUtLPCfma2BecBFBm8ZEi76uS9RVcxxX07R3hHrp0IyDKJ3xrk54uXzALefTK0z6O/cwBKMPL
	7MSE7JDmTfygNgr6XRjE5PRynGD6gqnB8dRO6x0dvxjyKo/CHbCV2hxesOp+0Ax0iPcoOgbPHFAr5
	M7IvnyUllv/QiH3s0NMv5dTAK+eCJ4qMeCgRkFi1uzU2hAVYKTxsOOd3qKvvlDKGms28/TF68TXJl
	FjvjM/pSlfGsAoyTyC7sGW/1/EGvkajwIsH77DgPu1OgXi/4txuq8d2uKzVdYFRXHGe/yyHXB8wM8
	QbFWmipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qMV-0000000FvLg-3kjl;
	Fri, 13 Mar 2026 00:26:43 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qMS-0000000FvKf-1YN2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 00:26:42 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7d73be007a1so1258663a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 17:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773361599; x=1773966399; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qqFmU7kx4Mq4mgXnbflh7LA6+0GpHxy9Eldmo/AcQLw=;
        b=SoHUrQXspWMZ2pnsTfKmyOusPbuJ3uDjbxZCyc0lqbSGo/YKz5kBKOjJC8UXZEDii2
         DYfJskViSUp4e2+hWgKZupJff5QV/RkfLZ22b9TckFvCa8U3PxFeki0OtXwVI6cNgKvV
         DNuP+vc600YsxrTU9U1h281i38Ti+g3Goyg2E1ywZtRmGXuGoVcBFBNKDi6H5gi0sV51
         klDf41tviqp47p74IqUa15E1wKX67KfGMJTnPfgiIOHDbxwwUECT7b5lgqSQI03Nb0Ty
         /GjSS9x76rcfstUxe7AP7j3odmIqB+ESlHy/l7fESKap7MUGW4GQz5WYNwx8MNSrPq+f
         +tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773361599; x=1773966399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqFmU7kx4Mq4mgXnbflh7LA6+0GpHxy9Eldmo/AcQLw=;
        b=BcymkikJyz/enexLWllflD/bSnd5IRuKsZeXFhKz6W/e6DjrbuSqwSu4rETfbYGdYQ
         w1MSbV9Aq5Irl4lHlU5yPxvYZf46lZmcdjC5c88BZKGb0Rzgcbi3QLcRkY148Kt3S5ew
         9KjER6KHDCnBlPwyUNq5UkyOJizjfrqN2NGSw5iNj/flxL000RztgVokUlibpGsONtpo
         DiVw2SIuBFaM23J8uukZfJ43MFO+fHg9H4RiDY9I58HzIy53A9cAxTX0XmkoQnO5aJiM
         WkxkTm0tutskNm+iYCY54fHZqji+XAf0a049NitsmIYlamiOx/p7T9X2BOrlQMru+XNx
         BcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxcdK+EClHVhXHg2oZh5/jS6oPpNq2wlfYd4/TgcqpqViUk1V4Eup06jc76XhCfdX4sImeFJKwsvwsJ5ik+zZ6@lists.infradead.org
X-Gm-Message-State: AOJu0YxQJJItDlI+UdjLwYpSjvZxOMrEuM4Rm+DyGFUGLbRsrth7O0Wy
	Y5uFmpyStXqYmRXiMe5FqHxkic+/vV1/lYxPR0upPxWWixXJye9b5mHLbBx0FdBE4Aw=
X-Gm-Gg: ATEYQzyl1ybOQiXCdd/KYtLfCJm+IPzhExID8rg+iq91rtYbd9SUNZDSnuyl8OkNZ0j
	fVYpj5MKnHgDIr3kUmxKcuwnIN/PbQT3vMx6ga6qElb7lT13Fd7WTS7UVw1qdfTq6yd0fNeAmT1
	CH3ulFV/tT+wigZ3S5J59COiqbprQisrWpQX+SkX5Re1NBbziB5WnFGwAaiti3UIXexsCATjtJ4
	5k7KC90pV9OYzqN2JtodeGZJRp0WYbVHd1RIpuEZELElnrC9Vqg0nmT6IA9bxQer9IszHXokNsj
	GsJamZYDsSX+iFPEUsEoLnwuCkA0OgABCtdK9028v+WEE4gSB2PPKV/QIjps7+hb7nd/lytpGho
	W34LnbEBUO0GDrz+ju0EPr5Vde93jQgThmC+JUpw9/jCUbULsi0mJlLbK979ilFuiC+YYjvsdZ4
	SnZGKNwJzIl/LkIiZ6Xap7tGdpJaI4IyP8yAE3sXqekYLK0cISwqmxfOtitbagrXaH4g==
X-Received: by 2002:a05:6830:4428:b0:7cf:d168:2107 with SMTP id 46e09a7af769-7d7825cbfe6mr1074685a34.36.1773361599160;
        Thu, 12 Mar 2026 17:26:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:bf:9982:ff59:466? ([2600:8803:e7e4:500:bf:9982:ff59:466])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d76ae39600sm5254761a34.17.2026.03.12.17.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 17:26:38 -0700 (PDT)
Message-ID: <c2618423-2466-47bb-a8cf-7c849e7e231e@baylibre.com>
Date: Thu, 12 Mar 2026 19:26:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add device-tree for Genio
 720-EVK board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251203-add-mediatek-genio-520-720-evk-v1-0-df794b2a30ae@collabora.com>
 <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251203-add-mediatek-genio-520-720-evk-v1-3-df794b2a30ae@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_172640_410762_8DAB4B22 
X-CRM114-Status: GOOD (  11.44  )
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

On 12/3/25 7:59 AM, Louis-Alexis Eyraud wrote:
> Add support for MediaTek MT8189 SoC and its variants, and a device-tree
> for the basic hardware enablement of the Genio 720-EVK board, based on
> MT8391 SoC.
> 

...

> +	mmc0_default_pins: mmc0-default-pins {
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
> +			drive-strength = <6>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO166__FUNC_MSDC0_DAT0>,
> +				 <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
> +				 <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
> +				 <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
> +				 <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
> +				 <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
> +				 <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
> +				 <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
> +				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			drive-strength = <6>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};

Should we also have pins-ds here to match mmc0-uhs-pins?

> +
> +		pins-rst {
> +			pinmux = <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
> +			drive-strength = <6>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
> +		};
> +	};
> +
> +	mmc0_uhs_pins: mmc0-uhs-pins {
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO162__FUNC_MSDC0_CLK>;
> +			drive-strength = <8>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO166__FUNC_MSDC0_DAT0>,
> +				 <PINMUX_GPIO165__FUNC_MSDC0_DAT1>,
> +				 <PINMUX_GPIO164__FUNC_MSDC0_DAT2>,
> +				 <PINMUX_GPIO163__FUNC_MSDC0_DAT3>,
> +				 <PINMUX_GPIO159__FUNC_MSDC0_DAT4>,
> +				 <PINMUX_GPIO158__FUNC_MSDC0_DAT5>,
> +				 <PINMUX_GPIO157__FUNC_MSDC0_DAT6>,
> +				 <PINMUX_GPIO156__FUNC_MSDC0_DAT7>,
> +				 <PINMUX_GPIO161__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			drive-strength = <8>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins-ds {
> +			pinmux = <PINMUX_GPIO167__FUNC_MSDC0_DSL>;
> +			drive-strength = <8>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-rst {
> +			pinmux = <PINMUX_GPIO160__FUNC_MSDC0_RSTB>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_00>;
> +		};
> +	};
> +
> +	mmc1_default_pins: mmc1-default-pins {
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
> +			drive-strength = <6>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
> +				 <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
> +				 <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
> +				 <PINMUX_GPIO173__FUNC_MSDC1_DAT3>,
> +				 <PINMUX_GPIO168__FUNC_MSDC1_CMD>;
> +			input-enable;
> +			drive-strength = <6>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pins-insert {
> +			pinmux = <PINMUX_GPIO2__FUNC_GPIO2>;
> +			bias-pull-up;
> +		};
> +	};
> +
> +	mmc1_uhs_pins: mmc1-uhs-pins {
> +		pins-clk {
> +			pinmux = <PINMUX_GPIO169__FUNC_MSDC1_CLK>;
> +			drive-strength = <8>;
> +			bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +		};
> +
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO170__FUNC_MSDC1_DAT0>,
> +				 <PINMUX_GPIO171__FUNC_MSDC1_DAT1>,
> +				 <PINMUX_GPIO172__FUNC_MSDC1_DAT2>,
> +				 <PINMUX_GPIO173__FUNC_MSDC1_DAT3>,
> +				 <PINMUX_GPIO168__FUNC_MSDC1_CMD>;
> +			input-enable;
> +			drive-strength = <8>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};

Don't we also need pins-insert here? (to match mmc1-default-pins)

I was having trouble with the CD input pin not working in U-Boot
until I added it.

> +	};
> +

