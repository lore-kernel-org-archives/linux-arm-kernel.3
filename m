Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8EDC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8mU3xQ3VaqFI9TKErwKoPI9PJbEs0xdMOgJUVHqdkY=; b=qx9VZEakZt6sPyNqK+/pTXDyZp
	jkc5tE/3iDjWK0EzSfSzZGkNwjgGE1cBUkpigvkNFE4VrCOG9exTou/vLB1uikuu2HyYs4kwBbDU1
	xUFtWI7cErRMu5qfOmJuW68C5A7wcvPqQ4qW2c9gKhBLcrDZxWqgAeA9YumcuzTWMLMUNRjFsJVUw
	Td5LN7C3l3bQKRTJTr7Jakd3+hmOAbMQTNAZYkhiewFHpKu8jbP3e8JioFmNPZFCqP3lb0pf7VcnI
	SDz4TTuiCbFLQJT0ss8rVv5xaN4gwu5/GJsnhpTPtaSHH0szQGr4HAd0fQrzWnuXnkPhbgDhEaIBE
	nQ5NnBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvG7-000000001jQ-2T17;
	Mon, 03 Aug 2026 16:11:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvG4-000000001fk-2YZG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-496b7622a83so15115385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773478; x=1786378278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R8mU3xQ3VaqFI9TKErwKoPI9PJbEs0xdMOgJUVHqdkY=;
        b=hwa8135EdF/gGeP/jEsBU/hOVnISMNYSUQSdZq5YERYTlz2oJ7HTMEKUT4rcQLnuva
         zT8622rMOac7Z2vJLt9cxTuaZueFBWZBxYbpsdxbYcU00/lIxNeO5E6SCH2mo7llp7zY
         iWz2t0OgLut8Py9Cy2Kq25nqmjfFszP9zXqdTWI3w9fIcDr+h81dBY4BGDgYqFO4Udku
         AGVvo+TewdCYkbx+lq8uy94FcRJVd/S512f4Q/vLm/M3fxRBXu57JoFGsAn3MDv0Uglr
         MEhuB/YiqwQYLIVKPCL+kWYbmRcbLYe4vLRURcJhUfjaE2NN0eUjUEaZGCD1WUhXNk1t
         Bziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773478; x=1786378278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R8mU3xQ3VaqFI9TKErwKoPI9PJbEs0xdMOgJUVHqdkY=;
        b=GMdZKHYfh5+byCDPLtcgbrSJhlGd+5UD/axVL6M9pXhg7zfn7r9WS6satTyLfDL4OK
         Q2fueGnr1bMilR0KoxnsFjlzGiemuknIVG4NHYvh8n5ZioFyFS0c/HUemMPUPU0yuZkG
         qsX9FpK6087+Ni/UlITjs7zQSS+bSPu4uGdUgnD+SGS5BGtQZPZH33k8/7YFrWGu5C3H
         clK2s+ZXNLMeOOWqSg7Sa8iLgrq+vcSPTZQlQfP9IhgU+tD5r/UJF5+w9771slaWVM8h
         F+U4v7HPxZnGSgEEmaGeNwRZqDnj6zanem/to17nowVlzy9Qk6eTsT0WbDL3Db0Ziu57
         6gtQ==
X-Forwarded-Encrypted: i=1; AHgh+RpL9LBzJE0B/IEBdF07zhwoYTV2sea2o8iWlD+InFHb+euYahkkPE2xiB4teGbkAeSWUxQZ1gSDFzLowEvXgX8u@lists.infradead.org
X-Gm-Message-State: AOJu0Yy89Hjy96cgc8/LjB9a1kB36DV7xjGpkIPXSN2LAcOPd5n7uiVV
	WA5P0MYV3lDx3rKgvrUyKrNf+fvqOobm8e4X2fuj6OKtpSRWLXu4cF73
X-Gm-Gg: AR+sD10hrTGPzj/KpcxyxMygGI6/PbdaKZJn6Jq8Z7XKaueYAbwTjtIUAHIqES7hCSk
	oCbjhnKVqwXP4UG6mQBwtYKZi91t39qBrp+9vs6E8qephNk7na08iAK4xYC0VQI6AdJMfiosx4g
	mArrLvhCv7TY5A+pfAtZuRibEQgwFUxFwvBeUKdOl5W7pnr+NtY115LnuFcRg9m3Nb1bBmkbeB5
	EsU9zoDTO4oqfSDkJtEPGcupYProyr9bvFE7zQZmu1pWjZD8fFkVA/YyWQD2RLPUiU2Ht6VCf8u
	MqZ18Y1+VlLgKEiB8y+at5nJaoSHfmy2smHUU87HYtbiil7U2kxdR+Jv2z6Xclsp6pC449wVpgN
	r2hf3MmjRTZor5ARJXfgJ38h4JojbXFP6yUL8dhMYUSnZ5H3mGrod9FbXOXsWW8Ewbn8WaSkCIG
	FIpzcfyY0E3dyfEoEUAat+4uFfEpZYkpoInyre1Y6+vDUn7hFZ+3wfZfhSq9tk1p0FRapv3mCJ0
	RSMCYLzeKLuj6iRpn4w9+jhexVP3Xk6nbvNRsHarBEu4bYgHcWKLAB6L/cxuybDvghGMZ+PXPcn
	zNXF0AKnKywiZMIZ+Sk/eYKSOeHg2BXiUtjC8DRRIcvJbBsFRaClr/E3hyITe740EtNRZCe2S11
	Dz0OsKEaIAhu/QraXBcGvKyTD7Ztk/wQ3qWrCYp3/xMJzePqjTJFzj5hkfb8fAa4QSGpArVmdYg
	FrGg==
X-Received: by 2002:a05:600c:8b43:b0:496:c93d:35d9 with SMTP id 5b1f17b1804b1-4980c66b45emr202147415e9.6.1785773478485;
        Mon, 03 Aug 2026 09:11:18 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:18 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 03/13] drm/sun4i: vi scaler: Restore opaque alpha in video modes
Date: Mon,  3 Aug 2026 18:10:41 +0200
Message-ID: <c48ba85b9e4478d51afde4f36839fd1c1d363b23.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091121_204395_3E0F5276 
X-CRM114-Status: GOOD (  11.44  )
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

The DE3 mixer initialization clears the entire mixer register space. This
also clears VSU_GLOBAL_ALPHA, despite its hardware reset value being 0xff.

The VI scaler uses Video Normal mode for subsampled YUV formats. In this
mode, VSU_GLOBAL_ALPHA provides the scaler output alpha. Leaving the
register at zero causes the scaler to produce fully transparent output.

Set VSU_GLOBAL_ALPHA to 0xff whenever configuring a DE3 or newer VI
scaler. The register is ignored in UI scaling mode.

Fixes: c50519e6db4d ("drm/sun4i: Add basic support for DE3")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 2 ++
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index d4412a62c2f0..a5cc99981006 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -975,6 +975,8 @@ void sun8i_vi_scaler_setup(struct sun8i_layer *layer,
 
 		regmap_write(layer->regs,
 			     SUN50I_SCALER_VSU_SCALE_MODE(base), val);
+		regmap_write(layer->regs,
+			     SUN50I_SCALER_VSU_GLB_ALPHA(base), 0xff);
 	}
 
 	regmap_write(layer->regs,
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 245fe2f431c3..d89c0cbe188d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -36,6 +36,7 @@
 #define SUN50I_SCALER_VSU_EDSCL_CTRL(base)		((base) + 0x28)
 #define SUN50I_SCALER_VSU_ANGLE_THR(base)		((base) + 0x2c)
 #define SUN8I_SCALER_VSU_OUTSIZE(base)		((base) + 0x40)
+#define SUN50I_SCALER_VSU_GLB_ALPHA(base)	((base) + 0x44)
 #define SUN8I_SCALER_VSU_YINSIZE(base)		((base) + 0x80)
 #define SUN8I_SCALER_VSU_YHSTEP(base)		((base) + 0x88)
 #define SUN8I_SCALER_VSU_YVSTEP(base)		((base) + 0x8c)
-- 
2.43.0


