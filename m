Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F6AC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 19:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csnV4M7t8mG+4gzOzlbb+RIrtUw1t0+Fx7m4dlnVHBE=; b=Y1IzOtlB7CA5mVO2GYuRBwhR9g
	0mdsoIlP8Cj7CDxVME+WzeV4WpA882aYCe8yAdVBNwR6jk4OV/69Ezm78E5nEY9+5K3ls2YQF48Br
	LEHjW8y1o8OZSlAFvCKOXM+z7resi+Ptbbloty16MGGemICy4PlsRs5yI7ZvX8H+ComFCnlSAR2JT
	4BMx70kONj18HcQfE1BqhIwRd2uaEqvhGqBh3stjJMt1VroWwAX/La/mmfQuMWrjm0Kwn8XMn+aXy
	LJbf4tjVywU9j/v8DS1GmZUN5XC2H0GZ4gAZ5oW5O9VckeVsBj9R37byvwreYi5bMp7VEmPDug8d5
	Q2KScLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trMA7-000000012kt-0v63;
	Sun, 09 Mar 2025 19:18:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLop-0000000111H-3HD9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 18:56:13 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ce5cd91e5so1455015e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 11:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546570; x=1742151370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csnV4M7t8mG+4gzOzlbb+RIrtUw1t0+Fx7m4dlnVHBE=;
        b=ISc+e1IgnrXen0rKK39u58FkSws5X6s9CrcWZzKysLGLDCNgwtCD6+GNYQmmNLgMw1
         mVOq8WZ9KKd5s5tROA5NMy/TGYEerzpz/AMEWUJG+E8oj7ppZBlz0snMhlPMfjqq/rFN
         TqP7m0rnvvDiEGe4Dmc71tpczF37xt2LQwJXYNtKQ9Uizp87ghz7IIoy12vwFD6n9ImZ
         2RsxndfjLJmcTiu136RjV5q2xo2ItWIvYUfuvEu9+JHUaG+FbNWNQkp6ceI3oO16FwTG
         ALFyZ25Fu7XW40VIefP5RRL2d9mbk+3YUL0P7nWgZAPWjI+oGRwfHzn7DFFONayCk4rJ
         TLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546570; x=1742151370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csnV4M7t8mG+4gzOzlbb+RIrtUw1t0+Fx7m4dlnVHBE=;
        b=UUxsSmc9WvFiZ/kWxZshhEh/gQMNQm1nfJbVFrSaf9EW3DBerhpYW6lq8oFUbwFGp5
         AyQHqmboFmce0i7HVOODdTHhv8Gs1Wg0wMVPWrALEAwN/SAZvAhRW1fdeXQXVs3PsLqL
         f8/Ts69yxEOiERpjOn9+pgRRX7gZT0jp+Avm/aPYhBDg6rnM9Qi+0RWf+g/tF2t3S8gm
         JFl6uSY/Uj0PYCDgdHgjJ+0Xu9kVG6wQYQAkh+G9ROGxR1nM3gmzS2rvgTSr4NhAnSeA
         V6cNxMyPtgLkG0B27yTBZS11FvdP0M0P6nG+VT/5gVAGA0zUH+eNr/2Z3vQCZ/eKwAdr
         lzaA==
X-Forwarded-Encrypted: i=1; AJvYcCUM64fYMC/7uXZEsVDCI5ky40EEF2rfEPlsPg/Jix05NsKMoqOLfXxQUP68aCPajMRBCrC7sJFv1TqnQuLUsaWa@lists.infradead.org
X-Gm-Message-State: AOJu0YwnEVpp4RraEnGqzHR9Bkn8HoHAnQqGyWxMCWiwRUzA9hmbl+0F
	TfbTqj+theEaCrj323IP6TUqQk4G1Uy7TAhqyrM0QR0pawgaB/rPCvvvYVM49SU=
X-Gm-Gg: ASbGncvebrjDu2MPHUKLZYTdkRM3yCAsFsqStJ7zyCF8kpgUXuBkKxZ2nblNVvnIScM
	BkV2elm4TAlNTsrP9+AIJsS/PLJAF8x27DoHAWGZSlto49Akd97RaNwEciRslf50JHvOOtC5K4z
	rteWdcOcpLaZXEd0PRFZAmxFOqBU2MYmJf86bUUE/ZT1qYtEt/OorFDpZal3Muqu6AfqAulvEsr
	IlccTAJpGcthwM3rOqHDVDEpIeDM+aGeTUCVATdsb+E4StRJdKxQPrevRn+gHt9v7uMZYXxRSHI
	Vboha2eWIGvDkqD+CTPREInK9TvMSdgkdmiP29KNGYd8hen6kZ4pXr/ezNM=
X-Google-Smtp-Source: AGHT+IHOjQZl6au5AX9pwx89qj1PiY9uUWPbWjZhcAqE7l92MV4Sd5wk3pnxNKw3T6EVY3vWBvszTg==
X-Received: by 2002:a05:600c:3588:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-43ce6b12816mr15245875e9.2.1741546570242;
        Sun, 09 Mar 2025 11:56:10 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] ARM: samsung: soc/drivers for v6.15
Date: Sun,  9 Mar 2025 19:55:57 +0100
Message-ID: <20250309185601.10616-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_115611_821769_6F15EEF2 
X-CRM114-Status: UNSURE (   8.81  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.15

for you to fetch changes up to c8222ef6cf29dd7cad21643228f96535cc02b327:

  soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe() (2025-02-15 14:37:19 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v6.15

1. S3C: Drop linux/fb.h header.
2. Exynos ChipID: Check if memory allocation succeeded.

----------------------------------------------------------------
Chenyuan Yang (1):
      soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe()

Thomas Zimmermann (1):
      ARM: s3c: Do not include <linux/fb.h>

 arch/arm/mach-s3c/devs.c                   | 1 -
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c | 1 -
 drivers/soc/samsung/exynos-chipid.c        | 2 ++
 3 files changed, 2 insertions(+), 2 deletions(-)

