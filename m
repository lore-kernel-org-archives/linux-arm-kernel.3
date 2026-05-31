Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64CACD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRd0rxdsonje9jnyvzmzGfqu89ZUVs4w1wFb8uxr/rs=; b=ApRAO3OiLO68S1YAPLF89Iy0Y+
	IKGTxl1FvR8G+KpE6W3zzYcjfGYNSRGV3dgiMtaXkuQg3TUZkYEOOMNqdZag3se19MxYpCGXt+VnR
	8bOlnXVTF6BBEGX2We64Sac0UuRLJlg3w3M8rFEVJK5YWnpPfDBzYEsz75NGcYxOWFwq7eHgOlxv5
	Tm0SgPYU4Yz33pDDZyhV8ypM8VvqeEznEZ1Qc3qhBR1m/egUQUy0TdCQUDzMpTbe7tzuIgdaPVPtU
	JaeV7CTm26ZJw2JWU724DPQXgNUHegEGDV8SWl4j8ckpB564RN6K9w7WI0b9LXqKhdIMlYhUZ+xtf
	G4XYIN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTajS-00000009KZF-3FRm;
	Sun, 31 May 2026 07:37:14 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTajP-00000009KXe-2Pct
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 07:37:13 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c8584e80bd9so364231a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213031; x=1780817831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRd0rxdsonje9jnyvzmzGfqu89ZUVs4w1wFb8uxr/rs=;
        b=h6zTjafgRKn3+StvrZm0qrhSNK+jAMD9tPKJ06QbNcaCbx8cPW2rPjgawbIlUVj0A1
         1mBlTx5ECVIoYs7qwqCXzw+m7fZxukzjLShiWYKaZfrmFbL4BKuhRxLIRP/HtJpdsrb4
         aLzj1Li7iwh8UQ4H01TKlP+kkXT9iR/osyZPm1/FFUs22NPnhuHFi/xxwVa0SMaTqdpY
         TNqy3KpG0Ln+rbY0j02FPDNAdeWGMEp8vKrmheSu1Tu76fKnpPl8R6PH3bxCQtt2Xp8k
         1v76iHfuOQREo/qYhmuK0TASwRbWYk5Zy9nRRcvkG+8r3ZUqv12HvTxUz+P1iTkVqd+s
         2eHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213031; x=1780817831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FRd0rxdsonje9jnyvzmzGfqu89ZUVs4w1wFb8uxr/rs=;
        b=aDQhBpABuXG1xZxRcowzYDJZv+dghjHduhNwfWs3iITfjGev7tMsoRnsaqIr6xXiXA
         sSNI2hSV+Ymwn6JgWUWk1cvPEcOTb2FLWYm1C7QDSkq1ZiUFXnj3oiOGH/Wt9w7ovh8i
         P1LrCvePgjQ7YPVkz1nL/PqmsvdXMrhRE7tQuRVtubZSqLP+OU1ya3hrxDKOVN9LZuNH
         NmBN9pl5zD9EY/muk1dyZOTUpPLJzTmI7ohsC/efikMYdfd+BTaZs7WcDhrLdybY2Vqk
         SRSLQ6tur9YFYRkV1HS5BPMp6Lc9H8etGZrjQyUtYVGdV7QRh1vdfcetk0rGJFKXtWDx
         aPEw==
X-Forwarded-Encrypted: i=1; AFNElJ+1nFPEZ4GxVkHgEZk5YWRoq1JBb69wEAzhk103U+1YsiA8PYKUPGOuGHgdpR89W6CL3tAb/34T5hY2lScJqp9t@lists.infradead.org
X-Gm-Message-State: AOJu0YxpANIP06bPpAG2gJ+vVj6pR5ASeZbT0k878cir60JVNr+4WwIE
	MIlufBkO635TbTAtLrTgnFKa/7VjbVFAQVGuKRbZfALhL/Kb5ysvJar2
X-Gm-Gg: Acq92OH1G/g9nJWzf8g5TKKaXCmcQZBxj/XDWyHdrbwGx1raMjplmP4rldj7jkMP14b
	wuv6Hhr9EorFfGM2DCoG6pMkAKbpSeIq33ni6isEFeHIbumYOp0dWxKyNUT+28zkLKZzXfbcVNw
	9IzDgRDZehY9EKqNQJ5WtyKaRDCdBQjrJTTE6a/GRinFNMsTR+AkATPHisNw8MSS0ps90GdO8O9
	x7i7KOT6dbbH7u8j2oq4kGNdVwC+jnZdfieIMdledsNk247ZaMyf11EFCbiovuhKwefH3yN6mMa
	ncNyE13lqNjq/E5YH6zSMWr3ZtuleAZT0kwn5LnSTFkJHBITxT4O8QSK61y57TpOWoJ9RRevvt/
	lAGvho8/mUMBBK1HmMyB9yraZUpyEzWNQm6REGXnTnrLerXGI/KrgcO+mdiNs3HXcpk9GVFxqtE
	MJ8yYb/JG4VW3eRkjCzU5AizMDTt/w/rjc7oVvxBv++A==
X-Received: by 2002:a05:6a00:408f:b0:837:e9cc:d465 with SMTP id d2e1a72fcca58-842253a671fmr5468493b3a.20.1780213030642;
        Sun, 31 May 2026 00:37:10 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm3760709b3a.59.2026.05.31.00.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:37:10 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	stefan@agner.ch,
	alison.wang@nxp.com,
	jyri.sarha@iki.fi,
	tomi.valkeinen@ideasonboard.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 2/6] drm/tidss: Open-code drm_simple_encoder_init()
Date: Sun, 31 May 2026 13:05:28 +0530
Message-Id: <20260531073532.8609-3-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260531073532.8609-1-namanarora029@gmail.com>
References: <20260531073532.8609-1-namanarora029@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_003711_615400_5EC16F66 
X-CRM114-Status: GOOD (  11.86  )
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

The helper drm_simple_encoder_init() is a thin wrapper around
drm_encoder_init() with a simple destroy-only encoder funcs struct.
Remove the dependency on drm_simple_kms_helper by open-coding the
encoder initialization directly in the driver.

Signed-off-by: Naman Arora <namanarora029@gmail.com>
---
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 81a04f767..4d73a271c 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -13,7 +13,6 @@
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_of.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -81,6 +80,10 @@ static const struct drm_bridge_funcs tidss_bridge_funcs = {
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 };
 
+static const struct drm_encoder_funcs tidss_drm_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
+};
+
 int tidss_encoder_create(struct tidss_device *tidss,
 			 struct drm_bridge *next_bridge,
 			 u32 encoder_type, u32 possible_crtcs)
@@ -95,8 +98,9 @@ int tidss_encoder_create(struct tidss_device *tidss,
 	if (IS_ERR(t_enc))
 		return PTR_ERR(t_enc);
 
-	ret = drm_simple_encoder_init(&tidss->ddev, &t_enc->encoder,
-				      encoder_type);
+	ret = drm_encoder_init(&tidss->ddev, &t_enc->encoder,
+			       &tidss_drm_encoder_funcs,
+			       encoder_type, NULL);
 	if (ret)
 		return ret;
 
-- 
2.20.1


