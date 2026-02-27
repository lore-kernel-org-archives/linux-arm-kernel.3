Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD61FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D22wsJVQwr9074cfNWay5oaTG2nKsW+DfTWeOhL5zHU=; b=HZLxqcSrbUe1w87Asynb8rUqfA
	2Kgdqu2n/FNLWWgqDtODLiC+xgHtT/GdA+Zr3MAJAr0D6KdjKruGXCad1YkzhXGxWgdRxepHKnoNT
	GckqgN39ObAmHy3o8SABmSw4e2ZaJBobBveczBckWXxJldeVOgjijoCzxl1WczEj4VGveFP3Hpusl
	Cb8M/s42i/BpVOZlz9EkQTxG5zfKxzj1044/5A0rbKqDrYwDYZxuPdgQeZLp2NXgQUnr893eYbhHf
	EaHgFBBo4fEZhttkrRaPbf1nxnKm4+RA5vAyavHxDVt5X0XuupZnSgpIT3tqMhuxUvmv11o2Jdk7j
	amu5JNZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1WP-00000008nPe-2NSf;
	Fri, 27 Feb 2026 17:21:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1WA-00000008nHh-3mCm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:20:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-480706554beso27095945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772212845; x=1772817645; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D22wsJVQwr9074cfNWay5oaTG2nKsW+DfTWeOhL5zHU=;
        b=NdOBkMko38d+IcWvQrz+mwr2zGaufA+vz7QNtNE1NTA1H0XXhsJMK2AoV5GYxGEjc3
         927fryhJbqTdiguA3dM22uZm/m4reUVp/jcGurs9xyNPp6UF3tZLCbzkemnVPRWEWDZb
         pDgvKSquIgjHHLxXnGdZaOQANF7vgtePOWOj6nudBxDDoUOsAZrFN8Arq1af7TWYLexl
         Ggm/LQgDa9MR86awPKsyF4XmwufE/KrqE5y0Q/5kSkkhkBNkY9QxX14QO3retMQBmxJ1
         lv1Vc0E/e2ug4NDpjCefH+ZLSjOycammFxKaXnjDzWBlxdDGT3sJ9MbAUu6tNWDLhf/G
         J7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212845; x=1772817645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D22wsJVQwr9074cfNWay5oaTG2nKsW+DfTWeOhL5zHU=;
        b=tYOIjpAn8u3ePz59tqf6g1/KLIDowIKKNdX7s92HZO+EyA9hsrTVC9A5K4mWOTMf1q
         FEYqcmEGfCNwQVrWuXk1h2fSM8AtkVZaxVt1FP/zty+++BABzo/34c4iySOjLLub7MJI
         dvgTxYrS3RRLipfg2UBf9rtlOLI3uoyrEXDROCX+y0EKRit7X5oWDm1keB1aQeJqWipf
         UXeifCKzAmWo/DXJYMhbDnV87XEITNSop+T+YZuhTwuiPzkFvusSbJ8e8SzSDzbDrYTg
         sfI1eOQwNwiEUtN4Y3/slpOuy9G1eQF9uyvzLs0Zv/qPb7edPxm374wzkx6hyNFCjEHy
         eGfA==
X-Forwarded-Encrypted: i=1; AJvYcCUhfBmbyyM+Ou70P/7p2zd7MVbKhS0KKiS3dzpUczbRvnzWUpYmnFnJZWz4Onrc6v66JUulkE7wB5W1bqWC4mfy@lists.infradead.org
X-Gm-Message-State: AOJu0YxXZd5iQ6/yFQLFjvotpGUm8AvDW756WSMwijmzkGi6KZ4znkqo
	pt8NS84/fvQ6qLruzENok+cNKMBRtEyxGvDJP2CCmhDXALtGqGS8Q6OwLD6noPRqi5A=
X-Gm-Gg: ATEYQzz6kC+zYLY53K7QweYpjnvWT23k5ypUSd7hjOJUws27dgRskzvb+j6apGOdMc7
	wApN8q4LXazDzkV2H4HXJEcWZeclvek3XNtVIGXx0/xir8x48TLN083M4M1TUBpSNPCjY0oe65A
	mJI7dlm9S825gk89LSfw1QUdVLqm5difrfjelbqHefjjCbio06YFzZtubaS/n0lcskP/V6Z0Y7Y
	ocHR4LOD/9EYviK4Vfzg/OBsoRjUo2GlTIUcCZr8GUacXQBTNRIXSQvz0esR6FFNI3ktCgb/OIP
	iYb4G3oGLSrohg0HduVcHTRDIUAMzHZ/pvLCnxJ61qE+KkgWgBCNniTlMVVkKJ8sOtxbV41ETfB
	48IuSnzBfXKqV3vI7eBBv65X3oaNRXYrzdtJ3qTmr8Iq+yfiMGHyWD8dFkzPwjn4kK0nRqMuzGx
	Uj0U5Y7LSIWoM9DQ==
X-Received: by 2002:a05:600c:6309:b0:47e:e87f:4bba with SMTP id 5b1f17b1804b1-483c9bc6164mr55009605e9.29.1772212845194;
        Fri, 27 Feb 2026 09:20:45 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfeb932bsm60828075e9.28.2026.02.27.09.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:20:44 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 27 Feb 2026 17:19:08 +0000
Subject: [PATCH v5 3/6] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-media-rpi-hevc-dec-v5-3-9bb3fc1816de@raspberrypi.com>
References: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
In-Reply-To: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_092046_988396_FB650DE6 
X-CRM114-Status: GOOD (  13.70  )
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

Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.

NV12MT_COL128 has been added to v4l2_format_info.
NV12MT_10_COL128 has not as the block width is not a power of 2,
but the framework uses ALIGN with the value.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 ++
 drivers/media/v4l2-core/v4l2-ioctl.c  | 2 ++
 include/uapi/linux/videodev2.h        | 4 ++++
 3 files changed, 8 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 554c591e1113..20a7066df570 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -311,6 +311,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_NV15_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2,
 		  .block_w = { 4, 2, 0, 0 }, .block_h = { 1, 1, 0, 0 }},
 		{ .format = V4L2_PIX_FMT_P010_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_NV12MT_COL128, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		/* V4L2_PIX_FMT_NV12MT_10_COL128 can not be described within the current constraints of v4l2_format_info as 96 pixels is not a power of 2 */
 
 		/* YUV planar formats, non contiguous variant */
 		{ .format = V4L2_PIX_FMT_YUV420M, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 37d33d4a363d..2fe8f591cdb3 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1379,7 +1379,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_NV16M:	descr = "Y/UV 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_NV61M:	descr = "Y/VU 4:2:2 (N-C)"; break;
 	case V4L2_PIX_FMT_NV12MT:	descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT_COL128: descr = "Y/CbCr 4:2:0 (128b cols)"; break;
 	case V4L2_PIX_FMT_NV12MT_16X16:	descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
+	case V4L2_PIX_FMT_NV12MT_10_COL128: descr = "10-bit Y/CbCr 4:2:0 (128b cols)"; break;
 	case V4L2_PIX_FMT_P012M:	descr = "12-bit Y/UV 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_YUV420M:	descr = "Planar YUV 4:2:0 (N-C)"; break;
 	case V4L2_PIX_FMT_YVU420M:	descr = "Planar YVU 4:2:0 (N-C)"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index eda4492e40dc..e466c816ff2f 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -697,6 +697,10 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
 #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
+#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* 12  Y/CbCr 4:2:0 128 pixel wide column */
+#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
+			/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in a 128 bytes / 96 pixel wide column */
+
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */

-- 
2.34.1


