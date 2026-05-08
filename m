Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF2ACD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H78OCHplUUKVx5qcGH4uj9YH7je8ck6bUjvltlSmym4=; b=M3NcpTpPvbuTJnNTQbmegWbcm2
	AxuEEp6w5rFYdnpoOw1shaaDQyNjRW2GzG2t+rS8m09D26tOctHpXGxfdKoO5m7L9tVgXsMqJpbKt
	AFHNqkVHm7MzzdgZ5x/1CYTB3VZNVrCe+qjO9U8YqqUSF2RcqKyLOffEaWfulF6Go0P7S4y9ZF5N6
	GEhS9eNyqK1KlB4NKWMEK7AKKVf3l+1zr6fjbv2FRp1J8cwAJe1Dp9GAcIVOzIfruNUP+Ht62ppw1
	wPGiFF+mRUYGzgwC7WgGeU49lG69pFhuDL9S+lxvfekm+gTHA0bcjueL3d2Zz7OT1YRfurN96bUpA
	gnOgx5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNtW-00000006y66-2gkB;
	Fri, 08 May 2026 16:17:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNtT-00000006y4U-3liE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:17:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso15255395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257058; x=1778861858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H78OCHplUUKVx5qcGH4uj9YH7je8ck6bUjvltlSmym4=;
        b=aWfkqJfUYOqU+ODlynRU1MH5gMKmVT2KruWYrBV+Z1r00FRr310xg7y2TDsx2ns9Pa
         BED//YJ5Mxudik1PzIJx4r5pJaaDs+8IiplbYyZ5YS9n2IpviY30Ag7rTzD4NR/jU2Rr
         s5r34QPexGlInXwcyTCORyhLRR7g2rT2nfau+s+ViyM54RKVd5Yf24Ilkx5j3qrhQkRN
         HWCpu4qhYr0+fXRLV+noW4UAhBXlWsDg8zQ/Iio4P/yYOaLzzW4RVOFoEIeeGXXdOSlT
         yOTN/cVh8R32UFMquo6Su8mUg0v/rmgP6DQHAykhL8tDveBSJSGe3LDr16URt9eeppFQ
         2b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257058; x=1778861858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H78OCHplUUKVx5qcGH4uj9YH7je8ck6bUjvltlSmym4=;
        b=A9HG8kL8VuYkAl0M2Y3wSml5c/r8rLVM9tmFN3Xg+800/pmS8GcoVdooMj5s/XRQ/r
         8u/FGIEqGr+1MQAtnxgzOpv5ybZcfYWDTyKSFwyyqy0HJzV7ZeWooyCCh1Jo7Ia3u4nQ
         dndqRo7RYuKlMpxPZuMrHTXNLz+gsRScToIHx/i5xh4g34SbsNbZCqZ60agMcTAcVpFt
         7pzShomsbSLm5N0N4RwccKsWAvJgNZrP1bM9GWEz8fXzP30m5F2TOQ1/sqCL4KvrZrQZ
         F5BOHoNB7kEms70+jHpzDX7eDfs6ZrhQyBK7FGI2BKZrB83CX8/YbG+YCC07/07jtc+9
         gzMw==
X-Forwarded-Encrypted: i=1; AFNElJ/L9BfT9A7cl73nazK6E+ED7pmTsR2GbJN7ug3gHEYcIF8lMXZxyn8zYmAFpkSYofOraoXuExlZAtVK6SP8bLrt@lists.infradead.org
X-Gm-Message-State: AOJu0YzxnFcqpXo4OAQSzZJK9ugrk9xK/vPAlPZjReGTU24zUPCJVA3d
	hopU8JHwqHgXLhfb0ik7+BhN9R0OdQvftFN8vv0tKRn4AV7OlzwrjD1A
X-Gm-Gg: AeBDieuejV1bTBfs5gi/XaTgCILTjJwg2JGIny3DZKyarZkeKUfjLqggGh4mQtYmndS
	jLfCDwjHy8XD0ewIQzsADY5//hU6Q64Uph1QWFSjBvlMmQ6dc6jTAzhdsF35aBaeQR4dyLRxLLK
	g/WAql3SyTdQkzYoHI3KOHPVK8EmgYHDK4UitblzGJUjy3pj6gUmJY+j0UGYCDuc3h18tNub6TN
	0QRslhsQiI6le/T085eEh6V/+RHYdXpU004XNUwrWIuuWGq2aBmSuXTDh+mUr8b6DpDbRxQQa9W
	y6rANE9bkw5yLoxzGglVFeoP3cKdBRI7jA5RN4C81fstCbDG9OIOvyTaQURehhMunIeU5FUyhh3
	TiM4xVlpYTNxBQNQRC3Ts1YaOpp/EEFPv1MGZdLnzkQ/CR9IA0q1G6iyMdTpzdasdK9t8z21KMt
	UgXvDWN2yHGGudgWRQLiVSttTCi5Xi1hESW0grelbStXU0eDMVRxh8lc/KqAeWhqBLhFo2PqwI5
	nBn2SBFy3KS5Lloctg5
X-Received: by 2002:a05:600c:35d1:b0:48a:5821:5ff2 with SMTP id 5b1f17b1804b1-48e6767de04mr65948235e9.8.1778257057759;
        Fri, 08 May 2026 09:17:37 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a66bfsm4946697f8f.4.2026.05.08.09.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:37 -0700 (PDT)
From: Arash Golgol <arash.golgol@gmail.com>
To: linux-media@vger.kernel.org
Cc: yong.deng@magewell.com,
	paulk@sys-base.io,
	mchehab@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	Arash Golgol <arash.golgol@gmail.com>
Subject: [PATCH v2 2/3] media: sun6i-csi: capture: Implement vidioc_enum_framesizes
Date: Fri,  8 May 2026 19:47:20 +0330
Message-Id: <20260508161721.94285-3-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508161721.94285-1-arash.golgol@gmail.com>
References: <20260508161721.94285-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_091739_962925_B564C4B1 
X-CRM114-Status: GOOD (  12.94  )
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

Report the stepwise frame size range supported by the CSI capture
hardware for the pixel formats exposed by the driver.

The hardware does not perform scaling and accepts any even width and
height within the reported limits.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Tested-by: Paul Kocialkowski <paulk@sys-base.io>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v2:
 - No change
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-3-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index d90abba21309..375ea6745eed 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -738,6 +738,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 	return 0;
 }
 
+static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
+					     struct v4l2_frmsizeenum *fsize)
+{
+	if (fsize->index)
+		return -EINVAL;
+
+	/* Only accept format in map table. */
+	if (!sun6i_csi_capture_format_find(fsize->pixel_format))
+		return -EINVAL;
+
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = SUN6I_CSI_CAPTURE_WIDTH_MIN;
+	fsize->stepwise.max_width = SUN6I_CSI_CAPTURE_WIDTH_MAX;
+	fsize->stepwise.min_height = SUN6I_CSI_CAPTURE_HEIGHT_MIN;
+	fsize->stepwise.max_height = SUN6I_CSI_CAPTURE_HEIGHT_MAX;
+	fsize->stepwise.step_width = 2;
+	fsize->stepwise.step_height = 2;
+
+	return 0;
+}
+
 static int sun6i_csi_capture_g_fmt(struct file *file, void *priv,
 				   struct v4l2_format *format)
 {
@@ -805,6 +826,7 @@ static const struct v4l2_ioctl_ops sun6i_csi_capture_ioctl_ops = {
 	.vidioc_querycap		= sun6i_csi_capture_querycap,
 
 	.vidioc_enum_fmt_vid_cap	= sun6i_csi_capture_enum_fmt,
+	.vidioc_enum_framesizes		= sun6i_csi_capture_enum_framesize,
 	.vidioc_g_fmt_vid_cap		= sun6i_csi_capture_g_fmt,
 	.vidioc_s_fmt_vid_cap		= sun6i_csi_capture_s_fmt,
 	.vidioc_try_fmt_vid_cap		= sun6i_csi_capture_try_fmt,
-- 
2.34.1


