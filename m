Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB71CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 19:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhJ4Mx5N84YekwfwtgsaM13tMkuKqezRguQA+ougb2A=; b=mfGQ2EQ60q8qI8VCmF3UlxoTnS
	mxQPptbaHLmmkdgQZfnuqDNFVD/U13ssc8j0fgzmjIlOCycqwBmAJH0AJdoQ5z0+68phTkinrdrOe
	1tVfhOG2Lu3mtkB4Ly6TofZ0jhFYT48r3562aXdVQ0ZQssYRh8C9J8nYC5XqZuy6Klkh6lpJ31uzR
	E40Ygexh1cCpiskjYR6qBXzBPo9QsNQ7PRHcvOW4Cc1YM8PU72Cc3cMIKd7qAaWdYQE9Rmb8TYqZO
	PaMhOOaOIo6vuDR3+pC2/TYyQc8ZffVRLuVnduvh9hz6DJeetAnIVDfu0F24aVWE68zTUSa31d8mt
	XqxbWFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81gQ-0000000BgqX-3gjC;
	Sun, 12 Oct 2025 19:24:42 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v81fw-0000000Bg4g-0344
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 19:24:14 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3ee18913c0so549782666b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 12:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760297049; x=1760901849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhJ4Mx5N84YekwfwtgsaM13tMkuKqezRguQA+ougb2A=;
        b=KddKHhWBiZoraF8k0dz55CmmH5gkckjO40cY1/x0+2BuQ1Y5ECzf4ZN/1WsymRi1J9
         U3FjOsItCN5vqbhW03NUw5E8O/SXmkLAem87mOK5vP34qjnikCfm91BEhFnby4seDJz4
         vxq82cSL+k0232DV1lJkrrTGt/fIstrKtu1WbjWSS86PfGUOtnD4jrYxX2bGcl9KdleI
         +Gtix96AvGG6g77Lw1Ab29AZnqJxuI3Jut1kTxPByuNo90u9oK7cP3gaOBDjAxyIR5Tn
         zvRYKzGMO4R5cLpla8VKUoKpG3r+vDEcBs7lnMCCzkXdnbskqR8xjHUlCm44/XWwOO3Z
         cd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760297049; x=1760901849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhJ4Mx5N84YekwfwtgsaM13tMkuKqezRguQA+ougb2A=;
        b=eD2uNN/hdLL648kEP24XjBKbZqCBSjl3jTsBLmCOlfzLB0saIR98jP7ItkaktifMAR
         OuqJ8BpZIYdE9GZj/eExXPW43M6j8wRXbwny3ERg6ud8GdMSWHe0sLuwU9Uh4bjET34b
         KrKxEU2cf8L8IQBXo4TVX6MR30yz6uiSo2A7uWq19UlIY8RW+lvvnZAkkjF2kkbmvtZs
         thSiqebg9aqAyf3slNNRGIidMXK1MfZEwBtvc+xYTSbQheWvaXbT5G6o0XbE9BgNfQ55
         cQBQZOwbQbORT/BKGvU7X3UmieigFBQF5L5V8erImsKTV89PIkzS14oRP3H9rFbNJRMU
         Xf/w==
X-Forwarded-Encrypted: i=1; AJvYcCUeKBBI9Y0oJVgKNfIqyY0mQrSHsQEkb8Aipi/wUoQljQp3RX/3X9sXIPQVaao85A4ZRJl92pJgYhyNNJuQ88jN@lists.infradead.org
X-Gm-Message-State: AOJu0YzBG9ZK0hlzE6gwjg5o9h5LSIKYT5IYde3LG+vSIgbw27OJZN8v
	yPXj1EOIImOQDe5vlW93h7QECT96l2zXbHoAkOiXHXzEtLlZdiJKsSbT
X-Gm-Gg: ASbGncvJuoJe14t9qj383vk1To9NSSSYoV1T29bgVCidOYfJnif7KwDD3y7c+XNsExn
	n00opFsfZZSJh/UocJCR3Ip1dZPRvGucsZIFj36yquAW0bbggEOWsxF0wHn3j9aQgeEzgYNmPT6
	aruHMBX/b3muXLqXE7qGR0UmEVHdtx1WwoyldZKOXYkt1SvHtpa+MRDwNdT/Xtc2rZAGRkmBrvA
	So/XiPIZDO2dT4aNPEPofw6IbsOJ0T2XfKgo+deLU0WEXqvoA7nrJs0BhEPC5TKRXC1Ai9CnUK3
	67ccr6yddkoXnAmnEVcvyE9yWSNd7HbNnI57AeAW615UvSgdibkuKtHyr4gweVluzSag585XLAr
	/J2WUcFrpLYmnmNyFPOubeMs1DLJZevmv3J3YPEHsbRm9EBZcHupsOW4m2SQf4P5B6ViCIQhpc1
	lhzg0AsqDenSGmcRByfnCaEiDdekYkNO8=
X-Google-Smtp-Source: AGHT+IFR0pZ/YrbCaB4kbdDAW62+ktVARq4KWPwTuGdcL/MYc6Uu9RhwoTSIe+WpqZdntWjE7guIfQ==
X-Received: by 2002:a17:906:1b47:b0:b4f:3c7d:ff5d with SMTP id a640c23a62f3a-b50abfcc8f1mr1504360166b.51.1760297049525;
        Sun, 12 Oct 2025 12:24:09 -0700 (PDT)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm760176466b.38.2025.10.12.12.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 12:24:09 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	wens@csie.org
Cc: maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 25/30] drm/sun4i: ui_scaler: drop sanity checks
Date: Sun, 12 Oct 2025 21:23:25 +0200
Message-ID: <20251012192330.6903-26-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012192330.6903-1-jernej.skrabec@gmail.com>
References: <20251012192330.6903-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_122412_199452_D2738B7A 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

They can't be triggered if mixer configuration is properly specified in
quirks. Additionally, number of VI channels won't be available in future
due to rework for DE33 support.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 2fc54dc20307..c0947ccf675b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -132,9 +132,6 @@ void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	if (enable)
@@ -155,9 +152,6 @@ void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 	int i, offset;
 	u32 base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
-- 
2.51.0


