Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F50C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 21:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=; b=XBa0XTUL+xOK41kBlrZN55ciFt
	IpDB8yJ0qCAF/8PltQYB3dTNgUBkzkM7M/oE3vwlxHYpzORMZ9BZxRtfhFmuQw7/Z/t9dExE+dP1M
	NQN6TtV3IuvZZ3zXjec3/amtMucD7X6UvyLJaZnm2yUc4BRfoZjCYQqnbulJTTyG+qnHUzl2tPv08
	F8fQGlh5wvZjJUOKU6r/ibB2EaNDO58mWzXa81rVNxfR9JTQ25RiNH87qaR5aKAU5N8svQsC52joo
	F35EqB7TpCvUT4g13hUqnPZIgrI4esfRsIqe9flHOq7jgtwjAOR9K5koWNnxHZOeMrcbpSpRyx++g
	SBwpO/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS0Io-0000000BRNQ-02T2;
	Wed, 18 Jun 2025 21:26:38 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS024-0000000BPAW-31Cp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 21:09:21 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b31c487e1cbso78438a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750280959; x=1750885759; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=;
        b=g/z3tl7Q4Gd11LbnlG3b4XutbrtlrBM6nSgxDrRg8Vy1Ae5xa9IM4SOxqqWn5X5XTM
         mYbnocG68eEm0uwFEMl78C9HW6Y327WOYuMBAhIohiXvFK9ZTZvwIwXY1EMdiwT0QZHQ
         +w7YM7LAD93dxOfQTtryMDt9Koffe2ibXGUSD2L0a7ZvIbbMIKVLq3BfEVPOICj+TAzN
         8ccin/ukdE0WC9wbNrQP7FiyBrckzqi/+ZNkJ/6/dy8F7oJxeS5aIokS+AL07XVzp1fO
         1dIPFL43vlZT0kempyiJE9LR/UO5CF92eBUJlWA/ZRZ95P03hU47cFmgTZ2W0LGxWFA6
         xzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280959; x=1750885759;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=;
        b=IPy1W5cmmcxbAPg+FWrJ9EapD6ym/arhM9mVmURm5Rf3wdjjTIiIAKpqDZpNBrc1EK
         tH5D5U2QA6xcO7Ypo44cx04EtUpWgVEq92O5aqcLZXtImuDaqdHpmGxxIF0i4+11+Y/Z
         m0yrv+ox542ch1Ui4ml9vW+cI66jyhX/JJ1bCYMjfJ57sT8VxbM5OtxHrFctuVkbEuYC
         PntpZ/53+pnZQIEHCJsDgtxc3uLBaUVgQpe9zLzEzb8HDlLa6QppEkJbJ8gr+JD5lBSV
         ZxmoMfm4sgvGN9WGtjeeTegRxl0f/FdDg9mkA2foZjj6QRk714exdOe1SBBCPlpgB1RT
         FFbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGV/FcqIK6HPFUT1zscxpiTZK4Riv5pShRVZsxMO9dmWQAwdlGl/Hm6lBt4k2+7BZgjDAImI+M/4cvbjkzOfwm@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi0lGe+54GooCBWQGpADEWHzYKZlq13xFFe3YzIdd5/k6g25U1
	BVJj0fA1m54iz96ipQD6Ib0A2NXTLoC40j9AwJeFpP3HyUk7ffC7j1md1GOXG6+v3Ypu3mmI6l7
	FlA5ElgPwGIzeLJ6f3QHNUmGMvKeqLw==
X-Google-Smtp-Source: AGHT+IGY3GT0ocfBJmJq08AJGD95U1laah8rswBwXGAH9V+lUNOhBR7Cym5NnrFN413oXgb7BGxavodvCRnnP6tKZZo=
X-Received: from pfbjs2.prod.google.com ([2002:a05:6a00:9182:b0:748:da37:7e37])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:790:b0:1f5:7f56:a649 with SMTP id adf61e73a8af0-21fbd57fc15mr29674578637.13.1750280959620;
 Wed, 18 Jun 2025 14:09:19 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:08:43 -0700
In-Reply-To: <20250618210851.661527-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250618210851.661527-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250618210851.661527-7-willmcvicker@google.com>
Subject: [PATCH 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	John Stultz <jstultz@google.com>, Youngmin Nam <youngmin.nam@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_140920_756607_892B6545 
X-CRM114-Status: GOOD (  12.06  )
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
index a541bb029aa4..46825b02d099 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -109,7 +109,6 @@ config ARCH_BLAIZE
 config ARCH_EXYNOS
 	bool "Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
-	select CLKSRC_EXYNOS_MCT
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
 	select PINCTRL
-- 
2.50.0.rc2.761.g2dc52ea45b-goog


