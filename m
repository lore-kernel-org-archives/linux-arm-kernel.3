Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nPGr0axx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UP6BVeMQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qT+CO1ROEeD8xYhFaFdRagN6Eagy/YoQJaHT5lWNYnU=; b=nPGr0axxHp1qKK/bj2M6QohIye
	tQsVleOxB/ChyOuZERT5th/nUpAsoYwLnCUFMSLMjyOxv4mrV2jGAO9ZSs4IgHImI97sXePBkzqI5
	HTv9mjhBM0vdYnLrgsiGaT5l68TRiM2vPNhwGJgRWeBCLdGiWjZFq9XTGKI9VbNqpJau3kk/9U+do
	ojWFmsIOKiLCFeyIpIhfGcgfN8ceC5VBepzhykLyHVkPZBufGSwvFId1sjccrbfyRf06lf9qwVmWv
	+3csuiMsLRCve7vR9nLMsf9hjALKx56krInjus4c7PVEcnM2qhJfGXXmVpghl2JXn7H73FvYBXM5A
	5T5mWXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFsc-0000000BedC-1vEY;
	Fri, 06 Nov 2026 09:05:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFsa-0000000Becf-1jec;
	Fri, 06 Nov 2026 09:05:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E92EE40507;
	Fri,  6 Nov 2026 09:04:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793955899;
	b=oB/QY+Twf7ojXQIw1F874QykmP79dBheCUKaLOST4To+L+vBf98MTReTHVBnmMqSoJ3a
	 AlSMCFAgsA9y84THnhSpGZ3ONJRxAsGziKsVs4GbVdkb8m8E3DFoIaznHWRz+hbcfPfgY
	 wDPXyKJ/G7UJdppBI+HNOD5yAcp5ghzSalm9uJRQ32ngc/Dx/NovciVSwnPuwb9Joq1XU
	 lAk4Y+2fL3xJSuT9pKaA4FPA36rspHDcBPwEC6jx60IEvAztfaZwQGduwZ1T5bQne2vSX
	 tDhMdw9bT56kpvU+/fgFYC260qE1mklONsywaNd1pfO/+PdpazdIcNZZKOhHHMB4lBQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793955899;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qT+CO1ROEeD8xYhFaFdRagN6Eagy/YoQJaHT5lWNYnU=;
	b=ejrZlZcLwgG7Vjl1Ib/D1X3KnZT4PjzvSDvXrjNp48063jliNQF6Vkrmp5efHIdwRwFS
	 oqBLfD5eRxRCFkhmfsjpTQNdyJQLTp7ozk4c6PvxS+ekLyBiVugJSVNcLDwJeq5+KqPjf
	 ondEKvvx6WYg55KQ8gFYmQGlQNMrrBUFc91fNNGo9Xvnc0qezadHWmALnAYujsqskyaDw
	 RpSGZyZjux/u0QY2x+R+doRXhdWpEIgC6mDeJwp3fHgPLmersFVNSXfZ/fy/IxQGNNmV8
	 QfKKF3qlqzAfVeCCCGz48e6FfuOfjpdYDSAFlJsD4c6UgjD6mXFiHVCmC2bmyyqT26g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3CFEB1F008A1;
	Fri,  6 Nov 2026 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793955899;
	bh=qT+CO1ROEeD8xYhFaFdRagN6Eagy/YoQJaHT5lWNYnU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=UP6BVeMQrXnZ9e7n9eNiUOoZefgA7bnoSPeCticKzRkbs5qvWQ83UoUH/GoanCPr6
	 Ggi+wtftll8RbBHZSZxJcgVr32Q0rMV3eGMcMJtjfXCwb8HNLbYVkxipUBf+50ABwy
	 rcB+qR2Ao/TU0T5jci0iZYf6uUlknv8052eNkxQ0WjjAbQe3+fyJ4rBWqaehXGIcsV
	 gtQZLQwS8vtJY/8MrCz0xh5+LYgghRJ9xbQzB5cNY+CaHhXAIp2kWfvhGeGAWWiAS7
	 yEIJplzLU7tmTsTgq6s8xD1rB5necoWtW/4pT49ev+MY1YageVy6rX9AITL0C+EbMQ
	 yOee1oD3ahcAg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C3A0145B3F;
	Fri,  6 Nov 2026 09:04:58 +0000 (UTC)
From: Sergei Khomenkov via B4 Relay <devnull+shomenkow.gmail.com@kernel.org>
Date: Fri, 06 Nov 2026 12:04:56 +0300
Subject: [PATCH] media: verisilicon: suspend the device before
 unregistering it on remove
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261106-hantro-remove-v1-1-d0a4678886d7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7TlAPgn0lOqittYc01ohA/HvSc
 QZmGlRkwgqzaMD4UKWSB+hJQDx83lHSNhiMMlZrZeWQNxfJeJYHpfMpRBes0snBaC7GRO//W9b
 eP1YuNu9fAAAA
X-Change-ID: 20261106-hantro-remove-9afbc9b601f9
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Frank Li <Frank.Li@nxp.com>, Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793955898; l=3507;
 i=shomenkow@gmail.com; s=20261104; h=from:subject:message-id;
 bh=xS7oIoyimsaMRzqUpXTDBfcEIedzp94Ticoi5FpW/N4=;
 b=UveIQ1ueDQ9B30eFN2EHpuRf6itGbRtnVmhgM4utBXIjk1hHI0f0mylWYoYHySNVftCf9fxIi
 JL/Cv/6DmByCniakqQ9eDo0+UfNchjMmlWUmP1CQB8cNP+9XSUhhTR4
X-Developer-Key: i=shomenkow@gmail.com; a=ed25519;
 pk=FwuHDVe7aiISDMLmQEcMC+RflEIJ6kEp/ekwznWXmI8=
X-Endpoint-Received: by B4 Relay for shomenkow@gmail.com/20261104 with
 auth_id=1409
X-Original-From: Sergei Khomenkov <shomenkow@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shomenkow@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Sergei Khomenkov <shomenkow@gmail.com>

The clocks are enabled and disabled by the runtime PM callbacks.
hantro_remove() calls v4l2_device_unregister() and clk_bulk_unprepare()
first and only then pm_runtime_dont_use_autosuspend(), which suspends
an active device right away. By then v4l2_device_unregister() has
cleared the driver data (it points to the v4l2_device, the first member
of struct hantro_dev), so hantro_runtime_suspend() dereferences NULL.

The device is always active at that point: the driver core resumes it
before calling remove(), and its put only starts the 100 ms autosuspend
timer. So every unbind and every module unload, with or without a
decode before it, gives an "Unpreparing enabled" warning for each clock
and then that oops.

Stop runtime PM before the unregister and the unprepare. If runtime PM
is forbidden through sysfs (power/control set to "on"), the device is
still active after that, so disable its clocks and mark it suspended by
hand.

The probe error path unwinds in the same order. It can only hit this if
a job runs between the encoder node registration and a later probe
failure, so it is left for a follow-up.

Found with an LLM coding assistant while porting mainline Linux to a
Rockchip RK3026 board (G1, ID 0x6731); the assistant also drafted this
change. Tested on that board. Without this change, unloading the idle
module (runtime status "suspended") gives the warnings and the oops.
With it, the idle module unloads with no warning or oops, and so it does
right after an H.264 or VP8 decode with the autosuspend delay raised to
10 s through sysfs; the clock enable and prepare counts are back to
their values before the load. The same holds with power/control set to
"on", over three load, decode and unload cycles on one boot. kmemleak
reports nothing after five load, decode and unload cycles. Built with
W=1 with and without CONFIG_PM. Not tested on other SoCs or with a
power domain.

Fixes: 556ab0b2741d ("media: hantro: release runtime resources when device_run fails")
Cc: stable@vger.kernel.org
Signed-off-by: Sergei Khomenkov <shomenkow@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 26e5d5547466..8af47375d471 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1286,10 +1286,16 @@ static void hantro_remove(struct platform_device *pdev)
 	hantro_remove_enc_func(vpu);
 	media_device_cleanup(&vpu->mdev);
 	v4l2_m2m_put(vpu->m2m_dev);
-	v4l2_device_unregister(&vpu->v4l2_dev);
-	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
+	/* Suspend first: v4l2_device_unregister() clears the driver data. */
 	pm_runtime_dont_use_autosuspend(vpu->dev);
 	pm_runtime_disable(vpu->dev);
+	/* Runtime PM forbidden through sysfs: the device is still active. */
+	if (IS_ENABLED(CONFIG_PM) && !pm_runtime_status_suspended(vpu->dev)) {
+		clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
+		pm_runtime_set_suspended(vpu->dev);
+	}
+	v4l2_device_unregister(&vpu->v4l2_dev);
+	clk_bulk_unprepare(vpu->variant->num_clocks, vpu->clocks);
 	reset_control_assert(vpu->resets);
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261106-hantro-remove-9afbc9b601f9

Best regards,
-- 
Sergei Khomenkov <shomenkow@gmail.com>



