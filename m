Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CA5CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tulMT4eR9G2pK3+NvoTz2q9bRPSj5YZkL5Rxs9IM84A=; b=wDq6c1F/2Cl6naQzXewqogPar+
	FKIzqwRR0wFyFZbFxFKM4SB5h9J2uIXWdrKG1sZeIj7DukZtkWIY9Y4wIFxWbQgoa5vU/XxW7LVLZ
	OF2Cixc3dASWxv06fM4eKhZvfOtbARfLl8jxGP06KFU182jjCp9LrCAeoWAeDo+hun+AmufUvr7p3
	3i59HNEN17eDP1Lhw1K0mSMMin/18mP5mDVG7wB0BLICnjhsGdl4Qayxg5T0k8yEPSukG4FO+ixFj
	kHKRlr4sddfmSgkIAojAmlCHQzrKYOHh8tOaKXWognUSq/dDGU1GZ8cefysjuhlSdZiGatJdhuSoT
	xyhDP3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlCf-0000000CMGl-3onD;
	Mon, 20 Oct 2025 08:25:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlCV-0000000CM25-0BDc;
	Mon, 20 Oct 2025 08:25:08 +0000
Received: from [192.168.1.102] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F8001116;
	Mon, 20 Oct 2025 10:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760948603;
	bh=aphqrnjnIHEaL1McVyPsfsz1ESyLlGYYkbJKH8NlHMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z+Fc3I3kwwM42ZJWD1OKt3Rcuuawr4d2kcM1vAoJfi35Qq4959AiJVgxr1XH+gG7d
	 s4SVp5poG+AZXZyizdsbvZLRLQzEbZakvE98xyC0yTtnzujJOtb/hYI18Dx1WOnJ1k
	 CljDBws2gl4v8LfVnlWUpnhM9PRt1oUIM63gi4D8=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 20 Oct 2025 10:24:54 +0200
Subject: [PATCH v8 8/8] media: Documentation: kapi: Add v4l2 generic ISP
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-extensible-parameters-validation-v8-8-afba4ba7b42d@ideasonboard.com>
References: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
In-Reply-To: <20251020-extensible-parameters-validation-v8-0-afba4ba7b42d@ideasonboard.com>
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Antoine Bouyer <antoine.bouyer@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4112;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=aphqrnjnIHEaL1McVyPsfsz1ESyLlGYYkbJKH8NlHMg=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo9fHYLuapdMSCrbxyTfvkamWN3atlzp6On/gWa
 Ullsu6bJlWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaPXx2AAKCRByNAaPFqFW
 PMebD/40IT9AUTtqWZ1ILnE5CPIbzJn7CE5LICF8T/arumBlmCly/EBuhRr2Cc5lMTkqPq8BIR3
 JzCsZmxP9yTspZctBCJ+ZvHC3GSur4e2GXJgJQa2DW98j6MJpx20A1q6Lb1+/hWag4G+xk1/PH+
 yJfj/eZ3MOQStCijZOadI+l5jrUa70H3dzY2UCiB7FFog2/YMYFclF3LBe41lNNPt8qot0Trc65
 bpmu56bfff00/AwdmoWkahb34YVztUxsuFkwnAUVqNlUGGy3DnTlWsRwTYdlGyUax3mbnWKJE0I
 7TfqzvONQ+0SZmHpu8vQTIa65cjA6WgyuhnhMnnOGaei4mHelvbAjJi+IuUrZXgyvwbJ3tKY66E
 jIf/eDzd+LiDltTTWTc68j5mHybg0USzv9dObAvWpxJ+gEloSVhxD6upum5sVSGFhRsLATswqnA
 1FdGI18PiuzQ0rCcuQbrdcwA9IxAzbzhEHQ6fqpd9F1aWZOQklr7rGssEDY+GVNuotQztE9SlsG
 YJ59FjfbRShIG2PZKk6w1JE0y3VhsCj29fSwxeu3efR95MAp1iQdL7AscBI0yeoCHnBR+4cbWNu
 XK0E6QC7MbsXwrLJpyLsknPdH8dDGKO5a9V2JdICIWdOED3hRTT1SBKiAXrDKplYNL6QsPWJWVe
 imETzVRPh5GckEA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_012507_292203_104821CD 
X-CRM114-Status: GOOD (  16.38  )
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
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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
index 0000000000000000000000000000000000000000..150ba39b257b23e6a8ca1a348047f5b55588fbf7
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
+Each ISP driver defines its own metadata output format for parameters and
+a metadata capture format for statistics. The buffer layout is realized by a
+set of C structures that reflects the registers layout. The number and types
+of C structures is fixed by the format definition and becomes part of the Linux
+kernel uAPI/uABI interface.
+
+Because of the hard requirement of backward compatibility when extending the
+user API/ABI interface, modifying an ISP driver capture or output metadata
+format after it has been accepted by mainline is very hard if not impossible.
+
+It generally happens, in fact, that after the first accepted revision of an ISP
+driver the buffers layout need to be modified, either to support new hardware
+blocks, to fix bugs or to support different revisions of the hardware.
+
+Each of these situations would require defining a new metadata format, making it
+really hard to maintain and extend drivers and requiring userspace to use
+the correct format depending on the kernel revision in use.
+
+V4L2 ISP configuration parameters
+=================================
+
+For these reasons, Video4Linux2 defines generic types for ISP configuration
+parameters and statistics. Drivers are still expected to define their own
+formats for their metadata output and capture nodes, but the buffers layout can
+be defined using the extensible and versioned types defined by
+include/uapi/linux/media/v4l2-isp.h.
+
+Drivers are expected to provide the definitions of their supported ISP blocks,
+the control flags and the expected maximum size of a buffer.
+
+For driver developers a set of helper functions to assist them with validation
+of the buffer received from userspace is available in
+drivers/media/v4l2-core/v4l2-isp.c
+
+V4L2 ISP support driver documentation
+=====================================
+.. kernel-doc:: include/media/v4l2-isp.h
diff --git a/MAINTAINERS b/MAINTAINERS
index 5833f82caa7f2f734bb0e1be144ade2109b23988..cd1137c7754538d02bd72521fec6c89e082246d2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26856,6 +26856,7 @@ V4L2 GENERIC ISP PARAMETERS AND STATISTIC FORMATS
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/driver-api/media/v4l2-isp.rst
 F:	Documentation/userspace-api/media/v4l/v4l2-isp.rst
 F:	drivers/media/v4l2-core/v4l2-isp.c
 F:	include/media/v4l2-isp.h

-- 
2.51.0


