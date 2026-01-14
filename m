Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE55D31A3E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syXej15bmKrAqthLhy1Qf348w2XayGMuE08jYe1K0X0=; b=OzYAvLZREUkcTeDM3aKDINsfZ/
	SeK9oxpp7C7F0P+5Nr1Wk/wEb70BLtstUBaiHoln5u295HssKlNLFzNJJeiopRpcgRQfcLy9gKIpi
	OB4mq0/E3CsHCo92xH+IiEBJrPlQ0rRPoiEC9CbdLt2/qqr6//wy7wqxGwB909AKw8kQ5eU5Hlbs5
	x0959OqTBZM2DEyXFrIbjp633nOhMCa8/HkKsjHXCpfJHiGjW6wqHbCFtzTmtgjd1179oHSx7n8xW
	8uR/UR3307RzJGbwzeSCigNKRgu38n4zwLRlk2ZlWoOkbqbMbo0lJgcW1SPJvRw672lkP1akp0S5I
	vwxmb34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxp5-00000008hoD-0wdB;
	Wed, 14 Jan 2026 10:09:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxoi-00000008hWY-12GD;
	Wed, 14 Jan 2026 10:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768385370;
	bh=CYi9WPEwJZhsc3zV+Yjx9oQit131jjFmMvk5/4DaW3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QUIxnmKmxJKvu3V9z8nGvoUBo16WLheNkudCQJ/vTA5Te7iyg1oR+9Txn9bP/G99c
	 +k8O/V+vsXvzfyKHxtrmzOWhgVaLSdmua7trKrxO/lo8KZQ13V+lU06MYr30W7LhBZ
	 ImfU9HKjLmrBeZrQFuMnoThEhaNQt7644BQfRvVPlGb0Fnt3MHYY3OjFKjVM557Ukz
	 JTOdAdSNn4lDc/BCIvpsuwrpMYBeSXj9cJkPBsoNBoy9w/82GTOxuJFsGktGfL92h3
	 MmesNqdyz1JWjcyV2bEh2b0+oMiiH9fNKIHeBKn0OXYKC/lxqzkDOFWwDbDTW41Xzm
	 WgRc9plEf3aLg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:1dad:60e8:7174:bd20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C900217E1513;
	Wed, 14 Jan 2026 11:09:29 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-media@vger.kernel.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v12 4/6] media: verisilicon: AV1: Restore IOMMU context before decoding a frame
Date: Wed, 14 Jan 2026 11:09:16 +0100
Message-ID: <20260114100922.149187-5-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
References: <20260114100922.149187-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020933_307626_6C4FA5E0 
X-CRM114-Status: GOOD (  10.10  )
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

AV1 is a stateless decoder which means multiple AV1 bitstreams could be
decoded at the same time using the same hardware block. Before decoding
a frame it is needed to restore the iommu tables to avoid mixing decode
contexts.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index af854b149f35..ca159bcc3f76 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -5,6 +5,9 @@
  * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
  */
 
+#include <linux/iommu.h>
+#include <linux/vsi-iommu.h>
+
 #include <media/v4l2-mem2mem.h>
 #include "hantro.h"
 #include "hantro_v4l2.h"
@@ -2095,12 +2098,24 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
 }
 
+static void rockchip_vpu981_av1_restore_iommu(struct hantro_ctx *ctx)
+{
+	struct iommu_domain *domain;
+
+	/* Before decoding any frame iommu context need to be restored */
+	domain = iommu_get_domain_for_dev(ctx->dev->v4l2_dev.dev);
+	if (domain)
+		vsi_iommu_restore_ctx(domain);
+}
+
 int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *vb2_src;
 	int ret;
 
+	rockchip_vpu981_av1_restore_iommu(ctx);
+
 	hantro_start_prepare_run(ctx);
 
 	ret = rockchip_vpu981_av1_dec_prepare_run(ctx);
-- 
2.43.0


