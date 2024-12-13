Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4007EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 14:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pi1TXEqqDBiezezG8nYR4uQXdlaFaxavbh3mrGsln2Q=; b=ZIo0MgXfEdWpnoZnpyjZzDS6Qc
	YrKSo0trXRu7U1wrqm3tQ8aaE0/5t8jtvDKUQsc65VNCXtWE2XMM/DFf2ud0z727LysMtzLR2ZCAf
	rCLcKutUEmd8NnBPKi9KN+bEsxEo1lNF99ypir8jx3IDZOdVbDCA0Xg6kN0YEu4iaczxDsR4E+7Cm
	axUDuQ82/Ny1cXjz0X6N+E9qsS+jJtWyRB51qbVlFJbps5sDH2JXUy3SE1DMQ1p8w9AkZa6m588m/
	vaPFlF9mBKShGaVHZNnG+yCMpkooNbAUjed/BP38fpNl0QJiNKI+NW4uuZD6LeJaHAejZTmOkSdQs
	Z7HY6IjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6np-000000047aK-17tq;
	Fri, 13 Dec 2024 14:38:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM6gT-000000044YS-0Ik9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 14:30:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434a766b475so18439985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 06:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734100223; x=1734705023; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi1TXEqqDBiezezG8nYR4uQXdlaFaxavbh3mrGsln2Q=;
        b=s6GGt5JAZN1pN/bYVnY/strXyqP1sJO3aSVGq7jZQ/tn9reSo8yJju/8pZWMY6AsVp
         UYsEF//XwjApHoesDSCaNAytBtiCr0nSmN8h6y4o0Ndds3S4GaX+URCxbB70OJRn9ANw
         iY9bEYf01FWJvtOz9+u0deQdTWqp0YpA4E8CZ4wjtVyaYsphxKIFL4F4Z1kL5a5FL4ez
         VV4qrM1bYRUAcSCAq8sI6O9NrHKyGK/iii1mYjF5a3KlEMe+QQPe/hfX/fwW5NfD0jkl
         xgfR7HagY5CDJwdjyAHe0c1ZUvIcvbuaD37T+r6+6uF8JFb0dX/TmzbONJNyeDY1g7gb
         LF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734100223; x=1734705023;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi1TXEqqDBiezezG8nYR4uQXdlaFaxavbh3mrGsln2Q=;
        b=tNAJ+RmnaJoyYhqLkePppDhvPr4ebVO67IgHja7aZz3fxb12IBW//OHoOySDenbhs9
         ZHhxvYOeLdbBf8A7nijSmbJDe6/4xIBi72mCK8GAMiAnBz8RUHfFnOeFGlQBFkklum0Z
         mkVLAlsamOi3TdrmzMhfcl9TCzfpepXMeBSBw/T90PA8MUqU5L0BQD37Z010BMvi0NvW
         HvZxmKsVY3jsxNNu+8dYizLGXHu/zPPxjmQBbDRxqs82G+E9qsk8No8mM+W2RTVUceMI
         AOZn5RQ5IBsQSLxsmhTPUpct1aRUF73UYLCpqdFeKlpuooBVTURAClQxWNvXG0Vj02Qo
         mJKg==
X-Forwarded-Encrypted: i=1; AJvYcCXNJTkbdq3OZ9BQCvq73BZHUrC+oO1UDk9jB8Z7CDEajwladLiawvulZOWoXpZyx4V9DMGLr2IHqmwqkE1PZc9y@lists.infradead.org
X-Gm-Message-State: AOJu0YzEIGYDqE2svantNOHN49P8tVI+QG92x6NJA7argHR2zOOnNBp1
	vavbKU6qW8h13C1NcS9KqMGThFXz4vnkAOD8eu+ykWT3kfyVTuHPe/KXv4WnaHg=
X-Gm-Gg: ASbGncslY7E/TMGf5blLv7LWNa0rCOrGdLBK5KIauGa8nUDyiFen54vHHf1+lWtI8wk
	YsL5LAkvNqRkvnSGlY2iJyRgq6MY5CGGisFLOLxMGVAeudt36tNbfo4QugbFFFBTIbMlmqw9uML
	JneHpoasvV+6yC6pA9i5o16RXiLCze20BswPkUH91QmKDKbXLcuCGV+oTdcoYNJYgSKl41hsaKV
	9HrSsSIftLvprSCrNuWkUwvq12iF5N5V9GioZ7kiQAZ1hhngRhIM12s++y2yVJ6i2g=
X-Google-Smtp-Source: AGHT+IEBmcupQ7jLd1GlerO1KBdvvlUtU+d7uGcD/hEi+3rvYzaqGrrDbYHOw1AfBKz8/xsv1HIlnQ==
X-Received: by 2002:a05:600c:a08b:b0:434:a386:6cf with SMTP id 5b1f17b1804b1-4362aa1543dmr28303935e9.2.1734100223162;
        Fri, 13 Dec 2024 06:30:23 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3da8:c88:4a1:9b7])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43625579464sm50747805e9.10.2024.12.13.06.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:30:22 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 13 Dec 2024 15:30:17 +0100
Subject: [PATCH] clk: amlogic: g12b: fix cluster A parent data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAPhEXGcC/x2NQQqDMBAAvyJ77oJZU8F+pfSw3a5xqY0hUSmIf
 2/oceYwc0DRbFrg1hyQdbdiS6zgLg3IxDEo2qsyUEvekeuQP/MSTFDmNwZHjJI2xsRZ44qjfbH
 3XU9+uI4yPKFmUtaq/4v74zx/w3KPD3IAAAA=
X-Change-ID: 20241213-amlogic-clk-g12a-cpua-parent-fix-64362495fc9b
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3449; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=l+LOytW4KMl4YzA8MDmiu6FsOw4fpbkKcHgg4999JHE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnXET9FTQHlDf7COIAQ8tPKiSkEOeg1ym4k8nLN
 w2YmO/f+xSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ1xE/QAKCRDm/A8cN/La
 hV1vD/oDVg1JFi3oFO2Jgffxn8O9WOKcGf5BljQHVgYNnYlO0R5E8Z0XETf+jKNf1t9+l7n65n9
 LEj685/INquJNq/DB0GqKRtBy8FuWJWEfoK35F07328l+LSh98VzWqB3QWMRb+LkyT9NQwrkN4h
 t19ECF0qW8AhO/kisqFU7bChtVoTrigfi+JCmmyE8vQgiMWaeUizUh1/DIlFOZ1iXOp805T1PLi
 FwQtPej0JyLfkjyw2lJ6ryu/EOEAmaYXvPGLCD3e24yt8Y5kFWnHdt/AfgylfLBnZEAW3+mkRnn
 +k+ClGBYBKjUnbx5PFWZ4+8zqK1meKPXwy8ZT8DFrC+48zevkLBGtZ5PVQwBywDwjYRBya/a2NH
 Q90mai8gFNfmTAKeK4P7i4wwzywzXg8uD9NX5vGczQoThKOcSJPaF69dGyY5/tGDo+lktSv8t6u
 Cl6cPEtw2RpLhzOCw2NQK8QSyaHfKUIfVayUZGttC1muG5li22PY/yE/2nXl+rdjNFL80fzKkMA
 uQuGWkG1ESYa0BE8q+5FFStR5UdMTRAZJQ99crrEJomu09ftxVfNAd9JpuIf89vvJoFXzSUQe06
 PWyv2wb3sA87J3EJrOgBID930xZbfC2KIXq1zbiI4kUXzYflicq4EJfNGNFkAyhFCNBpxjt9upc
 pSxW8yaFTC0phXw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_063027_028721_D752AC63 
X-CRM114-Status: GOOD (  15.11  )
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

Several clocks used by both g12a and g12b use the g12a cpu A clock hw
pointer as clock parent. This is incorrect on g12b since the parents of
cluster A cpu clock are different. Also the hw clock provided as parent to
these children is not even registered clock on g12b.

Fix the problem by reverting to the global namespace and let CCF pick
the appropriate, as it is already done for other clocks, such as
cpu_clk_trace_div.

Fixes: 25e682a02d91 ("clk: meson: g12a: migrate to the new parent description method")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/g12a.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 20be7b037c07535bd2115f6e70404a95a7832756..4e6584377e43fa7c9956017ddfcd3f295fafd686 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1137,8 +1137,18 @@ static struct clk_regmap g12a_cpu_clk_div16_en = {
 	.hw.init = &(struct clk_init_data) {
 		.name = "cpu_clk_div16_en",
 		.ops = &clk_regmap_gate_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) {
-			&g12a_cpu_clk.hw
+		.parent_data = &(const struct clk_parent_data) {
+			/*
+			 * Note:
+			 * G12A and G12B have different cpu clocks (with
+			 * different struct clk_hw). We fallback to the global
+			 * naming string mechanism so this clock picks
+			 * up the appropriate one. Same goes for the other
+			 * clock using cpu cluster A clock output and present
+			 * on both G12 variant.
+			 */
+			.name = "cpu_clk",
+			.index = -1,
 		},
 		.num_parents = 1,
 		/*
@@ -1203,7 +1213,10 @@ static struct clk_regmap g12a_cpu_clk_apb_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_apb_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
+		.parent_data = &(const struct clk_parent_data) {
+			.name = "cpu_clk",
+			.index = -1,
+		},
 		.num_parents = 1,
 	},
 };
@@ -1237,7 +1250,10 @@ static struct clk_regmap g12a_cpu_clk_atb_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_atb_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
+		.parent_data = &(const struct clk_parent_data) {
+			.name = "cpu_clk",
+			.index = -1,
+		},
 		.num_parents = 1,
 	},
 };
@@ -1271,7 +1287,10 @@ static struct clk_regmap g12a_cpu_clk_axi_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "cpu_clk_axi_div",
 		.ops = &clk_regmap_divider_ro_ops,
-		.parent_hws = (const struct clk_hw *[]) { &g12a_cpu_clk.hw },
+		.parent_data = &(const struct clk_parent_data) {
+			.name = "cpu_clk",
+			.index = -1,
+		},
 		.num_parents = 1,
 	},
 };
@@ -1306,13 +1325,6 @@ static struct clk_regmap g12a_cpu_clk_trace_div = {
 		.name = "cpu_clk_trace_div",
 		.ops = &clk_regmap_divider_ro_ops,
 		.parent_data = &(const struct clk_parent_data) {
-			/*
-			 * Note:
-			 * G12A and G12B have different cpu_clks (with
-			 * different struct clk_hw). We fallback to the global
-			 * naming string mechanism so cpu_clk_trace_div picks
-			 * up the appropriate one.
-			 */
 			.name = "cpu_clk",
 			.index = -1,
 		},

---
base-commit: 799ce46951dcc75682223cdab12fdc905f2fe735
change-id: 20241213-amlogic-clk-g12a-cpua-parent-fix-64362495fc9b

Best regards,
-- 
Jerome


