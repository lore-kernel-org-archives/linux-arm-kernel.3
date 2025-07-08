Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1ED6C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 08:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjtCRFWFffW7pi1vnTbfF8R7o1inZ//6KtfO8wbs4Mk=; b=Pv0gs9eP9GaFxNPZTY7MQFJEfb
	j/+I0Hk+hWGkQy095xj2rMtWch6XxzwB5KcYBoMcanaZG9RUUap7s0qUFyF3eXz4vAuVi7mSe3RP8
	MIyYsi7KkHcDwq6BmA7AoLRHqpRl5De12A+TVlBXLQhkioiu/6JPKxZWw46MVSKH3/4yL0pAFMNzn
	YGy0QYq1NRlS7A90EVPv7h76zB2j0QxQe9mUDch/G+gnVX7mAbNH+KBft6E/DcdJCnNEXYPldzCK5
	ICrFsikjmcQZyq5PLCG+1/DRMsudVs7rFotLVlFquoSf2/H7Usi0F9GKKOe2ic2JN0JO/dLsN6wiq
	njIh3/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3sZ-00000004mCa-2I8f;
	Tue, 08 Jul 2025 08:40:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3gi-00000004kOu-2A1R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 08:28:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3224154f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 01:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751963307; x=1752568107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjtCRFWFffW7pi1vnTbfF8R7o1inZ//6KtfO8wbs4Mk=;
        b=CdyMrBfuPBziMBzc9vJ4kwBXJvMw0Za5UPk2BOyf/FA5ltN0TdSTvhxbEWQKgoT1Qv
         qV19/6goSKt1U8xBpuTA7ZxHTw6DJRwVNaqEyOdGHGO0dKL5TEc3lHvaD9qR2tdUllsQ
         o/c23aEOCGPnIsrOCUBg77p4Uj5ZSuQrxQE7WOi+XSUSPlvE4sH9hOQfgmSWED74qloA
         RpP6H+BDOqRfmyzG/aChQgHmQA/eMorXpfB1CewUg4PjG8BegQiPkSYhBTvhobCaSiol
         VoFPTzTFxJaog9vUceyw5p0jRc6dDr8IFO03Qincm8kp/8Fr162yHA0VmwNGkIEE1eOo
         d0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963307; x=1752568107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MjtCRFWFffW7pi1vnTbfF8R7o1inZ//6KtfO8wbs4Mk=;
        b=mzmHsyJ0tdBd15JzZL97rHIz7/0iqfAPcR+zVtgjWmzAvb68Re2XG5UslxPwJXfsMg
         VAjywUR0TpC0qKUvSonw3MCxPQihz5hyQ15upvgHptT9pVi1+gEcW1qFD2yBGRThIwW1
         0OfgxVT4X1lNkGgY7I6WtC6LfojHy7x7LhOmitSrtmsd5VBz+xPcqqZ49/6hd4h6wqzI
         eD8SSMM0ac6Ph4qkAymAVhTXWkI5onGPsYLOT1G28mWBsBqW2zUnf6t5MaENYBSY6AZ+
         HEfyuX+jDVCakwJZrR8CJYHpwL8HAcqsD6s7Ex5bepb234NegPvSzhH7FZTXCwQ+jYkF
         BaFw==
X-Forwarded-Encrypted: i=1; AJvYcCVAvB8W4CNzT7KyPHZMVpFl7D7gUg+lgH+V/Yb/Knq12TuPJHaxADCWbxfzU5PmqmnSKXxwrigsPwQ0tij4BLUC@lists.infradead.org
X-Gm-Message-State: AOJu0YxlowckFbPxKrPwgrbdF7sXZuChge124tqjZj3rhNwIV2fuRzkv
	wsxiAwGDSu1jOzsUZqGZzCTeNAZYWW7PwtsqqfDOKYec+fbOksA8/05z
X-Gm-Gg: ASbGncs2uXA1MaGccZfQ1k2C3tUymxkjdhUsXhVLNj5xtaZSNh0Waw8sMCrQoSu+/eH
	lDjd0JlWcRML5GLSlQ6itcmluEHeHr1WneFUPfAqjvwxjEccOszBE9KFA4Ph6R6XizUthMVJRku
	9+tC21PMCTZsxwCbfn9/eqR0sQlaoGp3hhT5UvfraEjcS1Z9mluHj8UhV5TuXj2H+kaxDFaiYtB
	JuqzlxeQpLMB+K9hFJKM+kdQyjMbNxh8MqI6OsnIGbZagzhyGJp4IiilajitjCrmR7BeRMFjnKp
	G1XekKdNqLsu6SzrPBeLPh7EKzC/e4Z+h+8X2svy0zx3kXpP+uoD1ddux0NHAhrxJCxCl/vplSH
	SZ95njQ5n/BVzrh7dwHZaIgIuLWmJeeO0PGGWFbvv6Cn1V/GNENn4vw==
X-Google-Smtp-Source: AGHT+IEwEr9ZMYu+ucjTyJNWFnMG6wJX59s5qnFOf9Rk+CQvr9zKaNfPUVT47iH8O2QDS+2ETbkW4A==
X-Received: by 2002:a05:6000:2c03:b0:3b1:a735:e6bb with SMTP id ffacd0b85a97d-3b5ddfb893bmr1457603f8f.4.1751963306857;
        Tue, 08 Jul 2025 01:28:26 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454cd45061csm14579635e9.15.2025.07.08.01.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:28:25 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/5] firmware: tegra: Fix IVC dependency problems
Date: Tue,  8 Jul 2025 10:28:12 +0200
Message-ID: <20250708082814.1491230-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708082814.1491230-1-thierry.reding@gmail.com>
References: <20250708082814.1491230-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_012828_551708_969EF8D5 
X-CRM114-Status: GOOD (  14.06  )
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

From: Thierry Reding <treding@nvidia.com>

The IVC code is library code that other drivers need to select if they
need that library. However, if the symbol is user-selectable this can
lead to conflicts.

Fix this by making the symbol only selectable for COMPILE_TEST and add
a select TEGRA_IVC to TEGRA_BPMP, which is currently the only user.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/Kconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index cde1ab8bd9d1..91f2320c0d0f 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -2,7 +2,7 @@
 menu "Tegra firmware driver"
 
 config TEGRA_IVC
-	bool "Tegra IVC protocol"
+	bool "Tegra IVC protocol" if COMPILE_TEST
 	depends on ARCH_TEGRA
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
@@ -13,8 +13,9 @@ config TEGRA_IVC
 
 config TEGRA_BPMP
 	bool "Tegra BPMP driver"
-	depends on ARCH_TEGRA && TEGRA_HSP_MBOX && TEGRA_IVC
+	depends on ARCH_TEGRA && TEGRA_HSP_MBOX
 	depends on !CPU_BIG_ENDIAN
+	select TEGRA_IVC
 	help
 	  BPMP (Boot and Power Management Processor) is designed to off-loading
 	  the PM functions which include clock/DVFS/thermal/power from the CPU.
-- 
2.50.0


