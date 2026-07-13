Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9DDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nfm5E5YVw8Xk7Gt9ejcJe2nuIHpfZQPsIGFP/AIC7g=; b=wrdhjgR606R91B
	75AQ/b8NlB6PSHuKBM5b5rtzvfvQcUMkqL/lY8S7rdUnONBEIVz/bk4aPUM71Lj5FksO7uSFk/FIf
	YAUTMRJ1Z6jDMF8fZkHjeF/SkiWAVA2F9KvEaVIEmZdbR/4tABo2FfH4WXXYZe9Uuv/OY6JaRrfQD
	AOYlI7n7WWMtLF4h/FU/KxnSLUvvwPQBCHql6/5pStduBmyVXB8awXz4NvGPdtrB0EN5lIg6B19RY
	vvsfyOfL7Tsy4KxXJnBUinoT2IAjsHnDgtEx+k7yGdtSh6IMxLdb90V+tvJlT3+9j/5U+zMRVj3EK
	QdkotpT0jUSE3G13G0Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVM-000000099P4-0wr0;
	Mon, 13 Jul 2026 12:11:24 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFVK-000000099NK-2a0E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:11:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so27122295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944682; x=1784549482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7nfm5E5YVw8Xk7Gt9ejcJe2nuIHpfZQPsIGFP/AIC7g=;
        b=iZZ2AaI7CV7XMb9/KgpYANe5E44mVn2ftoT5ag5Ctzaq65r7X+gmNi9ey/PENMQm41
         OYua+Hywdz/Uoi6F88EgptRdc0ZSmmWasDgWtebWAxm5q/y8xNdGxfYYG7SRkf1WX2jp
         H1doOwsSDpNqEh821pNL3ie4Qfj9hRd2e1k0w59ItjURYWtsBTo2yXWKC4kQo2fxRFuj
         Z64unMzAnHwIGTzapU4W312/JygVQcTPi/AAY5aHVCTT8Rm6FpeS85gR+V6CdM+LoK9U
         XjxFulA4E5RvJvb2jODMe0I6AkfSsXymx3m0I8bgCWV65QVEdv61u4hI0s32Aos2vffx
         DMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944682; x=1784549482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7nfm5E5YVw8Xk7Gt9ejcJe2nuIHpfZQPsIGFP/AIC7g=;
        b=XUmqEriaKdkGgQVZknyfUA8oiIoL1+HjEMdVX5iartOzVyDgrEtfK1kO6sSw/7r3im
         +c5TwlKkoBqDCL+oOYQEL0cgRzA7w5hfo4y58zyoZ6c/Wja1DgaQwFhkZgZPuyGgkmwG
         txmSuOdhzGCBsR5C+yD6ky/gdEP66/8yh8pd7Z2qoVYOJcV3bNvKC6DTP3Vm7f1v3Eiu
         zzaftpX8Lpzd4IU0uIrUQAl1PnzaKZPl0sHLhXjjNt9SSRa/rvoQwJDltbTmLn6fUd8V
         pyRNok5XT9beqiercIEYXzMNiHTnOAzZXyxHQJZRTMk3xCv3lB4vATHhxHdiPbH/gPf+
         8yqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqG82STCON+tuRSpaw4XNA1d0p4+jn4qtfon4zhnLQIFnyIyxXRlZxSvnA9OYmI6DZIekc+uo+YtxWpvyoSvncn@lists.infradead.org
X-Gm-Message-State: AOJu0YxhlBJjFo6Nrc8tYMPh924evcwfecfwauvu6a7XznbotH63dNlM
	hDHkG3tqS+7EPrFh7N7XsMQj8IinBOrEKZKgr8yV6rZVMzyTqOPjwLfNfji/tA==
X-Gm-Gg: AfdE7cnoB6+gQLUpDnwKCEk2nR1/bYtli18N7MPf3l+VDWu3d534Q64shkCbAodg/AF
	MvXzC0f1DHs50uW9Cl/jHybuhNK05FutuKVJ4k9uaePM+ldpnVxI8EIiHz6y/QsBNAdw8jQr+rE
	sYl57Rq/6TYEOVmPw1AORjunwG8gJpG4yZj/bi3IGakpqkBhSFVfB6GFkMUl4cDt7i0Aw0yQrP0
	TP9I75+hvUSGl3RJMfLFbQPFmElO/RkijhcAMEag+piUltMYMEpO7XKz2AMiDWemFcs/mQLj0YR
	BrY8x9BLaTncALbZfq6h4/GJEqQtT2UC+njOA3zKZCsZQGbXi34+ZWh/vyCbSspX5bXgwYUPXMZ
	VEyCyqz39dWcwtQjuBRRRM/iAuofiubVG/QSlud75kNBwx4cjKGdzHwmTpr7x/l2oSXRQrH0kpN
	2s1Hrfb7SqUA==
X-Received: by 2002:a05:6300:220a:b0:3bf:aab1:cc8b with SMTP id adf61e73a8af0-3c110b436f6mr8836067637.46.1783944681879;
        Mon, 13 Jul 2026 05:11:21 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:21 -0700 (PDT)
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
Subject: [PATCH v7 14/19] media: meson: vdec: Correct atomic counter placement in dst_buf_done
Date: Mon, 13 Jul 2026 17:37:09 +0530
Message-ID: <20260713120840.17427-15-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051122_670061_78DA0D2C 
X-CRM114-Status: GOOD (  14.11  )
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

Fix an end-of-stream (EOS) boundary condition logic flaw in
dst_buf_done() by relocating the atomic decrement helper to execute
after state evaluation.

Previously, decrementing sess->esparser_queued_bufs at the entry point
of the function corrupted the conditional checks for the final video
frame. This premature decrement tricked the driver into flagging the
second-to-last buffer as the final frame (V4L2_BUF_FLAG_LAST) during
teardown sequences, which cut off the true final frame and broke
compliance validation.

Resolve this by moving atomic_dec() to execute immediately after the EOS
conditional tracking block finishes evaluating, right before invoking
v4l2_m2m_buf_done(). This ensures accurate stream termination
signaling.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index f02c21d5a9c18..303236f0647c0 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -314,6 +314,9 @@ static void dst_buf_done(struct amvdec_session *sess,
 	dev_dbg(dev, "Buffer %u done, ts = %llu, flags = %08X\n",
 		vbuf->vb2_buf.index, timestamp, flags);
 	vbuf->field = field;
+
+	atomic_dec(&sess->esparser_queued_bufs);
+
 	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
 
 	/* Buffer done probably means the vififo got freed */
-- 
2.50.1


