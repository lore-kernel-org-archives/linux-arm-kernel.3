Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9861F606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lmcwe/qL;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=q5tUHx3Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XK7qHQy7h7fEOAcUVe+GZGt54pAG7ispME5t/pzPbRc=; b=lmcwe/qLOQpfIb
	rS8mHAk7lM2hM5ze1xSxR7PGGeSrhdfoFGmxYnecevodTIp+suxVkPQ48IwWtS01cafGxSg/ojpNz
	pEFfc6lMm19fFXhqjJXN2W/iJWGkkKqpDZCsnSMcKhrOi8wNgTNp2pj7aXEx8r8ztETPOIk0baE1M
	Nyw65Ekkz08mrQH2gO2GmETNkbFMZoavKLI5aehidd/r1hqEhLAghlKqlcveoFD8TZ4oyf5k7G8kB
	5cG7cviswdFQlsS8Z0vDqhlO85fLcgcEBMEaNxXA7StXmToqV6ePidIxjrXUEyWPUePJrIBfepCyc
	uovc+542jPLvcaOJ6QWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8m-00000002oPZ-2i1j;
	Mon, 26 Oct 2026 16:01:40 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8Z-00000002oHN-315O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:29 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c498e2d623bso133829766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030486; x=1793635286; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XK7qHQy7h7fEOAcUVe+GZGt54pAG7ispME5t/pzPbRc=;
        b=q5tUHx3Q5Jo3Ysu9MEuVHKs9eGo29E8vdSyLC77jEJ1zznpk6us6vtBr/VKHTG1O+t
         pw9RoFMVa+EbloHxZcYjOjpjNDWE0BDzI49jGHQOAPQHJM9X1ba010prqfEzxCb8URH+
         kBi6IrglgPSy5Ip+bHI0Rl+QfRltDtp9B/MbCpg3Xa2Mrk7xGlJK/o5vbocz9oc5YXOb
         kv3iPZyBcXjicYGrllbhQJF6jwz9Fx0vuX4U/D4Bld0xKAMqlKK/S9OeX1lf/TFzlBNn
         11Y5sjYWAlHuSdtHolsOAaow89i0HzbV5J3U8IO9Zexz9B8fE63GZMsuj5E8bRdQaW7F
         sx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030486; x=1793635286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XK7qHQy7h7fEOAcUVe+GZGt54pAG7ispME5t/pzPbRc=;
        b=gAviP9ua7qcA09irr/B/gMuR2ozzlNUrf85CFmkraf2/kNmwEGbJSqOqdk31oqzg51
         vTVPqCxOJmF/4efXkrxHnuASW70uOYrgQi6nysrLVJLM46QUnZ26cCgYt9bFQ6mDH1m5
         yJooEs7Q9fMGkn4C1Y9DS5qns6ODM1JS+kEuiFAilO+JBBIMn7IBMC09R7TW9s8sJXuQ
         emmjTpHQ20QNBi/cYZyT1pv6H8R3QT/2mONCmtXXrd6zL21aIU6th6p1/06jUgfzDX12
         RrbxXtoFytFDHyQUGqKLfy7W7Cr7Fxzyn94A0FOi6Gdp8SN8v37TlqvdegCzCbibjJRY
         XE8Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3FO2PM56/JCTwK0lDIKUd89yuT9IIy6+eG9TjqV/NZF7XYUwGl0YPRzTPdMK3cYI1jq+wznWz3XUHTcRsrau9@lists.infradead.org
X-Gm-Message-State: AFq9FYJG8V1WYR9iX6JZtJA3OFma2Vk76veLuLOOV1ZyTeevvDyxroBw
	pflGlfMmU+vRPqJezYSdPJ9nOIkhaGdNYs7lCmXdpXR778SrKnCcz3snM4F0BHoMOes=
X-Gm-Gg: AYBFou1a993KyiXS3VaGss3its1gsU8qUewpNE6HSf1DXselKSnfSgGrBW0LBB7sa7Z
	4gE/4U05sI318uIg72qkiBDWYzgywNpZxOhdjqC7a1nYjMdkvLmVo0PZG2KFvwiyD48p2kcLSi6
	FTqXdBRHmcueeUDWqZRFEoobvXfkCeTKCUTUADr3PVHFNRTXwwCUCnVRZ83EYE9P6MmFhoSSAMm
	j3vxqa1fHc4n04B1U81YemFerpyuO9UqbnRLQTzuc+Wz1uZSmzLcwIuc2I8ISLV1kT7OM6b7Nkt
	PLvoPMKLkNrbNgDg3LXiSnPeNvfKrP41Tp8dHK/21CDcmSmJxqoBWbtetHZYOLIpHoowxr/NuDe
	4VqEX16MPl8y9p7HvP+NRWAsv2KQksOeDXn9tNXtduDHj6aOojG0M9eYjsnQQ6Z0sW9g4vntweZ
	lBZfdEi5odB5DAGaRzGRypIWVHnozqiqinffJks4IWF+EBfgGOJAjiWlF8/CWCsYPstg1Jecb6n
	E4gzWayCa18z+KV/YN4dty5YLta3wzrr0uVdIq+F6meaNpKp5lEUY+gh5SjhbxSi/C0EGpJEzRd
	620rwmaFc6M5vvpoMcBQqRDDwGXTlgm5/3XC
X-Received: by 2002:a17:907:3fa1:b0:c2d:fade:e089 with SMTP id a640c23a62f3a-c46bd95336dmr871688466b.0.1793030485703;
        Mon, 26 Oct 2026 09:01:25 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:19 +0000
Subject: [PATCH 02/15] thermal/drivers/samsung: Depend on PM for
 EXYNOS_ACPM_THERMAL
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-2-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1174;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Dzhl0EEXao5JmHmXdbQBkEx1RDJKD2McfwIvQF5jBlY=;
 b=yldnHcVgig3g4YuaqhknJNmqQ0LiizU/8L7WyW6sz9Ri/9FOWRHr2VpyiIQE9S5ZTzmP6lMpo
 HHCV9rcJCDYAIrbrxD3SaBInPJhhz5uMQhuqE1CNV6B+NCUxnHtIT87
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090127_784818_04D9AE22 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Exynos ACPM TMU driver only prepares and enables its APB clock
(priv->clk) from its runtime PM resume callback
(acpm_tmu_runtime_resume()).

Neither ARM64 nor ARCH_EXYNOS selects CONFIG_PM. When CONFIG_PM is
disabled, pm_runtime_resume_and_get() is a stub returning 0 without
invoking acpm_tmu_runtime_resume(), leaving the APB clock gated when
acpm_tmu_thread_fn() reads the memory-mapped INTPEND registers.

Add a PM dependency to EXYNOS_ACPM_THERMAL.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index 18ab4ffc8671..b879a63e97c7 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -15,6 +15,7 @@ config EXYNOS_ACPM_THERMAL
 	tristate "Exynos ACPM thermal management unit driver"
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
+	depends on PM
 	depends on EXYNOS_ACPM_PROTOCOL
 	select REGMAP_MMIO
 	default ARCH_EXYNOS

-- 
2.56.0.257.gf7497c7d27-goog


