Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E9BD2CDFE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 01:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGzNZAgSmf1hKexSS7kscyRDWNyrH6DCvG9Q4nvREV0=; b=H1vXtDZfU+CWC/MRZEPcFKEJHo
	+IxDI/DLOJOaVM4zC+YCyt/hrG8EkAwE7MeUHN2R6m9EdxkOlJzjN9muOy6vzT6rAP0vW1C/o+y4i
	9l+D+VZiutB7sDK/lp9CnW/dusdsSTWtimnkN21Z+aRtuvmoZSAZG0p8xJys7747Zx90hmWjD3Mej
	xzlV7JuDU6AC5hpvB7gI3DSLH9/V+KqPKSsF/mQ86vPJH7IhUzF7/Ao+hhZRH3a4oDdQyBSv8iHvL
	hapIhGZy7P/2qqrfRm29v8t/seSpgZatCiiufgXaZui2QF4oTzegnY2bE7j4X27b5kJi6TU83OKpt
	218OB4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLU-00000008qbr-2kiU;
	Fri, 05 Dec 2025 01:10:55 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRKLP-00000008qXW-2gOm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 01:10:48 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34566e62f16so1775237a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764897045; x=1765501845; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGzNZAgSmf1hKexSS7kscyRDWNyrH6DCvG9Q4nvREV0=;
        b=DypKTaC+PKXMF7N5KuHFesNuyR6zqDHuYAGE2iyrTmFhp+6Fk30A6GeEIdKAKKjZ8g
         EHR5K8Q2UU90x830rDHOc4vjG8v80XR4gMq2NRckAACzOOuei4NbmiLsuY6WeI5KXlPx
         8wjhOQ2TUiPFerxsfElGuP1g7/q1pgI5kvh/HP+NYNuKClQNfSI6Opwnqjv0ZjlZc6LE
         LQ1hTcspYQFWyJYU22ucz28omiqh9NQy+4/pFpOvNG6Y3rdYNlWw2ApClajBe4jueMRC
         xEW8pD13Xyq/6YhgIY7hK/i+eK4IH6Q+mJoxoNqTbjh2XOM/374FU6k6ZpzfiaX6A4jr
         MG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764897045; x=1765501845;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGzNZAgSmf1hKexSS7kscyRDWNyrH6DCvG9Q4nvREV0=;
        b=CSXlakqdnwWLQBWeIKTTwH/8LSR6JMoSdQCTInHU5F2p1xzabrwZmAphjExXyvMCO8
         R0rjWduGYXGSlrYeI1xupE6RVzx3qx+ItZatgrlkyhjj8mmBKI7egFBVlvzlXGsvl86G
         2vKGRZch4D9Ec36xw2mGXH14h4bO2L54d6fyTDsh7TtA9RtxOLMpmRwIJQYDJ95ENE8h
         VBRSf8Mkn0/H8jilo6sT5QXi9C4Gv6Uv7f3rm3ijAvhZ2feuXIL2oSE89AL4ugE01jaX
         1uT6A0bJMDmx4p2670TrHaEO6eW3kwj3vKTm7QxiQFzYBSWbzUDfeo4ZH7/w0IxGRuh7
         LCuA==
X-Forwarded-Encrypted: i=1; AJvYcCUd2RF3UZ8tjIGuWxcCEzVaWapHIx/rocrK4W1DjnYp/na0iayjk3hHx4ggNn76FjJ8RJhKP9RYtCewbnHXkhxO@lists.infradead.org
X-Gm-Message-State: AOJu0YypjuNxZsc7K0u1czLRGePzFhikJ+pT9vJmEiesXQnVP1/1Sg9B
	CJsSRJKcbxjhWKUEOLFqlmVJqY7y7TIoSHSc0ujYK4uQ/N4dyzgiYgcVM0TpdBmSzbkdfFstnuW
	sGDlAkuZjb3+Lv58257MO3YE2N5y0nw==
X-Google-Smtp-Source: AGHT+IEshhpLrp+m+z5Lio7zTtyyfuyj3rt2WlZv8C9AbKaTeKWuFxioSmKqiZC+EdgZW5b6KBHOwrLop22uhDqYJzo=
X-Received: from pjbmt14.prod.google.com ([2002:a17:90b:230e:b0:33b:d40a:d93a])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:9f84:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-349125d3475mr6578882a91.11.1764897044574;
 Thu, 04 Dec 2025 17:10:44 -0800 (PST)
Date: Fri,  5 Dec 2025 01:10:19 +0000
In-Reply-To: <20251205011027.720512-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251205011027.720512-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251205011027.720512-7-willmcvicker@google.com>
Subject: [PATCH v7 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Rob Herring <robh@kernel.org>, John Stultz <jstultz@google.com>, 
	Youngmin Nam <youngmin.nam@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_171047_692501_272D9E7D 
X-CRM114-Status: GOOD (  11.63  )
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

Since the Exynos MCT driver can be built as a module for some Arm64 SoCs
like gs101, drop force-selecting it as a built-in driver by ARCH_EXYNOS
and instead depend on `default y if ARCH_EXYNOS` to select it
automatically. This allows platforms like Android to build the driver as
a module if desired.

Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 13173795c43d..fc6026c368ca 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -128,7 +128,6 @@ config ARCH_CIX
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-	select CLKSRC_EXYNOS_MCT
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
 	select PINCTRL
-- 
2.52.0.223.gf5cc29aaa4-goog


