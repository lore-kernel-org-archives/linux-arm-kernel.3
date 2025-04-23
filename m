Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CBAC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4rqGU6lspHQHS3YtpHeS52QHTuXwrfXzLgazS3+iqpY=; b=SU1T6jgOFzxUGdvp6eq798Ey+4
	MFucM9oSt0zQLPCSeNZiOFaHgJgi2ZeWnIKu+haxLt4KMXL/+UyPJuXoY6U0AmeXg1Z06swHx15Bj
	iWV49JF48mPx0QRQLt5/tsy+gLvxOHw0S8bJLr6ISsvcCvniWE3k1lpmspGRhJQXO7++CW63ANRoc
	ZXBIU83e9EOK/C9yKRMI6grL+Rs0tuvKp0HaIdvtIcsnujCDcyByabcgmiNJrUldK3O12yiHNbuH7
	RK4CaYXYV6rIl63vsVZxR1OwacYK8IIbVQtgSdQ1+bf4ynZKBEg+QYk27BEiMDPnL6R3XrboG0Tss
	VgJXvITA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7f21-0000000BcTJ-0Fst;
	Wed, 23 Apr 2025 18:41:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dm4-0000000BFX7-3eNh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:20:42 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43edb40f357so781775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428839; x=1746033639; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4rqGU6lspHQHS3YtpHeS52QHTuXwrfXzLgazS3+iqpY=;
        b=TW2IP3tMswsebhhVNBIVJjTAaRV9VjX1eEa7XbTWvN9ZbGcJT2A/B5GWUMljbBevgl
         jOt3smW/O3SZyju7ZtnjWQEtmaczeLNm7mbsSxE/5swJCGrO0OdXk837DHOfIayyz/FW
         3OU2pG3NJcPKoAXoDBjXnDbbjw1tFFJDuS+JwYysJaX+qiLB6nRzonYp9SCgPpaT0egd
         uBJQ65L6ryLx4hxISI7dinb1tgmHjLSbopxYgZbFaFejP8WRUrFtulH9ar478FEKA/17
         18LWjg9sbrmSpb+0mzROa95x0b0kj9W2ED+opY5IaQWmAJZkuJf242TaFvrfT1zJDZid
         NTqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428839; x=1746033639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rqGU6lspHQHS3YtpHeS52QHTuXwrfXzLgazS3+iqpY=;
        b=YNtD0PIulFeCPlRFSOErPbuadA4SxI2HMRAPNAa8wPbD7CpJaQWdbsEySkV4g8mV2v
         uo/QR1wkcLE/tFpRzDiO5FINFinBqIDUT0N5GmNsKcv/gCTot6lJZDpHUGVKt3MmSBYf
         ewwy6c+LMTIipHhf0CkuIUFiMlLpg4rqxjhdzLeIlDLcV7K3Q8I80oKyTnbWitnd+KMN
         wf1tG6R2yzr2rUKptNko17StKNAktsHGn4K4SAmdISEISD/KFShit3TuPDo/FhLWj7so
         atKSFf5QtIJepR39xCDJNsC7Sty9Xl/ANW+Go37HWLilXZ5WUKC5n3ndFXXZ0n48Oxo1
         JYAA==
X-Forwarded-Encrypted: i=1; AJvYcCXZCctkVTEu2v7FtYNa21SIdxiW5ChId9g3OepjhUHh59HctN2dogz5iUUlWZ2L6golpuq6fmMCmnmFG5L9NXkL@lists.infradead.org
X-Gm-Message-State: AOJu0YwLMW33UDvRRPYJpJCyT1VuG2/IdutOjW2WKrTI+YtiuTctMIzl
	9tzjYikLmAjyxqrQ/O3SUKBAGFXV21nKSQybP67kQRf0GcEwImNrTBWBP6bCAxA=
X-Gm-Gg: ASbGncvaUW2UsMaRmMBX7mcAl6Dj91oSs8246zW0aIzeT1PPhA1Q+IeWAYHQSxf6eqm
	zRunSyhcZ3L/nRGwfr0cRgnFdIcIdknArDMKYNVLKhB8wagF+MkaWceWGfTIFApQSieD+gc9i1L
	gdW7X3dC76xw+VcRH1XEOpZk6onixTCVLPn564cY/W/m6kBwnR5TNrJAUSi40y/+YLaUg6TKb0T
	Uz4xNJwyu3YfIaIOjg8UJvNlUPkSXv4TkkEDWCPD/gsovPUZn0b36lOI31ITAOh/GbvUb86NL+i
	b13IG7wIlm0cJQYZkNkaBulr25hEAkVw
X-Google-Smtp-Source: AGHT+IGrixIUdFwDqxJsP0Mh+PleUdGsoK+ZibZSwUPFmb7HHGdjv1z9p7Q1wXmc1rZnucAiLmqGBA==
X-Received: by 2002:a05:600c:34c6:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-4409a1c4da7mr3750025e9.30.1745428839115;
        Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:38 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:19 +0100
Subject: [PATCH v3 2/5] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-2-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20250423_102040_972379_F0BD4458 
X-CRM114-Status: GOOD (  11.60  )
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
index a16fb44c7246..9405e1391617 100644
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
index c8cb2796130f..fbccb471e3cb 100644
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


