Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4107CE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 05:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aUTj5oOCJlKe/qGpHEm0TOrt8PkT5YpNK1Ubf0EJxrk=; b=R/+UMX8A3kdCEbSBWpRTKV4eIk
	2ghEPSY5bRc3QRk5RmAdlGj5vONRhtuH/dVbE7ZMYRObavfmw2A2wb4H9q4XPiLXlxCc5bgV5SY2f
	jVFilEsAl3CdgVpbwbbGPB4DXMvsrry0iEKlxmNnoD/+/zA5D1um4YuQ5uUntNr+dSJ4ZvGOOyysX
	y99PVdR/4CiyUp0J839g6I+Znd8rn66KGRlbTTvoip/cAXpLbq5HhxjpD98DsFiA8bzhBj3ondEiH
	Sur90xRd9Xv17+2YJjIpXy3ng4xVcferpsRE/uDz4jS1Hk4VsBnnJ73xt165XWwuYm/WVS1rfq+HD
	6AFJ0e8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIi5A-0000000BXm3-0LYx;
	Wed, 04 Dec 2024 05:37:52 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIi49-0000000BXdg-3zBa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 05:36:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-215cc7b0c56so12041665ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 21:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733290608; x=1733895408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUTj5oOCJlKe/qGpHEm0TOrt8PkT5YpNK1Ubf0EJxrk=;
        b=SXgYuIhMdqNfXYE251X/iBard4QCvDIKeojZxxeztudianCMq+h6j9KJ/RoB8bQhU9
         85+pKnMnSTtxayTxxJVA/kDcwjIUN4RcuG9PIstzg6qfZyS5a6FH2bDqTs+xzUWquguI
         Q0zypCz3whu6drPZHjJY2/0k/1HFj2exm3KYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733290608; x=1733895408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUTj5oOCJlKe/qGpHEm0TOrt8PkT5YpNK1Ubf0EJxrk=;
        b=HuEYTBuWq9USF0tmvD+kDcJW72rRLvuPTuVv1WE0qD7LI/XStdaA5fg6dytO+bXqN/
         5pO+X3sjTsu+TrOEiKsIojJ44b+nN4Jj7d61DnjTLGiXBPcHueYDCHd7lUYhgfq7p4F4
         um0ABGYKv1xeTwWthUsMYlQkri+NcTd7X5cIq+vKREvfJgCSCCeZ4JtdN5qicNP8wN08
         2du6zDeCQzvW9MFFbuHxmuu8L1/Gzw3hMJEOj/shcuM4389bdIFygLDrY1dI81AwTv5k
         NbgFe4DNlJIkp5iXJ3u9h4UkBqobkU8QdvYgTwTKcasGJ+sPRdYqJ7XC0TIS410zAtUy
         7Kng==
X-Forwarded-Encrypted: i=1; AJvYcCUcvLgQCZmz7f4BgsWFPen/rzER9I68YE/MeMPnyTwexv1Sz78y4K9t+LlUGlIJ7sKvaljEG4tC7HZbhmnOEgDO@lists.infradead.org
X-Gm-Message-State: AOJu0YzcY7SeCMnxhqKQG1KyF74tPeCmNOpIyXRlXLMAcnkTHZgwLSpU
	XlWpiIBCM3Rc0peEBVh8nmqz+Dar5+5Fwj6BB3gldOTt5kBxFiJZZgWpIqYWjw==
X-Gm-Gg: ASbGnctYCMNLAwJH/WfL91hKWgDK1tE6IDWIiD7XKtqu+xvg2G1fCC0Uz8wBg4S9AL3
	XSBhvSc/T8YkNdKn0NMF+ryDWNBehWcz2eOwcDHIBm4oa1nuMNL301teM9at32l5Jvy2N9psiYA
	yJbBH84eSEaexeP3e5HIvK0UtdN2f1extXTNlMKTzIAU8qmrRrwr1vZbxVLZD/z07L4Mf1K1iZJ
	whwK250EAIZdU6F4n9l2lCMOMOsdJ2t1tZCyXAGJQgzyB98eKT0DAHRfVq9zDkhLNY=
X-Google-Smtp-Source: AGHT+IHCZpXeN9MLrmdZcAAHOnTGeoLcKfIjSMDNfOqrrypRTuT3gt40Zogb0oCb0B1u/35wvFZQbA==
X-Received: by 2002:a17:903:4094:b0:215:bc30:c961 with SMTP id d9443c01a7336-215bd161bbemr52091865ad.35.1733290608504;
        Tue, 03 Dec 2024 21:36:48 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:b764:8a78:a02:6e0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219672d1sm104304235ad.164.2024.12.03.21.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 21:36:47 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: dp: Support flexible length of DP calibration data
Date: Wed,  4 Dec 2024 13:32:33 +0800
Message-ID: <20241204053634.1365491-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_213649_989996_1EB82891 
X-CRM114-Status: GOOD (  17.62  )
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

The DP calibration data is stored in nvmem cells, and the data layout is
described in the `mtk_dp_efuse_fmt` arrays for each platform.

There is no guarantee that the data is always a 4-length u32 buffer.
For example, MT8188 has a data length of 3, preventing it from passing
the preliminary check and undergoing calibration.

Update the logic to support flexible data lengths. Specifically, we
validate the length returned from `nvmem_cell_read()` against the
platform-specific efuse format. If out-of-bound access is detected, fall
back to the default calibration values. This likely indicates an error
in either the efuse data length described in DT or the efuse format
within the driver.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_dp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 1cc916b16471..e9ff6fdfd6ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1165,17 +1165,25 @@ static void mtk_dp_get_calibration_data(struct mtk_dp *mtk_dp)
 	buf = (u32 *)nvmem_cell_read(cell, &len);
 	nvmem_cell_put(cell);
 
-	if (IS_ERR(buf) || ((len / sizeof(u32)) != 4)) {
+	if (IS_ERR(buf)) {
 		dev_warn(dev, "Failed to read nvmem_cell_read\n");
-
-		if (!IS_ERR(buf))
-			kfree(buf);
-
 		goto use_default_val;
 	}
 
+	/* The cell length is in bytes. Convert it to be compatible with u32 buffer. */
+	len /= sizeof(u32);
+
 	for (i = 0; i < MTK_DP_CAL_MAX; i++) {
 		fmt = &mtk_dp->data->efuse_fmt[i];
+
+		if (fmt->idx >= len) {
+			dev_warn(mtk_dp->dev,
+				 "Out-of-bound efuse data access, fmt idx = %d, buf len = %lu\n",
+				 fmt->idx, len);
+			kfree(buf);
+			goto use_default_val;
+		}
+
 		cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt->mask;
 
 		if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_val) {
-- 
2.47.0.338.g60cca15819-goog


