Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E3DC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t9m18HxC3xup9ZWaAe7FHbfOaDMdMjXkcRrikDGK8I=; b=zA6qYHpDAB3fLTPwJeg8NC1dtW
	ExvBB9GowkdNFR2Cc6rNpuCV3AfnABlqEi4Ah+on0MjApyok9jKqtX1f2ryoTlK5YI9xib63t8AOq
	vvaSG0Um1kB4Z4my/1BfDDHho7L7lWFRDNCVP9VHU0ItS704qcMGqI49q2GaO0HMJwHas6+ilNh7G
	yAj0HaVvHOGpGTP0bO/lN7IYD+EXwzSQkr+v0+p6SzCmVsKSMwyEBibhrl2f1/Zqo0EtG0VGh3sqx
	Yv+dUU7ddD6GIVCXLVgfQd+4zOK3Hlm3cfk7KqsruLpwrFG+RwTm+UH5zubZOE/00dtvqyCaFsilO
	7NvXVKNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qgh-00000009QHE-3EEb;
	Wed, 16 Sep 2026 14:32:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qgg-00000009QG3-19aL;
	Wed, 16 Sep 2026 14:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2t9m18HxC3xup9ZWaAe7FHbfOaDMdMjXkcRrikDGK8I=; b=b/PdKOQ/uyN/8wfcJ9fhPvruxF
	XbjbdZyLfz1pw29KMPh5aXODmgRJlb4DtmsM82dFYYJeEKsqcN/RGm1TBaKzMy2n8nz/5sjO+byN5
	+VKbtbYt1IqHQxvvYJsNUXDzvScqy1gyAwaYLHP6e8nEPTbxeYGsuc00bJnTp1lTbsILuo3D58ZMN
	jEV37S7szKCFSqKH8f4GxXH8t2FIycgpDWPtukv/Kp9ncONWoRynrCTYFZEJiCNVNq+8lnnYGRPSa
	cTU7Nzrb0eBePy9vTRlO/Eq1AC0aAE/9VT6M9coewBtw1MW/zXwvuY0BKTp38E/OjgnGU8+xTB5hn
	2ptDxlpw==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6qgd-00000007z0f-2Jf2;
	Wed, 16 Sep 2026 14:32:37 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78E581CD9;
	Wed, 16 Sep 2026 16:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789568702;
	bh=t56PTIEMD6KJ1LpbTqBV68hm2avVCk2Z65Fltr6myFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=haPyE1jPPSVm2TgTDn65y4Ei6N3J5wjJlQtw3d8QPUrfjG/H8G4l1MHtxG2Io/gOH
	 qJFXM0pbzN5x+l+H+2M245FFPssdkIhRrGWOX5oXAmhtyxAlu+jrL/QBf8vUGLiz8J
	 JH35u0C6cwWfbtpxcAmSEpnoNE1KPIeWj2JPD0N4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Wed, 16 Sep 2026 19:55:35 +0530
Subject: [PATCH v4 5/6] platform/raspberrypi: vchiq-mmal: Support sending
 data to MMAL ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-b4-vc-sm-cma-v4-5-476d1142b5df@ideasonboard.com>
References: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
In-Reply-To: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=+cbIEbm0BcZYuTwzOPCWWmdPETU+3xPrZDmLWGVQ5PY=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqqqcAveuBypZr7L5cmAB6RNPAV1dne2EbpZQtj
 IvzqxmQ15CJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaqqnAAAKCRBD3pH5JJpx
 RUMnD/91C7SEXaxDKD7Cqyeh9ameOD563jkxctw2wy1mampgeKfzN4oP5YNJM1UJBGujL8MfmAo
 btIDaWnm6gIUoghADIvaE5+m3Yb9Jq3vNcugX3547rIglEQrhcZaY1XBFPdmVt6CqxS6ht5GYVW
 iNidikd5/Bh2f4OvHoIeajSDA8KYaQjRje4KDoUPNM9qMcaxQVqlDbGf9P7XVjLpZdelsUfvmHf
 BTRXeOoST6PpFsi+ToPR7XGKDg500Aaf/XmN2RddNy0TrHqVAfW22OpuaPIs+zfuMptB4fAKs2y
 1aHEyeWl8habFErrXZ5r2xg+idOKR2wgl1fTEEQohltTHM9gdc2wlYLA2GbTcOCeBH3aSTYW27m
 H8Ug34OPcTnEqVju3EMGnkfbYO9Xg4buXGQEOU65CFLKOykjCeDOxyvHG6kSCviuBXjwYvbJ2hM
 8iKxsLmyQ4Ed/mknU3c4/0bu38BweHdWlCSS6uPBv6waiaGj60Lw/+769sMI887sRShxzFQg4yu
 H2VCrdPsLbMZ8fDs3xpKEqa7eGPwpgbhEIY1ret4nG2IduC/BsX+2bsIvak70k2dyowOWvBjcS3
 tPacf7mqalLYR2XdJfnER9xMsv7jJbB0+GCCBEeRgcQa/SzsJydrtGqkVIesI4chPPwaHVs7Hc4
 HEL4GSmXFpZRKlw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_153235_774188_B1F6B752 
X-CRM114-Status: UNSURE (   9.45  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Add the ability to send data to ports. This only supports
zero copy mode as the required bulk transfer setup calls
are not done.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
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
2.55.0


