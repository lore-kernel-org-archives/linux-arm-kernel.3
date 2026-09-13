Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F879C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=olNBNDsUgs4Oen6UYhKmbkEp8czeJg52l/oC6o3L080=; b=0hsNwwmSVJLOxkTbTgW9m1pE7V
	n2X5uNV5v/VJWIYMI0NZ5aPQlo7jW46GqYz9lIevbgS/6CtkPwUkyQn3bY5sZCy1WvNXvkHo0Z6YW
	EhzKerqXInMFRqzUAxVjIQo2vaML0njfoQJalBA92d2bK4RuMff3lBpHWb6CinGhOscS8o6HIvCtF
	QhPMwyAP5p19Lr4L30bOtAOi7fejLqdW15NFZ2i3USu1Ee/6/UaQXvqHtHyCQS1z8KCfxdrYuADEp
	Y4w582ZZuGb1XwuVQa3hrjAM2U9pxL4GF+jZq+Rpa9ytil3WmZmxAIB+EmDhCI+T35yeSecdHzyRY
	OukJt4mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Z7V-00000001J5m-3tvn;
	Sun, 13 Sep 2026 01:35:01 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Z7T-00000001J57-1fUz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 01:35:00 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfc9b6e4so13909446d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 18:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789263298; x=1789868098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=olNBNDsUgs4Oen6UYhKmbkEp8czeJg52l/oC6o3L080=;
        b=f2VsrYzW5V8zPfalFJ4ZqMAeNyEmP4nDJ+TN5Fi1a0IIy9mRJ9cjH3PWyAWPfKbfUh
         6OIuN8seY/1Nh4XXBI0I2Fdd3U2/DMVaJMxxmbyrDJ8fksb0gRgx5T4tYLYYmT0fbdvn
         1/hoUgf5T2I3fEK7WaJRuIctoNwAgBYtMRnYqu1rur94ZM07mQOSbjvNKog3ii/sdsnd
         Q+Ogz9sMk6uljnkSOWxQWgEV6v0INdC+/iEH+wRZPz7+YoiYfZ4crIXn1rXhf6eMQ/Gp
         cIO2snAEoIGwz4J3zkIR7JAxr+ZJfxEKDlQ1wy4azjJB1ojUthRkcvRNac2OVaDsV2Cn
         RFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789263298; x=1789868098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olNBNDsUgs4Oen6UYhKmbkEp8czeJg52l/oC6o3L080=;
        b=AN67d/F0Ts4VpcqTatbD7XfrSK5M4/cLz5+GjuVJz3X4SdRbxSVAs7unvQdBhdu4uC
         5wcjN7j7KeT4zEdn8iWqYxCJ/uzCYKUOsQWaVxa4TJOSEHxTg1F25oIxlZBoxq0HirSL
         56sjZRQmUASafx+twRjCgDiMdU1aaqJ14B9ZzgzteI0kUigC3UfG36tB3wAzR/ddDF5L
         kvudSoSO86RNAjwscYFZy7abebnj/KRgtnwkN1ThD3qQhAOUlUlZZOjqe3+/F0oNE0ud
         JFkvw0ATFOtedkXF4Od8nIBiIFPJwWHo5EQqykO4NVBBFuke0nIZptlxP6YyZS7df4kw
         Cquw==
X-Forwarded-Encrypted: i=1; AKwUvBwq3v49U5sqoZvcDbVi2P/2udNWBDWN77aRzyC3f8f39/eOun3sqb0IzcBItatXTQeuZwHXny7Hsg2/UtUewVCU@lists.infradead.org
X-Gm-Message-State: AFuF++mVCPWR1XC/SXvriQ0hlEaJ1NaAmZoqjg8wmPVAyXP9Jim0SviC
	D6fgPgHXbYxQlcDTBZAYHVYHkER0UibDDTun9lW67aSWt+XPPdgy3Hc=
X-Gm-Gg: AYBFou0PgPVxZCSBuDXvNzoXS+6T4GMpVmm0V7Br7a8Ddk3fn5doIpvsLx28e6WI+GP
	dwjHDt1A+BY+xpyFzwKKrnH+SZmYHS9EUFciqQb4Opy+SQmoO+ORwSPKCfEtZIPtA4ZdLYk3/1T
	uJurTyqimWY613F0suOJ5bQ2oUZhpevGMZaAp42+2x8bte3xM3JYdtg4lWsRMYxhYI7gA2VaIrC
	2I0jERaC0GNTfN57/QL6dt7G4ALWyqoSZ5AUpCNnGZRI1mi2GvtwfFX0uHX/NNNOSRwrzST1KsL
	2VqjDGGcJTXqcbUCeJh7DeX99cOnCs27zxyhIliPxWQIXIS6iltaWrXXJ+LYJ34ehOHzbjko+sG
	5aNH4t3rm8vOJR+miA4UFL6NxFjFse4kXkBM4rb5sTclWClPIXpv/Cpun4GF5Ozumha0u+Va1wc
	AI3F8Kmih61nGur+E2hgT9nXRet5+m+4LJFS++YusIuQBDbtt3MS7jPXJqlq0h1FIa5S64704gT
	bwI8LPzjGu5bM8FZEHq6kAfeGDJIMQ6OChlqId81DiIfD+9OZ1rTlgsFlIAyiWsx/4+DyZDDQRB
	suRgZ5sa1NiHddRbGRSUGTC6ncuweso4RA==
X-Received: by 2002:a05:6214:1315:b0:90e:9a7c:e5a0 with SMTP id 6a1803df08f44-912120f0444mr161688246d6.17.1789263297899;
        Sat, 12 Sep 2026 18:34:57 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4920c5sm58866936d6.32.2026.09.12.18.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 18:34:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] drm/exynos: fimc: disable LCLK during cleanup
Date: Sat, 12 Sep 2026 21:34:50 -0400
Message-ID: <20260913013450.20786-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_183459_468482_258C0AB6 
X-CRM114-Status: GOOD (  12.38  )
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

fimc_setup_clocks() prepares and enables FIMC_CLK_LCLK after acquiring
the clocks.  The later component_add() failure path and normal remove path
only put the clock references, leaving LCLK prepared and enabled.

The runtime PM callbacks manage only FIMC_CLK_GATE, and component bind and
unbind do not change LCLK ownership.  Disable LCLK at the cleanup sites
that are reached only after fimc_setup_clocks() succeeds.  Keep the setup
failure path unchanged because it can put the clocks before LCLK has been
enabled.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: e5f8683923af ("drm/exynos: rework fimc clocks handling")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 09e33a26c..58214abb5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1362,6 +1362,7 @@ static int fimc_probe(struct platform_device *pdev)
 err_pm_dis:
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
+	clk_disable_unprepare(ctx->clocks[FIMC_CLK_LCLK]);
 	fimc_put_clocks(ctx);
 
 	return ret;
@@ -1376,6 +1377,7 @@ static void fimc_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 
+	clk_disable_unprepare(ctx->clocks[FIMC_CLK_LCLK]);
 	fimc_put_clocks(ctx);
 }
 
-- 
2.47.1


