Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1061C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2K51/FwVv7xc1HWMtJnTlI6NfH3sfU8zC/PFmRYZpYI=; b=1zfo5zFCII78reZN8facajyHrm
	B0ppdQ66sCvENZq/nThA5/6FEA5xFQPwfczVv71hDRo0sYFnBU9vJvk2X8NjV09XjAC8LQ6bgCZlh
	4jJXaYUUE+WghyheZA+3A3wi/OV2O1jdFG1eZbYy+B8gpxLWgKD7Jz3X/zbWRohkQzlqNzsKlJDg/
	3qFyRUyqkErT99dI1JeQAm/O3ubB8HFwBFxpQNS9V7ZNhgFVx+I3SePw67FwvpgqDMorL2kDqshSd
	f42WI0MqcKW3g1IqEKho5IZIC9OP0HqLtEysxiwkgRVS7v+LPQPYtOU9wUE12WJ2IgwUjakGa33aZ
	gMpplgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGL-000000001uo-32Mp;
	Mon, 03 Aug 2026 16:11:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGI-000000001qs-3M4s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:36 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4954df200ddso15187545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773493; x=1786378293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2K51/FwVv7xc1HWMtJnTlI6NfH3sfU8zC/PFmRYZpYI=;
        b=Jl2g70lIKogh21Vo7QniDXUqyLSXIaWuJtqiMi3j4Yy4cvVLeYHHm8MTKUsPHc/Vik
         lN8BdNSIiMvsdVmcpHD/lMOxOZNZ2jjNPlygBYodpxTH2KgfUqWgLld+Wvg7tW03vuic
         JBf7GUsF7ce9vFZ+DRZoG9ENhUWu+S2+B8ORK8ttW6v84XbB/LODfaX5Z8aeWFdZKsRK
         yUp6juo3HanDfjeJ+/ngeWqMrBbW8J+n18xvj917+hby47BV07SKblUgeQBPhRaXiZ7S
         AaPBFwl0JhskCfGxLghxb756OqJd0rAYYbFM3yIdVjfAJGU+DCfVhhHQo3wDoFHohTnS
         4UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773493; x=1786378293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2K51/FwVv7xc1HWMtJnTlI6NfH3sfU8zC/PFmRYZpYI=;
        b=i7unf+W/K9xDf8U/GcmSqDXdcjmtSj7Lq8nyvCOus7OZEYEMS6M9MR7YtBh4vn1K49
         yF/evrmmJBvXuv6So5DG/CHonk7iOD6fF9NunKpKR9vsd3nVJ2bSFrRMOKqIiNJfUbzx
         OYt/yb/QWmtuJdER2K7FZ2QXOfMYI4P9V28SxNbE9HczBgcI22slO2jn6h6GfRjNdy5n
         TXot/9EDCHtf/oTzZ6uPwgGsYAzQu2oB4AWmf77Dq2rYDt76bjCr8/eBwlMKgzkwWsdA
         W1yhRwS5coGjMc19ARZoj4yK6YehTfhh8XccbkqdsJUFQAMtY+i9W30h7NShiQFS4VYV
         u02w==
X-Forwarded-Encrypted: i=1; AHgh+RqgW6kN5r7bVrqPqZ0BUsEg28nt9e/2wRYLQNHdVdeXyCOhNE6r/eI83gx/kMnI1VCWnaGK4LoH2nvpeZk6q29T@lists.infradead.org
X-Gm-Message-State: AOJu0YyFKSixDbX2WvW5VGpQGS6I/MDLN77AIiKxok3kfbnDBq1aavn1
	wutOenS/aYaQj8lIamU0t6hNMleGU7QSEYfnEuM6jZz0y+JbFK77dg8B
X-Gm-Gg: AR+sD10i8RplUFt/T3JPPmfTPCEoy1mnn/QCShNeSamS3elIfiitGvz6mnXMCylqWs+
	TcVw9egxwhx2qVJ6J9D/NjamJZr9thguyWUT/hJ/UMtkvNZjxFrKz19ZH2CVEnG4sEUnOmEOeCW
	+bnbUlKCxPAU0pmBI6/tSppqyOmD3hTThTRN6R/sUcieyyCA1lClEdqeUluB5tHMJcWdxim31xE
	3598is4SqRWx2336861XPfojTdjxbRBRdUll6tVJi082iTeqKsqijg1bh21AQPzrhZzvRWAG6PC
	Z3SsZo4h887kuu1pUkoyjTGnSEoNtmeVD6JAyFe2Qdbdj5ZZGe9+Czpjo2FdkWO0RU7+gkg36Ml
	gBmHQr8J6W3PyXR7QTGnuKQ14yXuOz83mzMBTfge8cvR1oH2m72prCoknmsGLnlcizrL1Qje/wO
	kQUbg9BJy0X2HWKg7lxE01y35X+uv41RP7Fc+BWdH5VxewOOp96DplpSdxW9bsTRoobORIN80xU
	xX7SdVCw8tSRUE5qNQtCwgkqYFZtWlGiOVNsNMHDFpe8a8xdmU+mwrgn0KqsSmkuTwlQDUQUYIL
	Qp98iSI/VJuoHZPUus3Y/1WVWxpJ1vAQmSqt1nPnP5T5Sd6zAF9g6YYp3bmhAgZnY8cHSDxQ3NE
	dbAQZwTFy60nMRpx1XvEk9K/+GFwGy30DwJkr92xwTOCV2kQbJa+0qpAM/waNaLRnU6uFEKo2ra
	Fdvg==
X-Received: by 2002:a05:600c:4444:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4980c645e1amr227533685e9.7.1785773492549;
        Mon, 03 Aug 2026 09:11:32 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:32 -0700 (PDT)
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
Subject: [PATCH 08/13] drm/sun4i: crtc: Propagate layer initialization error
Date: Mon,  3 Aug 2026 18:10:46 +0200
Message-ID: <b26a0d427d9dfae9c82e3ca90a67d24d8ece5a28.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091134_862505_27FC5E29 
X-CRM114-Status: GOOD (  12.88  )
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

sun4i_crtc_init() returns plain NULL when layer initialization fails,
while all its other error paths return an error pointer. The only
caller, sun4i_tcon_bind(), checks the result with IS_ERR() and happily
continues with tcon->crtc set to NULL. sun4i_rgb_init() and
sun4i_lvds_init() then dereference it in drm_crtc_mask(), which
oopses.

Return the error pointer instead.

Fixes: dcd215801b02 ("drm/sun4i: Drop primary layer pointer from sun4i_drv")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_crtc.c b/drivers/gpu/drm/sun4i/sun4i_crtc.c
index c2f7f69baf75..3fa1f4fda0f0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_crtc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_crtc.c
@@ -208,7 +208,7 @@ struct sun4i_crtc *sun4i_crtc_init(struct drm_device *drm,
 	planes = sunxi_engine_layers_init(drm, engine);
 	if (IS_ERR(planes)) {
 		dev_err(drm->dev, "Couldn't create the planes\n");
-		return NULL;
+		return ERR_CAST(planes);
 	}
 
 	/* find primary and cursor planes for drm_crtc_init_with_planes */
-- 
2.43.0


