Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF227C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBddtjFYWhyXG/z7saOr360Gpb3JLBOtzUiY/pJ38ko=; b=rP4umAN+emgoT/
	8hehDAGe11cD4utm8JrMF2Mv0YLZLfyEZW345VDC1xajxp1WXSakIE1KvLp61bOXu1L8L+YSqZoWa
	FIbTa+LAV7GEtCZ510ldjqQzvKqrnSFSLpqBWTripSIfWgMn4dFMk/B8YjiTHR31cPsFNeA1SYGGY
	klX6TD3kLOCLMLUTNIRBkajEyXkMzOGV6/1umrMZBEdfW9RWTNk4kCps8HbuvcMGi4+YfvrO4k8YH
	lqtTtwhJ+8Kq7q7hX45biAjv5dJvJqM1XULJKc2+1iG/UUrNW8LGlPIz+Cq1J/Zt0so++jz0H4hkM
	5pCaXXvdxEQk/PsDZjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFV0-0000000997w-2EO1;
	Mon, 13 Jul 2026 12:11:02 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFUo-000000098zO-3DNe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:10:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38175907a56so3127495a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944650; x=1784549450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBddtjFYWhyXG/z7saOr360Gpb3JLBOtzUiY/pJ38ko=;
        b=EOG0GPJXGdMr+AGHCHv/mPS45z9pmglABFkhmP4qrISoGYu/UfO4kA7cQMxaYDFXwE
         enpQxT3KtEy/FoeJqnnPyNU9bEmJejpc+W4BXtSY5Ux3vkLyuYJ1Cl/OTaRQXZI6ok2P
         5ZyjlvW87Xa5dca+MR5PXf5LT9njELaMaQQ7JbzygsDbmwyQbugxcg70Z5tDNHd6eL2y
         za6I/5d2B5uj/yHzEyIL2SN+18eVny2IKYQfXxz2bo90s4VinbL4BkqOHBFZGHAtNI5c
         JK6mz1Ojm3GNa5JdrMeZkTL4om08RQPMzARrIWEx0SvIpZSf2PDy5DPF40fwRWDIpPTp
         9X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944650; x=1784549450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBddtjFYWhyXG/z7saOr360Gpb3JLBOtzUiY/pJ38ko=;
        b=XXMoaS33GoBF1seY9vf1YM2P5ovb6unn8ynQ2cgnPIdnmAe1c1C3zKbKx8p9P1+BH0
         oCbK1cbArQJGGcrtMyFdCXusUKb9U3VVe8nuwsngZ11MvY1QurFxifMQ3kuaQwEp+cto
         EQA1W8NufFVKZTzmKXGlaKEaADzBtYVR3c+1wjtJQTmSUoiLyOyAmrkO94KJn2/Gtqxs
         Hs4XDDM/L5y7d5J5mkh1zlb9EKXJSXM9cFn0cBPFRbxh4juicSU2Vsr1C8KyrN3EPi/1
         PSyuESINkMBOiKkZowCdpLd/c8oFXgJdT4ki3bb0QnpR7alVn5QcjdTeTe7erZ5Gypy2
         5jYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpyrw9nSLxBj2NJeJGuRYfNrBNSt4HhvSAI5orhPAe0B6ZnslrkQHO6cyM5u6XRVaxDgkTGR529nh6Tohv9sziU@lists.infradead.org
X-Gm-Message-State: AOJu0YyMGxOupJ2MRcpbVVAgMv2Sjcls8u8mmh1/CKgVR7zRkf3q55dp
	PlsKWWqPkABf0Cm5GLHLOAw8anPskRj0IpDEDK4GoW7ZEy/EhBzED3ve
X-Gm-Gg: AfdE7cn3faZjjHnsea1FN5V0lwtAVcfIdbfuzsvcCzLIDzPS/uMKtw0yoODESvXtdmx
	1pZnxT6DWqPspU2yNbMXe334PQsM2Yum5cHu34cDdd4BDiy9isWt7uSPY+hxeaCdX6jnUVmv6zB
	mBpA+NlOYdvrhqclj/72FygW2WKX3kdIKUTZZjn6aUwyZP/9PnlZ+hupKuMVNM44k+gE3y4Www4
	/ySZsWuJI+Py/GfYwvC/LcZI3jt1yuxad3ewjyBoKDmE1ufRnCd36fWfimE72UqO+hACfYnCCkr
	jpq3DFKfRdWSuL1Bq5BzT3mU2aDx9z0sS0bgL8064dGY3XChPmg7GOtbJLCKl+sqFR85Rigr2ej
	EJKVBsNxV/txncm2nSicsFf4ch+nn5d2gh97pCgNYT+kaoXDH/ga2ao4hnyUjI5I+fu74+LRSpP
	cy3etOLTepOfZwOuNZsqdO
X-Received: by 2002:a17:90b:4cc7:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38d13768de2mr15327432a91.4.1783944650044;
        Mon, 13 Jul 2026 05:10:50 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:10:49 -0700 (PDT)
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
Subject: [PATCH v7 11/19] media: meson: vdec: Update core m2m stream state during transitions
Date: Mon, 13 Jul 2026 17:37:06 +0530
Message-ID: <20260713120840.17427-12-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051050_832349_91453CD0 
X-CRM114-Status: GOOD (  14.80  )
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

Explicitly update the V4L2 core Memory-to-Memory (m2m) framework's
internal streaming states when initiating or terminating streaming on
the device queues.

Without invoking these core framework helpers, the m2m engine's
bookkeeping of active source and destination queues drifts out of
alignment with the driver's local 'streamon_out' and 'streamon_cap'
tracking variables. This misalignment causes state validation stalls
and incorrect polling outcomes when the device is subjected to quick
runtime cycles or strict testing setups (such as v4l2-compliance).

Fix this by integrating v4l2_m2m_update_start_streaming_state() right
after a queue is marked active in vdec_start_streaming(), and pairing
it cleanly with v4l2_m2m_update_stop_streaming_state() at the end of
vdec_stop_streaming() before the session core mutex is released.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 83a9b1238972a..0eb39aa6014ee 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -299,6 +299,8 @@ static int vdec_start_streaming(struct vb2_queue *q, unsigned int count)
 	else
 		sess->streamon_cap = 1;
 
+	v4l2_m2m_update_start_streaming_state(sess->m2m_ctx, q);
+
 	if (!sess->streamon_out)
 		return 0;
 
@@ -529,6 +531,8 @@ static void vdec_stop_streaming(struct vb2_queue *q)
 			sess->changed_format = 0;
 	}
 
+	v4l2_m2m_update_stop_streaming_state(sess->m2m_ctx, q);
+
 	mutex_unlock(&core->lock);
 }
 
-- 
2.50.1


