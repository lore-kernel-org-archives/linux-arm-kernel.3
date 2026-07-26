Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C227C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w7ezX4C/wGAqydZ3rjVOYg1UaOyU792jCLsACA+4PUc=; b=Wyhj74KhhhCCNOpCOLL9gvhXE6
	mMh0Cu5D05V5d8MN+huw/Ppe5Q82w/QIYpOHntZC1L3xBtWX98ASKtnjcuVGKie+07zuNPbxiBi+G
	S361VV6ig4nyxvier3G6su0FK9L6F9ozmZYdwwuZrIyZjRsXh6yvSWDgTP+pB67S2EqSx+amDyAFe
	mWOpzkjq4aV5jv2BvyCrnHYfhLHd58zw6rU7ySD5mSK3qTZGci0FyuVMg3Pl7WrsxLec7IH0G158m
	A3ZOfPJzmru05MGp6EtAJLGe/UhHRaNs1bJ1ee2K0QDL2oU/r+JsdSqfX7XiVZa0C5F8XuqaTGJvd
	Esi7K3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnw2B-000000014Ub-07QC;
	Sun, 26 Jul 2026 10:24:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnw28-000000014UF-408O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 10:24:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F63441615;
	Sun, 26 Jul 2026 10:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F731F000E9;
	Sun, 26 Jul 2026 10:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785061476;
	bh=w7ezX4C/wGAqydZ3rjVOYg1UaOyU792jCLsACA+4PUc=;
	h=From:To:Cc:Subject:Date;
	b=GJdhuH4777ig2dUVqgkkTaSZmAquwy6SyvZlDbTvX5ZDSi87gQM0tEivm+/GYbBqf
	 OlzgptwuvyFwbfwbQqielJKoGbpsVCcn4RS9BLbIB+opHZPgSMRynnN4+PFTM/fRE7
	 PHKm3dSdgfimer4DhxzQANVAnHcFeH+41q1RA1hrk85X/zByYXCsFIHfjEnRd94tg4
	 mJT8dAcGrw24+LE8Ue9lPRYnIJaXzC6lDK6MQ1WFGOUqOOUAJKt2SXBmjVFVxfaMND
	 gnHvRbFCOlV7zJOYyZjAcGkDIMxqwfbWk2qsaEYlUKdTSz5jXHH2/ACxu4ZD4jnSTG
	 nd48MB4VXr+/Q==
From: Vladimir Zapolskiy <vz@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dmaengine: imx-sdma: Remove unused imx_dma_is_ipu() inline function
Date: Sun, 26 Jul 2026 13:24:24 +0300
Message-ID: <20260726102424.547951-1-vz@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The last user of the inline helper function imx_dma_is_ipu() was removed
by commit bfac19e239a7 ("fbdev: mx3fb: Remove the driver") a few years
ago, and this helper also can be safely removed.

Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
---
 include/linux/dma/imx-dma.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/dma/imx-dma.h b/include/linux/dma/imx-dma.h
index 76a8de9ae151..16e491f63883 100644
--- a/include/linux/dma/imx-dma.h
+++ b/include/linux/dma/imx-dma.h
@@ -57,11 +57,6 @@ struct imx_dma_data {
 	int priority;
 };
 
-static inline int imx_dma_is_ipu(struct dma_chan *chan)
-{
-	return !strcmp(dev_name(chan->device->dev), "ipu-core");
-}
-
 static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
 {
 	return !strcmp(chan->device->dev->driver->name, "imx-sdma") ||
-- 
2.51.0


