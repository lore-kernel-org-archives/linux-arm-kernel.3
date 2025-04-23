Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25B0C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=; b=NmDe7Bs62UylGFUO/RoX7tVTFC
	7aoF7qnfBUqDUX/RvxbheL21F9I2LonHviVsdhyzq9xuwa2hc6dx9Bet+PVj0nu7E3EWn/p/IkpJn
	unQAq3j3TZlUra7625r+l7hfWXoREd40HUlWyH7+pAvQsDjLIrJSAja8Iwnc6yBMvURaqkis8U2y0
	2TZswuERRZZ3t7G9qpx0fdVM43JitNFdbsCi4J9kd4LEMbi/zbdSWVaEJ16zNp4bHqV3rqK+cYfKj
	GvRKlnlIJQuiU+4OpgAuh28SEUZDtHkLPosL1+N0PkXCk8FSDzD2Wu+pXdDysZQQJWu27ogc6nmZS
	b3PWoiDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fKa-0000000BgFl-0UMY;
	Wed, 23 Apr 2025 19:00:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dm3-0000000BFWa-3rkJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:20:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso963575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428838; x=1746033638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=;
        b=n9ixx/xFa+KoYKhxgIcld234FHREwSpzAdY4De+oH8XVbXuajZcijZyr39WZZ6YCWa
         PsETlV1TGSNRGKiXQ9pAVMGuwXWHsEjysnYInkiNBfUyYkI91q7/FKB6XpHjj90Q2m2+
         Qims0wZ7dsZkDDEy90rhA5TlMG5awsXJxtC5EOvHh3p6186J7grTghwkrXFd5l2pMM1y
         hHwW5y6wPiIz8xIBAuU24sO64CqGQbkUIv6w8bbuLD1tMSGVzpC6AJ/HHfuJxYaUf2bw
         mvLKvzC2iBZF9wvRhU9o9O+6lJH/BI3ASpfUU+HjVuNtVjSH/+1x0JSgfqKzgnnKwIFm
         pqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428838; x=1746033638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=;
        b=mC0HQwOhd0hwHXXt3kVCNfKvGoRQ9dB9RFUHBkHBUVNuvFj2gkudljUSwvIiyFjQb8
         lmJmxv790iFb+D0X5hZo/z785m3Y3mHdzKWH6pIloNeDK802vkw2i9sZOj92pBiJGDiK
         qXrJQxokpB02dQYAVOIXjBSCcGFie/jdk19SLu1C3GKsqLp+CUoQi0zXw0DgHKtDR+6r
         DgO9kGBXjK6iP0Ai1Y2RfMCwrrj8evs5rsInmbFBy4U4Q96ZP3Mt+IXngCeQwI2KqcOA
         pqHmpfOnzhLEYr+/t7oVdRn+Kwks09IH28kONB+EH3NfrcSphZXTjp2Cndf86y8qD2MW
         szEg==
X-Forwarded-Encrypted: i=1; AJvYcCXawnyzjAi8IbO1V1v/EgoTg6aO2JPRlTHaM/gyprwYtsDh+rF/xM47iqviU/n1aLF+6q52YnNEe1hSVKgeIUBh@lists.infradead.org
X-Gm-Message-State: AOJu0YwnAJjacKmNGJAfl4Kiu+HBjM0i/NxQEj+j+ouWkqCHTX4buaUB
	/ICHBABgggFtxkHl2z+VojefGltmsPD6YV2x0P4+gtyHs6YLXSKpQIXXDXnbdS0=
X-Gm-Gg: ASbGnctYsQp0fTOgyCitBqqcYgkIVJKK7C7V8we/kz04Z6T0ONKdfxuXXV4X1Jip4Ka
	AlElfyRUHblAgRw+71EbaHXsb0i/9Lqmue7DnsA54+Db7uG+ODsoS48wxXt2O9p5ZakqyM3ekvi
	gMNiteIFgmZO3M8L8wRIZ9mn+hVMkKXQ+Ae2YU9OyDch51tdBk70OTO2yazOe+lspK0bLPGzKi0
	I1+KDNL+KGvZZiKksumretmMWzEwIQOapPEEDjFmQeNt/GkZ1yCg99EFsN+hFVTjw5iFqNHtvpX
	o8iFtJzpa70GCtcLeOBxGLftcTyRo0cF
X-Google-Smtp-Source: AGHT+IFF1u6bufdbWvx/7orMXvGpO3G+M0zO/iTcUIR8n1s+97nA5E2rJNbe44Zk4+MMT8SNyCMZ4w==
X-Received: by 2002:a05:600c:1f13:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-4406abf992amr161169035e9.22.1745428838219;
        Wed, 23 Apr 2025 10:20:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:37 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:18 +0100
Subject: [PATCH v3 1/5] docs: uapi: media: Document Raspberry Pi NV12
 column format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-1-8fd3fad1d6fb@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20250423_102039_988135_FD4961A1 
X-CRM114-Status: GOOD (  11.04  )
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


