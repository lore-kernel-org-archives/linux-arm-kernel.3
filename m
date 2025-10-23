Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7227CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o8cB2JKISSz6B9qz7HS2qbamQvKm9jtJ2xZpz8CPDiY=; b=fha46K2fCuetA3ceFTXxo3SoTX
	ZI/opYogDQRcb8lC+22zUospMDEM5Um7n7Yzp5hPSWbsRFw1Fj6wh+C+R/QsCju6y7rZE8zEvGsyF
	INXN84t8wnwElCi2xMW3TS8n4oWdPre5uX8X5wsNVnNuVqYEj9mZwCGSDyA282fcgDmgYXENnRWvB
	FJg2u7KKpxZxc01efmHuwJ29ZFC+PWVWrML7Ij6hN+/UD3ie0gt9M/si93t7AE2GwNPA/INvnaobx
	eCu+h2w9FmktGxzCweXH91XM4/V//TJ/32TOJxfLNd1ZrcfyTC5wDzFWN16xOBu9BBu2A9pvWj4yJ
	0qMpmAaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2HD-00000007ZTC-25ew;
	Thu, 23 Oct 2025 20:51:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2H6-00000007ZOP-2QZ1
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=o8cB2JKISSz6B9qz7HS2qbamQvKm9jtJ2xZpz8CPDiY=; b=MYLrP82c8CVMT7vhR9uTHJ2Hfx
	qSxT24BikbIFdtJ8mDIj1fbZj41CaqBWi5pRpraDblHkBsOjUBhtQaWq3fIEv+A2Oa81ZS3fa+Ezf
	k+F36rRqeMDbOqugTrGLa2zkF8r3/31CFcnawqY5Ik+E0ci6DiJokhywEIIXwT+d88KB/GMWr+/Q1
	aUyP2bUAVYeQBDWVLwtSOCkUoL0dVHCFrVh4x+6VHz570PRK0Q7UcDG79EG0hRdbjYqHZNXD/tXfY
	2HYkCoeZmYw+gc9bisUWCsxsVpxTjv4GS0GO/HifJzepiAqT/xjHzkmiwuP/IS4xPhEnClMaG5TVl
	ocUWgK4g==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1PO-00000001juK-2My8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:55:40 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b6cf1b799dcso913894a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761252663; x=1761857463; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8cB2JKISSz6B9qz7HS2qbamQvKm9jtJ2xZpz8CPDiY=;
        b=F9BJU8C44eTr3/NP9ruV6Xcc+wRrpOmotbjdcIjLO8wsCkU7mbDIhUyjUoiRoCOhx7
         /jUv/RLo9oXpN72cfdsZ44EAq6swHIQ5Tj/980ijLWeJFua/oTYVg/KVoDyVsh6UIcfk
         jkn09e84tfnPuT6glmAnY2i/rQgNv6ut8tVhIoc/t2pybO0zJVp89X+bSQgJsPKL6D2G
         dFRCLBkmKjH/liax71KGGoPXxrvi0WSvdTNoe7A+AyLwqcQyHMjNbbwF3BdyJAPLgJoK
         5ZxxFsnNqTt+GAYNYHbzY4904whzvJez0mbldqKud9qraVMv0VOwLrM9v6SGwp0L0a66
         sHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761252663; x=1761857463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8cB2JKISSz6B9qz7HS2qbamQvKm9jtJ2xZpz8CPDiY=;
        b=bCcyTfpgXaQ3LGy9m4ha7VYbL86ys12ECIxIQWQrxz6egCy2HcZWx+Q4qsg5HE8SaR
         JftyAKW0vGfJ2rdur4yd6ez2I8glGg6adZ7J0ZQaQDdqt1MzbGRbyJw3FDC4sdqyNIwS
         AB4hylZba0JHV1lLZC1DpyiAdDnJ3aqQGYocHjc3dQhFDbvtGRQktlw8dKowJld6oFpa
         vnEb+2CEaZ9CJwy8TUgkpi5pUbnuRQ9lHQB12TSPjWO/iI4QmQfgKbTkRDWDlQK16ge7
         HPyNn5oAK37LCsdaTv69bulceTPvzsStsRlDn/Q6Q/7pWqXtz1F9PcCj9XLe4sPdzUV4
         Kd9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaCdrdDAM5WBWHN2B5HPR004QOsUK7EjN4fiHn5f5k3FuRjlSdTQfpqR/WyrYu9MEcvllQMALrQVrDMeCkK8il@lists.infradead.org
X-Gm-Message-State: AOJu0YwK8+HKTbpM+D4i0ZXDpsRLkrbo+HxtfsgX09CHwk2AvPyzWjSJ
	THBEK2mnsXG2jFVhyJevbVwMDJY2QIk5VeDTcv6rtB3pPD9xfVMVNFk7vhSZOZou0mPD1uH2+yx
	bMpYzI3bXCxAGwzOHbWOpEHyxERivDg==
X-Google-Smtp-Source: AGHT+IFyBdY0WL7vBw43kUVAfg+zsn8947aI2UMr2nngIWa/h2HcRjI0oJntAshNL/DThPFMcrGZEe5MnbRO0EsgMrM=
X-Received: from pjot4.prod.google.com ([2002:a17:90a:9504:b0:33b:c327:1273])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3f10:b0:330:7ff5:2c58 with SMTP id 98e67ed59e1d1-33bcf85ffafmr33543640a91.7.1761252662882;
 Thu, 23 Oct 2025 13:51:02 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:50:33 +0000
In-Reply-To: <20251023205041.2027336-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20251023205041.2027336-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.51.1.821.gb6fe4d2222-goog
Message-ID: <20251023205041.2027336-8-willmcvicker@google.com>
Subject: [PATCH 7/7] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Ingo Molnar <mingo@kernel.org>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Hosung Kim <hosung0.kim@samsung.com>
Cc: Donghoon Yu <hoony.yu@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, John Stultz <jstultz@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_205538_953882_8A2FB70D 
X-CRM114-Status: GOOD (  11.98  )
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


