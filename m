Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381A7D358CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y8BIl+9hJvYS8GnIBuao9nCfnKSCoshmBlhJepfvE88=; b=yW9u0s+UpbV8RByYjJISwOkfkv
	UtPgVnM+aLwP9JN9TJ9jGxDIC3/1hxnxJGXhLSKEtblwgevPZBIiqTtkMqJofWrRXXdylimjX+JNt
	BAA+DnLV3TOdUQrlRRhCw1ccqTaA8gFi8wONDX2T9z7UbWWquK9K+cPkK6m+iO1Me5VEyzXSUMYEG
	OSPBYGrnNPT/x6ArjQtynnb0CRwxDjAKUnKjgtOjLkUnHIgOvcDK3z6gZdfxhrkzT5pmPVZn+OYPn
	5F8cmGMYQVshkJWlrjksZhTryQRk9ao7v4FZQlDpD/65Iv4RhDwIJWs9zzF3ojVHOw9W689T7uPUY
	fA2YKGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMOE-0000000HNzW-3GBB;
	Thu, 29 Jan 2026 07:24:30 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlMOB-0000000HNz7-3hed;
	Thu, 29 Jan 2026 07:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769671447; bh=Y8BIl+9hJvYS8GnIBuao9nC
	fnKSCoshmBlhJepfvE88=; b=a0GblCtH7y5x5Lu/BN3mDIkC/XKNh6+Q0V0oLRiK34jBcoBfs9
	O917E64yn0SX0QhcnxJ5Mk/w32IC4TZmWmPH9Y3VRnIcN027yyt52DZvFJHD+1z6ecsfH7+3ClB
	L/GYAPaEi0wzExVftOzg24jzllTvL9Od5fAkDUccxYcw1dMBfxePTz/uLXX1GOq3mYmK6y7fl1y
	yz14YtkRBkLzozBMmj+i8FDqr1A8BPQHzJmfKWE4HoC5+JxZXv1d0mKv74Keqtcb35IMHJP/eDz
	qVxDM/RQjhDT81qeA9IjC5HSOuF2yy0Z9tzc1aJYxPSG6ZASI7Gb3zxaZWaAajZf+eA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1769671447; bh=Y8BIl+9hJvYS8GnIBuao9nC
	fnKSCoshmBlhJepfvE88=; b=hsDGf2TPwVtVsSdDadxMDpJXWljSAbjl9KvzP4fHHviEuodXbG
	0YXuV/bkOyGKxsfTP6L5nhk0wQVZi+oQu8BA==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Thu, 29 Jan 2026 14:24:02 +0700
Subject: [PATCH] media: rockchip: rkcif: Add missing MUST_CONNECT flag to
 pads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNL3aLs5Mw03bzSnBzdtKRkg6RUE8M0C8NEJaCGgqLUtMwKsGHRsbW
 1ANmOIxxcAAAA
X-Change-ID: 20260129-rkcif-null-fbc0be41f81a
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769671444; l=2767;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=zwuni1NIWLOUNldNum/29rw5wXcipncI+6TVU+dBqWE=;
 b=wIYtmlfqWWg2ZFw0aeA6yi4Nwjk2B1O9WhYjf/CXk8eUng2Drp7i2s187kErrM01VmJ5gVnz9
 6oeeruMSQDpCIkM7O2k1A3nI+nAQs3f90h+rjygQO56JG64RmvqZnnX
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_232428_116333_3DF30750 
X-CRM114-Status: GOOD (  10.24  )
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

The pads missed checks for connected devices which may a null dereference
when the stream is enabled.

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000020
pc : rkcif_interface_enable_streams+0x48/0xf0
lr : rkcif_interface_enable_streams+0x44/0xf0
Call trace:
 rkcif_interface_enable_streams+0x48/0xf0
 v4l2_subdev_enable_streams+0x26c/0x3f0
 rkcif_stream_start_streaming+0x140/0x278
 vb2_start_streaming+0x74/0x188
 vb2_core_streamon+0xe0/0x1d8
 vb2_ioctl_streamon+0x60/0xa8
 v4l_streamon+0x2c/0x40
 __video_do_ioctl+0x34c/0x400
 video_usercopy+0x2d0/0x800
 video_ioctl2+0x20/0x60
 v4l2_ioctl+0x48/0x78

Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
Fixes: 85411d17bee9 ("media: rockchip: rkcif: add abstraction for interface and crop blocks")
Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
The RKCIF driver missed MEDIA_PAD_FL_MUST_CONNECT, which causes a null
dereference when the stream starts if the links are misconfigured.
---
 drivers/media/platform/rockchip/rkcif/rkcif-interface.c | 3 ++-
 drivers/media/platform/rockchip/rkcif/rkcif-stream.c    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index 523103872b7a..414a9980cf2e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -378,7 +378,8 @@ int rkcif_interface_register(struct rkcif_device *rkcif,
 		snprintf(sd->name, sizeof(sd->name), "rkcif-mipi%d",
 			 interface->index - RKCIF_MIPI_BASE);
 
-	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					MEDIA_PAD_FL_MUST_CONNECT;
 	pads[RKCIF_IF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
 	ret = media_entity_pads_init(&sd->entity, RKCIF_IF_PAD_MAX, pads);
 	if (ret)
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index e00010a91e8b..201542b55f00 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -555,7 +555,7 @@ int rkcif_stream_register(struct rkcif_device *rkcif,
 	vdev->vfl_dir = VFL_DIR_RX;
 	video_set_drvdata(vdev, stream);
 
-	stream->pad.flags = MEDIA_PAD_FL_SINK;
+	stream->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
 
 	stream->pix.height = CIF_MIN_HEIGHT;
 	stream->pix.width = CIF_MIN_WIDTH;

---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260129-rkcif-null-fbc0be41f81a

Best regards,
-- 
Dang Huynh <dang.huynh@mainlining.org>

