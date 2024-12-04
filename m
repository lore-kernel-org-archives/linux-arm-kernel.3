Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880FFE7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y6Zm/pDEZ2wWuq6CLhWp8fdFsf6yo2FBchkfiY2ICjk=; b=L8yQhTHSRBskDt/B+n72LDawF2
	2lIUUVmBaS6BR5glTM0zz5rxtF7qMEB4uejglKHGOBQ5jPx5Nqk24LSSsPFZCnsoBb85Uc9cGhxWp
	bInPmhE0QDmj3/mx2ptsUzdY4RGDwTwgtjz6xa53Peshae8ZaZ9HM30LIjsa/648AM6UABJ1XHhru
	eM7BCOfqz5kgE8rIZ5UjUltddmymtOMfgWMNMnPMw/ET5RLIVYK/cfjnsQSueMgZaHfz20w+pZ5wH
	6pQ4IBnFC1B5r9LEwPXQaznOKP/9xfHUTaOGLydJB7JOTCMD+PecylLNyZUfJpDki8kN8JtZPIscN
	y2VGhxxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqM6-0000000Cpfu-3aZY;
	Wed, 04 Dec 2024 14:27:54 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqL6-0000000CpZC-0SfW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:26:53 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7fc88476a02so6052836a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733322411; x=1733927211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6Zm/pDEZ2wWuq6CLhWp8fdFsf6yo2FBchkfiY2ICjk=;
        b=W0cTJmlVmCoSujb1yhp3DF4pBweAx4xupoz8jsAL9A5Zl2z7anOmPyA6j6kc9+pCja
         21fgSX1a7FOy/nrMdV/U9RduW10yaQ2stNvIv1dWQmb6V7DFrbeFO/BtEFluNx94YQ3E
         2A4aGO49OSwK3z1HBYabeWMfw1aTmtFUotbsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733322411; x=1733927211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6Zm/pDEZ2wWuq6CLhWp8fdFsf6yo2FBchkfiY2ICjk=;
        b=lut5qKxsPj6ixt+sxEezGrKaJvw5pgUV62M9krhncGjtACrLUUWD3bu2wKkAX4Phh6
         bdceT6No0jJOhjZIWhi5rO47icWgQUVywJD9UL/6SC5nnTtyo55I9/UvxfLUdQfjoj8u
         Y6pUBIXYTo/I69NXZzFMeeHNzEw76MECaAHog/cW+ao+0cM1GAc9MLJiupVNDJHg5Yyn
         CwSX752lbW6pHbpHBpZrCPBDifLAyw2iQLhuenui/sBVAy3fzAphkl3bC7Memb9kENeA
         G+9qsW6vLJZ6APRJxUZw9HkmalvwOSo3+OkY3VAiVP9oZA/e7jOzSMTZT8vjbmxtKs19
         yqtA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2wflyw0nGm8IbqeNNINuqI+ddgc1Dqw+dCbYE5C936H9A2jlzVzt0yW6MYLCqa4q+xWzebq9/WJYjuKlnc8r@lists.infradead.org
X-Gm-Message-State: AOJu0YzZXKpIceex+dBpf1YzdJKcy9PF1usMGEvA8o0IlLFp1jIqGBY4
	OHK8NB4EVPXrvCBLlOFSgOKpgM/13OVpJ9p4dI+wcR/lqap7y/z8gZcYF7LSKA==
X-Gm-Gg: ASbGncv6JAqe44qJssyYohPI7eXLmqbANUkeffk2fdn11QMWOAxshbJfizJfWNN5x6/
	IkHoVAE9XKYGrQ8I8jW8EKN6ZUANlm/uj4xWXNwNNuK9wo+F9Zs8Mpi5enF8Nd/Frb9PTnJg5V6
	9pv3k5MDO863AaQ4RV+x2zewVlwMixipbHw1B1PhS72u4LT8XWpXP++47OcFGbxW6Wg+SD3A3px
	yTe/7ZlDSvwsVKZpuyz8SwIf8kN+wrGDTbAqK7GA7qGlSz2ySfJTx0qkZ1g1vfDyvo=
X-Google-Smtp-Source: AGHT+IF0dNNNk83kN4LRrd8AEGyz62WUomCygJPIZPBTF7uW7lrdAcSow02U1nyM8E/b/c2B1GaPog==
X-Received: by 2002:a05:6a20:cfa6:b0:1dc:bdbd:9017 with SMTP id adf61e73a8af0-1e165412f33mr9668165637.40.1733322410642;
        Wed, 04 Dec 2024 06:26:50 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:b764:8a78:a02:6e0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c3a2a5asm11416510a12.80.2024.12.04.06.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 06:26:50 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] drm/mediatek: dp: Support flexible length of DP calibration data
Date: Wed,  4 Dec 2024 22:25:38 +0800
Message-ID: <20241204142626.158395-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_062652_175625_BACF99E7 
X-CRM114-Status: GOOD (  17.91  )
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

There is no guarantee that the data is always a 4-length u32 cell array.
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

Changes in v2:
- use %zu identifier for size_t in dev_warn()

 drivers/gpu/drm/mediatek/mtk_dp.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 36713c176cfc..55671701459a 100644
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
+				 "Out-of-bound efuse data access, fmt idx = %d, buf len = %zu\n",
+				 fmt->idx, len);
+			kfree(buf);
+			goto use_default_val;
+		}
+
 		cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt->mask;
 
 		if (cal_data[i] < fmt->min_val || cal_data[i] > fmt->max_val) {
-- 
2.47.0.338.g60cca15819-goog


