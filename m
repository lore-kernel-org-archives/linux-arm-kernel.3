Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9402D66B9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 23:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mv0GRhBH22P990rmtaQGs6C18s0425l5jLKWrD0nHGY=; b=pm4oadU8AskAsxbnHYEFkR4DN4
	+yI5FXD2Whnn4Y98RyjLkBc8U3jzkarOt0/njm1OO7F98y6vP6MvF57VKCXDpPh+xQG4r8lswDamn
	KHQYYhXGpQWGnA68pa7trBsnFGloB8RaJeL0olXKen6UyXDYaOWw+vqMPe5seUWXWTmQDRp3CleIS
	Ws7W4II7FP9ry16Z4Z+AipfV6lEFmdwsxlHPr+74zbhaD076SPm1yEqrdqexh995hQNSYydHBfLnH
	UUGE0hGcdoW/haXHCEKKs23M/K0bStJM7Gw0mgHsURcWlHpmYGySEAi/0FbTQ0bDYcXssIUmh7C7E
	ici0Filw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG5Nd-0000000BuUF-0jfJ;
	Tue, 26 Nov 2024 23:54:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG5Mf-0000000BuOu-0RN3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 23:53:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2129fd7b1a5so44620665ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 15:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732665184; x=1733269984; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Mv0GRhBH22P990rmtaQGs6C18s0425l5jLKWrD0nHGY=;
        b=c9zBNb/QCG1PJyAKEQP3DyZND4CdZnYVQHI4CW7m+ljMhIqFFsTWmPX60SPACXzJhj
         FS6/CjNHOqwI+H7TIsnaN7Wzhk/05bf2VJ7GueA3DBjt7IJzF0vI8AmgL/UnW044e9ES
         1m9NArHPATpHZAvAVM7PHRgKOgKNqutYoxKjEUur89NlJDsMNmQwCObxviHn3XmsApFc
         NFTGQO1fMYhR+0JPQNXXxqBQ6jghGfvmIkHfpEap7QovI1fjudmVarjhE8s0Nvm/rz99
         i2F5ZCHFzYWNzmF5NyAHNoctPCfPjt5JB3IXTaIE1YH/pCEjz5sugZYBp9vBALoOgfS5
         icbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732665184; x=1733269984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mv0GRhBH22P990rmtaQGs6C18s0425l5jLKWrD0nHGY=;
        b=hYG6zkwbyQmYM0tyxeSiARF4yJb9umkElKSu1kDSyD4IMSIzTA51MV7QIGwO/8vm0M
         KD2m2J9baCXLYAHd3+PQMNJF62Cay+52aYDDG2e5LFUcO4SF+et1ESpyl+aaKTNTgvQ0
         VVxs+aqQZFUhXTh7m3EOlVX21bZ/gTGJq/aVXFCKk79JxHLCef2egfim0epfUDKZzspO
         SXzf2Vzzjcp2GvbcorCZ5Hhjhc/nIKK9DngHddIt3nFPFNxMl4Bhihm+DN4HE0iiHVvI
         PH212Rhbq/Stpj8YLv9hbTrJa8PI+/TPBMBsqRT2Ifua8HEX7/UP6hgl3Jdqn/WXTlgG
         pK5g==
X-Forwarded-Encrypted: i=1; AJvYcCVpK81TpKYeGDRpixv9hDQ6xV51lO/gJq1LnAzIL1GSo0EGJM+YtysVbTZRBakVDCWTDH6k4oLHyRWU+cIZY5EZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywmur2P51OHmV65jFUJS0edE3+kXiVUEbP8eCF0UPRCjmb4A+Qx
	DM0cUbcLdOD6bJxB2g15BQS4sk/mYUKanu83usMuayQ96s4nP55Y
X-Gm-Gg: ASbGncuEpKb4jr4YFlZVTL8JEQLDSDCfd3RyD1aWM0we7Y+A5HDJUiGYAHuMtPmVCw9
	W+J3qdwVubCF0+mWwINFP8W/17MVxlPrMIAiAaskWT6uwDZBWKKfni0VwdmWDPWxC1/CaO30DQN
	nuS/M76pXrnQMjMyb+gSw1qwOmS2QMdr4HbhKtUzjZQfuoDgGmisAm/31d5PqiqN9/xdnv2g58m
	On7NNDam+iAPKMZnEEZhMT+yN0PMsoBRCKZ/YfkDbZq4WCzj1GNCj+PcAWfXH398UALjAgPOgw5
	K/qZsR+aR2Bu/hfIbktf+Dc=
X-Google-Smtp-Source: AGHT+IE+aE0RgQuJgMVW2Z2si/glU755xysZtQ/41BKL2LKF0wCUKtK1Qcir7UQQcj0Abw8HICDgRw==
X-Received: by 2002:a17:902:da92:b0:211:efa9:a4df with SMTP id d9443c01a7336-2150128c651mr9699265ad.17.1732665184346;
        Tue, 26 Nov 2024 15:53:04 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfed7esm90546515ad.148.2024.11.26.15.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 15:53:03 -0800 (PST)
Message-ID: <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
Date: Tue, 26 Nov 2024 15:53:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Esben Haabendal <esben@geanix.com>, Russell King <linux@armlinux.org.uk>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net>
 <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_155305_142218_BA7A5AC3 
X-CRM114-Status: GOOD (  19.89  )
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

On 11/26/24 13:24, Linus Walleij wrote:
> On Tue, Nov 26, 2024 at 5:17 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On Mon, May 06, 2024 at 12:23:53PM +0200, Esben Haabendal wrote:
> 
>>> Making pinctrl drivers and subsequently the pinctrl framework
>>> user-controllable, allows building a kernel without this.
>>> While in many (most) cases, this could make the system unbootable, it
>>> does allow building smaller kernels for those situations where picntrl
>>> is not needed.
>>>
>>> One such situation is when building a kernel for NXP LS1021A systems,
>>> which does not have run-time controllable pinctrl, so pinctrl framework
>>> and drivers are 100% dead-weight.
>>>
>>>
>>> Signed-off-by: Esben Haabendal <esben@geanix.com>
>>
>> This patch didn't update default configurations, meaning PINCTRL is now
>> disabled by affected configurations such as imx_v4_v5_defconfig or
>> imx_v6_v7_defconfig, making pretty much all imx platforms non-bootable
>> unless the default configuration is changed manually.
> 
> Since the patch tries to add default selects for all drivers I suspect this
> oneliner is the culprit:
> 
> @@ -6,7 +6,6 @@ menuconfig ARCH_MXC
>          select CLKSRC_IMX_GPT
>          select GENERIC_IRQ_CHIP
>          select GPIOLIB
> -       select PINCTRL
>          select PM_OPP if PM
>          select SOC_BUS
>          select SRAM
> 
> Should we just add that one line back?
> 

My understanding (which may be wrong) is that being able to disable
PINCTRL was the whole point of the patch.

Fabio submitted a patch enabling PINCTRL for imx_v4_v5_defconfig and
imx_v6_v7_defconfig explicitly [1]. I don't know if that fixes the
problem for good - I see CONFIG_ARCH_MXC in other configurations as
well.

Guenter

---
[1] https://lore.kernel.org/imx/d718ddd2-d473-4455-b21a-15024e46787c@roeck-us.net/T/#mc71dc21d99e0b013c5ce46c0d90940fd8806ae9a

