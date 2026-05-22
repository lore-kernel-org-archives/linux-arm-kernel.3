Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F4DCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d/umyGmsqHWFGhgotdpnlT/Q/sKMPpHEFZ8BUdqWTE=; b=EiGDFIvka3fM5VcRNK7XR9LxIy
	FqHa9l4+q1XTLZBWwrE//nLT4RityFrQeIYfGnpO7YAMxlvxpZW4GqjVIFUWUy+vrIq5uHZIZxEI+
	w37irFOLx93zsC3A7M9AuKQU5XAIyACYshY6fBn7YAMhcUkDB+0LE9oWNOVMhQQ+0rse6WSVpxaMn
	oXfH4MgJT1BIWBbHQXbGo1OFfHOyfCr26FSAqJ22w36tyIUFGDSF/pJYa5fNOLAC4pgrWUFpk5OsZ
	uLawDAyooIqnFom0qQEP5jzLwsZUrl05NDZTL9aP9y8ISXNSYVJrUYKMgJaaXPNpHm5KhWyKbuegA
	+1uQwE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxR-0000000ATp8-0ywt;
	Fri, 22 May 2026 10:18:21 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMxP-0000000ATmq-23bf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:18:20 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 179303700291
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:18:00 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 605BFB408D1; Fri, 22 May 2026 10:17:55 +0000 (UTC)
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 1FC35B408CF;
	Fri, 22 May 2026 10:17:09 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 10/14] media: hantro: use hantro_decoded_buffer only for dst_vq
Date: Fri, 22 May 2026 12:16:49 +0200
Message-ID: <20260522101653.2565125-11-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031819_717080_96C8F819 
X-CRM114-Status: GOOD (  12.74  )
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

From: Marco Felsch <m.felsch@pengutronix.de>

The dst_vq buffer size for encoders should not use the size of the
'hantro_decoded_buffer'. Make use of 'v4l2_m2m_buffer' instead till some
encoder requires pre buffer extra data.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index e21306f2bf2e..6f72e25fa88c 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -248,7 +248,10 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
 	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
 	dst_vq->drv_priv = ctx;
 	dst_vq->ops = &hantro_queue_ops;
-	dst_vq->buf_struct_size = sizeof(struct hantro_decoded_buffer);
+	if (ctx->is_encoder)
+		dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	else
+		dst_vq->buf_struct_size = sizeof(struct hantro_decoded_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->lock = &ctx->dev->vpu_mutex;
 	dst_vq->dev = ctx->dev->v4l2_dev.dev;
-- 
2.53.0


