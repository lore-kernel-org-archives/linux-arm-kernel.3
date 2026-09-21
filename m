Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CFEC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVfhbzvE6GURebcBrX2O4AYlNWe76f6ylBqD+StMY7g=; b=39UwZIhbmO5Eh2REhiPFpSq8fB
	nOB5SKQ8dE/3jez8hb00yFdVqdTs0LU4vZnPvNcaTrqt637QsfAI3xY872Fazm47iGwBw++kyl5n4
	taEwWrs69mgkRgv44/Ja4yGydNODpcAPCRO8S5ls6u1IiT4jtZZSpO/YiFke4xK1tdIfbF6sN9t/C
	4yYWgb7Vb22Ta5zvVaTRvmWAzA7SBDpY3K835fjc1iymwkI1KAS0gjfOCKm5NflVgJW31IEKcgrDv
	LhvUypvc5E6f8RAjaV54/om/w84Lx5RgEfuxmfzW5AQ3oWYFk/ZIuc43FTzskA0E8BPQrdS/8ABmF
	RrRuUP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gKf-00000002hZk-2OBv;
	Mon, 21 Sep 2026 15:53:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gKO-00000002hKD-013I;
	Mon, 21 Sep 2026 15:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hVfhbzvE6GURebcBrX2O4AYlNWe76f6ylBqD+StMY7g=; b=eMrC+44gCNxxt9oPaLc9lCXbNa
	GQuU77Iiq50su7fv0DB924iTbm1O4UwOhhzK8hIoQxM2lss0EjO8AOcS0rPfFmePTbPeEm4uwDPc7
	r04Dfm+uchufOjW5BBK3+AekBmAyVR40RK7+vzYbSFKhm+r0PozCT0O1xcEegJn1zWSUMTmGDVxbS
	NomJ2znATxCHNBK6B/oVWs5j8VgFDTYHo/FPDcEKjHckgYNvtSejMcEB62L97kigxPC91E+waiA3m
	bzXWluTyYyTPDXSVVxA9MCXMscTqL1pdlvFIiaTRa0uavNSGmfozOqW1Gs18u0Fy17zovlefi0KMG
	reZvsjfA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8gKK-0000000CVLn-0BtV;
	Mon, 21 Sep 2026 15:53:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790005939; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dL8QWo0f+z20HLw9HXd7aGFStuR/k/6l/FzgRHplWzXjfpgtJuClsAOR1DZ512xYHu8NCCcCazC2nApnrzpzPNhdvceP+z1X78p38mpx60wgUMZkUI/Ao4mFSgQSZWorMd1ffR8UsjM1jflS2DFrKLxXRt8gVLx0LlB0uhVfp8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790005939; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hVfhbzvE6GURebcBrX2O4AYlNWe76f6ylBqD+StMY7g=; 
	b=HJFIqM47xYTMuV3pj9MXTVTK4CKFU/hv8W2mvG3UieaVb+Aop621PPBOBihh5WJDCUee+UI0PKD4Gv+dDnq8qmUosBaFflQN+2gn0bkgxMK+bpL9G6r40GTtnFb5uxzfQKdVT490HXiNrokbN+diPmvlgRv9vnVIZdseXXec0h8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790005939;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=hVfhbzvE6GURebcBrX2O4AYlNWe76f6ylBqD+StMY7g=;
	b=VEQ3WRT9ZruGE+auQHYNi5JDxIAHiWLc38gvCVDu8IEpeZkhjV7guYnBbNvapKlB
	kuVL8L0Gg64ALMxnI3i58j7hSNJD8ia9h5AwssgPQFL5iEcXmYjvii55IRXKLDqb4Mb
	eUk+zgTbkKwFy7EiaiQoctyHlhWRtM0LJzTWf/Vg=
Received: by smtp.zohomail.com with SMTPS id 1790005938404198.15695800259266;
	Mon, 21 Sep 2026 08:52:18 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 21 Sep 2026 17:51:29 +0200
Subject: [PATCH RFC 03/25] drm/atomic-helper: Set mode_changed on
 vrr_enabled change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vrr-limiter-uapi-v1-3-2fcd7d011646@collabora.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
In-Reply-To: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Derek Foreman <derek.foreman@collabora.com>, 
 wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_165308_777969_6ABE9274 
X-CRM114-Status: UNSURE (   9.77  )
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

A change in whether VRR is enabled or not on a CRTC will be of interest
to any VRR implementation, as they may need to recalculate certain
internal state in response. So far, this was handled ad-hoc in the
drivers that implement VRR.

Handle this in the common DRM atomic core by setting the mode_changed
flag when this occurs. The rationale for using mode_changed is that VRR
is deeply intertwined with the current mode with regards to its timing.
Consequently, any component that cares about a mode change is likely
also going to care about VRR being enabled/disabled.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 9d006f98413a..0664d5779282 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -694,6 +694,12 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			new_crtc_state->active_changed = true;
 		}
 
+		if (old_crtc_state->vrr_enabled != new_crtc_state->vrr_enabled) {
+			drm_dbg_atomic(dev, "[CRTC:%d:%s] VRR changed\n",
+				       crtc->base.id, crtc->name);
+			new_crtc_state->mode_changed = true;
+		}
+
 		if (new_crtc_state->enable != has_connectors) {
 			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch (%d/%d)\n",
 				       crtc->base.id, crtc->name,

-- 
2.55.0


