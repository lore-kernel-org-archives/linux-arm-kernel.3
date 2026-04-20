Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC18F5A8A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 17:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIQGoy6fl4lhGyxodk/fSO9eXPaG/yS/b0aAUL+PrPk=; b=nktm9miG3YQYJM9JN9GFbRoSpL
	rmJjRA2PhaGyFx3ZZ9PXKgE7mfLMH49tGa44DYkNMGOzo1ORL8NUF5gRnhUe3ws1/7j77TSwNPhJD
	znqerlOFcXC1+f3qofV1047JjroSMMhOZB2YRmvLfMhGgmr+eIsZRuDOaILVjCbwWYny34UHp+OAC
	mo7wRqc22QC0h8Xn9l/330ccNUlmHDQy7y5a8I6jeA6hVQnZn65uLKixxc+nFl9oqGB/K/GMJC/Ao
	pSJlTfbBsc6BdYoCoKI/0X84vLjwfKu3XO//eJgntNoONTYy4OHaGPNrrx2c+2/rxraoI0XsWFHvd
	8Tt5g1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbZ-00000007V4c-1yZd;
	Mon, 20 Apr 2026 17:40:17 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEsbR-00000007UzM-20qG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 17:40:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso11238545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 10:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776706807; x=1777311607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIQGoy6fl4lhGyxodk/fSO9eXPaG/yS/b0aAUL+PrPk=;
        b=B1TCdC6i99yyjLAo5Vb8Y4f+KwVW7IrUGfPuT9Ervr524HqwEnowedQFEeXonEOcEP
         s6gUUWe1r+EYM4dCH8j8BPp8AUKZUutMgD5pG/KFMe35gQtq1CwdUbLwMJThWyxmartz
         S5dPRGKrw0gprWBqDSKp0VG2rIRP1MegdfOdQ+iqPvUcLXslojWZzWMTl+4UJenG4Fyq
         N9UR3fUlrD8GLggKeGNjAMcjjYhDf7Vwtd5BVFibOfMCHMeCajWNJYETcG6ce7Kt0iwq
         DXVnD3VATaY9T2jGi39CPkplxHG96PqqWk/S/H9kHgikNMabCSms9jChSNb0R3w5+biu
         RaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776706807; x=1777311607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIQGoy6fl4lhGyxodk/fSO9eXPaG/yS/b0aAUL+PrPk=;
        b=Zr7kLdyOst28QyaSI1k3TNJeWVex+W9khvD1J25YqlHabOYBg9ROOP42N3rjNrX36x
         9J+eeQqmlc6eSV4f8owlfp03SrM/+mlJExiIOVK0CSS4CbyZUyD1IDhCuMTzEqtsvdvX
         v5u7OGTCFaGhC91qs+et/61Nu6CIrl+PB8n+AxRPx3SipIDWb9JhwwaExKZ8lgH1iXFI
         mY+UiHqizz71boL+LvJAOhSHU0w4qKwrODjy6YbFpDqTpL/BE4KZiZ4tzsPpKZ4yPiVT
         9Okv3Tz1UvDaHyQ7WUM4ypJRqn606Rd50y4ZLMKUEgpfmvhwWkkVD81SPNtH6vee5Egj
         oS7w==
X-Forwarded-Encrypted: i=1; AFNElJ9digSU7SoDL/8OdlzNGjYaBmEbmU0uO17qw9dHHlKuXpWe156rBSkajHt+SXy7+Ea4dZdgMRIyZBRruOxiTeSI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk3s8R0xl18QCsTzuxWaAi+MuFhgPwRsXka5vaAYh5dFZlICZS
	u5CkfteQ2zJnjZIyMZBuwrxth9D6iFL67vNK/ZFVafDLgQOj+411L9+bX3IHtoCL9Og=
X-Gm-Gg: AeBDieuG6u+zkE5IoJgV6VgMLulVQyOIdVbyT9IhA7vxaM+YAZRkKy7LfbJlPdUmbvv
	TPbYV1iVZLKDCukDt6/RHK7ZjZUxjE5qa1nXvAhRzRbgxNhtRqnvTdtJATU4moDfLyM60Tc/m+3
	O9fl6QoCIqZLVGGG44rklcSMU4TLx9Gwjk9dCBqL+xlAcGe+q6IByznLXYsDcwfOjdYkmCcULjK
	P1DSzIoyNmWQP/4KPQHh0RVB7IPkVGQPytwsBu9W4b0kJ29c3xU0mNQmgklemmtApRMlDtOXAy2
	EGkHtMwqpBk0lYEQe1hr2mc0OMNH4zKI7AONtFIwbqyges3FoNncred996GPG20vNour+VSMjht
	coTmgI0WN34pkz6apm2SL2hMGeZBSV292cCVx+l7iWsTFHg6Ggs286q1zl1iGY0X3VWMmNnzm6Z
	xzdKeu+e46Nh40ntPyFdGrSBtEA+wgoepjQp2SFc49N/zYWZjih+sihZ+C6OOQ756JzxqK9IlR6
	ow/vfdXgVeyBJF4Yw==
X-Received: by 2002:a05:600c:c0c8:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488fb787bfdmr160240165e9.26.1776706807433;
        Mon, 20 Apr 2026 10:40:07 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm144280285e9.1.2026.04.20.10.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 10:40:07 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 20 Apr 2026 17:39:49 +0000
Subject: [PATCH v3 03/10] firmware: samsung: acpm: Drop redundant _ops
 suffix in acpm_ops members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-acpm-tmu-v3-3-3dc8e93f0b26@linaro.org>
References: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
In-Reply-To: <20260420-acpm-tmu-v3-0-3dc8e93f0b26@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org, 
 linux-clk@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776706804; l=4439;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=49BtV4liclRnJ5e6tUfHwtwQp6Rtyy5+WI8PtQcjUpM=;
 b=Pb4Ofrj7eCzqfvbfC4jlUZiTiFA9g6OyHFVOMPAZ6LNGAdtEXvx8niESMIV34rfDTzWwZ5BSc
 ToF6YjPTTDyBqda5yHWVBCS1dGST4FFpBxbq6/jLClzYXE6tQ6i/abx
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_104009_562684_5CF22320 
X-CRM114-Status: GOOD (  16.53  )
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
index 8b2529e50328..39d3d2317659 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -616,8 +616,8 @@ static int acpm_channels_init(struct acpm_info *acpm)
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
index 13f17dc4443b..62a3eb450067 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -35,8 +35,8 @@ struct acpm_pmic_ops {
 };
 
 struct acpm_ops {
-	struct acpm_dvfs_ops dvfs_ops;
-	struct acpm_pmic_ops pmic_ops;
+	struct acpm_dvfs_ops dvfs;
+	struct acpm_pmic_ops pmic;
 };
 
 /**

-- 
2.54.0.rc1.555.g9c883467ad-goog


