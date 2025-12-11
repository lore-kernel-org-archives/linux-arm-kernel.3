Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28259D43343
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPbccTq6F1zzr9R/aer7AacGufcSyFhvzwy1HOUPRnY=; b=IMvOvsdsnidUVroJtPD2+U9zCs
	OOuqzH/rygoMExLYCcwGpykxItu/i4OAca9HMdbcnp3IsD2J0BahUv/HQIDUmo9u6Z3abvpjcVYhX
	+6AqN/uwRIlVxmWhVH7aw+pOo6VaSi32AlG+KauwEgW7yfwFOrcLfqGfESncIrlgi71y8SJjijre6
	8fibrxKWuWOh5k+uumh3l9FkwmHe+UCrp67Er33p4Ece4vhsCZtKGVDcw74R4PBtms+EGwmzDZo2h
	t0Y8SbD2cziNR9AFqdndqDZC1lZc1JtwVLS1Ygw4IkGTWPsEB7tEhGCvRQefn9qz1eyP1jBN8MfKa
	WqSAPzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTi-0000000HGMo-3MWa;
	Thu, 11 Dec 2025 20:41:36 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTnTe-0000000HGGS-446Q;
	Thu, 11 Dec 2025 20:41:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765485679; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DvYxZ8Bdzg9MhqZWC1IgZq8yuEbBfCWE/yDthNWElkMNWlW6aSso7CxkUJNiCKyQh5V995U12CJhzNsXvU046e+KOlYgePpRUiwQs8ERTMpOIMUa9pclpiA/E6dWS3HBx2rVe8GlcmGGooYmi99nJbO3DIFKD6w/k+8oIp4N5fs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765485679; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=RPbccTq6F1zzr9R/aer7AacGufcSyFhvzwy1HOUPRnY=; 
	b=aPOBHz1jmodV1E/qleg5dbNkdNS/lOtn+1YtB+Zb0breoEnoCOC2CWbaZzYT7QDuLHAOU8udmv6zLtAle/0s6/SEHCBSGNY/+uKQ784uKjqOB8H073MReG+EiPqHCMwD8tQj8egtViUQe6j+iNXKWkuR9yHaDK/2eaFvoydMxjU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765485679;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=RPbccTq6F1zzr9R/aer7AacGufcSyFhvzwy1HOUPRnY=;
	b=T3k8k7tf3CkZ1P4k9+gQs2Z90l2OA5G+qy6HK++tEPIzYcUHYTHZodCsO1Hz6Yin
	6HqHyQOf1rUnd8h6ncdd2RWh8MTX9VyGQevx1hRiReWkDehnv/To0qjYA5NwnPR1ajz
	Gjbf/BavYzz/OCLVC5gVZq9gf0rIbc+T+wmXqheU=
Received: by mx.zohomail.com with SMTPS id 1765485678944380.27112216237947;
	Thu, 11 Dec 2025 12:41:18 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 11 Dec 2025 21:40:37 +0100
Subject: [PATCH v4 7/8] drm/rockchip: vop2: Use drm_is_afbc helper function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-vop2-atomic-fixups-v4-7-5d50eda26bf8@collabora.com>
References: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
In-Reply-To: <20251211-vop2-atomic-fixups-v4-0-5d50eda26bf8@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_124131_115261_F4BD033D 
X-CRM114-Status: GOOD (  10.20  )
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

From: Daniel Stone <daniels@collabora.com>

We don't need to do a long open-coded walk here; we can simply check the
modifier value.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 1d12e00ec49f..494f4d48f9fe 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1207,7 +1207,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		return;
 	}
 
-	afbc_en = rockchip_afbc(plane, fb->modifier);
+	afbc_en = drm_is_afbc(fb->modifier);
 
 	offset = (src->x1 >> 16) * fb->format->cpp[0];
 

-- 
2.52.0


