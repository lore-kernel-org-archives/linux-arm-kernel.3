Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B08C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZyb0UMcbDIGOtSibbw+mdySBJCf7k9AVSTNZQQyRng=; b=nNFNEyDB3FkIdkHWN2Nf3vj1wK
	GJQUSnmFfHsHbRvWeEPjDwD6N5zq1F32c63Wk2nuGVNDeM9uxwAquVB/KBbQAbx5qPAjaUHpLLrOw
	g+DEE5IcyQem+vZ/KiN94lGvl+g4HjVdk6QNc1sxjl90YXgybcqpT/ymY5zdSbq92P/N4hZlBrsbD
	ESYGCaKHnpaTCZNYz5Vl9tJdLbSurua9cDnETFazRntq21q8V2snonD/MFKHwjH8tKGqSR6Df0tFp
	v9ymsUVI35VFBuLwgkqKiaYR6PG+kORxyzIMbnAkMta4b8ibNzqFATuBzu1pzLYPzIxNXNavSFBbv
	7iVHxjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2VU-00000009Jpr-1Q7B;
	Wed, 02 Jul 2025 18:48:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Mg-00000009IH7-2qIF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:39:27 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-236377f00easo58190165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 11:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1751481566; x=1752086366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZyb0UMcbDIGOtSibbw+mdySBJCf7k9AVSTNZQQyRng=;
        b=D7Oq9gWfArEND4roxM28eF4SMIK2RFw2FyzEFtQ5RvSsx4vr4bFV6NK3AiuhbBEuW9
         PdCiXazqLnWEM5menPU0c/P3uc+ahSUkj0OW6Ur0FR5URs/ibqLW58H0Vxq6yKfJYG2b
         QuPzRSHe9SOP4+I3gcIhukHEUIVbezxndXduAY7xTaeuJWLLxE3kmCGnUOOIe2Y/oggw
         e09LEbEMzbPDRX+OaMyFpsjmzoG4SJMDNlQK28AFKb+6QV9XPAKTJ7QB8OcoGUtILsV6
         H9nCnNqbQdkfUy9uT9q4bStmgUeoY+R9kcbaln/PCrOFPrKAACvF76bXOhkbegQSheMB
         RDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751481566; x=1752086366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZyb0UMcbDIGOtSibbw+mdySBJCf7k9AVSTNZQQyRng=;
        b=UPDKtm39ptT4Hl2VikG67MC1mmLG0sjS+J6SFAJHutodm9IaQN3+FWuVFjX5Uh8IgQ
         MLNQ8d3mNUiG9AxNPPzkBdwq7y8WKfF1v0fl8t/iQg1AGUTswwDkD+BVkVg3aiNQAjhC
         7Pd8SA1oxfqm0/+Nmh2zG8/cOQXWOj6PHscbfvxM6sLN/fX9TGOg9PG9zeyYqEUnFz9d
         LFKK+wz68WPU2BtFTdFfbQTbPKDF2yinicqnPU4XS2wLUqx5xKpTFUpw9Hx5kd/AHhVk
         54TcwqSvMN2eu5izfNRMuQvrPci3nQ+UAEUgbzezyXBC2stTQVQzvmRzbyChZP8NG1Fa
         X+pw==
X-Forwarded-Encrypted: i=1; AJvYcCV4EJaF5BY59p/lDgL33lurA27eok1KgPzb81y9Ia8IAAKu2NkT+VrHYjwRi+3YoLq8HccN8mDmMB6Hgw0Cztor@lists.infradead.org
X-Gm-Message-State: AOJu0YwaXRSxfZgB6X26Hxzq+1OSWbqnwaVyaK/X2yWU8HeDpt/s3gTK
	9mh0ACr+kiAkY1Ai+HhikYYW/Gjrr4blC36yF+ce2nG0CAfHCx/8vbrwmzOnV6p0mT4=
X-Gm-Gg: ASbGnctRiHB4FhD9Si3cBvotfRGvJcUrD+WHL8X86OUPwJ0XCu0qfvTEiZr6ZAfVC8/
	xMw/mRGdewka+RTKLtNjjXvE5XjAkU1EZYh0kt9CYu7xNzT0qS5/oWbH0xvFDyMNGywHiS3tbeF
	hs3cuNh4R+DpTkrAiudh8ggsMXJcfXNaDf5D4hxDlEZCM+Iw1z4Fk5aZlrDFAovTIOoxTnEIUkV
	2xUGo4DGpRatOU+ZFNoX11uF5r06fmYvDWGslAMOlN6KudXmgSxMCX+I/90NcJsBOpRL8KXIqbr
	WTRWwWo06atiBHCwWtFc2MHWO0P475YoTlfyW4ePXE6FW48YvD0fkymQjx0kCPsWvJCJhNlYqFk
	QvUlrUalH78QuGmxg3EPIRP8=
X-Google-Smtp-Source: AGHT+IHRiK65iyeejNhxV2BsQ0zei81m23wsBqj5xXwWoUN5V5PxEC+r38Kfp0CXgbxe6/9g9H5UFg==
X-Received: by 2002:a17:903:46cf:b0:235:eefe:68f4 with SMTP id d9443c01a7336-23c79692071mr5155225ad.29.1751481565983;
        Wed, 02 Jul 2025 11:39:25 -0700 (PDT)
Received: from fedora (cpe-94-253-164-144.zg.cable.xnet.hr. [94.253.164.144])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm143034195ad.80.2025.07.02.11.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:39:25 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@armlinux.org.uk,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v8 02/10] ARM: at91: select ARCH_MICROCHIP
Date: Wed,  2 Jul 2025 20:36:00 +0200
Message-ID: <20250702183856.1727275-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702183856.1727275-1-robert.marko@sartura.hr>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113926_715567_BAAEE1E3 
X-CRM114-Status: GOOD (  11.76  )
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

Like with the ARM64 Microchip platforms, lets add a generic ARCH_MICROCHIP
symbol and select it so that drivers that are reused for multiple product
generation or lines, can just depend on it instead of adding each SoC
symbol as their dependencies.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 arch/arm/mach-at91/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index 04bd91c72521..c5ef27e3cd8f 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
+config ARCH_MICROCHIP
+	bool
+
 menuconfig ARCH_AT91
 	bool "AT91/Microchip SoCs"
 	depends on (CPU_LITTLE_ENDIAN && (ARCH_MULTI_V4T || ARCH_MULTI_V5)) || \
@@ -8,6 +11,7 @@ menuconfig ARCH_AT91
 	select GPIOLIB
 	select PINCTRL
 	select SOC_BUS
+	select ARCH_MICROCHIP
 
 if ARCH_AT91
 config SOC_SAMV7
-- 
2.50.0


