Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B53E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 02:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qnEfk34JXjmwcW6H1RfNrw1EbvlMd5bPIiUMHsYMUQ=; b=C7A5yxcUUBB8fOTXnlpZgcZFsW
	SO6z7Sw2x6gU/60K+PBWgp39KcJglS94RMYrC/zVBuf4Noy9p7AjVsbxiy9BeoroeuPGHug+YjKaK
	k+TIKaiWBq6ALNRaji2bFLR/hxtBhnOHJTAs9bgPXxgX6TCRnCt4Y8H4L0eYnBpAqIL+4x82eLMZU
	R3ZlCynSduy21ZD1qfHeJpw6Nea9sBTjVQB3t6h6fNgxIrZ60f4X5sEuleGOa+Ilm2j/rEuyaKjoN
	CmKzGO6j6+8MyNN+ir4vdCMN4wHs8oJYR8QCy1V4nbFBip5LIxUomt8lLRiTH5rZVqSq0I+P4rFtN
	EvbO+b4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYGZ-00000009AGI-14nc;
	Mon, 23 Dec 2024 02:33:55 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPYFO-00000009AD1-1IPz;
	Mon, 23 Dec 2024 02:32:43 +0000
Received: from laptop.lan (unknown [123.123.43.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 500BD4093D;
	Mon, 23 Dec 2024 02:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1734921158;
	bh=5qnEfk34JXjmwcW6H1RfNrw1EbvlMd5bPIiUMHsYMUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=VjFpcNmbP2cIiN2fMpSY7tpsMOnVXphLMOJjElWhkr4B+yUP1I8/mGqO8oTegomr9
	 OHwPVlWItAbBKYvuyGRt7xebumRpGxvt8TtjP0TZ3cXFw8K9S807u810DC6IiRKYfE
	 xnRImfEGjJiDSq2smJG2owcldvQklL+x6qgQ9TDUTsiE9YGZE2TVtJZox3cgtgkhgD
	 qoUekAoe1weTgjp0uBaBiJnYR1mTtN92PB3kGI46eFogjRjZCums6wgItNJnujj/zi
	 3Wrtvy9P4gqw1CDRaPcTun5pLJQl9hPzzeLWfDjJODEi1qZeQAd8E8cUK3PWyb8YiU
	 G5m8Dy8MTo2/Q==
From: Guoqing Jiang <guoqing.jiang@canonical.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nancy.lin@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2] drm/mediatek: Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err 
Date: Mon, 23 Dec 2024 10:32:27 +0800
Message-Id: <20241223023227.1258112-1-guoqing.jiang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_183242_667884_6638ACF7 
X-CRM114-Status: GOOD (  10.29  )
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

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
---
V2 changes:
1. add Fixes tag per CK's comment

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


