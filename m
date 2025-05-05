Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97751C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 01:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QbD6O4tUR9o9Qrmh7M0+lTeoprT4L6wOl6jUY50Tv4A=; b=kP4v5wtnz80X+kDvDsqCNVNmeL
	X0YIprjUnRfxq61yK1/+Y330rdjXco9pnQAVww3p67K4XsGNr9EVFXhtgw5S9eqXD78D3Hfqs98O7
	u3bvgnZF5rmKY4x8ZBLKRUcIZzfRv+Du8VAvdmmvgwtVbS2S1dePBzczW6H7ZJbNdT/xkU6KaKHb/
	4g+ED+1oMpTCCOXSQjsdomCHWGlQWsLXcDlT89DF4HJ0xZnu03nsMo5zh1sV0JO0pNQOyuX7ApJiy
	EaR25xz9m2OimG+vFSgmdPx0hyBmSgxshoAnneTO4EusoF5z6Vq5x1hW5YGsWm5fsYTw6MaThvAJy
	4+icnStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7JA-00000009ZIp-3W3f;
	Tue, 06 May 2025 01:41:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4am-00000008rW4-0vGw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:47:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A8E743EAF;
	Mon,  5 May 2025 22:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED419C4CEE4;
	Mon,  5 May 2025 22:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485239;
	bh=ibdy/rtIaou04q3IrNpDo1noO5Avp/t2atPZu9N7z+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Omo0CiHWdBxm11fRMEf6gFqOBHMDylgYa6rhaWJ9M+PGVqOvkECYjm57KlYK+GLtj
	 +0YdSaofWdy2xU8nVw4sOoF7GtSczxCBVFmKGcah93dGqEoKKNhCfu6SvsBF1+r2K1
	 Ep1DW17oepupKbLshB+lk5X8Pj3qskr37L7uuWxtY0X1w9bGxzHzMleHqeDCHxgiZ2
	 Xos53BNmxjz/B2UZdc2OWTjde94Nfc7u+lukcsTAwnjdoDdc08rvwaIg8OSdzjMeDk
	 w3eGv7aORB5IzAwbEPT4vf1u6MwjsMfDj+gVU2J6uVIZ24EbNWHbMGB5m6Mi5hIGDF
	 tVAa3D4KCBIeA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Sasha Levin <sashal@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 229/486] soc: apple: rtkit: Use high prio work queue
Date: Mon,  5 May 2025 18:35:05 -0400
Message-Id: <20250505223922.2682012-229-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_154720_280501_6A09F444 
X-CRM114-Status: GOOD (  10.94  )
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


