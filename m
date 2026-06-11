Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599F9CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o+lqM/e2Lwyv+yluw6rpecf/mWCYwaWr7Ag5E24I4TY=; b=BjOMjg1n9BoZXAUONoIsVdeKE5
	zej1CBTUiHhI2lIVB4dEogvppolNDIdzIbzTt8J9+RXb9W86ZipiBjmqnEKSy+EIK/MB6A0xwIvZY
	lJmXKFbc/jhrv6ReNByayYNKi1Y91T6ixJAFujAfEsB2JDYd5sZ5rKmkwWkOsQUDz+s2NloJmOTdy
	2PDhQeCOexysVoBl8SAvU+Nz4fh3T6RWf+VNYYxk9hArVfBeRNbQ3O5EY6lnhxmu2vOrSCwvrvJSW
	DzwOBRq8QChyFvSWet3N5Jto9NAbod54R1ED+e4aNTXOWIj94I/yRWMQ6Ikdfhf9xPhSYBJXtDaK7
	0mYC5+zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbWC-000000096zs-2D6S;
	Thu, 11 Jun 2026 09:16:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbWA-000000096zR-1BHL;
	Thu, 11 Jun 2026 09:16:07 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 79C44673;
	Thu, 11 Jun 2026 11:15:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781169332;
	bh=N8Jbk6/tj90Ici8QsaVaffj17YRtmS90xotcF4Ftoto=;
	h=From:Date:Subject:To:Cc:From;
	b=bnhdh+0Bf8qZ9+1O8zp0xQU3b0ToSBq/6IhoA11m/H4Yob6mPC88X0tETqlZ6mFb4
	 mAXDpsLxzymxUOes+JV9F/wb/l710NJuqnQsf49nLgKE43+hJW1mxC3DqGVbKiEu/m
	 8UKXI3wCJgji7ZZ8OnDlBRlg7J6SLhJtXUPvFKVs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 11 Jun 2026 12:15:44 +0300
Subject: [PATCH] media: raspberrypi: cfe: Enable video capture on CSI2_CH1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-cfe-ch1-video-v1-1-f819577a0333@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAL98KmoC/yXMQQ5AMBBA0avIrE3SkajEVcRCa8pYtNIiEnF3x
 fIt/r8gcRRO0BYXRD4kSfAZVBZg58FPjDJmQ6UqrTQRWsdoZ8JDRg6oiLQzDdVkBsjNGtnJ+f2
 6/nfazcJ2eydw3w+edllLcQAAAA==
X-Change-ID: 20260611-cfe-ch1-video-0116fb7151ba
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Naushir Patuck <naush@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=N8Jbk6/tj90Ici8QsaVaffj17YRtmS90xotcF4Ftoto=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqKnzQdfPCINNerBjlFNMkb7EMAT4yRPjJpIWG8
 IXKf4ule9OJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaip80AAKCRD6PaqMvJYe
 9Zz4D/9dpLnhZYGs78vTttR2yQSUPmCJCDNVR36oKxjLFvy6Q4C0vfvdVs8w4zS3m696+qC9so+
 /r5bmBRKvd7WesjAv7dvw5oRpfwnFv5SeANCz5fQHEQKSsxYeUWp4g652SO4KkxfrWD0OPy6Wfb
 OFDh+OqiUHe5VLq5mdPKz9yBiWUOCmFn5sqCSnNTDGa30kb9p/0zd8+orU3ZOejMIpB5P3QiBMh
 VMrPIdvLNzARDRrNKsPISuFAmppMChhEsUYf+6//mHX+sF/NaeqnQBNrfstOod76oNiCPyK28fx
 63jwd7NYN36FdsApDmwe/PusGYMQwpSZxPc+QYWsK+eA0jz/z13vKbDb5vcgiprDhkkGtEkQFi8
 DC/zCNL7fV1ncV4Og+79YrA4Cf7N8ILIkRWy87toY5Ky/V6Z82kHJqRwC1eAjTKa/ae2+Xu9oGv
 bCoPv6437fGxjjxKJGbwjhJmZ2OVAQJINgrDeMmxA6Qxql14ZJXRvRGRNCKz6aa0j7sMBKa9xFJ
 tEvVRct9xAb1a4oBJF1cj5avSatHe2oafZSrASp3B4FPMQnBie7A97G/qI7q+3o67owXZfh2NGd
 xhi2idQq3T+h6jcHLaW1Qxdbg6G7mbJEqgsw1lngpc1ZKbE7nQb+ezdINRrJliGkRdVl8+Ke/Rd
 IeVFFi76UMSYqvw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_021606_493989_86BCB71A 
X-CRM114-Status: GOOD (  10.43  )
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

The upstreamed CFE driver did not enable video capture on the second
DMA channel, only metadata capture, to imitate the downstream
Raspberry Pi kernel.

Let's drop this limitation and also support video streams.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e97b9..40eef608504d 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -130,15 +130,9 @@ static const struct node_description node_desc[NUM_NODES] = {
 		.pad_flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT,
 		.link_pad = CSI2_PAD_FIRST_SOURCE + 0
 	},
-	/*
-	 * At the moment the main userspace component (libcamera) doesn't
-	 * support metadata with video nodes that support both video and
-	 * metadata. So for the time being this node is set to only support
-	 * V4L2_CAP_META_CAPTURE.
-	 */
 	[CSI2_CH1] = {
 		.name = "csi2-ch1",
-		.caps = V4L2_CAP_META_CAPTURE,
+		.caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_META_CAPTURE,
 		.pad_flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT,
 		.link_pad = CSI2_PAD_FIRST_SOURCE + 1
 	},

---
base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
change-id: 20260611-cfe-ch1-video-0116fb7151ba

Best regards,
--  
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


