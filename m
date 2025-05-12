Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7A6C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 18:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqGdI0u7r+KY5CbJScsuboirtiZOmF2NseWC3BorEbo=; b=U0tC+iyULjNOQCysYzLFwkpg7K
	OZq3PjOR+2pnoxtQtdTSSW+0z0HjMXGbltXeYf1G4xFJpmW2h2Nm8rRU9uKj+jbPrCe5F7m2cHrcB
	nxSrBkfmLWRjSqHnrK9Psj9FRWBZjj2BQRXbXQkD16tms/TwX5KVDfXn0i/s7SVJk4vWZIRiO7LiK
	YKGLDp0/mdgUNyOJqZ+7mb9mW9qPXVHBTRz8VIhkelfwEs5d0jvP0uaAbmS9FnCTjOnn2fs7OVzVo
	E3F6Ou2YucMtsPgySWGwyctIf1xhxkMQ73V2M3suRzVsR/Rbxg9KCUOueneJ8T7dSjVgTUXgKVdhd
	I+1l5U3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXu9-0000000AOEq-0Vek;
	Mon, 12 May 2025 18:29:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXaK-0000000AIXq-26Bo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 18:09:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso50569875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 11:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747073342; x=1747678142; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TqGdI0u7r+KY5CbJScsuboirtiZOmF2NseWC3BorEbo=;
        b=ZWwoV1tJ6Z59Z7TpEOIuosMLgRBDp2+xnq9FJ2xuZfA+IUf3GXjPUW7Sew2KTQ3Bn8
         z/+p/Ro5S3Vq3s5g4v5gY974hmhVZ+ppkqE2nudlb3CtVTkdVwpJsprFV8pomSxivEc2
         OPzGMqyRaTJmKENUr4sXSDb7KPhqIYWl37pqSDnC01HLyruW6wY7oz4ORJmtn7aw13zW
         U8EAyGrDxdFrAlXkgTkpW8PR+I/vXBYbODmzsc3jOjRo+DVF0k+tRzWMGEQU4VQIfkuj
         rwRKpjdSJwv9nIBVt1Ygkbm1u2lY4/kyc8GdikQsbc3KDoHXbLquX2Sf7R8hdvFw2FR/
         RgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073342; x=1747678142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqGdI0u7r+KY5CbJScsuboirtiZOmF2NseWC3BorEbo=;
        b=CP5Bla509QJWehlGijGsPQVUWwe66QCV6jGF1xD5+H2qEhQla/xoVF1f/smcSThpDx
         WBlLZz3SOGEzDb4PHi3BP7l0sNhNB2z10nPbtYRIbuIi83mWng11nVF0CqdQ7Xle0TRm
         mPj2SLFKQKxW4wtT2dDL/IsLdqjCBIJEcfimlVTJs+9Q/peoCNuzuM/q7HkM0Lhgh8je
         KKvZaV++6fu/YvvPYuG+FAhGxdU6DmghZDuKRqB02l2vo/cChKQMRYe4AmuQ8r+XID86
         HfTM+pY/JODPngMvKQInv4UanSzpzbkVAD8CO6lQL4w0IxvlMf5ypWHlX4pXM5stFs+T
         xh7w==
X-Forwarded-Encrypted: i=1; AJvYcCWUFa8MylAxK/BFivKLK/EYWxUmJvnlLHGkcUlQpB8GK4QIHQzTZ/cGX+4XQ027a/opEUmtzEcY1l3kHASUmqKj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/kGOopjBJm6HbBueSOfraqmKFH9Yd/vsVmLjyxqtOo4sigZkf
	g5QX380DYVj5YuQT/ZFe3EaZvdZw0eOheqsl4u1PeNI0RbiBpqdM
X-Gm-Gg: ASbGncvrNwu3vkcxsEmmwXtdtNP5vDOoqZDHbmV14XI/oXDPTFBkyHUW13In8eMtHgw
	SHvkZKQLnY8lPYscmEu6lEMKqNmhcDItSMhazJCXVnydQxHbHq44B2pKRZE+oFSg5sj4lajMA5l
	tWc4sXray0ASoifLRvQZ6MriFVrblhSRoPTgHS7SxAhfAesEwQv1YB+fpXhOt+OKYRjjFO7PFWW
	ke8XoGLSNgtvkgAq6mgXsXKykYhmo+Eh1lcWjglMLnYk559ZpImOyhTz61k47P7Q+EKt6Byd8M2
	kABJKVnquvKoEUNytWpJB7yTrAQ6gIUX3YeNLEaoSMhNgceTrcQduzqA4UoVLAo=
X-Google-Smtp-Source: AGHT+IFw+AkbDnKjFZClxNbYQI+3I+tTSTGJnGpv7ufV8y5CAq7nGPHM3nF5qWIrKS5j7UeyFSkz5A==
X-Received: by 2002:adf:cf03:0:b0:3a1:f6fd:da50 with SMTP id ffacd0b85a97d-3a1f6fddab1mr8230689f8f.46.1747073342301;
        Mon, 12 May 2025 11:09:02 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde6bsm13417967f8f.13.2025.05.12.11.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:09:01 -0700 (PDT)
Message-ID: <fdab2ea2-824b-4b52-b880-0b097fd29086@gmail.com>
Date: Mon, 12 May 2025 20:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm: fix imx_* defconfig
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250510011806.13470-1-benato.denis96@gmail.com>
 <aCGPMvP6F6r-57KF@pengutronix.de>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <aCGPMvP6F6r-57KF@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_110904_546391_D3D0F8C4 
X-CRM114-Status: GOOD (  15.53  )
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


On 5/12/25 08:03, Sascha Hauer wrote:
> Hi Denis,
>
> On Sat, May 10, 2025 at 03:18:03AM +0200, Denis Benato wrote:
>> Compiling the kernel using affected imx defconfigs lead
>> to a hard CPU crash that reaches a state where each register,
>> including PC ends up in 0xDEADBEEF.
>>
>> That is because the SoC support depending on CONFIG_ARCH_MXC
>> gets disabled since CONFIG_ARCH_NXP is not defined while
>> said feature depends on it.
>>
>> The default arm defconfig is unaffected as it defines
>> CONFIG_ARCH_NXP=y correctly as excepted.
>>
>> These patches solve the crash causing my confusion:
>> https://lore.kernel.org/all/c84e8246-8104-4409-8d95-389d61bc07af@gmail.com
> In this mail you say you want to start a ARMv8 i.MX8MM board. The
> configs you are changing are for old 32bit ARMv4-7 SoCs.
> arch/arm64/configs/defconfig is for you.

Hello and thanks for both of your answers.


Yes, I have made the mistake of using that defconfig for arm while building an arm64 kernel.


I am sorry and thank you both for correcting me.

Please, ignore these patches.

Denis B.

> Sascha
>
>> Denis Benato (3):
>>   ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
>>   ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
>>   ARM: imxrt_defconfig: define CONFIG_ARCH_NXP
>>
>>  arch/arm/configs/imx_v4_v5_defconfig | 1 +
>>  arch/arm/configs/imx_v6_v7_defconfig | 1 +
>>  arch/arm/configs/imxrt_defconfig     | 1 +
>>  3 files changed, 3 insertions(+)
>>
>> -- 
>> 2.49.0
>>
>>

