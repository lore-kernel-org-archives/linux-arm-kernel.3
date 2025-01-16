Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A7BC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 17:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uBtKYlWCmsTWJXAsi/P2qVR1BJEci/r4rzSkSdKkiNI=; b=Vd7/GiEgN7F37tvsToK299tq6L
	1046m+06QzPYxxYufnYKqI6Xnz3HhepCMEwuwqgQjwz6Ufx3dV4r+qoON3TtdvVU0tUR7LX5QccTV
	THF8KQidJoB79RvqzVh+FIyaVyDQJWIogQu1C9BxXzBBQCT/QMVmlBycSFkyI2rGd8QR9Gx5z1vI6
	er5NORMdH+3p5mIZd4zJSXYs5bf1tC80a6D80LPh8LYghuFm7fONUmriR/BZ2yAmBIamTwNWT/i0H
	WNJxOuuWstVmdx0SQBLR7n7kfZIj3ufmZ8b14/VCJ7sxHvDxfJpeW39k9qAznbvio421AmCEeQaZv
	tzQBstgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTv8-0000000FiUg-2LjJ;
	Thu, 16 Jan 2025 17:44:42 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYTtq-0000000FiCZ-3SOy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 17:43:24 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21628b3fe7dso22978715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 09:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737049402; x=1737654202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uBtKYlWCmsTWJXAsi/P2qVR1BJEci/r4rzSkSdKkiNI=;
        b=PAe4sUivB5LVKdBIRBb9grsil7ZbWSGlicuTors1a2idxqpQzhCs2NxU1BJlZsKEPA
         9uFFftla+3XGuN/0dq2X0CTkp9ij+QrJh45VHuv1rszfdXYvjeO3VOprguQ176Fh5u/d
         2hkM4g1aoaktdhMMMPak2JX3FJWpIPy2wVVuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737049402; x=1737654202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBtKYlWCmsTWJXAsi/P2qVR1BJEci/r4rzSkSdKkiNI=;
        b=CiVXz2CiepGZOwq3P3F6UvrmXYdmcq7YV+zjaPqG9Ft0rTgmC4laeda2LrxItAnJos
         UnCoVPKlSN2MSSVDC3tN0OXFi6E+igi01UzDkN9un/pccKvnLsjGR1S0Fs9iAWAGGOav
         3OfEZW4HWx7Pkx3LMZabl52TxeDjY8vSi1ZfTC+1ettM+y+q29xwhers21aWqkBcpE34
         DL+jNNA1rHkXAZ9lI+zjpvlN8tmP5yoxiZAnYNhhV1hE65vJIfBFCd0yeV5IeSgUp9xJ
         QVolqnGowVaZ9AAz8zWB3epY3t7pITqqzOUIn0R3BZK5bKcp4WSgIMTJYGO6UqadHTAe
         keyw==
X-Forwarded-Encrypted: i=1; AJvYcCV9XY8M37ics0YxnN5MKKnHiKvvDLIww7tP/HjyoxW8cavDN/8ZoCRGp4rkJXGpC2CN1lr4/7I35KleyzsQLylP@lists.infradead.org
X-Gm-Message-State: AOJu0YyQEAe/8XpxVBohbnA4PdC0UEi7Qg5jd3qnFoHJyIKTEplT9/un
	TthoSVczrAreK2AJwqWK3WZZOlzS9aUzYUYgksGX3gsXQt+/eiXxVHTSsPzSMQ==
X-Gm-Gg: ASbGncsTM8tOdlk/LFrAYklS564B2u14gnxbmxudKOGty1pbYvfzM0yW+8x3nQyACL0
	IlaJJYy3vgE0sfwNorhvC2swroSX/d5Z/XUyzwc/i6SKsHL2FSDsJpG1yhinZJUvb5OZioy7/cb
	hFvwKBmwhUVvYwe+og/+CibCua4dc+ryIw++x12yJ2o7I22CszEYuDdOQVNGNzn3QZ5LLWErq52
	Zzdw6/VNpydS8L7Nz1yQyw+EtVUCDeCRrjGaZugBprMXOIw6OomaRpQ9ySJsiLiEXQgNoVi94ux
X-Google-Smtp-Source: AGHT+IEoWJyIWX3XBujOXaws+wrtmniQvJSQSjRB+r+y96gKyl0M0uolS/sv8wolEPPpMrJANi3UYA==
X-Received: by 2002:a05:6a20:2593:b0:1d9:aa1:23e3 with SMTP id adf61e73a8af0-1e88d2d5e64mr65470929637.32.1737049401836;
        Thu, 16 Jan 2025 09:43:21 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:8dc2:8743:5c90:724f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba4956esm259207b3a.128.2025.01.16.09.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 09:43:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	David Airlie <airlied@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] drm/mediatek: dp: drm_err => dev_err in HPD path to avoid NULL ptr
Date: Thu, 16 Jan 2025 09:42:50 -0800
Message-ID: <20250116094249.1.I29b0b621abb613ddc70ab4996426a3909e1aa75f@changeid>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_094322_890719_A9F69B41 
X-CRM114-Status: GOOD (  16.93  )
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

The function mtk_dp_wait_hpd_asserted() may be called before the
`mtk_dp->drm_dev` pointer is assigned in mtk_dp_bridge_attach().
Specifically it can be called via this callpath:
 - mtk_edp_wait_hpd_asserted
 - [panel probe]
 - dp_aux_ep_probe

Using "drm" level prints anywhere in this callpath causes a NULL
pointer dereference. Change the error message directly in
mtk_dp_wait_hpd_asserted() to dev_err() to avoid this. Also change the
error messages in mtk_dp_parse_capabilities(), which is called by
mtk_dp_wait_hpd_asserted().

While touching these prints, also add the error code to them to make
future debugging easier.

Fixes: 7eacba9a083b ("drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Unfortunately, I have only been able to compile-time test this code. I
hit the NULL pointer dereference on a device that's nowhere near
upstream and it was running (sigh) a heavily modified copy of this
code where the eDP stuff has been forked out of DP. Specifically, you
can see <https://crrev.com/c/6073744>. It's pretty easy to understand
that the same problem affects both codebases though, so I'm posting
this "blind" in the hopes to at least fix upstream.

I'll also note that the fact that mtk_edp_wait_hpd_asserted() calls
mtk_dp_parse_capabilities() feels weird/wrong to me based on other eDP
code I've worked on, but I've only barely looked at the Mediatek
driver and perhaps others have already debated this. In any case,
that's not directly related to this patch.

 drivers/gpu/drm/mediatek/mtk_dp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 0687672f0e52..ccd104d8851f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1763,7 +1763,7 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 
 	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_MSTM_CAP, &val);
 	if (ret < 1) {
-		drm_err(mtk_dp->drm_dev, "Read mstm cap failed\n");
+		dev_err(mtk_dp->dev, "Read mstm cap failed: %zd\n", ret);
 		return ret == 0 ? -EIO : ret;
 	}
 
@@ -1773,7 +1773,7 @@ static int mtk_dp_parse_capabilities(struct mtk_dp *mtk_dp)
 					DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0,
 					&val);
 		if (ret < 1) {
-			drm_err(mtk_dp->drm_dev, "Read irq vector failed\n");
+			dev_err(mtk_dp->dev, "Read irq vector failed: %zd\n", ret);
 			return ret == 0 ? -EIO : ret;
 		}
 
@@ -2056,7 +2056,7 @@ static int mtk_dp_wait_hpd_asserted(struct drm_dp_aux *mtk_aux, unsigned long wa
 
 	ret = mtk_dp_parse_capabilities(mtk_dp);
 	if (ret) {
-		drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
+		dev_err(mtk_dp->dev, "Can't parse capabilities: %d\n", ret);
 		return ret;
 	}
 
-- 
2.48.0.rc2.279.g1de40edade-goog


