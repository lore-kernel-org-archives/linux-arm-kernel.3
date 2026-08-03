Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950A9C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnZE5eYLucvHUcpEznH4hSEo3d2Mtfchio0f8Z2eXVU=; b=NoLh6439rsBf/QIy4HfbXr5nbM
	d0WpbZVbOQAX9ls5RdHHeYO2QtwuUekz36rTMyQG1sJFpnivOqMVJZQXMjHZna8jsmfe94uGiKpcj
	cNZcyIh8fR4b+a81E7N2kTeTj3XQ2I50QFaQPYsUdrUkKFxOUr8Fi2ZpKBTWQcd/jPP+dOZNcWL9b
	U+WJcND42yKmcoK0hyCAfs41VccrDSWhZG9jnE405M/fZBoXAsmkDD29/tW2dcdcboBsVWvoTbMwf
	GT2AJa0LoTGHz7R6ozAWPvc7iEzWWtWvCzpbSSijedtee3ei+OcInNXXwtZYwsXMxOLgklaMdHLkk
	omqxPEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGF-000000001pR-1Jlo;
	Mon, 03 Aug 2026 16:11:31 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGD-000000001n8-1D8D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49800c6a846so20194985e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773487; x=1786378287; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WnZE5eYLucvHUcpEznH4hSEo3d2Mtfchio0f8Z2eXVU=;
        b=AFFdiHe1R2CLT7avrLjIz7k6q3KOOIPQN/kfxAzHyKmFxg1zUAoFTJVgMtRY+pyMYP
         vXuNxc8X/pM06LW+0i7G7SfcfQ5TC6tvTKNaAZrGoRk/8iSr5EVPq9GOk0ecHGbZcax/
         QbKpKocQuJyWEYaT5FN1xxtJNjNvJrFP/CT8G6Au/125zFJwAks486SaI2uqlw0phQur
         Hps6N6zzmiejr8kDtSu4DNVIrOj/rtyM4lbnLIoWetfE2TPJlFGEdQ7xaYVN6fuhKayY
         qX3U/Dj6kM8a03nKRniWnOr4xpQUfB2jEps2NRKut33t4bFkEoqxILJpJXLkOveIMQ6M
         E4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773487; x=1786378287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WnZE5eYLucvHUcpEznH4hSEo3d2Mtfchio0f8Z2eXVU=;
        b=CqRpv41mTALgbk4VP7z5sd9+z8WQY/8hqyfsYpip7GaeDtnAOOmOulzzL9yosLq8ar
         9M5yBnvKZVLzBHdLRkAR/4KHmqHUmJyVAXNyoRQjCW7eGpff3Y4fkar2Gwk+9IN1RTA7
         dWAfNxWGcpyuBd8GAPwrGDWDdf94kOuttayWBByL1TtqXYcVAnEMIJ4/6FDKLsFEG0Ut
         nKCU0pTVc3iC6NopiI80ezZaJZZlbXnuWfRxz/5Jk3UUR8TTi1rciBySBmtTmN5l62Cr
         YjLQP++i48mFyLhxWzoLE71/R4LuLlIM3CuHrvrMzJXKTAClFszKUr+s9PWh9fVP+VRz
         +UJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpeIUaP+wR783Twxxj6WFUrUkKrVMQuxXMrqNRo030rODFhUnZO3kXjhQB+B7SxbI68e1NdXaRTvTUif222GXTT@lists.infradead.org
X-Gm-Message-State: AOJu0YxksVzW3/4njZmyAogpvEZY2w7Nm/vrSFGjFWnrwij5gj5AVjHD
	6ndQr09PesSMdqFFCD22woRkej1VAz5SOp0agH/HE7v6GjwJquTxxknL
X-Gm-Gg: AR+sD11XLoqN2Eei6b+yPzLbh8IU2CnRrCz5WiAprvw3+8ZiuhhTbwA4d7QbAXsGdnE
	CtdZH0zXXi0FH6DgZYd5wd3sUpIAtQsyxnY28iiB6lchU3G88n6YwBFV2zPu5z4Tc+k7Q67HmfI
	Fc+8jnGXlEHxTL/JDi7cK4c/PvZwOoV3udj7mjG9eqSMNVB8S0fvm1X+IeKUTwxRgUVg4ygQziY
	K+CoHTgS9aRxVfVPubBF54zJmh1qZlo4r5A3Em+NkCAVFSmYsa1M7Hec0zGUybF79jnKxUTHNMy
	/AbIBGsqo6H5XN9HujlPUgJQ7NdmR31RMRFnyOX0LW59VsRXSPIuUnBEleWgIuQ9bE+KWS5f757
	3H+j58bXlKuTQAHWLZQoNBCpOGF0sfNzpgrDiepQ33ME+8fdiWSLfMU81jMpI1PIFZGDpOVOICp
	N3NP6yrtjNuCOGqWLZvcWyMOUNcBRaZrHCkk5CQEtvc0T0gHz5+D3/56KIoqBE+qUBpVcWA953v
	af0O/uNGraVyEto3fwQRpwQ9GXI7nMWVSRnN/ukeWu+39rPTKmj8Y68Qr8ABgqbvNWTpdfgPynF
	qOi4e8BS3xAS/TbErCl7jbTNmMVQWjsrDiOR280DlyYhJMdV4GqWMC8xkdTFnW4wPCvcfWmeQ8c
	sPiX7y1DMl37A4eT2v42K3eclshWNAAQ/CDHDVUevDn4nqrzieVl8qDXMngGtBzntUiFFilw93s
	gT9Ns0Ght5pYWeLA==
X-Received: by 2002:a05:600c:4f87:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-4980c66c7d9mr217127655e9.3.1785773487184;
        Mon, 03 Aug 2026 09:11:27 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:26 -0700 (PDT)
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
Subject: [PATCH 06/13] drm/sun4i: tcon: Drop TCON TOP device reference
Date: Mon,  3 Aug 2026 18:10:44 +0200
Message-ID: <871a3108086c15a483eef23301984c8d2254dfa7.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091129_353756_2687E08D 
X-CRM114-Status: GOOD (  13.17  )
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

of_find_device_by_node() takes a device reference. Drop it after mux
configuration succeeds.

Fixes: 0305189afb32 ("drm/sun4i: tcon: Add support for R40 TCON")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index ea7c90fef316..de2d66623f7a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1409,7 +1409,7 @@ static int sun8i_r40_tcon_tv_set_mux(struct sun4i_tcon *tcon,
 {
 	struct device_node *port, *remote;
 	struct platform_device *pdev;
-	int id, ret;
+	int id, ret = 0;
 
 	/* find TCON TOP platform device and TCON id */
 
@@ -1432,21 +1432,20 @@ static int sun8i_r40_tcon_tv_set_mux(struct sun4i_tcon *tcon,
 	if (IS_ENABLED(CONFIG_DRM_SUN8I_TCON_TOP) &&
 	    encoder->encoder_type == DRM_MODE_ENCODER_TMDS) {
 		ret = sun8i_tcon_top_set_hdmi_src(&pdev->dev, id);
-		if (ret) {
-			put_device(&pdev->dev);
-			return ret;
-		}
+		if (ret)
+			goto out_put_device;
 	}
 
 	if (IS_ENABLED(CONFIG_DRM_SUN8I_TCON_TOP)) {
 		ret = sun8i_tcon_top_de_config(&pdev->dev, tcon->id, id);
-		if (ret) {
-			put_device(&pdev->dev);
-			return ret;
-		}
+		if (ret)
+			goto out_put_device;
 	}
 
-	return 0;
+out_put_device:
+	put_device(&pdev->dev);
+
+	return ret;
 }
 
 static const struct sun4i_tcon_quirks sun4i_a10_quirks = {
-- 
2.43.0


