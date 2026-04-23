Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06A2FC0342
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoK1C2zStDqs2HDGBFigq8hHFdAU01w+3goGRavdu6k=; b=C4FGpGBJtX10tShcSIfNDeHR1E
	9YIAh2erlwnerbzRSU9N4r632TNPQmkqkagf44WCJg+wC1Oy3quZgKyH9BuaI6RxDwsPmy/bjOQpE
	XAzM7vuqGOfoXISiIHNpVUnXwPv5W9ZCcVkUD8nutPEJ8aOTss9fEeZ6LRuB3aEhP/FQZEgKMHIOQ
	xREV4HvpJe2p9ItHDEePvzV721rVH/qFifHv/VCN7yTd5StDxuIjqJB8iNP5FdD64yFCBoSept0Uz
	GREyswRb/CwsAddr/cJT0W752E51C0rsg29boxKvNVkOs6iWkrCy8ozr0jqHpcS1wxspZkXZyYc5y
	mC+DBrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtU-0000000BsZL-25Oc;
	Thu, 23 Apr 2026 15:23:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFvtQ-0000000BsV0-2dvX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:23:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so63188485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 08:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776957783; x=1777562583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoK1C2zStDqs2HDGBFigq8hHFdAU01w+3goGRavdu6k=;
        b=g+oVmMeq14DAwsTIIRCFPto5cMjKx3vBb05kvHondumBAN/NZPDqGViqIw5hGCoP7i
         USOWinW0E8PqrKaxTg9R45bRnUGz1TCUrSUZZ5k2+1Kpm48I6hESQ+3p3I9wFd3LHzn8
         eb2NlMx1XS20b9/cd6sP2XRWiYsLyocw0mBXm5Vt5fLIX/MNjnONADdsU7Heu4hz3X16
         02+RLiH/KOWwOFP4SvL/B6Q1VOHNq0lMb3kCelX5RGcHCFMNtxq6eezX9ZbAbKeXii/h
         0Iex7JDXAx3fPFcLAiaqi6ubv4mpOtcV30NUBW3wHgPdIZMGaypglTF3qNCba5yIxNJ5
         1EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776957783; x=1777562583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uoK1C2zStDqs2HDGBFigq8hHFdAU01w+3goGRavdu6k=;
        b=qiw1L/6OVxCv9fH3/nRPtycrBl3TZ3tls5jQBgKSD2naEsgOVjj/+kVg8RZqH+yqWt
         b/iyP2eq0jzOr2+F+nDuWIG1jslgvig0G2Jy/h985BhiTWjg6joCjDLzcEgX+QmIYwWi
         +7BGVgI4Eo5t35l+5SEMwTfJi7YYX2sZT5Pysel0hAFT08S4vurSFO1E/J+ZIfeV0m9r
         S9PxsD+3umygOhpBenIbExdK4jaradeG9FIXBwjx25Ey/HCdZMJfuMVKV58jYHRlnVxr
         gfTFT/Z/y+535jdzDW9K9trvPE78lvyvVMRH7Bib3M++ZY4/x+CZa/37ATS9HKNPKQSt
         DpdA==
X-Forwarded-Encrypted: i=1; AFNElJ9Xb5f4Glhw9B0vmGUPhOQHo6lh5sGqjQRXe+qVCOKWwIXMSPNpAXlxvo7g1bkrJ8mB0nIccYXCB9ZYn1Tx2poO@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Ur8HysZJfG/scGVXYZPzRXUQxv4mALDR+Wf32c09KjzGBaoh
	SxIdwUk0lzqbBRWofw0L/fjwatjDdTu/6QGaJLZDwcKn5RaOCmd2TM0Op2SnnGlt4dA=
X-Gm-Gg: AeBDiesZtjYFGayLExuSEv8erCQUUp1IMgTgmNFlQO145y8zXE08Wk82u5atEKlLapi
	QdJhYRLGZDye5ncaBLANajZX6haEJaaA+/fTIMMrUvT+6J0+8uoUQEXPEQ7e8/JeJGyNsukkUK4
	ye3N5PmuNBiB7FKWgAIXrtlueJF2nJ6ABPHgGmXI/cOZ6ilcNOoVpUu5nYiLraNqDWGyORYQf7M
	Jevzsy3cri4n3DjS1D1H253VYyzlef3EPQtRlxS3yzv7K0Tn9wSyp30mLvI2zjC5UQL7FDt3Z/r
	jMEpFZmOq4x2RVzqIuYimia0oHMArSGhvaNcfyujmZhC8Xan0YsrQM8lwO7gweJPsCDoZQL2y1A
	tILkgAvp5D+Vp4uC/OsQFRh3OHMKOXnevcArVkYDHHgxkQB6tdwEkaZiHMJlB2uRKZe2SWCA6Mz
	rYyiZq6Pibk3Q83HFylPYCbnXgx6cC3sPoHTecntZ8l6QCugbCpjh49rl5Cy+675yKpT63GY5HQ
	xHjmKIXc+BiT3l+gg==
X-Received: by 2002:a05:600c:6289:b0:488:f941:aab2 with SMTP id 5b1f17b1804b1-488fb78a561mr382038865e9.30.1776957782397;
        Thu, 23 Apr 2026 08:23:02 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891f98728dsm90550755e9.23.2026.04.23.08.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:23:01 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 23 Apr 2026 15:22:53 +0000
Subject: [PATCH v4 05/11] firmware: samsung: acpm: Make acpm_ops const and
 access via pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-acpm-tmu-v4-5-8b59f8548634@linaro.org>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
In-Reply-To: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776957778; l=6122;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=wmSJ4leNLyELML627FEDTONj947cYs+EgV6hiLIWw+Q=;
 b=BNyvDPIvGqa6/baxNysPZ0qCl8LZAy+enzTQt4VLh7RQ3zyZPXe3Jc6F07To8ReEXWUrzZgfV
 t25sgONY5DyCjkQDnN05QW80Bd/6kpW4iksNcx/rOZfje6/YKiWr21x
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_082304_713164_8810E624 
X-CRM114-Status: GOOD (  17.86  )
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

Replace the embedded `struct acpm_ops` inside `struct acpm_handle` with
a pointer to a `const struct acpm_ops`.

Previously, the operations structure was embedded directly within the
handle and populated dynamically at runtime via `acpm_setup_ops()`.
This resulted in mutable function pointers and unnecessary per-instance
memory overhead.

By defining `exynos_acpm_driver_ops` statically as a `const` structure,
the function pointers are now safely housed in the read-only `.rodata`
section. This improves security by preventing function pointer
overwrites, saves memory, and slightly reduces initialization overhead
in `acpm_probe()`.

Consequently, update all consumer drivers (clk, mfd) to access the
operations via the new pointer indirection (`->ops->`). Finally, fix
the previously empty kernel-doc description for the ops member to
reflect its new pointer nature.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c                     |  8 ++---
 drivers/firmware/samsung/exynos-acpm.c             | 36 ++++++++++------------
 drivers/mfd/sec-acpm.c                             |  6 ++--
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  4 +--
 4 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index 93667777094c..953ca8d5720a 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -68,8 +68,8 @@ static unsigned long acpm_clk_recalc_rate(struct clk_hw *hw,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs.get_rate(clk->handle, clk->mbox_chan_id,
-					      clk->id);
+	return clk->handle->ops->dvfs.get_rate(clk->handle, clk->mbox_chan_id,
+					       clk->id);
 }
 
 static int acpm_clk_determine_rate(struct clk_hw *hw,
@@ -89,8 +89,8 @@ static int acpm_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct acpm_clk *clk = to_acpm_clk(hw);
 
-	return clk->handle->ops.dvfs.set_rate(clk->handle, clk->mbox_chan_id,
-					      clk->id, rate);
+	return clk->handle->ops->dvfs.set_rate(clk->handle, clk->mbox_chan_id,
+					       clk->id, rate);
 }
 
 static const struct clk_ops acpm_clk_ops = {
diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a2cd54ee4589..38f40fb67ea7 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -621,30 +621,26 @@ static int acpm_channels_init(struct acpm_info *acpm)
 	return 0;
 }
 
-/**
- * acpm_setup_ops() - setup the operations structures.
- * @acpm:	pointer to the driver data.
- */
-static void acpm_setup_ops(struct acpm_info *acpm)
-{
-	struct acpm_dvfs_ops *dvfs_ops = &acpm->handle.ops.dvfs;
-	struct acpm_pmic_ops *pmic_ops = &acpm->handle.ops.pmic;
-
-	dvfs_ops->set_rate = acpm_dvfs_set_rate;
-	dvfs_ops->get_rate = acpm_dvfs_get_rate;
-
-	pmic_ops->read_reg = acpm_pmic_read_reg;
-	pmic_ops->bulk_read = acpm_pmic_bulk_read;
-	pmic_ops->write_reg = acpm_pmic_write_reg;
-	pmic_ops->bulk_write = acpm_pmic_bulk_write;
-	pmic_ops->update_reg = acpm_pmic_update_reg;
-}
-
 static void acpm_clk_pdev_unregister(void *data)
 {
 	platform_device_unregister(data);
 }
 
+static const struct acpm_ops exynos_acpm_driver_ops = {
+	.dvfs = {
+		.set_rate = acpm_dvfs_set_rate,
+		.get_rate = acpm_dvfs_get_rate,
+	},
+
+	.pmic = {
+		.read_reg = acpm_pmic_read_reg,
+		.bulk_read = acpm_pmic_bulk_read,
+		.write_reg = acpm_pmic_write_reg,
+		.bulk_write = acpm_pmic_bulk_write,
+		.update_reg = acpm_pmic_update_reg,
+	},
+};
+
 static int acpm_probe(struct platform_device *pdev)
 {
 	const struct acpm_match_data *match_data;
@@ -689,7 +685,7 @@ static int acpm_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add mbox free action.\n");
 
-	acpm_setup_ops(acpm);
+	acpm->handle.ops = &exynos_acpm_driver_ops;
 
 	platform_set_drvdata(pdev, acpm);
 
diff --git a/drivers/mfd/sec-acpm.c b/drivers/mfd/sec-acpm.c
index 9e15b260b8df..3397d13d3b7f 100644
--- a/drivers/mfd/sec-acpm.c
+++ b/drivers/mfd/sec-acpm.c
@@ -391,7 +391,7 @@ static int sec_pmic_acpm_bus_write(void *context, const void *data,
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 	size_t val_count = count - BITS_TO_BYTES(ACPM_ADDR_BITS);
 	const u8 *d = data;
 	const u8 *vals = &d[BITS_TO_BYTES(ACPM_ADDR_BITS)];
@@ -411,7 +411,7 @@ static int sec_pmic_acpm_bus_read(void *context, const void *reg_buf, size_t reg
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 	const u8 *r = reg_buf;
 	u8 reg;
 
@@ -430,7 +430,7 @@ static int sec_pmic_acpm_bus_reg_update_bits(void *context, unsigned int reg, un
 {
 	struct sec_pmic_acpm_bus_context *ctx = context;
 	struct acpm_handle *acpm = ctx->shared->acpm;
-	const struct acpm_pmic_ops *pmic_ops = &acpm->ops.pmic;
+	const struct acpm_pmic_ops *pmic_ops = &acpm->ops->pmic;
 
 	return pmic_ops->update_reg(acpm, ctx->shared->acpm_chan_id, ctx->type, reg & 0xff,
 				    ctx->shared->speedy_channel, val, mask);
diff --git a/include/linux/firmware/samsung/exynos-acpm-protocol.h b/include/linux/firmware/samsung/exynos-acpm-protocol.h
index b206efa62be6..fbf1829b33db 100644
--- a/include/linux/firmware/samsung/exynos-acpm-protocol.h
+++ b/include/linux/firmware/samsung/exynos-acpm-protocol.h
@@ -42,10 +42,10 @@ struct acpm_ops {
 
 /**
  * struct acpm_handle - Reference to an initialized protocol instance
- * @ops:
+ * @ops:	pointer to the constant ACPM protocol operations.
  */
 struct acpm_handle {
-	struct acpm_ops ops;
+	const struct acpm_ops *ops;
 };
 
 struct device;

-- 
2.54.0.545.g6539524ca2-goog


