Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DD0C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 17:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGouwviuscU4MvVzPjOZbXPwY1apdTkMc59v81/WQ3o=; b=K7VykAN03inM4RpxW089aCcYuw
	kTXtlRSNASffpaGUOxT6NBf8yiEGfWGQk6hiV+/xbInFPHcF4svWw0BTnnSFkuU5ui5G/aO6Wdzoo
	QV7N60rbZjzOqAji+3LrayKjgcUQJVVR8wUQ4bcU6Tiq7/EW3irtjXOk/jldHhEQMpW4hnkKFGj8c
	SNlVL1CqXB0KhU5+xf4tWr4hoJ2ygRm1IJMhGXVNBcw+edx3HbF+QjBtdA/CjGW4H2xxfHRCpVjnt
	QKzGZUOgCkuLdd/lKTNvDa6ZtXS/D6CPFLgH42r+/C50HwSNFrQkcRptWw0lETVXxKsfXrYoDrBBP
	k+deY/zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnxD-0000000HLeW-0Uym;
	Tue, 29 Jul 2025 17:17:31 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugnrz-0000000HL3Z-2bG6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 17:12:08 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2402bbb4bf3so30168495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 10:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753809126; x=1754413926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGouwviuscU4MvVzPjOZbXPwY1apdTkMc59v81/WQ3o=;
        b=rXipHPm39I/laSIyOr0d/lAhtBKyK+ixlQX0rJoCRh3cDwSRt0hjGWhhaAxkX12KJJ
         TvLHJarEvkXrxbLyuZaVVkOxIH5b5r67UGRbLDPq+ZYzyUuIx+K+rJcQujt+c5WwdbNy
         1jv+QyHI8chnd85Qymw855jGDL3naCc9W35H8ksM4unVM19Bg3pAnsyx8fEticXEIAW2
         eN7A4dIFHDAsa2xbvsH1Gk5XbhK1864EdDMjuZmRKwXhVb8lEDJ0uPbli6JKlCzUyhyY
         0RHNCYXNQ5tFq/asxsTUBlwKXItoWJuVSAen9380ufw7s4F49zD/g22t9PneHMaJFdOu
         t1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753809126; x=1754413926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGouwviuscU4MvVzPjOZbXPwY1apdTkMc59v81/WQ3o=;
        b=JcbY/KlKmdqLZwPuCS/q9gRBArXDYzAHP7tRUXqYy31YZmtIU3P1qHZDmrZuXjQaec
         9RsfMJ9+O3JYQVgqb3S+eqX4hjYKi3ABLQRwchtKJG1QHChEHIaz7NUaCT/Pcm6g3254
         S/WAWbZ9dl9rOmeOQh3UDBx+Plf7iRica38ICX42+5BT1E1xLinE2qJn+KFOrlFStI+Y
         kbJMH2mNV4AGoHUogbNb+DhfXBr6TSMKlxxrDPniKX3KFDnukZ+ddmR0r+yOg7BoSaBJ
         TvFm9Ki2oz15MomlGfSObuhuVfGwBXoDX5DdpzSQ4IxNLIBPUD/HR7daFp0KVzHkV/f5
         lDOw==
X-Forwarded-Encrypted: i=1; AJvYcCV7gWp6xoC8BsKwJuqYY50dprg5+0ciCGssIsH1xeO5VzAPwWlpWZzJ5GPwaxv1NAPtFLeWxE6ggqBRhMsFLpeK@lists.infradead.org
X-Gm-Message-State: AOJu0YyMzfKSQvY0I+DIPycGWYMpWOVsQyU+JADSfynZEXGgRrwTtM6G
	fD/k2zxbpxwT7ttaczmRDKBNnNl/EacDsADq4DOfnNk65htwvB2+ufphTKXfUTT+xQ==
X-Gm-Gg: ASbGncvuxrGIcoB74x5KZUOEsoo8qsxmBVrijK9HGMrJs46tWznIEbmKWNjJEajpbPT
	8T+Ws55pGmVREDcSZmgOFIaWwyU3hQwCvO4oOZlFR8pD9LZnj4diRY3iNRI1HMQJ+9YGKxtyJnP
	2MEAx65uC4GDdFTZAHeBUWj24W/28QTIVJdCYNzvmHE7TsffMyq97Mp+ZfMJiuRQaIH/Fd60eeK
	K3puANZneTiaa4SyaAIv68yf11ycxVtygLUVwwiVv2O+s7ULV+aQpNYL84rNCeUYAQTMnd5OgFU
	1RKaoNKmjSwln06QO1He8Rxdkw2pupqHlzK9gGeC4FggxUOFU24BX54szzZZyt0H9OyMYiPFCSX
	3mL5a6KhqFHzhz5WCt4j5hZz7FI0wJQGBGypjSJ2Dqvr0qtdIKe2c0ukY07gqHBE=
X-Google-Smtp-Source: AGHT+IFbUdPnNNCdHdOd3aWHqfiWNykncHbUZuz2LGLXLcHMra+1y9VTs59V2W3LfoQRs9MqT/0x+Q==
X-Received: by 2002:a17:902:cf0b:b0:240:4b3b:334f with SMTP id d9443c01a7336-24096b4c467mr2110255ad.34.1753809125594;
        Tue, 29 Jul 2025 10:12:05 -0700 (PDT)
Received: from google.com (152.33.83.34.bc.googleusercontent.com. [34.83.33.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f32cb3430sm2060873a91.33.2025.07.29.10.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 10:12:05 -0700 (PDT)
Date: Tue, 29 Jul 2025 10:11:58 -0700
From: William McVicker <willmcvicker@google.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Youngmin Nam <youngmin.nam@samsung.com>,
	Donghoon Yu <hoony.yu@samsung.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] clocksource/drivers/exynos_mct: Revert commits causing
 section mismatches
Message-ID: <aIkA3sMvioatVNFu@google.com>
References: <20250725090349.87730-2-krzysztof.kozlowski@linaro.org>
 <63a6d253-305d-4ffd-9954-7cd665bd332d@linaro.org>
 <2f413942-8126-4d94-b64b-c4a05052b5a1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f413942-8126-4d94-b64b-c4a05052b5a1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_101207_659480_0B7C5E5B 
X-CRM114-Status: GOOD (  31.65  )
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

On 07/25/2025, Krzysztof Kozlowski wrote:
> On 25/07/2025 11:28, Daniel Lezcano wrote:
> > On 25/07/2025 11:03, Krzysztof Kozlowski wrote:
> >> Commit 5d86e479193b ("clocksource/drivers/exynos_mct: Add module
> >> support") introduced section mismatch failures.
> >> Commit 7e477e9c4eb4 ("clocksource/drivers/exynos_mct: Fix section
> >> mismatch from the module conversion") replaced these to other section
> >> mismatch failures:
> >>
> >>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x164 (section: .text) -> register_current_timer_delay (section: .init.text)
> >>    WARNING: modpost: vmlinux: section mismatch in reference: mct_init_dt+0x20c (section: .text) -> register_current_timer_delay (section: .init.text)
> >>    ERROR: modpost: Section mismatches detected.
> >>
> >> No progress on real fixing of these happened (intermediary fix was still
> >> not tested), so revert both commits till the work is prepared correctly.
> > 
> > Please don't claim the fix was not tested. I reproduced the section 
> 
> 
> section mismatch code MUST BE tested with enabled DEBUG_SECTION_MISMATCH
> and disabled SECTION_MISMATCH_WARN_ONLY. If you have warnings which you
> missed (although if you have warnings what did you fix?), means you did
> not prepare testing setup.

Thanks Krzysztof for reporting this! Sorry for the mess this has created. I was
unaware of testing with DEBUG_SECTION_MISMATCH and clearly missed those
warnings when I compile tested with ARCH=arm. I see the issue and will fix
the patches accordingly.

Regarding ARM32 runtime testing, how do I ensure my patch series is testing on
ARM32 devices? The series was discussed on the list for quite some time and I'm
wondering what step I missed to get this further tested? Do I just need to
explicitly request for ARM32 testing on the list?

To avoid this in the future, I took a look at the thread that introduced the
section mismatch warning [1] and wondering (before I propose this broadly) if
we can make section mismatches fatal by default for everything except
allmodconfig? Then we can selectively disable it where appropriate.

[1] https://lore.kernel.org/all/1443807963-36364-1-git-send-email-drinkcat@chromium.org/

Thanks,
Will

> 
> > mismatch, tested it and figured out it was indeed fixing the issue. I 
> > just missed the error because it sounds very close to the first one 
> > reported initially and I did the confusion.
> > 
> > The driver is not supposed to be compiled as a module on ARM32.
> > 
> > The option tristate "Exynos multi core timer driver" if ARM64 is 
> > misleading. From this change, the defconfig on ARM can do 
> > CONFIG_EXYNOS_MCT=m which should not be allowed.
> > 
> > Before getting wild and revert everything, let's try to find a proper 
> > fix for that.
> 
> I am not wild here. The issue is there since 9 days.
> 
> Best regards,
> Krzysztof

