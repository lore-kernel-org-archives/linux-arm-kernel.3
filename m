Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6037EC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQItitSdgkiMJfSaAOy9tZBmfeo5kJAi4kSnHOl34Qg=; b=pF4/z48x/5rdMkPFt49NvJI/OF
	qUw9C1RmiU8BdXaV1jtS35mvn67fCBXwQkD+fJ0lUpXbmnfV5C+IvaCQ7gKiQyFlR/0p5778J+Hc6
	c9Gnm9Qnc0yOzIzqlwWtkTiT5v4FjSdBCgebgG89h8iKYmKx7mjwI8eFrXwrkMB1TbaK9Smmhaw11
	hG378TkKni2HMUFooHEhG/3v1z1YQbHBtT4Z4mMXiof+HnTmHs09TlT0I8fURuDRt5XOZrOTqWYeA
	dAwmwIKHkGcM6QHUWNnB7VizmSBjz3EKwKlxa9hSx3ZXPxAQMheD1KloZw76EmThr+h4TjzJFWixS
	GdLgIhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieyU-0000000CPw8-3Uia;
	Thu, 13 Feb 2025 19:34:14 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidqx-0000000CDEe-1Seg;
	Thu, 13 Feb 2025 18:22:24 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5dec817f453so1823341a12.2;
        Thu, 13 Feb 2025 10:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470942; x=1740075742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQItitSdgkiMJfSaAOy9tZBmfeo5kJAi4kSnHOl34Qg=;
        b=OYD2l6VWx1sWkUQDEgq9OnyM+ZNst/iesKaDFHdHdGvd4D5uEEBCzc66roZuUIEqd0
         9cwurMIvyD388v665QZk9GEMTG1zr+TyYesB7h47gJeCZ/l0X4uPu0JtKaoEoVsdPJgJ
         brBq1Lg3xbjRTHRkGErX75f1M0KZt0eRTRD0ohxQ26hwyVv/mNuez3W+HMoyFKmgC8ti
         dfu5/994vGzyFNGwrUxzs/p4iSTdy1WyC0quC15J6O7bOXvkLh1MmEYjXbD/XM9aV55u
         2A9snXpqtDJ4Y1p/N/BPnMf6jRL2/R7ZoBA6I+rtnJvzezma6c5jcQqmfcDi0q/7AHDD
         N/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470942; x=1740075742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQItitSdgkiMJfSaAOy9tZBmfeo5kJAi4kSnHOl34Qg=;
        b=dxEU4VUiWqrCqDW2b/9yp+wC8XAz1aRihBZZ+Gv8ACTlWlZac/9riYLpFnXD5P6NWR
         /wQJrLgeOqBpeh6lF8wnAt7mUw99+xAnB8Wccj/ineVSSLs2e0jeNNKYgelKcUoC+DyL
         9/l6arRP4Qej1krH8RIzLTTFi+LaTO0Kh/zRqDT/EgAp3qEaOEtFUb2kiLFZKDd/YTu0
         SfUlc5fRuBDdpg25JLNOXsOvUVN1MzpUC9UN6Np7nG8FLyS99pKXvUQmDFS/4BFWfA38
         ewpuEOlON3DINnHtWqaGKLjeUfB7cfbRy2qDCgpECJQ6KyofsIugH0qGOCulUVAhJgAs
         Ze/A==
X-Forwarded-Encrypted: i=1; AJvYcCVnE+YJo4Qf5wl+fBTbPb3/MVL2jiY/7OmvYsQ69501AJFKEqAU4FRdkJWdIQA/ki5ovAigbWplozNLz+XeB9Km@lists.infradead.org, AJvYcCXG6Nz7Xp3wtBm2K9uit1ChKBHtD9ZV3+WVPbklIpZvBKZPc9lPsAt88uV9EHdAH9LY/oNzlAvjA2Wy59E=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJT5xUNvPmw47ubK+Nd4zW8P3nPSiD/8K6fYMuMH+OwLFfKP4q
	9lX348bV0IWCOffVhLIcXvXfYfjJe72ORu0svaeACPUymXeYreVG
X-Gm-Gg: ASbGncuIZSa9p0EkNp9eFGKYDKl+qoYOtmH61Y2L5OcQFqHr3jtHZzlCxwz7zjGCTh0
	l4ceTjq0nKN8tCgt1cSFO6hY3H1bqPKJVTNNxkdSK3FzUhvbwXBUTM6FHTI3THmrnL97pkzrcQQ
	q5SAYVNEBuvM6bZzvh9f/Eo1CERy+hivE0K7ro2I+CLS+p2lOFtWtN3u3qQeO/T4voPl6wlMPhK
	5uL1rmL5PeLgJLl6iP1EzJrWWI9w/NOFaEmZzK1IbeNpjeybywwvYmeVnWCgzHZ/MCJ8qcnu9xd
	afK1fzn06SMFVUOYcV2UYWCOfBfD
X-Google-Smtp-Source: AGHT+IEbd3n8MU55t3euCitcQQKFs6SunYb2MyFZGehEuglKNg6K9SJXp6KGY3aEsdTFbYirMQvuuA==
X-Received: by 2002:a05:6402:5111:b0:5de:dc08:9cc5 with SMTP id 4fb4d7f45d1cf-5dedc08a138mr487236a12.7.1739470940344;
        Thu, 13 Feb 2025 10:22:20 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:20 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v4 6/7] arm64: Add SOPHGO SOC family Kconfig support
Date: Thu, 13 Feb 2025 19:22:07 +0100
Message-ID: <20250213182210.2098718-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_102223_387336_15B6EF7D 
X-CRM114-Status: UNSURE (   8.57  )
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

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
v3:
v2:
- shortened the help message (mirrored from RiscV ARCH now);
- select ARCH_HAS_RESET_CONTROLLER instead of RESET_CONTROLLER;
- moved CLK_SOPHGO_CV1800 selection into defconfig;

 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..21b6a2bfb45a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.48.1


