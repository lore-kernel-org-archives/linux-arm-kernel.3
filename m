Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210C7CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mklgo4SEnQFqu5UeBwzviEPZFhn2UwuL3rIfaoDrBUI=; b=qrrFGQrLCdSbor
	gnE7EDKuPRyQWUWCCu4R4tA9akNn2W+QrkVrlu5GfdPcmhSAWcK+wE/N7qyxvzIV8Io+MOvEotVEi
	KJWxpTGgIiaoOmPoAeTO0xkeRX2M+mJrCncGfm24G93ZGa1/fnzgZXnKnpAhUxWUeGtkwLJW4m2zv
	BESeBK0gfX+OngZZFmgA2hbSUcGYU0bJR4FjUhyYHVIOfTnvXcO1sOTNkwn/8Ep95SzeKw5rYhCkR
	x/AyTmJ4gXhHcDp+YwBNTNX9MTShJWT64w50eiTgJuRemcqLdJSp9Njg99iIcBoY9qhYeez09A2Ct
	/k3rPGof8tfhOhnY/t0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxwX-00000006ylb-30BU;
	Thu, 21 May 2026 07:35:45 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxwV-00000006yjt-1nd8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:35:44 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-36a35e4eefeso744730a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 00:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348943; x=1779953743; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mklgo4SEnQFqu5UeBwzviEPZFhn2UwuL3rIfaoDrBUI=;
        b=rgU1/da1ktDqBamY2YoMm05SErwLAId4huZV1DBXqgNbB47XpRMKOIt1wVRkRXSazX
         2+dmWdBYeVKw6p0caexIooyi5LfszeZ4vrvx1fPjzRiMDZqQjhzPfSTjN9SwhR955Zlc
         E7Lwy5HXT/J/v/8+MuXqYbMWqt/YNnleQDXGbFRPqQSPvnIu+WHkEXJ+lWuohjXhfgg3
         ju+TTVNJ7dqDHsLquP/ifmG3oYFtGuMSEV8qjTuFUmuDxkQmYGwl8uBHrz18PN/vxcCY
         j2/HtUI0wFGdqEE+j/wFahCMpgTeF3f9JRx2OCN+sQMXq0lWcy+eGm10J9xoIAbMMzMQ
         rsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348943; x=1779953743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mklgo4SEnQFqu5UeBwzviEPZFhn2UwuL3rIfaoDrBUI=;
        b=ChZ/HSsOwgt2OKirtue+WCxppuZn3MW3RmgpmMVcX2WR54q3CD2SjuHN71v8nkXytT
         Hy/EUJTYK/zK3/e+LNeMh8Pylwq6/a3B4osNYVxcgt7ZX2ejt/aaFpHs5MjVxFru5wmI
         M292+4GAZzbJHT6GQtTYKPbuHUI/1Q+tMwLFq40ZmJCW35taT4WIUVXO7wUKuiD3Ef+T
         Uq0LnqgECdktjGHSOALTA8u5O/rr5CzRTe9LtkxMa9tT33YdUrhTDaARDY5VWaL5p1mo
         x4qknKBxkWANrQh+6SYn3+wUGvUPlNpoApY6SGMOVe/M6fHvD6ucjnwXZSUD3Rtks9S7
         e5Aw==
X-Forwarded-Encrypted: i=1; AFNElJ9/R01dH6WrlDtXeiAjtHnYuiLTQ8SbcfdW5Do5PugWw2GmpBhybGABRM3mV/5V1Wb6nFPkw2ecxUFEf/kr50ba@lists.infradead.org
X-Gm-Message-State: AOJu0YzrSCjvgTKhpYSkgrRPB+33q4wv6LArlF/SlYYSNHDrgk3TI7no
	zAwpyxEewwsgvEgdDEt22jZRlKRtNcbvPZZEHQ7reat4jjUtLrAvIIX0
X-Gm-Gg: Acq92OH5sWqFwyjG+aJayF7Hl6g7dlaLYRxQSOX6jqH6HTkHXU7xjLH9AAY+34cnk1R
	rlMhO91iZL4PV9X9ZS99GSU3RLXdzO5+htaXuYl5oiS1HV0AJTR6hMPXhIM7Y6Z9c4mnYP6CLQl
	qkcpqMFxHR3jeBPJgzoqV72JHdriHXNuPg+1uFl/02VIwvROF4njbznjdCKRlKfZQnpY/wFU9QP
	Ws/WODGNBAAowiyWvhr2xQPnDFLINdqHzWNGUS0Jas+oNTVCSzigt4pKHFftUNWBoP1jKnyr3rZ
	/sJWmXnEB9nz1WijSTK6/Fo02JP79SIE8+LKZYQl4m2F7qkXiRsZFFXMSbb7D6WD1dOr+hCHBuY
	Z94riiJZWXa0ijbmE0Wu8plxbGyhwDfeB0izwiQ4PUG2MCvyGzNkgGH+Ap6ezvU6/AIe/kICv6Z
	6wE4l0UVM5G641+yLY0Cwz9LalW5VotH8=
X-Received: by 2002:a17:90b:540e:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-36a4514fbcdmr1729123a91.8.1779348942657;
        Thu, 21 May 2026 00:35:42 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:42 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/3] media: meson: vdec: Cancel esparser work in error and stop paths
Date: Thu, 21 May 2026 13:04:13 +0530
Message-ID: <20260521073449.10057-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260521073449.10057-1-linux.amoon@gmail.com>
References: <20260521073449.10057-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003543_469559_D97F93DF 
X-CRM114-Status: GOOD (  13.35  )
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

Ensure that esparser_queue_work is canceled before freeing the
session context. Add cancel_work_sync() in both the error path
of vdec_close() and vdec_start_streaming() and in vdec_stop_streaming().

This prevents background work from dereferencing a freed sess
structure and triggering a use-after-free.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: new patch
 If vdec_close() calls kfree(sess) without first stopping or synchronizing
with this background work via cancel_work_sync(), could a concurrently
running esparser_queue_all_src() dereference the freed sess structure and
trigger a use-after-free?
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 8615a935e86d..a57bd4a8e33c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -358,6 +358,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
 		sess->streamon_out = 0;
 	else
@@ -415,6 +417,7 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 		if (vdec_codec_needs_recycle(sess))
 			kthread_stop(sess->recycle_thread);
 
+		cancel_work_sync(&sess->esparser_queue_work);
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 		dma_free_coherent(sess->core->dev, sess->vififo_size,
@@ -937,6 +940,7 @@ static int vdec_close(struct file *file)
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_ctrl_handler_free(&sess->ctrl_handler);
+	cancel_work_sync(&sess->esparser_queue_work);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
-- 
2.50.1


