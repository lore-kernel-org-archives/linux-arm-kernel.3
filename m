Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885F4CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 07:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fw23X1FwjGe46vUwZBuX/t+y72XuixGwM1Rny5Zyri0=; b=qF2jKj/CRFJo8SJo/E6ydNShqc
	yKRFjEC4OaLEJDtRgMBc5cA3GXH4qpQ5xzG4qsRhxoei43lCMebog8Reof3QxQXYIr2dpHMRE0duy
	+Xtr5K6iyIhWQU7jrmM/YFe1LHlc9/jZxPHzVF5Sja6rvhB/VVT1y0nng+lRfgoucXxWvp3exgYQd
	znDRpLRx355z50jcHw7E9mcPKSPFLdbKKwifqEAPtZ+ELhaFfhi4YHrqKOB2vTpET6W8z0EHDRSdD
	bXgBoOHuvM2SaGZZ7WcGlnbfm0FUxFLevLi7MRBCYWd7o+xQbDzeJuWlXh4NOaEARW2QFLZ3433NW
	Hn+eTFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOYa-0000000FORO-0EnC;
	Tue, 16 Jun 2026 07:50:00 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOYX-0000000FOQZ-1saa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 07:49:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-45ef616daf6so4788617f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 00:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781596195; x=1782200995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fw23X1FwjGe46vUwZBuX/t+y72XuixGwM1Rny5Zyri0=;
        b=VzKqc4Xf2468p0NKT7X/o/dU385YHTkp1uUQuPv382/z6AViGxBmebTyyQH7WxzWIx
         eMKk0nVsSvmMf28vpREe3HZWtItASYs8503Q9pIVdn7GHkTJbeaofNa+8lEHAPjgo7Kb
         mqaexf9nuN+TDv8Wl/dlY/UHfsvEpYQq4eW8nzp0Dt3TPDbw75ygL5R691oCzV2bRh7q
         RYfSLATLyNzM8U2HLdNba+zDOjkvSq1NTHoWQtoj9vozHWJjopEli4yhHe0ACthsORax
         5g0deTUXkCyjx9n7KTAz/IVdT9AFOS+mrr7/+ElJeIoI9bDT4leqQOWtButClnZL6+dX
         GibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596195; x=1782200995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw23X1FwjGe46vUwZBuX/t+y72XuixGwM1Rny5Zyri0=;
        b=rf66sL81SjYYR2UbEyXkY52PfwaSoxQq0osBK567HI4+3ThL97NbqaLhhdrnr7SFP+
         E3Io54WvZBPQ0dDZH25UudnHzzNiWdqOiaKuPx4b5dRM1LRnbRT8/Fi0Th5d/gMXaNnO
         iY5SXbyMzP3T8mWgaFnfMnpaZCGrRaMt4IEPkry5/dNqWhen0APJeNxto6rnCpCxXGRS
         TMbosojXyz4NT9OWZQAytz7JW6YY04ZK64PXJyn885CcQ+oCGc4hbMHIN8QzVXrYrsB4
         UsAgiKIfcKYEds1OmtlgOt8YZmUwEj6QKd/NlRJgTs13jFfmt4iuHTP1InhLguhJ5zT/
         YWDA==
X-Forwarded-Encrypted: i=1; AFNElJ8aSMWnGpXkhwu8hVCtEcoJqLZ+m6ikyrzuYAK33n1urabc14IrVQkF1BCgjA6byExhjUQ88o9s2XlMIywxQO0u@lists.infradead.org
X-Gm-Message-State: AOJu0YwRC4p8EG+mbJy+u5x5UDn0kbeOTlOZzBPoX7a4e6rqwMwDBISq
	b4ypr+AuSn8RAcT/pKL5j/ypb1eKyGFQP6Jn7Xh1dOUGTYAYPQrI+MFM0cVFpKcUXxLx
X-Gm-Gg: Acq92OHa1yN6lPPv6joS6NQvyD5LmWulA7kWRuyFpyokVQUgxIAiXaE/Okwy+aM6jQF
	dblBX9T7yijYKNd3FMxqIEQgFdgnktAwEwQoc8TxTEW/sPvXv/08vcam8jM+fkH2tYNXq/APXU5
	xRZV06Qm2ccCU2MkGLlIoLIg8dIBPAT6h1MbAn/sxCtNFtxij8IE2x0fW30EepsSX7bI54kTfYK
	597SeiKPuxo6Ff8xdtd2F3DJMt9j0Ngu0/IiwGlLMOd91M3iylz8prhw+gx6cYkqDOd5YwuLSJg
	iG+5NihtsmW9FiNGLyuAHwRM1kikpAgn22h+mGjKCWy4G+AetEYwSlJTQwloAKz8V8niBBZXZ45
	0S8WrycWIWgv/pwmLqRyj5y7UKd9fvbgEtt8VYxpq3kVgHVEJqoLLHgbOU43mEnSxORcjeNfiN8
	PwV0/o6O41uzmc0wKrvx3WYQNm4EOmu2HDSyx1wCsyIwn0EsTaUS6zhYTsnCUXe6kxhYs6Ss9K+
	28VSbxTP3qNT7qQ7K9PIGpquil3MqMc7tvakG8mEJ8StBAQgKWZIuie
X-Received: by 2002:a05:600c:6286:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-4922ff93b2cmr36681535e9.11.1781596194984;
        Tue, 16 Jun 2026 00:49:54 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm44475179f8f.0.2026.06.16.00.49.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 00:49:54 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: neil.armstrong@linaro.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com
Cc: jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: meson: vdec: fix use-after-free of decode work in stop/close path
Date: Tue, 16 Jun 2026 09:49:52 +0200
Message-ID: <20260616074952.93076-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_004957_547436_E20912A5 
X-CRM114-Status: GOOD (  18.93  )
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

The ESPARSER worker (esparser_queue_all_src(), scheduled via
sess->esparser_queue_work) dereferences sess->m2m_ctx and accesses the
ESPARSER/DOS registers. On the stop_streaming()/release() paths the
buffers and, on close, the m2m context are torn down while this worker
may still be pending or running, leading to a use-after-free of the
freed session state.

vdec_poweroff() previously only called vdec_ops->stop() and disabled the
clocks; it never synchronized against the worker. Two problems follow:

  - The decode (VDEC) interrupt is threaded
    (devm_request_threaded_irq(.., vdec_isr, vdec_threaded_isr, ..)) and
    its threaded handler re-arms the worker through amvdec_dst_buf_done()
    -> schedule_work(&sess->esparser_queue_work). A handler that is still
    in flight can therefore queue the worker again after teardown has
    begun.

  - The worker touches ESPARSER/DOS registers, so it must not run after
    the clocks have been disabled.

Quiesce everything in vdec_poweroff(), in order, before disabling the
clocks: vdec_ops->stop() masks the VDEC interrupt in hardware so no new
IRQ can be raised; synchronize_irq() on the VDEC line then drains any
threaded handler still in flight (the only context that re-arms the
worker); cancel_work_sync() finally cancels/waits for the worker. After
this nothing can re-arm the work, and the worker can no longer run with
clocks disabled or against a freed m2m context.

Only the VDEC interrupt is synchronized: the ESPARSER interrupt handler
(esparser_isr()) only acknowledges the start-code-found status and wakes
the internal wait queue used by esparser_write_data(); it never touches
the session or schedules the worker, so it cannot re-arm it.

stop_streaming()/release() run under the video device lock, not under
sess->lock (the mutex the worker takes), so cancel_work_sync() here
cannot deadlock against the worker.

The VDEC IRQ number is now stored in struct amvdec_core so it is
available to synchronize_irq() at teardown.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: also synchronize_irq() before cancelling the work, so a delayed
    threaded IRQ cannot re-arm it after cancel_work_sync() (raised by
    automated review). Only the VDEC IRQ is synchronized, as the
    ESPARSER IRQ handler does not touch the session or schedule the work.
v1: https://lore.kernel.org/linux-media/20260615140529.52653-1-doruk@0sec.ai/

 drivers/staging/media/meson/vdec/vdec.c | 21 +++++++++++++++++++++
 drivers/staging/media/meson/vdec/vdec.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..5304987546fa 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -123,6 +123,25 @@ static void vdec_poweroff(struct amvdec_session *sess)
 		codec_ops->drain(sess);
 
 	vdec_ops->stop(sess);
+
+	/*
+	 * vdec_ops->stop() masks the VDEC interrupt at the hardware level, so
+	 * no new IRQ can be raised past this point. The threaded ISR re-arms
+	 * the ESPARSER worker via amvdec_dst_buf_done() (schedule_work()), so
+	 * drain any in-flight handler before cancelling the worker, otherwise
+	 * a late threaded IRQ could schedule it again after the cancel.
+	 *
+	 * The worker dereferences sess->m2m_ctx and touches the ESPARSER/DOS
+	 * registers, so it must be cancelled while m2m_ctx is still valid and
+	 * the clocks are still enabled, i.e. before the clk_disable below.
+	 *
+	 * This runs from the stop_streaming()/release() paths, which are
+	 * serialized by the video device lock, not by sess->lock (the lock the
+	 * worker takes), so cancel_work_sync() cannot deadlock here.
+	 */
+	synchronize_irq(sess->core->vdec_irq);
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	clk_disable_unprepare(sess->core->dos_clk);
 	clk_disable_unprepare(sess->core->dos_parser_clk);
 }
@@ -1053,6 +1072,8 @@ static int vdec_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	core->vdec_irq = irq;
+
 	ret = esparser_init(pdev, core);
 	if (ret)
 		return ret;
diff --git a/drivers/staging/media/meson/vdec/vdec.h b/drivers/staging/media/meson/vdec/vdec.h
index 7a5d8e871d70..9a50116a2665 100644
--- a/drivers/staging/media/meson/vdec/vdec.h
+++ b/drivers/staging/media/meson/vdec/vdec.h
@@ -66,6 +66,8 @@ struct amvdec_session;
  * @v4l2_dev: v4l2 device
  * @cur_sess: current decoding session
  * @lock: video device lock
+ * @vdec_irq: IRQ line of the VDEC, used to synchronize the threaded ISR
+ *	      against teardown
  */
 struct amvdec_core {
 	void __iomem *dos_base;
@@ -91,6 +93,7 @@ struct amvdec_core {
 
 	struct amvdec_session *cur_sess;
 	struct mutex lock;
+	int vdec_irq;
 };
 
 /**
-- 
2.43.0


