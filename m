Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6888E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8tvjSHvBnYEUrXXehqqoug7u5Rbl1jMwLkYtbBCoO8=; b=s102/YLTGKa5vUviY7V8I8LNKN
	9K151M1vFSNi0DF7TiQL7QO53LxXtmwG1JN+8JX8ePt17+cBXPyiNq8ilJYIgKG3Od7h0d/XcMteL
	AY223fffcZAc+cPAaQ4nAY8YdfSIdCFMYpWMcaW9WOGkIhMip2Dy2DV+0X8H91Kks7bPc7SwIjM8L
	lpiJ6WtYAPjjCxRZrPWvtK3OPd2u2Nq3WBFSgNw5t8v+pOn08/jQhAGtJa2SJUZ/FOiZSeIJ9dIXy
	u9ut7LIusIU73tTjyMpqlqck8ZVhE93IF0X7wUDVxuCzr1NBALXUsIm+uPDRLZK8FeAYLNwxN68pZ
	xXh9XjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgkn-00000005dB9-0mKM;
	Fri, 20 Dec 2024 17:25:33 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfkw-00000005Rpp-3YQX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:21:40 +0000
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283d48so15694625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 08:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734711696; x=1735316496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8tvjSHvBnYEUrXXehqqoug7u5Rbl1jMwLkYtbBCoO8=;
        b=iUeLCVgAQlfC6li7RHEMzKoKu1uUPibSDKYbdRg06VlCTZsgYvLFuEIqCOP8qOCgF/
         LjN+vhNYYi332DK+KGsa0lK+HKZvSgcjCZMQ6r+PMsrMpH/U8bZwmx9LyhW85dPlLlZJ
         oiONtME/l8t247jHZ+Nr3HcKV0V/H5fxo4jyP6v2eNwZq70soOBPmKF4WiUewBEFZ3NI
         4sQB5xO9Z+Q6jc78S1fi4VwN80tDP+8w1Fq0bvqnTsgytRLJDfhj8Ok79BK8IDXPhHSd
         hU9U4bnAa2UNe1xK5F4shRkLp67TSeBv1EsP3/EtOsOLOnJ6lu54YFLkAXu7viXqKby/
         Uwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734711696; x=1735316496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8tvjSHvBnYEUrXXehqqoug7u5Rbl1jMwLkYtbBCoO8=;
        b=sPZ8Rfs3Fu245eZvooWm39I+f2fwtyGnZ0tw9xPtL+IOdPHtLMaJFb71V5nWeIOu+G
         4/sTdgZxxnsudbV/w7qBhO/PE7kRRkTAAYqRze0BpRYU1F9pPCtxG7z+j2+SKUwciUga
         vmVvnhHfSjFHyS7YQloucvyLyJxeyIwGQ2gbVpuI+gJND3VNlvQ0Zh01s0wsvPi0GVbp
         EPtk6MSzOAUcBtMD4WNpEGWCIKAfuSAB2x1pvV9FRoF3oWszLLweC8RhQpWzHJAzvYlp
         fS1icG1j/KrzmIpUheSm/E5W0htzZFJQ/T6KveLxDEvdNaxBFZsbLsmXawGTMQeXgE+6
         IbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPoiGTTKfYbxlx+Jqcw/+xYzuHboGD/gGu0J39IvqexwdF42/6wpedD/jK68J7M4Xu1nF5kwLMF1I4hliKSbVe@lists.infradead.org
X-Gm-Message-State: AOJu0YxqQR0Y5OG3aSsIDb49tNv6FhKNhR22InuXN3cbZrt783SvfbYM
	jCmVHdaW0HDPwHoObrMka6WtoeUbSJJuy0z8oKRBbCo1E95JdagkLUGFPNyjTGo=
X-Gm-Gg: ASbGnctDGriAkBuLHcuFueFxz2w6edbHdIKfCwyEWJ9v1CzLHvrS77ix9dihMQ/CxPN
	I3/znCeOD1ImeesFtfy7/S9H1ba5BK+iDRRsMr7wU+SxwxlidoJhr/CgefoL66BZZIGMaSbgkRz
	Of3EIVOGxxn+ACw4trtayoBFEltFGKmgZQBTLfdRF9HXehB47w8Q8yBvx3o5dmWUrJb6kgAoA57
	R9bS7SXGTUwhkqb781LNbRCpNvmivYUXAd0Kav39y4E3VvE
X-Google-Smtp-Source: AGHT+IEVPW76VkTXU2nIJfPsd/7W6ZLfDVF9Rnt4kJTE9CYOpNt7uO369Z3pkgOqLTDRQ8mK233MkA==
X-Received: by 2002:a05:600c:1ca7:b0:434:fe3c:c67c with SMTP id 5b1f17b1804b1-43668b5e201mr28263535e9.26.1734711696100;
        Fri, 20 Dec 2024 08:21:36 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm82824045e9.12.2024.12.20.08.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:21:35 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 20 Dec 2024 16:21:13 +0000
Subject: [PATCH 2/7] docs: uapi: media: Document Raspberry Pi NV12 column
 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-media-rpi-hevc-dec-v1-2-0ebcc04ed42e@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241220_082138_969403_9E567108 
X-CRM114-Status: GOOD (  10.24  )
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
index b788f6933855..90414491d7b5 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -827,6 +827,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
       - Cb\ :sub:`11`
       - Cr\ :sub:`11`
 
+NV12MT_COL128 and NV12MT_10_COL128
+----------------------------------
+
+``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
+``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide columns
+of Y or interleaved CbCr.
+
+NV12MT_10_COL128 expands that as a 10 bit format where 3 10 bit values are
+packed into a 32bit word. A 128 byte wide column therefore holds 96 samples
+(either Y or interleaved CrCb). That effectively makes it 6 values in a 64 bit
+word for the CbCr plane, as the values always go in pairs.
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


