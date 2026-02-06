Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0F4EE6B4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 20:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G0ckLdQbieBn/+QMNqBYFPCh9fWWCV3XFoYhtXEvrbk=; b=te/tRVSNqfGKMzH+vyRkmHi6RX
	sVR8+km067dPWD/HjUFcyru+j64KhXeTXGjgbpKnZ7isnJ/ZU4GfK0i9XNbi5mvTEdGHsDxjPfBXr
	YGeyekGOnNxBOAKd4qtN5YlgUz8eXMTrizI+T445XXDnmA5gPzNsCpm3u0S5RM7IauCnVRzfHKSom
	by5SvwkL6nusuF27Cg/AAEP43ME34aVtZOFqFxj/aqaqGaJ0QS2AxFraBC6EU1rHZnXuFEL52BuKb
	TwtiVOgmFWsNPdBlgz/D8zY7XIauoymt6iwS4PdBGqK1biOuub72JwxOMj+I+F7JLgbFjeHI+F36u
	r2ju2HfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSNP-0000000BnOX-2Njb;
	Fri, 06 Feb 2026 20:24:27 +0000
Received: from [95.181.193.9] (helo=mail.auroraos.dev)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSNM-0000000BnNK-0b74;
	Fri, 06 Feb 2026 20:24:25 +0000
Received: from wasted (213.87.156.77) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Fri, 6 Feb 2026
 23:24:13 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?=
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-rockchip@lists.infradead.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] drm/rockchip: vop: fix sloppy typing in vop_plane_atomic_update()
Date: Fri, 6 Feb 2026 23:23:44 +0300
Message-ID: <20260206202346.57633-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [213.87.156.77]
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_122424_177819_D03801CA 
X-CRM114-Status: GOOD (  10.36  )
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

In vop_plane_atomic_update(), the variable offset is needlessly typed as
*unsigned long* -- which is 32-bit type on the 32-bit arches and 64-bit
type on the 64-bit arches. I highly doubt that this variable can exceed
4 GiB even on 64-bit arches, so let's redeclare it as *unsigned int*...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 1b466623b6c7..ee53755751ac 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -924,7 +924,7 @@ static void vop_plane_atomic_update(struct drm_plane *plane,
 	struct drm_rect *dest = &new_state->dst;
 	struct drm_gem_object *obj, *uv_obj;
 	struct rockchip_gem_object *rk_obj, *rk_uv_obj;
-	unsigned long offset;
+	unsigned int offset;
 	dma_addr_t dma_addr;
 	uint32_t val;
 	bool rb_swap, uv_swap;
-- 
2.52.0


