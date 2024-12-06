Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23815E77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U9hkTuJbGE7hIFsagAaGCZFpFPxgQR0ImXZs7Gg/g5k=; b=KeVxxey2Gf2VpewFyTAUnZIBGt
	E9n5RYWU3BwYo5Fd9BRHgVaShWHvF4XYUquVhkxo/IKYe/VgkPi9g14iF24PWDyY4FAmg2QdmcVhe
	GrNXF/u9FYTrbc/fjZbiSUMqkZxlw1Me/uoclNgQMAlRuMRNAG5VINEdNSGUwsPpkhC3zR0zAi60a
	2vNPW4UoOQkFHtGIxdKCem19tN/vCjTLB8p5SkfA49O7gJyypsCo4G8laY4XamipQhYCLg7M9cn3L
	tu/NtEFjP7LqxxUkq79p7mRaxO1mKEUsMufTa9fa+0bRfMY+ZbYjfXb8d3dNRMvo1Vu7axIzSyOBO
	Ep2t0nvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYos-00000001nIa-3Nx2;
	Fri, 06 Dec 2024 13:56:34 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYnq-00000001nAt-1chE;
	Fri, 06 Dec 2024 13:55:32 +0000
Received: from laptop.lan (unknown [125.33.216.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 1BE0B3F1E9;
	Fri,  6 Dec 2024 13:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733493327;
	bh=U9hkTuJbGE7hIFsagAaGCZFpFPxgQR0ImXZs7Gg/g5k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=WVIAZthcfmCCLxSuH7nxMAudN22sCfS3vkoJoldTEDHsu8jcPeLTQoZKugl21Q6vh
	 nhwcg6Xhw2uqVZGQSBaftdF9fO/BAu4vr8uKuFtsnQ/lE9XXfPaaacAdoa/+AxhyWW
	 5bMTtGVUJRb2msm+g4zT4PH4HiQ1V6vr5ZKv1t4cJj2MLdb0X9NzWJc6bJUZVmUcYJ
	 wTdzabpdX5Sj2Yv1N3DaYdaQkxznNYGGml+v3mdu6rUNDy0jbv9F3FPlKjJCAp71n9
	 Kpol4pQqmybBuVHq2eRLTFX119Y0/Kd6A4xaVK1QsUUUSJkX9zBqQTj6g+VuF6df/2
	 qdKoXm878a4Sw==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err 
Date: Fri,  6 Dec 2024 21:55:07 +0800
Message-Id: <20241206135507.1274357-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_055530_744471_4EE6E49C 
X-CRM114-Status: GOOD (  10.27  )
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

The pointer need to be set to NULL, otherwise KASAN complains about
use-after-free. Because in mtk_drm_bind, all private's drm are set
as follows.

private->all_drm_private[i]->drm = drm;

And drm will be released by drm_dev_put in case mtk_drm_kms_init returns
failure. However, the shutdown path still accesses the previous allocated
memory in drm_atomic_helper_shutdown.

[   84.874820] watchdog: watchdog0: watchdog did not stop!
[   86.512054] ==================================================================
[   86.513162] BUG: KASAN: use-after-free in drm_atomic_helper_shutdown+0x33c/0x378
[   86.514258] Read of size 8 at addr ffff0000d46fc068 by task shutdown/1
[   86.515213]
[   86.515455] CPU: 1 UID: 0 PID: 1 Comm: shutdown Not tainted 6.13.0-rc1-mtk+gfa1a78e5d24b-dirty #55
[   86.516752] Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10 10/01/2022
[   86.517960] Call trace:
[   86.518333]  show_stack+0x20/0x38 (C)
[   86.518891]  dump_stack_lvl+0x90/0xd0
[   86.519443]  print_report+0xf8/0x5b0
[   86.519985]  kasan_report+0xb4/0x100
[   86.520526]  __asan_report_load8_noabort+0x20/0x30
[   86.521240]  drm_atomic_helper_shutdown+0x33c/0x378
[   86.521966]  mtk_drm_shutdown+0x54/0x80
[   86.522546]  platform_shutdown+0x64/0x90
[   86.523137]  device_shutdown+0x260/0x5b8
[   86.523728]  kernel_restart+0x78/0xf0
[   86.524282]  __do_sys_reboot+0x258/0x2f0
[   86.524871]  __arm64_sys_reboot+0x90/0xd8
[   86.525473]  invoke_syscall+0x74/0x268
[   86.526041]  el0_svc_common.constprop.0+0xb0/0x240
[   86.526751]  do_el0_svc+0x4c/0x70
[   86.527251]  el0_svc+0x4c/0xc0
[   86.527719]  el0t_64_sync_handler+0x144/0x168
[   86.528367]  el0t_64_sync+0x198/0x1a0
[   86.528920]
[   86.529157] The buggy address belongs to the physical page:
[   86.529972] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff0000d46fd4d0 pfn:0x1146fc
[   86.531319] flags: 0xbfffc0000000000(node=0|zone=2|lastcpupid=0xffff)
[   86.532267] raw: 0bfffc0000000000 0000000000000000 dead000000000122 0000000000000000
[   86.533390] raw: ffff0000d46fd4d0 0000000000000000 00000000ffffffff 0000000000000000
[   86.534511] page dumped because: kasan: bad access detected
[   86.535323]
[   86.535559] Memory state around the buggy address:
[   86.536265]  ffff0000d46fbf00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   86.537314]  ffff0000d46fbf80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   86.538363] >ffff0000d46fc000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   86.544733]                                                           ^
[   86.551057]  ffff0000d46fc080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   86.557510]  ffff0000d46fc100: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
[   86.563928] ==================================================================
[   86.571093] Disabling lock debugging due to kernel taint
[   86.577642] Unable to handle kernel paging request at virtual address e0e9c0920000000b
[   86.581834] KASAN: maybe wild-memory-access in range [0x0752049000000058-0x075204900000005f]
...

Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..0062374f75d5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -673,6 +673,8 @@ static int mtk_drm_bind(struct device *dev)
 err_free:
 	private->drm = NULL;
 	drm_dev_put(drm);
+	for (i = 0; i < private->data->mmsys_dev_num; i++)
+		private->all_drm_private[i]->drm = NULL;
 	return ret;
 }
 
-- 
2.35.3


