Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C12C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 10:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xHzjbhxUt+ejXXNAyk2MsyAEfsOT4D31xY0flLavyE=; b=uFmRH9kzeSofk5wPnmhIrkLRfI
	mAvgXSAwZDUlQSaNSZOlalhrd/dqGpISN/iq8xkwTtRWiCffRANtsmDCAKFiJX079QB/YbViJ8UFp
	/G0ALmv0V0DoIcXyxBS8AhbPaC4Y9tvL72NeC13sAeDnM75eW2S/GvtkNk+yhtuaFpMK7vwBUL6bd
	+NrzHOv6WfcNsWm11Wl0qvi1O8uqIWcOS19ijgSo6PGkXNKwZqNmvWpJkeyHSIoovEAX4gWWStGiE
	csOoFw/NMw4B9ORVc7B+sBGBBbyqsBxicB7S89MRBJecbK6DeQ3lB3Ik7c963ZNN13wNesSEeC19M
	5R5/7uaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqV0Y-0000000DtCG-0TlR;
	Fri, 07 Mar 2025 10:32:46 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqUxL-0000000DsMh-26Us
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 10:29:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43bcc85ba13so13055195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 02:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741343366; x=1741948166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xHzjbhxUt+ejXXNAyk2MsyAEfsOT4D31xY0flLavyE=;
        b=o5xadmFVH0NOxV5Xlli+iURaHl+SJntLmo2vZemcvfQYp0z/hLW5ASIoFog3b44y3Q
         zbOL3OKOvG5uxQRFbeqjthsh3S6+XlVw/l+BN11tM+MCCgSNMUnTkzo07MCZW8Ny2MBp
         1s0Hgyu3E56GPSJXXdF7e1bal/iGBOSOZSqfC8VFq888zcPPhC/GUtFbC1WR4pNqhqv1
         c5bkto6L7LvtqLyb/AAE6h0huP/I1qf2XOOEfFekMP1KbOMEg44pSIeQWD6jyH9B1WCA
         7AORdk0FjxVNO1NspQhgKy6ENZ/pKScuGx+byWsEjKP+sPaNwhBpvX4wdtX5JABXlbMw
         ctYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741343366; x=1741948166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xHzjbhxUt+ejXXNAyk2MsyAEfsOT4D31xY0flLavyE=;
        b=AbWSZX4CESqSmqgO1wqKZd2QuGQkrgy+owtBzZpaqyX4zLQyfRbSK3CaW2ukHwLswL
         g7Fcu6z281KMJoQnFfhfvi+gOjI/XgA4zKOJqrXS3EJ6OOIe65L7G2fg9TK42HigMEup
         65B86ocgp+YuVUGseRkUiJzt/wUOA4zGHKn8mwc1rhPWqulcaeqKHTEpvAlVv65LqkKJ
         7MNKgactQ5LAoUPSKwN5wBJMZQ+LR1sayE4nMnQCQMm1d2euKc0Qe65hiSo/VLNvEysd
         8fb36PjazCQinHZjMC1gqjLHDX4zSy2sHC7yVDWYmnQLHFkqG7U3MT/zH0qa+YCsQwSL
         B69Q==
X-Gm-Message-State: AOJu0Yyx5/eWtFK0NNdu4vsesFSRET+kAJHCmkY1iCUK7C/ZLUuNtx6y
	Ao5H+1qzS7RUj0pMGPF68KlziFC96oDDmLt6pw4r9OPaj5T9O9hMzeJFeILTePE=
X-Gm-Gg: ASbGncvILIGMSvejfI9HC/1t2GERvB+EJxVdNoVx6sTLw8NTd1Dy/xYVtVMkijJ1L2i
	s07KVAR4G5Ho4GzavkApNe1fZ+J7ZT+R0uOGF+B8Ze49Pb/DAkx19jV2r916mEtXmxcWW5nPKEJ
	0BNnty+lSM5E71RTFu3ckBn2VMya8z+xHrTz+6fsPY4tr1aPJ0j/7nt9RLzxXTLXzzed5YgLuTs
	744nYHCJ2JkIG7BxvI9m5PxLbyyLmEv0IGfvE6vHWJ0aKUBX0bhcZtPqoN2jm+bVjEXIJK6GGto
	ZQvYlfBwp8oVNoSfAOHSIDpfOAewhwClNWTckrTZsVUel2o5r+Kt60VSLV9kMtstPatmXaApqrs
	=
X-Google-Smtp-Source: AGHT+IEdrRaT3XD+1oklvg/JlOcr86S5WA2vZM0/xp0SCkAFq70x8DSaNOHjhsJq85Fq8JQoP9uxVA==
X-Received: by 2002:a05:600c:1907:b0:439:8e3d:fb58 with SMTP id 5b1f17b1804b1-43c5a5fe368mr24280095e9.11.1741343365786;
        Fri, 07 Mar 2025 02:29:25 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0461sm49192955e9.4.2025.03.07.02.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 02:29:25 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 07 Mar 2025 10:29:05 +0000
Subject: [PATCH v4 1/4] pinctrl: samsung: add support for
 eint_fltcon_offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250307-pinctrl-fltcon-suspend-v4-1-2d775e486036@linaro.org>
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
In-Reply-To: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, kernel-team@android.com, 
 jaewon02.kim@samsung.com, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11226;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=gHaTPoGguUaCyPpPK7WmS93V+YbLGip8t6Q7NjDiqkU=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBnysp+YlwWO4ZMpW4A5rUnQ2AEy5Y9jX1xwUS4r
 IhypW+oH5KJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ8rKfgAKCRDO6LjWAjRy
 upNxEAChnq5HV1vg0whcQZUwuU/i/TRKn/G6rSFVAFC0b8TcEZhrFDEKOkJKDDZc5zCgK/47tJq
 jzpeqbsdDtOMKA38aoYFzoikCMZu26Ez0N4G6Bk3nT+SEbz/b+Is+c+AxJ81MEHPnc2XcAMDNZm
 t3Xtx2B1C63SnEyfxk8Rt0+l8lrK7cWHUJe4bbWRsCTsZOBmisCeH8LfrOFFOzqVbEFVdaz1xFJ
 IoefGrXdqahOOGcx2DYg7nyCRbPUeKd7+xwWNpB85sJ87jqmLZnaGrUbu8Ir0yrqhLHgiPGHv38
 eAjJzoMf60Oez+YigsB3+i6TAlJbMtFkrE+uTC3xqIuVMyaK44poyPO0If/+Rqo4WhV7q6gMt3+
 ySGCng3Nx+85lm2RO7CUbOpworrPvNSLP1Q96yDVqpY5u3AHDD/WHagJRUNkYTqK2G6bm4PIrLJ
 bD5mBRW+7agf1n60rnXHvg6cnpXX4UN9m+7mdKHrqVHTFSSwZD+j9rUSfhSvKXyANYRLgD/vnyH
 uzyV3bgUOMx2BXxqQQ7nj9Lyebr0CuXQlpl50xLM1gxm39VcaStMYhBIVMkTa7Oi1qI/6At8Kml
 XvqRhIiNz4YsYZctCNkhj8k/WjUVSrypIGpWA3UF7rY2+a1j1CAMgMCP4ix4Uuu7cKZg86pEFO8
 jiwZosi/7/5ZKPg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_022927_535071_13D15659 
X-CRM114-Status: GOOD (  14.40  )
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

On gs101 SoC the fltcon0 (filter configuration 0) offset
isn't at a fixed offset like previous SoCs as the fltcon1
register only exists when there are more than 4 pins in the
bank.

Add a eint_fltcon_offset and new GS101_PIN_BANK_EINT*
macros that take an additional fltcon_offs variable.

This can then be used in suspend/resume callbacks to
save and restore the fltcon0 and fltcon1 registers.

Fixes: 4a8be01a1a7a ("pinctrl: samsung: Add gs101 SoC pinctrl configuration")
Cc: stable@vger.kernel.org
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c | 98 +++++++++++++-------------
 drivers/pinctrl/samsung/pinctrl-exynos.h       | 22 ++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  1 +
 drivers/pinctrl/samsung/pinctrl-samsung.h      |  4 ++
 4 files changed, 76 insertions(+), 49 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
index 3ea7106ce5eae3c21f11790b5a40037042c1d407..e28fe81776466b693417c66bb15752d609b79eb1 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos-arm64.c
@@ -1370,83 +1370,83 @@ const struct samsung_pinctrl_of_match_data fsd_of_data __initconst = {
 
 /* pin banks of gs101 pin-controller (ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_alive[] = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10),
-	EXYNOS850_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14),
-	EXYNOS850_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18),
-	EXYNOS850_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c),
+	GS101_PIN_BANK_EINTW(8, 0x0, "gpa0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(7, 0x20, "gpa1", 0x04, 0x08),
+	GS101_PIN_BANK_EINTW(5, 0x40, "gpa2", 0x08, 0x10),
+	GS101_PIN_BANK_EINTW(4, 0x60, "gpa3", 0x0c, 0x18),
+	GS101_PIN_BANK_EINTW(4, 0x80, "gpa4", 0x10, 0x1c),
+	GS101_PIN_BANK_EINTW(7, 0xa0, "gpa5", 0x14, 0x20),
+	GS101_PIN_BANK_EINTW(8, 0xc0, "gpa9", 0x18, 0x28),
+	GS101_PIN_BANK_EINTW(2, 0xe0, "gpa10", 0x1c, 0x30),
 };
 
 /* pin banks of gs101 pin-controller (FAR_ALIVE) */
 static const struct samsung_pin_bank_data gs101_pin_far_alive[] = {
-	EXYNOS850_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00),
-	EXYNOS850_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04),
-	EXYNOS850_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08),
-	EXYNOS850_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c),
+	GS101_PIN_BANK_EINTW(8, 0x0, "gpa6", 0x00, 0x00),
+	GS101_PIN_BANK_EINTW(4, 0x20, "gpa7", 0x04, 0x08),
+	GS101_PIN_BANK_EINTW(8, 0x40, "gpa8", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTW(2, 0x60, "gpa11", 0x0c, 0x14),
 };
 
 /* pin banks of gs101 pin-controller (GSACORE) */
 static const struct samsung_pin_bank_data gs101_pin_gsacore[] = {
-	EXYNOS850_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08),
+	GS101_PIN_BANK_EINTG(2, 0x0, "gps0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(8, 0x20, "gps1", 0x04, 0x04),
+	GS101_PIN_BANK_EINTG(3, 0x40, "gps2", 0x08, 0x0c),
 };
 
 /* pin banks of gs101 pin-controller (GSACTRL) */
 static const struct samsung_pin_bank_data gs101_pin_gsactrl[] = {
-	EXYNOS850_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00),
+	GS101_PIN_BANK_EINTW(6, 0x0, "gps3", 0x00, 0x00),
 };
 
 /* pin banks of gs101 pin-controller (PERIC0) */
 static const struct samsung_pin_bank_data gs101_pin_peric0[] = {
-	EXYNOS850_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c),
+	GS101_PIN_BANK_EINTG(5, 0x0, "gpp0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(4, 0x20, "gpp1", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(4, 0x40, "gpp2", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTG(2, 0x60, "gpp3", 0x0c, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x80, "gpp4", 0x10, 0x14),
+	GS101_PIN_BANK_EINTG(2, 0xa0, "gpp5", 0x14, 0x18),
+	GS101_PIN_BANK_EINTG(4, 0xc0, "gpp6", 0x18, 0x1c),
+	GS101_PIN_BANK_EINTG(2, 0xe0, "gpp7", 0x1c, 0x20),
+	GS101_PIN_BANK_EINTG(4, 0x100, "gpp8", 0x20, 0x24),
+	GS101_PIN_BANK_EINTG(2, 0x120, "gpp9", 0x24, 0x28),
+	GS101_PIN_BANK_EINTG(4, 0x140, "gpp10", 0x28, 0x2c),
+	GS101_PIN_BANK_EINTG(2, 0x160, "gpp11", 0x2c, 0x30),
+	GS101_PIN_BANK_EINTG(4, 0x180, "gpp12", 0x30, 0x34),
+	GS101_PIN_BANK_EINTG(2, 0x1a0, "gpp13", 0x34, 0x38),
+	GS101_PIN_BANK_EINTG(4, 0x1c0, "gpp14", 0x38, 0x3c),
+	GS101_PIN_BANK_EINTG(2, 0x1e0, "gpp15", 0x3c, 0x40),
+	GS101_PIN_BANK_EINTG(4, 0x200, "gpp16", 0x40, 0x44),
+	GS101_PIN_BANK_EINTG(2, 0x220, "gpp17", 0x44, 0x48),
+	GS101_PIN_BANK_EINTG(4, 0x240, "gpp18", 0x48, 0x4c),
+	GS101_PIN_BANK_EINTG(4, 0x260, "gpp19", 0x4c, 0x50),
 };
 
 /* pin banks of gs101 pin-controller (PERIC1) */
 static const struct samsung_pin_bank_data gs101_pin_peric1[] = {
-	EXYNOS850_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08),
-	EXYNOS850_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c),
-	EXYNOS850_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14),
-	EXYNOS850_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18),
-	EXYNOS850_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c),
+	GS101_PIN_BANK_EINTG(8, 0x0, "gpp20", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(4, 0x20, "gpp21", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(2, 0x40, "gpp22", 0x08, 0x0c),
+	GS101_PIN_BANK_EINTG(8, 0x60, "gpp23", 0x0c, 0x10),
+	GS101_PIN_BANK_EINTG(4, 0x80, "gpp24", 0x10, 0x18),
+	GS101_PIN_BANK_EINTG(4, 0xa0, "gpp25", 0x14, 0x1c),
+	GS101_PIN_BANK_EINTG(5, 0xc0, "gpp26", 0x18, 0x20),
+	GS101_PIN_BANK_EINTG(4, 0xe0, "gpp27", 0x1c, 0x28),
 };
 
 /* pin banks of gs101 pin-controller (HSI1) */
 static const struct samsung_pin_bank_data gs101_pin_hsi1[] = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04),
+	GS101_PIN_BANK_EINTG(6, 0x0, "gph0", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(7, 0x20, "gph1", 0x04, 0x08),
 };
 
 /* pin banks of gs101 pin-controller (HSI2) */
 static const struct samsung_pin_bank_data gs101_pin_hsi2[] = {
-	EXYNOS850_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00),
-	EXYNOS850_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04),
-	EXYNOS850_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08),
+	GS101_PIN_BANK_EINTG(6, 0x0, "gph2", 0x00, 0x00),
+	GS101_PIN_BANK_EINTG(2, 0x20, "gph3", 0x04, 0x08),
+	GS101_PIN_BANK_EINTG(6, 0x40, "gph4", 0x08, 0x0c),
 };
 
 static const struct samsung_pin_ctrl gs101_pin_ctrl[] __initconst = {
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.h b/drivers/pinctrl/samsung/pinctrl-exynos.h
index 7b7ff7ffeb56bdde2504ec90c8df13bdd1ace70e..33df21d5c9d61e852834031570d4a0ac0e51f6a4 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.h
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.h
@@ -175,6 +175,28 @@
 		.name			= id				\
 	}
 
+#define GS101_PIN_BANK_EINTG(pins, reg, id, offs, fltcon_offs) \
+	{							\
+		.type			= &exynos850_bank_type_off,	\
+		.pctl_offset		= reg,			\
+		.nr_pins		= pins,			\
+		.eint_type		= EINT_TYPE_GPIO,	\
+		.eint_offset		= offs,			\
+		.eint_fltcon_offset	= fltcon_offs,		\
+		.name			= id			\
+	}
+
+#define GS101_PIN_BANK_EINTW(pins, reg, id, offs, fltcon_offs) \
+	{								\
+		.type			= &exynos850_bank_type_alive,	\
+		.pctl_offset		= reg,				\
+		.nr_pins		= pins,				\
+		.eint_type		= EINT_TYPE_WKUP,		\
+		.eint_offset		= offs,				\
+		.eint_fltcon_offset	= fltcon_offs,			\
+		.name			= id				\
+	}
+
 /**
  * struct exynos_weint_data: irq specific data for all the wakeup interrupts
  * generated by the external wakeup interrupt controller.
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index cfced7afd4ca6e99c7e72a588d780f0542990ed9..963060920301ec90affb2ee6d758d3d602ffb4a9 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -1230,6 +1230,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		bank->eint_con_offset = bdata->eint_con_offset;
 		bank->eint_mask_offset = bdata->eint_mask_offset;
 		bank->eint_pend_offset = bdata->eint_pend_offset;
+		bank->eint_fltcon_offset = bdata->eint_fltcon_offset;
 		bank->name = bdata->name;
 
 		raw_spin_lock_init(&bank->slock);
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index bb0689d52ea0b4392714fa9bcdcbae8d253c73a1..371e4f02bbfb375964b7833beb9bbc098a51f4a3 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -144,6 +144,7 @@ struct samsung_pin_bank_type {
  * @eint_con_offset: ExynosAuto SoC-specific EINT control register offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
+ * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  */
 struct samsung_pin_bank_data {
@@ -158,6 +159,7 @@ struct samsung_pin_bank_data {
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
+	u32		eint_fltcon_offset;
 	const char	*name;
 };
 
@@ -175,6 +177,7 @@ struct samsung_pin_bank_data {
  * @eint_con_offset: ExynosAuto SoC-specific EINT register or interrupt offset of bank.
  * @eint_mask_offset: ExynosAuto SoC-specific EINT mask register offset of bank.
  * @eint_pend_offset: ExynosAuto SoC-specific EINT pend register offset of bank.
+ * @eint_fltcon_offset: GS101 SoC-specific EINT filter config register offset.
  * @name: name to be prefixed for each pin in this pin bank.
  * @id: id of the bank, propagated to the pin range.
  * @pin_base: starting pin number of the bank.
@@ -201,6 +204,7 @@ struct samsung_pin_bank {
 	u32		eint_con_offset;
 	u32		eint_mask_offset;
 	u32		eint_pend_offset;
+	u32		eint_fltcon_offset;
 	const char	*name;
 	u32		id;
 

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


