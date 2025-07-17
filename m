Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC48CC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N4lPNUuBecjLNYOGzzdn7f5lFE4V98kpAcBFvACHhGA=; b=xa7UdR/CVqby5QTO0jYeN4CAyV
	qNEyvn6qBxnDxqJyO1Oz2EiAtgvyzATAfoNl6Ov8CZazCQs2nshWWqAilqJN8o2FWKZwiwSQkIs3a
	TUSDp32nUvEi73ORuqrbjRwqJ576RCF54PH3tMyXyOoON2u2b9AC3p56+R5gFW9qjW9Hle4SMCYhB
	YblCDM2OOf2bgCPlsxmAU+5JFju6p9cLrL2zqUJeHvioAqovNkSqArONj4H0MqlLwN/YqYiCL/qCU
	ZLMqU7xrfJTAXKx3ASbdbjAKUAqXbf7TucHDD81ojRcf8MspDgcGGATq6wYia8MIsaUJSaaECu+/I
	9kVDLKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNQs-0000000A51i-2aNi;
	Thu, 17 Jul 2025 12:09:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucM86-00000009t08-0Y8M;
	Thu, 17 Jul 2025 10:46:23 +0000
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD40E21F2;
	Thu, 17 Jul 2025 12:45:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749147;
	bh=veD5bCafCFdh1GJ2SEAikts/NXjEHZdIvuKFJ7cMJ+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BrD1IhGTWABRNCLptFDK6B2BG+aNtn5V2O8P7iT8TFlXY2TVKXZ3oVX2NvecRkAtG
	 A10+98QdZn1Y70fvBsT4sEXHihkJpX2Bsvp0LgjcoV+YMXlhUszsRS54d8aFTkdOIv
	 reVy7OIWUATev7qnUsj+4hviUokkock5b2Gvxj9A=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:51 +0200
Subject: [PATCH DNI 25/26] media: pisp_be: Register devnode to userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-25-81ac18979c03@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1240;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=veD5bCafCFdh1GJ2SEAikts/NXjEHZdIvuKFJ7cMJ+I=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRREpXqgCve0J6ofHIN6a1A+7ldn/yTcHDdL
 1B9xdg25KWJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUUQAKCRByNAaPFqFW
 PEQ1D/90/rpes/8rJaL1PpQbGCrRfT1XMHhyFHUNb/dkqPzOtYdBmhVzf8FhN5C+4sH1ONE38mv
 IfRq218bZFaln6qGAB45EMK3euim6tJb3Lw+vMCmgpSnNQjd/J9yBnGb49ZGoCXUscsAIZprBCE
 qzKjmZOE+S+fQDxoxlILFlNzrIVRITViA3YGtXK1Avzc5fIQw9TE4SOHX5GoBBGKlYIhiB8vWZK
 Xys0e+BQ9BTDn9TE2J7HAaDkQHkGuFGB+bdIj6TydwKMzisjENEFdubINbDO7RbrZljuxs9br91
 n84gh+ojvCebu1Pu6kHyFQdZQF0LlHL+FoWq/TScV4MajMB9XE67rp02fCO0PkNl6UdOuN9QuJT
 5O8R8j3UynCIOrhvpD9d3lkIfZg2zL2A0C4J8ddK80a5luABOqH4gFS9Oqbk84IZcc58AHwvtZB
 FzQjK14Jx5y+o/ZKMdCX3mtMJdjebdaQD2fgV9/kzwgzFwFYcj9HZcf6zvdP9PTKQpkgch7RC63
 EPgXlh/8bkNbwr+zEnJzhDXMnaKufVwth8sZAxy3QR/06GrDSQARuRhuIMC95XLXLtD7idEIsma
 Vdztnoki6OCWrCAQpBcADWs2uxiRo6d8j+xtFQJwSVLyEwQaPWafrdiEUWH0KAp53nSHnRPuXG5
 b2+er40/ZWwL2vw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_034622_357075_27DCE2C6 
X-CRM114-Status: UNSURE (   8.50  )
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

To set formats on the subdev, we need to have the devnode registered to
userspace.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index 2a8c09a9c70952c9f99e542271e994d62392c617..df3cdd81843376abf98bb184cde74d4d66b0ecfe 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -1635,6 +1635,7 @@ static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 	v4l2_subdev_init(sd, &pispbe_sd_ops);
 	sd->internal_ops = &pispbe_subdev_internal_ops;
 	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
+	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 	sd->entity.ops = &pispbe_subdev_entity_ops;
 	sd->owner = THIS_MODULE;
 	sd->dev = pispbe->dev;
@@ -1658,7 +1659,7 @@ static int pispbe_init_subdev(struct pispbe_dev *pispbe)
 	if (ret)
 		goto error;
 
-	return 0;
+	return v4l2_device_register_subdev_nodes(&pispbe->v4l2_dev);
 
 error:
 	media_entity_cleanup(&sd->entity);

-- 
2.49.0


