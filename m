Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3857606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dHpSQC+g;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GRN3g+/a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8XBljlLKqRRjxilFeLavMMQSY8LIFYe2oIo8dfksQsY=; b=dHpSQC+gxwB0Dp
	4RcLMf53W7t093il0cKRISDcDcctS9IobEeIwekFb8HvCGarOWWfzspGNZyaKCxobbvdTgiPUkHDe
	THemY1HLytc9y3CMSINIal1ZaOLeAIOAnNFSsQXKHw/X6Hr2PsSakG/O7VdnMQlWBNYX6FfcBETfE
	eDlJZMAv1GaavGum99Ploo5mlVq15wYS0772r7e7hxEXdGNapzFJI0/WveLykeMTAOlmt0t89tTY8
	OWxQlZshHXj1RN0j7/IR55jrqyjyZk3VpwuKNJ81eopF1vcJ/Vb94q7SrAnJCvMyv0KrweMBrdtDe
	ywWU8yD3uRpLi7AkdXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8q-00000002oYL-2BA5;
	Mon, 26 Oct 2026 16:01:44 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8i-00000002oNE-1cNo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c2e8c710847so382372766b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030494; x=1793635294; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XBljlLKqRRjxilFeLavMMQSY8LIFYe2oIo8dfksQsY=;
        b=GRN3g+/aZPnE8Hr6l6S2olpT6I9nJjyfqRfQCvSq833GPrnD4o9wy6bs9qYgWBA9Xa
         CYlfrMJqpVw3/evZSAXIs6Lkr7GjbRTPTYJzPT1P3dPaVfX3X+E4eDkNivwutTwgcqiv
         diNw6XPswbZkn8C2i3fTgpdXOjiU2vd6es7rPHozq57+DwurTqJ3TPJXU1bSbghzQojI
         gxzXFekatn6Nicpg1kuORabkY6TUXBO3eAyIuxOCr0HiY+dAOJHwSSbPVbZ+J1Heekcv
         +v7Et8SsfjCUP9oHgYI5RpkdbAAeWf6b5cZBjeYicDYByIz1GE6SpEGnEtJK4Bbya4Fj
         1aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030494; x=1793635294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XBljlLKqRRjxilFeLavMMQSY8LIFYe2oIo8dfksQsY=;
        b=GRk8tGDd1mzH1z1W0shBBpnshjSLwkMb/IlkO05sMmzLnIwhZvedQyGpSYX8YfH3bV
         eu6nrUh7TtujrJzs7bjMOk6QPISp4HFSVMzXjUxJZ4e5JkiiSUqwEetxdPSr//J8eLxy
         6YArPxikpUkUHXecKP1q/MC8+YPM6g79R3Bk159MQ5ZVbHYLg3QIbIRoz6EkGQwlf22Q
         8jkv86BZdTstxooKDgZPXpFEfRczAdQWWlDz0deTbdhN7+lawmHIBm+oc7ZMiovAIVpt
         F8dEC+tWzD6/BTUgVZCSSjsJqhM0Za+p7KFC+Kj2DZCcp7Lkuc/8wB2hKHU0/rl9LMlg
         sewA==
X-Forwarded-Encrypted: i=1; AKwUvBys7UDpwG9IqWptPDZIIvUJ7yPm9zr/0T4pOz7crswC9GSmm/zTo/lWrnpEmft3gErNxfc1n+rX2zhNBUnyUa78@lists.infradead.org
X-Gm-Message-State: AFq9FYIhZ/PJ0O7JeUOTXRPwmqgat9sKMsKTVHbBTpw9a+lox/pbMs8H
	PCVrHZFiwPajWqM7t31NDbCmtCBHkBFUsloegojQH9m8kPy8iXsMRXh2huybJiXu/7c=
X-Gm-Gg: AYBFou3+tJXKYYhf+Up+9mh4xUBw+qIPnwAksmLV+YpH9B445+1zdBRJdv+bZKySae7
	q/rgtQBHW5mnG0wUa5P+aMx0zLvNlLT2JVjNFGgSQUVc4BNGEEDzmaMF48ukU86NSwLZGcBSoGc
	ev4ehNZO2XL71MiD0KaVrJsB/rWuMRTK8FZ79PpZy3lFpCkUfJF5uuBAkIDNxyaXajV0F2J9rNJ
	6wsPVUs4olHy+FKeqpcnq40OsLHphjkRTPGDrtzZRNsd2F7LqTmIlDaWj3rzLUYpzyvLog+2tIg
	SyqBRyJZjKDnKeBgwypFrF2AbF2hjmUc/3m56hFz5lYegHX7f4Q4vxAmBpdK6WPjM5qOY+6Y0lh
	Ru+5ZXvSgHb1I9MdLP4KSntASo8vSelToEX+5oZGMoD21aSYneJHKtHbUfLyT+uaVcP9smkb03O
	v+qeOqdfy5L5ZcUVyzIv3+Xi2GfAwFh5CXjoJ9oFRnISF4Oa/+AMAeZKoQNOj4Oqs8/6dmL4/Ve
	HaZJpur67GDWS+tCT0pizGdOzzfw9gYJQ9VIkXbOLnBh/O4oHsVdw0GeGjHzvOteQKv27UXmxmS
	MZmiOrOxXtVL28AOqOoQ+yJjsYhzbODw1wU7
X-Received: by 2002:a17:907:934e:b0:c3f:c10c:217e with SMTP id a640c23a62f3a-c46bde1ae70mr844808266b.23.1793030494296;
        Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:31 +0000
Subject: [PATCH 14/15] thermal/drivers/samsung: acpm-tmu: Clean up probe
 error logging
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-14-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1985;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=kOAW7Lg+JKjNl6M31E1sd3Aqc9IKaM8OzTH6CkDn+zM=;
 b=fceObKfe3Qe6T3h1tEWJjQyeD7mlJyfyeyiJSmC5N1FBKp1boMaECY3jPD35CEu6HOV/xs+O/
 MKauJiAL0i9Cxh6ONNDpJvoqSRGpGH8P0VzDyGXY5cN2Z5CgcL3r3TF
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090136_505853_39FF720F 
X-CRM114-Status: GOOD (  12.70  )
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

platform_get_irq(), devm_thermal_add_hwmon_sysfs(), and
devm_request_threaded_irq() already log an error or warning message
internally on failure, so drop the duplicate call-site messages in
acpm_tmu_probe(). Also update the copy-pasted "Unable to map syscon
registers" message on devm_regmap_field_bulk_alloc() failure to "Failed
to allocate regmap fields".

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index fd491b4f305d..bce4674be58e 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -444,7 +444,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 					   data->reg_fields, REG_INTPEND_COUNT);
 	if (ret)
 		return dev_err_probe(dev, ret,
-				     "Unable to map syscon registers\n");
+				     "Failed to allocate regmap fields\n");
 
 	priv->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(priv->clk))
@@ -453,7 +453,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 
 	priv->irq = platform_get_irq(pdev, 0);
 	if (priv->irq < 0)
-		return dev_err_probe(dev, priv->irq, "Failed to get irq\n");
+		return priv->irq;
 
 	pm_runtime_set_autosuspend_delay(dev, 100);
 	pm_runtime_use_autosuspend(dev);
@@ -494,16 +494,12 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 		}
 		sensor->tzd = tzd;
 
-		ret = devm_thermal_add_hwmon_sysfs(dev, sensor->tzd);
-		if (ret)
-			dev_warn(dev, "Failed to add hwmon sysfs!\n");
+		devm_thermal_add_hwmon_sysfs(dev, sensor->tzd);
 	}
 
 	ret = devm_request_threaded_irq(dev, priv->irq, NULL,
 					acpm_tmu_thread_fn, IRQF_ONESHOT,
 					dev_name(dev), priv);
-	if (ret)
-		ret = dev_err_probe(dev, ret, "Failed to request irq\n");
 
 out_pm_put:
 	pm_runtime_put_autosuspend(dev);

-- 
2.56.0.257.gf7497c7d27-goog


