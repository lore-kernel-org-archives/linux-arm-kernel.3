Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220E1FD4F2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 20:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPe88jYT4Koj6mAx2acbFPR53xRU3O301fVKhXPrOjk=; b=idSlm++PkcNG7HvOxbFX2VZ285
	cayMJRZL9/D4vUQXMc2i6Lg+zRnP3df7mzLFuH5aU8MWK77I+PE88j5rsH435uKHkMFOXNxNsN/kz
	fsvzpA/jXsiQ+dVm27dYmOAxHt4E61oG6zdX997crWrFOWNEDGIbVLFhcIy75dIdpa0kq46Kx4lCy
	uvIf6pXVzM6w/rQeplGPKt19Q326VSPWZl1YrEmAKUzpPHkXA/uGjK6rXitGrQJjJMKPtvykFmQbX
	/5KeVXgQCQ7a4NzovP8j1MvdARyti7J6SR2xulQbwDE2jERk5baQgUw6o79i48VGX2x9YTbF9C0rI
	SSrIQiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Ln-0000000AE8K-0vwe;
	Tue, 10 Mar 2026 20:06:43 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Li-0000000AE59-1g5J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 20:06:40 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8296dabef74so6714148b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 13:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173198; x=1773777998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPe88jYT4Koj6mAx2acbFPR53xRU3O301fVKhXPrOjk=;
        b=V78lSiNw88XdCxESMzE4UgYvEbm0dDfNGaMSJlgElDVrhB/j3LG0WSeUSNTGUclVZB
         TFqTf+LA1ntNj8wlRfTwsu57zz6BUCR6D382hVNE5BWHFfllFO7qA6luo01q5j7RKrET
         wSunQNUE+B1c3HFrMptgOy4gvSs7RaBjFAOm7RqUxy9ZT4zrZ9auNrW+xurAJm1hKm1s
         qW0buFTgk7Z7AYOvk0wvdTf92KrGMP8IWeUbjL4Gen0O5VFr0ouCMSmS2fQTVOzioCfN
         oijZkHXAqL37z1Me6GvTPLR/4j8anp7CpHLcDONMr6JePshcRw7W/y6Z/THVoESH1vDm
         2Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173198; x=1773777998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qPe88jYT4Koj6mAx2acbFPR53xRU3O301fVKhXPrOjk=;
        b=snUeuALMe39r9q9lLukoxnnAuJlPiN2qU7Jd1Y//SImlEUUWgd+qbkVT1JeXHpdcGs
         XWHAhVgWfrs+wxPJvbqupcZqulS05J7ENFQRleJRmuYi+IoUhh+3rkbFBJP3ViHD2CX5
         kWqzj35162qkuG200/95fSfEXkVcv80SQt81VjSFsNLdKNBRAt7IQ0mr/eb6JhJsRMYC
         wJJSrbCueRNKoUDVliiV+qC1V7OArs1gLO5AHIk59/3EKIBh0BclhbUl3lmTKlPTbCMe
         gKyM6yTX9XKHMfBfImr+FxT+/w32iQTEyZiAef4KSvTo4cDoU8q7cQh3aeOZ8N5f49+7
         dN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWgOkYzFiIfUfh80z06n4oXokc7C6N21nfjB6jazBdazAJ21l/9Pg9njrXO9ITho1TaPjwUie41BENaQVJeapU@lists.infradead.org
X-Gm-Message-State: AOJu0YxJLZqLE0oUxDiDZR+rKwuoRjNl9PFfGf5A/Z+JwA2z79W/0EsP
	EGGdIjx5FE1a9OEPu9sxuj2R5HKUUtIFzSSzRMUh9PDkLl0+e6jjuKj8
X-Gm-Gg: ATEYQzyDUU2RIfP3cz0yeYfSAAvyx/ppNqVe2opNpb1biK+ReaGYSLXbp8uJIR2sAH1
	2/rTN4cSj6B1rrDvQdS/4Ch4OoOCle6Ekem+Xn5HE0h3igiPvXuB3hRqLRVGeFfAn4nWtYFqmNu
	GEigt73I/1Xd3RDejQp/STGjYICWsFv7kXwRwN1dmEHOKNqbgGn5wqwt+drY/4IvYjy1RRFzpWP
	PAOjk49rEJfLf8lARtDR2YrjUGQgWAF77931UWRuf1JvUF4/vubLyAZai0INEMIFJ6Mj2R0uRKt
	VcqBvrT+iZaqY6gVc7OXULbPf1gS2OwWmJRN3R85VzwFBiKeuL9paIbYEqys+xc91n9SfDyE5dQ
	wcGEZZJojaogKsd6s8i2McVsySAY9oiQMUezxY2Hz9+OCw2n+rFGXFGprGCD5hAG9wx63Vx2o7k
	yUW4UbSm5nZcYPwYvwFNX9/zdvnsftJCvst0Tm6qAboDKgoHup
X-Received: by 2002:a05:6a00:2d8f:b0:829:af4a:5ebc with SMTP id d2e1a72fcca58-829f6eed76dmr146730b3a.7.1773173197615;
        Tue, 10 Mar 2026 13:06:37 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:37 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 6/7] media: allegro: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:12 +0530
Message-Id: <20260310200513.2162018-7-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130638_494117_2988CE66 
X-CRM114-Status: GOOD (  14.84  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.
Remove unused variable e.g. ‘size’ after usage of cleanup API.

No functional change intended for kernel memory allocation.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../media/platform/allegro-dvt/allegro-core.c | 95 +++++--------------
 1 file changed, 24 insertions(+), 71 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index eac3bc9af990..197a368fcb57 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -934,25 +934,20 @@ static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
 {
 	struct allegro_dev *dev = mbox->dev;
 	ssize_t size;
-	int err;
-	u32 *tmp;
+	int err = 0;
 
-	tmp = kzalloc(mbox->size, GFP_KERNEL);
-	if (!tmp) {
-		err = -ENOMEM;
-		goto out;
-	}
+	u32 *tmp __free(kfree) = kzalloc(mbox->size, GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
 
 	size = allegro_encode_mail(tmp, msg);
 
 	err = allegro_mbox_write(mbox, tmp, size);
-	kfree(tmp);
 	if (err)
-		goto out;
+		return err;
 
 	allegro_mcu_interrupt(dev);
 
-out:
 	return err;
 }
 
@@ -963,36 +958,29 @@ static int allegro_mbox_send(struct allegro_mbox *mbox, void *msg)
 static int allegro_mbox_notify(struct allegro_mbox *mbox)
 {
 	struct allegro_dev *dev = mbox->dev;
-	union mcu_msg_response *msg;
-	u32 *tmp;
-	int err;
+	int err = 0;
 
-	msg = kmalloc_obj(*msg);
+	union mcu_msg_response *msg __free(kfree) = kmalloc_obj(*msg);
 	if (!msg)
 		return -ENOMEM;
 
 	msg->header.version = dev->fw_info->mailbox_version;
 
-	tmp = kmalloc(mbox->size, GFP_KERNEL);
+	u32 *tmp __free(kfree) = kmalloc(mbox->size, GFP_KERNEL);
 	if (!tmp) {
-		err = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 
 	err = allegro_mbox_read(mbox, tmp, mbox->size);
 	if (err < 0)
-		goto out;
+		return err;
 
 	err = allegro_decode_mail(msg, tmp);
 	if (err)
-		goto out;
+		return err;
 
 	allegro_handle_message(dev, msg);
 
-out:
-	kfree(tmp);
-	kfree(msg);
-
 	return err;
 }
 
@@ -1480,13 +1468,11 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 					    enum mcu_msg_type type)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct mcu_msg_push_buffers_internal *msg;
 	struct mcu_msg_push_buffers_internal_buffer *buffer;
 	unsigned int num_buffers = 0;
 	size_t size;
 	struct allegro_buffer *al_buffer;
 	struct list_head *list;
-	int err;
 
 	switch (type) {
 	case MCU_MSG_TYPE_PUSH_BUFFER_REFERENCE:
@@ -1501,9 +1487,9 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 
 	list_for_each_entry(al_buffer, list, head)
 		num_buffers++;
-	size = struct_size(msg, buffer, num_buffers);
+	size = struct_size((struct mcu_msg_push_buffers_internal *)NULL, buffer, num_buffers);
 
-	msg = kmalloc(size, GFP_KERNEL);
+	struct mcu_msg_push_buffers_internal *msg __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!msg)
 		return -ENOMEM;
 
@@ -1521,10 +1507,7 @@ static int allegro_mcu_push_buffer_internal(struct allegro_channel *channel,
 		buffer++;
 	}
 
-	err = allegro_mbox_send(dev->mbox_command, msg);
-
-	kfree(msg);
-	return err;
+	return allegro_mbox_send(dev->mbox_command, msg);
 }
 
 static int allegro_mcu_push_buffer_intermediate(struct allegro_channel *channel)
@@ -1621,8 +1604,6 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_h264_sps *sps;
-	ssize_t size;
 	unsigned int size_mb = SIZE_MACROBLOCK;
 	/* Calculation of crop units in Rec. ITU-T H.264 (04/2017) p. 76 */
 	unsigned int crop_unit_x = 2;
@@ -1632,7 +1613,7 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	unsigned int cpb_size;
 	unsigned int cpb_size_scale;
 
-	sps = kzalloc_obj(*sps);
+	struct nal_h264_sps *sps __free(kfree) = kzalloc_obj(*sps);
 	if (!sps)
 		return -ENOMEM;
 
@@ -1715,21 +1696,15 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	sps->vui.pic_struct_present_flag = 1;
 	sps->vui.bitstream_restriction_flag = 0;
 
-	size = nal_h264_write_sps(&dev->plat_dev->dev, dest, n, sps);
-
-	kfree(sps);
-
-	return size;
+	return nal_h264_write_sps(&dev->plat_dev->dev, dest, n, sps);
 }
 
 static ssize_t allegro_h264_write_pps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_h264_pps *pps;
-	ssize_t size;
 
-	pps = kzalloc_obj(*pps);
+	struct nal_h264_pps *pps __free(kfree) = kzalloc_obj(*pps);
 	if (!pps)
 		return -ENOMEM;
 
@@ -1752,11 +1727,7 @@ static ssize_t allegro_h264_write_pps(struct allegro_channel *channel,
 	pps->pic_scaling_matrix_present_flag = 0;
 	pps->second_chroma_qp_index_offset = 0;
 
-	size = nal_h264_write_pps(&dev->plat_dev->dev, dest, n, pps);
-
-	kfree(pps);
-
-	return size;
+	return nal_h264_write_pps(&dev->plat_dev->dev, dest, n, pps);
 }
 
 static void allegro_channel_eos_event(struct allegro_channel *channel)
@@ -1772,15 +1743,13 @@ static ssize_t allegro_hevc_write_vps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_hevc_vps *vps;
 	struct nal_hevc_profile_tier_level *ptl;
-	ssize_t size;
 	unsigned int num_ref_frames = channel->num_ref_idx_l0;
 	s32 profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
 	s32 level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
 	s32 tier = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_tier);
 
-	vps = kzalloc_obj(*vps);
+	struct nal_hevc_vps *vps __free(kfree) = kzalloc_obj(*vps);
 	if (!vps)
 		return -ENOMEM;
 
@@ -1800,29 +1769,23 @@ static ssize_t allegro_hevc_write_vps(struct allegro_channel *channel,
 	vps->max_dec_pic_buffering_minus1[0] = num_ref_frames;
 	vps->max_num_reorder_pics[0] = num_ref_frames;
 
-	size = nal_hevc_write_vps(&dev->plat_dev->dev, dest, n, vps);
-
-	kfree(vps);
-
-	return size;
+	return nal_hevc_write_vps(&dev->plat_dev->dev, dest, n, vps);
 }
 
 static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_hevc_sps *sps;
 	struct nal_hevc_profile_tier_level *ptl;
 	struct nal_hevc_vui_parameters *vui;
 	struct nal_hevc_hrd_parameters *hrd;
-	ssize_t size;
 	unsigned int cpb_size;
 	unsigned int num_ref_frames = channel->num_ref_idx_l0;
 	s32 profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
 	s32 level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
 	s32 tier = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_tier);
 
-	sps = kzalloc_obj(*sps);
+	struct nal_hevc_sps *sps __free(kfree) = kzalloc_obj(*sps);
 	if (!sps)
 		return -ENOMEM;
 
@@ -1913,11 +1876,7 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 
 	hrd->vcl_hrd[0].cbr_flag[0] = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
 
-	size = nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
-
-	kfree(sps);
-
-	return size;
+	return nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
 }
 
 static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
@@ -1925,11 +1884,9 @@ static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
 				      void *dest, size_t n)
 {
 	struct allegro_dev *dev = channel->dev;
-	struct nal_hevc_pps *pps;
-	ssize_t size;
 	int i;
 
-	pps = kzalloc_obj(*pps);
+	struct nal_hevc_pps *pps = kzalloc_obj(*pps);
 	if (!pps)
 		return -ENOMEM;
 
@@ -1960,11 +1917,7 @@ static ssize_t allegro_hevc_write_pps(struct allegro_channel *channel,
 
 	pps->lists_modification_present_flag = channel->enable_reordering;
 
-	size = nal_hevc_write_pps(&dev->plat_dev->dev, dest, n, pps);
-
-	kfree(pps);
-
-	return size;
+	return nal_hevc_write_pps(&dev->plat_dev->dev, dest, n, pps);
 }
 
 static u64 allegro_put_buffer(struct allegro_channel *channel,
-- 
2.34.1


