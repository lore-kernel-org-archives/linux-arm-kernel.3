Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3819BC3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbD6O4tUR9o9Qrmh7M0+lTeoprT4L6wOl6jUY50Tv4A=; b=WM27BJ8F+OH9iQvi3uETaPKgJd
	DD2RYk5OUba39gTYS9UHy0pMea2Ij42y74TZbOd35AtYz31k86fgVv/5hjzH7bT/tE736agKvuT0V
	KdaEiXzZb0T3KoUuZU8wpq059TbO+MhvwNoUiXpThg3clv3soW4cahOxZ0v+8CoXpQoOfwuWBr3Yt
	x+0+yDf4jKJMRBheYXNclZ5+h07dDSQnsX8oBjwEl+AVazq8fWTzR3c4JwusKvn4gpmYk5OgT2s9P
	wkaCIPORIKc9zSTqVQcMmQ4rBPu+7fLeNCK9+3nMgsBWdoOQFG2g9fTDh3DhMs/rZ3K6bLmHCOKuy
	SlMyYylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC5Ki-000000095T2-19yR;
	Mon, 05 May 2025 23:34:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4G6-00000008ks4-1Bid
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA6C3629C9;
	Mon,  5 May 2025 22:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F675C4CEEF;
	Mon,  5 May 2025 22:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483957;
	bh=ibdy/rtIaou04q3IrNpDo1noO5Avp/t2atPZu9N7z+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qCTZsPnZyaI0TQDf4PpQ2rvAJg9+mcoz9ebK0KvYAkU7U0jlKlO7G7YZaPXpS/oxI
	 FuMI7D0cIV4FeQPi8/x/rV92lyIVdnRAuOEv1ipU2MpJ/coOQxyCwx0oblRo4cNaft
	 AHjbxnVQ+QePcWzbpw+Z5zocafGQiiBQQBoLzxIc7fbAQE6bswTSHL/FF5Sc0QsRz2
	 QtPRQxqVvMlLSz03aU+7DB1uNpxcvUwGcDangHEudCEs7ImasE+3wLWzZfUaJKZ1ry
	 HaW7b3kRWO3ZFxaBhXuBCiE1nefP2qEUEEhVqdfn6k7cJMsQZTYEbQAHiNgF+GuHET
	 ygSBEHZZmH+Ng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Sasha Levin <sashal@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 290/642] soc: apple: rtkit: Use high prio work queue
Date: Mon,  5 May 2025 18:08:26 -0400
Message-Id: <20250505221419.2672473-290-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
index e6d940292c9fb..00d59a81db88b 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -667,7 +667,7 @@ struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
 	rtk->mbox->rx = apple_rtkit_rx;
 	rtk->mbox->cookie = rtk;
 
-	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_MEM_RECLAIM,
+	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_HIGHPRI | WQ_MEM_RECLAIM,
 					  dev_name(rtk->dev));
 	if (!rtk->wq) {
 		ret = -ENOMEM;
-- 
2.39.5


