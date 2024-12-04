Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3181E7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sQ+fR4FfIWhsJMfIC7796/e67iybBGY2Yyhy3s0xVM=; b=uA21kRn3F9404/7Gpx6K9+Gl1L
	WJbn7xJHHonl2w5Wex8uhHTZ7feRxaEy0h6dI/nQhRsa+7ApfnMJOPcN63cXYmhBw85bdcGv9k1MD
	BS0UjLScKhXAYLNQdwlGUUaGL2Cr4vz2RUwmqkG9bNBhY4mtqTGCoEkFD5Bo7J8mj1jReuWKTNAaI
	lC1Tw+KVeOZ9BtXGe4vxMl9L4sFy3kXPqru2aT2Q/bBWdQOi4kv6OAD5mMvx+xE6f3w2QInozfR0E
	5qvRVXTB8ASjjSBCe6+0zdWf4McHV38zRZZoMYRb5Ud3ENJXQpeLHpUeiRwKMuoJqK+JYdqtalqBq
	UQJrzI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIluZ-0000000C5Xq-1MtQ;
	Wed, 04 Dec 2024 09:43:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIljT-0000000C3EL-0Pl9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:31:44 +0000
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80E4A4D4;
	Wed,  4 Dec 2024 10:31:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733304674;
	bh=3gLGxW2HVXpkPQ5AFOvirBqMHKf9n4CAMSQ7dIjYRdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ERHyhezwQJQSY6qmbamAteHL38TD59NbuSoPylS+hX0amw7ud1DENxnW669cRcxOY
	 xJ4AZUV5/KdKiYxE6h5sLIVymbD8Q3JeMJBFP7XB4fNoON/pMbNHYaMMNO5wN1/9WA
	 6U6rJhOQCJCjr+yDdtrtDYmLleby8B19RCMDW6yc=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 11:31:10 +0200
Subject: [PATCH 10/10] drm: xlnx: zynqmp: Fix max dma segment size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-xilinx-formats-v1-10-0bf2c5147db1@ideasonboard.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=764;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=3gLGxW2HVXpkPQ5AFOvirBqMHKf9n4CAMSQ7dIjYRdc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCF0ZBts/F3Q3/nmyZ3acCAUk/Z9QNIzpazk9
 2p+d0+xOBqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhdAAKCRD6PaqMvJYe
 9dTzD/4264e5H9nuI6cbErkz9dOv3nzTmuYcoJ/vwyiVHnu3c8oBYbQVe/fwBR7vsyAptznjqaW
 m2MydIEztef4OKL/JdUmXfogn29iHkdT8G40q85rHxFRNX3yhMFgWt/MfYtMUcx1WPHGO8sNmVi
 UZ+uT3uBqd43EHBnRW1k9xVXgRryZrZqlGza0o1kAARG27GW4k309oIT9TpzhIhkbGSFy6T+5y5
 zCyJQ/fpr5YJ2P4j4lcQ1xfx+0bOMOwRdPOeSBNn5JmBcBAe/eZIyi3torKvRNJrDNROqucq/fb
 80wub34XYvF4GGjxiTd3v25ZHN51SGczWZEDmVYp34o13Gq1kmq+98ReAU9FO/+OQvsjZpXQijH
 YROOL8y00upWzXM3eqtRZLJ2OeE/Rsas1BjUqy8ikJLR2dXErDrLZs+FN2nykdRU3eKUwX/liBw
 3KcpQsL6cyKruROnYb0uGBQACBom+mJO1Ot8/c8M3vlM1/AQldZlP7YZK4+Muwo6xGHcBufYyJW
 xVrhvgw+Kq47O8Au+Dd5iY+dlmGMBRQl1DGU9T/MRdZgnm4U8eCU8M7usEyCxvC7Jo4Bj/VLE5j
 FE1lLM7dVNEpOoOkVbI26XvBZ+mBRJt+jVPr9RpFppcMTFYpXWPG3KE4w0gW+L9EPNbswnojw2e
 S3M31bU/5fkpoLg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_013143_358907_C108BC4B 
X-CRM114-Status: GOOD (  10.09  )
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

Fix "mapping sg segment longer than device claims to support" warning by
setting the max segment size.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index f5781939de9c..a25b22238e3d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -231,6 +231,8 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+
 	/* Try the reserved memory. Proceed if there's none. */
 	of_reserved_mem_device_init(&pdev->dev);
 

-- 
2.43.0


