Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB261C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Krigkeb0EY7ngMYX+Y7ADjdq0pOv6Fpp5Q1fhmmedpo=; b=nUBgZCKM+htApC
	XZkMpHCFyW24S+OJfiVQ2s39odpMa0EfMppTccZu8wcbi+Y1GKEwLSNVF47JBxi+QAJa4+CRBNAeZ
	05+NmzgqdNZgzsEo64ncYi0Qp5iv/MC5qeEBNEgRqTXuygPGzuHAm41W0ekV/SS9KGNGXXFzwx4Gh
	YxMuT0BecVwQqh/A/0FoWMUagvp835GMl+pH1m/w3URc82SwAHhTON3RpgJfsGIFXgQLOdCPfKn0u
	bGtelY18Vt2XXoZlCD6AA7eQSbAruIjHIRlTCgGqIh7RkxHUyW9kiSV2V5G22NlSEIooxiPoWFxIw
	9dQ6wZ8gv9bzqu6vvmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTr-000000098N9-19Qe;
	Mon, 13 Jul 2026 12:09:51 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTn-000000098Kg-0lP5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:09:49 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-381018b9375so3449447a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944586; x=1784549386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Krigkeb0EY7ngMYX+Y7ADjdq0pOv6Fpp5Q1fhmmedpo=;
        b=PcMstQAoQMFrOVg6idDXxm20aYk7FiQZNByC5zsK6xXm/NdbJ/TRwPD3psqjTVhx7t
         htiwlbak7NdQ+x7WPvVkewvMC2NPZtVOQigAfEaaTTkM8Npnf5y8qq198T0HdWE8B/OL
         LMlhvkc190TwT2a7oi2QRyIgNm9pCQKZ+irN9zrxFGqjm9rbI0UzfmYQwvtJnsT7Go96
         JCpQyXVw+NYV1fKobIxG2Sb/UB6oVzmOSsnLTXdabyYCWl0TuRqRIEupqE46HaN6McEJ
         Z7ie1FDg3AOU+AwfeGfXXpqlk+L4cNYzTabQ+qYav/9PQyo71j6+pPz1JQiiM/UmtYka
         SU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944586; x=1784549386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Krigkeb0EY7ngMYX+Y7ADjdq0pOv6Fpp5Q1fhmmedpo=;
        b=IE6y+ktfwwU7H+rix+as2JvgetiOtImxalR/pJd3aYRAvYx0Z5gP828Vjmg+PsOsC1
         LrVtFWRAQez+DQlJU7qNQmVslo5iRhhaRTLDZpryeUsbDMdQs/e4KNcHsJYE6JQzQzXi
         6NGzFl90kNaw0jL7yeJ1jN73pl3+oToqUC+7k4aUT8WD5fmB/C+vBIyJfHFRH6N+g37X
         55yOhaNi3GRtQNPi0Y+oOqpbqzh/VvtYkAbmFvesku52oYUfPho7/M5UA9LdmvAWOtVt
         5g4GTMWVZPcfyxIJiRCyTN8l7iPlCtwLMN4IfUW68YIVwG2o1hiYWQS5bE/fwd6Avbco
         vSQA==
X-Forwarded-Encrypted: i=1; AHgh+RoYVRE1GiltRV5HpkwveZ8PfcuojDtTlLYeAZeFTsxBwmzxwmjShhS/VwUpvO+WPgcghOCiawE3PxsV5wIoCSc/@lists.infradead.org
X-Gm-Message-State: AOJu0YwZaH4mpseR2k7do4e1uYWJNWGmPcW73hdQ7G4KbVaXdhiUjhTW
	YFdgmJO4apw7QSXiAFD03y5Uz+iXg3yF1kaiXFcBH0XDd9532svZpZWe
X-Gm-Gg: AfdE7ck6gnb05wU9lM1I/QnvmPOp7x//9gdf0QytzBmqAjZV+p2EEx+9KZFYg12pcPw
	fZRRFNnpB+DX3WOugZC+fuGZSRnd06absXZSibtvC1n1zSoqxNn++7LYKRMYyvOJnNLf3pJBMlm
	1EuLVEyBA/VEkGgQeBYXt4hOr5EeKmwARngS20wOHEBOsHpTFxrDjbgy3o8V3jgJJc/EHQTaeMG
	HasXPFdfSFMe40DTQ9dDklAUEH29+vEyR6I5qXOfdkXYPpQrR/LbL7hwDFqwMXHvAT4Hm04UQH8
	1FvWJNgPa7+7dLS9TWAVy6HgAw68C6rK/Z6eNLR0uwahpIvB6WEUS0j2Q+UoRgMwU5F44SgNvlq
	2TjsWwOfqQodXl2/xjhLuPsexbiR4x4hjNBOb0FJcFfY/A4twkPSU9roS6y3KJ4zn1EC/CKbJ79
	cmG3dUK8XHJF2zhxlb3grW
X-Received: by 2002:a17:90b:4ac1:b0:38d:e0c4:c955 with SMTP id 98e67ed59e1d1-38de0c4ca49mr5634290a91.15.1783944586225;
        Mon, 13 Jul 2026 05:09:46 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:45 -0700 (PDT)
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
Subject: [PATCH v7 05/19] media: meson: vdec: Fix race condition and synchronize esparser IRQ
Date: Mon, 13 Jul 2026 17:37:00 +0530
Message-ID: <20260713120840.17427-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050948_366232_8BC08F3F 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Sashiko <sashiko-bot@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

During session teardown sequences in vdec_stop_streaming() and
vdec_close(), the 'esparser' hardware interrupt handler can still be
actively triggered or executing on another CPU core. This creates a
transient race condition where the ISR attempts to handle stream data and
allocate internal tracking state structures after session contexts have
been modified or freed.

Update esparser_isr() to read the current session context utilizing an
smp_load_acquire() barrier snapshot. If the pointer resolves to NULL,
terminate processing early with IRQ_HANDLED to protect against
concurrent dismantling.

Suggested-by: Doruk Tan Ozturk <doruk@0sec.ai>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/esparser.c | 8 ++++++++
 drivers/staging/media/meson/vdec/vdec.c     | 4 ++++
 drivers/staging/media/meson/vdec/vdec.h     | 2 ++
 3 files changed, 14 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
index 4632346f04a9e..37749ede308c6 100644
--- a/drivers/staging/media/meson/vdec/esparser.c
+++ b/drivers/staging/media/meson/vdec/esparser.c
@@ -60,6 +60,12 @@ static irqreturn_t esparser_isr(int irq, void *dev)
 {
 	int int_status;
 	struct amvdec_core *core = dev;
+	struct amvdec_session *sess;
+
+	/* Secure an atomic snapshot to protect against concurrent teardown */
+	sess = smp_load_acquire(&core->cur_sess);
+	if (!sess)
+		return IRQ_HANDLED;
 
 	int_status = amvdec_read_parser(core, PARSER_INT_STATUS);
 	amvdec_write_parser(core, PARSER_INT_STATUS, int_status);
@@ -439,6 +445,8 @@ int esparser_init(struct platform_device *pdev, struct amvdec_core *core)
 	if (irq < 0)
 		return irq;
 
+	core->esparser_irq = irq;
+
 	ret = devm_request_irq(dev, irq, esparser_isr, IRQF_SHARED,
 			       "esparserirq", core);
 	if (ret) {
diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7ae3d5a9dd6ab..7689ffdb2e500 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -486,6 +486,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 
 		/* Synchronize and flush pending hardware interrupt service routines */
 		synchronize_irq(core->vdec_irq);
+		/* Ensure esparser ISR finishes executing */
+		synchronize_irq(core->esparser_irq);
 
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
@@ -994,6 +996,8 @@ static int vdec_close(struct file *file)
 
 	/* Synchronize and flush pending hardware interrupt service routines */
 	synchronize_irq(core->vdec_irq);
+	/* Ensure esparser ISR finishes executing */
+	synchronize_irq(core->esparser_irq);
 
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index d165c343fd022..c4639cf33e73e 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -68,6 +68,7 @@ struct amvdec_session;
  * @cur_sess: current decoding session
  * @lock: video device lock
  * @vdec_irq: irq for video decoding
+ * @esparser_irq: irq for elementary stream parsing
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -95,6 +96,7 @@ struct amvdec_core {
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
 	int vdec_irq;
+	int esparser_irq;
 };
 
 /**
-- 
2.50.1


