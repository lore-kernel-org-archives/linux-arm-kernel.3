Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A1ECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 08:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Message-ID:Subject:Cc:To:From:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a83z96YzJ75nDxqS/kiW5XrSRi2azphYRz9D6P97XTQ=; b=rmZZw9uyrX4zW+loBBxK4P9dit
	tXEd3nQzOmgdZkIZs3J2lkv9wV1bDx+Js3U+jSSNRBIUX2TwJUfmt7FXY+pdR+QbXKekfiYYa+/GT
	VzmTkWVrwp6FQz1CA0un6Hfd6Y13+05DdfwJBqfhFDV+nm/932xEBTWBJR3mUeuqM5LUGdM9iL84r
	axaSqEzx8LhIZHVrxYyepfxWs0vmq3SptmP6kbAmAZP2y/CVoIizbnBfNJlf0/EkuI6GFUlez1OfG
	GlhG7DSd5x6XYbFpkPGHjfcD5KrhPjmj1IrLCyA6lmBPM7REWM6KGFbVKU//wTnm8hiIsanlAU38O
	r6ajLfuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd8U-00000008ac9-3LwN;
	Sat, 09 May 2026 08:34:10 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLd8Q-00000008aXr-27va;
	Sat, 09 May 2026 08:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Content-Type:MIME-Version:From:To:Subject:
	Message-ID:Date; bh=a83z96YzJ75nDxqS/kiW5XrSRi2azphYRz9D6P97XTQ=;
	b=mrLFWYjOEX+PRjQzFqbHTg95cG39sKhnMFH3jGw4+8sCzT1PfZd+nq7k032pvs
	/nXfg3scgpoKoEsy4wwCiA5J3Ov+FQ7OPZ9GKyhDPrRW8+eoPd/3hjTbJqAviycu
	uCoGI9ne/ZaouwjhxJmyVIOVHDzebR2d1nX8bSwAXCMi4=
Received: from [127.0.1.1] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXn6Nx8f5pDQlyAQ--.724S2;
	Sat, 09 May 2026 16:33:53 +0800 (CST)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Jiaqi <shijiaqi_develop@163.com>
To: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] drm/rockchip: Fix vmap address caching in rockchip_gem_prime_vmap()
Message-ID: <177831563268.322716.16290375245774379615@163.com>
Date: Sat, 09 May 2026 16:33:52 +0800
In-Reply-To: <177831560568.322716.7926332149561323511@163.com>
References: <177831560568.322716.7926332149561323511@163.com>
X-CM-TRANSID: _____wDXn6Nx8f5pDQlyAQ--.724S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1Dtr18uw15CrW5Gw1UAwb_yoW8GF1xpa
	9xu39IyrW8GrWjqrsrXFnrA3ZxK3Wv9ayxGryfKanI93WxWF9Ikr12kFyDJFZrJrsrCFWa
	qr4kA345ZrsFvr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUgA7UUUUU=
X-Originating-IP: [42.63.126.112]
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC7xGyBmn+8XFj8QAA3P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_013408_553209_C85D2C2B 
X-CRM114-Status: GOOD (  11.33  )
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

In rockchip_gem_prime_vmap(), when rk_obj->kvaddr is NULL, a new
vmap() is performed but the resulting virtual address is only stored in
the local variable 'vaddr', not saved to rk_obj->kvaddr.

This causes three problems:
1. Every subsequent prime_vmap call re-maps the same pages, wasting
   kernel virtual address space and TLB resources.
2. If the gem object is freed before prime_vunmap is called (e.g., in
   an error path), rockchip_gem_free_iommu() calls vunmap(rk_obj->kvaddr)
   which is NULL, so the prime_vmap-created mapping is never freed.
3. Multiple concurrent mappings of the same object cannot be tracked.

Fix by saving the newly vmap()'d address to rk_obj->kvaddr so it can
be reused and properly cleaned up.

Signed-off-by: Jiaqi <shijiaqi_develop@163.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 8afabe2118a9..1234567890ab 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -520,6 +520,7 @@ int rockchip_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 		if (!vaddr)
 			return -ENOMEM;
 		iosys_map_set_vaddr(map, vaddr);
+		rk_obj->kvaddr = vaddr;
 		return 0;
 	}

--
2.40.0


