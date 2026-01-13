Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF3BD29DEF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1rCNVreG0UyXljVK3rQehug4oMd66r6li+Ie6ZwTCU=; b=ZusJBxOjbS98xhp+lOPiOZ4AKV
	GDAzkPfUf8MplY+hK2QO0yRwdRv1KMazjYD1vix8TcG31xF42BkRn364VP+T44hP1UYFmWvTi35JQ
	+PAKGGsZIdH71n5J+Djefp5PEf3bRWONskyVusZ7qplqVy2kO49bis5M4qbkgmg943qVDP43q9p6R
	U6YVX+PbCGFTyVwOTRSpaukmg2hPxHoyj9Y7RMTdgW5yipMtHA6Dwr5lDo7OrFZNj4jnguNBr32+u
	qq0n+VZlnnexsl/CXdU6DQVyVm/Qq3vTpjvf7Jlk7l6caem+giWgc6v4J2dLBofPqMBWOXQdZsuNQ
	uY6UWEcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNM-00000006nnC-1Uw8;
	Tue, 13 Jan 2026 09:07:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaNH-00000006njY-3Cc2;
	Tue, 13 Jan 2026 09:07:40 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:a473:c554:ed1f:46ad:1ead])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5823A316;
	Tue, 13 Jan 2026 10:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768295231;
	bh=7QGmoI9vind2ZVUFgIhBfbjxqfPpt+PLukssWGIqkYY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M3i3wLecmrsU6j0jdR4uMqjVnPhMLPPC4icCNRjk7q6JWeOTiYLRtZqnj2ZhVx4qa
	 S6d9hpUGBI0dpNSLkrhXi4Km4eVE3jfJOFPc3wZw2uuaUUqcEjHG2i3rsaOLLQrWqi
	 oZvb/uxes7HmD0D4l3ipIgRrFpRdLNfh9KI0uBnY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 13 Jan 2026 14:35:21 +0530
Subject: [PATCH 01/10] platform/raspberrypi: vchiq-mmal: Move headers to
 include/linux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-b4-vchiq-isp-v1-1-ea0b300bffc8@ideasonboard.com>
References: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
In-Reply-To: <20260113-b4-vchiq-isp-v1-0-ea0b300bffc8@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5202;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=7QGmoI9vind2ZVUFgIhBfbjxqfPpt+PLukssWGIqkYY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpZgtDzretoqmR5rIAujIK70XJTnbA3in/McmBH
 grIFpetAcmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaWYLQwAKCRBD3pH5JJpx
 RWpAEACOzKU2wibcjkO5/BJFxH3EbyzTKDJvv36CRqsisZkHkqSWqHU2THp7IX5wp4elOHh/DW8
 NskNUEmc8H+2ICwJZt3OSfRxQztKUOHqDcZQ+HT7NaPPVqQ0PvwbqlXARhohaenTgmPqS8PQIF8
 MXvdSbvOVxOfJhtherDMIeS99DKLeHYUVAvnlyRh0wr+APFhHceqaSQmQvvzqFrGbEFnIZHHyMm
 i1kpI1Hwk85XGzkWncC9834ddk1PUmn94eRN2LPk+R7aZCUcskMe72S9YT87vWDJ/jsUq0fl7oq
 dwxrX/JkjiKufQb6/4GSuA7Cy/4j6rwRHgFgaod1JvQ/pZe5zPcKcNOWfD0CIDODBkRA7UgUuP1
 wONRnCNiVOTh0LJwdoKYzqdoImMfenpSajtMjBE+FnYseR9PTm3ownE6YdzhRxJraPyJrT3ocrX
 fSKtl77ycKn1M5W+6Tf1fYT4NosmkZEupZ1w2aO4+4StAQN/uKZSKaCi6f+aw0mOYs9XNsLTN3G
 AKXcuVQL1EiELdlu8sWvUOmL7uemj/gkm1HRnf8zE0iHOkK8AIAykHHsJ7sZKOoIdmQXlWfFJdm
 2IclYwziSCLrTh8N1j3w+z4XYpxsW9wVMgdl2imieqkWGu0lmYPNq2HrZPdvXmfGKvKtF0J2KXE
 u9e1ujjblgzMyuA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_010739_945675_BBC441F6 
X-CRM114-Status: GOOD (  10.31  )
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

Now that VCHIQ interface is destaged, different drivers (like ISP or
codec) no longer live under the same tree as VCHIQ MMAL, but in their
relevant trees like media or audio.

Enable access to VCHIQ headers for such drivers by moving these headers
under include/linux/raspberrypi with other VCHIQ related headers.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 MAINTAINERS                                                      | 1 +
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9 ++++-----
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-common.h       | 2 ++
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-encodings.h    | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-common.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-format.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg-port.h     | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-msg.h          | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-parameters.h   | 0
 .../vchiq-mmal => include/linux/raspberrypi}/mmal-vchiq.h        | 0
 10 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 816cceb5dc2d066665501aa8bbc04a2edd751087..16002c21fe06913ed57f495265b0b1ad14772c55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4927,6 +4927,7 @@ F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
 F:	drivers/platform/raspberrypi/vchiq-*
 F:	drivers/staging/vc04_services
+F:	include/linux/raspberrypi/mmal*
 F:	include/linux/raspberrypi/vchiq*
 N:	bcm2711
 N:	bcm2712
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index a228098d8cc0af5d5900b92b2847a1626a6d599c..3ead81dd2d0f48be7a5dd87256c38d6ba0dbcd0e 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -22,17 +22,16 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
+#include <linux/raspberrypi/mmal-common.h>
+#include <linux/raspberrypi/mmal-parameters.h>
+#include <linux/raspberrypi/mmal-vchiq.h>
+#include <linux/raspberrypi/mmal-msg.h>
 #include <linux/raspberrypi/vchiq.h>
 #include <linux/raspberrypi/vchiq_arm.h>
 #include <linux/raspberrypi/vc_sm_knl.h>
 #include <linux/vmalloc.h>
 #include <media/videobuf2-vmalloc.h>
 
-#include "mmal-common.h"
-#include "mmal-parameters.h"
-#include "mmal-vchiq.h"
-#include "mmal-msg.h"
-
 /*
  * maximum number of components supported.
  * This matches the maximum permitted by default on the VPU
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/include/linux/raspberrypi/mmal-common.h
similarity index 97%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
rename to include/linux/raspberrypi/mmal-common.h
index 6c5092a68b99594a0234f56b48b785fbc611bf5a..e7f065c539bcae7480a8dc2000d2a1e4cec7883c 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
+++ b/include/linux/raspberrypi/mmal-common.h
@@ -16,6 +16,8 @@
 #ifndef MMAL_COMMON_H
 #define MMAL_COMMON_H
 
+#include <media/videobuf2-v4l2.h>
+
 #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
 #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
 
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h b/include/linux/raspberrypi/mmal-encodings.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
rename to include/linux/raspberrypi/mmal-encodings.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h b/include/linux/raspberrypi/mmal-msg-common.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h
rename to include/linux/raspberrypi/mmal-msg-common.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h b/include/linux/raspberrypi/mmal-msg-format.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
rename to include/linux/raspberrypi/mmal-msg-format.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h b/include/linux/raspberrypi/mmal-msg-port.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h
rename to include/linux/raspberrypi/mmal-msg-port.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h b/include/linux/raspberrypi/mmal-msg.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
rename to include/linux/raspberrypi/mmal-msg.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h b/include/linux/raspberrypi/mmal-parameters.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
rename to include/linux/raspberrypi/mmal-parameters.h
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h b/include/linux/raspberrypi/mmal-vchiq.h
similarity index 100%
rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
rename to include/linux/raspberrypi/mmal-vchiq.h

-- 
2.52.0


