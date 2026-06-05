Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4498CD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 20:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LV2TWmv6e3Y0iXxtyydvRw2ubePqc7/64NdStyqTFkI=; b=kHH6RnYILhq2qj
	2WVx4ccdi+MtRqyc6+d9prJJMGxY6buNwsoHFKoWGXl0H9n+rY6EGuEDuSXAUn1S70gPNjMxzMIow
	FzMdlbP3VvhlxGn7rFctZv/GzMFY8jgrMYUCy8vOyXV5rm0Vcj2jJ+bYJoTTswexocQg0pks4CQgW
	1Yc3lgqruegqdKSdQaXWZA2zwyOj3LpnfGG4gtr/Yuhz+/R6gGRpbGQGYeIj0e/6xBTHVSrlsGTfo
	YSRfpFx+9x0HyAvnmkcmT2DF6XIkJQZdaoOhHRqi+Scv4wC3AEx7rXdZ28TR8ksJlpo+hpmVGzR/6
	Z+6ZxYEAAvwS2Gp6HI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVb0b-000000019gH-1rBa;
	Fri, 05 Jun 2026 20:19:13 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVb0Y-000000019fD-0l3k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 20:19:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490b7866869so27609415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780690748; x=1781295548; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LV2TWmv6e3Y0iXxtyydvRw2ubePqc7/64NdStyqTFkI=;
        b=ABCXlakAK2mV+JFJwD9ZQZfgOuIBCjI3jmKdL2/3WCiDFygPu/u09e25EEIX0ArkCH
         xLpbM0PSqMTvpOXP0B0MHc1c92CteebmI2a85MS8IjQrM8VCcDjzzxxYDBiRbbEbhqGt
         UZKSAuhqF3bdjaCJ2Zo+KDN101VBRNv4N5/NfbUPlgEHr1Vy/xAKy/CxjL54rxJKxjuo
         balglIgG+nHLr72DZr6HqgiZQmUdoz2AyXkzryTDTzvFKOKMdzZxQSqV2uXfTI9LAzKo
         xdOJJBm1hZfSTAthPwPeDPfA8fXQ4sB5OAxKMtRU57pmeaWixNHiqBfFCC40yrLbnrMx
         hrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780690748; x=1781295548;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV2TWmv6e3Y0iXxtyydvRw2ubePqc7/64NdStyqTFkI=;
        b=qgYEFqEmEFsxR6H5IYfoEBHPyWucObJ2lGWESugVZCZcqc+bR5U+dILVnuprhexRGI
         Y7sjmunFpOch2NlAJQUljjGnY95asTSnuIlLkTwp6y6aPSqibQMXfnmKlpULcw0LALdh
         Ffn2vZ4cmeD4cVj+EoFTJz2qYQpx3J8NyQ4PlybQQlr9Fcy+TtmyFpZ/tiOatHbEcr+r
         frfa48QyNMa0oDWPxs8va1Fge7iWm870wcxNvJbJZVB2ACpzwptbxObiD+OhUpKS/f9U
         EyaQQtz1IMP1ZUmlArb2vELQ0vDviZGxcbxyiu/Hz8sTH7gFMPQiPpbQuXX9vzjwwInJ
         FhEw==
X-Forwarded-Encrypted: i=1; AFNElJ+BnK+ixtMSukpM6zlvCm7u1pcTpJgrbWYjgPZplvqgUhSRNuqyIFClfUSmM5EAnAzTZT9tZZMQiHOK41RNuwah@lists.infradead.org
X-Gm-Message-State: AOJu0YxK8bT6S11davBRTN1M7jn/EsbZMwkOlkJzi+0GNxof7yAQIanK
	RvSm0nK7s3Nyi1kZS9rZbyey/JTBmRa3a2N65pbwMYkd0k/45A3eotouA/eFpVTgvUikiS+HwCK
	Muj8S7XE=
X-Gm-Gg: Acq92OE9+Op2yi+I4WP1fTIXzhnUn5MopLbTtysc8IB2YcRFymdzPBzr4iJVhQU6nqM
	VlGU14AQamzoXERfVpWCFKHUCdIimUVon+mFnUuTy5bOpEN/HFav6rIpZWlJFajN7YO3zueN0HR
	qEVrKdeoHdkL5Dar/IMWkP125d/LWmS5qL55OtzhflCXC/XaQlMyx0BRcM8xjMEYsOE53GMY8Vx
	FFn5jt/VhXRJUBKtYzdU0Fe5zaWVEZnKhrNc2sGVj9t1Ybf5TR88VmTyGxOV5ue5ZwJT2zfjvxU
	DlrIXonbi1oRGeRHYBInacmaNJouWZ7ffOPjt2aj8TOsWEb8DlY0v0FjYsZ0xgSwJIBal5hoZp3
	DnYUperKnZSMQmlHj6kdS7UX95O0qC00JnVhes99OccCcMq+HuhR+Pm1dNDzAv51IIiY3AQQ2Gm
	e3BVGPHQo7YwasKMxte1sFPltqs1sQC/m7Zav33ih3L3IkoJb9QFt/3IxxIjWhkd4p1IDrhmcQ9
	Txnj+RWNzHYDDCT15hqG3uKHu8=
X-Received: by 2002:a05:600d:6444:20b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490c26e1acbmr64974595e9.12.1780690747723;
        Fri, 05 Jun 2026 13:19:07 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm190533895e9.14.2026.06.05.13.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:19:06 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 0/3] Exynos PMU fixes for cpu hotplug and cpuidle routines
Date: Fri, 05 Jun 2026 21:18:49 +0100
Message-Id: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACkvI2oC/x3MQQrCMBBG4auUWTsQI43Uq4gLSf+0A5qGDC2R0
 rs7dPn44O2kqAKlR7dTxSYqS7a4XjqK8ztPYBmtyTsfXHA9o/3yoly+K8eyzsX8A07SoHzzqcd
 4j0MYEtmhVJxgg+frOP7sYMawbQAAAA==
X-Change-ID: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_131910_273153_C0374A0E 
X-CRM114-Status: UNSURE (   7.50  )
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

This was reported by Sashiko here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
and was mainly introduced by enabling cpu hotplug
support and cpuidle for gs101-based SoCs.

One patch removes strange usage of smp_processor_id() and
other patches deal with a few missing error paths issues
here and there in setup_cpuhp_and_cpuidle() and around.

Tested on gs101-raven device, I don't see any regressions
but testing from others will be appreciated.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Alexey Klimov (3):
      soc: samsung: exynos-pmu: use target cpu ID in hotplug callbacks
      soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
      soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup

 drivers/soc/samsung/exynos-pmu.c | 75 ++++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 15 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


