Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97611CA5FF5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 00:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dpTVtuLsZCKAP9AgVyjYlCoNh2JMBgdKfaKYvWUv55Y=; b=MFW94bmzpbWdMjjntgzUGtQGJz
	Z+YtZ9FoNRp9wN5Z1MSKYgIKURiU6deuqPfHQzoK9Qa6B7zGtIh/59GoYFCYTONlOf1Nyka5C28FX
	iDBFlkDcWGYOTlYdV0vVWOgswxBRZyOMxJ40NJT2Aa5y6sIfupsGOrDs6H+3tTpqViprGBxoLM5/W
	OJkkv119iqNCwOROeYaWHseNesd91h9KgWaiuJ6WlhdVuP2a1BLVXfJHgFRzobow23P8JNSQwqnfM
	oeK98PbYlC4UAOSWe7EahtlCBpILYixQpGZXzGO+D/hzFzZOL+B2xGq45UldgnYaAVnh6VPbnNKFG
	pQHWwmrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWIg-0000000FVPv-2SHV;
	Mon, 05 Oct 2026 00:11:26 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWId-0000000FVPY-0fG7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 00:11:24 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-3510b42f4e3so1186038eec.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 17:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791159082; x=1791763882; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dpTVtuLsZCKAP9AgVyjYlCoNh2JMBgdKfaKYvWUv55Y=;
        b=dI4E0hVc1o6w0UU5BKF9Z2Sr3eHyMWOFuueHfwlhRSF8n7Px6SbxUWZbw/H0Jbycn5
         hVtpkQTFQXi8YM3h+2rBdre6hV54hVd2zmGeYZeloTp/2dRYHj200hzQFb3Ep93y1EtL
         TKvV3ELWwuRfsdkGEvp351gbe6Fpq7qAbvW3LFel/TbxjUqHT0EDPibbffYvIWndXuV7
         dWyYOx/RittOTmYiqtf3TGCv+xjmM/wOabXRW9sNuVOcAjmstPwZDSnywnOBJ7A3ozdd
         4Fna/Rl2HBs/qCukTPrBoxyODaDDN02AAOh1ao2zA8c3NialuF4Nv/kEbx0BTtL8Pyh8
         l+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791159082; x=1791763882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dpTVtuLsZCKAP9AgVyjYlCoNh2JMBgdKfaKYvWUv55Y=;
        b=VW5W69CIPHUwYzAjDwRzQi366SVmMeFK+P0mAGyBPqnbqhmYlPChEh6mrSPPR7+kT7
         X5gZBky4UpJSwmgo4MRkmAGmDtRlw1Qg8t8jerCGb8FNitVtpxA/EKyls1JtIRxUBtJJ
         Z1VMX6/kwsReLdu54/4OhpEwv93Rb4JjF2a/CD61qFpQAwm2o75LCZ0kDf+M91m2XHG2
         hv7h/xaq7WpFDd9noYGMKbT606gQUa9h1wH25s++qr3m30PyVYghiAjZkWX3hMnizDKH
         fhwY9UX3ftZkvmC7l/5NBgMZeJJv0ekFUgYwKL1iOVagzYqTWT/dCWBGuDidsGR5eKEJ
         Y+dg==
X-Forwarded-Encrypted: i=1; AKwUvBwJKcJy8cse91ImYnLG5HN1pl1LjXFa/SeOFr0e9KTbc+JLzv7EmruYJ3NbjIxSOZlyOuJ8yi3BUAyl7a3M3UyF@lists.infradead.org
X-Gm-Message-State: AFuF++liwHgbZaHyh14Kb5BfV0mcMkZc8hh07Tp6+e+zHb3cv5dpCSFY
	gytMSfUbUGvdixjt8XHJVSlcEt52zVv59U9ObMFGkCQuPZKRDmSSOcba
X-Gm-Gg: AYBFou3fq/faN5p8G8suk7CdODcpp6hCDFgN7EvrWfXRG/3oFfaFUO5KsdwmHdKscj1
	GP2W55KiPaPPcJuoDNHvMAgDEX7W2j+aSRiv00N8S4l6TT2/f2HeC/v/k8Llwvv1vagwVHs6AUN
	uNsr9YSujom5PImO5NS/qBs/btsqBKqhMnq1ckbxtB8MljdTGOhSNP9irG7vAVoHyUSmOXeZBiS
	6ax+yc5A1pn+dWKyMo/inBt31HADGgJZt4x9yC2rja6pKfvU55bN/bpwO7X21L3l4uI22gnHrdb
	vi2P5ZfpEtjGLs7CUUSbthwJszhGzcPkxh8TYB/49bCrNzVlsI2Up0KIIYzItqf5xDPESf5f2vu
	eZn90yjpyCSrQlMe7sMX8uzPTI9kBZYBCOttCQWXLf9sSjk+Jc/3Mou4WztTk1oqMb4IqqvVf6B
	rgnuGqrHX5vg69G5pto5iCmSLF2Ce1xCqt2yqnwmkFQwSpSXc6A8KVEwSih/GlZn+5ZnjcndyrB
	g1xmpFSi/HxxeTFGIFo+pLwrYlwB2co41mUnOR9bHzgVveUkwiq2cPDXGkQD7wSGwyQBiCATJu0
	Cc6SfStC3chMm26GnHiCbUiC+lw9f2Y+DDHLOetnMB/oJESPKmVFeT/QpzI=
X-Received: by 2002:a05:7023:a87:b0:153:3c50:ab85 with SMTP id a92af1059eb24-1533c50abdamr6557346c88.12.1791159081504;
        Sun, 04 Oct 2026 17:11:21 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fa751693sm38784720c88.2.2026.10.04.17.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:11:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH] drm/exynos: fimc: allocate formats as a flexible array member
Date: Sun,  4 Oct 2026 17:11:18 -0700
Message-ID: <20261005001118.576198-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_171123_226463_193F318A 
X-CRM114-Status: GOOD (  14.02  )
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

The formats array is allocated separately with devm_kcalloc() and only
referenced through the fimc_context. Make it a flexible array member at
the end of the context and allocate both in one go with struct_size().

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 09e33a26caaf..079d24d0671c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -99,7 +99,6 @@ struct fimc_context {
 	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
-	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
 	void __iomem	*regs;
@@ -108,6 +107,7 @@ struct fimc_context {
 	struct fimc_scaler	sc;
 	int	id;
 	int	irq;
+	struct exynos_drm_ipp_formats	formats[] __counted_by(num_formats);
 };
 
 static u32 fimc_read(struct fimc_context *ctx, u32 reg)
@@ -1273,20 +1273,16 @@ static int fimc_probe(struct platform_device *pdev)
 	if (exynos_drm_check_fimc_device(dev) != 0)
 		return -ENODEV;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
+	ctx = devm_kzalloc(dev, struct_size(ctx, formats, num_formats), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->num_formats = num_formats;
+	formats = ctx->formats;
 	ctx->dev = dev;
 	ctx->id = of_alias_get_id(dev->of_node, "fimc");
 
-	/* construct formats/limits array */
-	num_formats = ARRAY_SIZE(fimc_formats) + ARRAY_SIZE(fimc_tiled_formats);
-	formats = devm_kcalloc(dev, num_formats, sizeof(*formats),
-			       GFP_KERNEL);
-	if (!formats)
-		return -ENOMEM;
-
 	/* linear formats */
 	if (ctx->id < 3) {
 		limits = fimc_4210_limits_v1;
@@ -1320,9 +1316,6 @@ static int fimc_probe(struct platform_device *pdev)
 		formats[j].num_limits = num_limits;
 	}
 
-	ctx->formats = formats;
-	ctx->num_formats = num_formats;
-
 	/* resource memory */
 	ctx->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->regs))
-- 
2.56.0


