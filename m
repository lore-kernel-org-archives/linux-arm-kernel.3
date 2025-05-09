Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BAFC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 03:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sMl4uDULJ4d2VplsLBXiseBBzW7TX6oyV9iz007EHaY=; b=vMbq2YHrA285stG9u1ap7sGOWa
	OOfPo06BKr6bRKReozOcaq3Owrxy2pMksVhxpzOYYutaMqQdhPENL9Ga4eSZxjkLElxOsw90XbCno
	26RX4vQ/0rDjL7zEDPXx7qxntNB5DeQu2xjPwFoabqArJ/1F4/rTGorFl7960Yb0vrS/Nv1kfwyq7
	AaWQHRUB3TTtG5tarD598xMsPIk26HRx0Gty9JdplOu6C5KpxXIeEWyZnp5hA3DZ2hMziqQJvQhxh
	CiHAxEG9gRGZYydogDgcomUNeuD4hYMdt3xfwAV48ATo1oPbplnY51qidp9MtSTUD7zk1QbLl8Kx3
	6rcqMQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEsQ-00000002Pfl-2SmS;
	Fri, 09 May 2025 03:58:22 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDEDw-00000002L9k-3LdK;
	Fri, 09 May 2025 03:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sM
	l4uDULJ4d2VplsLBXiseBBzW7TX6oyV9iz007EHaY=; b=fdgTY9ZS0keqXsXBT8
	XV8j88E6S93/AzsYGphFUeOMZZRmpPiRIUe5LOvcxDy7YBiB1zuJ8Tufm3RCdLDj
	Qif0RBptSLAxFJ+obO4D5QpPO+5+1yE82rmGGxfS6S8bZ6JTMBs/jebUPpGHoO/T
	L6JamKk6eBoJhfaBp0KQ3l/4c=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3v26Bcx1ombx0AA--.1362S2;
	Fri, 09 May 2025 11:16:21 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: andrzej.p@collabora.com,
	hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: cleanup fb when drm_gem_fb_afbc_init failed
Date: Fri,  9 May 2025 11:15:59 +0800
Message-ID: <20250509031607.2542187-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v26Bcx1ombx0AA--.1362S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr4DZr47WrWkJrWkZw1xGrg_yoW8Gw1rpa
	9xtFWjvrWxGw40grnFkFs5ZFyrK3ZFgayxKr4xGa1fZr12kFyqgw1fCF95ZrW3Jr17ZryY
	vrZ3J348AFZruFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5AwxUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h1IXmgdbavmLAAAsg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_201633_204003_C3CF3F11 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

From: Andy Yan <andy.yan@rock-chips.com>

In the function drm_gem_fb_init_with_funcs, the framebuffer (fb)
and its corresponding object ID have already been registered.

So we need to cleanup the drm framebuffer if the subsequent
execution of drm_gem_fb_afbc_init fails.

Directly call drm_framebuffer_put to ensure that all fb related
resources are cleanup.

Fixes: 7707f7227f09 ("drm/rockchip: Add support for afbc")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index dcc1f07632c3a..5829ee061c61b 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -52,16 +52,9 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
 	}
 
 	if (drm_is_afbc(mode_cmd->modifier[0])) {
-		int ret, i;
-
 		ret = drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb);
 		if (ret) {
-			struct drm_gem_object **obj = afbc_fb->base.obj;
-
-			for (i = 0; i < info->num_planes; ++i)
-				drm_gem_object_put(obj[i]);
-
-			kfree(afbc_fb);
+			drm_framebuffer_put(&afbc_fb->base);
 			return ERR_PTR(ret);
 		}
 	}
-- 
2.43.0

base-commit: 98f498ca33ac03f4d9514e66cdfec9ee58808f82
branch: rk3036_hdmi_bridge_v5


