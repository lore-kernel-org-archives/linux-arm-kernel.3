Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADBCE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7IbY/YnqtHAUDFghwcKoK/zkq5StHeb++vxI+BXHd4=; b=GsnaGhXhzEkRrfgYomieE7Ob/6
	kh0ngZGuGxaxU6LDVoB6rwDIgRoozejUfOXBWfSJLHaKTbVQ8Q8YFOisChvQCMkJaIdmkTK8LNbOR
	nAzafuih2kNnfN5IaClmpQkEI+R80OtfVb4hDQjXjUPCDOIaPeFTYilmiGhjm/eDYpGB4g+bBwhG+
	qzzejmzxHQyjtnOBYRzkc6B1B6ymeKQHMzaOYZcw+D0oUWL/nY3RncgkI3Dfr79rqZUfUyvVYiJuF
	fUu8c43yPoQhv0gVarVah9hCp6Jp/8JhIOGzF12d0pxawyyVa0bruwEVGujSvwLLhJu6xlUJ5fnFx
	BYqrjF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfnD-00000005S9T-091U;
	Fri, 20 Dec 2024 16:23:59 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfkw-00000005Rpu-426W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:21:40 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso20485405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 08:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711697; x=1735316497; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7IbY/YnqtHAUDFghwcKoK/zkq5StHeb++vxI+BXHd4=;
        b=efOA8/TBL+JsO4Ythmb8jdqsdp5KmkkF1MmQwpsa1lPhizrZV33BkdxMpn3hMxIb34
         oMxAsGl010kZWOFXBlLuOplGrRozR/8Ca2mLFY200tSxwQ5/b8sBW61ZjWHIO/sTQZ/Z
         NluP+pwnMJnzx6zb5qlC2rWQ9/V5RnIzZLjlvdzqm7zlaYAxWSx3sq7WvC8oCcOj4mh3
         cYWejAtu5M+Vi50PgL+O9vV+eumFdnhetKPVCAGTfH972CCI1qWwRgXyWTsLyt54JKH1
         BLqiOOGftKJqJPtRXRCUDQxgg1W45Ri/rRsgEUz+coIada66x0TV3ZMomppZ4Uv5NZRc
         vfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711697; x=1735316497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7IbY/YnqtHAUDFghwcKoK/zkq5StHeb++vxI+BXHd4=;
        b=kCfvPtlTTBDRXYKINcPBW8SB5oHJAXfXhC2fdwNT9cLGXQbgHAYL8yQKrLrpK8hiyF
         65dk7HLywBQEicLpPoKwgnT7Eorgwl0HM3ALA4BMiFbpEzBqZ0GvMLqAyea/w3mCn8hL
         DmhJGbk17lxT6wpxeLg97AqpMDVuCQBlfn6eYO0hcLjJ7De+tJurV75o2vm1CpmOwexY
         lEZEQyHg45F3GMy22fDMKVWsg+TeNMH57cjJdfZKzXG+G2NHNDm35ZHNi0+w7ACVCpxJ
         Nth45i5UX0HBLbcGQA0sCcVmkQE/VlAv+OlAAJ3yOhYJaTvFiXtThDSDdx5EQpkUVNan
         7vpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIxbUrHfkNc38+Ges44zhRNvP5RV8QQU6H37msn74cLOp2t+mPQCQmYh2fORacOiJUM33DqH/+Ut6gltyF9TxZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzitDDXzyv+Ll3dk2px+PDjKY52S2MPDeAG8x0CTRWRAvG0R74B
	5lYH87sZQ2D5zACNoyU7mbzcIAY1yggycPTpAD1/pHGvskQHq1PaRp2CHHHe6Bs=
X-Gm-Gg: ASbGncsY4KP68P47VSYAr/2vkSmEPrn2kCi7ZRKXbLdMex32R2IhOp6ENGq43iHIY5v
	3YdToLatb66vF3K6Wxi1dKKJovSVguEz6nzcHjuplK5nEwaqeIYGbY9snWQwbk9VAewDtMp3T7x
	uLsuR9+LIeFqNFwLDJcji2zEN64A3bAmXqJvTmNIi4M4T8D6+r1NpOEkHLDuRBObqXX6jhYbnYa
	+TpAleGmnur/QV5rzSWoOJ7NvzPZo+BwdGIPugl1NCLS6HJ
X-Google-Smtp-Source: AGHT+IEAPTJ5m18DH1xYnQd8cUicgjor10RVrkkz1NLTlQt2JRNWxgVG080MQ9UkLDrS81AzW5xAKg==
X-Received: by 2002:a05:600c:45cf:b0:434:a781:f5e2 with SMTP id 5b1f17b1804b1-43668642289mr31526005e9.8.1734711696988;
        Fri, 20 Dec 2024 08:21:36 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:36 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:14 +0000
Subject: [PATCH 3/7] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-3-0ebcc04ed42e@raspberrypi.com>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241220_082139_003473_37557343 
X-CRM114-Status: GOOD (  10.98  )
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
 include/uapi/linux/videodev2.h       | 5 +++++
 2 files changed, 7 insertions(+)

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
index e7c4dce39007..f8f97aa6a616 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -687,6 +687,11 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
 #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
+#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* 12  Y/CbCr 4:2:0 128 pixel wide column */
+#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
+								/* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
+								 * a 128 bytes / 96 pixel wide column */
+
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */

-- 
2.34.1


