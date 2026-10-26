Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A513606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qhBT8U5k;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GaLIa8Qo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uqme9Wp5homb4GKnr1RiyXTopVTpMqOF0DSF1J4+ZFA=; b=qhBT8U5k27wyGa
	w9b0yeaFihPx0xfwFQS26OmU2Xxsmih3aCiSeCGXsM6oprDissB5NJjBToiFeQX5WYfHBHA5cnTKd
	oqipYxogqsKZem8fTJ1+Fb2t0oO1PAhbHYpGYgQKeQMuHLOxkDmJpAfWE5c1yh3f2QJbbhPcEUPMA
	oirNGRYsSoOoVgU8FjZlQMDDpu9Z/20GQE+RWLqN3bgOFr7vMwoQ8sFZ7Hx5YcSm96A1peyn2/yiz
	SiML+Bujz45FQ5Ya/GzCtIw1d8sv9qnln/FC/N5DnbVQnNpy8QULnNX9ixyxifQbHNPysS3Do6vyF
	7Qd039jwvrS1GlmjI9Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8n-00000002oSa-4AnZ;
	Mon, 26 Oct 2026 16:01:42 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8d-00000002oKA-2aVn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:32 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c46d41f6af3so196542866b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030490; x=1793635290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uqme9Wp5homb4GKnr1RiyXTopVTpMqOF0DSF1J4+ZFA=;
        b=GaLIa8QoEaJm4mdnMMTY9L+RRW06BAs33CdY5WjLlwx+QgF/9E/Xy0vyCmu45noUwc
         rPJ8uZWSHOQMxoA2ylh7kUJk1tCSHPujzln71cOpk5TBjXHOUH+huM34iKWkuwPMhN8H
         sbYZaflQEfO6QsMLl6+HnFmRP5zVdB3U2DPdfoVtU5Vs+/I0XZPiTEkDHoBY5FpV/2Yo
         ipdvg6yzf6yUR0i5JnFG/X1KhrQ446g5u3HzV2WGSYiIjSCoOaSrsXgoLJGmMRyT67rW
         xt8UuyCr3XTPaYlVQoI9HuvxYeR3sc+LNF3L0RkfBi82shq6OeZrzcw3wWp1A37j3t1M
         SwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030490; x=1793635290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqme9Wp5homb4GKnr1RiyXTopVTpMqOF0DSF1J4+ZFA=;
        b=OZIPjfLjKPQdIL1AZZmbf9IE8uE9JbNdTvxkCFad2+mvQyqrEGpVDsQRL4ucJbGg0w
         PlTEAYV5C+2YfCl5XEbmC1qvjMJ0kRkmB2VjOwdFCez1E1bOZniXdR9geDFZwQ504Q3I
         vOd+wyOovH3bGlVOY+TJ7HGk6cufAZ3HJ60UDQ5EZV7N+HMcYOMBD5IUHA12uK6+2Q+O
         BOPi7zNZ9GhiwAdGW2z7LGuSbP/9uIQFnzWi9zpCeRFSQNRWX6/WB0R9i5B/ibVZWm7w
         XD5psERGZ6CUcJg6uBT9ePW9WUAKvyuuos4ssuqQXx247P3Ow4ao1e8ms1tvYiyxr7NY
         xtYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp0Fa1AI43A/p+P3QxVDIVc6yqVDv3Bytks1KgMrpOYunhfEBjefVMH2Cvnw4bhxof5ygEPJzSuCFoFInDaSC5@lists.infradead.org
X-Gm-Message-State: AFq9FYIBaecKleJeEmzVymX3lKbq/zt5rj4R+RHKe5IKQaqRHiBUIoo7
	4MKCBAJ71jV5s4b5qxK81sf/8i5v7m+E49BWXRye6F13Z22477zM4dPjj/3GVjdG1qE=
X-Gm-Gg: AYBFou1aILBv4Rz48Q1XuyPrZu8Eqdrgwza8zyQBvgOAEWm358IfYl0EJgmBS1yTq9e
	TLOgA8HJuGXYK2f4nvCdQds/3FugKtZJVX4agcXAwCMHkZhyGY8bTuR3VpluBxr4Oa6NnoJZX9B
	BQ3zUuOy/gn5kt9sONsbkjiPCe0rgS2WGkACdaZpeMQx/cIViRV/2hOgrcq2+FAtvZ3c7QSKeCj
	FN2AKH/ecTukKzw+ArpSbtk9qDLwhnrVuDw4HX3hR/Ats78STlR7+qHeJv4Gq++3AE45xKNWmCy
	TbiYK+h5nx0rTBGI78GFfVAon2RJZZrtv92cNdPKiKPH3LPtTQMskP/ra+sUfD+sFpsRfPTLhLc
	FuVn1tV3PaRQtKK3bletF5ro6KXjJrDIa6C2E10rUV6eqVSNd30uumi/Ayp8WnocPlAeECqxb6p
	kr1Y3Z4K19jysUDTr/PcMLbGVPL6ZqDTBgvhJvw0WsPzLkbgJDUsYdR17d+wiUCLMV3/yORB5X7
	VPgySpS4/lLEpEfd7qUWCgs6ivjS6uLxA5LxIJ8zOVgVAcHWxlJimSs1YfjGxh3iV9gGKR1iMuN
	4TNOu3HBdb2msV5lRqTG0eVvgecKl/N2uqav+gRFDigqvXXVTir/ZcnOyht/RLOErgZT0ZK3xlM
	cLXCZZyrTnA==
X-Received: by 2002:a17:907:7f9e:b0:c41:5970:2360 with SMTP id a640c23a62f3a-c46bde8d65dmr797137366b.41.1793030489913;
        Mon, 26 Oct 2026 09:01:29 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:29 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:25 +0000
Subject: [PATCH 08/15] thermal/drivers/samsung: acpm-tmu: Annotate lockless
 sensor->enabled access
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-8-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1693;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=s+vlmicvmxoIoV/zG2HTAfaht+VsOMx3OvHNh06nsKQ=;
 b=sr3Gr7+wPMBcALGw6z7oTnVQMKMSvhD4VWlJImkrIylHLhmr5t9yYa8CM8+YcRQX0+qwzTdZ7
 MYcDNOc0I6uAEEX6sHSgfiz0P4Wgj2B+LSwh2tq1C1/bqWW9EUL4LL6
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090131_685533_02AE3DB4 
X-CRM114-Status: GOOD (  13.33  )
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

acpm_tmu_get_temp() reads sensor->enabled outside sensor->lock as a fast
path before resuming the device via runtime PM, while
acpm_tmu_op_tz_control() updates sensor->enabled under sensor->lock.
Because both accesses are plain C accesses, concurrent execution is a
data race.

Pair READ_ONCE() on the lockless fast-path read with WRITE_ONCE() in
acpm_tmu_op_tz_control() to prevent compiler misoptimizations and KCSAN
data-race warnings.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 1f56c69af76f..65be8884a8c5 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -7,6 +7,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/clk.h>
+#include <linux/compiler.h>
 #include <linux/device/devres.h>
 #include <linux/err.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
@@ -148,7 +149,7 @@ static int acpm_tmu_op_tz_control(struct acpm_tmu_sensor *sensor, bool on)
 	if (ret)
 		return ret;
 
-	sensor->enabled = on;
+	WRITE_ONCE(sensor->enabled, on);
 
 	return 0;
 }
@@ -199,7 +200,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 	 * concurrent disabling is caught by the second check under the lock
 	 * after PM resume.
 	 */
-	if (!sensor->enabled)
+	if (!READ_ONCE(sensor->enabled))
 		return -ENODATA;
 
 	ret = pm_runtime_resume_and_get(dev);

-- 
2.56.0.257.gf7497c7d27-goog


