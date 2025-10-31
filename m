Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95391CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4UWG0n3ITneRu2qxt8y2gV6BepzRbdQ962zgckr1pc=; b=ofddPvgb+iIb3VX0FX/8EG+LCK
	EHcclLzlUz0E0oiVCkw1/LqGCM4QrheEE9h6ngSXDNXFniUFgA7CXYWeru6WEkXBHNjYr1n1UfK0I
	leHZ9g7vbsX72ZZEGM5FlAOOzMg+6IpT/26t9KY3EH0LMjb2JlsRIIFHPhCSYCQzdttPlNbYm4UOD
	NnlMGd80y4jzXheGjU/lX7DykaQsI4A1xTnbVfySV5m6bXJ6XWRUZMtgpvVs7GRDnA4VVll1bQzq7
	dzwYjlyO6hfg8YQAVDXMrmRbH2ljeyM5mY0h81bLYFZlDDeTG3bdfmrIDMe5AxNru5B/XZWEyjTHl
	6InGIcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvd-00000006Ucz-16ez;
	Fri, 31 Oct 2025 17:28:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvI-00000006UCX-1uEU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:26 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1A325B5;
	Fri, 31 Oct 2025 18:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931592;
	bh=533NYx92g40jb1ADfvwqEdHJ9gcFkilXSs69QufQenU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o9te/yYPtmNzGapb++L7vSxLJEaVhKTyq8ptOegIK/TqOGXg/FDMpmILI7g9jB/nP
	 ATLXrZeU06CvXJsdCX+PZ/65hlN/Qmi+yUVFR26YRviej9kjMqPkYV0/TdvhaTf7hv
	 QHoWyC4B4zVfTld899NJuK5cv9cWqkiK9d+aBwzs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:23 +0530
Subject: [PATCH 03/13] platform/raspberrypi: vchiq-mmal: Support sending
 data to MMAL ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-3-0dd5c0ec3f5c@ideasonboard.com>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
In-Reply-To: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=GGB5nUrnx+IB8Xu2CwCZTqROE4qS6bk1utWTjQbFuYs=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGWd9fNZvo+twIRO1O5q6/cVyUHvPYmTjVQx
 EcGMVcq3QqJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxlgAKCRBD3pH5JJpx
 RWdAD/0VEPbvjctIPCAUaattr3z/NJ9SBxd1hWpz087+/NooVrkuFjCpIlF59I9FJnTQKaY+hLn
 G/u6PzlmJlOkvDb4+lWI6NZqP9bxc9EiheucJE0C4uSFb4foKtT+9k9zqa+MFNyFhqQ+t+dhsbE
 zWGhq6jI6F0AX9nkMXoaCBb1dxcTFhRbxIJ2ArGA0UH/IxNA+BvhHlgLLmDccyTWly8vudfeHXS
 vrg5E0YscM5mzKceg7gWtqBdy6+eo2UiNMIoAk7o+ZOCBg+k5ouy7aQBiOlUbG9VD8/1S+QUCsV
 D13LwXnYQkwNXatGpZbPmXx4HkzJsbtJAsc/jRsj8tlDgaTTKOCWNWqWlnANjI3mI1ANAaZKsBW
 8GPov53HE+X7rnGiUQLk6fEDxyeqWfaRp5WH5ndY+t6o6vEVPyk/zmvhw9flB3O+F7kWkUAs6Zc
 MFn8bWHnlV/KvxVRTZuJyURyEqiqAg4sjTuBf7XgJVGfsk3AkVZ42iuYRXNbDCCHflRCar84/LP
 pr7gKdqdMPmd4d7cqAoeXhsYzFUkGB1sgEFs0MDrEcirIfGNJeF8dyGUA8bBq++M7ItgrIvEoff
 DM621AlXiK8eCTSVol5sFgGSuOSEYOl5xYq0917CM1xDIFct0XjG0dLnLeBTyn5f5h3lZffkBVb
 kULiK/jfnlUsSOA==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102824_659875_6A44F103 
X-CRM114-Status: UNSURE (   9.56  )
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
index a115a391908da06e101e159905a4403b91e051c6..1ad00bb0a02b482719a75749ed6ca50f43df24b2 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -421,11 +421,19 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 	m.u.buffer_from_host.buffer_header.data =
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
2.51.0


