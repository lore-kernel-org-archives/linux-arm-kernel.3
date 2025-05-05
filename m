Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCAAC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 02:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RKL1hIeGOgKCbGdYLmX8VRpAvJI9qdabGIaF/yzg4Q=; b=uazp3D4GTNQTVsD3ZlDZmUVYmn
	iqPAjWtpZgbRYNTZ35gVR9305RP3m+7Nub0aLpwjV881yj4Z+65rSZrwFnx97oQA94sveIGc/mJ8p
	7mqVFS/eGI2IAEIAax9d3iLQgZaVO8pQVWqvwX47M9qgatG8ChMK2/PR3qgBaMCwe8b3ntzLb1bt/
	J+HLJqyY40wX/AwlJ9i+Lqc5zGkWoXK9yHoEU+Y3uVp+ThqJlGq7W8pZKZkn8BnnEUC9N1vbsU4Pu
	Ol5m8QthdbXD+6Y2NYJ1Ojxt16waMWkGRoL100oEogXGMh5z9SYti98uHwvpDJ9+YqLYFit2OxkOG
	LspcpS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8Rx-00000009rM5-25UV;
	Tue, 06 May 2025 02:54:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4o8-00000008vp6-1hnn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ECCBF629D1;
	Mon,  5 May 2025 23:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAEFC4CEF5;
	Mon,  5 May 2025 23:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486067;
	bh=5yO9rPWl3hIFnTuUWhLDF/4xFnNTBhL48tCp6o5L4sc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rgMepI4F+tf4SB4itda1omNx27oY6rJpuHNxoqvTeL3pDWl8aYDODTaHfyATrhEYX
	 E6p1Qimna5dmVMgPRG4914FQ7sBtWoYp9arztd5eYlZwMR9J85pZOhkqIecD//XgVn
	 bUvmr7HzTRgBmR5a1jxtBuNZuSdq6xRpBAxfxoTqKE/wz7FEucK0WqzDZaN9Sc0J7k
	 WilZZQDRI17GLk9l+88W1kwyRoubY7bPg4rO4KNPXPOr1Qe3bJ3fBnRtX9zCqTNb7s
	 QVhW86HhsmbKl079xFbH2mDjKEHHtMcvAfB0j3D+rpGXJ1SilfJ4fIfYBiDF80u4dP
	 VepnWYktqsZYg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Sasha Levin <sashal@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 137/294] soc: apple: rtkit: Use high prio work queue
Date: Mon,  5 May 2025 18:53:57 -0400
Message-Id: <20250505225634.2688578-137-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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

From: Janne Grunau <j@jannau.net>

[ Upstream commit 22af2fac88fa5dbc310bfe7d0b66d4de3ac47305 ]

rtkit messages as communication with the DCP firmware for framebuffer
swaps or input events are time critical so use WQ_HIGHPRI to prevent
user space CPU load to increase latency.
With kwin_wayland 6's explicit sync mode user space load was able to
delay the IOMFB rtkit communication enough to miss vsync for surface
swaps. Minimal test scenario is constantly resizing a glxgears
Xwayland window.

Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Link: https://lore.kernel.org/r/20250226-apple-soc-misc-v2-3-c3ec37f9021b@svenpeter.dev
Signed-off-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/apple/rtkit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index d9f19dc99da5e..b9c5281c445ee 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -744,7 +744,7 @@ struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
 	rtk->mbox_cl.rx_callback = &apple_rtkit_rx;
 	rtk->mbox_cl.tx_done = &apple_rtkit_tx_done;
 
-	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_MEM_RECLAIM,
+	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_HIGHPRI | WQ_MEM_RECLAIM,
 					  dev_name(rtk->dev));
 	if (!rtk->wq) {
 		ret = -ENOMEM;
-- 
2.39.5


