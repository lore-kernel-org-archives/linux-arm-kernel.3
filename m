Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655E7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 23:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=; b=i2oRbnxrRX7fcO5v0oLZ0MllCw
	cejvRoX1EZD4CC5F8A3hag2q28O2ipE9YB0IUjmOtAawRNCpQox7zVgxjMRB8G7rr6UhX0PCxK84p
	nknp9xNjHtEX66PW6vX4Fw7qeYvWt2Aslw/1Oc8v7rxFJtso/6IA1mqWfMLCAXbCSJJPUkVFktChf
	HeMeI6btLfi0pGHNgcSSmltPwk+r8gfP4UkQ9ZJHWTqknUhLpDYg35qVVCwZiXnILW3Lg3vb7Rxlz
	bBcDTt8NVnVpQtYJTH+1GIhE6gnmaiJU1RW5CH7TjZVByn/wlSsDPWa1VFjRG/vcBbpUFJS31C39c
	h8oiNdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzOJo-00000001Zq5-0UY3;
	Mon, 31 Mar 2025 23:13:24 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzO7k-00000001YZe-3VkR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 23:00:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff7cf599beso9012272a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462055; x=1744066855; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=BPEn2z/yXWzn6d/aFH83ciCiUAirrFPuqmhUXlVkw2fwd6MqHjJE3GYUFfUdH6wRkv
         Zu5A+wLzrBXwH7IdO2NaR34f1gimQAsNf5HsPuobsePP0JnreKyi65RoRT/XPL4soQzp
         tGmBjS1oPnryjiXbGX6zdvOiCBy5yx13RnpDEBD6nvgmI/+3STGbsZ3Yc0HmodpfSHNF
         9GiuvDc/bxyX/QLQ0usjJAfFOdghRiQSQbFI28zZbWXNka9mNfkhJeCZx1YQ+9g+/r7/
         dDSk/V+7XeIMJfmGqq9DasMwsX0pGktOyyvGC/eLgKBOzKABYcYkQVhlelQ9UXElDDvE
         mRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462055; x=1744066855;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=BUwxmnar9mAZ5TZB7GYb+3PzMWkMxdOWSOpyv0sS1/iLFsZcqFq/NTlWacLlhDDa+N
         FW9bCQPaJhtHPLGzIu/Y8DlI0lumEv1btb5kpG/KK9AGsc1+H17KFegH0tswJQfx/K5v
         q2qV4l2pOM8bVpIw25QoB0e5LgUOwWg+tWBUSdRfmlSebon3UGFupE4bn4eGhGiSd6OF
         H/PNL76m0WEMzakoVapcNDy3Wky+V5BQwD385jDQ9HBs+imgsPZFYZbLBRxx3qvl1gAJ
         tr/+rUY6vVol3DgywINqaQy8cbYI/9aO8XIj2/fXBfHWmtk1qxqMpX6ddQdlrs4/f8lP
         dAsg==
X-Forwarded-Encrypted: i=1; AJvYcCVgDHmWJnWHwgc2LXejaSMOqLN1wc9L/BRLQaghenoMs+Ffb4AP9V6w7A1fLHP9c1VT1r73vR6KZndwM2JtDfuT@lists.infradead.org
X-Gm-Message-State: AOJu0YxtQBm1A+f2WSNEtUO+Mr99KiVKNr1AJ5COrJN2g55iJoINm+nO
	ICjo3GBe44HMr9XUXhgZ71Umw/cs9VKNxfGkNMKrRSHgfeyQwtLIwDiYUwpDDy3+yf+IZRIvER1
	Z55FH2VCNWR52eZeRPZ1EglsgpA==
X-Google-Smtp-Source: AGHT+IEx4n4bxYc/YGt82JQ6y5gWLCjA7rtOL1EcSQ5FOyxHXLQUeEqlUnQfPzSQjxNpXS/pD1jk7mi3qLuRMiZ4+F4=
X-Received: from pjbmj3.prod.google.com ([2002:a17:90b:3683:b0:305:2d68:2be6])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c06:b0:2fe:994d:613b with SMTP id 98e67ed59e1d1-3053215a3d8mr16944353a91.35.1743462055036;
 Mon, 31 Mar 2025 16:00:55 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:28 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-7-willmcvicker@google.com>
Subject: [PATCH v1 6/6] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_160056_875629_E82C3DEE 
X-CRM114-Status: GOOD (  11.87  )
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
---
 arch/arm64/Kconfig.platforms | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..325279193e2c 100644
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
2.49.0.472.ge94155a9ec-goog


