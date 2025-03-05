Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C16C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weIz0p5jrCdaKeONdMwrGg3d94qwCCT6MyDjUrDLWLg=; b=hhBgj1hDCxQFY/X04zzVk71ifB
	K20dEpZYI5vtG8T6uU5kdqu8edeIz08WiC1eLVgE/rKAnunDeIk3Vf9VdrwcR/CSw5alDpmss/B5X
	Nn4HfJsq9HmtZuPLaKfXxv8/b+SPbzHtKmadejF2OuVTOvHKbtgMcVPdgeFthDHwYkkttqMTkzSi+
	wg5CEpddviUXppjkGm+lE+4uhAgiwrSXF4I7wPGWdVKVQjdMe2DY9fAZ0/QSbDNdClfyl1vuGMIvC
	+bP8u0C1eBcH34MAh1EBe5mbTw8dr4LiGglnOfqHN64pDF1Hben/LX/Le65AzBLDTGtUbkZENLsqe
	nTxr4gBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwlt-00000009QTW-48EV;
	Wed, 05 Mar 2025 21:59:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpwXK-00000009OTa-1C8H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 21:44:19 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43bc2f816daso4747145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 13:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741211057; x=1741815857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weIz0p5jrCdaKeONdMwrGg3d94qwCCT6MyDjUrDLWLg=;
        b=QefHFiSeVOFXMbur8wYzn5VGw5oplxC8mw0feDH9KBgWv8ov6E9RV3lduMQOB/M+GO
         kpbC0zn4oai+IyHmojs9XoxirXc2CSFStkIbuh3k3SV/67YvGLttyQljIRYLjJxCiUQr
         acqyU69J1X74ACGmMYaKeyVIDxMoOFqqd6yMGo2WUa5VART8ZvMfP1bwc2EN9n8PBnpx
         RZHXSoJ1zO4Ozh3PnqjR3y8V4ERKygXt/kHauMYPc3cslQK6DyR3oIn9shqszqHMArG6
         HAivCgdvzLedHg/27CFq4FtaEna+iVnaud7LM+zLithtj9jDILncUeQbTJiClpVGj8vl
         EERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741211057; x=1741815857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weIz0p5jrCdaKeONdMwrGg3d94qwCCT6MyDjUrDLWLg=;
        b=fwS/MWimRGD3/9LiHG7kJToF9UYBX4Kt70d4b12d8XbMZI03eV1JmjunPIP7XOYybT
         Q6G5TyRxnbqoSJnWZCG8VQOHx+c0e5f/9PR7T5bQg98qBsid7HBiSKV5HZryArNJNk4M
         bqAEAtYmoxjG3cv/3VH/c0P2UQJQuQ7V8o4PApZX9cIBfekTEtqU5WvL9h0G5uJIY0Y3
         rXCSN+7OLSQ/M8OkDDNcZtJLDK4T689Fyy2w1h28t1FkNEqiM2297KXuOHEvsATKop/R
         mbfd95dbyygMK+31RnbI8YlUGKurb1PXyzi7Lq83NN52sylJ4ASSx4wRLhNWi4UO5k4H
         1UNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5LG19kP9+Xm1O0Eu6I50ct60VeW5E/1shU79ny7pKoX/+ZrxLHeArs7qIigrkLRQYRmA/Dx+bLSyia7bm34wm@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi+HFamJOlwIAZef1l7xzzb7t1oYZDrKitJlGFSbREqa/jLe7a
	VR0W1a5iPXzs+STbPR+Y31wenhOs9QA17YFy8iaWXQxsL+xWD5dYeBwVH+1FjUI=
X-Gm-Gg: ASbGncsyOn8QpY5ohpShow1s6Ui1B4puuC0UtRPoqgvjJyq3GL7QRzsEIfp9Z167Ftr
	HWnNC24lbFBQAo8X5JQK30qc8oSBE+UCNY1grgW1jEJaRerrnaHhR1rtXcamYvyMhrNW7ftzT9q
	+rsm58Pqm6wxRvIErP6FOqWvi6tI9M5bjFkYa02kger9q1yICpzyyY06BqraJH5QkeXUYB+d2i6
	GGusz/O5lrlEIDSdcBMFT2ccTlYIsqaR+jhjqQACuNZeKzX/Bnu7udql/LXgfnI89HILw80P2kc
	lGFLNT2BvJKkJYp+kEO6ecqodWyEFtPjENA3OW5xKwr3VHZ1toU/WZJXX9bs
X-Google-Smtp-Source: AGHT+IHzTHEi4RbcepK9Yi88OMMJOyQSc2Vs3UcMYys5tDiO75wg191jKhku583H3Fo6aA44hjeQvA==
X-Received: by 2002:a5d:59a4:0:b0:390:d8ec:1779 with SMTP id ffacd0b85a97d-3911f7bedf1mr1720900f8f.12.1741211056782;
        Wed, 05 Mar 2025 13:44:16 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4796517sm21954802f8f.5.2025.03.05.13.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 13:44:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 05 Mar 2025 22:43:40 +0100
Subject: [PATCH RFC/RFT 05/12] clk: samsung: exynos7885: Use
 platform_driver_probe() to avoid __refdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-clk-samsung-ref-init-data-v1-5-a4e03a019306@linaro.org>
References: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
In-Reply-To: <20250305-clk-samsung-ref-init-data-v1-0-a4e03a019306@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=goqEBEfGLkYI7CK/Up0YmDXR6yArgVZhMirUQAcStHs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnyMWal1CQ7L59HDIdagnCzWwL6nM8gmaipgio2
 xYB0wmW6dyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8jFmgAKCRDBN2bmhouD
 13xvD/9hPWetnDaQhNDUBZwVHb1/nwXHFTdF5ofFd0rLeE/ZYgKAJfCgOgkbFZ49TGIvmzhfCY/
 Xo9pDCmDDEljIerAW+MotryTo6HIfA0d2gdsEM+tnDR5bf6hwYO5kJgyGJAg2hOBlOEstli5pbE
 xIc3Y7ptAdcVfizZkO9giRiOsNwMEnkpQ/CiIb/ld/c9Oj9yDOl+d/dgTbEG/y4qp1GGbpSLnWm
 Af11Px3FS2m/VB3Qv1J5zcUCWLILUKyqWiLm3LORFRfy7xTnGg2lLmvm+7Da0tPk3/HiSH5tXvP
 0mH0hlYdLe0swii+M+tLGFRNuWg5V/qPVoyIJqt5f3UM23aA/Z2xbxRKoA1wUU70ThRDL3IXuKX
 erm1WN22mi5Ej7KL9z9VVPiIWCopNAvzukn5YcojNuucWM87Hkx3UOCjVPA1eAWNVRVskUonYLp
 NE/PIoPn1tFViH0ZMjyozbmxu3uy3HI4axmIveMO2FZ0pbBW6EzjNNO+eVYlhmDLf+S6ITXuIhx
 jQyCuVbrFQ8ihFM+8AamT2G22ZWmtrnZq4K2JmLYVirnt5j/Hr/F306sZFKpXisYTiiqBLEkWkm
 G/1KPU4jDS5Gf+a+vbOXAZxSwsOYVYvGJxwgZxeNUNlCSoFG/XznBGeNNnTIAhp325njf+kaCs+
 hyJ7HeFfhTl+utQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_134418_327206_FD445441 
X-CRM114-Status: GOOD (  14.44  )
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

Switch registering platform driver to platform_driver_probe(), so the
'struct platform_driver' can be properly discarded after init and there
won't be need of __refdata to silence DEBUG_SECTION_MISMATCH.

The change requires using subsys_initcall instead of core_initcall,
because no device drivers would bound in the latter, as required by
platform_driver_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos7885.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index fc42251731edb6f8368d38638179056f8bc58335..0066c89e3515b852c7c6265322f8a1dc07af57ad 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -832,17 +832,16 @@ static const struct of_device_id exynos7885_cmu_of_match[] = {
 	},
 };
 
-static struct platform_driver exynos7885_cmu_driver __refdata = {
+static struct platform_driver exynos7885_cmu_driver __initdata = {
 	.driver	= {
 		.name = "exynos7885-cmu",
 		.of_match_table = exynos7885_cmu_of_match,
 		.suppress_bind_attrs = true,
 	},
-	.probe = exynos7885_cmu_probe,
 };
 
 static int __init exynos7885_cmu_init(void)
 {
-	return platform_driver_register(&exynos7885_cmu_driver);
+	return platform_driver_probe(&exynos7885_cmu_driver, exynos7885_cmu_probe);
 }
-core_initcall(exynos7885_cmu_init);
+subsys_initcall(exynos7885_cmu_init);

-- 
2.43.0


