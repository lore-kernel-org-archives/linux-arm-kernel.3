Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79E6CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkwvcdoTXy80UmD5wUVPELnXBlXTid1VaGcK25N+5mA=; b=v4krtE++rfjt5S4Zyc26StB5q7
	zmfA1HV+ZhVMh7GIEusMGyy18hBBDyusn82hUUJeNQ65OnNftSdNm+gFgdpRFILX989sMWMyGoHTl
	jeu9JMn1WWo/BbmZ27kihvGeawoU/hC8BNoAtJiLkR2rPVbZM53QTB5SQUWSbg1iUE9fZ2b3+D2nw
	TOTGrxE1NkTVJLOFPL0jw1Zj6ZLE2y8cugT6WabdJD98+UoLymc5P9xQkuld0o3QabfVnncomdOTS
	EgLuERj1UU24Jd/C/KeHgYQyVDEFxcF2eFZ6TzUJgzsDUQTOF9x+yDtFX4P3BQX5X6cZE9sIe0nq9
	WpDkqu5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSswG-000000070ZT-2nEZ;
	Fri, 29 May 2026 08:51:32 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSswD-000000070YJ-2yeC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:51:31 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-57513a91514so4593548e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 01:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780044688; x=1780649488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkwvcdoTXy80UmD5wUVPELnXBlXTid1VaGcK25N+5mA=;
        b=JA8+SRJ2DS3mhFaEdOwIVh7OYZ+I62HfKb3NluRBRg0XcgcXfVqWyeOVoe9jLm7ywL
         hUdvPwYFCgM37l9hlen8yD5lb/UZeckNwnQ0rigX9F+HvfhAWCZADXVJU8Nf3Oxn0G4T
         YpVpaPP3rj931o1xYoTFutyC88U2KPDB7DA8AfANBLn2ffdt5Hx/LJwDGsVc4f5v9vzG
         NUmrxUuHlSMcQhshOOpj7yzPKsV3B1dIU/ItphdZaiTCfGD5nd5LDrY8o8UKWf6Ary2o
         yuj/U+J8fOCLWC/jqVDN1YIhrPjk1pki/hIbZY97dbtwyGksbN+abkMraQ1/FBigE+Sf
         AScw==
X-Gm-Message-State: AOJu0YzM6/+LAGe6Ts38tjxZx+gGOdHUx8OTwjcYAyJ/3DwdGWtJpbl5
	zOw667lR7GpqmRb0a0lmqDjH8N/tplVEjAGYgz0bBGg+0WbUI9yK4JqxDgWDbiwHuzk=
X-Gm-Gg: Acq92OEzBNDI4HN1HPveOENCgPfK6YwJbNdJedjkFqkQun/IFS1zkFWpR2X/9IjVRLc
	gEqfV7PxVPOyfOsx1fwcT2fs7sd8/imqQ5I6WPU3nnijbhfQiAut4RFrTzdTvUheaMpbQmWkHfF
	Bv6SRE7VfhqN2vjcKVQgLqKDeD88y00plXNddAe6hAAfYBvRuTwf+B7PwKTLLM1uGOH8P8yxR7Y
	sCx5DHow+zCUz5JQMUY7cZj/jckuRREtAqgUaWIyUdFJMW2AmR1d+yF+tdDEC3Jo/wrHyaU6Q8o
	fXXlwMClcGD4ZTE9Uej7RrF5+WQWpTLOnfgSnKN3qwjvZjLwTXcMigGQx1XTfqIbV0YmUNFoHSw
	sMa61YzWouGJaOMzqa+5wAtyb0DvWRCK/b+eoB/4g/kP/R6Ht89wxvKcCeB0dATzISslVS1zCx1
	7rlcmabiIS7IfB6Wkjsdi7d8umMK6SgQuSmYp/p39giaBinV+F7c3NGvU1CUCpHEaOH19w64Y=
X-Received: by 2002:a05:6123:4a:b0:57d:8059:e0e9 with SMTP id 71dfb90a1353d-599ef5a4717mr618975e0c.2.1780044687773;
        Fri, 29 May 2026 01:51:27 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-599da3ed0cfsm746849e0c.16.2026.05.29.01.51.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 01:51:27 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-6312a0d556cso6444305137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 01:51:26 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed1:b0:64e:32c3:1371 with SMTP id
 ada2fe7eead31-6bf3719eddcmr673394137.2.1780044686545; Fri, 29 May 2026
 01:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260517163212.18016-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 10:51:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUvUsUUkOj43oOWGs_MLvOZnEW=2YyKpP-VwHxe7ZaTgg@mail.gmail.com>
X-Gm-Features: AVHnY4KcCj63IhphrvFGQN6syC1_7Ix7eM6G3oNuhl6QDo_VJC9lcWJclcF3QAs
Message-ID: <CAMuHMdUvUsUUkOj43oOWGs_MLvOZnEW=2YyKpP-VwHxe7ZaTgg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Describe all reserved memory
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_015129_754818_B725855A 
X-CRM114-Status: GOOD (  26.73  )
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

Hi Marek,

s/r8a78000/ironhide/ in the one-line summary

On Sun, 17 May 2026 at 18:32, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Fully describe all available DRAM in the DT, and describe regions which
> are not accessible because they are used by firmware in reserved-memory
> node.
>
> Replace first memory bank memory@60600000 with memory@40000000 and a
> 518 MiB long reserved-memory no-map subnode. This memory region is used
> by other cores in the system.
>
> Reserve 32 kiB of memory at 0x8c100000 for parameters shared by IPL,
> SCP, TFA BL31 and TEE.
>
> Reserve 512 kiB of memory at 0x8c200000 for TFA BL31. The upcoming
> upstream TFA 2.15 BL31 uses memory from 0x8c200000..0x8c242fff, the
> round up to 512 kiB is slight future proofing.
>
> Reserve 32 MiB of memory at 0x8c400000 for OPTEE-OS, which is the
> entire OPTEE-OS TZ protected DRAM area.
>
> Neither the TFA BL31 nor OPTEE-OS do modify the DT passed to Linux in
> any way with any new reserved-memory {} node to reserve memory areas
> used by the TFA BL31 or OPTEE-OS to prevent the next stage from using
> those areas, which lets Linux use all of the available DRAM as it is
> described in the DT that was passed in by U-Boot, including the areas
> that are newly utilized by TFA BL31 or OPTEE-OS.

Thanks for your patch!

> In case of high DRAM utilization, unless the memory used by TFA BL31
> or OPTEE-OS is properly reserved, Linux may use and corrupt the memory
> used by TFA BL31 or OPTEE-OS, which would lead to the system becoming
> unresponsive.

Oh well...

> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

