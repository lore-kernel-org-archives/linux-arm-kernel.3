Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98013106F314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKCyFU3ic+mjTuSY0uUxaZ2dkgAoaG2cSvjjvcWGNkc=; b=wUmPirlc5gUqwuPV3te2dO/ILh
	7Zbkc0ZsxQTNYmsmjNT/hSQqJmjL26udXM3RsJ/DjjqHuh3s8eCzYCvTXqGFAdGuz4d3SCXmeaTaj
	nzXTXrs6aSO4bvODYaeVIkvpEihPBU8Op2grbEyjXdQlJoi20HlutQjhyObXdezUp9Agsn5K491uq
	LguYSpSv8TMfcSGr7wRtDRMipBJP+9deTmYqokmPnCoO/VAkvaweN/5/jFMZsg1PlcjKNPvYhYF3k
	Cc4JBHp4Ka4EheLn5mk9quLpfgpvDsWWiOWE6l/7yPfJpW2POCwqRtSz16E5p2gHikwM2fJapTNN7
	X+xbDFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFM-00000005AbX-0KUK;
	Thu, 26 Mar 2026 09:43:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFJ-00000005Ab5-2eXF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:43:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so382768b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518200; x=1775123000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKCyFU3ic+mjTuSY0uUxaZ2dkgAoaG2cSvjjvcWGNkc=;
        b=OkEXk7jOxWFUev7+daYozWhfs5bt7btbpTxF44Ouigs8c3P7iiACXCGCkXxwIhU109
         G6d6oW7uf6pcMKMdHzJ1sajZbojLyO1k639CmxL1iQ4vKwl5s+MxICCYWZPmsU/Rwc+j
         jVIdDxSdFeRumKTvJYulSaqjQrv7pim7nqo3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518200; x=1775123000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gKCyFU3ic+mjTuSY0uUxaZ2dkgAoaG2cSvjjvcWGNkc=;
        b=iY3JYTMfwnINCEEW/2xpCoBO5Is6d3aj24Kyrvn6/QhJ5f3GgVJkQdT0dcgLCllFig
         C+SAs/ILUO+vPgGNrIF8RYGPpdxD/6b60rut3anVtN9wVG2NWPrAGkLoqnM41KjaZiGh
         LHz5irnl1ElSfiCHLrua5watWxe93DiajvgxkB7Yt8IEgR2XGlPSlo77OoVHRfBMpAKQ
         6pni2fCpM0P907XCpTrNHcJSe//82zgyQRo+g1VkiS8/hRjqxgXY/UamLiAgREhMagEY
         PE9B4C/+ah/w9CEF08pTPWuKLxlzN942iktyY5WODZePOPS3hW21OiF+6BJkPak46IMo
         acpg==
X-Forwarded-Encrypted: i=1; AJvYcCXZbNIIbpvzO2aQJRJ1OP+opEj1KA1c3gC1HCwlHa2sJi2TjeK6VW2KFi2Q8pGr6yguQZiG/AqfO3dhTpclEPmK@lists.infradead.org
X-Gm-Message-State: AOJu0YxlxpeKkUx9bw/7ubZwQEMBqpHmrjeO7mm2BOC/Bqg2avQNMkj+
	XBJSPWaYYk2ZJHFumJ7st8zF4S7D13+p8EeCmYxAFy4FhK7vv/qzVsc+gzh4Tnz55Q==
X-Gm-Gg: ATEYQzwG8wt054ANhSDFEeICwKAeCfWCuCN/NXSVZzvzqSl3FF+9YmpgIu0BPBE1o2I
	ehkeeGUx313NIZfPKMCFGsQkQodseVBTuoKOmybtl80rbd6M1rl929sPVTYkj70ypCtexTC0AM/
	0/wF9zbZvRevyZPAui+zQPmaEhT+gRBHmQy7476wyEBe802qFk736Qa67WECKPJ6iM3sDQE58Tv
	Gp4VNOVqqaH99vNW0Rk/SrcfrKJ6kVAkkNC7kCZSWxM62TNnK3vHpO30PZ6zlRf+PyrE485Gxmj
	BDmZhICfCupt4zT3q4JmCRGVDPcZGv7l4rU/2ZUXScqpH+tzz+67CXyMrPSP+9lhAee+qqQ5iKB
	DXeUKHVNUioW0ntUMwIcHu88yEpR03/mV/oOJLEJK6/8CCzpRRkgGanEKuckMs8IyTYB9NyC99t
	qJyVGcclCdw4A++EP4Xcs9plkOBf9vS5BRddtcrUscYxJEJ58OQM8EzzQg4UJZqtaU1zr1BT8q7
	ff7zpNqWOkZldKxVTU=
X-Received: by 2002:a05:6a20:7491:b0:398:9379:d056 with SMTP id adf61e73a8af0-39c4abeac6amr7815749637.16.1774518200463;
        Thu, 26 Mar 2026 02:43:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28fasm1673312a12.7.2026.03.26.02.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:43:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/exynos: Internalize exynos_drm_gem_free_object()
Date: Thu, 26 Mar 2026 17:43:03 +0800
Message-ID: <20260326094308.1161335-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326094308.1161335-1-wenst@chromium.org>
References: <20260326094308.1161335-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_024321_725558_D2B522DD 
X-CRM114-Status: GOOD (  14.09  )
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

exynos_drm_gem_free_object() is only provided as a callback for GEM
objects. It does not need to be exposed to the rest of the driver.

Move it above where it is used and internalize it to just the GEM
functions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 10 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  3 ---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 69ef6cda1ce9..59fd736a1fb9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -133,6 +133,11 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem)
 	kfree(exynos_gem);
 }
 
+static void exynos_drm_gem_free_object(struct drm_gem_object *obj)
+{
+	exynos_drm_gem_destroy(to_exynos_gem(obj));
+}
+
 static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
 	.open = drm_gem_vm_open,
 	.close = drm_gem_vm_close,
@@ -318,11 +323,6 @@ int exynos_drm_gem_get_ioctl(struct drm_device *dev, void *data,
 	return 0;
 }
 
-void exynos_drm_gem_free_object(struct drm_gem_object *obj)
-{
-	exynos_drm_gem_destroy(to_exynos_gem(obj));
-}
-
 int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 			       struct drm_device *dev,
 			       struct drm_mode_create_dumb *args)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index 79d7e1a87419..8b5bd20ae8c1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -88,9 +88,6 @@ static inline void exynos_drm_gem_put(struct exynos_drm_gem *exynos_gem)
 int exynos_drm_gem_get_ioctl(struct drm_device *dev, void *data,
 				      struct drm_file *file_priv);
 
-/* free gem object. */
-void exynos_drm_gem_free_object(struct drm_gem_object *obj);
-
 /* create memory region for drm framebuffer. */
 int exynos_drm_gem_dumb_create(struct drm_file *file_priv,
 			       struct drm_device *dev,
-- 
2.53.0.1018.g2bb0e51243-goog


