Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24DDC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shH843LHjaIQRh9aDyMZtBz794Pr/77dB5szPFtHFMg=; b=AsN+JN4BkoSF4daix+xstIjh5K
	yC+wYrZOm9uQV7YmJxe+K6fGBox0hLPbO4rUuEDQiHiVmAWsB8p+RZSBsIKFXbhCtOCyijLK1z7Yg
	b1j5lI+X48uPk5NYf81RmGwLEaAh1MAFO1edM2s+zC43cHQL8YWxYWXh8ISONuq0vy0fnX3knvgVM
	bDcpGowvvWPZUTCs4kcenFp/iZ6x8I80aOlGNujYZn6bniGE02fOkLZPfjuFGMnSjwTxJNswhMMfv
	AHSf9sBYJkqzXs1Pm4GF+lUrPodLH3BrlG/ADZtPfr5dORSKapBaUatxfPaGclFwbebSYybEpzyLN
	3KVjZOdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzS-00000006Mpr-0TZz;
	Tue, 01 Jul 2025 18:45:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQx-00000005xpr-10Kx
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 16:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=shH843LHjaIQRh9aDyMZtBz794Pr/77dB5szPFtHFMg=; b=SWMjFYS7CbzMlHcWp1/FVhRdki
	+fRKTE5mv3uHbvhMIqPCfrluRn1DsahanQz3noDO1zCEa2CLch0bV1lMz51r1lGDmR3zEVqAqecLS
	MjxuC9slbe1dNIMlivr7NcB9TbxRt+UArI4y2I3ZuckIpPT6fVBtix4jGZpWDd+Dl50iDKbdO+oU3
	Ku4Q9loLkw+J+I8usVyt8jE5K3vy20j+B1VIsn91+atPMJgf8kVctGeEfAnG7MeqVPxcmxVyEY9Iv
	JrkzSjX7tomQLSZiRccKUtWAOBGlGGP7LrQi661hLURO37G1G9UJN+yJ0ANTNWW9xuat2wgo0kkmh
	MyGXgxvA==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQs-000000077Di-25GB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:02:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so34613185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 09:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385723; x=1751990523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shH843LHjaIQRh9aDyMZtBz794Pr/77dB5szPFtHFMg=;
        b=tM9I1CJM7bzlvqTir7/RRIjQg+RpIwSbazqdpJTabAFo0d5zw49v7LVfRewqfznCJx
         lwRZcsZ02sVR9ooci+PmPOwH/NlDTWYBgkwfuouGwfUVEMflfI1H2P3BDXJZ75AbNvr3
         fT/ANABzey24mNs9PruvbGs2ewxvj7g6bbkFnOl/32uylKUvbXYrFYEGUnGmKMqd5Uto
         mp4LhSSjt0gErYDnlLfanUNXdlI99lFrnrwQo1RMonfo7Qdc6El6MVTyb1JMNIZcMDSP
         L+oJaOM0aDRcwhSDrafKI/Zumq/GPTOudX0aP1XzZXr/NX4KZ4gkHABn3G0B4tpf+Jlz
         qWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385723; x=1751990523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shH843LHjaIQRh9aDyMZtBz794Pr/77dB5szPFtHFMg=;
        b=ShzdWDbdrj+FsiTQKF3yRVjBulYKWTlb8vjgJuS4TP2EfhVG8Sa1gKnS06SgELXZtO
         YH4e//Lf2Q1Y3tcwPNvlm1ppotbzBTm/dIDkV5l0xx9putu4fyzcYu7FZVdcszacC/Uw
         rOnT3vwxPcXDaRKgyxl2vGDqUyTwR+6SQTnh6kdQlQ4LwBjJ8Ng6Uf2TT9M04h8k/NNq
         7pI66depJwcDqJobr0nZl7oCoXFx5M4vWb14ALGupVfLdPo5CqvXVwfuS7RtexMxxr+G
         zD/8V+UmjcCjfaw3utFGIbDi8Dt+ibW4aOaa9nVz7aHiPpAymYA4hhDQwyYajXpyEsfZ
         sJcw==
X-Forwarded-Encrypted: i=1; AJvYcCXS6hUFVUwdVIiadNMJBr8UUdRVTuv5XgTbw2GPVTkl0D/sORf2Rpq+9iO+peZYF/JmDxGDLosh3gt9a6YDYtuy@lists.infradead.org
X-Gm-Message-State: AOJu0YyJhBTfL4gb/ziaWM2QFTPx0Fl+dGi3El9llmvvxxiYYdi0p2NH
	+6XaBpY0xg6yKTR9htIZVDmnwkLaTQJZicG22pXQxVw9SRjc9oQPuODloL8vSwY7Edw=
X-Gm-Gg: ASbGncsEcmqIWRQKyU4iF/FEOkepKd+VMGnetDwA0QOte0vKrUl/vUzCWTOQ1ZTBAGU
	5WGoyJr1Z6sOzSQ1MqiS3nY8JA5KIY32/9B4DtHDWSwaFnWrj23cPQSLsh2ekoeFveHiU23AA1g
	dal+3wklFUj4B0gTuD2w1efnxzS/0bsF28wy0H//sGfhkHemQHaDcBy+FZTrIxaSK5G5Nfoor5t
	OYKg08a1G5vTmVRgaIgeVdZH3iTkWxWcHx6PdH6BpDDOfLJOwYXXDh/J5DaxiOQgyyNLZ9VVUuP
	nD5Uj4jDtfngoD2tFrM0Oh5u05adt8iqvotga3hqz+4HJKwcyDCFbQ==
X-Google-Smtp-Source: AGHT+IE146BA9nfk2sth4Vr26o/ypIBHWd57X4CUtemwbh0xYtrD7BwQ6IkyNJhKZXFlcPZr5B86Jg==
X-Received: by 2002:a05:600c:3b07:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-454a19df49dmr10490475e9.7.1751385722446;
        Tue, 01 Jul 2025 09:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:02:01 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 01 Jul 2025 17:01:37 +0100
Subject: [PATCH v4 2/5] media: ioctl: Add pixel formats NV12MT_COL128 and
 NV12MT_10_COL128
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-media-rpi-hevc-dec-v4-2-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
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
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_170206_685935_D3453880 
X-CRM114-Status: GOOD (  12.18  )
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
index 650dc1956f73..3bdcbb12bb30 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1381,7 +1381,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
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
index 9e3b366d5fc7..f0934d647d75 100644
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


