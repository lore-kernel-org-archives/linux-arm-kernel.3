Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3530ACD8C83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 20:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEynX1/cef0pndZEPm8gcDuGDO9NpbMBOZFQHs0cVw4=; b=j6eUzDSz5wlmzuxLCOHg3M2OQa
	L0aVE5DtgLTAS8z9dYLFCB7twQ+ZO3LKqCz1+vLWVDdJXUa/OYXRCoYtTHNtW7Ck4FWqxDlJDxI1X
	hchbdh3rOkBnNrOfrA20THhA4UddhmR94QLVPUS518n1cS8lh0sdC44ldQtmiaTSs5/ZrvMeFwxQ8
	Fms26HLW8UDnmXxVpgVa/7oAwe9BgWzFPXTWMabraTZFQ3sO5KIKd55cJhz+kPCqwuednsPaBgJ14
	5X5VQTXOZVP5cPpK20iTwfsKu9YQ2YO49NTuMYOKwICpHVl4c7dmsKlBowfzTX16CPzuCMbTXpfiH
	AiexfDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVb0e-000000019hb-2o2G;
	Fri, 05 Jun 2026 20:19:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVb0Z-000000019fI-0pA2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 20:19:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490afc47455so11824425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 13:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780690749; x=1781295549; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEynX1/cef0pndZEPm8gcDuGDO9NpbMBOZFQHs0cVw4=;
        b=ShVFtu66rvdKknOHN5Pw6yVYjL9TR0PvHEqgCwX0M6vhku0aAucVeTRIX52LcRVhjF
         +LBq/LL1MJs6h+GzlpPtUQe/MDeR+sdpuuoFHtO+5HhXA8omTPes5WgAOXQQxxQaJ71n
         inL27ALgdfnTwm4bZja29rvQI8oSUutm1n9cbxaLr+NnP9elUadwR+a6FpjcOXbKxfks
         koAOdso/5vVsvCea+jTTyaS5hS7fJQHzblAAfKhvoyXSk/n1MAmYWjpGJ/D0bT3Cvz3j
         ivo0y+OiJzHE0piSCurJurz0k5SlMstFMWrcOTGPbpO30p/ffl8aHCoiP7xcfImZ839G
         KBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780690749; x=1781295549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fEynX1/cef0pndZEPm8gcDuGDO9NpbMBOZFQHs0cVw4=;
        b=GpekaeWDdJ+Q4NvWqkpn4L5eKxUDnMBwmax12p25i3Alv6baC5zDUgfqyt/tEK/Eeq
         ryTJmNRyGP3ZpkL4QKxNkC4OEH88QAGq8xQ3gtmp0NvMlK2KwYcoXUgGKM85SreK93gr
         R1SpYnIhEs4SBZp5ABFkRuyB9aFMsZLMp2OtnFgID3FMqh4IXIQeXg3dH1O3u7CH8G3i
         6Q2604jj+cZdZKhWVSeT/VXlTCcfIPAsWLtWnQCerIOfg25FODfPj4VZEF9YL1A0xoet
         zdUmq146bQlY/G8MHK1XJreeZzTOE1BdApzk1Ql15EHKFt2Ds1M5N6qGtx3Ekx4sCpF1
         VdoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/P6HSpkTl1RRPdNDzGSIr4aMjHZi475n90RDKT4jDg9+pO5Q03qSZurU3YdzqBNch2+JbevNJecqki58pyd/10@lists.infradead.org
X-Gm-Message-State: AOJu0YxwOZUSRBEKE1hqbjwg+WqkV6YSlpdPXbrSNLUaQjO+UWkOvH1e
	dDdc2tEUhysFgA5A7n/iGxInVSAd/JP3Hy5eOioP6Brn7fpRMnpGXfg3LaVeU0lSgYg=
X-Gm-Gg: Acq92OH+egrJy7lpCqPHjlZmtpCMicyyubYJ/2gUKsfZajgOHWvzgsaEBi6iUJRzxQZ
	mf9mSZP4pBVeuqfE0AQeGfPMZ/bmjjEQN2P/SzvNNC1zHIHX+CSejvkjF/ZpT9qFKecvR4qOZoe
	kk3bHpUe31P/BHJH2K4r/u3RLI9txJ69ec8yw9boKOL4DBXFarSS7vLYSUb3vUVgjUzx8XdcUoM
	BfXmwNvvUhUdHvMfYx9+3kyCyNmyuNlLlt+eMuiBiVPu3gSorEA0LpkCg6MLnY6GNF3eYDL0/I4
	LGSAKh226wa5CrXMz/DgA/KrqKZKL1PAYOtRMVbYI4zfJgerYv6HTC3YawamfwCIs7hgfFsk4xU
	ebEnZpj32xNPUdxk4idXPMiAwu3f39RWr8pUg+ve2fDmqpXIXUh3YL2BRKBnCWK49xqlDsfW5Ae
	5sTp6QdFAYBpQb3NrTHNJXUFzovMWs1KJGoVjV23TWEBgVjIUlIs0mx8t02PVWa0UMqx0nwSXHj
	Im7Yow60zKNitjKtqDyBtackJ4=
X-Received: by 2002:a05:600c:4506:b0:490:4973:91a0 with SMTP id 5b1f17b1804b1-490c25c0bd7mr90063925e9.10.1780690749367;
        Fri, 05 Jun 2026 13:19:09 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413541sm190533895e9.14.2026.06.05.13.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 13:19:09 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 05 Jun 2026 21:18:51 +0100
Subject: [PATCH 2/3] soc: samsung: exynos-pmu: fix use-after-free of
 interrupt generator node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-2-0cd05c81a82d@linaro.org>
References: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
In-Reply-To: <20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_131911_257100_8DF513D1 
X-CRM114-Status: GOOD (  13.21  )
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

The setup_cpuhp_and_cpuidle() parses the device tree node for the
interrupt generation block via of_parse_phandle() and decrements its
reference count using of_node_put() immediately after fetching the resource
address. However, later the intr_gen_node pointer is passed into
of_syscon_register_regmap().

Fix this by moving the of_node_put() invocation to after the
of_syscon_register_regmap() call, and adding it to correct error paths.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
Fixes: 78b72897a5c8 ("soc: samsung: exynos-pmu: Enable CPU Idle for gs101")
Cc: stable@vger.kernel.org
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/soc/samsung/exynos-pmu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 6e635872247a..9636287f6794 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -428,23 +428,30 @@ static int setup_cpuhp_and_cpuidle(struct device *dev)
 	 * syscon provided regmap.
 	 */
 	ret = of_address_to_resource(intr_gen_node, 0, &intrgen_res);
-	of_node_put(intr_gen_node);
+	if (ret) {
+		of_node_put(intr_gen_node);
+		return ret;
+	}
 
 	virt_addr = devm_ioremap(dev, intrgen_res.start,
 				 resource_size(&intrgen_res));
-	if (!virt_addr)
+	if (!virt_addr) {
+		of_node_put(intr_gen_node);
 		return -ENOMEM;
+	}
 
 	pmu_context->pmuintrgen = devm_regmap_init_mmio(dev, virt_addr,
 							&regmap_pmu_intr);
 	if (IS_ERR(pmu_context->pmuintrgen)) {
 		dev_err(dev, "failed to initialize pmu-intr-gen regmap\n");
+		of_node_put(intr_gen_node);
 		return PTR_ERR(pmu_context->pmuintrgen);
 	}
 
 	/* register custom mmio regmap with syscon */
 	ret = of_syscon_register_regmap(intr_gen_node,
 					pmu_context->pmuintrgen);
+	of_node_put(intr_gen_node);
 	if (ret)
 		return ret;
 

-- 
2.51.0


