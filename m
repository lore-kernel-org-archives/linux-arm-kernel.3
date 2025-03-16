Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50B2C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tc/KJH+qtYUavPHzbi/9sG/C7pjG+2ryVkaTYFLi/Fs=; b=AmS2uNKytyrjQXqYpW+O2bX2bL
	O6fa831pkndP29KRn/CFu+CVigL8RbU2U5wxFLyogzrCE1xjIZ5VC0otu3UBsrMV0xYVrqgn6/ht/
	KyXSRVV2BGCR7642HSO4QZpp9p3UwGc0ZGaVXMy0gpcY6P5M2Dasv8vDosWW0uTPEwXsxp+09FcqA
	niZu4LcGim+bTNfdCG3oSi8wLxkOCbkdVljYUkpHMFvwitsOZVqxIlVkR03wWFZG1OTDAQ4gPc0f1
	f8z2VakEQAw6tGqtgyLGBPbRJ+vmll8bOCvFwj98sGNhlA2EGYCEtcGRlfPtyvvQhIPikLav6j77a
	Wvg2dvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttp2x-00000000Glw-1PFD;
	Sun, 16 Mar 2025 14:32:59 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttp1G-00000000Gh4-2jVE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 14:31:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43938828d02so2565175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742135472; x=1742740272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc/KJH+qtYUavPHzbi/9sG/C7pjG+2ryVkaTYFLi/Fs=;
        b=L0Xix3jJOlKcT83JkPiJWSW9FY9FoPamdbjmlCBz3Hh6w9QD+ex5FnRglXuUeLEnVM
         k3fQhqYAHfS4+4yPvR41ypVLir1YEOdb4zTJ5oC4UD1ajemza4b5D36k9PyDjZH+63cl
         aJtOyZl6oWS96/oDteivAUFr2Vq0xyYcrMjQNT+2hdnyGb1zQOHq/XmK1solgTR/iKjg
         AXp3xD3XrPmkpSzt9Aiwieal5y5zHJE5VUp6o8Sd5F9FD7blQ034NRZtZkm/NIsA/0cq
         B79yCNqrk57QjzN6ZHdu0Jb4DcYs+9Bk6F0Y+9eDZtwczhTAQKmgoAbPGwXh1MtIXlPw
         Zo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742135472; x=1742740272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tc/KJH+qtYUavPHzbi/9sG/C7pjG+2ryVkaTYFLi/Fs=;
        b=DYJnS1DjfuRLL3IOpyL6uYZ8NjP9VIn0WPVIpLyyhQVOjyTBgEOBgkXp4mdHL83zlf
         IQqBau6TjuZ31VF7Wy5mB9YJkVq4VpPiFNYTCPAiKmaPjlcbkasxmcloh3MUlLJGNSue
         ziDsySVP8yBZ1Op7NEMLANN1N3WsqFLvFv0ml0B/j6ppzPQJGSJQQm86ZGlt+Forc7Ul
         PRr3lg3uOZ2jImH4DEDjs69/1Sd9rbQDrBgPwE5Y8dxPpNwAFqySYkB9kZ5Z+sxbN1cU
         Et17AgI43aUCOpH+pwmxo0qzWTTclKYnRqFicDUx6kg5m4eaf51461ypwaNG+zwArwOg
         dzPw==
X-Forwarded-Encrypted: i=1; AJvYcCVKK5mjWSMv54q85nBphCoOYe58srOinP2nyAEYTidkXuA16JwiK//9XzXQNWTPALy5cOCc8hAOY4iuX8G26crU@lists.infradead.org
X-Gm-Message-State: AOJu0YzFGtXhv8Yubow0Fo2apVFVztI9InkteRMFsh8waCKvWzeRXcY5
	trKPzO6Q11fZTeMvA1z1OMokZZ8Ez3uMg50hUlcp7jPzSmDRxFkSoheH1nimstA=
X-Gm-Gg: ASbGncuqbSVTufHXHIjYAwiQIxE+jXehrXBnQE1abukzEdW3MmKwZi0UpoZFB4MQS//
	QZR1FIW8uLSWMzpeL9HYggZ4gEfJn5GFmsCF3k1b79YC8xmec15jwE6F/3OGCcSUs9yDX/c/XjU
	oy5MY5JCYq4MVsPDNal3RhGr3pecf0G8OKTAwRySmZ1Q1GAO7t5Bh/62s0CRqx+Dd8CP/y2GY0l
	do4yftGvIDoEssY8MBx3YHAFaDauU8a3ejy+iKKZ8121DlNKBFHJp3Vb/8dlugECmIUulPF6Vbv
	OdVvgC+ysfCQaa50JLprXUUIiJ1JJiqu3PyTxGczfNP/Nf1w0ynDDrRnLFcNbXNsZjnt
X-Google-Smtp-Source: AGHT+IFi9JXkUWFEjeJAm1SkUmYzub/naf0VWY52i62TdEebnaMcewd6ZseRSkUbDf0UNDl+nNKnHQ==
X-Received: by 2002:a05:6000:1786:b0:391:42f:7e83 with SMTP id ffacd0b85a97d-3971f51129emr3597689f8f.13.1742135472433;
        Sun, 16 Mar 2025 07:31:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8881539sm11919868f8f.46.2025.03.16.07.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 07:31:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.15
Date: Sun, 16 Mar 2025 15:31:07 +0100
Message-ID: <20250316143108.17045-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_073114_737209_9F8106D7 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.15

for you to fetch changes up to 701d0e910955627734917c3587258aa7e73068bb:

  pinctrl: samsung: add support for eint_fltcon_offset (2025-03-11 20:37:29 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.15

1. Add pin controller drivers for newly usptreamed Samsung Exynos2200
   and Exynos7870.
2. Correct filter configuration offset of some of Google GS101 SoC pin
   banks, which later is supposed to be used during system
   suspend/resume.

----------------------------------------------------------------
Ivaylo Ivanov (3):
      dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
      dt-bindings: pinctrl: samsung: add exynos2200 compatible
      pinctrl: samsung: add exynos2200 SoC pinctrl configuration

Kaustabh Chakraborty (3):
      dt-bindings: pinctrl: samsung: add exynos7870-pinctrl compatible
      dt-bindings: pinctrl: samsung: add exynos7870-wakeup-eint compatible
      pinctrl: samsung: add support for exynos7870 pinctrl

Peter Griffin (1):
      pinctrl: samsung: add support for eint_fltcon_offset

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   3 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   2 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 405 ++++++++++++++++++---
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  41 +++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   5 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   6 +
 6 files changed, 413 insertions(+), 49 deletions(-)

