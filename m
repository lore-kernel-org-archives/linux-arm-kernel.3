Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AE8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 06:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ajFU+HuHYiVxYPwroExLm2o4iOyX7zxK6N/HTFuJyzY=; b=ZGOPP+bnQYZj6QRyCzT40bBc1A
	FpJbhhYuSFiAxXVnDpOynAn7vQwp7dOTx7hJb3WEqnOM6zIVJdwPuOIteH3Ti5BQkVLwhaIimvSaG
	odH2bkZIiUluzkuRilufyBCDw2qLiwAJlcIMM4RGfo2tndlRtqp5K7UNBSezF5ToYa7yMs1JLwQRj
	L+tRx0OD9hNFs4OSOKVLvA6aJpUDzzeGdCkBp3fYK27OSyAZIHus9GfliBLd1GztgdRilqA1Zn2yy
	CgKdrr5sXgRo0Zr0oLpoVcKSZ5SYjd93+NXpuUy1E536zqA6gyjdGUKJeFcEYR8OC8u7RQpqw/VwB
	oLBB/4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMh7-0000000CD7p-1Vg2;
	Sat, 27 Jun 2026 06:39:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdMh5-0000000CD6k-152d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 06:39:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47122683cf3so26170f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782542348; x=1783147148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajFU+HuHYiVxYPwroExLm2o4iOyX7zxK6N/HTFuJyzY=;
        b=LDdRtFlZIW0aF025uZP8jv/xzuCrnNaQIFC8IxTGQk4SFNFYalogYleorsWBG0GuMA
         RZG9C259HZPG3FfkGTuW2BBaaYQhSdGLrDhawuyClynnPipxM3Zo2Zsxa1wFLDdkHX7p
         sM/nJL8UmgAh/fADMIUpV1uvHL8Zwuc3OWjCI2smK5hVcCaIYhPRLFSzO+5Z4Jvk2sCW
         37ijPmIVGKsP1XUwpnmLlSzA5bDPeOWoi6kGnKoPJpLvRcdq5oLn8PIkZAFaVfRNrq44
         mM7hEMz58BiLJ0cNHupP6ODsT5XBqinSXV2JI0oFqkJD9Qs4R0fYuz8JzZvrlmCUgW/X
         m5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542348; x=1783147148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajFU+HuHYiVxYPwroExLm2o4iOyX7zxK6N/HTFuJyzY=;
        b=Hoxc5FAYEY1Vl/1booOO0OUChzMwwLhLw/hNoaTuLwr7IbGgH/ECFcV2YF+xRCGt7V
         BgL3amX580S6NUHo53M6wz2xdvhDSCc/Piy7eby8Y4qw6uI64y/u+9tnvrRHWzkcu+f0
         iPLOcz4GAgBKLlvixMTy+zXcfvHIABuaRIyafuutIRLcYeQt9fM75NWT/UydrVEWR3R2
         jvZbiWWgkt1X/fjR4CLs603TCkd7IaUZV3aP/t1pOgjSJGcQBoTxhkTtglzClEUb8S4Y
         iB3c2KEHYn4m0vwgXH6ppy99wb0olu9PcevM4MgwHcEF8Iev3Y+xEDV0D/1un1TzalMJ
         89MQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrbsj/FW/IsAiBecYBXsEoDtr7bgbnF5PEpFkqFZJSeD5Zhw4YAzpH46yUnvMQEzQy/iUpqFld07bB2/B22VpUw@lists.infradead.org
X-Gm-Message-State: AOJu0YwvdJlnP82fIqCn4B1L7ttjd4r460MBDbsohUiiTD4s3pdP92c4
	tPQdlbMW4NTQyNz5QAZX/hKAZSRiOhW5PzmOUvi51rnfCSMtWFUERNvDFozwyH57jyVD
X-Gm-Gg: AfdE7cnASx16HDxQrouY8+Vs4Ta/SYY2/++x8DoDWHjgXdV9VDHcbxyE/6QmZFRaT2x
	A0mV9IX47JdjXGqYYDlJ+8jztfsLv8csAz1iOujqgKPEAMCewXC9XZVA1+TF8uDds44Q6HTxM+d
	o2IK7OPYh62clKj5177VDY+fVVeg8c0ykooHf6Wz2NdBR3A0ZhDouIN6665XeB8W+CUXjHjfJGf
	FeRjLYuJ5V+V8is0VVvARbppg4mXJMOoOMtOB6o9khMijghUip/VPAf0iSj4tGjnB2U3DMrNbAP
	N5uVzkzJZMCNext9Q9gW1dMq/4uBXXsJW4WBFVq3+SeS3GgbfSRhENTfav7/4HVpcnaCBQRXy7y
	NAeT9GLfxj5hhHCoWpSL3FBQzdb651fRxmT2t+IkzkGt4nGZLhavLO+W9tC1KypbTii6ONoF3ct
	cLnL6GGchZB05aXF7aqT4rnqtTmXwURBB/pFm6MaFFIJNaSZbkT7YivNNfnsMhCnWBvG1uqqBes
	Ig58yu19TDchP9jt2CuTTuoe+2dEYLkv0k=
X-Received: by 2002:a5d:67cb:0:b0:46e:64f3:ee74 with SMTP id ffacd0b85a97d-46fb94541e4mr4577099f8f.45.1782542348074;
        Fri, 26 Jun 2026 23:39:08 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c22c680fasm31551666f8f.34.2026.06.26.23.39.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 23:39:07 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v2] media: meson: vdec: fix use-after-free of in-use frames in codec_vp9_rm_noshow_frame()
Date: Sat, 27 Jun 2026 08:39:05 +0200
Message-ID: <20260627063905.79363-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_233911_322716_7304B143 
X-CRM114-Status: GOOD (  11.58  )
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

codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
ref_frames_list without excluding frames that are still in use. When the
previously decoded frame was a non-show (alt-ref) frame and the current
frame is a non-show inter frame, the freed object is the one
vp9->prev_frame still points to; codec_vp9_set_mpred_mv() then
dereferences the stale pointer (use_prev_frame_mvs and
codec_vp9_get_frame_mv_paddr()), a use-after-free. Freeing a frame that
is still an active reference (codec_vp9_is_ref()) or the current frame
has the same in-use-then-free shape and additionally desyncs the
reference bookkeeping in codec_vp9_sync_ref().

The sibling cleanup codec_vp9_show_frame() already guards exactly these
cases before freeing:

	if (codec_vp9_is_ref(vp9, tmp) || tmp == vp9->prev_frame)
		continue;

rm_noshow_frame() simply omits the same check. Add it, also skipping
cur_frame, so both cleanup paths agree on which frames are safe to free.

The fields that drive this path (show_frame, frame_type, intra_only) are
parsed from the VP9 bitstream, so a crafted stream fed to the stateless
decoder can trigger the free-then-use.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Fixes: 00c43088aa68 ("media: meson: vdec: add VP9 decoder support")
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: Per Dan Carpenter's review, also skip active reference frames
    (codec_vp9_is_ref()) and cur_frame, matching codec_vp9_show_frame()
    exactly — freeing an in-use altref/reference frame here also caused a
    codec_vp9_sync_ref() desync, not just the prev_frame UAF.

 drivers/staging/media/meson/vdec/codec_vp9.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84193..dad75950933c 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1238,6 +1238,8 @@ static void codec_vp9_show_existing_frame(struct codec_vp9 *vp9)
 	pr_debug("showing frame %u\n", param->p.frame_to_show_idx);
 }
 
+static bool codec_vp9_is_ref(struct codec_vp9 *vp9, struct vp9_frame *frame);
+
 static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 {
 	struct codec_vp9 *vp9 = sess->priv;
@@ -1247,6 +1249,18 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 		if (tmp->show)
 			continue;
 
+		/*
+		 * Mirror codec_vp9_show_frame(): never free an active
+		 * reference frame, the previously decoded frame, or the
+		 * current frame here. prev_frame is still dereferenced by the
+		 * MV predictor in codec_vp9_set_mpred_mv(), and freeing an
+		 * in-use altref/reference also desyncs codec_vp9_sync_ref();
+		 * either is a use-after-free of an in-use frame.
+		 */
+		if (codec_vp9_is_ref(vp9, tmp) || tmp == vp9->prev_frame ||
+		    tmp == vp9->cur_frame)
+			continue;
+
 		pr_debug("rm noshow: %u\n", tmp->index);
 		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
 		list_del(&tmp->list);
-- 
2.53.0


