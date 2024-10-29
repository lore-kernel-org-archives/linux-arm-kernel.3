Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CDDD2AB3D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kc+sPvhpxWGb4gIvgo6LAbgFue53ghXxjMDcKimoeI4=; b=R6aEPa+qhWvkiYWc/Md4VIefI5
	0oTHddo6BW/zImkLeZBeNeI8H5MbG6DrLrK/kgCGAWfhSPxPf0AYss8krbyJy/viPOsMQa/tR1Qoo
	6A8Hap/Y0yawioO6z1qYLDbODw54PXGJr9QegVWOc77ECz3K6IIU7eakldsARhF6O4PwwewzfgqzE
	9o6nZmGW5GIQsS5F01xslWSnmmF6WdBSGvV3Ud6akvcUbqyZkHT9YkT83uPZlc+Lxo+2IYnCKXH8A
	Mc6fuCENtLEJDn5ZFQWdN1UcRFwTUURII0J3EpvO9r2/QovZv5AlpNN++LuJmFVpVHNOYCY4ny1Xq
	IxbcGHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5m8V-0000000EYM1-1rB1;
	Tue, 29 Oct 2024 13:19:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ldA-0000000EScG-2Tp2;
	Tue, 29 Oct 2024 12:48:05 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 228A8AF3;
	Tue, 29 Oct 2024 13:47:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730206040;
	bh=b7xJkOE//Vp3vaIQy1pLV0TNulURIj4a4ZlfWYe73S0=;
	h=From:Date:Subject:To:Cc:From;
	b=TTmcaCekGbWbKFStwDNEeYBf9fe1HUg6S35qvpMI+ccJdyq775g1iakGJrZV/LJ43
	 npZ7GC8ubBdTBk21gB9tpv/+cqr0FHQ08OeLeY1aN3E3tDaiCUy5rZX3Xx66YQbjDc
	 xv6UxJTRc//zi/r1zzQZZPF83XcQJ5xBXS/+XrvA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 29 Oct 2024 14:47:05 +0200
Subject: [PATCH] media: raspberrypi: cfe: Fix min_reqbufs_allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-rp1-cfe-fixes-v1-1-49f04cc271f5@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAEjZIGcC/x3LQQqAIBBA0avIrBvQSQi7SrQQG2s2JgoRiHdPW
 j4+v0HlIlxhVQ0KP1LlTgNmUhAun05GOYaBNFmjyWHJBkNkjPJyRU2LdjR7is7CeHLhP4xl23v
 /AHvacJJfAAAA
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=b7xJkOE//Vp3vaIQy1pLV0TNulURIj4a4ZlfWYe73S0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnINlWrR/eAjTlsUaqmJrF5eKC6qW0AqzC/UCQg
 XmD+reWQYCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZyDZVgAKCRD6PaqMvJYe
 9eBaD/4gRy1ykIiT9zE7t8pxIgj3p9RbSB0kW7jYb8iqaG/Efv769oxRw0DUVOb3mz64oPU1I7s
 TT75twqZo3Bg+h80Pi97YSs7N8u8MMUL4zSvr814/ZHE44HWOfU6VnV1JI0JssBQTiZWt+Qwnsn
 HGry7e2vSMRP3JpYQYtS3QVhIp6xw7j7x7Rago8rBe0BEW7qoqqI2YdN2LM/7gtd81F/lcJLn8W
 rXH9EQfaUHj1QeW+aTDxAFTd6RRPg67QfPU3zNcZ5TWBRYN9JgC5PdcOo3DteFRayLh1M0YJAmv
 jQDnhSh5yGpfQj/RMW5CV/ZdPyuziLlLv0lS9KtXf4VhS5SXM5WDZqd6hWmlWxO7ETMLJ9z/7xj
 AuTeB+oQNDXq/75DUqNJfWLH7xIgPXvYYd5pdgVn4rQytg37jwIjjvGV4BXHikxuWIGNf5rn+7u
 4lXFi9lEgMbykzCvLDxpAxyBPKVfb266IAgB3sKE8C/28D5HT9LaulvhL13X6YanuwQ7XfwVVvl
 qyHiHn8HAKvrlm10o5N1N79ZhnTL/x2+n6vCkc8DUbDNaSt1EqyUmR/KztM4VGe+P1bIY/JjgHR
 4dSRAZjiqzV9NPQN5RL+6GMDW+mpMdXFMw9T4o28AphlZ/PkKFDQV0v/UMmfGJTsv6EODLktblg
 3G4PmfCUk2d5cNA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_054728_777550_28B8DF8B 
X-CRM114-Status: GOOD (  11.87  )
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

The driver checks if "vq->max_num_buffers + *nbuffers < 3", but
vq->max_num_buffers is (by default) 32, so the check is never true. Nor
does the check make sense.

The original code in the BSP kernel was "vq->num_buffers + *nbuffers <
3", but got mangled along the way to upstream. The intention was to make
sure that at least 3 buffers are allocated.

Fix this by removing the bad lines and setting q->min_reqbufs_allocation
to three.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 045910de6c57..65e9c6d23416 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1025,9 +1025,6 @@ static int cfe_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	cfe_dbg(cfe, "%s: [%s] type:%u\n", __func__, node_desc[node->id].name,
 		node->buffer_queue.type);
 
-	if (vq->max_num_buffers + *nbuffers < 3)
-		*nbuffers = 3 - vq->max_num_buffers;
-
 	if (*nplanes) {
 		if (sizes[0] < size) {
 			cfe_err(cfe, "sizes[0] %i < size %u\n", sizes[0], size);
@@ -1999,6 +1996,7 @@ static int cfe_register_node(struct cfe_device *cfe, int id)
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->lock = &node->lock;
 	q->min_queued_buffers = 1;
+	q->min_reqbufs_allocation = 3;
 	q->dev = &cfe->pdev->dev;
 
 	ret = vb2_queue_init(q);

---
base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
change-id: 20241029-rp1-cfe-fixes-0270923a2f94

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


