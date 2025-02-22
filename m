Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6997DC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 17:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sGKaI2k+KkLl87+2mb0NMkFA8nn7HVnQjKzh39Vowk=; b=D97/etpLyuT52+G/D0errzg+SL
	HPW26SXt9YfuUpF/mlUeU6d4wKQ4VbPp4tN1fa/0Pbmg82N2+mo4wOEExuu4dTnVh/MhABsCaNYuJ
	1vF0uo0heAkCr8Wp18t8ngDrJFYI8Yu6SaE8gX/2JG9+VyXosQRakmuMC4ayePQi7TcI3xB0qi4OE
	kJILYCmPEuUoez6qX/Rk4/g1Ip2hEUIy+R4f9m4h7YgItfcJwGZgIa+ekm5x4C7ydJtCfYg7dYlXw
	HN+D3ShC5SxZ9/WeJs2/YWHL2rTvmyeYc1RnsZPlR8clXzFlS/F0jRSP2kl79Wc8dvirlalTBWymF
	DWYTSf/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlsuV-00000008Q16-2Eyf;
	Sat, 22 Feb 2025 17:03:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlsoi-00000008PFh-3H1V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 16:57:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D33C75C5CEB;
	Sat, 22 Feb 2025 16:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AD36C4CEE7;
	Sat, 22 Feb 2025 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740243447;
	bh=4E8KhD8x9nt6C1IAI/uulttC6xS9rKz68kPnusPtVyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IR0MwCzvfmIZL8eUiDV1QqMiWvmrCmjjJHl+6/xJmYkMIi6nq9Nf8o1RUQUUPn63/
	 sgncXMDTM7FbL7g3m6vD+2p+VZJH0Mm6iNft1QWpQTW8go3AAkJbCftw7rnMBh9JQM
	 2PiJZsoaRsGDN7mPGPn55oNUOrQ0TxTFVOfpFMJ8zdf8BVWTmnQnTRIwmSqHKMULHm
	 RF5xfP0GCkhyOhAj/Sro6R3Mo6U56obAsb4CdbG6EEqiXdV37driDiRvOYGg7w44Ew
	 df25mBlOuFwA4TWTr7RSXpVVWhvtOrEVvW4CE4EpPM1irwILkKR0knFQIb3ZCg9sC1
	 3OflukA2MQUvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78667C021B9;
	Sat, 22 Feb 2025 16:57:27 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 16:56:48 +0000
Subject: [PATCH 3/4] soc: apple: rtkit: Use high prio work queue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-apple-soc-misc-v1-3-1a3af494a48a@svenpeter.dev>
References: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
In-Reply-To: <20250222-apple-soc-misc-v1-0-1a3af494a48a@svenpeter.dev>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
 Sven Peter <sven@svenpeter.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=OWy6VUyG9jq3qBr8MjUz+I6ziXX4V7f2D7Wm55EGjV0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/ouxs93H4hIZT5ne2ZQsWnBzGt3WbYyLkm8nxZQvHJJi
 4DX/Au3O0pZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQAT4U1k+O/RLcbryXjg/Orw
 veyqdwO/i2vNv+2wa53plXtfVQ0ObVdg+J+Zu85u58aTu2T9ZL9N+uusLjtTvX2O1EY591X+ItO
 5W1gA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_085728_876532_0AD3D9D1 
X-CRM114-Status: GOOD (  10.51  )
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
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/soc/apple/rtkit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 35734ae8c9ce..b7f4654c3341 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -695,7 +695,7 @@ struct apple_rtkit *apple_rtkit_init(struct device *dev, void *cookie,
 	rtk->mbox->rx = apple_rtkit_rx;
 	rtk->mbox->cookie = rtk;
 
-	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_MEM_RECLAIM,
+	rtk->wq = alloc_ordered_workqueue("rtkit-%s", WQ_HIGHPRI | WQ_MEM_RECLAIM,
 					  dev_name(rtk->dev));
 	if (!rtk->wq) {
 		ret = -ENOMEM;

-- 
2.34.1



