Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E46CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 06:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3n5bXyy99k9iyvx4lY1kMjVmlRsiOyGImOOHuWaZn0k=; b=wpYclvRp1qWe55tO2myKNc24lv
	eJ0j87WGPzCIFpaku0tV7iUE+H63IBDT2FGj368EvqvgKvid+fGs8HEOn/bDZD/t/iP+tTpJR5CMm
	gLWd6rD1Z8p22QKZURIO61Ezf9Oxr4sya31IGN3I4mi4ijjxIYViDp434vktjMUGRIcOd7Iki3s8S
	lGGlFxbLchSLfn4P8AzOwtP0wzTqf1+0FDNp3vCE5mvzJdm2S9zBaNIId0a7ZIYgyJy1rjaj+P47y
	mxMQEa7Mx4bEArlmfF+XSUjjJWyF0bKzA9cf5X9zLnEcue4noBlIrfDbLYk14IlLfajM3/KffbYng
	gpX1Qd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqGx-00000006mY8-2p1v;
	Fri, 29 May 2026 06:00:43 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSqGu-00000006mXK-3dZA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 06:00:42 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2f0ad52830cso17563102eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 23:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780034439; x=1780639239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3n5bXyy99k9iyvx4lY1kMjVmlRsiOyGImOOHuWaZn0k=;
        b=QOJA61qzK3LxWtZ68baPe2x+RxGgSK+01XZ+iAL97cQT8kS1Hj6jfGzD+1GNL46C55
         andENd99kZtt7+JSntPBEcrAUwZUPt4OhCbZzmqbVhXalU4aA5crZBNDvYr3DmZ9zKwT
         Tz6/q121/r30+xkfX9ssP5f8E6u0kqGtI7pLk6+Y9aivfqm8Nf/7bTIDolNIRixEcYgF
         3gb8/eQe6kVtcQHdmYBXG5AVlCcCuuAmUHhkwc9b+MlslgLCyEHNlX3d4ezMNDRcNU9v
         zk3gcs11htTVMkTqQcG+Wku/Phm7rSn0JgkrNVe3TcSGURBasRSBmqTmTL1iLMTG5wRA
         4ECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780034439; x=1780639239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n5bXyy99k9iyvx4lY1kMjVmlRsiOyGImOOHuWaZn0k=;
        b=hJRplnaF1b5qDglZlnE/Gr2e+NgKu8OAK5/qv0zdp7gROByaisR0D8JD2bN3bM/CxX
         /AChWPvfMM52F5gTE2CTL3wJzyTNPMOHho+bKkW0Xj2uApKKoJOkF5lQsQbiZC4uCmWZ
         nxoDysoxjnwf/3IiD76ba8YS/gAMJt+kw6GZYqgBY/FpeZIF359GJN5C8sNJEwKsfyXb
         7cGaBADXwpSsBYx9yawgwRGiITnig9FB54/k8xAKvhLL1Nwrtd6awK4L1LLLGdJ9g0s2
         +kOjrOEn7MwXdHvPkj6Dn8qLcS2PGHs9h0zHS47r3oNQlMDmPQaE+Jc/kdyGcb0iTWEN
         6FZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ZYo/sMju9bf53iwG1XpdMYrcLWCXX9cqYFt7CZmRUhrtARLuuxJjmu58oV3MHt80N5EMUd2wxKw/V8CvQcirK@lists.infradead.org
X-Gm-Message-State: AOJu0YxNTS/XNVdMk1nchfEDXQFH2uvprQTiJXal0LfgzAMfhveiYA8o
	Jdjpi1RnPRNqBsYRyPOduyhKQnZFiUZngOAfjyPIAThBHadbaYPhdhpW
X-Gm-Gg: Acq92OGPbU+ltqLvybEwvO80H1YoBh665vRLFc/AUnEKO326r6tBKIdfTyD0jlKbYnI
	X0ztuH+AUPclICjwLKKZJ2tpIBfyZcV9AUmyaclnYKKKxMc/F9WxSW45Ybvx4MWbqJIe2pc5q8e
	dj0vePlWIMlOImc/8LhWN0NlzcMi0baK/gNZV/xNA2DB2vBOZgWevBNe+877LLZx0+gcA+gDsUC
	njoRoKTJ8lMqlYo1u0Xe9Mr34nWnLnHwzLLXw6wKqBjDX5UP3qRvqHJgc+PFIab/rOgd2D7ZTSk
	o67+YqdGb/RIfRp7dyGYtAUN/vIzYnI1I2Xfvwa5x76zTzznx14RT1I+9l4mMItjOvzYjSbfz8N
	mZg+n97KtWaZlZE+e3uno2OYvqa82VMh5axZ3cqSUzn8PhZyvm4hOKocV5J2kqdAFIjci77vIPD
	Zcj5DIRvg840GJjIqrrtEhAtgWRYg/bCAsNHHm2kQqpGPrICXNoimH0hzLLQAg26pF1LcCUj4c6
	qmjeJBkU3TnTnahTKNW35uqdCNOBb2H3JOULgVHx0drzyWISi2y8hvQEthkoVGyaaTIud7fKMEj
	tHFaGp1FQmC/q7HA44V6t3Hia7IXeDOYuKrmhGRtqQfuJOVkYyhk+GBvJWnGZoniblQ=
X-Received: by 2002:a05:7300:7f9f:b0:2da:44ac:6d17 with SMTP id 5a478bee46e88-304eb0d738fmr636180eec.17.1780034439290;
        Thu, 28 May 2026 23:00:39 -0700 (PDT)
Received: from odroidn2.. (c-67-180-34-11.hsd1.ca.comcast.net. [67.180.34.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c120csm674689eec.4.2026.05.28.23.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:00:38 -0700 (PDT)
From: Yi Ding <yi.s.ding@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yi Ding <yi.s.ding@gmail.com>
Subject: [PATCH] media: cec: meson: ao-cec-g12a: name the CEC core regmap to avoid debugfs clash
Date: Thu, 28 May 2026 23:00:05 -0700
Message-ID: <20260529060005.94700-1-yi.s.ding@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_230040_908574_DE1293BF 
X-CRM114-Status: GOOD (  12.21  )
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

The driver registers two regmaps on the same platform device: an MMIO
regmap for the AO CEC registers, and an indirect regmap (using
reg_read()/reg_write() callbacks) for the CEC controller core registers.
Neither regmap_config sets a .name, so both default their debugfs
directory to the device name and collide:

  debugfs: 'ff800280.cec' already exists in 'regmap'

Because of the clash the second regmap's debugfs directory fails to
register, so its registers can no longer be inspected via debugfs.

Give the indirect CEC core regmap a distinct name. The two debugfs
directories then become "<dev>.cec" and "<dev>.cec-core". This only
affects debugfs naming; register access is unchanged.

Tested on an ODROID-N2 (Amlogic S922X): the warning is gone and both
/sys/kernel/debug/regmap/ff800280.cec and ff800280.cec-core are present.

Fixes: b7778c46683c ("media: platform: meson: Add Amlogic Meson G12A AO CEC Controller driver")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Yi Ding <yi.s.ding@gmail.com>
---
 drivers/media/cec/platform/meson/ao-cec-g12a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/cec/platform/meson/ao-cec-g12a.c b/drivers/media/cec/platform/meson/ao-cec-g12a.c
index 41f5b8669..2c914f000 100644
--- a/drivers/media/cec/platform/meson/ao-cec-g12a.c
+++ b/drivers/media/cec/platform/meson/ao-cec-g12a.c
@@ -405,6 +405,7 @@ static int meson_ao_cec_g12a_write(void *context, unsigned int addr,
 }
 
 static const struct regmap_config meson_ao_cec_g12a_cec_regmap_conf = {
+	.name = "core",
 	.reg_bits = 8,
 	.val_bits = 8,
 	.reg_read = meson_ao_cec_g12a_read,
-- 
2.47.3


