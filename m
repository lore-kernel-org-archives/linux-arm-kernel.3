Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B994DC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3EVl9VIpKH4edXMibuTUpBAtybVGeUQZleSxZQTDrk=; b=I+O9aR/H2ZJs9PKNbQvfTb/dBr
	rlSzBfGJYMgDufwrfUEZ22rVtfxg4neshgV08Q/lmdW3usBivIMYVRXIWK4pF5Obf0Www2uIj2Ets
	npev0BCK8d5p/++R9frhRuN1L6ew7oi/qVi46tiDVZDJhu2Nc1gZJBUM6ND+nYGzFA9YB6GYm2JKw
	JtGUnCo3HmjrUs9kCAlxvQ+XHvNv0A4iAT1h9SGMDptoWiVrrGdKOybliPp6fVgJeVtcRYvda0Pu7
	iXbpCTI383SNUtzrHP8rEe8YYTgejDxov88howc0dt1epzPnp8TBP1Wde2q51gHPbesaDxszTM39Q
	Bs9aMrUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYOn-00000009PXd-29zw;
	Wed, 09 Jul 2025 17:16:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWEM-000000094UM-10sn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:57:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A512F44F50;
	Wed,  9 Jul 2025 14:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 792ABC4CEF6;
	Wed,  9 Jul 2025 14:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1752073025; bh=ImDgPg2/JzwFt9Jc7QkkgiYZwTTl0nxtFtgT+n58JK0=;
	h=From:Date:Subject:To:Cc:From;
	b=QlDlTYK78/m7h0W9zCuXakttEwJ4FExS/ua3FN9f+h1A42bYAo3ELPzHB6CxMOWzG
	 EjQbsaq94wwzqjzvuZ97YWzPP03J2CnaXPvSWwfRCDw7tDRj0fffW9I14f7WJH7UhL
	 XzdgA6OeO8uu66VIEDvn9NnRqaUWHWq7z4DDvO+o=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0ADC83F0A;
	Wed,  9 Jul 2025 14:57:05 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 09 Jul 2025 16:57:03 +0200
Subject: [PATCH] media: nxp: imx8-isi: fix streaming cleanup on release
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-imx8-isi-release-fix-v1-1-c47c659ce1a6@linux.dev>
X-B4-Tracking: v=1; b=H4sIAD6DbmgC/x2MSQqAMBAEvyJzdiBGxOhXxEPQVgfcSEACkr87e
 Kymul6KCIJIffFSwCNRrlOhKguaNn+uYJmVyRrbmNZ0LEdyrBoH7PARvEjiylnMgPOoLen1DtD
 5zw5jzh9kkIZNZgAAAA==
X-Change-ID: 20250709-imx8-isi-release-fix-182edee8ae32
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752073024; l=4824;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=ImDgPg2/JzwFt9Jc7QkkgiYZwTTl0nxtFtgT+n58JK0=;
 b=xYpJrqbKcrpcFVR42vsMBBvZHktNZ2HTww5a6d9d96WIinoHhl+FZ6V5LlsrBlCwq+jXpVqOo
 sbtEDW9DqJKC6DhWybn+Eu35EWd9BGUYz7ZFQ1AKZ6Mg2gC2kayKxHP
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_075706_460096_08F31253 
X-CRM114-Status: GOOD (  15.73  )
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

The current implementation unconditionally calls
mxc_isi_video_cleanup_streaming() in mxc_isi_video_release(). This can
lead to situations where any release call (like from a simple
"v4l2-ctl -l") may release a currently streaming queue when called on
such a device.

Address this issue by calling mxc_isi_video_cleanup_streaming() only if
the queue owner is NULL (which is set by vb2_fop_release() when called
by the current owner).

This was reproducible on an i.MX8MP board by streaming from an ISI
capture device using gstreamer:

	gst-launch-1.0 -v v4l2src device=/dev/videoX ! \
	    video/x-raw,format=GRAY8,width=1280,height=800,framerate=1/120 ! \
	    fakesink

While this stream is running, querying the caps of the same device
provokes the error state:

	v4l2-ctl -l -d /dev/videoX

This resulted in the following trace:

[  155.452152] ------------[ cut here ]------------
[  155.452163] WARNING: CPU: 0 PID: 1708 at /drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c:713 mxc_isi_pipe_irq_handler+0x19c/0x1b0 [imx8_isi]
[  157.004248] Modules linked in: cfg80211 rpmsg_ctrl rpmsg_char rpmsg_tty virtio_rpmsg_bus rpmsg_ns rpmsg_core rfkill nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables mcp251x6
[  157.053499] CPU: 0 UID: 0 PID: 1708 Comm: python3 Not tainted 6.15.4-00114-g1f61ca5cad76 #1 PREEMPT
[  157.064369] Hardware name: imx8mp_board_01 (DT)
[  157.068205] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  157.075169] pc : mxc_isi_pipe_irq_handler+0x19c/0x1b0 [imx8_isi]
[  157.081195] lr : mxc_isi_pipe_irq_handler+0x38/0x1b0 [imx8_isi]
[  157.087126] sp : ffff800080003ee0
[  157.090438] x29: ffff800080003ee0 x28: ffff0000c3688000 x27: 0000000000000000
[  157.097580] x26: 0000000000000000 x25: ffff0000c1e7ac00 x24: ffff800081b5ad50
[  157.104723] x23: 00000000000000d1 x22: 0000000000000000 x21: ffff0000c25e4000
[  157.111866] x20: 0000000060000200 x19: ffff80007a0608d0 x18: 0000000000000000
[  157.119008] x17: ffff80006a4e3000 x16: ffff800080000000 x15: 0000000000000000
[  157.126146] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
[  157.133287] x11: 0000000000000040 x10: ffff0000c01445f0 x9 : ffff80007a053a38
[  157.140425] x8 : ffff0000c04004b8 x7 : 0000000000000000 x6 : 0000000000000000
[  157.147567] x5 : ffff0000c0400490 x4 : ffff80006a4e3000 x3 : ffff0000c25e4000
[  157.154706] x2 : 0000000000000000 x1 : ffff8000825c0014 x0 : 0000000060000200
[  157.161850] Call trace:
[  157.164296]  mxc_isi_pipe_irq_handler+0x19c/0x1b0 [imx8_isi] (P)
[  157.170319]  __handle_irq_event_percpu+0x58/0x218
[  157.175029]  handle_irq_event+0x54/0xb8
[  157.178867]  handle_fasteoi_irq+0xac/0x248
[  157.182968]  handle_irq_desc+0x48/0x68
[  157.186723]  generic_handle_domain_irq+0x24/0x38
[  157.191346]  gic_handle_irq+0x54/0x120
[  157.195098]  call_on_irq_stack+0x24/0x30
[  157.199027]  do_interrupt_handler+0x88/0x98
[  157.203212]  el0_interrupt+0x44/0xc0
[  157.206792]  __el0_irq_handler_common+0x18/0x28
[  157.211328]  el0t_64_irq_handler+0x10/0x20
[  157.215429]  el0t_64_irq+0x198/0x1a0
[  157.219009] ---[ end trace 0000000000000000 ]---

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 8654150728a8692b480cfbfebdc0f2596c172a00..bf1b6bd42ef77c98fdacba7bff3b5dd6c048883f 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -1207,6 +1207,11 @@ static int mxc_isi_video_streamon(struct file *file, void *priv,
 	return ret;
 }
 
+/*
+ * Stop streaming, discard buffers and release the pipeline without further
+ * checking if we are or there is any queue owner. This function asserts the
+ * &video->lock is held.
+ */
 static void mxc_isi_video_cleanup_streaming(struct mxc_isi_video *video)
 {
 	lockdep_assert_held(&video->lock);
@@ -1333,7 +1338,11 @@ static int mxc_isi_video_release(struct file *file)
 		dev_err(video->pipe->isi->dev, "%s fail\n", __func__);
 
 	mutex_lock(&video->lock);
-	mxc_isi_video_cleanup_streaming(video);
+	/* cleanup streaming if there's no queue owner (if we were queue
+	 * owner this was cleaned already by vb2_fop_release())
+	 */
+	if (!video->vdev.queue->owner)
+		mxc_isi_video_cleanup_streaming(video);
 	mutex_unlock(&video->lock);
 
 	pm_runtime_put(video->pipe->isi->dev);

---
base-commit: 733923397fd95405a48f165c9b1fbc8c4b0a4681
change-id: 20250709-imx8-isi-release-fix-182edee8ae32

Best regards,
-- 
Richard Leitner <richard.leitner@linux.dev>



