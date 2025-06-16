Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33D3C71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmJJ47Yl2sCB6HxmNoBfzW8fAWTLqNnW7h4ybZSA7aU=; b=LX9fy+HIKYHkTpteOI4b8e+2/e
	jOeE91ak53aITeotvns09AVeqGyg3HVULypegHxxAYwgB+BNjCMQgwlQylik/tCC5dS+xRP33X63q
	RoP2kFpHUCp5DDAGAKMFGBNHiTH/JyeYQu3VHJ9FtEH/dtiKCUbQeJO0mki5XaYY8QhJO+2W7H11v
	dRHiYnEKWycvSKZJ8N7/yGvEzVSqIKNSrtmlzZPuI9W5qNbsXBZmLf8aZrcBK4mtcvsu+srB5uVQn
	li9jbC5BJMIGymzRQrlX8Zj3bnOUhfDrsrNVJURsEp2BI/VtOumGt0CZL9NQn8V9uvZxTwzTjcdZe
	bGz4ePZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8Ij-00000004FM4-2kqa;
	Mon, 16 Jun 2025 11:46:57 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7BS-000000045Mg-3y11
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:35:24 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso2381665a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070122; x=1750674922; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmJJ47Yl2sCB6HxmNoBfzW8fAWTLqNnW7h4ybZSA7aU=;
        b=MarLgMa62Arp2gXmz0D2Dzy8dR2NQoob9bM8/p+56Gzm6yDWRyjFOfx5GRo4nMyYUM
         2jx3hu9hMFSnyuDNuAJvHIeKBBcg5g3KjXTDIfcF2mlJluCMHkqxVxIuc0ecnppcuWdr
         gHfinafmVBgxwOtcuBNE/LmJv794wCqKZeAECeixN8aEvXTrn0XUsui5AKmxUBOWQpD5
         0aMJEebT1tgzW5uYF0DElVVq/VorxrybCdwDMDJa70+tAlpeDT0/zYTxnW7zkOaktBJA
         c4CrjeAK7RgQHeTsy+pG5WHpaaIIjRzK/X7WkGG6rYbNpIw58+3MXG4ghpYBdjt3KRk0
         cBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070122; x=1750674922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmJJ47Yl2sCB6HxmNoBfzW8fAWTLqNnW7h4ybZSA7aU=;
        b=W/aaK+B3cMzhPyYxnbgwf/8xVrBHBpyRU3+9fnT4MNpMsjt+4ULTMnIlW3x3LZvKCZ
         J896oRZiGUPK9M6K+j2jcbAb4nG1Pg41eKtR7kiwMSOew2P0s3HFtL7g+TuWSVavQVjd
         ciXPbsvHAGqE4kXLa62ASWm8NAMTeVQAgEiNppfMcRknPef9wJ/8HhWOEbtFpxsphQjt
         jcyb51GKfSywe2ctUI06hYvKHF56ndQdMANxouQcmAnhgW8qvm+i/QPihbJkDjIyXGbm
         dA5JSVfdvjbT8ef+p8MCknpsoygMNHOj0a8+h+AKP1s7kwgax4khc1Zp0zlT49oYdS/X
         O5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXvopV0jn8DRSjzL1WDeCcaPoGsccaX0QtwXW80SQ09T8228utLCxQa1RYH93KbQ2NbOq20+Hc22yyT09YRApp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2Qca+xqLmtwAQOzlBAbVqJioasHqIBNlnXpDIFRHMqLZXy8Ix
	lrmb07VscnBZTUmx6B8jajB+wrHn9Vp8g/buF1yKayyzs7ZQwjqAcXGTuagYxA==
X-Gm-Gg: ASbGncs15SJqilstuOummLDfIs9J4xJV3GqGMm50C7j5eBlmhAqZeQKVhw14qkVOasa
	S8Ano44HEzpxpgWF7MHPKfKRhsd8D1nB5cO6Z37nUQ0J6BzNBrFZJdv5w7AliiqvKuyl3KSOUQA
	u9TxVoVC0LdvlnyBmoDKQAkhLWBqu5XwBtw2wzPcQHJdKcPadMx1cvXfb7X422mNXuukUXk4jVy
	AyzYFRhq22dInhzo1KN337HK+vsvq4rc4c55MZJJaPQoU56zdz/qgFZZw29e16yvHHG++NfpC6w
	N2TdrEHB+smpbx+5VIoN1XMhuyetLAaBnmLgjKT/9QohzkK4Yg3iDaOMv+JrTiG/No56f/OeTib
	Uvrhl8IXyygAil6g=
X-Google-Smtp-Source: AGHT+IEEAuoXtSS/8Y8cVnpfenEz5Q4fubnneoioJ3zpvJgndsWQBvsGH4ZDCuve092zaFDawuwG1g==
X-Received: by 2002:a05:6a20:734d:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-21fbd475bc7mr14187903637.8.1750070122101;
        Mon, 16 Jun 2025 03:35:22 -0700 (PDT)
Received: from [192.168.0.118] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1639e4bsm5525498a12.7.2025.06.16.03.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:35:21 -0700 (PDT)
Message-ID: <efa79e01-fb73-4808-8506-677ba45e43a1@gmail.com>
Date: Mon, 16 Jun 2025 18:35:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Ian Rogers <irogers@google.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Sven Peter <sven@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 devicetree@vger.kernel.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_033522_987591_87ACEEB1 
X-CRM114-Status: GOOD (  28.20  )
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


Ian Rogers 於 2025/6/16 下晝5:36 寫道:
> On Sun, Jun 15, 2025 at 6:32 PM Nick Chan <towinchenmi@gmail.com> wrote:
>> This series adds support for the CPU PMU in the older Apple A7-A11, T2
>> SoCs. These PMUs may have a different event layout, less counters, or
>> deliver their interrupts via IRQ instead of a FIQ. Since some of those
>> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
>> be enabled by the driver where applicable.
>>
>> Patch 1 adds the DT bindings.
>> Patch 2-7 prepares the driver to allow adding support for those
>> older SoCs.
>> Patch 8-12 adds support for the older SoCs.
>> Patch 13-21 are the DT changes.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Hi Nick,
>
> This is substantial work and it looks good to me. Do you know why
> there's been little progress on landing these patches? Buggy Apple ARM
> PMU support in the kernel has led to reworking the perf tool. It seems
> best that we can have the best drivers possible.

I have no idea why the patches are taking so long. As for the buggy part I think only notable bug
has been M2's performance counter length increase from 48 to 64 (which for linux's purposes
is from 47 to 63) being overlooked[1], and I don't think there have been regressions.

It is not so much bugs, but rather lack of features. For the longest time we knew almost nothing
about the PMU events, and it is not until someone managed to extract the event names from
macOS and Apple's Apple Silicon CPU Optimization Guide[2] that we know quite a bit more
about the PMU. The event names are then added when it was determined that it is okay from
a copyright perspective[3] (it's the same as being allowed to use registers names from proprietary
ARM ARM). As for the  description the guide does have descriptions, but descriptions are more
doubtful than names from a copyright perspective so I do not know if they could be ever be added
to the userspace perf tool.

[1]: https://lore.kernel.org/all/20230528080205.288446-1-maz@kernel.org/
[2]: https://github.com/cyyself/m1-pmu-gen
[3]: https://lore.kernel.org/all/tencent_C5DA658E64B8D13125210C8D707CD8823F08@qq.com/


Best regards,
Nick Chan

>
> Thanks,
> Ian
>
>> ---
>> Changes in v7:
>> - Fix a W=1 compile warning in apple_pmu_get_event_idx() as appearently using GENMASK()
>> in a function prototype causes a warning in GCC.
>> - Link to v6: https://lore.kernel.org/r/20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com
>>
>> Changes in v6:
>> - Rebased on top of v6.15-rc1 (Conflict with FEAT_PMUv3 support for KVM on Apple Hardware)
>> - Add patch to skip initialization of PMUv3 remap in EL1 even though not strictly needed
>> - Include DT patches
>> - Link to v5: https://lore.kernel.org/r/20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com
>>
>> Changes in v5:
>> - Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to keep things in
>> chronological order.
>> - Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com
>>
>> Changes in v4:
>> - Support per-implementation event attr group
>> - Fix Apple A7 event attr groups
>> - Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com
>>
>> Changes in v3:
>> - Configure PMC8 and PMC9 for 32-bit EL0
>> - Remove redundant _common suffix from shared functions
>> - Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b361932e88@gmail.com
>>
>> Changes in v2:
>> - Remove unused flags parameter from apple_pmu_init_common()
>> - Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com
>>
>> ---
>> Nick Chan (21):
>>       dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
>>       drivers/perf: apple_m1: Only init PMUv3 remap when EL2 is available
>>       drivers/perf: apple_m1: Support per-implementation event tables
>>       drivers/perf: apple_m1: Support a per-implementation number of counters
>>       drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
>>       drivers/perf: apple_m1: Support per-implementation PMU startup
>>       drivers/perf: apple_m1: Support per-implementation event attr group
>>       drivers/perf: apple_m1: Add Apple A7 support
>>       drivers/perf: apple_m1: Add Apple A8/A8X support
>>       drivers/perf: apple_m1: Add A9/A9X support
>>       drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
>>       drivers/perf: apple_m1: Add Apple A11 Support
>>       arm64: dts: apple: s5l8960x: Add CPU PMU nodes
>>       arm64: dts: apple: t7000: Add CPU PMU nodes
>>       arm64: dts: apple: t7001: Add CPU PMU nodes
>>       arm64: dts: apple: s800-0-3: Add CPU PMU nodes
>>       arm64: dts: apple: s8001: Add CPU PMU nodes
>>       arm64: dts: apple: t8010: Add CPU PMU nodes
>>       arm64: dts: apple: t8011: Add CPU PMU nodes
>>       arm64: dts: apple: t8012: Add CPU PMU nodes
>>       arm64: dts: apple: t8015: Add CPU PMU nodes
>>
>>  Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
>>  arch/arm64/boot/dts/apple/s5l8960x.dtsi        |   8 +
>>  arch/arm64/boot/dts/apple/s800-0-3.dtsi        |   8 +
>>  arch/arm64/boot/dts/apple/s8001.dtsi           |   8 +
>>  arch/arm64/boot/dts/apple/t7000.dtsi           |   8 +
>>  arch/arm64/boot/dts/apple/t7001.dtsi           |   9 +
>>  arch/arm64/boot/dts/apple/t8010.dtsi           |   8 +
>>  arch/arm64/boot/dts/apple/t8011.dtsi           |   9 +
>>  arch/arm64/boot/dts/apple/t8012.dtsi           |   8 +
>>  arch/arm64/boot/dts/apple/t8015.dtsi           |  24 +
>>  arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
>>  drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++++++--
>>  12 files changed, 871 insertions(+), 35 deletions(-)
>> ---
>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> change-id: 20250211-apple-cpmu-5a5a3da39483
>>
>> Best regards,
>> --
>> Nick Chan <towinchenmi@gmail.com>
>>
>>

