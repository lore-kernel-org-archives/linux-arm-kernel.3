Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6D7C36018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 00:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=; b=AfDBGAw5gC2w3CzBW780Wkak80
	/qkXRuGn/x7f1G/GSzdKUg25tnn9eSCeGV4maq2BjXTgNOuS+OW3NcfOAxNu3zJWF4/GKL5LgAr6T
	wxeTBPtUUWByYgqam4igJ0S5opeFEG+ZNuT1B5BBvB1mHfXkFTFMaKswmrFKxeyKJP1gR01S3CWhJ
	3Jk17DSjxIJtGc4OvuToEWQYgAVtnJlyTuR1qUeRU9aQ9GrNWPbfJ20mb/iRyBMWD4slyy2lC4FdU
	OAHEhR4s1Fs87d8DaftbgxbZYheriETCAoKKOZ6nCbeVxv5J4zSXSPHTT7Osu3yCatjqoD5vsvIzT
	7IDGTnJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u088A-00000007TJO-3vov;
	Thu, 03 Apr 2025 00:08:26 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u07bm-00000007QF3-1NBK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 23:34:59 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso394888a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 16:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743636897; x=1744241697; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=aYOh5E1bVRdLflUId1f2DPxeIUmczMd3jQmvERF1pihhYtVtTLMdZJohr+luUiPChr
         2LkrwTDzLR6yean3BuddxfHCI4Wk3crmC0ZbXG1XcvSegeqfPgVjpKxLlqKh6ulTtyqS
         3nOTz3qKFROqnM986ev5zurACi/c9/pSxVUiC/bP39Pb2pY7BEpPmNv35isas4bHqQ5F
         CY+TQMayZLujc5oY+D3R8jmAklZGG98DtAg4mI2HxKOXhYJfxBLFp7AoN+LWb4g6vyZW
         /0fMvTvyQpaKN8tvYV1MMV5FZWtL2nUI8W/4lLMx1G4nTbj4BzG/y1xfgQ+vUm9b3q9H
         PsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636897; x=1744241697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vqQfU5MFNX+M9dMbS6b209zYYBr6gV4W0L8ERj/h45U=;
        b=Kj0aEvdeuyzmLsaGHhtM0dC63tckjVHwOwiVJ7jc9BgkM3dIvcPLIT942WZN4GEpaJ
         +Z5+5JxVso7QWytJRfSvpdGjL7ppovLI4Z9mTC+2L2QAr93FOdQprU4wh5u7tF3K/cHY
         2hrgR+/Hz4S0z7u9xP2xGPq9mUAhBKOH+tOZX/raglVUxTSwVWJNUlKstZzKPbpGEH3A
         9/8mQ/Dqv8oerKnxFyoXmDLQ+l9ZC6HB0aF444/dtzR5tt2JpBkCgbgOvzvjF09waFBo
         9BRCfL5gqTv2LBKaCyHc7is/6EWTUBvUJ6Jrpef4RlM4qoMcH7Ry2NDz2d+GvOK+hakA
         563Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqgFAhHzE9zcFTWQVbMurmbNuGQH2IBg5OnZca7uKkeSmw6fRDL3AlsJ2qOT09hqrLKXM5dv6TdGpbkB4M7pgy@lists.infradead.org
X-Gm-Message-State: AOJu0YyAYVuuI2yyLIVmrpCaKz0WSxDEub+lB0hqsy2l3aa/Dp7KQnCg
	7hEb08wEtnrAQ57SLUYpjiCnPy5xogsH+gezrBjQh9B05K20cs8lKo4d5b9F3AqBVUtULcAB5qo
	rsk0WN1IeCWbVtF9QfFBY0g4orA==
X-Google-Smtp-Source: AGHT+IHNjNoLSXpuoWq8MvyOWd0aQH4vReKV9zSqeimLC//wD66A6paRAKR65MmP1wxkBUjus4xLZlsJIhNOroJPqoE=
X-Received: from pjbov3.prod.google.com ([2002:a17:90b:2583:b0:2f7:d453:e587])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:56cf:b0:2f9:c56b:6ec8 with SMTP id 98e67ed59e1d1-3056ee3608dmr6316456a91.10.1743636897333;
 Wed, 02 Apr 2025 16:34:57 -0700 (PDT)
Date: Wed,  2 Apr 2025 16:33:58 -0700
In-Reply-To: <20250402233407.2452429-1-willmcvicker@google.com>
Mime-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250402233407.2452429-8-willmcvicker@google.com>
Subject: [PATCH v2 7/7] arm64: exynos: Drop select CLKSRC_EXYNOS_MCT
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, Donghoon Yu <hoony.yu@samsung.com>, 
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_163458_364747_8C913842 
X-CRM114-Status: GOOD (  12.53  )
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


