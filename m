Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF950C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BokEIJpAcKb2binz16NzuPQ4I7I+6I7p32b1cJZhi5A=; b=x9m/tAbktHEDHOKUF8IP+51nPp
	aGbyQDiVOFtEMd3UAdFtOMjuTVSpBaHq4lntJEznbF5xgpRoLTCCme9gAmlZOsomcF9r76aNs4uLR
	oj/1eqA1LxVSB0Fcr9dk8AwiGjk8O33HO88UsFirCiHmnzxGuRTqejlRa/CSDgUnmP2cmzj+UPAuT
	mcvjCvI/1Z0JVEvpHM35wtiB1NRicnKWL/0W7RHsrtZ84kK7aUsmmtfJ49OBY0J/DWu7xxgsN2bzg
	W6HMOXFRTbCyE3Jh5cN7uvamdRmHIq+MBUM20nIVkSjMbmz6vZxAE3dH9uiTYYXII2xshYAdSzFfm
	buhzLwWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9n8C-0000000AAE6-2SKl;
	Tue, 29 Apr 2025 15:44:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9miO-0000000A63g-3Nbs
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 15:17:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BokEIJpAcKb2binz16NzuPQ4I7I+6I7p32b1cJZhi5A=; b=oMPXA6hqNzkmbtvrGNqxfUwyiP
	cFrqenarPfDxUFJ7aOfuJ2F3PL2EkXm6Er/YtrMd5VRG08OxY42voAy2gMCqCbW1JythdS/Siu0Ju
	dzJbuVmsr8wYXFXP4cZNivhSWrgZ2NggvX9z4Ny3tfbG33tBKDOkbd/AXy7r1F+NGPtUpSJWcou7R
	hGl33H8DjNaEVmRiV0sZC8GzHXQB+QeeCCQf0lFATypYqk1JZk604xB5XqjgD13SCfw2FBpM2Rssk
	uh9nVOXzIK/dgzo8yHzY9ZY3/GBy45UgIZ3Fjm3Wz4ZFeQdxZMVeVb6mP3s7Uk01D+dr7MEB1g7a/
	rN4IFn0A==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9miK-0000000DR5e-1DUu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:17:43 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so6007685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745939857; x=1746544657; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BokEIJpAcKb2binz16NzuPQ4I7I+6I7p32b1cJZhi5A=;
        b=DcvM72jrSoWWkbTunpq7anNrmqg1yOjSNJNm7VAg+pXzPk8cxfdsNT5wFMjuQ47KDf
         dyGmcQaHYOiCSmfpmpHwz8aHMVKC1eyc3uuLsOyrazqE4XwXMBcYzZdEYLU4mrcLlKgx
         XvoR8jMgsLDpYFQhAKln0HaXvPwO/pNfMu7FJCATHxJW+Igm3MStEp2cPdjD+CaMozeC
         K8AmiMVjnuDKek0UFVwtvhRFbmJRoAQQ/TaSwqbY5hI8R4lPhhxC3RBvLFTRQi5vvkGp
         o3bfInME9z290JOJ2PJOt1L8KOegc2cHkfEWyCGiAOVokHBB8Hk7+Of/wEkjPMEWezU2
         //sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745939857; x=1746544657;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BokEIJpAcKb2binz16NzuPQ4I7I+6I7p32b1cJZhi5A=;
        b=r/nc0G0k0rzZmDNiYu1MKRld9g/6Da69NfkZeIHoHZxsMwhnbffJH2GhNWGzxy2rSk
         P7GUa+y+pFMsVWRmASaGjC0oIe0SlUP5Aw9Mpw1qfYB9P/dRGj0yBgiBRNs5Ilo6L7VD
         o2koJd1Xbzp7OUtX0TUPgwizreVLIOOjwGb/lgjV7DutTzO5OMyzs3uiCs7sNUKVbVno
         0l6fD1MPqHJRDMm+wTWG2Ie/E9A2fsvNSO7rpKk8XHnJNk8mgUARxwgWOZRzOmICpXr0
         M+k+yOE6YifEHRIkPXskE5Jmmwui6SDZ6JfwmzKuQYLpnvp18A0U13BfkGiSYMOmw15/
         SFRg==
X-Forwarded-Encrypted: i=1; AJvYcCVPu75hoNVPghKgiqP7UvgBjM2+3ruUbly6g161XxMoUc3eH/7qfRqdmlC9Z4aaUCKKamzn5G9RAjLI9m5b7YvW@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+WwcoiBMxfyD8yWfACHqiIH2J4Ym2W2aJrw+EYqClUAIWVqj5
	EVX9LHeYkMKow4G85QZ6/EgUnYAwskpDN9wC3qR9u31xfPPEQRfv0GEFLFUcAws=
X-Gm-Gg: ASbGncsOPPqgDrssSU6boe5qnmra3MDlhdo06P9YW8HjaLyYVu2N2vn6/nAhUvJgX/R
	nwvo95pCuZJyR2OZmH17J3kVtgHZngDfuPmp1+//qFcLyKoP2Y/A3NYNxkZ2h1Y0CPfqBrddo8Q
	pjyJv7YXHGlLz0RhLNvN8vTwTkcPlS4QCvuHGAup2gTBqHkotBHeshpBezQtquydjWqMWdDxbYI
	wRvwNnIRcuDbGd/q1cUww5XI0soLgUrOnbfIiaKVR6VdtY69ZNyxaDERdCgzDs5E20+v+2H2/XR
	zQ2ArndAd69MEl/JjIb2ptUxBnapo6v5zaJ2ZrIvDfPzKbDTDS4Mrjpxy1k=
X-Google-Smtp-Source: AGHT+IHwONa+JhNx4dio96T0pi5jX7gQn7L+kUedgzrY/88DyPg1TeMpxysV+irX79Ls6/3y0GlTjA==
X-Received: by 2002:a05:600c:ccc:b0:439:a1ce:5669 with SMTP id 5b1f17b1804b1-441ac890828mr11476225e9.5.1745939857335;
        Tue, 29 Apr 2025 08:17:37 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm167238875e9.2.2025.04.29.08.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:17:35 -0700 (PDT)
Message-ID: <c2d8374b-b623-447d-a695-3f2ead068265@linaro.org>
Date: Tue, 29 Apr 2025 17:17:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
To: Lucas Stach <l.stach@pengutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
 <c5538590-efe4-4b90-b291-6c429d8fa3fe@kernel.org>
 <06efb082c24176e6401265b4349b677468850f7d.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <06efb082c24176e6401265b4349b677468850f7d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_161740_524112_0D2D3925 
X-CRM114-Status: GOOD (  23.24  )
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

On 29/04/2025 17:13, Lucas Stach wrote:
> Am Dienstag, dem 29.04.2025 um 16:30 +0200 schrieb Krzysztof Kozlowski:
>> On 29/04/2025 11:39, Lucas Stach wrote:
>>> Hi Krzysztof,
>>>
>>> Am Freitag, dem 25.04.2025 um 21:48 +0200 schrieb Krzysztof Kozlowski:
>>>> Not tested on hardware.
>>>>
>>>> Ethernet interface, like other exposed interfaces, aliases depend on
>>>> actual board configuration, e.g. its labeling, thus aliases should be
>>>> defined per each board or each SoM.
>>>>
>>>> Some boards (e.g. Gateworks) follow this convention but many do not.
>>>>
>>>> This is continuation of my comments from:
>>>> https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@kernel.org
>>>>
>>> The i.MX boards have traditionally listed aliases for many hardware
>>> peripherals with the same numbering that's used in the SoC reference
>>
>> ... which is not correct. Aliases should represent how boards are really
>> labeled, not how reference manual labels them.
>>
> While that is the commonly agreed interpretation today, I do not see
> any language in the DT spec itself or kernel Documentation/devicetree
> that would mandate aliases to be used in this way.
> 
> In fact there are examples to the contrary like
> Documentation/devicetree/bindings/serial/samsung_uart.yaml which says:
> "Each Samsung UART should have an alias [...] as specified by User's
> Manual of respective SoC."

And that is an ABI. Did I affect ABI here?

> 
> So I would argue that there is no hard line between correct/incorrect
> for the historical usage of the alias nodes on the i.MX platform.

There is. ABI is documented. There are things which turn out ABI, even
though they are not documented, like node names. Was there a problem
with refactoring these in NXP?

No.


> 
>>> manual. Boards always have the option to override those aliases if they
>>> have a good reason to do so, e.g. labeling on the physical device.
>>>
>>> Other users besides Linux rely on fixed numbering provided by the
>>> aliases. Both barebox and U-Boot number their ethernet interfaces
>>> according to the alias.
>>
>> And?
>>
> Some usecases depend on the aliases being the same between kernel and
> bootloader. Historically that has been guaranteed on the i.MX platform
> by the aliases in the SoC DTSI, when the board didn't have a need to

I know.

> change them. With this series applied some other users may now end up
> with missing aliases if the only include the DTSI.

Bring actual case, what is broken by this changeset.

> 
>>>
>>> While you seem to add back aliases for in-tree boards, this breaks the
>>> majority of boards that include the kernel DTSI from an out-of-tree
>>> board. I can understand that we can't always accommodate these users,
>>
>> This is not ABI, so every out of tree user is on their own.
> 
> I am not too sympathetic about out-of-tree users myself, but I don't
> think we should make their life harder deliberately.

We are making our life easier by maintaining and improving source code:
e.g. not creating fake aliases for devices which do not exist on given
board.


Best regards,
Krzysztof

