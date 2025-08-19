Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0111CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8rQW6TBzGK1G1eXbPBin0o7LZ+IJINQdyNxTLpbpWdo=; b=4ylUd4JVB6+vAAa0J4dBYSl9LX
	0sBsqOxHHbC73tHLhInXMLhj+P23A1G/CeFt+sikLUOJSfJQH9DAvFoBvcU7rIpCe5zvFIWsPr2Yo
	FcPttBYdeJ9XomUvNi/X1qXgiD0NqQ/9vnvmS41HGmyDoAu79e6dRmrXwMGPCht0upD5bKcXUN12I
	DqOOkRc1piOQVr48O9EL3Swyh93wj+64LhTH+0KtBqZL6e1j2rMedAE+WZhRHDQq3vXV97oYyh1pm
	Hav0A/4b1WK0EfdvnZi2vnYbIYjkF2FBishqrSfVjriU9+bW+7RrleyLVu+7FFqzWdXn4+cvpYyth
	UnXszEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNnC-0000000ApDQ-1C8B;
	Tue, 19 Aug 2025 14:58:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLL3-0000000APnD-1zpK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:21:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so25681755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606076; x=1756210876; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8rQW6TBzGK1G1eXbPBin0o7LZ+IJINQdyNxTLpbpWdo=;
        b=RBwlLmR3ZT8saUa/mBYbFSUTDW+del6H7+mtxpS5evFwMpT9yqeZ/VcR9pEONQKA7a
         F97oNYywgnxDUh0rki/tbcL7sYG/al/mIYqMXHc6CWktRw0G6sl28V+RVgRGbEVBQhdz
         2SeQzzFCXVvzPGyHn+IGWoXj6wp3Xg7BZineE1d3GZMu4GPvKn5c4TwMAcTVM/8wro9L
         /nRaTW54gtLHUsylExeh+hHyuCmY6J97ToQoGTiu/cDS0/I06O/5QVfT7MlTiBq156jA
         qlavMoqU0I1Kd/o0wf5wQRRh8YJ6vYLoltEcYU12WRGCWWc1rXctuH00YsP2Sejh8Vjb
         GM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606076; x=1756210876;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rQW6TBzGK1G1eXbPBin0o7LZ+IJINQdyNxTLpbpWdo=;
        b=pi1xMGww+K+DFTgBOKclBNdHZfNcUcVK8NPr/Wuyz3LDPItj+9vMEAhy56cbFl8BHH
         cygDexF7305z7HGEIJCQgT+9mjj/OZ6/pWf5a+TUcNZ2UOeefq4+S/coP3E2fh3+3ESH
         fyIFQuMxn/csQpFJowKuc2OjTz0mnZ43Eg4RSUcouyXQbWHSxndS+YOHuDiFSP0ez7R1
         BYarifRetQXkl2NbAVGo3NXeIT4qpuJ+aNrcBX2Y3GmhiRmDG4njjEY0oeVHXe18Fvnn
         X/eTvsEFeIdMx9a2++aYlg9OCwNhiadZhxe9fd0hPq7c/BzqPaN8g1l3s+rIufMZJiEW
         p7gg==
X-Forwarded-Encrypted: i=1; AJvYcCXKXVwrohgIFjIfpZvFzWXRsYGrMZGTylSxXuibK2VmsvRUiYIPLMQzBhUHacxCRljdyUhk6hJviDoCzWzgMjb8@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7pTNh9gx5r7AHtf10crBkVqCmvSCgn4apxogctiyDaNTJFc4Z
	ttTNDXUPbqDzqphBTl+wLV830V5mCJQf6xQB8ClQgAwyivBMv9J4NyVUAcG6mifTbYk=
X-Gm-Gg: ASbGncsdESaw5cRdCYhdo8sjxMb+OALXrg0e6kOyLs9DMqd52SlxRMAz3jhEgOeKarZ
	qHcwrxayXbrQpQzajCovwYhdtzACGNCB00ZVQYdI77A1v9DUjhBzAyZf5Rj5A9PQOyXS+t9q9/C
	iOeWdW5gQUPIgUOgaWwOrMj0kdvx9YWAiCPYVQ9ofoer++6IghlawWuUNc9VzMT9bqxxXek9SFS
	EtgzPDeRJA7q8GgGz+PvrR31fJpvAHHGcwwQb1+b2JGfAqBdBGe5UB0yWokuA2/4ilKKktBjvBZ
	mNFjPpBmi23xY6u0PMR2VnOMdfIUvskzI2JHNpSl/udyyx1eLd09bzpETDGnIlaxX0RM+csW1rR
	H8BSCY0Gt6fNLKer0xcgZk77L79v2Jo5n6as3w5QgVN2N0C800m3R35rI7plwgoaWvTZKDcwVL/
	uoAg==
X-Google-Smtp-Source: AGHT+IGUZT2806D2Tn5scfUdkvETMFzU3Pnq507Z4qfJ65eJZCeuTeyx3S8c5HAi/cNBGb4vzb9RdQ==
X-Received: by 2002:a05:6000:18a7:b0:3b8:f318:dc61 with SMTP id ffacd0b85a97d-3c0ec660614mr2020703f8f.40.1755606075840;
        Tue, 19 Aug 2025 05:21:15 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c1636sm3472701f8f.43.2025.08.19.05.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:21:15 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 12:21:13 +0000
Subject: [PATCH] arm64: defconfig: enable Exynos ACPM clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-clk-defconfig-v1-1-70f5963ef90a@linaro.org>
X-B4-Tracking: v=1; b=H4sIADhspGgC/x3MTQqAIBBA4avIrBvQJPq5SrQwHWuoNBQiiO6et
 PwW7z2QKTFlGMQDiS7OHEOBqgTY1YSFkF0x1LJuZKd6NPY80O4bOvI2Bs8LqtlpT1q2bSehhGc
 iz/c/Haf3/QAri9t4ZAAAAA==
X-Change-ID: 20250819-acpm-clk-defconfig-1bd3fe307780
To: krzk@kernel.org, alim.akhtar@samsung.com, 
 linux-samsung-soc@vger.kernel.org
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755606075; l=1140;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0Q9EBNgnuOCskljbtw+Vs3Xg9fPTIle3oM4oVNzAITE=;
 b=1QpGIWzICtt4qBg5AUnoDnZH57zYNvQvtpTetSQcHjxBXDrf0iLiogSx2aqj6oMJ+G0EyagZK
 meoZ0SgJ3xtDnh+qdZB/uqt72AnEDttjSsN7AWiioZIDe9Y/SsHTj8Z
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_052117_526949_1794D7FC 
X-CRM114-Status: GOOD (  10.66  )
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

Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
implement ACPM to provide support for clock configuration, PMIC
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
The patch should go through the Samsung SoC tree.

The driver is proposed at:
https://lore.kernel.org/linux-samsung-soc/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org/
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366cd12ae212a1d107660afe8be6c5ef..4255bc885545fb3bb7e9cf02760cac35bf2872fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1445,6 +1445,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
 CONFIG_SM_VIDEOCC_8450=m
 CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
 CONFIG_CLK_RENESAS_VBATTB=m
+CONFIG_EXYNOS_ACPM_CLK=m
 CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_OMAP=m

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-clk-defconfig-1bd3fe307780

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


