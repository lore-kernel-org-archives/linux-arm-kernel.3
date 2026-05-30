Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647AACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 09:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BrXJFZmxeXg5CYXAWJIPwYaWF/wPAlGFj3atI5I4qIQ=; b=DgASKVSkqjmUbd
	lyqvlkgEqxgwmceIIcKzCFjAjegrmubBWTNE8OMfkoEZuzTXZYX2KNNzv3Tl6JFyw19737PQI60GW
	dTFpa1IOjncc4/pQvOOGuee35ggI6F/eCF64dEylR9PyxsI741LYq6xtQuGbM3yMIlfLp7If3kqEh
	1gjgaECNs6HhdMyxX1bKKjHm6AyFaAVjRtn1piiUdkL81P3aVne0CQ0XLSfc7a7tMvTRsDKNg0CWk
	hosa0iTosHFfrV8Ur+reWoj6481aJde+qh1uTyPkugllePz25xgcu8WXAcvlrzqaJPvEhd3/Du9GO
	MEBvUsvU9wzBSEC8l6kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFB-00000008afj-3DRg;
	Sat, 30 May 2026 09:44:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGF7-00000008adW-2Sgg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 09:44:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bd9c3b550aso100548495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134273; x=1780739073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrXJFZmxeXg5CYXAWJIPwYaWF/wPAlGFj3atI5I4qIQ=;
        b=U6Q8w75qoCmIU9EedTdURKijSunC8ZM5g1tJ8lJo1F5NDPsww15SXhWzdqY2pk7Lge
         zQPiwx4nHXTS2DDf5Ktn2iCCC5TLOyEziKkgPxyMMihMrw/wE2+IjhlS1Bjowf9te/2D
         Wo17HCoBQvUFhbmZVF84Hu52tMz/HfThuf1MRqCw8draw6mgPTDF/HQb7j49BlqVfnrE
         zOzkVp5ORzOVZDFwW+/GvJD+rRSJyeiO/hs0kvaDs2gZQcAMs1Epw9Ecc+RxHnTW0zgs
         HvUH2CsQvOOMxmeWuHjEGasdpvo+B4tZatzCsym6EUOxk4CLVfxafGx4lXLzSPFgwi8K
         RD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134273; x=1780739073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrXJFZmxeXg5CYXAWJIPwYaWF/wPAlGFj3atI5I4qIQ=;
        b=JEdMqdFxOOY9AbkwGpDxQOq010XB8ZxEJslgbwr4XUnxg8FnV+f7hirmkUvo+2pICq
         p5nPtFAdKLUbmtY0xx0wCu2NDGVuJbaRcvCcZEWbAoOc174MDztKRNhL7+5puQ+i2CMl
         L1bWouHv9AVeiY2Vl05Yir8PH0yvUA6fzFnw7QNPEvfK2E5XOnK46hCuZqSvJakWmRr3
         2x7/4dAlkrISVzWKZJkHwjhxTxYUIWTi0/LBeOU5h5wiju2I2srPwxTG3G/veA05J2/x
         aR6tj++G9ZRRbHatnR2gqBH2/SGsdVcf6cAoHT+kxmf3jDdUD1V0t/LpQFS3WfzkWKI4
         pobg==
X-Forwarded-Encrypted: i=1; AFNElJ/9oYsVloh1HAugiE+nPzQakeOH4yWinvCHlLcri+epNrtnq7fvwl0QW+ANYPmE5W5ikV/1FJBz1/yyJDkN6YCe@lists.infradead.org
X-Gm-Message-State: AOJu0YzmSQYttuuztzdQPDrARgdCW+2tdfnAksbAh5B50DIDHMdLysmP
	HWkJgvXoNHBt10Ggbwjfhvf6U9EwcnybYBwpDYbPF3TAkcn856dYt5lu
X-Gm-Gg: Acq92OHO6x3r/9eNkE0SWpxIDaswt/2jC3/4Oxw3ai9Hhy/T6w0MZKkWE4fWDgCJaDY
	sZTDTjKK1lpVuPFUjobSvx3R9pJiC09TaFCg/ZQPikeTdoUKmKPuLmRxkhE++gXHyJVrD816cp8
	63ySEMmSS6NtUZ9eVNzqtt3hQDfx/H13WBsoipXRC7YsdQKNeT30NXB9lnvGoXlSCvl6RwzYa1S
	YcyHA14V3yo6OXo/FVhKj6l1bEFljV2zIWLu1P/lyCqqozxMm+oxiaEfagP0Qczqf24JB69hcK/
	IC3QdN8nNPesriov2toWO+r5PZ92D8ABZUoU3GEAxHVtSWJWtnqXgaRWFokTdjXJPkRdMnCiD1Z
	ucJfaxhWeL479DVXuthjac5MoFWko8ICZuz7aQ35gobeA9EeNZC0XFMz6k5rXpQRSe2NiXOOcXz
	9Mlm84DXr+Mv5nKyITwBsPwhhrrD+o5Ts=
X-Received: by 2002:a17:902:da8e:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2bf36793916mr38435335ad.1.1780134272635;
        Sat, 30 May 2026 02:44:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:31 -0700 (PDT)
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
Subject: [PATCH v6 3/8] media: meson: vdec: Handle kthread failure and free codec state
Date: Sat, 30 May 2026 15:12:49 +0530
Message-ID: <20260530094326.11892-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024433_643463_3C3FAF71 
X-CRM114-Status: GOOD (  18.60  )
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

vdec_start_streaming() launches a recycle thread when required by the
codec. If kthread_run() fails, the previous error path only powered off
the hardware, leaving sess->priv and codec state allocated. This caused
a permanent leak of the codec context and associated DMA buffers.

Fix this by introducing a dedicated err_cleanup path:

- Call codec_ops->stop() to release the codec context and clear sess->priv.
- Power off the hardware before freeing buffers to avoid DMA faults.
- Free canvas IDs explicitly and set sess->vififo_vaddr = NULL after
  dma_free_coherent() to guard against double‑free in fallback stop paths.
- Reset core->cur_sess and sess->status to prevent stale references.

Following change closes the memory leak on kthread_run() failure and ensures
robust cleanup of codec resources in both error and stop paths.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 26 ++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7233000e2232..8a5bf1a96830 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -32,6 +32,8 @@ struct dummy_buf {
 /* 16 MiB for parsed bitstream swap exchange */
 #define SIZE_VIFIFO SZ_16M
 
+static void vdec_free_canvas(struct amvdec_session *sess);
+
 static u32 get_output_size(u32 width, u32 height)
 {
 	return ALIGN(width * height, SZ_64K);
@@ -352,16 +354,31 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
 	sess->sequence_cap = 0;
 	sess->sequence_out = 0;
-	if (vdec_codec_needs_recycle(sess))
+	if (vdec_codec_needs_recycle(sess)) {
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
+		if (IS_ERR(sess->recycle_thread)) {
+			ret = PTR_ERR(sess->recycle_thread);
+			sess->recycle_thread = NULL;
+			goto err_cleanup;
+		}
+	}
 
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
+err_cleanup:
+	vdec_free_canvas(sess);
+	vdec_poweroff(sess);
+	if (codec_ops && codec_ops->stop && sess->priv) {
+		codec_ops->stop(sess);
+		kfree(sess->priv);
+		sess->priv = NULL;
+	}
 vififo_free:
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
+	sess->vififo_vaddr = NULL;
 bufs_done:
 	mutex_lock(&core->lock);
 	if (core->cur_sess == sess)
@@ -441,8 +458,11 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
-		dma_free_coherent(sess->core->dev, sess->vififo_size,
-				  sess->vififo_vaddr, sess->vififo_paddr);
+		if (sess->vififo_vaddr) {
+			dma_free_coherent(sess->core->dev, sess->vififo_size,
+					  sess->vififo_vaddr,
+					  sess->vififo_paddr);
+		}
 		vdec_reset_timestamps(sess);
 		vdec_reset_bufs_recycle(sess);
 		kfree(sess->priv);
-- 
2.50.1


