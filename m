Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DC0C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K3WTyPeomnpShciKNumkAzLHLjjvlL0zze6H3PBXARM=; b=121aYwUDbpcV6i
	D7Ocy6sylTnMPXkW5pFIDf8nW9IqZPxE0I4lvsED7X7IVOKxatPUJTIolyBSiMVyMYj6b0STO7Voh
	ZdmfzkE8kvRwZpm2njqmHiJUWXKNQyE82OZ3NDsapxdmJntbM2GcwVdb+GLJGoEATg930xvHfkT0I
	iu5w06ha2Oi9HNpq+hzEfEw4yogqrUTzlv3VpbwSeAtsEAtYYIdu9ro6M2M10RTRwc6G2xIZeoNE5
	5YH8ncD8PUSac0rPpxYU6rMyKfuzIIJWmAYo2UIut2hJ+KpD0IL2mgIo16Ur5JGKcVsRlXqrFBDsX
	Dt1UDYh9Jcd57SWK2qqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTg-000000098HD-09cj;
	Mon, 13 Jul 2026 12:09:40 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTc-000000098EX-3HCk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:09:38 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso2876573a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944576; x=1784549376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3WTyPeomnpShciKNumkAzLHLjjvlL0zze6H3PBXARM=;
        b=P6ugSiY7zbxSP4liE9YKzsg5317OtGiANU0bbfZNEEqeEtVxnYSupYqlxNN7lZ8Prr
         FIrEHDsHJVF2TTKo12EFgBiXBtaoEfLUajaGi6m8L+WvyOPr+1glfVVT8zqlFuuz3UFe
         31QoLi54AoOtAXP/bxgxxob3+KX0J99wC2WyH1nWovlmk2tklQ/7F4Cyg+5VqgJAkLiV
         D2bMk/eJ+SdtOuMkLnGMaZqNCnMhLzwbR1c2P/G6ILupSELgxL96LhWM7NPrEriqTU7K
         0QpJQb2bLGFlY1s+7DaEp7hdVuQn2WUU/V5kivuHzhNciKFmcKDQwHDy30dLWkd3Tw+c
         IAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944576; x=1784549376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K3WTyPeomnpShciKNumkAzLHLjjvlL0zze6H3PBXARM=;
        b=TWot8PFjP4V2G+s9fp5F9+J4KUFQfJOgBmwhYDBZ6e8xcB4uzL0z9AcOS5IucrAZJs
         KRw3emnwOoiqZzDSIv2Qdx9BH7caIc7nDB8c8fVVpCFAOiXGgHhQqbs8kiBD/0Umyv1S
         OdzPcErWQqTpL0egIwElYAio0pWERviLs8IC1wFaCpO8ozBgzdNIoyTWF65464ou6Xwj
         39I5kIeax+Gm9rUjY401KUpqo7OWJMoRtoVPbme3/CEwtzBJSQgyKCsRM1LZhe4FI/lb
         PTuf3ECkm1vz2sdWXIy+KkboSFTEJpN3kuRnAIyO82yyyVLO553ssYR4O0lA3jf2aAon
         Xu5w==
X-Forwarded-Encrypted: i=1; AHgh+RqVDR+1NS4UORLwbBG5ResgRhTzfnj8qdauu9eSJnD1v6i0AyHA8BJ9erzacazcdhpx1CYQE1I6h5PB1ZFoEuXI@lists.infradead.org
X-Gm-Message-State: AOJu0YzJd22MZPP9B6Yx4p5RWtl1s18uPk38ZKnPdebHT/PkuQFMI29l
	s0evz/jyZDx3K2fmKE3swZwB885H8Vtsmvi5SpynaEKP0Jh/dnbJ9iSY
X-Gm-Gg: AfdE7cnYlnWfpDMt6MGeZI6J1D6aUAWQkuloqgk2i8kmsYwuNYJjqc/Gs7Va4VtLvhb
	TFYNdWMbmHiqAUIvT8GDGza3wrop8IPJ7HZZ0kuHlyTC4y/ipCE7vOuYnlUueLYfDlxCBHJl2/y
	XjC3Up/Ox0CoqzWxpiI5BlDf1jvkCVS588KVKxiTsVLSVpp63TNrj5Z6/36gP6RPuYGlQ2lxkOD
	LCptf4ywTJfXUdsQrSM4tYYGHbrXN/ZRbgDglxJBLwkOZ2EbErPKMGK9w2vummf7MuaOY0VE/LP
	K4YIJLlJDNFICUuJ+afcttbfWbEMXlvc47V0cSbMX8dyPgT9zO4Sz4WlrCssp/uMXWPBYMxGVJN
	xvfToSrih4hP5HQMsMi0Bw8Vx3TyAeJO90rm9WpUjYiSuqXT3Fv1ekdHd3aZRGZx+02xyZjM6IB
	n/95fWwfEHVw==
X-Received: by 2002:a17:90b:2248:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38dc7779d32mr8371305a91.39.1783944575701;
        Mon, 13 Jul 2026 05:09:35 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:34 -0700 (PDT)
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
Subject: [PATCH v7 04/19] media: meson: vdec: Fix use-after-free race between teardown and ISR routines
Date: Mon, 13 Jul 2026 17:36:59 +0530
Message-ID: <20260713120840.17427-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050936_833491_B09AB822 
X-CRM114-Status: GOOD (  21.67  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Prevent critical race conditions and null pointer dereferences inside
the Amlogic video decoder driver by synchronizing the interrupt service
routines during session teardown and file descriptor release phases.

The hardware interrupt handler (vdec_isr) and threaded handler
(vdec_threaded_isr) read 'core->cur_sess' without proper synchronization.
During a streaming teardown sequence via vdec_stop_streaming() or session
release inside vdec_close(), the underlying session structures can be
modified or freed concurrently. This creates a transient window where a
late-stage hardware interrupt can wake up, read 'core->cur_sess', and
dereference an invalid or NULL session pointer, causing a kernel panic.

Update both the hard and threaded interrupt service routines to capture
the current session reference using an smp_load_acquire() barrier snapshot.
If the snapshot resolves to NULL, terminate immediately with IRQ_HANDLED
to guarantee execution contexts do not process stale structures.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Suggested-by: Druk Tan Ozturk <doruk@0sec.ai>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 22 ++++++++++++++++++++--
 drivers/staging/media/meson/vdec/vdec.h |  2 ++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7fc73d5cdebbf..7ae3d5a9dd6ab 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -484,6 +484,9 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
+		/* Synchronize and flush pending hardware interrupt service routines */
+		synchronize_irq(core->vdec_irq);
+
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 
@@ -989,6 +992,9 @@ static int vdec_close(struct file *file)
 	struct amvdec_session *sess = file_to_amvdec_session(file);
 	struct amvdec_core *core = sess->core;
 
+	/* Synchronize and flush pending hardware interrupt service routines */
+	synchronize_irq(core->vdec_irq);
+
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
 		sess->recycle_thread = NULL;
@@ -1038,7 +1044,12 @@ static const struct v4l2_file_operations vdec_fops = {
 static irqreturn_t vdec_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/* Secure an atomic acquire snapshot to protect against concurrent teardown */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	sess->last_irq_jiffies = get_jiffies_64();
 
@@ -1048,7 +1059,12 @@ static irqreturn_t vdec_isr(int irq, void *data)
 static irqreturn_t vdec_threaded_isr(int irq, void *data)
 {
 	struct amvdec_core *core = data;
-	struct amvdec_session *sess = core->cur_sess;
+	struct amvdec_session *sess;
+
+	/* Prevent late-stage threaded interrupts from dereferencing a NULL session */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	return sess->fmt_out->codec_ops->threaded_isr(sess);
 }
@@ -1136,6 +1152,8 @@ static int vdec_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	core->vdec_irq = irq;
+
 	ret = devm_request_threaded_irq(core->dev, irq, vdec_isr,
 					vdec_threaded_isr, IRQF_ONESHOT,
 					"vdec", core);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index cc0cfafb8a951..d165c343fd022 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -67,6 +67,7 @@ struct amvdec_session;
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
+ * @vdec_irq: irq for video decoding
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -93,6 +94,7 @@ struct amvdec_core {
 
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
+	int vdec_irq;
 };
 
 /**
-- 
2.50.1


