Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D001CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8cB2JKISSz6B9qz7HS2qbamQvKm9jtJ2xZpz8CPDiY=; b=1BOBVhfFdiQcd+R63XBwe0RjDe
	GKeMBigEVGL8MDR2KH7NV/YH4YQKV+oFVgrDgG184yDLWlPXoGRUG7wEiPQZ9owzxNezHa7xhGpUe
	ade8P/2L3ibzW5h1pdGiIbHuXBC/47ozIbkp4/Xk0jY+gXFNlf/AP2fz4rCILKrWNPDkW9uENmVsf
	fA1bZxwBoZW6RmKDw6n+DXvWySImhOxZhwW5fsoa6wvXsSvH3t4vv+Wkuf3V8fGKRpr+k8qoSGloV
	RqCxz1OiPVGuhu5p4wv2Zv8qPqPsdKbLGGkjAXxiflgka6TlKJAJ2VL7X00hgfrK1AZAqQKzAdZeB
	CFnNqX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2JG-00000007aOF-2oJ4;
	Thu, 23 Oct 2025 20:53:22 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2JB-00000007aKE-0Usk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 20:53:18 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33c6140336eso2733276a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252796; x=1761857596; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8cB2JKISSz6B9qz7HS2qbamQvKm9jtJ2xZpz8CPDiY=;
        b=0mX7IFnRSdqVmxY3UAgjPz4TjtVsnxgRg0RULxpCppMPn1DV6zwapsfi7Uvww6q3cu
         lg3VGmUJHIKoET1OeH2GdmkgSFnLqHV1aRItetFy0JD6/RNzLchYbujRC5l+vc95qomn
         vR9+rKNsh4DckZDxHFuc+gHgIjdq+WpuNXmyzKMjnJA8j31eqkDRzt7/JZ+sncJt43uS
         Ck5aS4ZD8kFLN27RBBtWkh5Z2SmSi/qIiEFJmAerWRMLbERDSjB22l7kadfQiwSn9hdL
         PNi3SRU1z4zfcwbFSGglVIO5QULjov1tGUPPhpU67v29DPT1x33yikjzoRKAARbdf4+u
         gNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252796; x=1761857596;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8cB2JKISSz6B9qz7HS2qbamQvKm9jtJ2xZpz8CPDiY=;
        b=s+tfH8x+FMwuoJjing2ndZnMbGk58u549vqhMNs1YvApTCxL4lytY3d11veW8xstAw
         v0pYHGxfgzizSPYiWNrBO84gfMuC3bJGWpT6McdSBQjztqn425gU4W5rhGnaSPClqB0t
         kUrTHTnql8tOUzu8/KGosOhvDIrWIplM+cWEpKmH2Mo9qI3rhQaJUR8mp0MLTNs85apU
         tKcO9VvS46KBlFThDqsKicqdqwEberxftKLeFTtmlatn0/Hz9hbdnoEoY0q0IZ+TdnsQ
         JPKRNo6byTVXl+q6NcsRINj86j6Xp91kJLExHRNaRdzdPMWd6cDibqulHLYrEmQz1Z4N
         nlxg==
X-Forwarded-Encrypted: i=1; AJvYcCX+dS/uPVovFQnOrNkfGKfcjWVOV63R3sovU5/iGjqmqYXVMkoIVIOh2y/CKATz6njPjLIQBgl6Tl9MzLTbsYe3@lists.infradead.org
X-Gm-Message-State: AOJu0YzYWOdheAjmiRj6mxxWwlWOJ8igLpgcj8sgJ/JdJf+vKw+czIZI
	sTBlQnKLPm/uGfcc8F26gJlmt2WAR9BsrFkonIxZ2UOpf8DrGvncAYsO0Zxmq1zRnV5Qvjgn/D6
	OJIo73iq5sMjoHLvf9NaHyUkK/ApKKg==
X-Google-Smtp-Source: AGHT+IGHJ6pvvQTONfUgausz91DB8YXTKIZ2yC/0dVMsDeXg0rMdse/dnPjwuJXay8ZVELJRf+0mhTMoklNFavlOnNM=
X-Received: from pjqf18.prod.google.com ([2002:a17:90a:a792:b0:329:e84e:1c50])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d44c:b0:33b:da53:d116 with SMTP id 98e67ed59e1d1-33bda53d1f3mr36146909a91.26.1761252795891;
 Thu, 23 Oct 2025 13:53:15 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:52:49 +0000
In-Reply-To: <20251023205257.2029526-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205257.2029526-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205257.2029526-8-willmcvicker@google.com>
Subject: [PATCH v5 7/7] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Youngmin Nam <youngmin.nam@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_135317_267657_738AE4EC 
X-CRM114-Status: GOOD (  11.83  )
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

Signed-off-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
Tested-by: Youngmin Nam <youngmin.nam@samsung.com>
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
2.51.1.821.gb6fe4d2222-goog


