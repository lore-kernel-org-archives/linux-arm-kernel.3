Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EA3CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 09:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Je0r03zFWDk/tHsmcp50GPWfnKiSAfNBSvNM4tTawBM=; b=13zfGT6fTenjHV
	bqaR1hl4uj7LLNEkNLq9vAXD3dJpkYZ2dDm032ExTbXEOeKG8fQVIpY7ZFv4gDt39DFXhAHiGL6CG
	CflWGrqYDrSh/pHiwFgAMy2lPnHIsQlE6MwU5nPf+SQRxhcXZKdDY9L+ln12p5hN7qq66FYDIRAEB
	RK6lsE7lrngb4ADpEj6GWfgoucglvYjgFtAoKEFrKQI6xt6aT56QPOmNKw/8q7BTBKGME8j7zvvZM
	pwMovnXhmLva+3ap9tzp/2vAaBtzZ9rrLlgpFhZacnQmXjux7KWYxerNblQK5ETqAKGeAn1sXOFjr
	pwq+0JpFMxaGaPNfWC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFK-00000008akq-3nol;
	Sat, 30 May 2026 09:44:46 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFI-00000008aj0-034x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 09:44:45 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so1285781a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134283; x=1780739083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Je0r03zFWDk/tHsmcp50GPWfnKiSAfNBSvNM4tTawBM=;
        b=kEXJ4H5za0GMQQqdOtZ+qOtxni8UQP1wNIiN11wqo0Ui78palkK/hKDA/+1d2I9yuw
         eDNfGbOJWhd8O3DYB0LUgTJyFXakYnTDH/Lj1muKmuMDmUshEMxnrRV/iLMwZOcseWvu
         kz+d5JAv0wcoftOM9/DQHEe6UnGYksuufhAqRq1NdApnoX0H0sDeW5sfuuN+C9xzYtj6
         Wv0j3D+GNcTodw3jP1cv4m0nTXVymXG5SXY6rCCBTRKzC+Kb/0E8m4PSvKS7gPDFtD3p
         D2R36NyPE2Asn5vCfpa/TgN2Uqbmw4BXxVbUO89m1KdtUicBjgLEzbWeuBni+Jw1FWV4
         wNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134283; x=1780739083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Je0r03zFWDk/tHsmcp50GPWfnKiSAfNBSvNM4tTawBM=;
        b=cqnssRtXN1qS4t6vRpgpmVHkjzDjJZHlwLPBdIJT9QJtCs7jthEPIEOvbOYOKjuN5P
         TwLYkCjNDi0GdKyyZmz0JUIm0QnshsgcFwDVBo/r1zSwFBMKiL9Do18FKGalV/vJGnxi
         QGnQWe5mW3zxUd1RvfwTYS+U56Z6sFIXMDlGuNGxESzqzwK8B4NPQnot5KZ74sg1OFiZ
         VU8Qn4XbQvShVIPKaOlUfmlI/u8AJRDYtEEYgzcuaILfsBzx0gIJ/HzsFL4z8HH7e7no
         JqkLOIizjyTodO/7u0jENNk4zrOdbp/DB1oeznkaPgcc6uPdWT/E/Gy1Fv391EXpf1Fp
         US+w==
X-Forwarded-Encrypted: i=1; AFNElJ/JHL4TiNBQqWHvcFdYygm0D0KjkQI16j2xM2LYxFNnPhcGp2reyHwHSmAvj4wg/7dlZ4oTplEosbGPFsSjEiXY@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7WTi+uvKk7xURtgVgiP5rT2peZQm+/AYw4cMhL73uC7KOvsME
	9Z51AxsuKfD2REYFjEPlTsJOi41IMEZ9/d543WFlVbWjfnbDB2subl7l
X-Gm-Gg: Acq92OHOqx0VeAPop7tlHgbRAPPyUJhnlsQ11TFl1Vupe52b7E9MO2Opynb9cBKOokk
	IJPZhHP8UY9fAL8Q2mxZq1NwgnUUgC1mDKMSkJJ8EJPX4titWJjuLPJjsb7+PH1tWWQj6CbYnV6
	aXWNfuQXdzbED1wv5c0LVJu66c38wsClQImwRszAqYZIXjyaIEewCygyvWINpro3wbQ1xBQucP2
	+SCq2Y1PNuhbrwnj1rONzhYCaNkbeSDuDVCGQ8YzuUyrG789iqSuIJMyqPtNiGQqNiCEsssciZ5
	x1WWnYSCgP+Ym1vCX/qVHiju+bXC3/rKEk1a+MtHdR0P7Bhgcj5Mpa5Jbu/3w1pc+E47N7/oDR0
	X2Kwu3ievJ42jvswPrU5AzamX3c7c3JqFA/GQSyHZxHCWpOp80czfppsMOS3zbM+0FXyDmND7bp
	sc3hAULuaT6OpdmHVOhkyD12H4rko1lYRni3sj/errTg==
X-Received: by 2002:a17:903:2450:b0:2bc:e2ed:fd03 with SMTP id d9443c01a7336-2bf368a3dabmr36524785ad.39.1780134283084;
        Sat, 30 May 2026 02:44:43 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:42 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 4/8] media: meson: vdec: Condition buffer flushing on queue type in start_streaming
Date: Sat, 30 May 2026 15:12:50 +0530
Message-ID: <20260530094326.11892-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024444_053997_392CAF88 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When vdec_start_streaming() fails, the error path clears buffers from both
the source and destination queues unconditionally. If one queue was already
streaming successfully from a prior invocation, flushing its buffers behind
its back leaves videobuf2 deadlocked waiting for completions.

Fix this by only sweeping buffers from the specific queue type container
that failed to initialize.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 8a5bf1a96830..698a95566ad2 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -386,15 +386,15 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	sess->status = STATUS_STOPPED;
 	mutex_unlock(&core->lock);
 
-	while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-	while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
-		v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
-
-	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		sess->streamon_out = 0;
-	else
+		while ((buf = v4l2_m2m_src_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	} else {
 		sess->streamon_cap = 0;
+		while ((buf = v4l2_m2m_dst_buf_remove(sess->m2m_ctx)))
+			v4l2_m2m_buf_done(buf, VB2_BUF_STATE_QUEUED);
+	}
 
 	return ret;
 }
-- 
2.50.1


