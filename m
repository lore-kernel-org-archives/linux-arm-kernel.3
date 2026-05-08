Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5006CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFzpvNnAmypkJr1Nj81ekibmeUXSe5xhjPOVIP2fg5s=; b=Gyl22f5jWOT/ZEz8feWYluwWZW
	9rgGk/d54pxYEx3qBqRYOJFZDCiYqm6JtZOLTHV1plapZwbYH233KF0WgHIVR/GtSKlneqKpyKIlP
	REDZK7iBsHa43N1jD8TI5Mfe+b/GUJyIEpxGy7RRmNY55KxvAymfHu9wHikKZsYSKqpsL1oCY8JWr
	6cblLjQoBXIniInOlR3o10JE4BK7qOKS8j80pmi3HtkM4zcVYLySC2GtEgy4IkDt9XEdIgMODGq2d
	YoVS1XI28wSiX9XN5J3E3g6O9G/L10vsE2gfkWO11XSRnGLHRLj7yWrKycpa4IJRz4IWVuv07h8GW
	D6GvcpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNtd-00000006y9e-2TAI;
	Fri, 08 May 2026 16:17:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNta-00000006y7M-3bGT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:17:48 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44ce78ab5feso1931595f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 09:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257065; x=1778861865; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFzpvNnAmypkJr1Nj81ekibmeUXSe5xhjPOVIP2fg5s=;
        b=K/TFh7r/E9MPNH2pz6FNyOEBwiLxbjzkiauQJ25uT6IBQQ088soR1qol+JwyHlvuce
         EMblqMUMp1RABtfzI4PMZH6UdU1p+Hol0OmE8tHrFxLsPjrhfmmmJ+oK2dCAzbXw9Y5x
         OJ8rXAM0lCOGxD6lw/L5DTuzmse9V93RaJaBo21ep4SQJ25Wced9JYFZWDszSIIBS0W1
         SJ1o23iMTWLGC8v4l4clqVUGS7HFqCr5AVUfq1s0c8oHHy9rnl7uI4va9YVFCsRXYmOJ
         uM0kmNNzeo27mihxfC0Khzpi21+9wOlGh38Kd2nGhlcxLXa5QsY7dJRaqAXrDUXnWeMs
         zHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257065; x=1778861865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFzpvNnAmypkJr1Nj81ekibmeUXSe5xhjPOVIP2fg5s=;
        b=qstI+FAyaXDTR3A5wi/sePGrR0div1z7Fu5+6tgBNDmuF6Nrhg2l55qkPm7Ly48jlP
         VIua2sUlM3kTNB81iRoWZd1cZzVPtkDu6bxuxBVdR3D5/TCpxwPIiABe4DknlyRYbKfC
         ATIKAHVRp/bRX+hmyuWRf4atwmrhsWKU8ZlYwfs7xhd72O89SfY7cHiJ34vBVAcBG4kJ
         /3Ffpyng9/Zbzg9TRhUtgNxc52WMLx+FJYx6bygJ5LznZM21H9IaqyT/CrR8dOCl+0qp
         /0ZGesyudksZdxm3qO24YuvHY5bO0EkNs8kubGWzqs9ZQkt9d8KnRdJle8Etlre7QP3T
         uXuA==
X-Forwarded-Encrypted: i=1; AFNElJ+wXtrTqyexPiTEhGb8jUkgfTvkLndA6yppnNpW1CyTTilTH9pd2vENReH+tlYK1aSDTy8ePdpewkcvs/rWsC4L@lists.infradead.org
X-Gm-Message-State: AOJu0YwqWoff8Ipk3ZjTMKQKlA7E/lCZKhZMoL/oipwUMRRPZFkaruL4
	h1tnyLY/mukAWynSm17HKma4XJ0Bq7VrMj1n+q8qaHYEAI9NdYIH/9U4
X-Gm-Gg: Acq92OGdsrXGr27T21pZGOArNCKB0Lf7sZEAdxIevLpyUYPLdmRS62719GbAIal4PhX
	JpOcJeJZPg+cVF4am55orzX9LrGuALauymujYvUH7AcVTzDFCVe68uKHZ5uPlneWfi9nXEwIvCd
	QO0np21UXRj4jCxGvARp/HI1RBwwq3GobC9u8TZJiup0Ha5hkmIjd1/W0fzPqLdvtSoyDwFSaTe
	sOEq24yU7JjTRv5CQkIrz1vY2usAuo8KvPAAw0zzmPoFESMCWMilGRF48iCWvaDK4yZO/sqI2py
	e5A8ylOrCi4WXY6qSXqXNeUj7D/SSo0j2BZ2dlJb+DRFyH1sV99ASPVXMDESVt0RiaQvCrsxuNF
	Pya8n3rS9YebQ3GeJJ8Uce/8uU0iJjrVcvaV9zIa9XBrmPsq3yuujuwSSpcGw0ZUhGrYx6vOUci
	yKP0neKvcVqVausNlq6bZgmwxBf80ZNPUVwNfGaTpKLTFMVwkab9Li4h69rXr7mmyJMMFaSXMKe
	nQfx2dMXQ==
X-Received: by 2002:a05:6000:186b:b0:43c:f1a5:56f6 with SMTP id ffacd0b85a97d-4515e245b31mr19758647f8f.43.1778257064705;
        Fri, 08 May 2026 09:17:44 -0700 (PDT)
Received: from thinkpad ([46.164.92.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6b071sm5276653f8f.14.2026.05.08.09.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:17:44 -0700 (PDT)
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
Subject: [PATCH v2 3/3] media: sun6i-csi: capture: Support MC-centric format enumeration
Date: Fri,  8 May 2026 19:47:21 +0330
Message-Id: <20260508161721.94285-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508161721.94285-1-arash.golgol@gmail.com>
References: <20260508161721.94285-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_091746_924331_A730047C 
X-CRM114-Status: GOOD (  17.54  )
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

Extend vidioc_enum_fmt to support MC-centric enumeration by filtering
pixel formats based on the provided mbus code. Advertise MC I/O support
on the video device to reflect its intended usage within a media graph.

Signed-off-by: Arash Golgol <arash.golgol@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v2:
 - Return pixelformat directly instead of a pointer
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-4-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index 375ea6745eed..2db96ee19d8b 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -327,6 +327,22 @@ static bool sun6i_csi_capture_format_match(u32 pixelformat, u32 mbus_code)
 	return false;
 }
 
+static u32 sun6i_csi_capture_pixelformat_find(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_format_matches); i++) {
+		const struct sun6i_csi_capture_format_match *match =
+			&sun6i_csi_capture_format_matches[i];
+
+		if (match->mbus_code == mbus_code)
+			return match->pixelformat;
+	}
+
+	/* Valid fourcc is non-zero. */
+	return 0;
+}
+
 /* Capture */
 
 static void
@@ -729,11 +745,27 @@ static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
 	u32 index = fmtdesc->index;
+	u32 mbus_code = fmtdesc->mbus_code;
+	u32 pixelformat;
+
+	/* MC-centric or Video-node-centric */
+	if (mbus_code) {
+		/* There is only one pixelformat for a mbus_code. */
+		if (index)
+			return -EINVAL;
+
+		pixelformat = sun6i_csi_capture_pixelformat_find(mbus_code);
+	} else {
+		if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+			return -EINVAL;
+
+		pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	}
 
-	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+	if (!pixelformat)
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	fmtdesc->pixelformat = pixelformat;
 
 	return 0;
 }
@@ -1065,7 +1097,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_csi_capture_fops;
-- 
2.34.1


