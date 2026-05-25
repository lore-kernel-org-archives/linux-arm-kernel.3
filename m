Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A08BCD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ez92gLCG1+yJIQjG46e8Hvs9v1kkCpJ4jicfjTVkky4=; b=pYnuMXi2xp6qzb
	N8QzwNYFdYvE4ZcrM5WezjeK2Eay9872C/DBGh59kMMpEwiWKeSxupohH1rq6PnDWDsBw02dU1XNk
	SC1gPNLjwJTzs+S2yAwVXdycMiUEwC4rfdVut+U3BehRbuFbtmWqOWAnxgkxQWyyfHcWcf/5Hdey1
	5aCmfV3Wud4cWSTaqrV5wOP+bReX6aU6as+CFRm2iQFJ1pa0ZzkqOY8STRklAcU4cMQF9nVZLB9Yl
	jHSNYNRVcsDcnz6vGYZBX4e/tn+1wD9jsWWIBvZJ4qzqKeblSxRd26xXkMKHfExf4orgMNO/6adCs
	bnItm3IxHBntMtzIJPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzq-0000000Gshp-3B2M;
	Mon, 25 May 2026 09:53:18 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzm-0000000GseA-3Jox
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:53:17 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bcd730e090so77611575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702794; x=1780307594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ez92gLCG1+yJIQjG46e8Hvs9v1kkCpJ4jicfjTVkky4=;
        b=T+XvPfnzvtcJApFscUX2mGXLVtZCwBlicAszBWFL1JpMgAp+/AvxO7blPjTbia32+U
         qAS/rvWDFVU2ay/XKE2pr0k35bgVXez5swJDEigrHQm1RW0efQZm6nGI7obqIo4VdLw1
         2Z6boCoxzO6uwynEig7KrjmTpWBSogP7q/EhalP/qpZHUeoxJCp4lldlMtnPsYnD6a8O
         dxp5TTwIpyHUt+tjOywMBtjWVz9goe+cQm8egbBKCykfhbn0UhskCs+8Cb3N6ZEAm6vw
         Frh78ntRPBT/lWNWBy45yNy5fnEcy/ZKslP9+iB0iGRdEI0gxuKqzjxG3pZeAY8cWMPu
         oCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702794; x=1780307594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ez92gLCG1+yJIQjG46e8Hvs9v1kkCpJ4jicfjTVkky4=;
        b=DOocCjKZcDpZgtQ0+B9gZ9i8osTjFthJZWdg68T6ueqxflSsasR2ONz0F9j7KdmveY
         WxDb2RDruWRJG7VXa/0bTzbzJi+SFry7DLsw3EHiBY4d+BxT4+U3z6aXVGXWnPhmVcjy
         aiw5zZ9mCQuGjIn5DbMMcur+32hxt5M6tWcQ5+8pJ47a6KPCsFGI0v/3IzeQSRgR1tnK
         M1JW4ErJFWn2Fz+qXx1UeybbMZH5uEPXovcTTNYEnfGWjdOmDU7bPdKgovEi82vflAue
         9nLhr1bwsR3iYR2JeHnj/Uchvrt0yIhYAN6S063HSkidW9XLeDA1DESXyyd9aS3uMELY
         KqbA==
X-Forwarded-Encrypted: i=1; AFNElJ9YGdDdbvxrIZT2BNQUEE2UlIFsnIH5gB1LPiSu5Cm4WNhLg3L/GoJMPQaHf9xSFusgA6tn/MxrmOiBcnZ43GMY@lists.infradead.org
X-Gm-Message-State: AOJu0YyArJKv7pERlYAr5zfH3zvJP77vejRppKhZ6srxm3Kh3tWiXxN0
	A03c8gkYiWKgQlGNQpL9/JqfTRj3KKe2dR6qQFbE0lOOmaHohv/QsFAd
X-Gm-Gg: Acq92OEo5azqXxxLz+C4397LCjvkkABp/dR4kWgSB8+Ondwq7ya83tRGiFZMU6juLvO
	75rk8TbgV1GKsTrY8w6LZrHid1+X+1KSxdg1z+IePtIbZ76ztkE/s7NNdIG/XdZPPaqPJnQ6E6V
	vvEGqTdV/38LgVEi7Jnhho7NN6CLruSWUZanKW+Io9Q9EWHzgiKPVo9IPCDMMF/C8fzxkHX7Ohk
	KHFpZogjz+yLZ9tbCmPIHEzw97bXXJl9l5qbQI6ySAWkBVv+kpdLR4USCZrCXT0gB2FxGrpZXgf
	MlAde4juxg/Xkzhuv9gjP6VtWBQ31lMDhQSbZDgI8kuqiughfT8gThs6Qyy8wP3gdfeaWEEFvyq
	3QQuKxDERp38rbGMLYyuLgtSWK7CKEIKFzbQe3YKFMGiI74esk4MGLyaADSsVQxhXKXJ0ivgWnK
	zKZaWT8xtx55Zv4RDHEGRswjmHo4klVxjCgQmShWHN2A==
X-Received: by 2002:a17:902:e548:b0:2ba:78a6:7dec with SMTP id d9443c01a7336-2beb05c07aemr160215525ad.13.1779702794227;
        Mon, 25 May 2026 02:53:14 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:13 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 5/6] media: meson: vdec: Isolate error path buffer flush to the active queue
Date: Mon, 25 May 2026 15:21:53 +0530
Message-ID: <20260525095216.12078-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_025314_856426_F0D491E2 
X-CRM114-Status: GOOD (  15.73  )
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
v5:
This is a pre-existing issue, but will returning buffers for both queues upon
a single-queue failure orphan active queue buffers?

If the CAPTURE queue was successfully started in a previous call, returning
its buffers puts them back into the vb2 queued list while the driver
discards its references. Because the CAPTURE queue remains active,
userspace calling DQBUF will hang indefinitely waiting for frames that
the driver will never process.
---
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index b31bf08af88e..925537bd4d0b 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -372,15 +372,15 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
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


