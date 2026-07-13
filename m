Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF72C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R5VN0Op/PYgxXXGiNzBVb7Bc2A/YDsd2gosba72MniQ=; b=O869EnmBHrW8vb
	Kln53nWbvf+YHNY/f9xoUbyLiH0DAlo0ms4CMKyCW0GDePuoyaRGkAlRi+pM8Rpjy8PCc87VIjuJT
	GisMHg8LMf4SkPf8uJ4JJcYOJjvxxhOUkxZcwtsXsm8wzctd0q7WqEsJZzJl2KqRzHYro1SVze4Np
	EaRxJuSY0eMI2IPriXBF+QDfB4m71No64D7Zq8LNSW7XiFabsjj5uqvmEK4AqGXcg2BJfwSKdISO8
	IgERCe3DeU5AaZmh0QSZ9vEkTSP1IzyfUayQlZdx6iSnjaK/I8E1yk9OheqyCKE9T946/IiM8Ml6M
	+fMsgy0HsqpLuX+o9tbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFU0-000000098SG-1eWZ;
	Mon, 13 Jul 2026 12:10:00 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFTx-000000098QY-3Qri
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:09:59 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so1785531a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944597; x=1784549397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5VN0Op/PYgxXXGiNzBVb7Bc2A/YDsd2gosba72MniQ=;
        b=C6N3rLeziakWWU22fFH0tyPcsBzFU39o8XkOIe6hkqHdLZaL8jOF8WiODUP0tC5PJG
         N3jwjMVS2NDbIUaj+XcmmuyqKYeyGRgf4JcjLcRvwfrWq1nAUczB17QVfOVZr6KRZMA9
         8tf636aC6hNYuN2P2I1EIzYjhIcRwfQE7zReeJK5IibBzoRPX346HK+eJIzs9osliMGL
         dMlyE0cP4/4cf6rRws/mbXXq9WNbEtDJtYVOQDeu/SrfSgT7VE3Ov4GHu4d2hqDCq4hk
         9sMb9U6V17i8/9XZXDePOGhM+IT/P49PINHEVNXmjAbZ8kAltQgg7LagYPxS212A25B3
         Hk5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944597; x=1784549397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5VN0Op/PYgxXXGiNzBVb7Bc2A/YDsd2gosba72MniQ=;
        b=YuKj57pPJK2TVqpQkybKeO3y+1aWiUFK6bppkHoL+IRBfy12EWk84eH5E2c9o776Bp
         Mce+OMvLuyZmju0eiSf8HubrCF3dEYyIBk26ym+fe+Xsu/kBPkeD76V9JdERXp8m2g/d
         mDZ2QiU+VSrG8VXF9x5TTBqyc7xm8Do57PIy0Ql65EEzKPcreX8OYPvhdDGEz3i1sdeT
         dE4UX2t73YQNCFIUzc9EpaD2uql39weoO1dMzh+wu7Ir1iPznxyMI/2F6EYMnrZDTiTm
         lMPpGZLTzZbjaAITYD01axJc3hC07yZwuidKlpa9xf4WoFpEabJwYHNRElon95dvifWd
         c6zA==
X-Forwarded-Encrypted: i=1; AHgh+RoK0oojACC/UUVxmIRUmVVOfNuEXaMVxWpsXD7za/kE00KBdd6PsAnJcgEAU25pWzvbNA6YH+q5AoUoi1AUIMjX@lists.infradead.org
X-Gm-Message-State: AOJu0YxC12EYXxIO35yu7I+KXpQYbYFOkCpc/62xCUOAvK3pkX2w8CUP
	gb7Jik1ALKWH1TEUnS72UDGePBC5gwu1AKoR6dTCbHkgoxH2RKwgXi3X
X-Gm-Gg: AfdE7cmmni77qPTSz7OaOg31funN6jy0tLDigzuZbqLgd/KA9IpkED4cdaxHPQayb55
	pkJbv5lmqL+TvTzQyOMLMvd9xS9VT98eniSVHQ2Pv0CHGro67NbU2IDU/YvLNIJhCUZPmg5r0QZ
	JSX8NVnShqbcidLkdqHk4J8ayHQOgt01wciPlcYi9G3ndbIWSUoYE27jMdjYJdrEVrWa7/0qmk+
	RT7tvO5qtIbzqSooewxYgtBO0gEDWLTimBnoj1M9WS9ev2SHlAE5lABCQ/VSVOPnL9dw/RM0NX5
	+ZJoilqqmtdtTrhSTVyMInlhz2EQGoO17vpoy27oK86S6hQX4H9B6fZosP9psh5OUtF7OGQ5yFY
	qF6Rvt93lIpGAGgJGAxYz4tbEOiqvLRP4e8/BH+dOIFeXxTRBro9oH9MNYNKSA8el93W62vwiRX
	qtcJpNkxTJBQ==
X-Received: by 2002:a17:90b:3c43:b0:37f:9ce3:ca97 with SMTP id 98e67ed59e1d1-38dc777b8a2mr8263084a91.32.1783944596948;
        Mon, 13 Jul 2026 05:09:56 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:09:56 -0700 (PDT)
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
Subject: [PATCH v7 06/19] media: meson: vdec: Fix race condition by canceling work sync
Date: Mon, 13 Jul 2026 17:37:01 +0530
Message-ID: <20260713120840.17427-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050957_854734_92972AB5 
X-CRM114-Status: GOOD (  12.79  )
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

Synchronize work-queue states cleanly during streaming teardown and
close operations to eliminate asynchronous pipeline race conditions.

The esparser ISR can schedule work onto 'esparser_queue_work'. While
synchronize_irq() ensures the ISR itself finishes executing, it does
not prevent any already scheduled work items from running concurrently
during driver teardown. This causes a race condition during stream
stopping or file closing.

Remove the scheduling of esparser queue work during destination buffer
completion, as freeing the vififo is handled elsewhere. Add synchronous
cancellation of any pending work in vdec_stop_streaming and vdec_close
before synchronizing interrupts to prevent use-after-free and race
conditions.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260521090944.F35401F00A3D@smtp.kernel.org/
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 7689ffdb2e500..6fe9722577179 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -484,11 +484,15 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			}
 		}
 
+		mutex_unlock(&core->lock);
 		/* Synchronize and flush pending hardware interrupt service routines */
 		synchronize_irq(core->vdec_irq);
 		/* Ensure esparser ISR finishes executing */
 		synchronize_irq(core->esparser_irq);
 
+		cancel_work_sync(&sess->esparser_queue_work);
+		mutex_lock(&core->lock);
+
 		vdec_poweroff(sess);
 		vdec_free_canvas(sess);
 
@@ -999,6 +1003,8 @@ static int vdec_close(struct file *file)
 	/* Ensure esparser ISR finishes executing */
 	synchronize_irq(core->esparser_irq);
 
+	cancel_work_sync(&sess->esparser_queue_work);
+
 	if (!IS_ERR_OR_NULL(sess->recycle_thread)) {
 		kthread_stop(sess->recycle_thread);
 		sess->recycle_thread = NULL;
-- 
2.50.1


