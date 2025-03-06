Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FF1C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 20:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4GimjoaXXladrZg38HxX+WEY/YSmPMUaXL9bgDFdsYs=; b=jP5f3Q1BTYlgIw
	+b44Ejc8YgZjOkchJHzvawlgKDofJGFwh8M+0FttPEDhFV0eWr353qaP7xhMx7mlkgPH/tbH8P5VN
	ChryTNkKVt/qcC/vinXKrSqCTi3QWXk9UTUb+RHq3+B3dE7B/et+cVIZBCMl4Qll6Uk8CdbzPFuKg
	6AZM3D7yv6ybN2ZA3hNVcWfiPWxH7MxJ49wXGUehtDZehfvNWSk1TFh1D0n3PjFaYK6gIdMyB4c+P
	7OXtebxCG/nyoI0B6rD2UndaTmhvFl3tJkwf1Os3ACp/gQylEkIP8CdDohYhdm1oVWgp+ya21W5NG
	5pdC+RdEwEkow4CfhmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI7p-0000000C9o5-0xYx;
	Thu, 06 Mar 2025 20:47:25 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqI3c-0000000C99b-2jEp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 20:43:06 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43bcad638efso7046835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 12:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741293783; x=1741898583; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4GimjoaXXladrZg38HxX+WEY/YSmPMUaXL9bgDFdsYs=;
        b=Kv0xpv2g1LP//N7GmDRpqFdp45nfGWurarjfKD0d+fB92ykRynZcxuRQjWvmbv5HIL
         FlE0bOWbV9FMLDSyPk7/il9roBErIMbL7ieXXfiNxLleNYmHSTfZ1aJml41rN10T2/1f
         6yWozMBniFDML5rNfQ1LT7+HgufX7qHFLm1aonVHkr1SlzHRd52Hoe7EdgAClVtn/kbP
         ewnM7qxPer8QZi+BjRIp6oChpTWVrsmRFd3OUmnWj57LrGf+Sn4PjJT0T1vEyoV+Y6S7
         OnTAWGSiwVA5Ohjb6Sn8L0svqeA7WnrM+P5hh+L1mF9rW1dHjYeuikWQXJ1MVRuhnCl7
         ahSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293783; x=1741898583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GimjoaXXladrZg38HxX+WEY/YSmPMUaXL9bgDFdsYs=;
        b=UYvjnjbaUTkWPMTBozbwJh4EcGhYUoY6AfJ4IKKKqs8iWgMVYAAEA0vw12O4hwEuGi
         0UlEDkhOzsOW9C/xzyQPPkffGTPNFXDtIOta+wcbKojaJ5fquN3O0/v+An8sOxf1ClKA
         n+KBD5Vdxdpopn9QolgMvoCw6DfDoL9QitNzzTyG8F6rQDJuUQUr/DPIVzx4eEMVEzdb
         goaYxipsfROF52mWwxI/lkzO1bej2wKXj2MxvXy9cSjCNYbUvbnxMXU0JOqEhX6N6w1d
         MMnrnsM3JHZ+z5b1ewKLOB8qeU2jjROs1kA5tlVOMaGw452W/+yEMSJtuYlGRH+GJ9t+
         l/gQ==
X-Gm-Message-State: AOJu0YxEzxhqSaMqKaNGTc0YnMbn/74G4A6j+CrpqGEcWAGhPBKXGrxE
	5SznA7+Zl9QGJZNZl7S9XT+WELot9rfIncYpVY+uMPJlB6GTr4B/VQdgBoCJ5C0=
X-Gm-Gg: ASbGncslQ6UpW2SlWmgH3cstG1SycOoEwyoJCZAzFfYiAlPsIFA24yF5ACJOd5Toj9L
	itap++ihIGrKXH09cgFlsDMFWIK6DhHwpHTYETGYpdO3a3iExoLRtL8Tn8jbttW4Zr6cDf60OU7
	TqPEtMDo286MTdAI/zhgLD33x5na4eTzqxu9liNLMrPnWprKzyW0avhhsUjTjha4npeu7KZos7h
	ZH3BlK6hDkPXcS9y4XAA8IjQH6melal31nL6e9Kft7IUaGLzD4Vxl5MEPVOowNoo5ujUovWwGzk
	X/D4g8F5CGrARn9x0tHQA0bf4NJO5jYQfpyw7Y5FwKmDoSbxWpQeIl0wClzv+t2cJfT9G06ZM54
	=
X-Google-Smtp-Source: AGHT+IFFBM1ec0+y9QOjsWkRze+N/TMmKsFw2dds6E7/MII8+8XfXYdGTXLu56qK+wFv8awCozTznQ==
X-Received: by 2002:a05:600c:4450:b0:43b:d531:ca9a with SMTP id 5b1f17b1804b1-43c68702906mr6559645e9.31.1741293782422;
        Thu, 06 Mar 2025 12:43:02 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd9470e2sm30081715e9.33.2025.03.06.12.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 12:43:01 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 0/4] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Date: Thu, 06 Mar 2025 20:42:34 +0000
Message-Id: <20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALoIymcC/4XNTQqDMBCG4atI1k3Jn6R25T1KF0kcdUASSWxoE
 e/e6KZ0Ubp8P5hnVpIgIiRyrVYSIWPC4EvIU0XcaPwAFLvSRDBRMy4YndG7JU60nxYXPE2PNIP
 vqJBSGi61U50i5XiO0OPzgG/30iOmJcTX8Sfzff1LZk4ZBa0bxqwwl1q1E3oTwznEgexmFh9HM
 v7TEcUxGqBvrFVK2i9n27Y3yVaqygUBAAA=
X-Change-ID: 20250120-pinctrl-fltcon-suspend-2333a137c4d4
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3165;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=3I8CBekQ5y/NxfRFNZcDsBWqJ6pOTtgFdlfo4wG1dyw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnygjO1FoQGjv5WeO6HKLDs5Z3pU7BeLco3mKZb
 JrQPhD83pGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8oIzgAKCRDO6LjWAjRy
 uh6CD/0e3PFcWK5hQCDVm8D0hG5a9L0DcyFK5AY5V3V0os/VHVy2PDL9bwNHCbiYme2oPf3lFCg
 O3SG6AThUsy/5ubHJaGkVCguuXbGbTO6Hi1M1jeCRAOOzKvIdlDoUYTOKoIX9BLHeKC5rS/FUof
 WY2MG8jqRDAG6S0GP6RdP0Ga//cBzApEUskyLgdXr2K8woZSlleQ+B662bOYVm3II9KKQgVG82O
 VVg9rifHPa/l+cnI4lL98o12pWcTPWK9UD8krJrkDS3UTl+Eu4xWRywSmYFjYVdgEQF7lbDZvNd
 s6flonruKPVDDZAG4HLihYFFsNNFEhtyc52qhVeRmkFJxHkJo3HkSxU4roq7+OcPbFsPsLvXh/T
 lO6qnJwxhH20G9U0KxvgeFILR63k9kpMu9e+zZ9gBra2KkcSzu/3IOb6rrmV0qS+G/Wwh+eWPFC
 NBTMdz0XExh1O/4p2sAZWGz2VyaivgdjLD930JNziBmYMih4K1Ne1usDgT8tL/F2U0gXifuv1dy
 AWrH6RtSZShQ6Of3ulZoa1m1bvz4offCkKbz4PFEyv/91U2p+OoOhO5v2xTLPYmXhbZ3yrc0yr1
 6wZY26wW2kq6kgCCejZsiRw41CaXv2e53F77BEf887Vxga8RVIdHQRtyWgAACNgZNYz+W0vyAPb
 MefopIujLpsI7nA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_124304_719131_EEB8DEF0 
X-CRM114-Status: GOOD (  13.01  )
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

Hi folks,

This series fixes support for correctly saving and restoring fltcon0
and fltcon1 registers on gs101 for non-alive banks where the fltcon
register offset is not at a fixed offset (unlike previous SoCs).
This is done by adding a eint_fltcon_offset and providing GS101
specific pin macros that take an additional parameter (similar to
how exynosautov920 handles it's eint_con_offset).

Additionally the SoC specific suspend and resume callbacks are
re-factored so that each SoC variant has it's own callback containing
the peculiarities for that SoC.

Finally support for filter selection on alive banks is added, this is
currently only enabled for gs101. The code path can be excercised using
`echo mem > /sys/power/state`

regards,

Peter

To: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: andre.draszik@linaro.org
Cc: tudor.ambarus@linaro.org
Cc: willmcvicker@google.com
Cc: semen.protsenko@linaro.org
Cc: kernel-team@android.com
Cc: jaewon02.kim@samsung.com

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v3:

- Ensure EXYNOS_FLTCON_DIGITAL bit is cleared (Andre)
- Make it obvious that exynos_eint_set_filter() is conditional on bank type (Andre)
- Make it obvious exynos_set_wakeup() is conditional on bank type (Andre)
- Align style where the '+' is placed first (Andre)
- Remove unnecessary braces (Andre)
- Link to v2: https://lore.kernel.org/r/20250301-pinctrl-fltcon-suspend-v2-0-a7eef9bb443b@linaro.org

Changes in v2:
- Remove eint_flt_selectable bool as it can be deduced from EINT_TYPE_WKUP (Peter)
- Move filter config register comment to header file (Andre)
- Rename EXYNOS_FLTCON_DELAY to EXYNOS_FLTCON_ANALOG (Andre)
- Remove misleading old comment (Andre)
- Refactor exynos_eint_update_flt_reg() into a loop (Andre)
- Split refactor of suspend/resume callbacks & gs101 parts into separate patches (Andre)
- Link to v1: https://lore.kernel.org/r/20250120-pinctrl-fltcon-suspend-v1-0-e77900b2a854@linaro.org

---
Peter Griffin (4):
      pinctrl: samsung: add support for eint_fltcon_offset
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 150 ++++++-------
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 294 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  50 ++++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  12 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  12 +-
 5 files changed, 318 insertions(+), 200 deletions(-)
---
base-commit: 0761652a3b3b607787aebc386d412b1d0ae8008c
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


