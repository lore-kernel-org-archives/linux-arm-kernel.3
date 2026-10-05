Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496EBCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 00:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LFk7ga35z3NrHS6umKXq0xUG3dzK46r7JSMoXY1ndGw=; b=fOfgsPK06+NDi/75Rw7yUYSDr0
	B6s739Kj4odz6hpv83RYTXWUS/Bw/MkklaVBzg0lNX3MczECZ2SRUsXQ2oOJA9wzuuYnxEqb27fWM
	a69012YnplseBV/zSz3WurVthh84XhRpULOBu9QklaB1HGfiK6c1diP9WuX4W2KxU0YHp9Nj6SY0L
	we7gl4smem/lfsBJf7qMM+hP2rDrP8IeRgHrO90ZxWJnbLdYReMQOzLSlp2k75wzzDaSLljtK2zGV
	P0q/T8SXRRsEaHM7oM+mtoWux/Yx86sCA99/Fp1lElAryPVtmJsBcT4A1GNv3Ik/KnNh6lE9Hjns1
	M3IuaxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWJ3-0000000FVSk-3EX0;
	Mon, 05 Oct 2026 00:11:49 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDWJ0-0000000FVRy-2UEq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 00:11:47 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-3510b42f4e3so1186255eec.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 17:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791159106; x=1791763906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFk7ga35z3NrHS6umKXq0xUG3dzK46r7JSMoXY1ndGw=;
        b=j74VYVrC2fCUMK/rWGrasEjOmTVoYlUzgKqfMfucgcMwGsWEVOVwS10Jwn9lRRuiUC
         CUIogMeWnqn9wkB454llgEtOTCPSMLAookqXzaOJHGjzfAsO2RM757PF4H/pzHfTto2k
         622p/jMoTZxiswFaiopOTrmlr2RAtY8dEcM0dSIn4fUNEMhhoGS4WX/RUQ2vX7/QvpeW
         iNVO3xIowlW/QyWVQoWbD+2eZFuIQcjzn/xCyd6fR1GgcXJ/0LWRgH4KYTa6MOaBKVbS
         yI854tD2UG8UvUkPROquZ9nsJ8bVbnzmeOFop26B27K8m4hvkP0IajfRsPtUHv1DzJXX
         AZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791159106; x=1791763906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFk7ga35z3NrHS6umKXq0xUG3dzK46r7JSMoXY1ndGw=;
        b=GbNir3ST2uA51mXCnNkouzjSkgcxH7dKBAF5jlQrGfp6Fu6Kos6uMJnDUMurmMXLlT
         Z3AqWsEv3mcGtswlb9dXtbChVL/sNOcj7C0u1Oi+MC4sE9BUcdss3bXZQ06qfTAp4NsW
         SjbgJgMj7UEeQYSnzlwxOM+bo2G6Mbu/16Y1ImwfDEaX8Nb+/RH7x8R4Gh4IglimHoxj
         EQ0LgsY3nzyvE3rRQzaNJC9US31YMKbNGZ6n0zH+dGbe3C7EqJUzdtzcG1EHk9u3wfjk
         4CwxnlMo5nlmpx7qajtAYNf6YV8vENTuecC3aHHHn3r0kXsukGEuVVBbVJBo+3XlKlkB
         0YEw==
X-Forwarded-Encrypted: i=1; AKwUvBx/MUZ/an+UgtDgMV+7mezrxei5rmLYziNbIEfeiMavuJILnyfKyHgHhSZOK8psimsKK0cdo2X0rWw1XHbRqnO0@lists.infradead.org
X-Gm-Message-State: AFuF++k05L7sFV/npjKa8cjdg0TTlANbKgBeTtl3tz8CbboqPpGP7Df2
	zhH6aOe5hDPzHHg9z3gBQ5SQ+rhySkC5Q42CAo/ojr8xwkMWFDRtc8Eo
X-Gm-Gg: AYBFou2GBskelPBccPV9BCaNKDxKvHx03+eOhwc2dYTCg0oKIk+9AsBCgv4rBF2pqR0
	59dT4KNRCl0pciJ5c0Hi95thhAKy88+mbVEq2CRCzZfcMDibMTHE75aaY0CEMwLbQnQkpNX7tFf
	b3a2dBsEXy4vbiuTw2yb8pfA53Iwt0N3ccow6+VDDqJmaBN95LL65dDdnmylJtvhYRCsq208iPO
	JXWnhZ3kTg4TWa3UcnCkkXh+BW1yeJRnTJ38Jl1w1U4+R9asWQKEK0WxhN/r45ukqjOPkjkiS02
	c5DPu30Wj0fVkpi3N5VuwGAFxu+1MB6fexm7mg9Nls4fnbl9L04DT1cxmZ4oI/M8wSj4ock/Wue
	RTGMWOQbd6uD2OlmwQLnjNWnAZ/QN0LZsa+h07wA26IQuNyPZlJujwLiSlrj+UL+Tn2f67Jequa
	G8UcJqzKqiWK1d1ur63YrapDCbyRYsRaXTfSZb+juepvCT42ve9nfVDzoh7LW43t1brRRde3u1Y
	ii3BpmDf7bSyINuK9JO6k35AS1S4FfZnKCqE8yfvlJejSHJyTzU47/KOEO5BkN8ai39Hr57V1TI
	5Irz58u4WGFhs+vJ6XHKkbmC3x7W/ZTXz1PeSrTN31lEnisw
X-Received: by 2002:a05:7022:eb47:20b0:143:7001:7643 with SMTP id a92af1059eb24-14f5cdc92f3mr12086833c88.46.1791159105797;
        Sun, 04 Oct 2026 17:11:45 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39a6cbsm16540732c88.5.2026.10.04.17.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:11:45 -0700 (PDT)
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
Subject: [PATCH] drm/exynos: gsc: allocate formats as a flexible array member
Date: Sun,  4 Oct 2026 17:11:43 -0700
Message-ID: <20261005001143.576737-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_171146_640512_B84FBC47 
X-CRM114-Status: GOOD (  14.73  )
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
referenced through the gsc_context. Make it a flexible array member at
the end of the context and allocate both in one go with struct_size().

Annotate it with __counted_by(num_formats) so the array accesses can be
bounds checked with FORTIFY_SOURCE and UBSAN_BOUNDS.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index d9637ddfcfc4..f1807ef664e1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -99,7 +99,6 @@ struct gsc_context {
 	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
-	struct exynos_drm_ipp_formats	*formats;
 	unsigned int			num_formats;
 
 	void __iomem	*regs;
@@ -110,6 +109,7 @@ struct gsc_context {
 	int	id;
 	int	irq;
 	bool	rotation;
+	struct exynos_drm_ipp_formats	formats[] __counted_by(num_formats);
 };
 
 /**
@@ -1222,21 +1222,19 @@ static int gsc_probe(struct platform_device *pdev)
 	struct gsc_context *ctx;
 	int num_formats, ret, i, j;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	num_formats = ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_formats);
+	ctx = devm_kzalloc(dev, struct_size(ctx, formats, num_formats), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->num_formats = num_formats;
+	formats = ctx->formats;
+
 	driver_data = device_get_match_data(dev);
 	ctx->dev = dev;
 	ctx->num_clocks = driver_data->num_clocks;
 	ctx->clk_names = driver_data->clk_names;
 
-	/* construct formats/limits array */
-	num_formats = ARRAY_SIZE(gsc_formats) + ARRAY_SIZE(gsc_tiled_formats);
-	formats = devm_kcalloc(dev, num_formats, sizeof(*formats), GFP_KERNEL);
-	if (!formats)
-		return -ENOMEM;
-
 	/* linear formats */
 	for (i = 0; i < ARRAY_SIZE(gsc_formats); i++) {
 		formats[i].fourcc = gsc_formats[i];
@@ -1256,9 +1254,6 @@ static int gsc_probe(struct platform_device *pdev)
 		formats[j].num_limits = driver_data->num_limits;
 	}
 
-	ctx->formats = formats;
-	ctx->num_formats = num_formats;
-
 	/* clock control */
 	for (i = 0; i < ctx->num_clocks; i++) {
 		ctx->clocks[i] = devm_clk_get(dev, ctx->clk_names[i]);
-- 
2.56.0


