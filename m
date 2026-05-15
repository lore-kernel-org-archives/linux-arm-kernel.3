Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D44ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5faQiqLzhy5VluCrLMwiwnkWFNjtvkFCiJgOz2hI0s=; b=RhVXmVFndNt3BU4/sQC0DBvVwI
	UMQ7ihz2uuzwoov2q594OJGRU3t2o3ZnaOvj+MlXwx8eV1+7rFwkt/G7Ddh+ku0alpgg8+jEGrQ6B
	usbGaon24s4mkGo9kz5Bi/gKTAOBF6N8onPCGCDLWknnfd00Hhqt2q8yPfAAc4UNTPdVn1NGnHdY1
	4JBehDkEuA/o5H3esJnN7SIMqqrQINsOKG+tGY7ono1dBohuPdi0L2jLffoucOyXo+pFj4sVwudQ1
	Mv+FbWh9JVD1Pi2nbCnPj7+nN/qxJzdkn16DUjA3giUyxFV9maJHQCMAO6zI/bqlJVoMXl4EkFVTw
	NNDtf3eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouP-00000007ttB-2O3I;
	Fri, 15 May 2026 09:32:41 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNouI-00000007tnH-1nok
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:32:35 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a8891febd2so10856511e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837552; x=1779442352; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5faQiqLzhy5VluCrLMwiwnkWFNjtvkFCiJgOz2hI0s=;
        b=MWcIrlnrmwAgLtDLOkutX3/Mc/+4gosB8NUr0rbj84wwrj8Rqx/iGvcFNNj0PDcq6V
         5OolZU6N5HmicdbAKkEsdKdtYbQ2z5gScGV1MpXd4Btra7mBSlh5FBxPNO/I3Wek2CpE
         9HdwwmaW2XIR+MjWfjb1laJOZfF7947TPacF30Ldl8nS0Rnwtht4cUd7LfMTtmo8ADHu
         XL7c+Jx86YfExoNxUP3KLbfn7fIJCTBi8Pmu1/J0/O0c2bqAP5figEw/vrBzsj9VeuDJ
         e7rDK2HaAGxUhzxKo9sTDdDuI9/SHLK97IcAlldk8AotkgjGlk+s5Dcyq/RnzQiTVUT8
         kZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837552; x=1779442352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5faQiqLzhy5VluCrLMwiwnkWFNjtvkFCiJgOz2hI0s=;
        b=Qwl3Sr8OXstN5yHxnKi/YQIpZlxtgwjxh5hC+NIm7NhWYvvB3vO7WmVxr60074ELNj
         oIgXBGsAeKoYvniR5Sjm1pKR+IuZp+KnfLLppwy+LCXXtWeqYgmOSW0Y6H220+O+qtHI
         UsjTQTxQWUI8bxE6B5g8p6SNCkME4b3QSOV4ZhgFUaUYltFbQ/8YG/EO1e+Nazaj0dPq
         gYZ1hOu0+J4mskMk7O1xnL84AbOh6olrKL4SGWnO7sgiKJvtcRb4Qzk0u6NDH7dGyvTZ
         cpF80h8d+q+7Ejt+qMnZ4LQIr+3y6Vdn/+LtvkdCcRqywy0470dBzTyP+bh68Xd7VzyG
         KfzA==
X-Forwarded-Encrypted: i=1; AFNElJ+5zeEcf0bFD2RKLnejtBcgWZvHyBTC2gIPc1TnccVMNPBxRCASQLELJuydOxNfsObAmZ4UZDCF+TlPbsDQxB34@lists.infradead.org
X-Gm-Message-State: AOJu0YxOo7spwwbiER3e4sXTIzgvF6/Wi+5R3JHrH40M5ZXXRNVpGNYy
	gukqE5SqV99GsIPUDi1CsJIApbDnrJ5+Hh/bYW9pTTHBpbTnp+oaWDUKz82QIV6IpnE=
X-Gm-Gg: Acq92OEXS8j9wJRDXF5hQjcvj3Bm/7ksH6K6/OXIHnZJVlasYcZdBpiveP70ShgGrQM
	pWfr4ePR4nK8IB2LPggpGhR3Wxhu6JEe/8uWJmyN+3dStGOh2FoRZO8xZjxZU+/oLRzUta3vLpz
	JbtRwZvQEKxqqfweMMW4hWZzk1Adtpm52CcXNJM0YdvLSIyikCEpd942nikNNnG6omPtnStkTvW
	hlQev4Q/Jgj/KYaZEdGZdLj/o+6xcQ1LZkFU6blEIlhTk4b8cFN/iUTN1s81Er/1Ju1h6/INgdX
	OuhSBQ9kLGyD4geh8Y74koGvKKAzQA+IBXTcTrv+xgaaY+8DsQpwrHXdMwWOf6OIjpWYRTRV+po
	3JTbjG/sOLHLUOvivP0kTAKp6YTyY0ZX1oONqHJ8AljAZoBTCF7Jj8hu0j463VzfUIQWYf9U9OP
	bFGPVt3/JFhC7O4eRyuUEqRENkGLDXJeW/O5AGeTHcSEP9QmfUK//o7BoQNQ3Q8zFEUPXLzblPa
	ln7J8g1
X-Received: by 2002:a05:6512:10c9:b0:5a8:e340:487 with SMTP id 2adb3069b0e04-5aa0e734039mr932408e87.9.1778837552152;
        Fri, 15 May 2026 02:32:32 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:27 +0000
Subject: [PATCH v2 3/6] firmware: samsung: acpm: Drop redundant _ops suffix
 in acpm_ops members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-3-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=4528;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=DGMgRKBcQct6SvRrV5090Y3iu6T7EpjfNpyPo6Ptfr8=;
 b=oUgk+W+9ie/v9Qg1HmqzI4CBnVs8xE1qprJt/Y9TI/1OGNvHDAKpRZ4m5a9zS3aTBM6bilJdC
 hLavEvjfcpMAK00bpledGnzKPgamHkXmPPWSmvG2soRHjTf8hsTpvWH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_023234_522334_12A725F1 
X-CRM114-Status: GOOD (  15.89  )
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

Rename the `dvfs_ops` and `pmic_ops` members of `struct acpm_ops` to
`dvfs` and `pmic` respectively.

Since these members are housed within the `acpm_ops` structure and
utilize the `acpm_*_ops` types, the `_ops` suffix on the variable names
creates unnecessary redundancy (e.g., `handle.ops.dvfs_ops`).

This cleanup removes the stuttering, leading to cleaner consumer code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/samsung/clk-acpm.c                        | 8 ++++----
 drivers/firmware/samsung/exynos-acpm.c                | 4 ++--
 drivers/mfd/sec-acpm.c                                | 6 +++---
 include/linux/firmware/samsung/exynos-acpm-protocol.h | 4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index d8944160793a..93667777094c 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs_ops.get_rate(clk->handle,
-					clk->mbox_chan_id, clk->id);
+	return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
+					      clk->id);
 }
 
 static int acpm_clk_determine_rate(struct clk_hw *hw,
@@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs_ops.set_rate(clk->handle,
-					clk->mbox_chan_id, clk->id, rate);
+	return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
+					      clk->id, rate);
 }
 
 static const struct clk_ops acpm_clk_ops = {
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index fac88c427d2a..da960d3e1145 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -676,8 +676,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
  */
 static void acpm_setup_ops(struct acpm_info *acpm)
 {
-	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs_ops;
-	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic_ops;
+	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
+	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
 
 	dvfs_ops->set_rate = acpm_dvfs_set_rate;
 	dvfs_ops->get_rate = acpm_dvfs_get_rate;
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 0e23b9d9f7ee..9e15b260b8df 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 	size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
 	const u8 *d = data;
 	const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
@@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 	const u8 *r = reg_buf;
 	u8 reg;
 
@@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic_ops;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
 
 	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
 				    ctx->shared->speedy_channel, val, mask);
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index d4db2796a6fb..b206efa62be6 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -36,8 +36,8 @@ struct acpm_pmic_ops {
 };
 
 struct acpm_ops {
-	struct acpm_dvfs_ops dvfs_ops;
-	struct acpm_pmic_ops pmic_ops;
+	struct acpm_dvfs_ops dvfs;
+	struct acpm_pmic_ops pmic;
 };
 
 /**

-- 
2.54.0.563.g4f69b47b94-goog


