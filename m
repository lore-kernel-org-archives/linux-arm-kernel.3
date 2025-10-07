Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92DB9CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 18:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWcDDKSbdFr8Tadv0m1RbJYwcoLwuqTRbvyb4LFQ1m8=; b=gSFAsOilOMNX9JjXG5AwEFnt4g
	mtD0T3/d0OP2zdOU8uVkGU5op5gMvypFS8IumEGWhHd4nyrZt8gcomJpQ12rYL6C/mxR3aG5SyaEC
	WLlFZrkuzfXo3to1CfkzKnswFOgQns3zF4IayMzSyPizNfNnLaf52ltyLNdCFnIfi10nziBh7TNE0
	AXvllYB0D6i5kq18BfFOjiSyVV0wvC0vQtwiuxqsayeJznMlGHpVGtEkZSRxV7G18RbSpHg+3NHFB
	7gdOcXYQXLlHIXeUn9OOwTKXsXzNqkPJK+3puxBZ8wEG07vs5cSLuFAohZqn51P/HhZUgBGyXEUYP
	clq+UfJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CB2-00000002YCw-3e7n;
	Tue, 07 Oct 2025 18:12:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6CAu-00000002Xvu-0hkE;
	Tue, 07 Oct 2025 18:12:37 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2FD11176E;
	Tue,  7 Oct 2025 20:10:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759860658;
	bh=fRNAq+7Vwl4fQf6vUPlq/4N8C9MKRnK183sb4wt4bYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SnzNFG4YPniiEOt0x1ZOG/nQenfRyoxwc3wvuk96Q25nSXihj1g/y/pVkIRDObXWv
	 6tCQ/nPy9R+7D5hXnR2XWzoYsoiej4vpPs4880lsEFutWATUQyNR2KkJ0bzqd97NCQ
	 D9+shzw1qHdjddq4KFJgjGmARFuksQkcSu2ZfkQU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 07 Oct 2025 20:12:17 +0200
Subject: [PATCH v6 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-extensible-parameters-validation-v6-8-5f719d9f39e5@ideasonboard.com>
References: <20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com>
In-Reply-To: <20251007-extensible-parameters-validation-v6-0-5f719d9f39e5@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4037;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=fRNAq+7Vwl4fQf6vUPlq/4N8C9MKRnK183sb4wt4bYA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo5VgI0xwJGet2PlIF1bFPXELitwqxSqG/wm5Hq
 ap8bvh9LpiJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaOVYCAAKCRByNAaPFqFW
 PMrHD/9urGh/V7FTx039JFkbeV+uzEENfmfp1T/iAziV4l0Od0YI3HoiqZb1lcoFIaITXiVNAAr
 I8NoecyNdI7D5zoX2NtS7oP25sA1N9Y90BMmxq9bxUwthJLkK9wET4fmA92G6EEQQ5v4MXoZ0UB
 j/dArouVAkAn7bS2mYNhJObclv4FnyxXzizJea+baEQ6ZFy0oOCdYjwn8IUdvac/+APINGM5QYG
 sqlxAfQS0wotcywyxoHn+N/v2Qsy+hQK1jrHhUgYoafjk+B2xBJEfpD8S7g0aa+gRav0O5iXJU6
 erNEt1gROljj6O03TznmHMxez0820oy3Gi5igjOAVf0b68jFLoLqMMqfptjuZLZkDzksJiZ7Xv0
 4tt9X32gijv5T26PBj6blkSDIXjAPDxi8FgNZLJr+8uKZ51uw/A0KuKEYHj4GmRje7hmiU+0SOB
 BqCLGwrPOhBTxgVU1xysmK1K4TP4VuNwk9JURCzx2d4dYirKHg2DDfLeKFBZHDdzUJEyVOJDUKA
 oRCW5j1bGBFt7d6j7WLhiCkb7ybVYUpOYSP9YCfF5Spy2Ki1YBS1t5V3lL9L/Jsc/qQD7S3KpmQ
 koKdjSiSun4YfuLHjf2QHzRvU0CGUDDbLuq5MAquOMETr8jdBBJB7JzmD1j39n/+wMudjkb6ZVa
 tC1NXOXKr338zSg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_111236_370183_5A998337 
X-CRM114-Status: GOOD (  16.67  )
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
 Documentation/driver-api/media/v4l2-isp.rst  | 49 ++++++++++++++++++++++++++++
 MAINTAINERS                                  |  1 +
 3 files changed, 51 insertions(+)

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
index 0000000000000000000000000000000000000000..42c2550602979609e92a09e3cd1fe3dcbafd6416
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-isp.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 generic ISP parameters and statistics support
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+Design rationale
+================
+
+ISP configuration parameters and statistics are processed and collected by
+drivers and exchanged with userspace through data types that usually
+reflect the ISP peripheral registers layout.
+
+Each ISP driver defines its own metadata capture format for parameters and
+a metadata output format for statistics. The buffer layout is realized by a
+set of C structures that reflects the registers layout. The number and types
+of C structures is fixed by the format definition and becomes part of the Linux
+kernel uAPI/uABI interface.
+
+Because of the hard requirement of backward compatibility when extending the
+user API/ABI interface, modifying an ISP driver capture or output metadata
+format after it has been accepted by mainline is very hard if not impossible.
+
+It generally happens, in facts, that after the first accepted revision of an
+ISP driver the buffer layout need to be modified, either to support new hardware
+blocks, fix bugs found later on or support different revisions of the same IP.
+
+Each of these situation would require defining a new metadata format, making it
+really hard to maintain and extend drivers and requiring userspace to use a
+the correct format depending on the kernel revision in use.
+
+V4L2 ISP configuration parameters
+=================================
+
+For these reasons, Video4Linux2 defines generic types for ISP configuration
+parameters and statistics. Drivers are still expected to define their own
+formats for their metadata output and capture nodes, but the buffer layout can
+be defined using the extensible and versioned types defined by
+include/uapi/linux/media/v4l2-isp.h.
+
+Drivers are expected to provide the definitions of their supported ISP blocks,
+the control flags and the expected maximum size of a buffer.
+
+For driver developers a set of helper functions to assist them with validation
+of the buffer received from userspace is available in the form of helper
+functions in drivers/media/v4l2-core/v4l2-isp.c
+
+V4L2 ISP support driver documentation
+=====================================
+.. kernel-doc:: include/media/v4l2-isp.h
diff --git a/MAINTAINERS b/MAINTAINERS
index ce57cf3774f6270bfaeffcea8fa63bcbd0a90dbd..ea3ef6544b44df404edcf7926a2802d63f0a40de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26414,6 +26414,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-isp.rst
 F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
 F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h

-- 
2.51.0


