Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A413BC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 11:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsB6Ex3H1AcyhwgkiuLkjmzNOCJaLbLdtQXz2gDLJoI=; b=IiXpcpozvSmoQ0QXXNHXU1ZR36
	5KjTJtCrhhpDURfDNo3xFsLpLGqXA0JAy0R+0mrK59uvprcj2Te3pgcNxRjQejNTBAEIyiFaXhtaG
	NyMEkEWN4/zj7HHPna19eIa9o4exnDR9UfqgthMI85XePCnGvzp+rQJhRoj8Syk+tyqe02uOqtRSn
	c+6TBAQcG4LbUJrxEWZEUV6PLLl0wg1qAtmyo6HfsrJHgQ7kDXpqnPcJdXCsrFpF0Rswuqp56AONt
	gx9nyk0esJOfqm9WDGjLzu4y0vdfjI/tnVqlnqms2L9gyg32hqxiYd5hH8bl7jKg7arYml7kSFygE
	uWRm+cvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgKD-000000026FN-4C7x;
	Fri, 17 Jul 2026 11:01:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgJu-0000000260U-0idi;
	Fri, 17 Jul 2026 11:01:31 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:66a6:48e1:9e1:50d5:c75c])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01CE8664;
	Fri, 17 Jul 2026 13:00:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784286032;
	bh=H1BtMGvadj2xGJTMpalk+Z2QB8jdAxVM5Zq5z8h+2xA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HWcpN1iL/KpLN7yFLecCdVjyKn+Qq81fAP2X7Ve009gI7CiCV8UqUx6oBCuQoWt9O
	 sf1k+OPbDC/z7RDOjHd0sefeuyDOGDoDM0YEpwVGCpqcLvJcG2Ww2evNEqFDwtZsuu
	 7pHFvw+83/Z0V/VzKe5HrdmeShWs7gSGER34KMOY=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 17 Jul 2026 16:30:16 +0530
Subject: [PATCH v3 5/6] platform/raspberrypi: vchiq-mmal: Support sending
 data to MMAL ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-vc-sm-cma-v3-5-6c4e77804e5d@ideasonboard.com>
References: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
In-Reply-To: <20260717-b4-vc-sm-cma-v3-0-6c4e77804e5d@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=Uu+p6zDWnVn0i9Gc8bkparl69k3TOlNR1E7lOgj8vyQ=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqWgtiWssQ3ksL7TyljvZ9hIPj1SliyHVSAerLM
 4ewStfMriaJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaloLYgAKCRBD3pH5JJpx
 RZ2IEACKgnXY4AAkZyQUKw5518Tbaa4KuWh9WI8El6j9s6/Ifdw5tgV1eiebMpTFP2zW3WZcW/f
 oSOE9NCBhq3BjHuWH4h5mlt/SF/4xR/FcI8zGX7pFuiy6Uck8mjfHVTyptzanFCmYkaEDJc/pbx
 uSTAxvaoej/GlYORUnPQvd+XY43YFe4VTL7wX6GGhkPG2fJgGUqhfpFWgqf2N38VOCswwaE48Mp
 qm1Em2Ct5FBFp+H7YgnGYSwY5jeMxd4htCaPAnXAO7WKnDcG8HAyloiSgmnA9KKQ6u2YKp/a1iZ
 F3fV3vhEfpomx22xCqDVGjnEwkq2ToL/eF6BHAwursb93tCvvseLCxbArydB+170wPHh1DwisZ6
 ndKKtKrhbC0CTaSmOHOAsTkykLAiAzRysNqZMElCik82Ladh2czIdYx+fFxK209I3lhPzeW5jzq
 dx9a7EvJn5XIuEa0w0kBbcpy8CJKVZbRCeMA1LciZEdQV99XUyBUA13Y+aMUaa3Q4xgX0l+PfxT
 oLqKGcwHvChbpFx90raqdxb1L7prRa/wNKpZARDq+SXwq/EbTuMfVdO1biqw1/6xxL+PTXxlJZX
 BoC+m3CKCemmvvCDqzCq1iB2EGeReVtvnFQIg2jl3FBYCC0e1Fx6nKDCLXRd4fAX3DHSsJy7xat
 hhdBu9s+y6GPHAQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_040130_371420_E47C3EED 
X-CRM114-Status: UNSURE (   8.20  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Add the ability to send data to ports. This only supports
zero copy mode as the required bulk transfer setup calls
are not done.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index a64b5175e1a9..ccd8910c315f 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -430,11 +430,19 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 			(u32)(unsigned long)buf->buffer;
 
 	m.u.buffer_from_host.buffer_header.alloc_size = buf->buffer_size;
-	m.u.buffer_from_host.buffer_header.length = 0;	/* nothing used yet */
-	m.u.buffer_from_host.buffer_header.offset = 0;	/* no offset */
-	m.u.buffer_from_host.buffer_header.flags = 0;	/* no flags */
-	m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
-	m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	if (port->type == MMAL_PORT_TYPE_OUTPUT) {
+		m.u.buffer_from_host.buffer_header.length = 0;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = 0;
+		m.u.buffer_from_host.buffer_header.pts = MMAL_TIME_UNKNOWN;
+		m.u.buffer_from_host.buffer_header.dts = MMAL_TIME_UNKNOWN;
+	} else {
+		m.u.buffer_from_host.buffer_header.length = buf->length;
+		m.u.buffer_from_host.buffer_header.offset = 0;
+		m.u.buffer_from_host.buffer_header.flags = buf->mmal_flags;
+		m.u.buffer_from_host.buffer_header.pts = buf->pts;
+		m.u.buffer_from_host.buffer_header.dts = buf->dts;
+	}
 
 	/* clear buffer type specific data */
 	memset(&m.u.buffer_from_host.buffer_header_type_specific, 0,

-- 
2.54.0


