Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE58D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1lGaywL2zfQuFsnDp6E8zqprL8Bq/LaGHpO8r0QUqw=; b=woIvhu/WQxEzBIbwHi3N1JRBsC
	6k2A5VIAQIXX+li0cvjvwkyqL4HxFl4x4vAdT+rQTje3uKnCLByAnz/v3gwyBjIIeuqJAQBU5Mf73
	ayj/w7NK5WZKrKc0/9WXxp7i8s678LIRNSNtwKMUEnoKdPWRrvlZ4/CpnCSCK1BzrswVNGXL2C4vM
	XRt6OYAeK2KH0JAi+G2GpmEGB+FQr043qPEFCwamsocEiwcr8VcYkmgt1Krk4j/fYM1sVhAt/idmG
	gVQQblaejY2qnFLrqHCQPEbYc6K74p21ZbicENvv4INJ5lMLP7VbkB7mpGjbQhwiMoB4GTk3/y673
	FSL4B0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9In-00000003kyM-0yCV;
	Mon, 15 Dec 2025 14:11:53 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9Il-00000003kwl-1lwK;
	Mon, 15 Dec 2025 14:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765807877; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UUL4xXVJNIfEUsmFhWRldVk4suQwf3wCEnuqtuQhKcx3ASqdy9e/xeGsyJi/G7tSRP/X7XzdRBjfcfORoitY2uxmMBlWyaVyACgq8GxrtDbH7PKCRQg/Zv0OiI+OlvIDP0vVLgW5yskOMbMYm/5NTPZ4wxc3iTy3/4ytaGIvmVk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765807877; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P1lGaywL2zfQuFsnDp6E8zqprL8Bq/LaGHpO8r0QUqw=; 
	b=A+QyxOM0e64rHbOSC80vrcoftjYducjRnOM4DDdd8damIRFQyOuKK7Odvckc6EJnDFlRGbv3pau56nkCMjSZ5k+H7UN5rEXLmEp02t43t8JAE2aHwt3mBc6bDH2JrvBdGYcb9SauZdGWq3m1ahu8eSwgj0ZS8QXv5zGyTrtxVFc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765807877;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=P1lGaywL2zfQuFsnDp6E8zqprL8Bq/LaGHpO8r0QUqw=;
	b=Lysxs/5ypSUNZvFaYjyNSUW9ZZ2wCzVvFsaepXI1NgNj8Cm2dPYfWJjWzwb8JB5k
	7mFUwXCzYCaf9pZd8OwWErFy7iyQj1qyLH4MLpjP74dawCHw3ZRom1L4pybnxvDgfVw
	OoT0orWuWREQ6wdhko+D/eUB3PRCtlStdJ9zAtfM=
Received: by mx.zohomail.com with SMTPS id 1765807873201227.86050033379365;
	Mon, 15 Dec 2025 06:11:13 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 15 Dec 2025 15:09:21 +0100
Subject: [PATCH v5 5/8] drm/rockchip: vop2: Enforce AFBC source alignment
 in plane_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-vop2-atomic-fixups-v5-5-83463c075a8d@collabora.com>
References: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
In-Reply-To: <20251215-vop2-atomic-fixups-v5-0-83463c075a8d@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: David Laight <david.laight.linux@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061151_521575_AE427219 
X-CRM114-Status: GOOD (  11.24  )
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

Planes can only source AFBC framebuffers at multiples of 4px wide on
RK3566/RK3568. Instead of clipping on all SoCs when the user asks for an
unaligned source rectangle, reject the configuration in the plane's
atomic check on RK3566/RK3568 only.

Signed-off-by: Daniel Stone <daniels@collabora.com>
[Make RK3566/RK3568 specific, reword message, s/byte/pixel/]
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index ded8b9952c6d..0eab3370f088 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1076,6 +1076,13 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier) && src_w % 4) {
+		drm_dbg_kms(vop2->drm,
+			    "AFBC source rectangles must be 4-pixel aligned; is %d\n",
+			    src_w);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1236,11 +1243,9 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	    WARN_ON(src_w < 4) || WARN_ON(src_h < 4))
 		return;
 
-	if (afbc_en && src_w % 4) {
-		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
-			    vp->id, win->data->name, src_w);
-		src_w = ALIGN_DOWN(src_w, 4);
-	}
+	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier))
+		if (WARN_ON(src_w % 4))
+			return;
 
 	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
 	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);

-- 
2.52.0


