Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC21C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72qF7fxqGgOyqFtaJeY7jj9Ztoeu5thqUqJ3yho58sE=; b=GcTgbI36BBKlbq8BcgH7fOX6kX
	26mpcZw8LDj6bCNomwe/k7kO/sISECMX3CUIh1G4KAPZ9PF0yjLu7YJ/NQK7D1g84ef8Ff5Hhp0qD
	Hl2oaolS3gFLcHLp4anRtxcy1TMtUAvJ7o+miIjgKiQYPLslSHztFIE/ypgdvVmSI1gVJYrCeM0z2
	VDcyrhDDU4WsBdbiFswSYv+fTsxuRQbkIpvVOWYddx9YesCpLovx55ikI3mLPaBP1YA549WqFmO/8
	WrpdiRO2w4v8KnnwxS41AwFvl8QB6qJjKabJnAE5xZ0dUrOMowq/PRqQ3ED6r8TqUpOCeoal6tcNw
	eq5uKOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucN73-0000000A0x8-3J0v;
	Thu, 17 Jul 2025 11:49:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM7t-00000009stC-11ZF;
	Thu, 17 Jul 2025 10:46:10 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67BB31E74;
	Thu, 17 Jul 2025 12:45:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749134;
	bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OOff5Etzj1BASviY7XteSLrji0sQ2MGJumgJuzBT90EpkcnHlYXDMiQwybMFvWJm0
	 Nj6o8RgXitaS2Zv2e2IMoWrNfqaVlZnvYqkbIvznkwhVTKWzvywG3NdwBxnq1sA+yx
	 uRitJwr0g1r4mSwKWwHNvnv+W4MD2cHGZhTWRD+M=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:43 +0200
Subject: [PATCH 17/26] media: v4l2-subdev: Get state from context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-17-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1875;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Av+qDIxci6/rNYahjLOq/w3ykEkjt8C35QIlJVVOQlA=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRQd90DYybLMFBMGXEIc5XbdYrJwrR2tprN2
 gyuKk9WcI+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUAAKCRByNAaPFqFW
 PBoCD/9SwqPLTbNwWfPpNqq9bJosyxb8HDVvloOV15iO71vhg1hePnB46b86CzelfoY+NP9Uq0v
 ANEIbTXjPUQMVqQ4fpg6pNRTrkOf+hcLZXlKURymNy7O0CcYFtB//rdeIhyQFOGaDSElURD0V2t
 ar3ixtgA1UsMDN+cwcUNqDkXBWP3jyPPLoKG5V0i3G4Mnyg6JlzqJ3p9oY4yyvyYc/fVHuNAJTe
 Z61yhJTEeMLTT/plbkrn3RURNh8CrRpwrkR1CG5h0/LSVG/rKeHrWl0MmHy48Q3yRP+AvOuO4f9
 sttWFV9NZdS+gXU26MAoXO1LI5/UEZVb+q/waqbQWRgqPfNt8SaBfYmGRtEu69tUxYvNrVdTYtw
 z9lxN0EsVWMf5BqAV3HpScpYnhuIl2fYv3ApP/4ikWaOiKJdoAYu4gZF2rPFvrhxOK/qyw8jXT9
 snmr1jrT4W5xcgaUHZZa85Om18QKEnFEEbxL753ZJuolLI9KkHxhWeSTudyrKlnoy5QIGCZvYQx
 UPFyx8k2PI+ELqyzLc2jAXl9STxb1MsLRMEZxxMSct9YYL9qlJfa+4R1ft6dEJxd5leFZNwptIq
 AvExURcpv2bxcRFCAOu6CW+nFgWuKV/05XPH1PgksNHGO3hDSznSW7aRfvqYZEli/sAQeSrvkjI
 QH6qPtpuaiyZG0w==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034609_471908_FB7D5873 
X-CRM114-Status: GOOD (  12.17  )
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

The V4L2 subdev ioctl handler retrieves the correct subdev
state inspecting the 'which' field of the ioctl argument.

So far the subdev state either come from the file handle in case of
V4L2_SUBDEV_FORMAT_TRY or from the active state stored in the subdev
directly in case of V4L2_SUBDEV_FORMAT_ACTIVE.

With the introduction of multi-contexts support, there will be a subdev
state associated to each bound context. If we have a valid context,
use the state from there in case of V4L2_SUBDEV_FORMAT_ACTIVE, and
default to the subdev active state in case the context is not valid.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 7372f61127c871cec44a3d1900e2b8bef34632b9..66c539d880127844893620d325a2b05ac4aa9e96 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -703,9 +703,20 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
 		break;
 	}
 
-	return which == V4L2_SUBDEV_FORMAT_TRY ?
-			     subdev_fh->state :
-			     v4l2_subdev_get_unlocked_active_state(sd);
+	/*
+	 * If which is FORMAT_TRY return the state stored in the file handle.
+	 * If a context has been allocated because the subdev has been bound
+	 * then return the state stored in the context. Otherwise default to the
+	 * subdevice active state.
+	 */
+
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return subdev_fh->state;
+
+	if (subdev_fh->context)
+		return v4l2_subdev_get_unlocked_active_state(subdev_fh->context);
+
+	return v4l2_subdev_get_unlocked_active_state(sd);
 }
 
 static int subdev_do_bind_context(struct v4l2_subdev *sd,

-- 
2.49.0


