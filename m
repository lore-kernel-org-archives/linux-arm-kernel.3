Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB6CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnt3ypfWeNL23UY1KrHNZewux6mQtgVXM5HeMULrIrY=; b=e0JzVVDOQsgjP8
	S/Rt3QRmdbQKSAY4CQNs2RXrKfAaH3y1Bb0GQb5i+YMMkKljKcrmc9x2UF8DJhpmqDtUsDCvGROr4
	q11PsSeE9oPSWjk5bYbC2p0Oks4c4FjN8mV98yRc1PMZGVGpNrag/nFV35cv10oYxupw8rPXSiM/j
	TBkFBtQMtzYlKPKsJwPrm6nKQrbJI+uf3qvqXBG5R0ANQ7oSVc96LKUUXjTn5FhKka94QkDf7B3G9
	MgZgHqhtGQTL5tGMaGRGj9BRz8todMEXfPpkcJnQa3wh5fT4MBYEqF9IouuiwBXpAMhAaJwWfKvnI
	yp5qeavgz6oFQlJgRPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVF-000000099Jq-3sLI;
	Mon, 13 Jul 2026 12:11:17 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVA-000000099HC-0V8I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:15 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38deea72eebso932180a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944671; x=1784549471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnt3ypfWeNL23UY1KrHNZewux6mQtgVXM5HeMULrIrY=;
        b=jmTHSFhxWLaBI3/sFEYikae/aACqqNvHCHVyB99f/1nfTXhg9nI29il6PtbdxVFGBv
         ZMY+AzCWIpcQCXEe1xWm9WcRxpFGHOJ/jJ7OWdLEK6D8nJdFH5sp+BUjgManyPjPcux7
         y+vkjWneKLFRoJBxuq70+1bni49YISCPivTvUrpL5sID/YSpaOvk0sm0HQ+CgTiRCbRG
         i7CQGenuuBy++tzsWoPvmZFfhc8nxg3J81gEla/4YL0fZgSlku9JPw1AhtyHr3Ajl8Ch
         4wddTNcd31308IX4/CO9Ln6X1kcELwZTiKxJT229HLtXyxBt44lBz8fxLCAdH/iCOP70
         ZBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944671; x=1784549471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnt3ypfWeNL23UY1KrHNZewux6mQtgVXM5HeMULrIrY=;
        b=DsTeQLWBOumyK7sPv9OR5TP00WXFOJzUNW21sqFuZquMcyqWSFUPHBI8YNHaWIVnkl
         5UYf6BEBkiTWLhn9Pz66alMxevJNjWK1kqBMYudtBTx6m6rrpMfU8GicY2aNrlBCxggh
         dudsQ7cObAXKSDRJLuBjB+2Lfm7jmZzUma9Mx2wBQYfcqyMWU8vAVerMJFh6wC8KfHFQ
         xadDhX9J9HguQytNSwVybmGTCjJgetM/X027/cdKfIRvf1G3FtXHW+bcXCriLA/PxLMP
         B4zdxAP/IPY9+ucWYSka9S8EsIiRK4wqawKlLv2GmOtvjCacPGmkexabhC+Ur54S8+XV
         vdyg==
X-Forwarded-Encrypted: i=1; AHgh+Rqt8IL5K8LfDaRAoD0WmEjyp2p00GXKZqzKmc/1fEUxtqd1ngWoZ4iQ6x2BqbGORzjYOEDYJjDqAiSvsafm/zlP@lists.infradead.org
X-Gm-Message-State: AOJu0YzyiOBHI6PI6re+XwG7E5ouwtDkgU1jBESW8uOJ4oipKuihoA4V
	OhS+7ZHaKeHDG5PvwOoe4DeUisP3zWWF1Z2f9VnToXZM2H4h1MLc63oeRGJEIQ==
X-Gm-Gg: AfdE7cl+FB6TVKa8Kt5bWje1J+/XBjfh9rtlCdOKervLRLZGcRxHQN1FU7k8NUKWjEy
	yfYwEene22MkcUxf8aN4xhaCfasK8cfx42zbx0tDK9DWFEmTmzmSqIlds6mtADoVgFhZQkQ/mqy
	h9ueM0HRNDNSweocTspNzMGXQAY4icFLVcbpvbV/NfwK0lhz+6sdzuRbUWDbjmgV0PA4Ml1B065
	FxSK/cItuMP+aw7isXoH/vkKBXVVRFRD31Y+LVK5v+HWpovyKlXYjUOAmYYvfWMW6smAI+BQYiz
	ag1b+5dfUewtRmLN6jq852r+Q93+w5V8gtgc+a/kqwsH8oczOnEgc2r17E6ofBin86ZUtbHNmYY
	s44aEJkYoOBJsRFWM/XAnlk5TDQCjRSw4FsIGkhxMxKOWVNSU7hPDA8NW0QLl4WsXCkfu1y/fvH
	jFdQUKfRcHbei8nvcWh+Sd
X-Received: by 2002:a17:90b:4990:b0:36a:a16b:5f6d with SMTP id 98e67ed59e1d1-38dc74c4c2cmr9218450a91.7.1783944671501;
        Mon, 13 Jul 2026 05:11:11 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:10 -0700 (PDT)
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
Subject: [PATCH v7 13/19] media: meson: vdec: Fix race conditions in job abort sequence
Date: Mon, 13 Jul 2026 17:37:08 +0530
Message-ID: <20260713120840.17427-14-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051114_797321_3CB843B7 
X-CRM114-Status: GOOD (  15.33  )
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

Implement proper cleanup inside vdec_m2m_job_abort to safely stop
the hardware job sequence during a streaming abort or teardown.

Without this, if a job is aborted right after being triggered, the
deferred work item (esparser_queue_work) scheduled by device_run
could continue running concurrently. This leads to unexpected behavior
and potential use-after-free bugs if session structures are cleared.

Fix this by flagging the session to stop via WRITE_ONCE, synchronously
canceling any pending parser work, and safely clearing the active core
session pointer under the core lock protection.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index b3e1d99e8889f..ac86a9c4febff 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -167,6 +167,17 @@ static void vdec_m2m_device_run(void *priv)
 static void vdec_m2m_job_abort(void *priv)
 {
 	struct amvdec_session *sess = priv;
+	struct amvdec_core *core = sess->core;
+
+	WRITE_ONCE(sess->should_stop, 1);
+
+	cancel_work_sync(&sess->esparser_queue_work);
+
+	mutex_lock(&core->lock);
+	if (core->cur_sess == sess)
+		/* Safely clear hardware ownership since we were confirmed as the owner */
+		smp_store_release(&core->cur_sess, NULL);
+	mutex_unlock(&core->lock);
 
 	v4l2_m2m_job_finish(sess->core->m2m_dev, sess->m2m_ctx);
 }
-- 
2.50.1


