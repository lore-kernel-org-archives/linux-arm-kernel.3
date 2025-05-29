Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2136AC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 06:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2SWtTNE3E49MOlHnO8uVeg5xT5IQxhtgIcjK83+ABU=; b=NBhpxZpWwPbHydqetVWzeNiYuB
	fgMsGE+fShL0paT24IliXDgtOQW35VLr/dz4zBFEtArI3g1l2eNgAir/Ry7pCf0WVRHt2m4bjBhGD
	lZmnSKr6m2Y/nQmslinrL3ZeIe+s95oo2HCymGvw1p6+X9PLAI/vnJxt5eZN8XzY8KSYYezL9kAWR
	8FCJBiguEKSCoQHhDkAHmnQkEXgj9tcFROb0LHF0mBYgLh+D12CV9Y67Hw1LaKidwzEd1T4oH6Mv5
	LKf4XEYziFPxETTyPqhniSd6eGlVbMVgHPGZkTn91T7ZgZd7Aqwl4nvjWsTNueBC5OjIHYOluhFhv
	QyEcndpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKWks-0000000F4Hu-1mPm;
	Thu, 29 May 2025 06:28:42 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKWik-0000000F46n-1wUn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 06:26:31 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-604583107c9so133815a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748499987; x=1749104787; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+2SWtTNE3E49MOlHnO8uVeg5xT5IQxhtgIcjK83+ABU=;
        b=F9oAZ2cxcMsnNe4b1TQEqbtjPVTlChKd2Q3xDD5CYuliAnO3eqT+r4y1fp0CitdedE
         foFasEZtMzJ9/m+DHifbxPjcy8ZFR5s1sXEkw0xfx3Ewvwk761SBXI/vUNkLirnAThBu
         g/JPX8tpK268paVw1P4YpRIvrCCmUiJpTG/CCFr2/C1rVz/npEFVMQh9XkusFCqlILPD
         RF2nzVyBsXGJyGWxBcG9Sms02Nd7EZyHFJikRGTF6cvizQCqueAs3qj2SOIpvMHkNGNo
         eaeVR+JuK3We2W0tcl6/hFCFvVDvuDSHfO37Hy37sKE7dVseZCCHsVnvgIy0fT2aQJzK
         529w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748499987; x=1749104787;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2SWtTNE3E49MOlHnO8uVeg5xT5IQxhtgIcjK83+ABU=;
        b=AF6qjt9HvzkXPkPV+BhN5CssumiDC10RdIMGmsJRGN8FVgxs1doCfgalxFhVe1OaEB
         yCFWKJUncv7B/14Lrs5oWUGjqM5hNcaLAKjAVLdPS1ms0OwZfT8pNO0pFDTsnJdh0UFV
         uhlrM721YCauaXqjd3CiWGC+bZX+3uoPaAqb9ZXBDNfvuEoKOJ50SllgQXCZyHeGiIUA
         ANaGj2kdIZ1xz2kdiMPHTsUyW1jpep/8uHPSIu5rbKduyutX8ONgdnN7YItV+T0pvhyx
         mHHEbwg6jFii+pi6bWajIcZcNjK7++A2dLM7zN6QU9NONR1WBdeV/GGSQUtqSCVf1g6W
         2PxA==
X-Forwarded-Encrypted: i=1; AJvYcCVArpto08FPkKvLHCc6e9Jnfi7MovvMflY+5lLYsv4NSvi6hpkINZiBjbwKH79mmWYzsfckqU0Luto0x7hV5Thj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyrj8oK0VOQWFM2N0Acz0JW13EbEWEB8Q1OPYmoCHB4tdt7hBg
	xHs565y0lsnJDTgfdUiIDD7kaaj4Vk0c1n8EGKqsMMmnQsEWCjEWznTft5IJaPOg4r8=
X-Gm-Gg: ASbGnctfHwnN67VvxHcdewt4rqRe1vZsjj6+a/V5p695baVy4wvUJ4Zca8CmqqU3Brl
	hggrsIsPPjWut//fTcuuAVwIREwLAgHd3gRLTbzEkHmXDSsZlOfLjtVEH2QPbklpaepdOUAQI5y
	f1KocuDxAlICEZduTl43j1RXa0L0UwG0vOWCeTPqr4AenG+4MuqIvl8iDvzaGOLTLlITnMgIkkB
	vYDXVwlVvonWlaUqf+61gjT4zGwT//R+1iRFl6EtUbiXyWk/SH0q3tSy2J/q4epoGJbbVf+6P2N
	Fr5SU27FdysEs34qZeBwux4SJt5jy6JjYxHJUKEK4KQRCV4mZO+5UUpV2pdIxkZSZprnqco=
X-Google-Smtp-Source: AGHT+IGlMDzn+QG/07M9P/X4G1UkWeHWA61AWrk71VubiDANJ+WF35EJENPRBZsOw8VSgdWIr7Porg==
X-Received: by 2002:a17:907:2724:b0:ad8:882e:39a with SMTP id a640c23a62f3a-ad8882e03ddmr319125766b.8.1748499985639;
        Wed, 28 May 2025 23:26:25 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aaf5sm79818366b.183.2025.05.28.23.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:26:24 -0700 (PDT)
Message-ID: <6bb4f8f7-ef95-4f10-ad94-027fa18dada3@linaro.org>
Date: Thu, 29 May 2025 08:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] pinctrl: Allow compile testing for K210, TB10X and
 ZYNQ
To: Linus Walleij <linus.walleij@linaro.org>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lars Persson <lars.persson@axis.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250528-pinctrl-const-desc-v1-2-76fe97899945@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_232630_496148_EBE5D16F 
X-CRM114-Status: GOOD (  14.35  )
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

On 28/05/2025 12:40, Krzysztof Kozlowski wrote:
> Pinctrl drivers for K210, TB10X and ZYNQ do not reference any machine
> headers, thus can be compile tested for increased build coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 33db9104df178e5a3148b60c3c6bd153113385d3..77a5d13e899f8c5251987c2c74df1d05dbd59128 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -269,7 +269,7 @@ config PINCTRL_INGENIC
>  
>  config PINCTRL_K210
>  	bool "Pinctrl driver for the Canaan Kendryte K210 SoC"
> -	depends on RISCV && SOC_CANAAN_K210 && OF
> +	depends on RISCV && SOC_CANAAN_K210 && OF || COMPILE_TEST
>  	select GENERIC_PINMUX_FUNCTIONS
LKP reported here issue, so there will be v2 of this.


Best regards,
Krzysztof

