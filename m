Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8788CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 05:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5bmiBt/UaAj8FYk6z1JEgvnehBBxvzIZjMWnqTHpn8=; b=ha+Uj3qk+9YPHpvKAk9QuxRyx0
	KSxW5/s7SYDDFWfnyS9qZAlWkoD0Nu2B49d3QMlo+kjQqfe2USAiqbtb9OV4h8HRG7pIGW0LLsSkz
	SbeXZsL17GVCxU9imAYA2cq/GE3OBvl0cRYMxRiI6+gZMDgsQm47ENr0INtX/lp79jRb+D9QF89xf
	h2gnAO0rdCJOZTxUF0XtXY7ypVlbuLhxQdiG3+rIhMbFge7BJlUP3nClmnJwuluCjVs5IzfgZ1BOf
	W3l2ynETix46X5OpWzSMxuaA74KAIlRzs+VdVO5AY9EmGzy64QzOHj0AQc5JPJcdnUEouzj/HVJZr
	UKvLETBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZwK-00000008GkJ-2TUc;
	Sat, 09 May 2026 05:09:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLZwH-00000008GiT-1fWV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 05:09:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4891f625344so26829435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 22:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778303360; x=1778908160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5bmiBt/UaAj8FYk6z1JEgvnehBBxvzIZjMWnqTHpn8=;
        b=roAfUWm5TvYVSVjKs+R78E1aCntfHJ5VBxNqCJ7pyoCBUkjZqtuth4gj9om42Z6cOj
         U7mX+aaqhXNnYlNrHmmgczZfmKf/KhCL3z1C/CrnpkazgEZlXlPe8aShABDSToQ+JnKm
         PjO3nSSLApvXHz1fJVzZB1E32aBRmsaXjxGGJoyblpWsb5lEvD1QWBnlhk9GNGSjN3zW
         ybhqL6INJOV59aDpaNTn+WL9ddUg/VU37gFUz7kCKsTr9KZJa3v/jwCN5XjobgezUhJN
         DNMQXnZIFT/BmLxkF1IXoMFl+4eCLRHrFGhv070wDmBFuEE+3OPhNLhxb9I1EMmjMrWX
         +akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778303360; x=1778908160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g5bmiBt/UaAj8FYk6z1JEgvnehBBxvzIZjMWnqTHpn8=;
        b=iHu8FkVBQzurzei1a5O58Tel5LVLp0Pppn00K0mPNru2nHwBGmk5zQoBDgePTLdwLc
         B0rx1Gwyb/zI77/pGfgSRqj+kDy2ViBB4Ru/tBCeOGX8Tp6MhYLGWxdjbHdR1o24mVLR
         s6nOBy0v+Dg3w0hndJOmCnuZ51qs03Y3qUoqJ3o0v1Zo+z/KzzLValvpTFcVXOjIRqBH
         u/Kp6r/tdMseKOt0sCFGS+y7h5HvxWBItXmBQlB5O4GJgdU0QzNv0s8AtGp8YRvFdiJx
         Y+RN6uHrX1JsU0l/CMD4JyBbXyO6xlCqNBYdc6bhhEf+2xCyNPfe+alq1TZ9tuSwtPfy
         NNIA==
X-Forwarded-Encrypted: i=1; AFNElJ9jpuoEScJIFWdmw41ozHL8rUlHxDQ2rEYwykOx8a9VqKrW8kcc+S0Mjc6qEMckHzB1Cyy7iRWwNhNFJgMskYNY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4y5q1AEfw+yMuvC7bz/ZS2sIiuO7XUT+/mRxTUklmGF2mH6nV
	jvoVcK8LQiPZxjt2L9k+cRcoHceuswx4piB15H7wdWfRVsfhm5eLbHzt
X-Gm-Gg: AeBDieuFNPw2W0FdAQ+p6eoE7Zllp9yD+d9T+VX6DgEtv73bfFlXGuC+d6LqkMpkB6a
	UINBA8PxpJ7RUdAgdmpNGNmBzwhGwBwF2tHfj5WCWk/+zJgzjDlxMUQG8mDEzNrph3sNbDn7ski
	BffcbZktwx+dwojhtjJHqLG6bJxgMCZLhwTJqw+MkBMrngZXCujjS70esleYg3uufbCpw2XaJvL
	IyJ4bTAooVopmt17YemACncjDrmMl/YHfXe7M/HAfmAWWYIrzJi8Cm6M8ftmMspdpnITJZPgpnM
	45rhPV7iWs1T4+F5d7jnKrE3SngZeSWwM2qutBNwiTHCY8bTjrf1e1AnoFjth5wMl5SM9wZOcUS
	9kGXq4iypz/+kfnFlenAF0I0W42HU1YTBRVvzhzwiriuUgf3itUEN0ZqDvaPxXFR/hw1nL08aua
	ORA1xWTkjPYnMSRUtTDbduiLzHBDRBQPJxbcjebVzb6YgiHeq48Vi7oEB96shA8T5ubzvaUoXWf
	/dNJ+pXzCn2ZeSjWrRR
X-Received: by 2002:a05:600c:c4a5:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-48e6cbd6c10mr61082785e9.5.1778303359626;
        Fri, 08 May 2026 22:09:19 -0700 (PDT)
Received: from thinkpad ([46.164.106.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702f407asm23776455e9.13.2026.05.08.22.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 22:09:19 -0700 (PDT)
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
Subject: [PATCH v3 3/3] media: sun6i-csi: capture: Support MC-centric format enumeration
Date: Sat,  9 May 2026 08:39:21 +0330
Message-Id: <20260509050921.22158-4-arash.golgol@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509050921.22158-1-arash.golgol@gmail.com>
References: <20260509050921.22158-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_220921_457299_FFB67505 
X-CRM114-Status: GOOD (  18.05  )
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
Changes in v3:
 - No change
 - Link to v2: https://patchwork.kernel.org/project/linux-media/patch/20260508161721.94285-4-arash.golgol@gmail.com/

Changes in v2:
 - Return pixelformat directly instead of a pointer
 - Link to v1: https://patchwork.kernel.org/project/linux-media/patch/20260217064050.18388-4-arash.golgol@gmail.com/

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index f788b4234673..5737ebaa7297 100644
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


