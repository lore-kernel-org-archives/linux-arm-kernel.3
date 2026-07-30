Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCB2C54FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7D+xutFpqSSg5uUi8QN36v5qhOBFCRAD67A2wtKPrg=; b=DsyXl1cKetoeQzIWR9bqcI23f+
	IIqq0HK0rh/ipB/U/0ya52lqBSjBDY1lUARO0/e8tcg+T3Yzy2kkGN46Vh+hObKjju0q3zlLpcg1L
	PXP7AOm8qu0Ja3244vMug23AXbO0qgELPxRkPP+Em9dbHFr2h8RRifGAMeBh/s5Gh3D2BVbWxDnPL
	a66lyi/5QECt48FZhZxPoreeP91ij/uG3bTaEom2Ea9KOCDFpg2GXXTlVMLJb7Aiasp/rdgKKBldb
	rPPtLHlvqe5cgPpZ+crIIgt6WPJ2ZHbEZdympmKWXRe78XtUPNBTDfqOoNe32v3lWnTAY2V9oD93b
	R6K0vMcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMdI-00000009wXM-1wB8;
	Thu, 30 Jul 2026 09:00:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpMdF-00000009wW6-27cV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 09:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785402046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r7D+xutFpqSSg5uUi8QN36v5qhOBFCRAD67A2wtKPrg=;
	b=Vs6XX+n1ib81rr5HS6uImNxHAFQJm0VeVNAC96snsVfV49gqN9oLEhxOe1Bsp4pYOA44kU
	JlRlrIp0tDgX7wg0usq5Vl1HCcXpOQxyiScccFAaPle1tsFA/yA04FjNrMlVRiSxPCKyaI
	nj+Qji0DicHa+0tVhKO2+bLcjBFRkGA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-jFgMNW4qN6eqwqljLpwPDQ-1; Thu,
 30 Jul 2026 05:00:43 -0400
X-MC-Unique: jFgMNW4qN6eqwqljLpwPDQ-1
X-Mimecast-MFC-AGG-ID: jFgMNW4qN6eqwqljLpwPDQ_1785402041
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 963F51800350;
	Thu, 30 Jul 2026 09:00:39 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.174])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 347DC30002E9;
	Thu, 30 Jul 2026 09:00:33 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: hujy652@gmail.com
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sujuan.chen@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3 2/2] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Thu, 30 Jul 2026 11:00:30 +0200
Message-ID: <20260730090030.201100-1-pabeni@redhat.com>
In-Reply-To: <20260724172040.1653-2-hujy652@gmail.com>
References: <20260724172040.1653-2-hujy652@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: _AmaKOv1XoGdCDTgk6u4MMSsBF33f3EwOjfLaVcQ1cY_1785402041
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_020049_634932_691862F0 
X-CRM114-Status: GOOD (  18.95  )
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

From: AI Reviewer <ai@example.com>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/
---
--- Patch [2]: [PATCH net v3 2/2] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986 ---
commit 30cd2d1bc8bf876e5d201d631684431920a3f165
Author: Zhi-Jun You <hujy652@gmail.com>

net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986

This commit fixes an issue on non-DBDC MT7986 where WDMA_RING_TX(0) is
never set up because idx is 1, even though it is required for WED RX to
function. It addresses this by explicitly calling mtk_wed_wdma_tx_ring_setup
if the WED version is v2 and rx_ring[0] is unallocated.

Link: https://lore.kernel.org/r/20260711112128.971-1-hujy652@gmail.com
Link: https://lore.kernel.org/r/20260630144831.1109-1-hujy652@gmail.com

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
[ ... ]
> @@ -2334,6 +2334,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
>  		if (!dev->rx_wdma[i].desc)
>  			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);

[Severity: High]
This is a pre-existing issue, but does this code ignore the return value
from mtk_wed_wdma_rx_ring_setup()? 

If mtk_wed_ring_alloc() fails due to memory pressure, it returns an error
without configuring the hardware base registers. Because the error is
ignored, when DMA is later enabled in mtk_wed_start(), could the hardware
attempt to fetch from unmapped physical addresses and cause an IOMMU fault?

>  
> +	/*
> +	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
> +	 * but tx_wdma[0] is also needed for WED to function.
> +	 */
> +	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
> +		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);

[Severity: High]
Does this new call to mtk_wed_wdma_tx_ring_setup() also need to check its
return value? 

Similar to the RX ring above, if mtk_wed_ring_alloc() fails to allocate
memory, the hardware base registers won't be configured. Since the caller
proceeds to enable hardware DMA regardless, might this lead to the WED
processing descriptors from unmapped memory and causing memory corruption
or a system crash?

> +
>  	if (dev->wlan.hw_rro) {
>  		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
-- 
This is an AI-generated review.


