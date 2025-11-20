Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFC3CFA440
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 18:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGcCdHbDbTIl/UPp/4b9lzfyFAtmrTaBAs1wcxj1OgM=; b=0mCI7wJdcu4S2JJtQRTwuoiUFN
	Ll/AoC8noD3QwihAX8EcqKNZVwZ12h76LYgyx/uLiL4hTG7s6bk2mSiUNDvQqwAtopM2r3uuVABSQ
	FyrKR5d6ku+fCNtPqS4uSZRT3olTX26wL0dvLEoGDqHU1qKJHPA2IxyK4tWymDWSjlMDIvExIEmpg
	qs+dVsB4q38B0YUjR0eQ74lVOzyqywAknam7mGyNcv4sHXBYSVplfY5n0w3sQ3XTQt6VeVRLQFvnX
	HGdIGvGbQUcZIKz/AF04ZentDpGCq38KU1ME6DhzzfClm0aVF2qiKDFXvpBLeKU+Di0HdmSaxw6H2
	rQizJcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cZ-00000007ElR-0cYJ;
	Thu, 20 Nov 2025 18:43:07 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM9cV-00000007Ej2-1sWB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 18:43:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34377900dbcso2777708a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 10:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763664182; x=1764268982; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGcCdHbDbTIl/UPp/4b9lzfyFAtmrTaBAs1wcxj1OgM=;
        b=fbCXM9OjSgk3oBJRCQglA0ouVds1ID/F3ooY+qJQadVvc8nguMSrwTvnEh1KVZmQ6t
         xQ7R7WFLNDKMXlXHucWdLcsHk4qZ+C88Jb+dvC+65Okgmxz4LHBvnlaRXIxMX2IZkHtx
         sgEYKFK7jbO0KyfwM5HX8jSQ7flh10n9QBqqrq0UnIQsvzPiDHmFuqb77D65nTc3k7Ru
         K9LZYXbGp9R3TfLvjQRyiVpO4gdXLADH75WAP+ilacE7XpUUL4y7shiew5l/vegFHpKh
         leja2SiiO2yuUjVoKmxeD+CmbtRJcrwg0ZVm9CLdYLQgpnkNaXO+Z6b5UrkbN+FEUwlt
         T0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664182; x=1764268982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGcCdHbDbTIl/UPp/4b9lzfyFAtmrTaBAs1wcxj1OgM=;
        b=etFqd/dj8POzCdGcfMCw61o2tN9baWEhhk7emRQIuYdlRjcmkn5BbFphNSNtGp120E
         qbLwS0lBleMUyxmDhTj7oApJo8kTbcLup6TsTgEXlVU2Bjy9GR+4kq05QNK+bHwUbL+y
         ZYeH7EyISGA4wZanc7+dYdQe9VHr529SmY4tGlDEDwtKJfKg6uUv85oz8T7MzAeic2sd
         uh9j1cP7R65TcPXyHH5/AON8TpedNpsRmqYs8hqtJ6hM4EnsRc3IueDp3ra+YhB4sPMW
         vgOF2q4SOvxu9LoiQS8IoKU9iNTqTgwE1/M+xXmnhxZXM7abEVGuL/9NvVhFyLVbbRIs
         sahA==
X-Forwarded-Encrypted: i=1; AJvYcCVVKwjAXbBeqwqG/LSKinK6CnqYz3e6tc8joG6g6bOfP6iuLXRQWYHIlcFI5PLj84PoD3oJWF2nyuMVWgKBc5pN@lists.infradead.org
X-Gm-Message-State: AOJu0YxqzrX108f6wY3Gde1v7ceO4tYjAtiDkkNNawCPvkhaH5lJYriW
	MugG4xZegqVeqZqFO9KErz88nH8cLHfUtOsWZSD+fCZD3320b9YLJv5hJffRyjgIhPkwgiFNafN
	pagtthDFNJFKZ0bLWZrjdMGSR/ATesA==
X-Google-Smtp-Source: AGHT+IFt5QfE8e5NXxmnZJ0/iQdAGNuMSvT4BtRRro1MfwvfVu6kdP0H+7ZtU7YhUZh+wKkjO47g10Q354uCZT6CnAQ=
X-Received: from pjwx3.prod.google.com ([2002:a17:90a:c2c3:b0:343:af64:f654])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a51:b0:340:bfcd:6af3 with SMTP id 98e67ed59e1d1-34731c82829mr327779a91.33.1763664182070;
 Thu, 20 Nov 2025 10:43:02 -0800 (PST)
Date: Thu, 20 Nov 2025 18:42:34 +0000
In-Reply-To: <20251120184242.1625820-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251120184242.1625820-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <20251120184242.1625820-7-willmcvicker@google.com>
Subject: [PATCH v6 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, Rob Herring <robh@kernel.org>, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_104303_485317_6C5FA04E 
X-CRM114-Status: GOOD (  12.31  )
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
2.52.0.rc2.455.g230fcf2819-goog


