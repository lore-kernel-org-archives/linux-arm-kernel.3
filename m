Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A46AD3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=; b=48sAXvjr2jFn2a2JuPGgLe0ApY
	RI7D+PgcJY5y3ZgYuAb60wmm2AA0qNLSS9aw8GSXOes3CaowOOJ2WM+SzKJFodA1RA3SyDQtyTaPW
	b25IXOBEPjYJgRz8AQKjMGUULLGdVQlY9OBW1t5QBJZhsaEAOBJFSysmCG3rA/G5Yagp+b/4EfRDR
	MgS9SzsmxN4f+3lMcOaGwT4/Z4B2p3v20ulJeINZHNM/81CvKpE+Lptkh8pKqAF1h/B3D1Egxn+DU
	fDJJ4m9TemwOmuF0JJEz9mBQxfXwiCvTx2No/CMAHcKEAqgfBx98JspheBCPCLJzF/YgAgAHkMni9
	svuOjEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvgh-0000000E9wf-2j8x;
	Tue, 09 Dec 2025 11:15:23 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvgf-0000000E9vi-01ja;
	Tue, 09 Dec 2025 11:15:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765278893; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eEZNGIJtKeP67NSw2lOuxu0zvU+Sv6FLpNuoU8UHJ//dKfUQahi2kqqrp57Y2jYWAXy7gpppu7tDRYxQwxF2AKDS+/f50eqflugZvuqGgo2XG3j3sNJjQ2DfjOzPLIkmMx2QvOez7vmOoQuY1FubEe6whWd/bAqiaU01GVBg6lg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765278893; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=; 
	b=iqn96Oh7vG0MxJEq0vEole2StmszatnCtBfprwo+SlhXnoFbzGgyCnrWff2Q62fFr/LUUzPEnzpAS20WspFnIU+XATqR3Uxj5okYjYL89JSmTapz2rNXEbN1h9k8NH2BqK4EPs/o794VWz2RoIxa3xnI/K3HWft462Y9tWHXQ2Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765278893;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Cg4WUfMDQUwvwvbTJsa9XBH4T44qYNwtUMAw30CfLvQ=;
	b=kI+f29cemP/nKIWH4glFjpkkimX11G7DmPWs9qgbks6DokueOayvPgF13hpE02PW
	SKh+pa/jYNzzl78Gmkvd/NQs/FvcU2p0eZOyekmY759lb8Dg8iAy48+e0oQ+1BLwJmG
	iaPTG0L2Jufp7HsTX6PSwjYunGk+Q0A4+krKmn1I=
Received: by mx.zohomail.com with SMTPS id 1765278892854392.0031445733065;
	Tue, 9 Dec 2025 03:14:52 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 09 Dec 2025 12:14:14 +0100
Subject: [PATCH v3 1/8] drm/rockchip: vop2: Switch impossible format
 conditional to WARN_ON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-vop2-atomic-fixups-v3-1-07c48f0f1f0d@collabora.com>
References: <20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com>
In-Reply-To: <20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_031521_089032_36C682E1 
X-CRM114-Status: GOOD (  11.61  )
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

We should never be able to create a framebuffer with an unsupported
format, so throw a warning if this ever happens, instead of attempting
to stagger on.

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 498df0ce4680..20b49209ddcd 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1030,7 +1030,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	format = vop2_convert_format(fb->format->format);
-	if (format < 0)
+	/* We shouldn't be able to create a fb for an unsupported format */
+	if (WARN_ON(format < 0))
 		return format;
 
 	/* Co-ordinates have now been clipped */

-- 
2.52.0


