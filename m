Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7407AC02199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 18:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=; b=k9eXwNK59em41NlGp6EWRKJ7XR
	FKUTFFrlbwctyitRHqWz80/d7OybBuWobtbpi8M0zPPG+bRnKL53exQNXuUALpY6Zc2awicTAhIX4
	AzNaPh2UvpsxnItcTi7/gCt5W2C9gbqZaSL7FutlHy0fxIL1f7s+YtFNWEBRINaajCBltGCgMd805
	xy8MYF5YOapjR2SD+UlQ2k/CJgGFLSQ6sWv5AY3sUQNMmHNwzKAOdOp16imwvwmFvDV4A+RTlA3TD
	c16syMOxS79AF/Rkl54d2p+NTx7ZEjWsddQrOF8s2zQocCgX1RbykT4OW0doja3vGkp27SSWHHkWO
	hgIsoWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Ga-000000075rg-3NYT;
	Thu, 06 Feb 2025 18:06:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6Dq-000000075AJ-06ms
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 18:03:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43626213fffso14434785e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 10:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738865008; x=1739469808; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=;
        b=Q31NwT48Y5ZWe3WudpkksDGsMwzp61SlPAHSSbQgD9nd4R3ZY32Y8QdqAXs4xVdmER
         FhDGMwshj8IPV7W9aGaeblT01sAVOWkBat2bPVocw/v8/Xm194IMrU4Jq+5jNCL89Lhz
         XzJZtTcwMS6W+IIDoWiL6293o5gQrs6/AwnwIaalFicOgwKw+b7QwX4jLmdU9HR7QLIB
         nXUvNOXIKV7DpfIyzgpib/CKO5wTg/nJOmHqIwXPvhKvzNumpP/3LyrNx5ct8DPQFMau
         Gp5ElcYyFhkWFyRsqwZwC6avsbvtRl7VU7wMyJ8SC0GyJqzqCPnBusRrrtZc18DBwT8e
         Pzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865008; x=1739469808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=;
        b=P+ukealuQusGUR8Ps02+5DC8xeKcu2ppsmh3FM9IDbM9PlH2nNaUbUuOlbEJejyCsM
         bKQapHwVzyw0uhYbb+m3PCNHxLxj6TOchcdzCQnL5rBdVSUw4jCWoAz+5bOQyC2KU5h7
         n6pKMJ1LElKeMeZ61GgRUrPxDh7thQGq+yPej5dO507aM0PjgsTHOaFtHUxJiu6kcEsk
         CRSob1VR71f/ZAtSwQu8t4Q57NFOjIFVs+GwUytLyHcRkUdPr5ngTXCOHEtEf1RU4NaG
         HDN7SFYdMns4ao6mZYLmZ+Srs0rDk6zTNc/aER04BTMhUszfAqSNMCfzf4PI09eIFfQG
         0AWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO+YB/mlKW2iBAzk4V+bpA0YxRMraghDcZwKdJ8BVGaVbzt8KBuD4+Y7O1H2GyCbnBnwRlAxJv9+Qg2VmKGkGd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/sqnyc55H8cvKz3SnMSpt/tL7/WK22LP7Vx7geZSemsQ1rzFV
	Sr1xGTX8NN3MfwvX42p+rFwG8UaeiEqgfPjGudsBITULr+XsFJXG7WOn5b2cWo8=
X-Gm-Gg: ASbGnctIMwLJ5zfBWuqz9/Qxe/KIJAYtygLTNsoTugstyscIkVCbH72VilGTuso4rBu
	2VjdKu2qx07DbPSvhly1Bi2kh6ozUMBxGd2S4CpcoQhCONRwe+QljdYJNiCMNZufsbKdnxyfyBl
	26x/yjBKgUJjTNmhoVymfQ0wxInBf97Rys3/7Fkge0NRCNqf3JlPrygd0Bmz8yqxJO4yiQLywNG
	iSN7NJYQWTH6coQD7f+KjZH6NnbBK6PZaxqig8rvQwz/wV6LEqWiVMUXl9f1SKhnV53z4M2hqQG
	xi7jWSw=
X-Google-Smtp-Source: AGHT+IGA7y0kPIv4lcDBe/6bTHHSSHeIsT4CR86PjP/yHXhvJVRneQ5HCkaklQwceTZaGwBvQ0G3HQ==
X-Received: by 2002:a05:600c:5782:b0:438:9280:61d5 with SMTP id 5b1f17b1804b1-43912d150fdmr30935075e9.5.1738865008121;
        Thu, 06 Feb 2025 10:03:28 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dbdd3856fsm2278858f8f.28.2025.02.06.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:03:27 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 06 Feb 2025 18:02:34 +0000
Subject: [PATCH v2 1/5] docs: uapi: media: Document Raspberry Pi NV12
 column format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-media-rpi-hevc-dec-v2-1-69353c8805b2@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20250206_100330_071712_23DE7783 
X-CRM114-Status: GOOD (  11.14  )
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
index b788f6933855..b5b590f234b0 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -827,6 +827,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
       - Cb\ :sub:`11`
       - Cr\ :sub:`11`
 
+V4L2_PIX_FMT_NV12MT_COL128 and V4L2_PIX_FMT_NV12MT_10_COL128
+------------------------------------------------------------
+
+``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
+``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide columns
+of Y or interleaved CbCr.
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


