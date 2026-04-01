Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67945D35163
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ACcaxtMVSGhLKYW7D/qzvB0FLltv++7jcCBwwGZnKyw=; b=hXi04ac+cF0wIHNb8EqYKZ2Sc5
	oQnAR5CIrCIm+OTjK3CuCgCt+mxdljhiD3kUvemHVORFwe/L4ebBBF5/z3A3mModqxgAlt5oADn86
	4SQOoUNZLvwPU52uV+rwu/KLpldizPNOfVNN61tDrlq/bAfLOiX5qxdnoBvAlmW2rx8a/nNh0WKIL
	M2KiHBXunwkjZGcAXVEhxKttPdAwl8aXt038VXfBhOzfVKz7WzOQvkYC8S+JcyXVqjhtN+YPBpd65
	JMucf4H3Dirl+j1rJmOi3uv/Pm4oQHOzWddOVGOatVImLNSlVTd08U4fPv6jNHXMXrsmtHNkZsS61
	kKJ/MYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7s8w-0000000ERBE-1cOn;
	Wed, 01 Apr 2026 09:45:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7s8t-0000000ERAU-2wuQ;
	Wed, 01 Apr 2026 09:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775036740;
	bh=d59Vvq+IUOLgliXQPlQq76Luy0alKaQ2aX44NWQeWlI=;
	h=From:Date:Subject:To:Cc:From;
	b=I11Ud/2f41YKWZ8Om2tBAC/Ek+BcmwXc69hq0zcuK3AEQtpNge8HAsnizflFJPxkA
	 96VXJxsQW1h9wAiuUMORZ5H6BCTRZPMuvMJ0GYOUI1iaBMEWMdn9JYowgE3Lbgkyf1
	 U5dkcJXayM9y9b9uuzcAMGDk/GA1KLdDw6F9zRqcfgG5uC2JSb3g3CMELdrNoknDmi
	 DE2PTX+5p/yZUqdigz6SiJcNa9qF8bEIMzKO1h2BCjRKAy2ziO8vsWlNQFlVkodrW1
	 8HHrxNQD4pLHbHH1kXOVUybUFqlTdZB4ran93ZSahgoivKnB6kHnSe52NqP2RkOIt2
	 /eCtF3A0Vz/xQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74FBB17E759A;
	Wed,  1 Apr 2026 11:45:39 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Apr 2026 11:44:15 +0200
Subject: [PATCH] media: mtk-jpeg: cancel workqueue on release for supported
 platforms only
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-mtk-jpeg-release-issue-v1-1-2271a1779340@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN2w6CMBBEf6XZZzdpizf4FcJDhRVXbcFuMSSEf
 7fC45nJmVlAKDIJVGqBSF8WHkIGc1DQPlzoCbnLDFbbsz5qgz698DlSj5He5CT3IhNhdy2tKS/
 a2ZOGLI+R7jxvw3Wzc6TPlPfTHsLtL7eD95wqFWhOuH0UhYFmXX/AAkBxmQAAAA==
X-Change-ID: 20260401-mtk-jpeg-release-issue-d8921970a250
To: Bin Liu <bin.liu@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Fan Wu <fanwu01@zju.edu.cn>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775036739; l=2803;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=d59Vvq+IUOLgliXQPlQq76Luy0alKaQ2aX44NWQeWlI=;
 b=fYdV0Isw9rPolpF51EkIAXenhPIyyvue9pwR6ZLlxJqtdB2oY7GFZ4+8ZOP6y1rO9Mi5feQJK
 CiH4s6Oug6GCXdBXrCtsPrA0+M4tPQk+yWcCnZoZ0TLfmKwQxUZusJM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_024543_962094_B95CAB51 
X-CRM114-Status: GOOD (  14.96  )
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

Since a recent fix the mtk_jpeg_release function cancels any pending
or running work present in the driver workqueue using
cancel_work_sync function.
Currently, only the multicore based variants use this workqueue and they
have the jpeg_worker platform data field initialized with a workqueue
callback function. For the others, this field value remain NULL by
default.
The cancel_work_sync function is unconditionally called in
mtk_jpeg_release function, even for the variants that do not use the
workqueue. This call generates a WARN_ON print in __flush_work because
the workqueue callback function presence check fails in __flush_work
function (used by cancel_work_sync).

So, to avoid these warnings, call cancel_work_sync only if a workqueue
callback is defined in platform data.

Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path due to uncancelled work")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
Patch to fix the following warning that occurs on boards such as
Mediatek Genio 510-EVK:
```
WARNING: kernel/workqueue.c:4291 at __flush_work+0x320/0x340, CPU#1:
  v4l_id/409
...
Call trace:
 __flush_work+0x320/0x340 (P)
 cancel_work_sync+0x6c/0x9c
 mtk_jpeg_release+0x2c/0x84 [mtk_jpeg]
 v4l2_release+0x8c/0xe8 [videodev]
 __fput+0xcc/0x2e0
 fput_close_sync+0x40/0x100
 __arm64_sys_close+0x38/0x7c
 invoke_syscall+0x54/0x10c
 el0_svc_common.constprop.0+0xc0/0xe0
 do_el0_svc+0x1c/0x34
 el0_svc+0x34/0x108
 el0t_64_sync_handler+0xa0/0xf0
 el0t_64_sync+0x198/0x19c
---[ end trace 0000000000000000 ]---
```

It is based on linux-next (tag next-20260331) and has been tested on
Mediatek Genio 510-EVK (mt8390) and 1200-EVK (mt8395) boards.
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 8c684756d5fc2524da3a67f67f0fdda894b676fc..d147ec48308110ae8520662e182dc0445447d8d0 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1202,7 +1202,8 @@ static int mtk_jpeg_release(struct file *file)
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
-	cancel_work_sync(&ctx->jpeg_work);
+	if (jpeg->variant->jpeg_worker)
+		cancel_work_sync(&ctx->jpeg_work);
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);

---
base-commit: e5da3eef8dadab4e98b228725ca8948edd9d601f
change-id: 20260401-mtk-jpeg-release-issue-d8921970a250

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


