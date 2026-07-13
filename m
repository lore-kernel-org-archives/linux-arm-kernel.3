Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DD2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cz2FSgCZR0hsmFPhKS7OSCHd3SyOY5Jhxrt1826LFDI=; b=HrNScewYCtHkXX
	LXYO57QTExUzwcsOht4xn79YIGFrBLiw4jRNFEcEZg0rnSK6SoZYXgqQo5BE50yuEd5vVUCv1jrhe
	A8CjSTiGS8BGyop655plywRBsDoK1nixgqMnCDNstr/Gc9H/viDiE9FKsE4fJy5/f7VQ41fHHww8j
	H9SWsiRMCTtHwRJmPm8gYJkUFdSZZNPPuf5LZU6SIELazWjWeUIotkkZ1hwIFAHHXYdBHCa3H6GMK
	k+lTtBZ68S7o+AaUg/cbEAs8xCmazZPVeiVToXoQCoD+3wQOzNwKw7MlUBWxIGp2wVM71ZqjrOi36
	hFJowsm0kxm4K7CIX8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUB-000000098Zv-2kzO;
	Mon, 13 Jul 2026 12:10:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFU8-000000098Xt-3cqW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:10:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cacd69a9c0so31678345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944608; x=1784549408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cz2FSgCZR0hsmFPhKS7OSCHd3SyOY5Jhxrt1826LFDI=;
        b=tOpvdoGoQGPT9ZG4mNZdh9Mg3fGyfUU3fLPNQkLEPtaX27ajlMaVBDJC/C2DC1kLLq
         8hY0m77hYkgrxUsGzp9lnGQ8RzOsID9OG7ts3u6vNcUENWU2rUi4MdIAmnXnpXvOpjPF
         /5ua3Jjdjh+abcLNlcDJFDd1JgtW27tNZH+buDVuKpcrn9pmiI2zvChJ9RF0bIJY/FEe
         OUHT5tRP6+K/7W3QGeifmVLTZLV1oCbB4bnObFh4M/odFBF+dNA3UWFI2L92ONXUkmaa
         ynkB4Vqfil0f16V4FlwqWHh6oN7MZFgprPhMCwsVWw8h7BembwUqIAemOelJVR/DKY/L
         HdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944608; x=1784549408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cz2FSgCZR0hsmFPhKS7OSCHd3SyOY5Jhxrt1826LFDI=;
        b=pM1AUiuB8febc5uYFgRRS+e2xpES+s6yyiC/P+0epEW+2woUrvHMhaW8LhpbsErGAl
         B0rRrbeTxj0eTWHqSPTRrGD5iRLBl7cUyu48hI3LrTpV22W8T+D88Bvqlf5FPTap+fl6
         FCvjr006K1HEWiyNAWNBJYeoA8lqPO6w+6XL8aNXEH4cEBjIKz22+m2H0mX80Kgkqnny
         9tcicvQh8eBqX0bFQifuzORUKH+Yyj1yVi57s0lU/2ueGYuKMSuoFhWjXvZCl9AgGNgj
         Zyl4oj6h/XY30G5Cqqrr7DzLCRZT0ZyvBXMisy57F3yhBzQhZ6eaezUGSV8/IHea/agX
         UedA==
X-Forwarded-Encrypted: i=1; AHgh+RprCaDxZkW4UkN5uYHl7ZEz3GLoA8cECvy4oyg423fcCj30I4pyXT/3559rJ1ktpbBZlk4zA88sMszckWrhJV7n@lists.infradead.org
X-Gm-Message-State: AOJu0YxwfMyP7iwSpmI6VkWlbhBy/z7mrgOUbX8CBoix72OU0ojDp43p
	T24L/2zEhW365HluaSzZp8wi2gkICEc8wYG/k0yPAZnHyZn3QjoTK6Ej
X-Gm-Gg: AfdE7cmu55lnJdOpKeewM5zHNAoDdsjGVYTOHT3tJeUK+udTdi/ZISGvRWFkZg51QCP
	BCbB9FQa4Zq1UP47LW3z8zoRssJS32cTKcJFZSnIlaYi2WS8UqOIwTxppNO3IUfCys4n4gRLo04
	msl+t+jRuXvxYWo3jfwnRFlAjbOgMieqykKrXFQAGUKnzEYRIWA4BXh/VfrP+r92VUJ9XAFvcJH
	Yno7U0oZihFseehVIhYb2Irh6Hlaj6n5C09N4Q3e5uvsdmBpsLQCK5wqQ2/CkBzNx4MS/tUwYgT
	+Splwk8NPFRz7kk0p3PkYeBL8HkKY59cJD4Z1hd9LtUeXyeQaJ0VPVgXpmeVeOHsJlp5GPk01pD
	MKeuie6fN9MsRq4nNbkZx1fyy4ICX3vVqHU3jehpEj/L8gTYR2cOTFTx/NbvdE2+r7dO+SuShlY
	kXkfLZS4WOKw==
X-Received: by 2002:a05:6a21:140a:b0:3c0:9c19:b27d with SMTP id adf61e73a8af0-3c110cfefa5mr9580843637.75.1783944607855;
        Mon, 13 Jul 2026 05:10:07 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:07 -0700 (PDT)
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
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 07/19] media: meson: vdec: Refactor esparser work queue and fix teardown race
Date: Mon, 13 Jul 2026 17:37:02 +0530
Message-ID: <20260713120840.17427-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051008_911489_2D30E796 
X-CRM114-Status: GOOD (  21.78  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Rework the esparser work queue logic to prevent concurrent queue mutations
and fix a race condition during streaming teardown.

The previous implementation relied on v4l2_m2m_for_each_src_buf_safe(),
which held the session mutex across the entire queue traversal. This
blocked concurrent operations, caused inaccurate buffer mapping, and
triggered 100+ second watchdog freezes due to an unyielding polling loop.
Additionally, the low-level parser handled buffer ownership adjustments
and completion callbacks directly, leading to inconsistent error paths and
races between streamon and streamoff.

Fix this by utilizing the modern scoped_guard(mutex) mechanism inside the
main worker loop. This allows the session lock to be automatically
dropped on any conditional breakout path, preventing voluntary scheduling
bugs while invoking cond_resched(). De-couple buffer lifecycles from the
hardware parser routine by leveraging safe, linear fetches via
v4l2_m2m_next_src_buf() and v4l2_m2m_src_buf_remove(), ensuring orderly
frame transactions. Refactor esparser_queue() to return explicit error
codes (such as -EBADMSG, -EIO, and -EAGAIN) to safely handle buffer states.

Clean up teardown paths: Execute cancel_work_sync() inside
vdec_stop_streaming() and vdec_close() immediately after
synchronize_irq(). This ensures any pending scheduled queue work is fully
flushed and canceled before the driver destroys hardware instances.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 69 +++++++++++++++------
 1 file changed, 49 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 37749ede308c6..e5d3d817b9b2b 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -328,15 +328,11 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 		return -EAGAIN;
 	}
 
-	v4l2_m2m_src_buf_remove_by_buf(sess->m2m_ctx, vbuf);
-
 	offset = esparser_get_offset(sess);
 
 	ret = amvdec_add_ts(sess, vb->timestamp, vbuf->timecode, offset, vbuf->flags);
-	if (ret) {
-		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	if (ret)
 		return ret;
-	}
 
 	dev_dbg(core->dev, "esparser: ts = %llu pld_size = %u offset = %08X flags = %08X\n",
 		vb->timestamp, payload_size, offset, vbuf->flags);
@@ -348,12 +344,10 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9) {
 		payload_size = vp9_update_header(core, vb);
 
-		/* If unable to alter buffer to add headers */
 		if (payload_size == 0) {
+			dev_err(core->dev, "esparser: VP9 header update failed\n");
 			amvdec_remove_ts(sess, vb->timestamp);
-			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
-
-			return 0;
+			return -EBADMSG;
 		}
 	}
 
@@ -363,33 +357,68 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
 	if (ret <= 0) {
 		dev_warn(core->dev, "esparser: input parsing error\n");
 		amvdec_remove_ts(sess, vb->timestamp);
-		v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
 		amvdec_write_parser(core, PARSER_FETCH_CMD, 0);
-
-		return 0;
+		return -EIO;
 	}
 
 	atomic_inc(&sess->esparser_queued_bufs);
-	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
 	return 0;
 }
 
 void esparser_queue_all_src(struct work_struct *work)
 {
-	struct v4l2_m2m_buffer *buf, *n;
 	struct amvdec_session *sess =
 		container_of(work, struct amvdec_session, esparser_queue_work);
+	struct device *dev = sess->core->dev_dec;
+	int ret;
 
-	mutex_lock(&sess->lock);
-	v4l2_m2m_for_each_src_buf_safe(sess->m2m_ctx, buf, n) {
-		if (sess->should_stop)
-			break;
+	while (1) {
+		struct vb2_v4l2_buffer *vbuf = NULL;
+		bool processed_frame = false;
+
+		scoped_guard(mutex, &sess->lock) {
+			/* Safe atomic tracking check: exit loop if session is shutting down */
+			if (sess->should_stop)
+				return;
+
+			/* Queue completely empty: exit work loop cleanly */
+			vbuf = v4l2_m2m_next_src_buf(sess->m2m_ctx);
+			if (!vbuf)
+				break;
+
+			/* Stop processing if we hit the end-of-stream drain buffer */
+			if (vbuf->flags & V4L2_BUF_FLAG_LAST)
+				break;
+
+			/* Check hardware FIFO limits safely inside the locks */
+			ret = esparser_queue(sess, vbuf);
+			if (ret == -EAGAIN)
+				break;
+
+			/* Pop the buffer from the source queue since it is now processed */
+			vbuf = v4l2_m2m_src_buf_remove(sess->m2m_ctx);
+			if (!vbuf) {
+				dev_dbg(dev, "Buffer missing during queue removal\n");
+				break;
+			}
+
+			/* Complete the buffer transaction based on parser results */
+			if (ret < 0)
+				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+			else
+				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
-		if (esparser_queue(sess, &buf->vb) < 0)
+			/* Set tracking flag indicating transaction completion */
+			processed_frame = true;
+		}
+
+		if (processed_frame)
 			break;
+
+		/* Give other threads and IRQ routines a window to execute while unlocked */
+		cond_resched();
 	}
-	mutex_unlock(&sess->lock);
 }
 
 int esparser_power_up(struct amvdec_session *sess)
-- 
2.50.1


