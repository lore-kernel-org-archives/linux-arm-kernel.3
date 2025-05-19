Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30364C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADgoDveomZWLZywWNcxg5ZB8pjJywh8iJXQ9gh+B290=; b=p1pPl6tvF0wXCUNPTPJxAKQPim
	sHdVZ0PQki4vfhuOrsGvBliILEGb18jZh/eZmr5FxyD3VyQXyVUPdrpfwwEDDb6CQke2yVWyzJkQ9
	GNU5/qp84ZtjYCc7umkUqTW2g3WqR7dg1vnCShpI5elksGFd4Wc1VlfuclY69cnbgvrfA0j7OBK5B
	1gn5RhzWtzbL4mMZX3aOHBj4o2CN8xqGH8J0LfI4R+6+Yu+STfT0l7NMwNqgrFBNiXw1ABv1jLwE8
	9t/E5dbFwEFk9fxcf3Y+ZUHKAkuce5+fPm5YvffkMhFYt8+0RNRx2hPkv7LUx+1BAv8rBRIMBb2yY
	m6h/aslQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29d-00000009XpA-2yYA;
	Mon, 19 May 2025 15:11:49 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1ZR-00000009SLA-0lL7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:34:27 +0000
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF97CF09;
	Mon, 19 May 2025 16:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747665240;
	bh=utBiHAOmSTDp6El5CtISj0eRdIGnsF/cnTQXCeOirV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DpNc3vceR106+tDgpzW64TspD8llUcqKtG5O0MUwkgigQAi1OnvtTRco7SpUGRXdS
	 nKJVAO92obWC9nKYtU5iQTKvqRbFpHms3ogt2PAoqcV7MDrZD6m88C/zyR35q5JWL8
	 CM3ycXLz6fu34tmyFG5Xatb4r1apFR/taRlwXeoU=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com,
	nayden.kanchev@arm.com,
	robh+dt@kernel.org,
	mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	sakari.ailus@iki.fi,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v9 02/17] media: uapi: Add 20-bit bayer formats
Date: Mon, 19 May 2025 15:33:54 +0100
Message-Id: <20250519143409.451100-3-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519143409.451100-1-dan.scally@ideasonboard.com>
References: <20250519143409.451100-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_073425_501189_15BC690E 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

The Mali-C55 requires input data be in 20-bit format, MSB aligned.
Add some new media bus format macros to represent that input format.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
Changes in v9:

	- None

Changes in v8:

	- None

Changes in v7:

	- None

Changes in v6:

	- Fixed the table formatting

Changes in v5:

	- New patch

 .../media/v4l/subdev-formats.rst              | 252 +++++++++++++++++-
 include/uapi/linux/media-bus-format.h         |   6 +-
 2 files changed, 255 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 57194180fe42..ecbe83dcc4b7 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2816,7 +2816,7 @@ organization is given as an example for the first pixel only.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-bayer:
 
@@ -2829,10 +2829,14 @@ organization is given as an example for the first pixel only.
     * - Identifier
       - Code
       -
-      - :cspan:`15` Data organization
+      - :cspan:`19` Data organization
     * -
       -
       - Bit
+      - 19
+      - 18
+      - 17
+      - 16
       - 15
       - 14
       - 13
@@ -2862,6 +2866,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -2883,6 +2891,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2904,6 +2916,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2925,6 +2941,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -2946,6 +2966,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -2967,6 +2991,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2988,6 +3016,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3009,6 +3041,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -3030,6 +3066,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3051,6 +3091,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3072,6 +3116,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3093,6 +3141,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -3114,6 +3166,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -3133,6 +3189,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3154,6 +3214,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3173,6 +3237,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -3194,6 +3262,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3213,6 +3285,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3234,6 +3310,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3253,6 +3333,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3272,6 +3356,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3293,6 +3381,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3314,6 +3406,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3335,6 +3431,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`9`
       - r\ :sub:`8`
       - r\ :sub:`7`
@@ -3354,6 +3454,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`11`
       - b\ :sub:`10`
       - b\ :sub:`9`
@@ -3375,6 +3479,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3396,6 +3504,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3417,6 +3529,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`11`
       - r\ :sub:`10`
       - r\ :sub:`9`
@@ -3436,6 +3552,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`13`
       - b\ :sub:`12`
       - b\ :sub:`11`
@@ -3457,6 +3577,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3478,6 +3602,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3499,6 +3627,10 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
       - r\ :sub:`13`
       - r\ :sub:`12`
       - r\ :sub:`11`
@@ -3518,6 +3650,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SBGGR16_1X16
       - 0x301d
       -
+      -
+      -
+      -
+      -
       - b\ :sub:`15`
       - b\ :sub:`14`
       - b\ :sub:`13`
@@ -3539,6 +3675,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGBRG16_1X16
       - 0x301e
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3560,6 +3700,10 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGRBG16_1X16
       - 0x301f
       -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3581,6 +3725,110 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SRGGB16_1X16
       - 0x3020
       -
+      -
+      -
+      -
+      -
+      - r\ :sub:`15`
+      - r\ :sub:`14`
+      - r\ :sub:`13`
+      - r\ :sub:`12`
+      - r\ :sub:`11`
+      - r\ :sub:`10`
+      - r\ :sub:`9`
+      - r\ :sub:`8`
+      - r\ :sub:`7`
+      - r\ :sub:`6`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SBGGR20-1X20:
+
+      - MEDIA_BUS_FMT_SBGGR20_1X20
+      - 0x3021
+      -
+      - b\ :sub:`19`
+      - b\ :sub:`18`
+      - b\ :sub:`17`
+      - b\ :sub:`16`
+      - b\ :sub:`15`
+      - b\ :sub:`14`
+      - b\ :sub:`13`
+      - b\ :sub:`12`
+      - b\ :sub:`11`
+      - b\ :sub:`10`
+      - b\ :sub:`9`
+      - b\ :sub:`8`
+      - b\ :sub:`7`
+      - b\ :sub:`6`
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SGBRG20-1X20:
+
+      - MEDIA_BUS_FMT_SGBRG20_1X20
+      - 0x3022
+      -
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SGRBG20-1X20:
+
+      - MEDIA_BUS_FMT_SGRBG20_1X20
+      - 0x3023
+      -
+      - g\ :sub:`19`
+      - g\ :sub:`18`
+      - g\ :sub:`17`
+      - g\ :sub:`16`
+      - g\ :sub:`15`
+      - g\ :sub:`14`
+      - g\ :sub:`13`
+      - g\ :sub:`12`
+      - g\ :sub:`11`
+      - g\ :sub:`10`
+      - g\ :sub:`9`
+      - g\ :sub:`8`
+      - g\ :sub:`7`
+      - g\ :sub:`6`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-SRGGB20-1X20:
+
+      - MEDIA_BUS_FMT_SRGGB20_1X20
+      - 0x3024
+      -
+      - r\ :sub:`19`
+      - r\ :sub:`18`
+      - r\ :sub:`17`
+      - r\ :sub:`16`
       - r\ :sub:`15`
       - r\ :sub:`14`
       - r\ :sub:`13`
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 62ad82fd285a..6005f033e62c 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -124,7 +124,7 @@
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
 
-/* Bayer - next is	0x3021 */
+/* Bayer - next is	0x3025 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
 #define MEDIA_BUS_FMT_SGBRG8_1X8		0x3013
 #define MEDIA_BUS_FMT_SGRBG8_1X8		0x3002
@@ -157,6 +157,10 @@
 #define MEDIA_BUS_FMT_SGBRG16_1X16		0x301e
 #define MEDIA_BUS_FMT_SGRBG16_1X16		0x301f
 #define MEDIA_BUS_FMT_SRGGB16_1X16		0x3020
+#define MEDIA_BUS_FMT_SBGGR20_1X20		0x3021
+#define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
+#define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
+#define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
 
 /* JPEG compressed formats - next is	0x4002 */
 #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
-- 
2.34.1


