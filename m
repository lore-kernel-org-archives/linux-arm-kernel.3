Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203DACCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2m2cwzlH5wpE3kdOpcqs/uIBHJrsaPfS9kVRJa4lNf8=; b=jFC+krtYmOK6NoVA90mZcpfQwa
	C3fYD8ROplPZCDwuKYb8RnQtvpNr5sFom+D2jWqesS8QZqoMdQlRHuxkqjGmfeTGxQQT9FO10rkN8
	7Ash6CmDY/hnHLzJEs8gC0B8DKFBR4wP4RedDBjuZq+WkPXL0liKCxCkPQ6XerDT1BKvVt0skTcsn
	Q7J5oEzgnKtKkaNyeUAutcR2bWavrmyd0IH9uqF37z8xRBZjm4+cyEeVv+ltNWM6Aprbiu65QFv3q
	Z7LDUH3wJEn+C9+LTRBs5J9an7IAuAjr4/5zr4ZWurqFdc/xn6jFg3zopqFKALe5RGZwZDy42ZvLA
	0Mm7fVrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMV1-0000000DulQ-30u4;
	Mon, 27 Oct 2025 12:38:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMUz-0000000Dukn-1NbQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 12:38:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47714bb5c49so642435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 05:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761568735; x=1762173535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2m2cwzlH5wpE3kdOpcqs/uIBHJrsaPfS9kVRJa4lNf8=;
        b=vZsTF0+dmsTGgEIGoQFpJZv47SxaZRTco4mLNsLRLYenBRThAgXZTzvp+ITQhI2l8Y
         ApKv0tA7Y5qjOpAzWl26tj6U+pzEeiR9EEKH29s7aPKzc8N1kV5YEJC1Wp1BUQ54vUVt
         hFJ77sRA/8B8/wlnWx9yEHXSvP2CYky7R/3XDvQJVB4nP1xR5d+IjjsyrDi6RLmrg/94
         gBYvl9c42bErkH/6yRhQNGfy8jb4C9JJSIWSCkh+fDmfEJFoo0zgz0dIBZjeiWe+WZ1Q
         9PtJgMugQavVrmPMYyJJPez0B2lAosSW4OcHszU1APIO+jxwwyL/WMEhfsolPYnLK9Gj
         61+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761568735; x=1762173535;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2m2cwzlH5wpE3kdOpcqs/uIBHJrsaPfS9kVRJa4lNf8=;
        b=Qwbw7hV7Ss7L136jzOTVTU2PSNmY/M5Y3tgKQvCbNlgI2EULAwxzLvAgVuB9tPnSfC
         CgRCPHPKT9Yo9NbCVw3KSTksNBjzsmYyv31YW7f+IUYWhOwv0x5A2iYn09NSqrGwkvp6
         gAJ5cB3pPvV4fquZFD39PccfjfkLr8f0bqotrNultVOU79o3yAV9b3HJkmcjutQV9+Z3
         fer+07OoKKUEYofNPKzZ+KK7+Oqtn1Yz27wBe1gVhQQG2ob1akyDRbninJW7eDBP3sEK
         yTehxamz6f722Yk3ts6E9X31WVN2ZAf/aD1A1ePtG+WVjHDSo3IXS3t60y9KYedj3Z2h
         1T8w==
X-Forwarded-Encrypted: i=1; AJvYcCVx0EThgKSA9YyovaTO2o0xX/Ln1Bx1kj2JiPIAd7aSOJjgZINvIA0i8fsSDJ07Hg02u9e5d0P6NR2qKd//2SDS@lists.infradead.org
X-Gm-Message-State: AOJu0YzcnPEYTw/ms/9VXvRcrExvnKfBQUjyD+fQtWTSuf9sg5u3jzBI
	0tGKQxhoL4HEIqlgdNc5k4BA6jFgXqioqrJsG5Xnusvm65+MzLUygt3H99Fc0khSKRg=
X-Gm-Gg: ASbGncvf5QDu0fnilyuXgzTmGljlbsAclIXXwRNDphYL188n+uKebSi5DEM2LPYVkDQ
	SM+MnCxmN+74ApAEA5h59GpSJ9QyNvrRrMBfXIItsfv9U5fo5cM/FY/hjyNJb6H1z+Ip2bqQ+Ql
	kFOGqeIlz3nllH99kpNB38hnEPi4gc2My7JbVeNuJaAmTsymOhgy6kjODVnx91Yj9txOputR5sH
	BzAIZI8bGar+IafbngWx107b4581GeHM95gqxEgNFenauW1TOkPJHSPFCxKdJTwMFz5kILQVwub
	0VO9hZsvzVnQn0139zo3P539ZcbniHj4HUVy3LFQCFfztj1Lqvi8DSNJSntbDbJThu/bkQ/0amz
	LzEY4M3b+5/vrrQ3R5mb+BS2JUUxl8/IpHfKfTl82WVjbiGCOXo1TvEuBGhodxHRzwSAYdh9/HR
	ompI5LOHbu0djrNu7AQTkI
X-Google-Smtp-Source: AGHT+IGnHN2+LGUXtGZpCqzNe4bVcec3o9TIo+eb2g4z7PQMElWw3oVzoXNocGieyNl5ZXcDJZ9cgA==
X-Received: by 2002:a05:600c:350d:b0:471:3b6:e24 with SMTP id 5b1f17b1804b1-474944c2050mr86946005e9.8.1761568735253;
        Mon, 27 Oct 2025 05:38:55 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd37467esm139395695e9.10.2025.10.27.05.38.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 05:38:54 -0700 (PDT)
Message-ID: <d97899d2-ce6c-4ef3-99f8-946a3c9ab74c@linaro.org>
Date: Mon, 27 Oct 2025 13:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: defconfig: Enable i.MX95 drivers for pinctrl,
 Ethernet and PCIe
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <joao.goncalves@toradex.com>
References: <20251027-upstream-imx95-smarc-defconfig-v2-1-0f664b08d553@toradex.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251027-upstream-imx95-smarc-defconfig-v2-1-0f664b08d553@toradex.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_053857_394410_D2491CAA 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

On 27/10/2025 13:17, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> Enable i.MX95 pinctrl driver necessary for booting. Also enable the
> missing drivers required for Ethernet and PCIe functionality. These
> drivers are used on i.MX95 boards, including the NXP i.MX95 19x19 EVK.
> 
> The below configurations were enabled (listed with their DT nodes on
> imx95.dtsi):
> 
> * CONFIG_PINCTRL_IMX_SCMI for the `scmi_iomuxc` pinctrl.
> * CONFIG_CLK_IMX95_BLK_CTL for the HSIO domain clock controller
>   (`hsio_blk_ctl`) used by the PCIe controller.
> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
>   (`netc_blk_ctrl`).
> * CONFIG_NXP_ENETC4 for the Ethernet controller (`enetc_port*`).
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> ---



Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

