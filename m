Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F2CCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 12:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HctO9PHPxVVbYlg8980nTUBYVtmtaaSBay62x7H26xc=; b=p8bAQm1hbhaKCdU+QebgttCSjh
	f6BJQCnnS8D4nzXsrYV9XwbUgXNYhAjcw0ff1Xjpp102wtD5IY8Dfzhsbo/GkV3qr9KsmfWMrWpbZ
	j5A9BCXocueL9Fnj8CzknFLAZWu78IGN1ZETMs80mSjgbAW3hLW0ZwY3pb9df6fliFUFSH7vKEeRm
	do/M703MPd2hq02KNNih7zZBjhyrXNXg2gAPeh9hvbLZbVb661ZXURFpsfcY0k0X7HZHS7LT+A7/T
	4tszv+2BiCzpFIQvCGbfAHMSJu8jB1WuKNGVhzRWY5hngpCVEwfZDMWWAtgA8qAObYYxe8ToC6D7V
	j2nBKSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKabB-00000000eQW-0U1n;
	Wed, 06 May 2026 11:39:29 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKab7-00000000eNa-2oBD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 11:39:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso74428815e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 04:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067564; x=1778672364; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HctO9PHPxVVbYlg8980nTUBYVtmtaaSBay62x7H26xc=;
        b=UXt2O7yEi55XJci/K1TF4iiOomVtQa4NcjBJIqwvNW42tH1rRhxI6dsoftOCCYaL9l
         XtwfhKHk9iMS9raDJoJ22SdN+1I/Q4isjx2HJooucaLjO2Shmwe0oVNbBrh+LUdThJZn
         FugNoFzlkwnJXvhvnrzDz0idHZ43tAUeRPyNK4+g0kQtX4D26FG90rDwc3UIyLJU3e8e
         1CKAQ8CXtfxsWCRTwyoZs7pQsfYVSDPGUPjyED7Iisy2ZOOEyyoJ34JBmF50JJwJpqTl
         NtnZS0e6NpyujY2AeoZwGGOx5u3sIuRWxFaqQmbG++zRv1QihorhhvJOIQyGakNwSqWN
         vB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067564; x=1778672364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HctO9PHPxVVbYlg8980nTUBYVtmtaaSBay62x7H26xc=;
        b=jL8J+SQaf3gwZokb8qPq3kK7pWaSDDNxHvIpxyoc6wkrp8M7y/YVSE/Gsa2sxtGvxv
         zFWFTDHKy4mfnoVib6bJb8Pw/Awox8n0fTXuQhWmNMgnIGQ2fUrLiWs3NpOYvienwlRd
         ojGTttnnvCC9ZnVEqeTnQL3DmNwfgZTcydk6BWkpQVIkSx8F9kxxz2Zq0JUYIeH2ITJh
         LUQw8gvawzJ2VtD4MzNI9VIsE3V4dUo8nhXBKiCyaMlAyLPMzd0h9c3gxoDYBVyO6qLg
         Jm/Kpd1mFLDSzLOfBlkN9qfLTOJKuKhp0hSyDL0srksuZpFaVaIKBFzktBHNvgW4AM+J
         sNDg==
X-Forwarded-Encrypted: i=1; AFNElJ8Ov67g9MeVIG/MM6uYALOLMKroUpLCsfH2Nl0oGGJaiwWo8KcOudW/9UZlMfrxUb9fhEVE4FlEcq/Qmw/yRTt2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Vn1uSGfcwMfNUe2vK1vgjU3t7JWoYHuhq3d1Zaj1kQ66Nena
	wyXem3gmYP1/dPLJxMpBIMrOyf1ICvS+CpaZJVqvxe7GXARDsG01JyPHeE69nDZfdBc=
X-Gm-Gg: AeBDieuqMXU2sy6I0po9EPrnkxIBLp6GBhmVzzY6okHefO/E2fANBngeyggVDhr8Pkf
	SK15Cia91M8G8UV7UPDuvvhuf3G+4uilYqpLlCWpLoC8EprjAf//OrHArvM4V9F1QNTZLHSnF8r
	/dz3OYOusdDrcxDZhB4MfKDCx4Yx9TLAvUWRP7kstWUyJN51GGiZhF8xFJdUecE151emBGAcBpv
	veQ7NgGfNch045VgRsjMgEhB+wnBkNxfugXazZyY+J2aY1UHpQ0lS5JxZZKgJmyxhnNnuffLy28
	dNCXFSsqsPLZWGKy9Q+WwUFzsMwf0lmSoIc9+1KuMV8HNG6ldIqeJ405tZg0QdmGoMlHDujK4z9
	agJvhzMWaFLLdZGWrSI8o+PJjLILl1x0Q9FPHzXISuzmUQbbc7FyMD+KVNHjVbc0TNUCTSMOv/k
	rYpcLSN5zslEjDFdHm3dByI3JHUqzNa8rWLn1yp9dLZed0AuhFERYGuALGu4c/NzievYQykFYNb
	LsNVOg59RhWBOtqGg==
X-Received: by 2002:a05:6000:2082:b0:43d:7a97:78af with SMTP id ffacd0b85a97d-4515da963d1mr5166511f8f.42.1778067563680;
        Wed, 06 May 2026 04:39:23 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:05 +0000
Subject: [PATCH 3/6] firmware: samsung: acpm: Drop redundant _ops suffix in
 acpm_ops members
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-3-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=4435;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=g7W+VZ4iU0XoANYUCcwBaeUQrWsATMZyd8vfMjiV5sA=;
 b=7tox4iGBbtjxHercNunu+1vkvebqHsR0UywhkufQKg9lb7ncF4dNBIKHyZGZZ+pWcx7WvYOJ4
 YJJ7RSbj0g/AxE/8yalf0mtSBgepg04rk9b9gD8puaZAaHZYrLLPeNu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_043925_749256_98AA1632 
X-CRM114-Status: GOOD (  15.94  )
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
2.54.0.545.g6539524ca2-goog


