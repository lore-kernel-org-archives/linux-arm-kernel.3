Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125EAFEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ljANxlu8ndrw3XskAAbixI7/YE21Bcmq1KmY/q5I1k=; b=1auXnmXfU2UTqDNBLJJIq0AoFz
	q+sGDvrUxy0D2M3YuO43h7X37DxOLIi9HpeALphOZRXLWFLNh7JGCEtdqshU/jQTKqOMt+P8c9AeM
	xeR/3obS9RVF1QgtBZUhti4kHAWGlFV06HUL0vs0GD3vGzVWvA8FDHawgg+fax1si3c/Wav0QZRE8
	+N6H4GQe4LB4Fb/W6WA41tD6gIvQp9jAIoOcQJyjNBszn6TcI4TOKSaMEjd3xFaH4nYB1qSUTgV5p
	B+QBTdc8pvm0Bgq0u+X79ESNAlFcki0eFdQE35cJEw8wOZF4W7eFBjzo73lYMmE9VnbUqkPGNchg9
	vnWv7wmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1WJ-00000008nNM-06FP;
	Fri, 27 Feb 2026 17:20:55 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1WA-00000008nGm-0JRZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:20:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-483770e0b25so20452935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772212844; x=1772817644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ljANxlu8ndrw3XskAAbixI7/YE21Bcmq1KmY/q5I1k=;
        b=s6laEg6S077tIxx5RQkJmmMoeI/4wNMvXdZE9VqbjE2tsYrSAkt4MZGluaNH1gF8yX
         5HoUWaFDfM8xJTAmG1bem5as15d62jzQ5OZeu/FKU8SlP0jp0Xxozc7F9I08c4MeKZ+a
         c8EXScS18Y6Arrg7IFiHDjbs47txfKTwA4Ba+b0LroQPbDuwL/rznQszDC6UmeQ5Y+XE
         8ajgiyBz+oxFV1VmlSwDcvzfvOunkyXBi9KcdiU5JqkZRlKWXTTPV0OvNKFBsoJmAoHZ
         l+GW3prNcXaVOoKWEEtykMDRQzgkZm8G0oIrXdty4Ug3RSFpe39nKiwq1yUUxep5AXSz
         sVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212844; x=1772817644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ljANxlu8ndrw3XskAAbixI7/YE21Bcmq1KmY/q5I1k=;
        b=NKb0qQj0t2t7Zkm1tkgzL1sGo/1tUL6ZxfmKTEyQMSw52JdxsWY0EX485hp6GaxqH0
         TWe2rh4Ffp8i07A9jHiW8Z83DTWCpt0GRV+wbGJ2UXCAcO0K11nyVhGg+L1Ml8dMhsVg
         9xajTBDQOZvda1+VDOju3rHitltMTaPW6QJjebatC+zj4XQRsCThv1lEv8heNPwBF3J3
         xmYjjKNXtviwCQkH71lSQrKO2wJwBgh8qyrFEj2hld6pSXXe1LYRFhx1/vsIL4kQMxKw
         spGJc+mpIt6Q0VR6F//RVIwJ9EFSkIOPYRoldhjtY+XWlX9MnO5egjfZuuiVumXgX/pK
         55fA==
X-Forwarded-Encrypted: i=1; AJvYcCUaf+nmmSLYmrigZhxDHL7au0NYNJd/6zeRO3emT2neZuls5jwzqHsYuenpNUxuN3/jfB4tEv2YNDdb7A9LE+BM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4iufb8h2YuB79nuwcWK+D8QLPKdU4OybQGtxRmdaRq7Vs75sn
	1WuLCiiDvLoJ3BuOUW9F1qZBgNw027KWi5ivPhr+nfwZOb5lGjblrpUXyRZszd3avMs=
X-Gm-Gg: ATEYQzwxJiwpKeZKEbQiojhJrbLdYS/DojR4Q9qneg422oNUD5/69gRlpYumppwZTIP
	BKEm10fMNAGj//9Yjs5uoVjKxGVwS/c/XEeOPEMG8ot9vvDcwzoLg+jP+JgLXf9M/n1FJ3Q3VsW
	74g6QTxa2MFyAsJ4Aq/2wrGmsDdrhSxdXUUFuacgJNmpaJMT4Knq6WtgNSnfQl2g8B3gqJDWk1r
	rwXbjzPAiikNxICJ+PMB9XWZ70xvCmmToeKea0OaZPocPeHfVNL72wGZ2v4S5mfQFhSvOfhyd3C
	COqpfcY2ObqDamGVf0wCFUuR9FLnfyzTXfMBXzC/R8aVv67dNaN8c26DnvInXPxPFXzWhAq3i9L
	RY9g8WNDZG6aFVffpIxvH9kaJoEuqgXJADOmTXLl6ptA98q9uTNgpwnTP+yeOXj9JsNbjoRnv1b
	KQtCItyvWoeUIX0Q==
X-Received: by 2002:a05:600c:630d:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-483c9bdb68emr61023005e9.13.1772212844085;
        Fri, 27 Feb 2026 09:20:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfeb932bsm60828075e9.28.2026.02.27.09.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:20:43 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 27 Feb 2026 17:19:07 +0000
Subject: [PATCH v5 2/6] docs: uapi: media: Document Raspberry Pi NV12
 column format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-media-rpi-hevc-dec-v5-2-9bb3fc1816de@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20260227_092046_145722_92E44879 
X-CRM114-Status: GOOD (  11.16  )
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
index 0631919bd667..1e7146230f09 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -956,6 +956,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
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


