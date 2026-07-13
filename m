Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D6DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCvZS+UotNJvFZgti0pR+2qbKuDNmgfw3z2iv69lpMk=; b=4nbdI6HH5og4ct
	EWMuYsMUmFK3uQU96GrnH37Sfjscvm+8caUyMXwz0UNqtXraW3SdumaRqRJQpNovPwljAjQjVJ2bj
	visvbvwFthzdm1HFWcFrROyqHghni/98As9coBtlqywYT74fjHWAUro5/3JmZ350XRtwu6LlczH46
	BasfTDKduiMeYLv3kdixiJFiSeZXCCqoQMy8K05949G+nleDncEhkwVDL+wz9baUW9olpth/87a0b
	CG5J9OPKoVgitsBElfzmaZQX4kZ2Ys28xGe47vMuI96ilk7cL5kwHYcLU2YFx6ETK/a+w81a4+Sff
	2O6zbwf3/cxgc03d74sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFWE-00000009A6i-2fA2;
	Mon, 13 Jul 2026 12:12:18 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFWB-00000009A48-2Ear
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:12:17 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1328530a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944734; x=1784549534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCvZS+UotNJvFZgti0pR+2qbKuDNmgfw3z2iv69lpMk=;
        b=XkuzMpKbOd2/r9W1u1JoB4UohlcvD2l1o11qYeJgbSh+IPzqohkEOflOV7h5tyO1aM
         BaPE6cqGog2im3Spe1ccsjCzV8lE4umah/2GQ5jP5cGd78OOC/J7QZq9uhW4Quc/3hf5
         b4C5tpaJarL83LMtYa/3cBV7rveKWz93vq9WZthg856EHBD7p46jHLQ+clmoNQ0OCNF0
         kKxzegxv1pDMhQi3j0qE/zQVCnDRS0H/7/c+WMFeBVm0w//KGN4SI9MBGk4ahlisW5+v
         xxu+9ulbYNYTvA81YJz/kBOhci2SWszgDdd4mrKJ0XxkTMSnLtouuF9SnhhiNurAxFCu
         Ix4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944734; x=1784549534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bCvZS+UotNJvFZgti0pR+2qbKuDNmgfw3z2iv69lpMk=;
        b=r3SVG69OG9qpG3tEMRaUC7yJM9wVjt0mMMbTIpi0MYCcW/42WICRK9kmft6vbmSUX3
         pAPAk20WWLNXwDZgWHJdaJEYtVM9f91sVP3ccNrDlKe0JoHHwKg4/aK2mAqmlMVTMZDV
         PQeZWW7wj36WqXPwrNZL0UvYyfKWVElivpKzoPdqNEoSwXLwjLBT+V/lmDyke9XpAwe6
         WLleF4rMOTmvzXglgZeNSrdP9sG6w4cniDCidPHP9S5bFttZpICLL/eoSe2FJG//mh9A
         3E6M1yBd0VLHeQBdwPiiwpHX6PxcaNF8MYSJRJKcasl+C/fjHQtE4musjQ1zCyrppq+D
         KGMg==
X-Forwarded-Encrypted: i=1; AHgh+RpPURdR1MaQlHzT9/I1TNYjLO4LrysB/0NElBbdq9UXSOToNPg6E7KslBgiRgaMw+r6g1FXqMsggJhsWr6Dy5xY@lists.infradead.org
X-Gm-Message-State: AOJu0YybevFyYIHL6dP2SZSxZE17tdRUYnjEMf3OW9LXufmBSdpPYmZL
	ZKK6eanGKt/HHAsgaDtu08hMcL+Vvv4pGkh15V7idaEmWcRlYbyh3zmp
X-Gm-Gg: AfdE7ckQzpOn+XIp3I8g5aT6XorFPvis+YNnpE0XQR5/0nxMYBFT1sGELTyecs13Iyi
	/1J9eHcbUA3UN5EDePPezHJsl/9aUXH9w2/52s5tkKhOinSCbiMQFuh7I8q2Za8yqq5R7zJNExO
	elykLK/iVy5t4FozbStL5DsabVGnWErQrAZaQnmIbaw+n1g+1u4tFtPj0V864OvDSPxnOcJYfE7
	uqvB0aqerVljUGqU60lVQ3WqImzapH7970ldMsTW76EuG22XGOs1bbN8gv7a9L7r11lSx+x3gBT
	9CEkNB+lN/03QPip29UeVjmd0zsB2e4nMlYBafAFV8oWxDEBZLXrvT93lipgMtSLCyVOKqZ82Xt
	kaWeNdD1F3zwfI/KFgNv89WQlwoBIVNloiZZIZIU2dYmFxT3evDuTEt2Tqc2I0QSiCxrhku/Wom
	0GSmtMKEYbJg==
X-Received: by 2002:a05:6a21:6817:b0:3bf:80b8:9c8a with SMTP id adf61e73a8af0-3c1102d7cf9mr9542534637.6.1783944734620;
        Mon, 13 Jul 2026 05:12:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:12:13 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 19/19] gpu: drm: meson: Fix DMA segment size limits and maximize allocation boundaries
Date: Mon, 13 Jul 2026 17:37:14 +0530
Message-ID: <20260713120840.17427-20-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051215_596160_00DF1F14 
X-CRM114-Status: GOOD (  14.79  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When importing DMABUFs exported by the Amlogic video decoder driver
(meson_vdec) for hardware-accelerated rendering paths, the DMA core
subsystem throws constraint validation warnings. This occurs because the
display controller master device lacks explicit DMA layout configuration,
causing it to fall back to a default 64KB maximum segment size limit.

Address these architectural constraints during the master bind sequence:

1. Initialize and validate a 32-bit coherent DMA allocation window by
   invoking dma_set_mask_and_coherent() with a DMA_BIT_MASK(32) argument.
2. Maximize the contiguous scatter-gather allocation segment boundary
   check constraint to UINT_MAX using the dma_set_max_seg_size() helper.

This guarantees that large video bitstream frame buffers can be imported
and scanned out across sub-driver domains without triggering allocation
warnings or page boundary splits.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16d32..899e70bca4ce2 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -202,6 +202,12 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	if (IS_ERR(drm))
 		return PTR_ERR(drm);
 
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto free_drm;
+
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret = -ENOMEM;
-- 
2.50.1


