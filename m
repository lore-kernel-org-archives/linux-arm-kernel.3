Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3428D606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DfNFKTro;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=M8Cxk0Eh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WHqpDy7PbKCDefXUBKtfUU6422syVtJV7HXYeU5J3C8=; b=DfNFKTro8QQZcj
	h8J9gw3gwSlXIShQxwsMtLZ5nlN87BMBqFf6RQMyDg/6VgJ918i1rSyrWqtV+lsdCaPqnO6lNcUAl
	z8+t2glH85CM/MbsyX34umhpDgu+LNW8m5/4iGFoP5lSHMTK+G+4DC2lJ975tPKomrGjA+RD6RCq+
	jFkPoucAmIqjzOn9bSNY4GJxPQ6FarSDAUfQVWrpsMQymvVQnIeqvPOMfSZ8awReIdLkkfUKJ599C
	J3XBgnHdxTvEwY83gDfYFzqQnRADjNkm7lYlaXVOxcGarORzwWckue4F+ut9Fzsio9Q0K/vFUBZ1F
	HHYkufxiA/k9FDCkE27w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8o-00000002oT9-1V1k;
	Mon, 26 Oct 2026 16:01:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8e-00000002oKj-3AsB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:34 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c4322d310e7so467117966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030491; x=1793635291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WHqpDy7PbKCDefXUBKtfUU6422syVtJV7HXYeU5J3C8=;
        b=M8Cxk0EhEgAIDd5ZYES7DP5iFx5Yh+loKREyEmUmLCin4aiMJVL9wSKG4xiAUmx/jF
         oYxGLAtNdsmPLdS0O83e3VtKcHU2qE/SStvNp77R3QTWvtH2cT84POf/JwufQEJL4Mhr
         rOJi84sxJWfutcztVaKT8pW4Ht1KW3Cr3epwbGfwnYzDs6fFJ3Qkfa7M4JIKl2/iQSt2
         UFTuW7AjuEgYoaXQ0l34xKHM6aAh4iZ4QnV4sQaw+c4pb2NWdszu3N2JaNTOEXTBk0mF
         aDaK+hV9gM46/oI9j9qZ5zI/TtK0tVHYV52Sf4owP8qsGEJhpCj3dDqTQK166RKFRU1F
         6wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030491; x=1793635291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHqpDy7PbKCDefXUBKtfUU6422syVtJV7HXYeU5J3C8=;
        b=J4Gdr0AwNRarUnCw992smjDG4trI5bHiTNBCT3ti5P79NcMiMIZhEtaI/geKt5TQyF
         gUmk/WbrY2uGWwJdMzGKYVPodSZkaBkAUox8OKE/+4aCcNosb0OISnHaxqKkDQkQEmeD
         pNvw+yTiLXK0GsvwJDdzrMvZ4BuGEGnN1K+2DAOe2yYBPdU58TePCNwzpCPti3KIw/Ku
         +6uPTKrKzZzr9LYoJnJrD7dTEIzE8QMTBbfcLy0sb66PQxnwrbvFgeMFzFWOMXsE4ay8
         b5HXlDcJZMp9iX4TYP140mRPcKwnAxWP6D3RTOErK93eQv2a597dghSSHXmBDy9wQi19
         pWVA==
X-Forwarded-Encrypted: i=1; AKwUvBxjdHTsNlF7NK1eGmfZurew9Pammn0C37bIwOPv09asM92KHAF8yIpFL09Fzfb/oKT8CIcUWJ81J4ha1MTLZfIE@lists.infradead.org
X-Gm-Message-State: AFq9FYIL3qD2ZTaDLX5zHA+QxbPhCKJx6jonWUJ0m2hqYLDl7ZGVWXc/
	huplD7M+Ty4SjFLO/iFWPi9/td2lQAKqSqZYeV1EDG2+cfWInCvF/qcc4P9omw9/vxA=
X-Gm-Gg: AYBFou0v7QeOiA9ixZmaMWxfEBiOD0l4uMV/9dviCx4aACXIXRE5Tk3wcgKm1SeW8Wz
	DixXVmZ7g3YTu49S7Q6895a5w97t8jsnO1P81TqyqBYli/Hp8lE6O0LdnDr7fBI04ghwegkBSpW
	OS8ajuXt2iycd1x9IVaUuRVE827Twjt/K4p/2JjpTcx3i56q4jFkhcBVX96Pey44qMsOLUwGAAT
	Uge3BzV0cnJvn3HAbDnia7bIW+CTTN9ebJnpZzWIkhqpdnsWyzS7x3u9xgTUaFr8baUMzCPrEEw
	x8G6cyEoOYzXY3Buf19JvuUWQ/SSZXTQGEQWF/bQsBwPA29VKFNR7uwqRbK8c7A5K3/+EExyLH2
	Ajhuwl7MBqmGvxA++YFa3cLRNXlrfAZKBHWmcKo3P61oZj6sEFi8xJWk+BO0NxRkdFCaxd9QjPx
	Uzcv3p2IVFYK6o5kK175IrYwBemJp7xsmz/MZS7qJrPNuaDjds7W4jEJ1qOkqMlHS5rrZ3NMfUi
	QGe9h1ApQ/L1BnB23et9h98ivdEqlhLYk9n2AbbDbfIeYdIDXNjs5pp1cKDBOaafdRD21DaDvql
	hTTTTIBv2iR82jghtXJC3OJQjyocapwZ8OlEoj01IWU6J1diLRLSKAR8QQ==
X-Received: by 2002:a17:907:86a3:b0:c31:5bb8:4b3b with SMTP id a640c23a62f3a-c46bdaf85e3mr841090266b.2.1793030490619;
        Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:26 +0000
Subject: [PATCH 09/15] thermal/drivers/samsung: acpm-tmu: Fix IRQ locking
 and error handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-9-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=3882;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=TiuBHtlRRMGFiGpDB3+TL3spi9O67ScMwNWNv6pXoY0=;
 b=IXVM7S+QH4aPV/nYNEl41yy6nPmbInM7Jmz64JJW/7l8h0sg/F8IR5+RmiE7ob2uyX4aoyuVs
 IBDp3eQ3v+tAzFgPCZbES69bfhx4xBR2Ilefyq6AbMpUncnFpWwpC2C
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090132_872068_465A011C 
X-CRM114-Status: GOOD (  17.76  )
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

acpm_tmu_has_pending_irq() acquires and releases sensor->lock around the
INTPEND read, and acpm_tmu_thread_fn() re-acquires it to call
ops->clear_tz_irq(), leaving a window where concurrent .set_trips() or
.change_mode() calls can modify sensor state in between. Moreover, if
ops->clear_tz_irq() fails, acpm_tmu_thread_fn() still sets handled = true
and updates the thermal zone while INTPEND remains asserted; conversely,
returning IRQ_NONE on a level-high IRQF_ONESHOT line re-triggers the
interrupt up to 100,000 times before the spurious IRQ detector disables
it, so unthrottled dev_err() calls flood the kernel log.

Replace acpm_tmu_has_pending_irq() with acpm_tmu_clear_pending_irq() so
both the INTPEND check and ops->clear_tz_irq() run under a single
guard(mutex)(&sensor->lock), only mark the IRQ handled and update the
thermal zone when an interrupt was pending and cleared, and rate-limit
the error messages on both IRQ_NONE failure paths in the threaded IRQ
handler.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 42 ++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 65be8884a8c5..42b338d8d093 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -330,11 +330,12 @@ static const struct thermal_zone_device_ops acpm_tmu_sensor_ops = {
 	.set_trips = acpm_tmu_set_trips,
 };
 
-static int acpm_tmu_has_pending_irq(struct acpm_tmu_sensor *sensor,
-				    bool *pending_irq)
+static bool acpm_tmu_clear_pending_irq(struct acpm_tmu_sensor *sensor)
 {
 	struct acpm_tmu_priv *priv = sensor->priv;
+	const struct acpm_tmu_ops *ops = &priv->handle->ops->tmu;
 	unsigned long mask = sensor->group->mask;
+	bool pending_irq = false;
 	int i, ret;
 	u32 val;
 
@@ -343,53 +344,50 @@ static int acpm_tmu_has_pending_irq(struct acpm_tmu_sensor *sensor,
 	for_each_set_bit(i, &mask, EXYNOS_TMU_SENSORS_MAX_COUNT) {
 		ret = regmap_field_read(priv->regmap_fields[i], &val);
 		if (ret)
-			return ret;
+			return false;
 
 		if (val) {
-			*pending_irq = true;
+			pending_irq = true;
 			break;
 		}
 	}
 
-	return 0;
+	if (!pending_irq)
+		return false;
+
+	ret = ops->clear_tz_irq(priv->handle, priv->mbox_chan_id,
+				sensor->group->id);
+	if (ret) {
+		dev_err_ratelimited(priv->dev,
+				    "Sensor %u: failed to clear IRQ (%d)\n",
+				    sensor->group->id, ret);
+		return false;
+	}
+
+	return true;
 }
 
 static irqreturn_t acpm_tmu_thread_fn(int irq, void *id)
 {
 	struct acpm_tmu_priv *priv = id;
-	struct acpm_handle *handle = priv->handle;
-	const struct acpm_tmu_ops *ops = &handle->ops->tmu;
 	struct device *dev = priv->dev;
 	bool handled = false;
 	int i, ret;
 
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
-		dev_err(dev, "Failed to resume: %d\n", ret);
+		dev_err_ratelimited(dev, "Failed to resume: %d\n", ret);
 		return IRQ_NONE;
 	}
 
 	for (i = 0; i < priv->num_sensors; i++) {
 		struct acpm_tmu_sensor *sensor = &priv->sensors[i];
-		bool pending_irq = false;
-
-		if (!sensor->tzd)
-			continue;
 
-		ret = acpm_tmu_has_pending_irq(sensor, &pending_irq);
-		if (ret || !pending_irq)
+		if (!sensor->tzd || !acpm_tmu_clear_pending_irq(sensor))
 			continue;
 
 		handled = true;
 
-		scoped_guard(mutex, &sensor->lock) {
-			ret = ops->clear_tz_irq(handle, priv->mbox_chan_id,
-						sensor->group->id);
-			if (ret)
-				dev_err(priv->dev, "Sensor %d: failed to clear IRQ (%d)\n",
-					i, ret);
-		}
-
 		thermal_zone_device_update(sensor->tzd,
 					   THERMAL_EVENT_UNSPECIFIED);
 	}

-- 
2.56.0.257.gf7497c7d27-goog


