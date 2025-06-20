Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69996C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 18:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=; b=YEnkafP8p5YZNaDe5yfi1RpgGC
	25rq/43eFNwxliR/J92un75b9J7v04v5vM8bqa4M6bkGuDKP/YW4fw/IiuLh0EW5KHtpMbxzPnVBJ
	YxbZCPX7dZExuFeZ+JY+Prboz+oassL2EGBjNJMm0wSeUvWVaiQyqlwIYxvPvqqXhRA7mlHa2csGk
	DOqL4vAEHEZ7YYkK4Kt5PcflXFAqXTIuZWXcIp61fmX6b0ps5cIpV1IyhZCiVA4hO5Nwe3r2UJKv1
	ObBJXewP8JQBuUiJjNFtj9JlLku/cWpvEs7qLa6e7iPZGpDbEmG8b7sw/13hr3wrCcmMEqmIXxePH
	LBDf0lTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgYW-0000000GN5T-2k3I;
	Fri, 20 Jun 2025 18:33:40 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSgJI-0000000GLOT-0yO5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 18:17:57 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b0f807421c9so1445911a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 11:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750443475; x=1751048275; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=;
        b=iKlJCvI3gPK//Ap6tAUeWL++T5gQ3co0j47B660M+wdI6Yx/zr4sDWoGC+xYexfyHJ
         ttZrWkcFbG/+tnsmpxwM5az3Z8b8KTKuucZ7mev9xIzc8JOCS5ismp9ZQR46cYAL5VsB
         /g2IFgzrwszLDg6lUHuBDacsu2HKP7bMuozDlieabhaL7gZ4b/yVFlg4uzx+owNvT+Gu
         OGpEUeg+dGlExft9+FdldAAsikrMYtmg7TVpxOq0NQZpS6f7au0iH0JsUSQ7VHsN11SI
         pciXGLtDXEFPPF9kyNL/p5XjVT6eAJ+bU8Ep40u3zPHT+vvIGPI6c2sRt34Mh7kJ//zZ
         QOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443475; x=1751048275;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsGE8lw3KH/D0SLaONE7VxsA+KaDyJNSSOZHiKLjPmQ=;
        b=DXPxWJyFnhhzM9q2IYAsC0knoVeYeBtmJmps0B3cNngAC9fDvTIR0GMRLNQfidKvA5
         jyMXl5jf/S7JE7cqF35bi51uPmS2s34co5zMyjx26DftzjMemfGLPfmRUWn6KzyB6iJe
         pQILLhaY42W7WQwghltq3J4lAMD7n6bu/q5/r/z521AG1UFQSCglqSejk8xk6NXeHT7H
         2HW3N40bpRBOmEAWZBCpLccQXe7VD9vsp0vjgr08sKrVQij3f5WHpFhVoCrKo/WjF2BF
         ksWhg6SXPBvA2YBPeH2+0J3jNrMIdBGLZYL+tti+BPb6QXGyOwHH84N0aXyS55E6Zbvk
         LwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbd9c3UUl+q4enUUhQnYfiLYQ1Ir7jCabTiyRxz6XMi1xdmpEwaIUn1itytKrQ0/4kTTpzihXUuS26DzaLdS7/@lists.infradead.org
X-Gm-Message-State: AOJu0YxSG3ALnmfQ7lsiVAf4y2q9SiigHiDmkYrHzP0KGF9f0f7a3rwt
	qzLcIze3y+LGCD2Jol8j9Fa7T0JsoYVJFzDjG9KtIC7zg0Pww2KGNXygGMBcgu7WRiK3vTkCNw3
	v1uILnOkkjUCSdScaXSH9c1Hgq9RQSA==
X-Google-Smtp-Source: AGHT+IHypcBEXCfetti6ZSKrWADvOCJp2Q3YDfRe9x9eHf0/IU91QwPfM1r/wCQjgAiUHhCtBoksoPLTGqQX3VT8HmY=
X-Received: from pfiv28.prod.google.com ([2002:aa7:99dc:0:b0:746:2ceb:2ec0])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7f8a:b0:220:eef:e8f0 with SMTP id adf61e73a8af0-22026e479cdmr6696633637.23.1750443475053;
 Fri, 20 Jun 2025 11:17:55 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:17:09 -0700
In-Reply-To: <20250620181719.1399856-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250620181719.1399856-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250620181719.1399856-7-willmcvicker@google.com>
Subject: [PATCH v4 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
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
X-CRM114-CacheID: sfid-20250620_111756_266414_FDC0D875 
X-CRM114-Status: GOOD (  11.36  )
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


