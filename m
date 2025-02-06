Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907F2C02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 18:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kR3OVycuCmoqTqRR5D0uJANjV33MoT0CPRB7lcsHjJo=; b=csu6zM+Q0kquThq4YIvt+VT3dY
	rOTdtwBco8ou7IV7cWpkFN59RB5daOkVlW9qzU7EZfNwmuJpd2c/B/gsri4Mo0A2i0U0apqBu1ieV
	vtpZI/6B30vyXcdWEeEJE49GF1QAAnZ64T3m0tn55DxvGV27goaCA7gFkMb2z9DwsxD3rDC7gEorb
	lwjX+SngOmHlxbdO8io0vUFkaAf4m6UI34fKtU1n/iL+As0co+aQvwgkmEzTHWrhzveRLDYyvPwxz
	RyvKxRtq8/1NteTWhGFpdVyNvv4ktPH1iRFsktVG8dVf4hoX39LQmbMkAjNb97+z6fBuvB9Vl8FdQ
	ptj9BmYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Hz-000000076GA-1Whu;
	Thu, 06 Feb 2025 18:07:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Dq-000000075AN-42kF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:03:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38dc5b8ed86so242240f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 10:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738865009; x=1739469809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kR3OVycuCmoqTqRR5D0uJANjV33MoT0CPRB7lcsHjJo=;
        b=M7+hpjpxFwwcu9PCHWO2NBxRJnlcwGGy47BR6djcGtBBa5N9AkAmh4Diy96y6KAW8h
         +nnE9T3UrFwKBlckozpL++QL93BtlXyqOx/yol5U2G1w4mHuKLdVjsH5M9/VJ3a+WgYI
         77BTpI/Br4ZFHDk0Dt5EBcM4ojeaNG3vqcCdCCupAVSqbuFo5hoVUyKuCeSynDBLeR4P
         FM0qttcyS/j4c05gxvudJH9FA9kA+0gm9p0ILJlSnNTVe1YaiwpnfBQGqQakqTYHWxid
         mrgFggN9PEV1khpw6+Zj+CAiohWVwziahLt3647PhBjcOat9JeQjw6y2+noYrT2iN8Tg
         LanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865009; x=1739469809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kR3OVycuCmoqTqRR5D0uJANjV33MoT0CPRB7lcsHjJo=;
        b=BK8RPHcfocktvWTs3DIl6mO709ZBcOIYHIRYraNcJCrXrlzhXmVxoMQfmvrc/iRmT3
         mFNFtXMam2f055stCDPzlCQm3zjMuiwn88eRt6vK83W1UoDzaf4LZQKHSM+5oM/OxR/k
         WlPKary2ypjrneCXe9+6YllhzrunVlqz8pMtNwsnmqpKpgswSJmgxnexKYQxzIXdxJtG
         SwBcxCzvxTnE6sYIi5dQcYgDDFykBlmI7VOWDP5UCDLvUc+LZSlKcIMCciwe5nriWJun
         Nzv/sI8LvsmCuVhSJqKggMMXSkYbZsGH6WAEWWRygB/KLnKUqPPHmbFj8g0aTYVgfe6p
         7nPQ==
X-Forwarded-Encrypted: i=1; AJvYcCURfRC1hhrHY18eVLpyAu46WWSwLQ6ZlyUzdqOBVrDW566CCRnC2dNNjs/IDP1bYaPnt8V5nFeyzXWLyJpt3pw9@lists.infradead.org
X-Gm-Message-State: AOJu0YwednTMLnOs5q6s4/z3rmXHoDfbEN6kFMJiUj5FSCBM7O+2i6Uc
	sNQbT0JhM8xy9eNbNoJSojEOrRLaqlQAQydaEZtYfmh9aaYwoMZRJg+8gMD7IYM=
X-Gm-Gg: ASbGnctVDPDjAmY/vkUEkAk+5OY7tklxtsn4dhEgQvg4C2Slzm8E1Z9VdO/XHrU3/pB
	7iKVgcZSYEkimx0S7mCS8j+rAodMroOBcdt6/Lr3B4frAqlwL/rzNjZd/eMC+BtiQKFDO4S6HUC
	S66NhKjQHn5JLdVJ4yDsvjWDIAMkQYKqAUtUK+sglepOqNZ3sOlYvyZEzbh3HV202FPkMe1dAFv
	Uwq3TVdgaaMX/H3I9roUUPqNMgZRXsbMS2cGR2rtvfY4cBhHUfV9yB0mgvtVKZX+DBt5laDnsIe
	EvtdkbQ=
X-Google-Smtp-Source: AGHT+IEoc/9XOwlp0DvnbUlLjy/NlRiR7j2XwPEULfDZEUfoxbrwXS8TYDaBV4uvHBf5o/4F0pxwsg==
X-Received: by 2002:a05:6000:1886:b0:38d:b2e4:6d98 with SMTP id ffacd0b85a97d-38db491f10cmr4937014f8f.42.1738865009088;
        Thu, 06 Feb 2025 10:03:29 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dbdd3856fsm2278858f8f.28.2025.02.06.10.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:03:28 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 06 Feb 2025 18:02:35 +0000
Subject: [PATCH v2 2/5] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-media-rpi-hevc-dec-v2-2-69353c8805b2@raspberrypi.com>
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
In-Reply-To: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
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
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_100330_994291_9343D7C9 
X-CRM114-Status: GOOD (  11.78  )
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

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 include/uapi/linux/videodev2.h       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 0304daa8471d..e510e375a871 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1377,7 +1377,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
index e7c4dce39007..ce07b242c1a0 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -687,6 +687,10 @@ struct v4l2_pix_format {
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


