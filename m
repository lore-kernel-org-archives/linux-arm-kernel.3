Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DCDC2A075
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mynzsNWNgJYIlH5+lh8QSazSh+08xiatT64QzGjvPY=; b=c1dvzC2qwlz4Ekx/CIzp9kLjVV
	nqihUd8/l07WHTaR3g/ZMCZf4x47pAZdQjGLvJ2FPSOPQMCy851bIKWvV/CA/JkqX9ug7FTQ3Tkpe
	MVkuoZWY/Kw6L/Dxs+clADsKoHyhn3+/egtgNaUzFFFCRiLUg7jEKj0BZe4UCvSkQc1sLoRAI6mNs
	2PjfitULRgxH+WcW2E/gY/2W8nHSnDVdMkWdUPXjrdzbaq9y3M5eIUZXgE53Eo8KLzOpnHowpN82t
	lN1v8JqfCMpws/CkBHu/NbHEDiiMPq66JjK1GKmwMu252tUyCvjANyjrb6wmJIzDQsbJvP7bG5viX
	2rxr3uSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgQl-0000000B1Zj-3Bdm;
	Mon, 05 Jan 2026 08:59:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcgQj-0000000B1YN-1BzI;
	Mon, 05 Jan 2026 08:59:14 +0000
Received: from mail.ideasonboard.com (unknown [223.190.87.50])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 693CC22A;
	Mon,  5 Jan 2026 09:58:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1767603531;
	bh=sZFEoWZcChBSfvMxvQwmebI9DeZGuRgPKjfiNAZIpFc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rK6P00EJS2x41kYFJ24n0FnTZslMYtCS5MRh+0NLpGD31Q+cfBTmi2qxHzOKl10lr
	 VtNy+OBOlHPcCPYBycVwLddB8mW8D6GBjFTSXnF3uXPOjsAQlmCPoMTwVx+MHdCyRo
	 JxqrKAQvbeXv3+THk+vYyaZd6uV50GCH9wZjA5r8=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Mon, 05 Jan 2026 14:26:51 +0530
Subject: [PATCH v2 5/6] platform/raspberrypi: vchiq-mmal: Support sending
 data to MMAL ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-b4-vc-sm-cma-v2-5-4daea749ced9@ideasonboard.com>
References: <20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com>
In-Reply-To: <20260105-b4-vc-sm-cma-v2-0-4daea749ced9@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2000;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=KqQRv7AOBw4Rxs73fQIHKErbhEYthnS0ZbOZhJD4YEM=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpW3z9g3hi/09c3Wz+GPV4Qw8Q3Mc1jTua4fvOO
 KHP7DAojlCJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaVt8/QAKCRBD3pH5JJpx
 RUyeD/9eECFCHVShdofaY++l+PNeqcl+qVIU5N+ubxQraLsBwpt3khaqoRR3i5k7K//6NtQjCKy
 CyRk5+sqJCEUFtUiXt5vl8GM3cwIu838xtQJLB9B66BuUmhRSwFIuL5nRlw5Gyo3JI2sUHVr4YW
 zPAG+lG77XZam0ib6usjmEUPeMEy+AfVu9tIc88fqcmhJA2ABlSioh7qAK1jQwWIPeItiptApjV
 xszbH2o3DH8icYuOIaEs8kznBKZjNSKH/UjZRWGrHtJchR2QPBTe0YJ9Q1egcEbvU2p+Gy8/5e5
 nJtoOwtVxP7NjzwNxkvGQXPRUzX5PyvjowuwELwaZvhUAxdDkkB0YPJzadBiqTEFGdQ6h/C5Q7v
 iW9bJLb7c28TTV95fF/PAPeLwkpAzm7c2Fv/BmsswtUPyWXFBcUXfiqUEO1Ql66ql2z4Wb1F4qg
 cl8RJbaR/4/jYhNrjXUgdpGoZ2h1Wtx0ViXZws/JW5U/mVmeTsMNpSyt7C4+r19ugrhNqUQxOgZ
 3iKdVN5WHLbyrjxbHhF0qHGNsUXSw2QFoPhyh4AkhUJOf0aRo9z7lMlfbt+bvqfRcLKRq9y0+UH
 fzG94Yqv7VewP5RKcBL+Ugx9uwUiK4Ck63FBPgGyz5fqXojskWXNdFR6bqKeXKIDpIPbxSMZk3U
 R6fJj7FnNE97NSQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_005913_483041_DA002EF6 
X-CRM114-Status: UNSURE (   9.62  )
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
index fe6fb571b745e04545d2d7fe7f37a486792d398f..a228098d8cc0af5d5900b92b2847a1626a6d599c 100644
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
2.52.0


