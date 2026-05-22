Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3236CCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 04:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uaBSQpnXDZ0Lr2vqL2X8w5SaBUCpNSkuNqugybr2/A=; b=PI3lmLd3vekXqb+psdZ/MhloLq
	XWbD5pJTtSmATHfVYCeNzR/jz1HdbkcVVYyC/Mq/9CHnxgx/BYhjIKKNcYAs39P6kNVrqPF7LjsKn
	ZN2t0gSufMPwtBlEa6xu/LNgmj4lb/9rQdbgML5x+4AFmdPMSitkt99wCrw61GYBFwYrEhD9Oc0dl
	NxBNv9cV7KCymtauMws8ixDpblvdzpD55O+7m8/PmA9j+KsadaXp7MOa0P2nngvPYSqMuuM59VGNv
	FNuNCE5R1OG5JQY+MbDRc9bF9MUAT3M2lGxxZNZxsNO3hE3zs1UuoQ1cOxaTg79eGZsO993f1GetW
	K6qCNF/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHuz-00000009neJ-3iSC;
	Fri, 22 May 2026 04:55:29 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQHuw-00000009ndk-1icB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 04:55:27 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5a8891febd2so9480496e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 21:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779425724; x=1780030524; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2uaBSQpnXDZ0Lr2vqL2X8w5SaBUCpNSkuNqugybr2/A=;
        b=RMNgYWGjGiwGTFOul6dtAZi/GBH1Tvll5m5WO2DXUq12/U7qHBCUtPvogBPikS2nuq
         jyVZLvioz/tHcmTozl+vWpCuRgSxUWbhvqMjRQO/CPCqMHCCbB0h3yW7eywys+ZyGMfu
         tQpgK/Sf11obwwhvkSx2EMX6d8tlVT28kOo9C9HfrwXzH0McgNnJBnzbh6AsywTyNIyG
         aeIdMIlOfiY2uesYCfJrcscesVbY7cvx92lqRWWcdd6wHZH9517EofpuvfC11C1yT9Ap
         hfC2wOF37hSVEdPZrfAwwhQiYVJ/tvEKF3upiCgQVmIkHYKKf+VN4fM2IWVugWB43fMw
         TRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779425724; x=1780030524;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2uaBSQpnXDZ0Lr2vqL2X8w5SaBUCpNSkuNqugybr2/A=;
        b=KsZSzNxxv/I7/ENU0mwqVHNYoVBfzZzJ8sWoX6QbOMfHTwNJm9ZmRDH+j3qRDlmox7
         +uAytrMFBGFw7q1YiYVKxx5qgC0VwsY6uI09eYYt1bj/1JlHExxjNWBGY2ibmfgjR6zI
         QoyFyGXiI+ykA4gjyRP2Nyti25RVByETcGrOYBUulFd/fMdaQSyp/XcH2Tgd0AJ2//qk
         SRRb9Q5qhb+3Be01LHcdlIaOPj5oGT2oAcViiSKoGmRcRHbPbG4RFmoHxYNBOKgBRHo7
         +HfasN9cqZdsISHznFEGftvOSJIfem3jDzzTS4XHBjrthzHJPfzTYSHEVlpR7lgdXUEA
         qveQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rsUODW0sR5eUDQyaiSwEtfPWxEfluXLOnsbshejF9IITzO0JJV6ENlJTmHZWhcvhO/yTjwt53rs7wZnojwI5G@lists.infradead.org
X-Gm-Message-State: AOJu0YwUrg6GFJbrXDJjkv5odyM68PWjIEbiIaxEnPX+6nENaByoARLk
	cPJtkD6OemHr/5oMDbW3IgWtbU03qMELxBFKIjKcPXirshwHLAP4oMH5
X-Gm-Gg: Acq92OGy4ile4M1Gm6i0Rt5pu3IbupvuWjFa195g3DfKSWdbIA/cCjQH77N0bLCYmC9
	iHN1Gw1nGJxI6U1qwHtALfHlW2Mz9FAvqf9nzDlzxkfc1zvgHbPuVA1uX5k+NkUWr5cvBkwNXba
	62LXlogn2CctfXZNawh8OKl0tvTdv9iKEQ2SSDXXnPLUAAGKBgLv0j7upmK19nixT3s+btkZ1ya
	/rQH72ueA8IoSaUA8PqY0wedg5SR1x3cmE1J+5Dfj9BvbwvIABKafe3zzZ1SR16fNgaVLqTZqJW
	BiQMV9FhFvOZCnfFkFYZIi5krwxgLNPscXhjbZq4pbuvThMoI4uW3Ehladuf+bWy6selrVLcmhz
	ZQVaL/HDNy0Eiku5fucJN/YmDVzDNS1kJtJCEqyC0IVchAiZ2wN8GDMgXdja/K1LGPsDU8WpHQW
	+GXnm9r3OHqa218v4QWm3x7HQaTzehDYUthsta8JMLNzfgXKLyAE3y7C1fUW3MUALOjC08ak602
	ZLrLglP779ynut/ns4=
X-Received: by 2002:a05:6512:2552:b0:5a8:9988:f1d5 with SMTP id 2adb3069b0e04-5aa323bc03emr387730e87.24.1779425723236;
        Thu, 21 May 2026 21:55:23 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb36d2sm144533e87.13.2026.05.21.21.55.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 21:55:22 -0700 (PDT)
Message-ID: <b79d8ad9-f36e-4769-9dc2-58baefe23000@gmail.com>
Date: Fri, 22 May 2026 07:55:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] [v3] input: gpio-keys: make legacy gpiolib optional
To: Arnd Bergmann <arnd@kernel.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Christian Lamparter <chunkeey@googlemail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
 Pavel Machek <pavel@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-wireless@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org
References: <20260520183815.2510387-1-arnd@kernel.org>
 <20260520183815.2510387-3-arnd@kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260520183815.2510387-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_215526_476610_87345ABC 
X-CRM114-Status: GOOD (  21.00  )
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

On 20/05/2026 21:38, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most users of gpio-keys and gpio-keys-polled use modern gpiolib
> interfaces, but there are still number of ancient sh, arm32 and x86
> machines that have never been converted.
> 
> Add an #ifdef block for the parts of the driver that are only used on
> those legacy machines.
> 
> The two Rohm PMIC drivers use a gpio-keys device without an actual GPIO,
> passing an IRQ number instead. In order to keep this working both with
> and with CONFIG_GPIOLIB_LEGACY, change the gpio-keys driver to ignore
> the gpio number if an IRQ is passed.
> 
> Link: https://lore.kernel.org/all/b3c94552-c104-42e3-be15-7e8362e8039e@gmail.com/
> Link: https://lore.kernel.org/all/afJXG4_rtaj3l2Dk@google.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v3: resend
> v2: skip the fake GPIO number passing from mfd
> 
> The removal of the arm platforms using this is not yet going to happen
> for 7.2, and Dmitry's changes for the Rohm drivers have not yet
> made it into linux-next as of 2026-05-20, so for the moment I
> would still like to see this patch get merged, even if we are
> closing in on completely removing the legacy gpio support in
> the gpio_keys driver, so we can make CONFIG_GPIOLIB_LEGACY
> default-disabled sooner.

I am (still) all fine with this, even though I like Dmitry's set. I 
suppose you already have a plan for merging this, but I still have to 
ask - why the MFD changes aren't in own patch? I feel it would have 
simplified merging, backporting, reviewing and reverting if needed.

Well, other than that:

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

