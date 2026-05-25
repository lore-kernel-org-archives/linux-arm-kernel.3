Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1105FCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ib1oZbigCdwlVvPfRDEBvGe4OjSQvC3V53nI1f6TImU=; b=ChV1uSCmgexGHn
	IDS2A6kKxdT6mFxapDgk/APNsut9Kc8D59YFdkZytsO1OY7EEtLRnL3C0TP0x2z08sT3QjJeAV+YX
	SiW1PBuufOL1EXOard5a6KQTS4y62GogqN3uEiQiDTiv6G2DHI54mWnPp51YlN1W+KUzMkpbGsA1X
	bVGJj6miX8qvkwcXjWg9iEHpxaejYjicS0Y+L69VnM0x/sfA/aPduoCVeRhXFagCsaDQKcdNGBePw
	sWczl0j8pGA3TL9xWWpotMpOU3b6e2LGccz/DEDWVLT0FwnGXf6g+UbjD+QmPJHbh6sof4WArgDKV
	pGsbI0jpUeqLhk4FC25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzj-0000000Gsam-2Th5;
	Mon, 25 May 2026 09:53:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzi-0000000GsZN-2Kvo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 09:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ib1oZbigCdwlVvPfRDEBvGe4OjSQvC3V53nI1f6TImU=; b=gZcXaFXCWfpXMDJRhtb9TdtdbJ
	tw9X1dZBW5tJ8THqP4fk4pguxao+uNs7Mbd6a96WzkoB4X8ghpEbJNOUQx/gsuWVTQOa3Inpckmj1
	4fXQUbl/R8wEaoVpNAFqOf98pYEsGc898rvzqzS2dIB96BI1zhw/afz9nFw6oTkZ+Y4rV47qd/zCJ
	QCosmCm6ZMza4+eJeJLu5/9VTxES8mmN6zBYuGHQ3frlB471lTbuS0korflWmf6QI85P0U7hrV1jG
	vBaGJsXeZXH+X806+zcn0vsFohY/HdHJofE54++ypP4oqC3sN4XKS/CfMOgUQXLUS/2pFKiH/Q7I2
	/ochavHQ==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzf-00000008wd8-0rN6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:53:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2b458ca2296so69257225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702786; x=1780307586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ib1oZbigCdwlVvPfRDEBvGe4OjSQvC3V53nI1f6TImU=;
        b=Ms2jUB9cOkzzYnZ90KS7ssakmFv+5CI17Q+/iZ9YnP0w1CdGAocLiZ+VJbi/7pXWjf
         B/zSM2C5wju3X0Wc5RXk0g9JSTFEXd28X1aATBeDPFR1DGIVX5tAa6hoqjzReAEjF6iG
         PWVX8fFO1p/tfBgYTi0KeEhcs9M3LzMfJfY/3c1/MugDxeMrOOeEOSDvXP02bS2y1IBK
         vGTzON1TrXH3L7WvKi8XVAo6AP9ZW4gAFKySTzgGpBttWK99FMGeSLFp8+gxB2HjtUkV
         B7g4jLz5NpYBcyi71ljdLB7GH62d1XumK9JBsG3expfNB+ixNXIu2TiY9TXoFOYlTLxu
         tOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702786; x=1780307586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ib1oZbigCdwlVvPfRDEBvGe4OjSQvC3V53nI1f6TImU=;
        b=EQBIFhq8FdjChpp05WlhTua8oKkU1LpY68ztLfDL4lJqnQDixetTt32GxSzcVIXTgL
         uas+1EncQmTSyjk7rr1AvqhM0FG09Pa5LvWnXpsZihH+1eG8U5+jKlRrLoLPDzodrpeU
         2pQDfCiTdFq2N0CG+czIKKInpuuiIKVhcMmOr9EFT4kIle/3o/pSmv22fVbgU/WYP02B
         rq0TF56r7bOGT5OcghahnzhIQBXg26RMdHFWWijNqCcuA8GKVYnM0NeMvoOKjypMIunc
         F3BaW4bGCxJJZ6++Rf+DCB2yO1yE+qpHUtpkEh8R/ufwREAWhkMm+ao6EBpv71zBBM0e
         mUHg==
X-Forwarded-Encrypted: i=1; AFNElJ9cGxCNn7GuY540n3RzPzUXRYQ/gUqFNbgp7Mkt/5lroh/OQHrXVYguJXrtT2bZmrzhzNmUcx867QXe2mR1h2lW@lists.infradead.org
X-Gm-Message-State: AOJu0YzEJYsLW4FnUyb8XK18HqPvZ6e8rsA/i7Xn9ZVxe5REWukYMuQO
	pr2s+Ghv/q3MPpTk03tgjvLtDoz7iTvCNiPQ4eaVZN6lxsuRmDiTCTGW
X-Gm-Gg: Acq92OGG73HC6Oww9/+aHjXenLmusjKbNvVvo7+FFZrKlnAWoNXYOZJMBbx/hXpGUrH
	I+DNCaXbv9O6zcmnu3UTqXpJAXQPwG4+qEh4nAj2KDcxhmNkMz5+5VV9uiHEM4VFKlNx30B7wyy
	zK7OxBYzAZCDzJNXzqBPeXd6KMGNDMQCGmetyYeZ2BX6/OAWNjedF4U5WE+yoB4iG2oC8of++J7
	bUhf26zmdVSTd8ErAy/hZxtBOLa7Txk8L1427cNVNogrPdwUt3nB2GGrN/iLSGabHTE8CXuBb9t
	MvY910uMqgcxDRel8hTEq7chOGObyrVXRVL28dQuDw6UoLmIdFa53fXLpdTeAS4AqWVQN6PSQB3
	J3pz6Yn+TyWacSgWMayusFUOi35KvRZXrCTM2vw4vc6foFFOEsU/mQNxjTnAd7VGgtDMFxt3fY3
	m7olYwGYp9ILqnhhMciZze
X-Received: by 2002:a17:903:2f90:b0:2bd:ef15:9fce with SMTP id d9443c01a7336-2beb063227emr153939475ad.20.1779702785924;
        Mon, 25 May 2026 02:53:05 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:53:05 -0700 (PDT)
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
Subject: [PATCH v5 4/6] media: meson: vdec: Handle kthread error and free codec private data
Date: Mon, 25 May 2026 15:21:52 +0530
Message-ID: <20260525095216.12078-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_105307_733004_1F68AA49 
X-CRM114-Status: GOOD (  17.14  )
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

Fix this by adding an err_cleanup path: if thread creation fails, call
codec_ops->stop() to release the codec context and clear sess->priv,
then power off the hardware. Also reset core->cur_sess and sess->status
to avoid stale references.

This change closes the memory leak on kthread_run() failure and ensures
proper cleanup of codec resources.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: The vdec_poweron() function invoked earlier allocates dynamic memory for
the codec context and assigns it to sess->priv. When kthread_run() fails,
this new error path calls vdec_poweroff() which stops the hardware but
doesn't free sess->priv.
---
 drivers/staging/media/meson/vdec/vdec.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 52ace4de967c..b31bf08af88e 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -345,13 +345,25 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 
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
+	if (codec_ops && codec_ops->stop && sess->priv) {
+		codec_ops->stop(sess);
+		sess->priv = NULL;
+	}
+	vdec_poweroff(sess);
 vififo_free:
 	mutex_lock(&core->lock);
 	core->cur_sess = NULL;
-- 
2.50.1


