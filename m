Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6D0CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 17:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUFmbTCcnlef7aCBW8VKyx17WQn5QvziJ3dxdWzNUYQ=; b=pUQNDxOJfyPM+sVU2kjbKuufvH
	hyQUnGzBm75P3zPdhJFNGsg7GoTJ9Jtv7TWhPN2vMkspgUJhXCUopqt+sawZbMK5U1QAj/e9RGUDu
	OxMIXDICwErBnj0ZBBkQwQ9UBju9wj4YolATKQtLNuSJZg4pmYNWVcQNTJlZ4NnErFsZ12O57Q6Pb
	Xunaq5enjc+FYYHXuVsdzE4neLdbNREgKjy/19TSV7rGgKG++FjiD/IBdInm0tLeLQ3hjKWI3D17Y
	IgcowDVYVLpi1dbHVrd5GDEqYz+BKyPqS9pz20VwY03gs3N+gnpRyj98vPtNS54RO8lFZOR8hLNXF
	z/ggzn4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCr0-00000005FpW-44mP;
	Mon, 15 Sep 2025 17:19:02 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCqk-00000005FVC-30nA;
	Mon, 15 Sep 2025 17:18:48 +0000
Received: from [192.168.0.172] (mob-5-90-56-182.net.vodafone.it [5.90.56.182])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAF191189;
	Mon, 15 Sep 2025 19:17:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757956647;
	bh=j9hWvCqelAGNvfHC+N6jQ1AbbIgP+Hu8HDlRfTcW5dU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MbD9+nQiI/UnoiPXoe7w1d82vS1VSty3VjlYeCKIP2pU11BimGoWAYfTbPQidJCPy
	 3jLhokZ4ZJluH5OBHsQl09t9HBED4jkrO7pRZSNF+TZs5Ck1qwCq2ZpUkyz4p0hYri
	 86DgX/gic9waEptrV5FrNjngBq9W6Gmfxgz8cy4s=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 15 Sep 2025 19:18:17 +0200
Subject: [PATCH v5 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-extensible-parameters-validation-v5-8-e6db94468af3@ideasonboard.com>
References: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
In-Reply-To: <20250915-extensible-parameters-validation-v5-0-e6db94468af3@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3476;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=j9hWvCqelAGNvfHC+N6jQ1AbbIgP+Hu8HDlRfTcW5dU=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoyEpqg+bIyroqcxI6unLoLO/6bMW1RVPjAUdT1
 AClTMvpjHuJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaMhKagAKCRByNAaPFqFW
 PFEGD/9eZDpRaBL6tw+rDnhW4TmAaTMX788ap9B0/aPqgNRwhcNVtWLL08+dsEkW9pd5zEPEX8t
 E69I7kr3zHBN38fXyQFaNDatM2fHPh/G5tXVN1S1U1Xtp/3Aqg4NAR6I2VC/SlH5RJLjAz0htym
 dhC2VRjluLgVHIZe0Zwe3sj+5k5opgKzKTaUyEsCHEvhEyI0N4NssRtUbcXTXvvOQxTo1buOCVY
 WAntNNPSQPq6xX6etwjK5BYAI1L39EWAzzIQeYews1F+nN7oZ4umF9Ew5/Oi2dR7hSkYUHsyuEl
 ee4IiZRvd1lpUjli1EFqgn8yufg8uhPWvICWS5NrLyVYTEBRQ/aM1KqiGFTazHEAizANJd9XkBb
 b7jTZPgRdN7szXo3VJRqxUq8Ni5F4YCbFA95dBoc3ANsteuWrq0zeUzMTQLSz6LomNl3eGoRNGl
 t6dj5GyYMnLhBVNfNiGPPHfDcUf2wQjQZR9s2mTKCoNbih5jdeatxC6pYJP/2rMF72kiq+Ei5wt
 MIL9vZU2/Fd4G9ndWjtEIggnx3lOUZGO25UB3LG9KAt6bwImZpNrTCG9fTg9OZTzpVWr21+BfZf
 VwWabnY1f7yLtWFR1LTnJ+ngiHRrRl9c9fq+sc/VGiHCnvhjuRFiuQPZ9w/oSthh9ZqOwAbh6JQ
 4PENvP4KH1yGaSA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_101846_903923_F3613067 
X-CRM114-Status: GOOD (  14.94  )
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

Add to the driver-api documentation the v4l2-isp.h types and
helpers documentation.

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 Documentation/driver-api/media/v4l2-core.rst |  1 +
 Documentation/driver-api/media/v4l2-isp.rst  | 37 ++++++++++++++++++++++++++++
 MAINTAINERS                                  |  1 +
 3 files changed, 39 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index ad987c34ad2a8460bb95e97adc4d850d624e0b81..a5f5102c64cca57b57b54ab95882b26286fb27de 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -27,3 +27,4 @@ Video4Linux devices
     v4l2-common
     v4l2-tveeprom
     v4l2-jpeg
+    v4l2-isp
diff --git a/Documentation/driver-api/media/v4l2-isp.rst b/Documentation/driver-api/media/v4l2-isp.rst
new file mode 100644
index 0000000000000000000000000000000000000000..d778aa799347bfd0a95bd6887dd944ddad0fe4d1
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-isp.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 generic ISP parameters and statistics support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+ISP configuration parameters and statistics are processed and collected by
+drivers and exchanged with userspace through data types that usually
+reflect the ISP peripheral registers layout.
+
+Each ISP driver defines its own metadata format for parameters and statistics,
+and exposing the registers layout in the format definition, part of the Linux
+kernel uAPI/uABI interface, makes it really hard, if not impossible, to extend
+the format in a backward compatible way to support new hardware blocks or
+different revisions of the same peripheral IP.
+
+For these reasons Video4Linux2 defines generic types for ISP configuration
+parameters and statistics with a set of associated helpers to support drivers
+and users using generic types.
+
+Generic ISP configuration parameters
+====================================
+
+Drivers can use the generic and extensible configuration parameters format by
+re-using the types defined in the include/uapi/linux/media/v4l2-isp.h uAPI
+header file.
+
+The uAPI header defines generic types which the driver is expected to re-use and
+provide definitions for the types of supported ISP blocks, their control
+flags and the expected maximum size of a buffer of parameters.
+
+When a driver receives a buffer of parameters from userspace it shall validate
+it by using the helper functions and types available in include/media/v4l2-isp.h
+before accessing the buffer to apply the parameters to the hardware registers.
+
+Generic ISP support driver documentation
+========================================
+.. kernel-doc:: include/media/v4l2-isp.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 5e0e4208ebe6c58a9ea0834e1ebb36abd2de06e1..b0c5e6c2b21a5d5ebc63d2ae8b5c1b68fa912b33 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26414,6 +26414,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-isp.rst
 F:	Documentation/userspace-api/media/v4l/extensible-parameters.rst
 F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h

-- 
2.51.0


