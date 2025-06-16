Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E14C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Acj1EGAFTyohMKuswlv6NYSLXITq3gI/r2mqlq2rlDo=; b=TzZK+6W3ohybGaU679E1IPaV4C
	Dvv32bBreXxYhOT1JknxlaQvGbqwnnb2xojBs/TPaDfxXxg9XECoGxfnRAS45m2o/aWW23G93EbPl
	8kFktYfbtdoow2KJAE2yWpIsTDq68J+WwZXIr1jIEyrv6siYnRP3P7PhCVpnvs+urrUtrcb1g2fbt
	KWQFdHFv1C2y1oxUdE6wf45MZ3TjQAIYYfBt+vpr3nug8/ZVi5NtKArXq3eKikw80xp1BWHUaxrGJ
	qN0FrxIlEKXND3NULJ5JUif+a36SpLmIi2RbCT0p6aunroN3ohSKu0uykn8RFLOP6mRysyx/2ixHe
	/6mBpsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLi-000000055Oj-2WaX;
	Mon, 16 Jun 2025 17:10:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBG1-00000004lti-1E3O;
	Mon, 16 Jun 2025 14:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750085776;
	bh=iAx8mzEEjM64kl3dReqUnCAxjjZTtPCO99ShqsJi2Qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=moaFefQzNAqyMxNFZCgYN7/ZIY2A3LlHEqJJ6rErfkLEiDIJsEQi2Yfp4kotwQcp+
	 QvwQJhKsC0De+iTa8FzHuGsLuCo9iVCVy8zseEFKbLpMHGKnXnFqOb4VIrgacktzBt
	 YdcvTsIGhQDxeGRnX541dW7kq/zej4dnrlxJmP4rWM99R2yOoG8D+pRJz037kxiKsh
	 XxSv/pMzunbcGctCR8K0iel2dQx8KbVN2Ibb5az8oVSKt1o87jFrb1tCrH1NadgkZh
	 J37uGjNXVr6h/gJhfRexk9Rw/1Ml8LtGSxlhbixd6H1eljmOvBa7WRflgvCQxkwVkm
	 avMTF2ntxanxg==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:4811:e81c:4b33:730c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D829717E35D9;
	Mon, 16 Jun 2025 16:56:15 +0200 (CEST)
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
Subject: [PATCH 5/5] media: verisilicon: Flush IOMMU before decoding a frame
Date: Mon, 16 Jun 2025 16:55:53 +0200
Message-ID: <20250616145607.116639-6-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_075621_473167_E7A57D59 
X-CRM114-Status: GOOD (  10.42  )
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

Flush the IOMMU mapping before decoding a frame to ensure that all memory
translations are properly applied.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 8542238e0fb1..5a672467d83f 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -11,6 +11,9 @@
  */
 
 #include <linux/clk.h>
+#include <linux/dma-map-ops.h>
+#include <linux/iommu.h>
+#include <linux/iommu-dma.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -186,6 +189,14 @@ static void device_run(void *priv)
 
 	v4l2_m2m_buf_copy_metadata(src, dst, true);
 
+	if (use_dma_iommu(ctx->dev->v4l2_dev.dev)) {
+		struct iommu_domain *mmu_dom;
+
+		mmu_dom = iommu_get_domain_for_dev(ctx->dev->v4l2_dev.dev);
+		if (mmu_dom)
+			iommu_flush_iotlb_all(mmu_dom);
+	}
+
 	if (ctx->codec_ops->run(ctx))
 		goto err_cancel_job;
 
-- 
2.43.0


