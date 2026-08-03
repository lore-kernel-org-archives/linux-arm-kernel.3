Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F16C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JovHwWPJVIJjedVl1fvW+GGr92iYs5PPothHhlNSmKk=; b=u1caYRhK5TJJ43071hL1DN8sfU
	LeMUQkJmHGvUayvIufEN9m6lyrOQwoVJcSCxuTadzdomTd51GoJaTHGI8AYI/h8ksJvsPX6SXAj+Y
	4qX6Q2iMnK+nJf1HLQBkXGjA1+04pXo3l5X9SmwJIeVSfR8z3xvVHUO79KeycAsnHsMgXEzf78Uxe
	2MFBhKpHcipG2BnsIHHoiIqLZMo4eFb2wVdEu0TxItSaNyrcNjjjpJTUrsmKjTfv3mE2Wx3eh/Cou
	PMMC/x414xVFExsO65i0Y7oiev537sXsc5mytEKeD+snlIBCrV19LNIqgvJ4C5kg0zG/aZmRcCmA9
	Ct29bx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGD-000000001ns-0tPO;
	Mon, 03 Aug 2026 16:11:29 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGA-000000001kq-3h6h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso11097085e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773485; x=1786378285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JovHwWPJVIJjedVl1fvW+GGr92iYs5PPothHhlNSmKk=;
        b=bjHxzQeOSCJNu0Q/BJCtCUyA/+1Kry+EVckbUN/QECctKhtz5yi7k8MAmSWMBqfjFE
         J5UCl7giOfQ7AIX55hcazZTHasg2GGZE/dduf3aGphzDEEIcDEH2YvJZrFPLSRk24dwq
         Zcc1YOxzA+eOO3X5SzTgZDmY58/S9ipmdZjw39yC9KKT9WRJKM26o4RdH6Ml7r+1UlKW
         jVfO9tAppB+V5sCdiqGIKS5glxx77jlUEkuq4/uI3uFZeqJ1lnY1oGrX8rTHBJ7iZqMu
         vFMGt90vyFtr5kA2L6qOEcFJNh/NM5Xw22kF52DcA/jRUOcR9+EcepdYse2plI+WYym4
         jKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773485; x=1786378285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JovHwWPJVIJjedVl1fvW+GGr92iYs5PPothHhlNSmKk=;
        b=dwllfq8D7FNKrM4GsBAyJF31WmHxO0RGWc4xViziunuW7Zu6kB1kUWjaKxakitVJQE
         HJsOIIZKMtWXJbTIX+FzE10S6/+xzbKZHHh4TWeHjlmLZDVKVbSdR0j9DRRatfBUeOUT
         LnDjQyq6w4bZC8AbW1Z9KpEnOZ93hV1ovhYiAvZQoU3g25a9+mnMsfNbwroHPfHAu8bX
         GhSkjPzwVmetFVZnsnrWAV0F96VanB9D3TvzkjwyFxCTGSRbUT71hWI4D4klQMu5BGCs
         jfaUNDyI2EH6kl2/bLMw33vFPpsGHDFhW30K+/Y+wv9XHTowhK+BxCbzb8yWXn/DLRmt
         fcVw==
X-Forwarded-Encrypted: i=1; AHgh+RqVWPtB1YgN1rXJeV9WvFBq9gsM2yKTvfbKSDyCOMcSwJGsZHv6XWt+bKO8F+/vjMirq1qdFx1pmuvHhii88no6@lists.infradead.org
X-Gm-Message-State: AOJu0YxVi6+O5OaCYmJHFShB1F2VDnPVY4pvVjnEO0QSsFAmr3wuUf3c
	DUZZpBPoyqoDtC8m/9mDhHMzYxNBDtSXhTIo0yLtc66LkZ8oafI2gcyM
X-Gm-Gg: AR+sD10mwYtEAgtO0rwpoqdnbZabyvCkMYzAiHNvS9FlSoArfIi5MRniKUeUuijRN+T
	h2TBGUhh0eM6XA/dBKX6NxbuDip7ToU+boOLMuVKZ+FJc/GQuEuPjLvb3acg7bsaltbqrGQMVvS
	LP5X2QdfzyuKEbTACn9x+X8K26I4cSSou4JSeIu9wt1Qc5fCNy4Tw3riHIXdPQSQ1aPRv25QSvk
	0xbVf2GjaJXpwuZ6l2VXpFv2X1eJukuumP22czHJv+TSeB3zZVMgpuzyknyM4uw9s63Zdjcwmwn
	rOvgYDHy4bAYUEz1REDLmG9YUjYCQbC9j+oTectEJiBEwUQ4YnQ3eCODSREDofGQlM96A2hUCa9
	q6xvNrDUFI7SB/EGNknTyH6ddSfFyLUd3M7OZ6uEdV2uudGbQ+YgJp6QviE8qpYoyd/Flq/ImqQ
	XEPdjxZh90caYoU6n3+xTSptNOSibQHmVKJ3phv1vB/6Sjns1d5DoWucKu6CfFP7n+CH20JKlxr
	v23LcodZjN0YSHccYrZ/qBMhJwWI2CmGR0txQt+phvzc0xpV6VB5/chxWA+cJvMXsDebiOScaBj
	/M+anTI/Df6MA7KYnfcSplHm7ZYDAqpejNcpxUkvxB45108SBkJFgH98gCEXwKUmp5/dLvG2jtT
	HeuGXr1m4gOhh1NL4+bsEne0kMIyzj2YlXEORNol5WmL8/d2zLd3HzQqMmPWA10IPPyw1KyZT3Z
	frU0iMlOtAkKKl
X-Received: by 2002:a05:600c:4504:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-4980c66c9a8mr228536025e9.3.1785773484651;
        Mon, 03 Aug 2026 09:11:24 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:24 -0700 (PDT)
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
Subject: [PATCH 05/13] drm/sun4i: tcon: Set output mux for DSI and LVDS
Date: Mon,  3 Aug 2026 18:10:43 +0200
Message-ID: <7e9dad9eed2e91a79c4e1202caa8fed7c2427531.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091127_303105_72962492 
X-CRM114-Status: GOOD (  10.85  )
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

DSI and LVDS skip output mux setup, so TCON TOP cannot route the selected
mixer. Configure them like other channel 0 outputs.

In practice this matters for D1, where channel 0 TCONs are fed through
TCON TOP. The remaining set_mux implementations only handle TMDS and
return an error for other encoder types, as before.

Fixes: b9b52d2f4aaf ("drm/sun4i: Add support for D1 TCONs")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 960e83c8291d..ea7c90fef316 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -717,9 +717,11 @@ void sun4i_tcon_mode_set(struct sun4i_tcon *tcon,
 	case DRM_MODE_ENCODER_DSI:
 		/* DSI is tied to special case of CPU interface */
 		sun4i_tcon0_mode_set_cpu(tcon, encoder, mode);
+		sun4i_tcon_set_mux(tcon, 0, encoder);
 		break;
 	case DRM_MODE_ENCODER_LVDS:
 		sun4i_tcon0_mode_set_lvds(tcon, encoder, mode);
+		sun4i_tcon_set_mux(tcon, 0, encoder);
 		break;
 	case DRM_MODE_ENCODER_NONE:
 		sun4i_tcon0_mode_set_rgb(tcon, encoder, mode);
-- 
2.43.0


