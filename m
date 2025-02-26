Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F506C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jGSlBB34hRHaPv51krGcYZaEY8Q/KH+7U5Sj4/jSAA=; b=3MNZZm4yY0Zvrb6PKfwnR+gLYi
	ZpmDaGi/JXHYxWDzswmYIRAdRCw1gmHJN8QlmJqXBSJHfGBocolNjWR4a8IOFS1DuSx+vK0OTdOHS
	UpI8y6oS7WMDGqIw3qbYE4FWXSpSun8mJcmhyqrTHyYILpa5Bl+kzlntXpIqtfpA//0e9o3Ya3OfI
	Qhv7/j8JWKUBrBe9fRMhIdLBbh/PJFnPsWLFPFLdxiArMCk0ywPwKwwpGs+98cz3VyfMRwiqU2sN0
	j9fGM2iPcA1KHb5FnniaFmME7olZmnBtJdb6vWaE1r5Dq5OzV7S1BmljKBhS+zb20s6ZVEkZX1aAf
	w9tXS/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMiO-000000055YH-0oAS;
	Wed, 26 Feb 2025 19:05:04 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnMdl-000000054cC-3Fyp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:00:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4889D61518;
	Wed, 26 Feb 2025 19:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0313C4CEE9;
	Wed, 26 Feb 2025 19:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740596416;
	bh=efHDZc+VZMO22pyTz8bbQ9t4hJW8gBFp6rwM21UYaFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EU9j0MnRwNITYvf2vonhEdW+AF/04yg+zg83Laf8oCZOio0b3At/PjT12zGaunr/Z
	 zojBhs71rA9JH1hn4TXzI/vWIKoHZ0Ojaftr36PxqV1JxyY7zfbWB/0M27f5C6yHhW
	 DItVmuXkrOJwPvwyaEyvjXFhLFQu0E8MxngF4++2EznzWdzonwiLu6Ae8UfX5ToSY0
	 zX3q9N4hmWJiluYsETNGD/ls5zckpYgHdHln+FYGZwsABsxZ92lY+EsDPleHedbrg9
	 9GJhyKGlXKkIbMlBXbmYFKzJ8im1AJhdoiGAgBhrgfBwVU4nUniuCZivUoVeP1IJX6
	 eL8xlmxogW0BA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CFFC19F2E;
	Wed, 26 Feb 2025 19:00:16 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Wed, 26 Feb 2025 19:00:05 +0000
Subject: [PATCH v2 3/4] soc: apple: rtkit: Use high prio work queue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-apple-soc-misc-v2-3-c3ec37f9021b@svenpeter.dev>
References: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
In-Reply-To: <20250226-apple-soc-misc-v2-0-c3ec37f9021b@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=iv/ffBDDwqiEAfuhFDw9qjf225eWoJ8zsBxA5fDCkeQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/r+lL3ym1uNXD12Pz7lKsp732r7wsbyZdIKzy6Lftwfw
 eaf9uddRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiC7sY/vD822NWt4O9RlY2
 wcvXTDr+S7PNTd2k+712/2q0l3nUpjD8FT3rNT9ZiCOGR6NbYEdr/lO/0+uE3L93uGoteFP0XU2
 VEwA=
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Janne Grunau <j@jannau.net>

rtkit messages as communication with the DCP firmware for framebuffer
swaps or input events are time critical so use WQ_HIGHPRI to prevent
user space CPU load to increase latency.
With kwin_wayland 6's explicit sync mode user space load was able to
delay the IOMFB rtkit communication enough to miss vsync for surface
swaps. Minimal test scenario is constantly resizing a glxgears
Xwayland window.

Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/soc/apple/rtkit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 7e7b4f64ab17..4b78463dd5a1 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -696,7 +696,7 @@ struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
 	rtk->mbox->rx = apple_rtkit_rx;
 	rtk->mbox->cookie = rtk;
 
-	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_MEM_RECLAIM,
+	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_HIGHPRI | WQ_MEM_RECLAIM,
 					  dev_name(rtk->dev));
 	if (!rtk->wq) {
 		ret = -ENOMEM;

-- 
2.34.1



