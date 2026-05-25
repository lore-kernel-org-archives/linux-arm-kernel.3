Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B737CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2KznrLCQ77VZ51Z4KvrxVufB2DqA7HTlU0nEjlF/zw=; b=YmjSqIBRzDnabS
	Kutq45c8wRmGJnryNpxejefxpmvw73WCCayKziHLb8fw/CXzm7KNo291kUAl4GNYz52vv/vdRlP6o
	+DtSb9+BfkM0GPWp3k6ktC+/aViXJQS5EDL7nyzgUcV/wcMcTEWkIeLyYGur2nxM/WSYuy/6Tmp0K
	5TCzhCNVEBnFK73R/IPVOoAoLzfZCqQGkYVNPyMuJ4vNSVj+uVd/S4vdiCeCFMt1hr5LuRL3TH5zy
	7ecMVST8fNIGCtFSSJutxwAeZ0WM8NRaAgIbDRfzrRHoDPGKxA2dsqve651caf0OIZUlSGBcms+87
	8uHH5kOyDI3gX9eLthPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRza-0000000GsSd-0r2P;
	Mon, 25 May 2026 09:53:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzW-0000000GsPV-3IVS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:53:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2bd2051167eso45530195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702778; x=1780307578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2KznrLCQ77VZ51Z4KvrxVufB2DqA7HTlU0nEjlF/zw=;
        b=H4FArlHzPIG26K5zPKk/IbfMqfD5XIb+GGO1kfvwdHB/h0z76qVOccCD274kGN97yD
         PgbOLJ0rL8DTkK/5nsAAFnFCxgSwoaKkJxv9yr4y0MN+fk3W7rHQqwhyLrNgIiNVhj21
         j0mUrV4Z5gb5d7LjsMW1RYwxq16zjs7opceYIallj8nlPpr+uUVQVKY0C1wPHbmttxtQ
         kucY/Z//5yn+BLqXhoBQ6D35r4s+csHGeG0vjh3iW53TIiU7Zs5D2fOSjTQIezNNM3fa
         3hMSOATEEKwtgo6kGBofwZDeYBJYXV7QNJZkaFLldR3zqYs51eNVvtpJph9MxEuMuXrc
         S7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702778; x=1780307578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v2KznrLCQ77VZ51Z4KvrxVufB2DqA7HTlU0nEjlF/zw=;
        b=adAUimRO14ojdGIIauNQslngjZQPuucoqFx0AMaZbwLXsatq7Fg5GVIFaIybTa+FkO
         nfvNgOqTUqp/M3G7yFjWFt61ap76/mJEmQ0H46RZre1lNgC8dQ6S81tN5JkfBaVqzDh5
         wWynIDqSA41f3SuS1Kb5FG44scC2nHLViiFw117/yqTEYbBGoz8Ex47KKQmfEsZnCj9t
         eu9XxkFGUJuu9c6v2PZ4hJdLR06VLchc5lfLFK5aKOoAFLzXLj1fl/Fiotn0eESTPOSB
         CHLQYt7YoD7IOJ77ptvcVhGkeI40CpyEipW/Kfe9IRMNS1vOkqkjB4xh5i1nMP+6TpjF
         pmLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tHyGCu8RkCeaWoUpSHOyEkMyZflsINxBASxJcoZdk6RINjvF/hzsOLr+YAXrv2wOV3tGTYvgjsxaYCxalSniY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz82/ah0lYuGI/dFpL4/dz0v0fW3gg6p5Qkjq7stm9CAqNVqe5j
	14vM2pU5KOyuTynIAw1YhXLMHc2qnQlwUoP3QpC1uSJwRjreisy6NTVe
X-Gm-Gg: Acq92OGyQ5DGLCsz05h1+gq+3LkMAm9jov2Tpg1WHl1KiHM18nVMhX+IQbPp8k3vxCd
	nDnvPSAJ1Q6gYz6McNH0i6i3EJuayd30LkqG66hwDxw9MxFklV+HfiyoWGKjxZBXdwrwTlTxutD
	kl2FtsbNuWC9ujdHym0k5ZDl030vTR6YkcUyXUSQoBqYWzprT9isZZU+ssbws90TvBxjnnw8aXG
	5TGSxiK8IJVfwvMrKfDnOfYoo+j/k/Dx2ao4HkKz4DwfiT6BVP1165SDYgl4KMso0LxtzjdUCWt
	UPbpaJDCwFZ0Fw34I49yYEgLkFG2CUjQcGshC8vcCLdEd2L7RPfTyNCGJ1nmmFy7C7lb2asLfHG
	FaKsLIpRszWjy76Z/TuWinaxfdKo4zKN7sCNWNP2erSiOKb0OkTLObp/1JJLNaH16zGgJoGpP9X
	JkwmkRd3p9WfMdGIZZXE9i
X-Received: by 2002:a17:903:1ae3:b0:2ba:bfc:76a8 with SMTP id d9443c01a7336-2beb057f8c9mr151250385ad.16.1779702777738;
        Mon, 25 May 2026 02:52:57 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:56 -0700 (PDT)
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
Subject: [PATCH v5 3/6] media: meson: vdec: Set cur_sess before hardware vdec_poweron()
Date: Mon, 25 May 2026 15:21:51 +0530
Message-ID: <20260525095216.12078-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_025258_830803_6B1A0D70 
X-CRM114-Status: GOOD (  14.55  )
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

vdec_poweron() initializes hardware and unmasks device interrupts. If an
interrupt fires before core->cur_sess is set, vdec_isr() dereferences a
NULL pointer when updating sess->last_irq_jiffies, leading to a kernel
panic.

Fix this by assigning core->cur_sess and updating sess->status under
core->lock before calling vdec_poweron(). This ensures the interrupt
handler always sees a valid session pointer. On the error path, clear
core->cur_sess and reset sess->status to STATUS_STOPPED to avoid stale
references.

Following change also strengthens the hardware exclusivity check by
holding core->lock during session assignment, preventing concurrent
sessions from racing through cur_sess == NULL and corrupting hardware
state.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: [Critical] Race condition between hardware power-on and `core->cur_sess`
 initialization leads to a NULL pointer dereference in the IRQ handler.
---
 drivers/staging/media/meson/vdec/vdec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index e72f54af026e..52ace4de967c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -334,6 +334,11 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	atomic_set(&sess->esparser_queued_bufs, 0);
 	v4l2_ctrl_s_ctrl(sess->ctrl_min_buf_capture, 1);
 
+	mutex_lock(&core->lock);
+	core->cur_sess = sess;
+	sess->status = STATUS_INIT;
+	mutex_unlock(&core->lock);
+
 	ret = vdec_poweron(sess);
 	if (ret)
 		goto vififo_free;
@@ -344,12 +349,14 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 		sess->recycle_thread = kthread_run(vdec_recycle_thread, sess,
 						   "vdec_recycle");
 
-	sess->status = STATUS_INIT;
-	core->cur_sess = sess;
 	schedule_work(&sess->esparser_queue_work);
 	return 0;
 
 vififo_free:
+	mutex_lock(&core->lock);
+	core->cur_sess = NULL;
+	sess->status = STATUS_STOPPED;
+	mutex_unlock(&core->lock);
 	dma_free_coherent(sess->core->dev, sess->vififo_size,
 			  sess->vififo_vaddr, sess->vififo_paddr);
 bufs_done:
-- 
2.50.1


