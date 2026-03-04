Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E85EF8FEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5QNeVnlLBH3/bXg5RBtmhfoseGDTb1QFshJs8flMKI=; b=oX1IuBspCZXDGQvUCCHfXzSt+w
	ZXs7vrmxBKcQ9XmsoLLpOGby7tGvVZrih3S47oredr1OlyvTCEPyKMZnBc+ovTnyCr2naIC5aHIuq
	OEQvrv4AwfQbkfz0lWEA5Gb5KsaVhwiBmCRCiomzStQKK+ZryFFjGXpH0B88nIh5gWOwRikpuErxE
	qmBPhBcy/DkeMFyknD/6cCMfKjgeP/ZHeS65m+svguovQmjP0ARDs2Q7ufa2ray3hRzazoSfweCLu
	BtYOeTW+xOljj4HonvKtHngqpiaj6lLu8vUiAcshUtYM/TCGXCAv6SN9x5b6btd/txlfz0jzbkl2d
	H1tMfH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqu-0000000HJ8D-3qWx;
	Wed, 04 Mar 2026 14:05:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqp-0000000HIyd-0ygj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:05:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so78513155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 06:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772633121; x=1773237921; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K5QNeVnlLBH3/bXg5RBtmhfoseGDTb1QFshJs8flMKI=;
        b=Hske5yxe2PhhFfRsqvYEpLwvjI6uj3dVZ1CwIvGwxicxOvRmv1rNnRV+Ccyp9un0D7
         rQh80x+1NDrCQrhjfONE04jUekQyrJVhzrNhmP2xXrAF0ncZPJH1NJuYVlY5PVEgPj25
         bOk95TQIBg4KGntmHkqo/fqCMa6ZtbEcDghqRp4pJZwTwoUa/iLo2xfBJQRO5k626Xyx
         lb9Hmc3jsIM3X1laLpME+yQCQQaxmL5lx+C8h2/DrF8eQruey4uAq5poeQWJyYXy56Qt
         QSHAEkVlSVA2TxIYlcLavdR2KgprQv2NI8J6nusf/3lUP8FOxJXaAEptismJ+pNAtnsB
         8IOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633121; x=1773237921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K5QNeVnlLBH3/bXg5RBtmhfoseGDTb1QFshJs8flMKI=;
        b=XMU7LzgM/Z5r3VE3n3u6x7+NJ9xHyUp1Cmz25bs+zX2rpqKcK/Q3oeJVujAwS+uT2u
         7xxHtIwEMEI3bBzdg0J7kzQHMuXLSJdUAcxp+fBXfzqMrdiPRrZEVUyMD3FCN7YvCsGc
         cDBvc13wK/Hzrwcx+IW6cFaOSJ+E+9Pz4fP/IcgHJUTsMk2+dz5vYQLTJcjYqk0igE4v
         J9Vn66l6Z4kUAHcnxWvLkuZj+v8toKuug2Hc5q9/oQcxjqYn1zG2zjF0oMprTTRNsX81
         MHZO3eKM1sqfzdJK3laxFZnyK52Hlkf3Y7CxBW5Se2TwxsrxYNfUKlNkNUsqDRrNKGy/
         LorQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPvaXyadxR7yymUWwuZfI+O5d3y6FHXJA6RnvAY9fdGf67VW31oBYdSOd8OLlpto3iO4CJvoRjLvAXMwCPIuHC@lists.infradead.org
X-Gm-Message-State: AOJu0YzrsXlKxC4Wpc+UKBjOLEFZBdHCKckOHoE2DBpCxLEMygILBcFN
	wJ8Y9uQxHv4wAgH2RhxoIUHZG8/CFdkyXO3AUxWVBUHxqhDDcguwkkNX95WKFLQet4g=
X-Gm-Gg: ATEYQzyEYlAXHoXqZuntY4b9FTdx6m27MEzBQ4pRwy9M5mw66jwe+flLP+q75l/jHlb
	DUlJ35schp3519ZwtefTUW5xO7F6uCysAE/cGL+9ZbM9gGqp6wMj6c1SXXA3ldSytIg1gSmIA/h
	Zv1h4yj04VC1+n6w+P2l5EFKW/tljV+iEtKn0Xrd8oxDJHvaRcXzw5niEIr962UgIBHYSwlU1DB
	S01mSb7ohJ28MHtr80Q9vTyWGCEERMUW9qxRDYD955n8F/EyZfOxgI6GEN3PSOg2g3FHU/OS1aJ
	XOwGtIXzTw9wYvoUN+qU34B0uIfcwmmXUxynAMcg1zBxPwGjmJ8eN3ejqzCB+n7vxIr9uqdsBOS
	CNHXLbGYrgiv9OV1C1V9fbGgh/kk4PcvorLw7FrjFsxRqaMRLR0mm2nNDxax5LlmCyKVNeg7aIb
	Ewn98ZzjnRvolg1JUsEEsW3Eqj
X-Received: by 2002:a05:600c:37ce:b0:480:4a90:1b06 with SMTP id 5b1f17b1804b1-485198be6d5mr37123935e9.34.1772633121379;
        Wed, 04 Mar 2026 06:05:21 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-485187b6ffbsm59296165e9.2.2026.03.04.06.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:20 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 04 Mar 2026 14:05:15 +0000
Subject: [PATCH v6 2/6] docs: uapi: media: Document Raspberry Pi NV12
 column format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-media-rpi-hevc-dec-v6-2-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20260304_060523_314083_EDCEADD9 
X-CRM114-Status: GOOD (  11.77  )
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
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 0631919bd667..1aa4182b8adc 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -957,6 +957,52 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
       - Cr\ :sub:`11`
 
 
+.. _V4L2-PIX-FMT-NV12MT-COL128:
+.. _V4L2-PIX-FMT-NV12MT-10-COL128:
+
+NV12MT_COL128 and NV12MT_10_COL128
+----------------------------------
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
+
 Fully Planar YUV Formats
 ========================
 

-- 
2.34.1


