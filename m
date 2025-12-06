Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEBED3B7DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 20:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXrmn9V5yp3R+LcTXtaXe7SnaMWebiHUR5EHbA4dxz0=; b=3b7Tg/HvUooPy2zWjxOY1RprdU
	t4QuSKhD9RTR+HRcYiFETtp57coyDtny75w3ISOjT8vCzrzJYjCd7bVRGJhHS8NhzL0r8N5ACW4Wq
	a509uckEKljP/TOEzs6Cw8FeD1i/Zp2lrMJPki+XsazFeiXx4zTGE0upEpszevZG4PtelsOSWSWaj
	b25EH1UJH+F2FVWQFBNo7tn/4ob2w/WtTCY4MrK7KI1NMZTw1tAqBNqDmYD+/saviEd9QNoZ/lHLI
	7Zw5r7+I0nOTrZqaeWvUCOJnY3MaW3VmiejMjefmM0sECIlH3C1rW2jpK47nbfmWJh/M3aSE/vGCI
	ro9O5xgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAW-0000000BDKh-2aNY;
	Sat, 06 Dec 2025 20:46:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzAT-0000000BDGL-2mFE;
	Sat, 06 Dec 2025 20:46:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1765053956; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ITPQ220Dv+ja9WoCT0KDih4EzAOaRP1kG1Bm+CXUiYnjTFKj5FbN6CStKaKVlJ1Jp51amjO1SHzTziIne9vayFz6fIal/gBAQOCX9ehWLuWR6rvu8BgSpaRF7iV6pCt7Fd7d3Ho0IuaShGDKO7pbCteLMS5AXjNqN+gfjha8PBE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765053956; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OXrmn9V5yp3R+LcTXtaXe7SnaMWebiHUR5EHbA4dxz0=; 
	b=VHRXiZhNr5QD5PVq3NztbIBms1mW3gOvn+E15yHCZVB4V9/KywJ7kOp0iorHNMK0/Fuf2DW1MGWnJjEH3SaZEDtM+E8vCOkc4iIjjPbeQv/D5/zs5wA2S2ej9ivJj1HTjKzmUTvgC7ZT4CQwEluc7bn6h3Vv8CTNMfjgFRa/WeM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765053956;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=OXrmn9V5yp3R+LcTXtaXe7SnaMWebiHUR5EHbA4dxz0=;
	b=hkeEnB/IzscPr3AQllUK6pmj6eSojy92DRBqPtlI7xuaV2TlPPdtoNTX9mRwpTfo
	SOZ2GUh0MTkP2ZPfwQTdvBx8b+Iwsc2T6+RAtQ6MgBvHa4NGEq/SGBnWf4Kk6FiqQwb
	M1F7UeRaYSe82GRe45vrBN3sAvpcDOOYuURdZPXI=
Received: by mx.zohomail.com with SMTPS id 1765053955301342.1403973857058;
	Sat, 6 Dec 2025 12:45:55 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 06 Dec 2025 21:45:15 +0100
Subject: [PATCH v2 5/8] drm/rockchip: vop2: Enforce AFBC source alignment
 in plane_check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-vop2-atomic-fixups-v2-5-7fb45bbfbebd@collabora.com>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
In-Reply-To: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_124613_811162_C617AC48 
X-CRM114-Status: GOOD (  10.47  )
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
[Make RK3566/RK3568 specific, reword message]
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index bc1ed0ffede0..e23213337104 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1076,6 +1076,13 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
+	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier) && src_w % 4) {
+		drm_dbg_kms(vop2->drm,
+			    "AFBC source rectangles must be 4-byte aligned; is %d\n",
+			    src_w);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1237,11 +1244,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 	WARN_ON(src_w < 4);
 	WARN_ON(src_h < 4);
 
-	if (afbc_en && src_w % 4) {
-		drm_dbg_kms(vop2->drm, "vp%d %s src_w[%d] not 4 pixel aligned\n",
-			    vp->id, win->data->name, src_w);
-		src_w = ALIGN_DOWN(src_w, 4);
-	}
+	if (vop2->version == VOP_VERSION_RK3568 && drm_is_afbc(fb->modifier))
+		WARN_ON(src_w % 4);
 
 	act_info = (src_h - 1) << 16 | ((src_w - 1) & 0xffff);
 	dsp_info = (dsp_h - 1) << 16 | ((dsp_w - 1) & 0xffff);

-- 
2.52.0


