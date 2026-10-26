Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2754606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DQ+q9H29;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rRjrD399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HWaT+wPpmTfJJ1DIQuA8Cru6WQxlbWyH1qkN23llu4Y=; b=DQ+q9H297J5HwZ
	/9ho3W1flwvZ8BVv+kPlxI6tfS1HONpZs2Fplt7R9doY9Jp956l3uMEBT5HQKIBo01rZgMKqjs3Lm
	555+uBPlsNg31QXz14K05ECdgCHCEkuARGpMv5tUNMp5GKHrf/3+TJmd7WfZemhajZp2jXdfDTOmd
	cZB9iLFOQxC1S4jbmQrt7uTE5sYN++atsb8O9hwRXf5QDwbaNjnlTFp5a/4NTtTVpx7Qou2LjqxgU
	+rGAm96hKZ+4ZIBWr6Fla7eVCGLtdBnCaEDA6KPNjZNhIeXGGun4RHvEH8tFzy3RLLa/gPLGaW41H
	dXIEqMBTs4MKYMOc/jFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8n-00000002oR1-1ald;
	Mon, 26 Oct 2026 16:01:41 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8c-00000002oJ2-2EcN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:32 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso487755966b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030489; x=1793635289; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWaT+wPpmTfJJ1DIQuA8Cru6WQxlbWyH1qkN23llu4Y=;
        b=rRjrD399Ds8hNZMaeDYr0EVSDkmZkRELqKcbpyIFDMwPwVPNDdkT21f6aN0vcFdswG
         Dt+WBdyrNrgozxm4eLbY6MCCpjWp1TdOrSUQJyvbMlHyvyosmcgdwolRfD/Jn+7nuQ1N
         njtpCpajJ0uwJWUqNEK8g6XzHrNB0511kfFmW4iVZngqlfazJmA6O1FY0rZbj5tVoCV0
         +kVi9HFQzJ5QwNY4JyRVbzWJBcDb+eZ87nL1zfHZvaIyNXBqdY0uGjxrxDRcj/Gh0ES2
         srYqU5ffMxpzY6XkfXqDhVFsxraBNSWhQ3lxjGItE8O69MsLT56R5fTFOnb0cHBrLr0t
         8/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030489; x=1793635289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWaT+wPpmTfJJ1DIQuA8Cru6WQxlbWyH1qkN23llu4Y=;
        b=mUwftd8vsedjw2q/gQINEttNkcqiPg299TS814QuR0Nts8SDq/syQYziKi3YZbpe+3
         wnDR/QrvMf1F//lBo7TI+Lkec3qibPxD0o41qlVepc0W7eLEeQ4mEf9TmP74xLlmAIxS
         Xg2XijIBm6pksTrdN4Jc9qOTDgLxMGhbU3MZWRXfpBYtBAToY3yKKESjQhOF7dC0aCTk
         rVD3j9dnFKbaxa8GC+42XWewE75J7lXh5AH46fFw54g+pFrCUGMpdgMRYkf87ZEhwc2N
         jlY6f+vXqq/3qpC6BsxUgoVJxpvFjyhaP2VPZoLgvHg2v0TdYiV7N46HkGKJqssDiUws
         LWSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAj+0uQzIs4FzVp7J5sEpIrzR9aV8cdiHXXOG+fgoLMJG06KBp356Nd5lOAEPSzJDytAYSVeTwupzG4ROg4g3V@lists.infradead.org
X-Gm-Message-State: AFq9FYLcslZvF+L7MtMPPTbNLpNdN9c0NZTyAm7AFPCSElS/+K7i+HSm
	by+g2tng9wyC3E12S6rD6I/ZzaKZGZMZzFuzGkne5jmB48QtE6PgyhPDn4+S5ilyl7o=
X-Gm-Gg: AYBFou0SzSpU1cRHhB+j0Y3RatscYv8Vog3fZXJM+7LCZF0eo2DxgW6LUsKelxeuDh5
	RiLEscN433XD5ynfFNj9SoWXTT4F/Rft6wvNeMn2dOFFyDRHBaix5gnSlvcv1DL0/OKfYC6l2+z
	RywO5x4STpJQTAZkH5+ntGXEMtsQKwRfQ1Se3xuoa3zKFbBcy/UGpn2ZHzoiMXwGfI2OmpWp1ao
	8AUZD4rMMVhm9+0e4rDWSKt7HOM2XERwoJC6gnbiDx49T9S1+O3TQ1aBDmC9F8rThWimBdhHYuI
	IkASZDFWk50Zxx8jRZ37kkEP/Ogy00yQ3pnm/dR02GwzEOE0k48iAtDiL1VVwLia1fbO83eGdkJ
	GabXe4tF1LpafByHwLiGtzNocd2MNIJk+bBv00VUhGPXRa+F/UGDqYmhlM+hTIQB1g1ygNmvDC7
	4uf2EKtUR7Q+26P/S3MlpuUXou21UJDWd15wScHonzM2ETLunnlNMh873g01KJRQyNIEOb7bzAB
	6XB8eSuhuRe7w5sH5rWb+Ot49qjNqlfb4mMb+wQoaTlwfBWuFwNvC+unAadnIHjC/lLOHapFgW6
	LbiyJhthRlF0ZSNYNI95wQoql8s5zbF6daMr27bIGKBkRSjbRwuQ+bbsSXdlP5v49kyiRiNiL/C
	8GVxO+71ZKw==
X-Received: by 2002:a17:907:3ea1:b0:c41:b4e4:7958 with SMTP id a640c23a62f3a-c46bd95983emr863865266b.0.1793030488581;
        Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:23 +0000
Subject: [PATCH 06/15] thermal/drivers/samsung: acpm-tmu: Rely on devres
 for probe error and remove teardown
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-6-0637431b7268@linaro.org>
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
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=4225;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=IJeXySMGcYifUwBq633Cferss1iIcf0iRvDQk01LEvI=;
 b=hYIgikztdPaJbrzUwRxNl8rAWnP8eNJqKC6JvSPvy4S9fPCi5C3d1Q6+OnF91mTrK6fBTrreF
 T4AnaiUwDdjDqxmKUH8Rck13WpJ6EtVUR2R71anCWahkYFYvQsA+hGd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090130_617969_84016140 
X-CRM114-Status: GOOD (  19.18  )
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

Disabling sensors manually on acpm_tmu_probe() failure or in
acpm_tmu_remove() happens before devres unregisters the thermal zones,
leaving live zones backed by disabled hardware.

With .change_mode() implemented, devres tears down the IRQ, thermal
zones, and runtime PM in reverse registration order:
devm_thermal_of_zone_release() disables each sensor via
thermal_zone_device_disable(), and devm_pm_runtime_enable() disables
autosuspend and runtime PM.

Drop acpm_tmu_remove(), acpm_tmu_control_rollback(), and the manual
teardown in acpm_tmu_probe(), and switch acpm_tmu_control() to
pm_runtime_put_autosuspend() since pm_runtime_put_sync() was only needed
by acpm_tmu_remove().

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/patchset/20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org?part=2
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 56 ++++----------------------------------
 1 file changed, 5 insertions(+), 51 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 69793fce3bf1..4257bec802c1 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -153,26 +153,6 @@ static int acpm_tmu_op_tz_control(struct acpm_tmu_sensor *sensor, bool on)
 	return 0;
 }
 
-static void acpm_tmu_control_rollback(struct acpm_tmu_priv *priv, int start_idx)
-{
-	int i;
-
-	for (i = start_idx; i >= 0; i--) {
-		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
-		int ret;
-
-		if (!sensor->tzd)
-			continue;
-
-		mutex_lock(&sensor->lock);
-		ret = acpm_tmu_op_tz_control(sensor, false);
-		mutex_unlock(&sensor->lock);
-		if (ret)
-			dev_err(priv->dev, "Rollback: Failed to disable sensor %d: %d\n",
-				i, ret);
-	}
-}
-
 static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 {
 	struct device *dev = priv->dev;
@@ -199,7 +179,7 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 			err = ret;
 	}
 
-	pm_runtime_put_sync(dev);
+	pm_runtime_put_autosuspend(dev);
 
 	return err;
 }
@@ -489,7 +469,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	ret = acpm_handle->ops->tmu.init(acpm_handle, priv->mbox_chan_id);
 	if (ret) {
 		ret = dev_err_probe(dev, ret, "Failed to init TMU\n");
-		goto err_pm_put;
+		goto out_pm_put;
 	}
 
 	for (i = 0; i < priv->num_sensors; i++) {
@@ -510,7 +490,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 			}
 
 			ret = dev_err_probe(dev, ret, "Failed to register sensor %d\n", i);
-			goto err_rollback;
+			goto out_pm_put;
 		}
 		sensor->tzd = tzd;
 
@@ -522,39 +502,14 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, priv->irq, NULL,
 					acpm_tmu_thread_fn, IRQF_ONESHOT,
 					dev_name(dev), priv);
-	if (ret) {
+	if (ret)
 		ret = dev_err_probe(dev, ret, "Failed to request irq\n");
-		goto err_rollback;
-	}
 
+out_pm_put:
 	pm_runtime_put_autosuspend(dev);
-
-	return 0;
-
-err_rollback:
-	acpm_tmu_control_rollback(priv, i - 1);
-err_pm_put:
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_put_sync(dev);
 	return ret;
 }
 
-static void acpm_tmu_remove(struct platform_device *pdev)
-{
-	struct acpm_tmu_priv *priv = platform_get_drvdata(pdev);
-
-	/* Stop IRQ first to prevent race with thread_fn */
-	disable_irq(priv->irq);
-
-	/*
-	 * Disable autosuspend to force the subsequent pm_runtime_put_sync()
-	 * inside acpm_tmu_control() to synchronously suspend the device
-	 * immediately, preventing clock leaks when the driver is removed.
-	 */
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
-	acpm_tmu_control(priv, false);
-}
-
 static int acpm_tmu_suspend(struct device *dev)
 {
 	struct acpm_tmu_priv *priv = dev_get_drvdata(dev);
@@ -648,7 +603,6 @@ static struct platform_driver acpm_tmu_driver = {
 		.of_match_table = acpm_tmu_match,
 	},
 	.probe = acpm_tmu_probe,
-	.remove = acpm_tmu_remove,
 };
 module_platform_driver(acpm_tmu_driver);
 

-- 
2.56.0.257.gf7497c7d27-goog


