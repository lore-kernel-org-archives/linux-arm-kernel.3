Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F91DCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 15:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4Fx3qzFZWS/hy6emLnQdWr9PVk4yhndpp2ap1cUgH0=; b=kifW4AHA1cJAdMchbpPWeu7ZKF
	G8cOUnk84gl8FQZq7JEPKybiW12N8kcj4kK5YimqpDAEdbqRSwafHNUmX8mhEpk4n5NQQhzQg4FmC
	UTUn/R3ejFGSLpdQCZEfmzwqHZu0RBvtPyIYlQ4gDZecH5rF8sCPJfXpxnE/iqoIicgbJp8xwxr4Y
	qyQV/BWKDVBx6RpLvEUhZsjAHty7K8sSUFacVTpj/oQziIwQEWMNc6Csg+Zk167iL+rY4CHECAYrj
	HuyRxt1gIon0OHL6yeOvkopEmemOtErZJHREb6yYNt7XMYE45GYJGyIdeWnK9cITTFk7Ofi5Il7ja
	4bOeivOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBx8s-00000006kOM-0nnW;
	Thu, 23 Oct 2025 15:22:18 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBx8q-00000006kNM-0NzQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 15:22:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-427054641f0so149560f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 08:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761232934; x=1761837734; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c4Fx3qzFZWS/hy6emLnQdWr9PVk4yhndpp2ap1cUgH0=;
        b=NZ2IAfPeRLMh+CP0p3OYJMqfcg/RiGC5iS0y1Xs91LTZCltS9MKPKDu+6eUn+er4Ux
         NAmPjf7DgcFF2U2subO4RsbTp4bxGzNVY8sD8z69zR+tLbyB6jPhoaKZQEQyPLLmSUwn
         4oSjQbAZUqTZjBfXq2pZigxka/fg1dEZbrZSRiEDeqKPkquXO0ybPCjuuQfgVP7Zilc3
         zS2uYLebYg0qV8BKeH+j/QRqJtTpNSiDk7blN8wr1yzPODfmF0ZSvwA4dKuD0nig/ygJ
         VbLWTwRE2fidM2KccmtTPZ2pVP4qZIPzqiRo9xRSpOhuW2Ffj7nL9SSnbmt4Zzu7iTVU
         uZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761232934; x=1761837734;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4Fx3qzFZWS/hy6emLnQdWr9PVk4yhndpp2ap1cUgH0=;
        b=k/c1xCYZL7Pyo6OsBQj3A51r797MsR324wjgTfQHXOx4ZnZlmw+/4S9OpWJ++TTYnK
         tQPj1VzIRQVmV1uPCxm2H2zIKrYZBzMPeOwDB2u4fNQ9T4ZGvOIpvjGcB8ghh9OM2Zqg
         ktoLh2MchSLYxYe+aCyqv6AM627pDxS8nrgStg8HTlRlo6YxAz/42nfVGzuVKzSmb07V
         nJ7KN2QOJBjjstw5jwegkNFaz+dA5L4h2NzK4GoVuAGSVopiriW0dx5wLWJTZnngX/9j
         XuXSDiDNT5luSwR855iy7UTy2JmK7RNG6yJFZgDAcgzTfjfpEoiL/5sx5oP3Xij16pNS
         Y4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWVdR2CdPAVFRAJf803+SwRIN4Q5ut9Bf7bbl1/ZDqfyMrLuXvqOW7ATUwWhwKO4pRlXLq8S8lH2GbQM0/0Z15n@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ4d3P0NnequMKKrJzsdP9gN1RNknmtc3O+JvmSqQzGsU4cE29
	osjGWMHGr9eSdquWiavZ9z41RAVvt2MW3IMyqe+HKBU68G90+Dsx8YKrKJiMbHdj1ok=
X-Gm-Gg: ASbGnctdHWwxhMrWN43W5SZtS5djZR2Pse9fbpv+Xpx8LDU7BYs4alCsguft9NsAnBu
	8ztOw59aSbR30nM3ALsNLFAXgg7EmdqvCtcTc6m0rtfMpw9mMupvyRlIT8EW6wYKPGTlGMSeibp
	gBHgAFnN5TUT/IYQFAoXVrNiAGwC72wjldg/QDfh2ltkkcE2Wg8JD64/o3XMqyrbSj4hms2PySR
	57XeEOkeRaabtYdDC5/ZrJMSy3vNFuFQWXC/OAyZCCeo1s3bqQE9u+oyWZyvPC9Yzl0FxKJJz6S
	eJlmh3PIp4KKMefiNZ9Q87znaj1lJ1hmTej3VcLjwIEBh9AevBvRFPPaW+ZKCRistxafYBgKZTA
	+Fr+r68b6Iyvx5hsc1BdGlQGwrVnOfUxJ4OEf+Y1YzcUGw+gv53VivEPMcbdWXhurHFKVpGlshB
	5IIDE95SplEew2kiCZWT5u
X-Google-Smtp-Source: AGHT+IH4MRezzpyNDvBnjBEHiXqkZH8hBBhFxBYhslQPq+4bBt4WGTJBKs3PqNGZn+t3+iXL+u675w==
X-Received: by 2002:a05:600c:1e8b:b0:46e:36f9:c57e with SMTP id 5b1f17b1804b1-47494305991mr49817025e9.5.1761232933974;
        Thu, 23 Oct 2025 08:22:13 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898add96sm4452598f8f.30.2025.10.23.08.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 08:22:13 -0700 (PDT)
Message-ID: <e6b282cf-e9de-43b7-a8d4-30e67cefe430@linaro.org>
Date: Thu, 23 Oct 2025 17:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: defconfig: Enable i.MX95 configs for booting
 and Ethernet
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
References: <20251023-upstream-imx95-smarc-defconfig-v1-1-62c6e6f5b315@toradex.com>
 <3381308.aeNJFYEL58@steina-w>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3381308.aeNJFYEL58@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_082216_160416_0B5FB6A8 
X-CRM114-Status: GOOD (  14.07  )
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

On 23/10/2025 16:03, Alexander Stein wrote:
> Hi,
> 
> Am Donnerstag, 23. Oktober 2025, 14:19:15 CEST schrieb João Paulo Gonçalves:
>> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
>>
>> Enable the necessary missing configs for the i.MX95 to boot and also
>> have Ethernet working:
>>
>> * CONFIG_NXP_ENETC4 for the network controller driver
>> * CONFIG_NXP_NETC_BLK_CTRL for the NETC hardware domain controller
>> * CONFIG_PINCTRL_IMX_SCMI for the pinctrl driver
>> * CONFIG_CLK_IMX95_BLK_CTL for the shared hardware domain controller
>>
>> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
>> ---
>>  arch/arm64/configs/defconfig | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..787d3ae3f5afeac486a905e0943e7b0e1dcee3a9 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -354,8 +354,10 @@ CONFIG_FSL_FMAN=y
>>  CONFIG_FSL_DPAA_ETH=y
>>  CONFIG_FSL_DPAA2_ETH=y
>>  CONFIG_FSL_ENETC=y
>> +CONFIG_NXP_ENETC4=m
>>  CONFIG_FSL_ENETC_VF=y
>>  CONFIG_FSL_ENETC_QOS=y
>> +CONFIG_NXP_NETC_BLK_CTRL=m
> 
> Are you sure this should be module? Shouldn't NFS boot be supported by
> default? I might be wring here though.


NFS root is supported already with this being module. Yes, it must be a
module, cannot be built in.

Best regards,
Krzysztof

