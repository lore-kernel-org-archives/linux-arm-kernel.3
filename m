Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDB1C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 18:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOZP3BcptZSYROqm0ele75c0kFNzuWVKa5tBqUZYrLc=; b=a9VTWTpTT36Elhvf1QM+7t/9mX
	tj0rZ9gc1ccZBA70vwJ3tUpqfQzvK6M5DFZZZZ0Dni20K4LvP5bgzOea9BT5DCQoTccJg/E5e4XXR
	MNO/dHNBayQu6Hl9BAiipG5D/NEcuuUeMkGUfPbcNGxF4bby7T2cHM+PurYND4/3xlEKg1XBPKiGM
	pJ2U2a89b0GEJzzYQJg31wqcvjeYrJRYXR8DXDrKEfiBcYCT78EosvbFTiGzcs0jLEZkgBfNg3M3I
	j8GmDiPNbZRlYL0AvUeyuVPsFzjoZ5JI9msO4Vsoc+zV7L/MgOWw53EPBYkpPr9dHjMF1+C6GrFNQ
	FfA+lEBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWfzP-00000006MmO-2ft1;
	Tue, 01 Jul 2025 18:45:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQv-00000005xpA-1q4C
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 01 Jul 2025 16:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EOZP3BcptZSYROqm0ele75c0kFNzuWVKa5tBqUZYrLc=; b=bBfXgSnHDOlOWO7q8q0IlxBUWW
	sMcS7QM8i2ep0uCqLO5LftdlqVZWFeTvAcQS4g/OkZijP3dg31stU16ePgZZxY+Abjv0ZfTh2pqVT
	V2PPVcUXCKlXWZS4X5A7ndon9Kcdtn5QoIZrBrMLMeJj7EhTv5If8ozKFoJQ8pFk69JvK2MPM/8kT
	wP1GSvfRJxQLGMgYD55wxZ77s/klA9K1L/Ovl8i7TvsvMCkpM4nq3sANfMYEt/A1cd9JfUv0r8UbP
	uG5PTEtBtU9vqlf33mgrJjZW0r4n0At1XVlRPinTFDQczq/SJ1aYqYpGLzjf/k7f54fQjT9C5qaSf
	6vxw6Izg==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdQs-000000077Dg-1mmZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:02:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a528243636so3698054f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 09:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385721; x=1751990521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOZP3BcptZSYROqm0ele75c0kFNzuWVKa5tBqUZYrLc=;
        b=QUCgiMO2/n182BWpQLxn1LHi1ez0clQq8o3IHaXLVdHl6ZyjAslOejxTMPx8zWtcPf
         mzOFThEhIa8JlGr7J1B/60LSOYZ7Jyj4a5VnBORQ9x2ahCNua6JZ01Li/w5dR52HUumq
         OSxCJ4KxmAV23VioYF1WxhC5qQlpTqjWmAzeHzXYM07ORU+QVeBPLZisZdVv37YYt9qH
         UVbRo7UFVQce/3SVOM70ooL0iN/UXaznXLhsuIdMb6v8FJi6ieivmwQks6gIb2g8k7uK
         NTmaBxzkNewD5l1GhAIMw4yAV4fJReGadjkBjJ87/d4zCO/ie7JICjcSq9mmW9ytQKKi
         i19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385721; x=1751990521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOZP3BcptZSYROqm0ele75c0kFNzuWVKa5tBqUZYrLc=;
        b=ED3KfWmIpZ9nlqUQU/OWnCuejdGz0eQtNKWWKPIJNEdlvn6DgIjNMYjQVDMtfHRF9o
         f1T8tYf8lDIXe6FYGJqfuunHvwdiap716+5Fi6a0V04/nrHmK2crTo+fuZc2lpyHNzxm
         CwMEQdNnSJzMV6Gk7dmd/v7rx9kIG5HH28d5Vs5LMVOSc8N+28thhx12fdx5NBnqYVgs
         oEDcIgGVBxI4ZMqAVJVGQmA9d1lMYaW8msguNf8zl9TX5OOzxjVm4V8iyLsd02geMCEm
         AGdBVC67+mePzGGuY9CEx2LJP/2cs1nPUNiC9SvoXb7UWS07WvSJEyssI2i95m+iP+W/
         mtSg==
X-Forwarded-Encrypted: i=1; AJvYcCXQYcEvOnJNnTWuh57edyeOEPw+dTCIOFb2uJeZHX8vJDWxXwwnr0YVzHKa7Awu+7oiAFzsKkNDxBT6qj7bZN7y@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3AMWAocD8A7NAkO+wrhNg8qMqIaBEdXz7kCm2utANO+5fJBTC
	TQW270HVgRjzmNgeKwhlbc2lozKShtxp4QtnmQwSnmjt3XbsW7VvVgZhYB+oVycXDpY=
X-Gm-Gg: ASbGnctvgwu9Lu7MqwGUHymEXo0cHZyIEoJf3a94f0a2XKZTg5ODEiqyLpy9KLT3xWQ
	9ioZ6wYtq8mzNlVnxvlJwH9f3FGPOg6F84vkw3F8GCjaNMlMji4pHJGVGmj9nZS0aWwZkP3VYI+
	XlZSGQYVqYhCFexNzUZ7vnbkcutz1pTIICUH3KExACbl+MfD9uyoNIOEarmeV7c9XMQt2Iua3UU
	IV63FefXxOd9foA19+e8ckrzpIqMYUJAqmGKPZzNSnhIfu3838PYLm/7OT9qG8AJexIeExDLFLV
	kyJhgLFUZsGILQXLIS/sMsMNNzR1J6cYbeSPLj941Cjq7fBe41vUh0Y8xuj5cXNu
X-Google-Smtp-Source: AGHT+IGrDuGREIKIk2nqkFoR8uzIUjeElqTk8BPXwPJayvJvDoPAeAcRb+gzpufKi2d4K71fEGSFzw==
X-Received: by 2002:a5d:530d:0:b0:3a5:27ba:47ba with SMTP id ffacd0b85a97d-3a900296715mr14744114f8f.44.1751385715670;
        Tue, 01 Jul 2025 09:01:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:01:54 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 01 Jul 2025 17:01:36 +0100
Subject: [PATCH v4 1/5] docs: uapi: media: Document Raspberry Pi NV12
 column format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-media-rpi-hevc-dec-v4-1-057cfa541177@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20250701_170206_650885_7F8C6217 
X-CRM114-Status: GOOD (  12.19  )
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

The Raspberry Pi HEVC decoder uses a tiled format based on
columns for 8 and 10 bit YUV images, so document them as
NV12MT_COL128 and NV12MT_10_COL128.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 6e4f399f1f88..84ec1dbcf41b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -955,6 +955,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
       - Cb\ :sub:`11`
       - Cr\ :sub:`11`
 
+V4L2_PIX_FMT_NV12MT_COL128 and V4L2_PIX_FMT_NV12MT_10_COL128
+------------------------------------------------------------
+
+``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
+``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide columns
+of Y or interleaved CbCr. The height is always aligned to a multiple of 8 lines.
+
+V4L2_PIX_FMT_NV12MT_10_COL128 expands that as a 10 bit format where 3 10 bit
+values are packed into a 32bit word. A 128 byte wide column therefore holds 96
+samples (either Y or interleaved CrCb). That effectively makes it 6 values in a
+64 bit word for the CbCr plane, as the values always go in pairs.
+
+Bit-packed representation.
+
+.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 8 8 8 8
+
+    * - Y'\ :sub:`00[7:0]`
+      - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub:`00[9:8]`\ (bits 1--0)
+      - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub:`01[9:6]`\ (bits 3--0)
+      - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\ (bits 5--0)
+
+.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 12 12 12 12 12 12 12
+
+    * - Cb\ :sub:`00[7:0]`
+      - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :sub:`00[9:8]`\ (bits 1--0)
+      - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :sub:`00[9:6]`\ (bits 3--0)
+      - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ (bits 5--0)
+      - Cr\ :sub:`01[7:0]`
+      - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :sub:`01[9:8]`\ (bits 1--0)
+      - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :sub:`02[9:6]`\ (bits 3--0)
+      - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ (bits 5--0)
+
 
 Fully Planar YUV Formats
 ========================

-- 
2.34.1


