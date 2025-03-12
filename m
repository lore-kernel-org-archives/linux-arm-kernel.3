Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A989C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 22:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Wfs7R8D9QwSoSk4j4eeFcrD9eVi/Rvc6fZx70N29Eo=; b=pdzTjeOmTNJOPl
	zkGiGnvFYmc1YUoKQ5KLsutA0kMEbORJgTtQJYf5pWvpuLkBER/dxPzVgnu5r9vQx5w/dbvRkrPJW
	izh4hAheTxOMrbOXMZRPDZqphCp3GRTpbhSEcGyXQomlo1ZwEssvWZJk4tP3dFbgvit7vDsk7vkix
	JQz7HBxG36anf6bXgSXkjj1Fsb+VESV7KZlilRhHy/DovV23Rnx4CLYjBHgE0KggW/QFzoVilfePb
	fmysDT5VN3Ks6VOYp6bjQqqU2TBQoe8iZM/4GCRJEZ7JYnEAkRkozEMUhYXUQ0FTj4BJtnhTNxZo/
	NcbKQMNLPmD7n7tyHPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsU8Y-00000009ZzX-0VCJ;
	Wed, 12 Mar 2025 22:01:14 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsU6s-00000009Zef-1xJE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:59:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so1684345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741816768; x=1742421568; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Wfs7R8D9QwSoSk4j4eeFcrD9eVi/Rvc6fZx70N29Eo=;
        b=K9AhTYAoWHejeu2JS3LJkwIci45KNHs4d3xN9TJGu369PL+SoFJB6MtoUPDGLlUNxb
         oFbCttlnrx5ns6GzGMt+YsgJEZmzf8KqjGChk2Gv1BrCm8uk7sk9c+qNBQDkqKBeWQO2
         xl0/F4GF5bEafVQn7DsOyWr6NxZfo/EaLO4giNkVTohNAvcHsDG9c2rFe6Q9+w4vD9Jy
         h6JA9LOmuJ6/0Ns4klsnkGrpObBtsRMVuil70ZPhNk6xo+rJ0VcLekSLMduFZZw/DKqs
         H6FN++ZZiuyyoIMNlgiFY0/Xj8dthwmlX/E14dczvhItJho4pWTrNMgTRkseIu2Mb8B9
         UbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741816768; x=1742421568;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Wfs7R8D9QwSoSk4j4eeFcrD9eVi/Rvc6fZx70N29Eo=;
        b=Ar+EYmMPuvK42By6m1sJsjjMxpMpUcQ6/hMMvovD0jcKujrZqDIfimOFhwLX5zmIsI
         pOe6lpF4kF4T6tVDVdOVSvVxXzBO29TG3utmiqQM21z49icfIIv5Idsgu42RNcyZvFUH
         OL3h8XWFbefUOXk34VBcsqGMgaz3iT1vp51JmPFWuZ+Q617hohgxkXpFNtpIjNhKgRUI
         opwLZ6oFVqvOLzLUDnyGELUCFVOHXkyfUxynXb9a6qB6k6awipEwCm7ejB2WRYmzQ0KF
         xYasB3ulNT9EMcHzcfNFNZKy7PAFGczdjBhp04E4y9W8jgf3osfO82TwlOkHKi9jygZB
         scSA==
X-Gm-Message-State: AOJu0YyGoONu9fvp9dlUv64qAIW14WzpVVOgH+fkly8HwPXISJAqUqcf
	R3SQSZneRa+PQp5vHYl9QZcWuwvUYsMlQMFZrolgriNK3akUTGToGvEdZo2lmg8=
X-Gm-Gg: ASbGnct1nEvsf/OY6vqU4+q+WNRN6Ngr94S9kB5nLnxnJRo9yzJ3xZKCUNJVZgOkEso
	PND+7WWCv9pBci2dp/iwnoaWOVndcPMyws631iQqVrc2q5QR1J6JcLcnjqEJBvwbN73WrcdHeHN
	SfL5SEdavCQjHjqwDLLKvV8jwjiUaqTyK3RkQjWmPEQiGRWfXLHblYNq/S0aFP/60eVoMqlvDpV
	PphY+q6cH8Zslz6xRD9pFdvL6ijlZN7Baxpn6X7Ucmd916n6bzh1bVDezvke9Aul5FnT6cIr2BU
	NErTZiZbdG8pEJpxxJ2YF8yc2KfWcTTEyilVf4b3PUQlRv1Y+5hDPHAngPskFpcPBTn1Pmduauz
	1
X-Google-Smtp-Source: AGHT+IHAdfL/zWlkbA6vqBpxrWhT3/HDlChD0NizAlv3E0v+/+eyD0+OyUlagna7bf9tFfu5RFzWbQ==
X-Received: by 2002:a05:600c:45c9:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-43d0abdafa4mr32832175e9.18.1741816768649;
        Wed, 12 Mar 2025 14:59:28 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([209.198.129.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d188bb34asm110175e9.18.2025.03.12.14.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 14:59:27 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v5 0/5] samsung: pinctrl: Add support for
 eint_fltcon_offset and filter selection on gs101
Date: Wed, 12 Mar 2025 21:58:57 +0000
Message-Id: <20250312-pinctrl-fltcon-suspend-v5-0-d98d5b271242@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKED0mcC/4XNQWrDMBCF4asErasizYytOKvco2Qh2aNEYCQjO
 aYh+O5VsmlKMF3+D+abuyicAxdx2N1F5iWUkGKN5mMn+ouNZ5ZhqC1AQaM0KDmF2M95lH6c+xR
 luZaJ4yABEa1G09NAoh5PmX34fsJfp9qXUOaUb88/i36s/5KLlkqyMZ1SDuy+oeMYos3pM+Wze
 JgL/Dqo9KYD1bGG2XfOEaF7c/DVaTcdrI7vrCPvWwvEbw69OmbToerAYEzDtG8Vtn+cdV1/AMv
 6PyCVAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3740;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=l0UozGtl+Y+uEkNpfTzqCasIsn47QmX6u7sMKC5KqlE=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn0gO8OgG6r0K8vQpb5SkN9jCJ09+opexOXK13y
 eXGSmxgaZ6JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9IDvAAKCRDO6LjWAjRy
 utxED/9ySKmxy2469Mykx3Pzb3Ich58sN6sTBJEkGOFk7oaPe5s8v8klrqp+3KiLDqwx1/JJLwC
 rCUcoVPd+CWHs/EcP9EF0cOp9BD0mImqZyJesQISJM/fibQj8DulO7IRikwfuErffh4jswvIdXS
 ql5Wx9KlIXuwlbErExZlrY7slNsQeqoQMGt8Jozq4rTqWyxMJgjVSXFsuwS0f/fgyN/pim3sIxj
 Flazsv5hdVkILIEZKrsXcidYxhrKBY5+56oSPLTVnQDkHxekyG6tEEsXO6ca/fL6zvDTnLnHwig
 j7YeqvnQcc5AqWuj1LVAXfRO3PXNilBP2e2ACz2QaNQBMtAF9GGIzLfAMBMN1QIA/fQQ5OJa1Id
 Bf+PWlZDesDmog81g6xNslh0Cu3jiZyxH28wvyTBDZnq6G++ToO+q2rKbmeSudeDZr+XCFFeJgw
 5lMG+sHDot+gnBLGKmwCe22xYt+LpvL3tuS0JT5g6qSkRm/x+TCx3M5N0vY68BsDu9alCrueW5+
 zeg12YtJECaAYeBK1n3ZbhcbAPk+qTCrrSYmKVoPWxdnb6kQrSB7yakij27BZyefSsJZEzugui7
 Ne2DOjLnV2pclrnUyV6scx31wur2M37sNP0pAvHhQZXsLImbw8NlvrIELMAL0FamSybTTCoLFSA
 CzX23yLN1tqVtmw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_145930_527654_DA6382BA 
X-CRM114-Status: GOOD (  14.26  )
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
Changes in v5:
- Split drvdata suspend & resume callbacks into a dedicated patch (Krzysztof)
- Add comment about stable dependency (Krzysztof)
- Add back in {} braces (Krzysztof)
- Link to v4: https://lore.kernel.org/r/20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org

Changes in v4:
- save->eint_fltcon1 is an argument to pr_debug(), not readl() change alignment accordingly (Andre)
- Link to v3: https://lore.kernel.org/r/20250306-pinctrl-fltcon-suspend-v3-0-f9ab4ff6a24e@linaro.org

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
Peter Griffin (5):
      pinctrl: samsung: add support for eint_fltcon_offset
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 150 ++++++-------
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 294 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  50 ++++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  12 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  12 +-
 5 files changed, 319 insertions(+), 199 deletions(-)
---
base-commit: 0761652a3b3b607787aebc386d412b1d0ae8008c
change-id: 20250120-pinctrl-fltcon-suspend-2333a137c4d4

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


