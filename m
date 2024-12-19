Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C61AE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sk1QPolGn/nUdbf7OB1vt7Xy/ZysEgNs8FEJCCCn++k=; b=iUeIYr0GxJd6QVjDiv2jICW9Eb
	r8QUJQv1DvrPoA3Nd8UuemfeXnTNuX6VI3/CoH+3tgdL0fq2oknCKHWaadGIiJC0Ud7qUwWz5Qp/U
	xN8IWGe1Hec3d3jp436iASW91ZKwE52V1sAK+uH83EqKfGdhJfjpjCDars2gFVjWtndIzVsRZi5dT
	tdd5/X9zshgXrp9Pe33q7jU5pELPPjWo4cx7X8IeAEuSrXoqP1vxO8iHKRl9YquHKaVT5X3dE3dL7
	HTSdaLHowSym+Hz0oVcFzjsFB3YtMpcuTHdAD7gCOtPLF2iU4nw7uUZAuNSQehvANleHU9SIrsbfa
	NoIEuHdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEpK-00000001gQh-2aUj;
	Thu, 19 Dec 2024 11:36:22 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEnN-00000001g8P-2I0C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 11:34:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2166022c5caso5603855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 03:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734608060; x=1735212860; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk1QPolGn/nUdbf7OB1vt7Xy/ZysEgNs8FEJCCCn++k=;
        b=E51SXCiIAH+8K+ss3aFyPzxiamoYuoOhV2eLzEwl91vltCWMaI7PMaT2sYyykqDnbT
         dH6GVNIXZ5ZE86ZX7lQbRu35C2ujY1YOeeOzYw2zZzIaqJwcPrK/MFq0zrDDilIrXKPA
         qvcezQIvMnX3WbDN8Shd+uzI76SbPcqJDS8Cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734608060; x=1735212860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sk1QPolGn/nUdbf7OB1vt7Xy/ZysEgNs8FEJCCCn++k=;
        b=iWBL4lq4pyhHPdmuO2rEdRNGc/ZaA+YA5QAM3uZTixlfyvvMxV7tFlh2U18UjYATeT
         or2uX0dcUUeVWSlcK3OXNNt7Dv+4uO06p2YC9NK6Tc0vY3412GiKK/6trc7RQ4KP/Yv+
         ds8uFyHf1pBSS4OVLtJwn/q8LKxl1TXTMzMj0rhEvimM6haM47bqehgozzU/hTa+9kK9
         Lz+P0s/Pa4Xhs9RGGqPz4r6GULaJ+C1xG/aQ1RkEIQE2zD112VMMUGTbBX0wZoNycV/C
         sRQivpgNbx20KAmUYZrkoQUZMkXPyq9xsEHqU5CoWN3TuTNWchQ/7aFLbuj3wXAAxmSe
         ox9A==
X-Forwarded-Encrypted: i=1; AJvYcCViMOhuWpt2MjTZfj34ZabsoZkFnP/SyBBpV/32JslqCF/xCk4tbaiBUGO6UWr47BGxrmjUDal2Zc8hNqOsOweS@lists.infradead.org
X-Gm-Message-State: AOJu0YxpyLu1Tnhc8Aag1sD5uB6NP1erarumeOYkd8vbrpM2sC5jtf6P
	VqMCS/zg0c7ntJKkwz4O+S3H69TdQHVPk8IuOVD84N22MAR8QIp0cGZP43oDpA==
X-Gm-Gg: ASbGnctFGH7l6O7ZgQO3f7r1lhiuWz7pLCtsb888xp/ntofEkUmRVrjXG0PE6qmg01e
	zctvspapK1CijO/R3rZSrpvlkRRsqhFxi0Qikph3Nc2U1DBtmNCFciFzZt6XCuOjdinL3tThjlp
	oXMyULPr9ftmNXml4bwVsOKNbMRozXx5qRNlu+WChwxfwJS6jbQSdMuzn9xgaD4ikrrjmbY3RM/
	qUbhkSe6bN/7WUahn2LH0adGCqgbaWsUAMboAHBicPWPsQgWrYXGf0Ug7zzFhaLODlkQh7E2e5L
X-Google-Smtp-Source: AGHT+IHjcIqLiZw2eED/D9V3yl8u83INLOhWzncyRqB0BE96XxrVo1TlRtGkvCpfaEG7ZGHJSJ/hhQ==
X-Received: by 2002:a17:902:dac6:b0:216:1ec6:9888 with SMTP id d9443c01a7336-218d72368afmr93453945ad.33.1734608060271;
        Thu, 19 Dec 2024 03:34:20 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e7f2:d393:53b5:6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca025d1sm10375935ad.254.2024.12.19.03.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:34:19 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fei Shao <fshao@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-socinfo: Restructure SoC attribute information
Date: Thu, 19 Dec 2024 19:33:50 +0800
Message-ID: <20241219113411.3999355-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_033421_602070_9085259D 
X-CRM114-Status: GOOD (  17.13  )
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

So far, the MediaTek socinfo driver populates the SoC information as
follows:
  - family:  "MediaTek"
  - machine: "<marketing_name> (<soc_name>)"
      e.g.,  "Kompanio 1380 (MT8195)"
  - soc_id:  <null>

This approach has some drawbacks:
1.  "soc_id" can be used for showing the SoC name (e.g. "MT8195"), while
    it's currently unused.
2.  The newer socinfo API automatically populates the "machine"
    attribute with the model name from board DTS if unspecified, which
    we may want to preserve if possible.
3.  "machine" combines the marketing name and SoC name, making it
    trickier to parse. Ideally, the marketing name and SoC name should
    be in separate attributes so userspace to utilize them as needed.
4.  There's no guarantee that the marketing name will be announced along
    with the SoC name. If either is undetermined, the current design
    will result in a malformed "machine" output. This is observed on
    some newer MediaTek platforms, where the marketing name is still
    undetermined but the SoC information needs to be settled for device
    registration and validation before launch.

To address these points, this commit proposes a new theme to display the
SoC information:
  - family:  "MediaTek <marketing_name>"
      e.g.,  "MediaTek Kompanio 1380"
  - machine: "<dt_model_name>" (auto-populated)
      e.g.,  "Acer Tomato (rev1) board"
  - soc_id:  "<soc_name>"
      e.g.,  "MT8195"

Moreover, if the marketing name is not provided, the driver displays
"MediaTek" in the "family" attribute instead, consistent with the
previous behavior.

Restructure the way driver populates the SoC information as described
above.

Note that Mediatek-based Chromebooks are the primary consumers of this
socinfo driver, and Google has prepared corresponding userspace changes
to comply with this update, so the impact to userspace is controlled.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/soc/mediatek/mtk-socinfo.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index 123b12cd2543..b9dbc90d7814 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -62,17 +62,24 @@ static struct socinfo_data socinfo_data_table[] = {
 static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
 {
 	struct soc_device_attribute *attrs;
-	static char machine[30] = {0};
+	struct socinfo_data *data = mtk_socinfop->socinfo_data;
 	static const char *soc_manufacturer = "MediaTek";
 
 	attrs = devm_kzalloc(mtk_socinfop->dev, sizeof(*attrs), GFP_KERNEL);
 	if (!attrs)
 		return -ENOMEM;
 
-	snprintf(machine, sizeof(machine), "%s (%s)", mtk_socinfop->socinfo_data->marketing_name,
-		mtk_socinfop->socinfo_data->soc_name);
-	attrs->family = soc_manufacturer;
-	attrs->machine = machine;
+	if (data->marketing_name != NULL && data->marketing_name[0] != '\0')
+		attrs->family = devm_kasprintf(mtk_socinfop->dev, GFP_KERNEL, "MediaTek %s",
+					       data->marketing_name);
+	else
+		attrs->family = soc_manufacturer;
+
+	attrs->soc_id = data->soc_name;
+	/*
+	 * The "machine" field will be populated automatically with the model
+	 * name from board DTS (if available).
+	 **/
 
 	mtk_socinfop->soc_dev = soc_device_register(attrs);
 	if (IS_ERR(mtk_socinfop->soc_dev))
-- 
2.47.1.613.gc27f4b7a9f-goog


