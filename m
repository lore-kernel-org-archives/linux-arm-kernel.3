Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09095C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=; b=p2PFLJqPgVQyKJVgxOXqkrMrPy
	KiI+bXuSsW+bxIsCf+1k/awFDZroBxVfJrhSIQNC3ee28iS+/YM7apJ3hN2GEie2MYbFwDE1iD+8G
	hb85KO9A2Pu3FRNRcZkr9MMcgHq7u5iIuitGlQGjJyZoFgjnBM9viI+STrF/RP7hMpHLxBGVFABid
	eqJ7L0FXN9cLtsn5m7XAXWn7Uad9Y8boM/Z7BeTBY07RToWRzBOrthBq/oSe+BpVyhYmg0MTEIBwc
	zjhl7odD9nUfePB6J4Io2O0Bv6/CvvP50RyE3dK64HmfbX4QWlSlEzWbu96ylzooEyPI2mAOSnRWx
	/hhRsXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1j3J-0000000EURH-3XIV;
	Wed, 02 Sep 2026 11:22:49 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1j3H-0000000EUPQ-2jXK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 11:22:49 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-853c947bfefso882572b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788348166; x=1788952966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=;
        b=LNltt7HqgYUgiaHkKIaKEanhJwkfoqVXMuuB1Eqb7Gbs5h5t+dajKlz3upLSOfO56Y
         rn1CJo+qBaJCnaP//XCdBDveJOwNrxsUtqWXHCRxGsm5up8nfwhvdqRGIfqcAA6E/FFY
         VyHxNZ4peCoMYtKrz98r8cgptFiUdtvqymEiNWVR1/C/qnMB/Ll3rR9lRIX0/qUITnMV
         6d5v8NdwLamKb97oA838D3ST5O4GE1oyQKmjy0Gp7usLc8F7jXDFb3deOgflbZKAwfRJ
         ZFCf8YndmBiHuDRpC7g+ltL9hHnjBEhr41UWrItLSdHIudhCMnpqW4T3GCuRJJVi7EUa
         jO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348166; x=1788952966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=;
        b=derJmhyKZ9n42i0ucrp564X5HbO6v836EeRTPNzO3YTLaVXwU2dSSqd9+V6V4ndZTZ
         DWBUM5vBuV/AEnz4B1SsXzotvr90lqvzC8hRrbghOOVENuPEDZIELJymR/vHZlfOUWAO
         rbcOUXdtOfAf+GztudrEBO/YrYEgpvlFMt1cF2li5MEU2dwfw+ZlrYIV7nAjhIVkL13n
         8vGBZpdpkx6yB5AHcHkqyu6U4Op84lrWjMO1/UXOvuFsKqtw0ttnL5Ca/bXLlgeIa1NY
         EjnSTh55aSfnQPtzIl0VSXwNQwHyEQ9I+TScbCODSUwo72cDZDCk5mHo0SxDob24yeY+
         cSVw==
X-Forwarded-Encrypted: i=1; AKwUvBwjJXf7FEv+M8RY+GrfKbaKPzY+ZYUvjqFyHLgWAYnB+fd/ztO8X4h2/+5g5iNu2bfloNGr51MnSTVMYomZqYla@lists.infradead.org
X-Gm-Message-State: AFuF++l2NKLi2+CK5aG0VMz5adUvsz0mE6drE2W53d861boDuneQSB9X
	LjgWqq5rkLejCLeOrYCi66VoOv4FMVUgMFu2KG8V//m0zBl0OcbN5cB/
X-Gm-Gg: AYBFou012AhNj1RYRdms3aNigdS4Tw9T3cO7LHzHpqBY7V50cyOyqUab/HbnFHp4pFr
	oYVr/EScaHhegrYqKhKMVialIrEm6SWdF/sRrCnaozM8O3nbZHbd1igxHv+iYLHJLm4avOKm6ax
	4jKnwOGjf7884b7rf8Y2y0y6aUnNecz4qz9rhm1GRYPvJb88LzDpGF3WYFWaztWZPnvK46Zr/Af
	dFGbG7vbtpDoUQ05Dn1ULI7mKidiRkXeX0t530o4DKgsJcW1omlFuS4gmKfrAiL1yr78RFAI8+D
	L6v6YJPW0RiFFTqOSFf9pd21IP7OepxOKYHXctyOLd1qni8OlxM7lj869rkIS8EYy2XXAV9i4zI
	TWoC3ogViSbh9ClYwpkqARkOJG8/RrqF5CCnPwvyI+JMrjt6szEBl7woc9MnsmA4/eIbDGbcg5O
	iPzWJO9GCNNLbeGP7yARLmoWLVahxzZw5cSPq6vezYfQYfRgIXIkU2cfn4ibzycQSRXO1psQ==
X-Received: by 2002:a05:6a00:178e:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-85f42e35709mr1863167b3a.8.1788348165513;
        Wed, 02 Sep 2026 04:22:45 -0700 (PDT)
Received: from hnkz-ubuntu-server ([2404:7a80:860:3300:f22f:74ff:feda:3295])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11f8471sm1167571b3a.58.2026.09.02.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:22:45 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kazuki Hanai <hnkz.64@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Xia Jiang <xia.jiang@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: jpeg: Avoid context access after job finish
Date: Wed,  2 Sep 2026 20:22:28 +0900
Message-ID: <20260902112230.452176-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_042247_702147_2A724262 
X-CRM114-Status: GOOD (  13.61  )
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

v4l2_m2m_job_finish() publishes job completion and wakes waiters
before it returns. A concurrent file release can therefore finish
v4l2_m2m_ctx_release() and free the context while the single-core IRQ
handler continues with its tail.

Both handlers only need the device for the matching runtime PM put.
Use the IRQ-owned jpeg pointer instead of dereferencing ctx after
completion has been published. This preserves the get/put pairing and
removes the post-completion context access.

Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
Fixes: 5827e4b14ee7 ("media: platform: Improve power on and power off flow")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec4830811..9010e7b1108fa 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1574,7 +1574,7 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
+	pm_runtime_put(jpeg->dev);
 	return IRQ_HANDLED;
 }
 
@@ -1855,7 +1855,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
+	pm_runtime_put(jpeg->dev);
 	return IRQ_HANDLED;
 }
 
-- 
2.53.0

