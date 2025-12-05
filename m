Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C4BD2F7CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JP+4ckmzRNCAKbVL9lJPhNRJD2tZ2UdMNCmVCP9SsM=; b=WOM/GgjSuHXBj5FU5cax6XTIl4
	mZA/mJmS6O7+Y0UoUYnC5wDuf/4FpTB9aS7y4DgtZki5Gm2JwJs2xg4piQ+pvtQyv54kg99jPCLrP
	Oye603OYQ7z15EqSwVYUxHU1e2jl2r4EHnBb+Hs6gDZWc4pldXMBM1BUGH3WXJXCvCewe+5ImYorj
	XrXrHK2xi9I5QxPkJenw8et8vhv3CAKoTdXNBreql6B6Uu+Dh/LjdDGn8NbwehoF4/PB9XuIVBQMN
	9f0kZPmjIBCsqWTPuMgemIm+hMvri4m6f9vDbPX0YgYBa0JsuMgpgXdrH7u0desDJ8Bwu+TU79ha2
	yPVdTShg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSUS-00000009KXJ-1W1u;
	Fri, 05 Dec 2025 09:52:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSUL-00000009KPp-4AKi;
	Fri, 05 Dec 2025 09:52:35 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 992781776;
	Fri,  5 Dec 2025 10:50:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764928215;
	bh=tk41aXJM1hAnommQL/yZ5bKIvn8A1Y3535egq0jrEXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dDozfNOw0kPmG5KSLNrZMNRxUH1xcCssnfVhWxGCOvmEgCkuPW6O+l6+/X7XySbjb
	 g0Mauy1M5GGEPC1Z5vzpfIbZLyrKS7/fCfaNoSsdPhWXIYilfCMZQBLeTdPwQUDSix
	 O8D0SNfXvZjTKBPh48X2Ch5gvtKOy3Yx6uvYcxK0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 05 Dec 2025 11:51:51 +0200
Subject: [PATCH 4/4] drm/tidss: Fix enable/disable order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-drm-seq-fix-v1-4-fda68fa1b3de@ideasonboard.com>
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2817;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=tk41aXJM1hAnommQL/yZ5bKIvn8A1Y3535egq0jrEXs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpMqtWv5wZpSaeF7nzdL79PpuSJS+G7FkUG1S7F
 CjPbI7L85yJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaTKrVgAKCRD6PaqMvJYe
 9dFZD/43MtWBz4xkH5Go8fDRvOeAMN3nMetCypyzpaYU8SDCxiHW3R4cvCQCBz5ptVjtBmY2soo
 j6TbcKyMormmah0v5qlbSm5cdRC6ewqdO40MrJD25s1iMMI4striFD/Rbz+h/cBoVMthXCKFKcU
 SYgA8Vm0hdvQRTgXN1H6X1zUGaJ3wWeO/bodZnATIJO2FMxmcczJ7LX+xnCbmSrl11Wss7jOJoY
 17pQPD0R8dgMmIO3KOKDrtodE6a9M1mLPqdN0Go6WvpD68UGiaUZ2ogyA5lAd54XGP3Y0fskIu+
 l07xPUfRTajLrS7P2AHHwjModBlLAZF+2QaI4JyxJq9laAFPJLJLOOXjsBHHYYB3T3Lk3dAo9G+
 y5D653lz2jZ2qyxfezh9QHATtYAOIz+H7Sf8PDF2NIMd2jjMOKdsdBduxMt1uSpIoHyjK4bXRb5
 uwgvIp+c0bGaNgVTVUgnVLAhkHIhNodsWXuWt2YupEvCp1nH8oDjCdCW2iCsAuEy+8JAKE+TKsa
 mqPoEzWuMu0NB0LGR08Av5ZE/ajflmmSUcJG7BW5nc2vWZBTvm19zf5L+5sBjbz/wo+417eu+oG
 kpE6f0Sz2HrYLdCAsRystA9O0ko0oMc3myR9YWc5VzfTltcxkaZSlYYxz7BAeSJkNUUvMUmLiWt
 1I1wsU3rnpVQTrg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_015234_200303_F9DCF007 
X-CRM114-Status: GOOD (  11.38  )
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

TI's OLDI and DSI encoders need to be set up before the crtc is enabled,
but the DRM helpers will enable the crtc first. This causes various
issues on TI platforms, like visual artifacts or crtc sync lost
warnings.

Thus drm_atomic_helper_commit_modeset_enables() and
drm_atomic_helper_commit_modeset_disables() cannot be used, as they
enable the crtc before bridges' pre-enable, and disable the crtc after
bridges' post-disable.

Open code the drm_atomic_helper_commit_modeset_enables() and
drm_atomic_helper_commit_modeset_disables(), and first call the bridges'
pre-enables, then crtc enable, then bridges' post-enable (and vice versa
for disable).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: stable@vger.kernel.org # v6.17+
---
 drivers/gpu/drm/tidss/tidss_kms.c | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 86eb5d97410b..8bb93194e5ac 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -26,9 +26,33 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 	tidss_runtime_get(tidss);
 
-	drm_atomic_helper_commit_modeset_disables(ddev, old_state);
-	drm_atomic_helper_commit_planes(ddev, old_state, DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(ddev, old_state);
+	/*
+	 * TI's OLDI and DSI encoders need to be set up before the crtc is
+	 * enabled. Thus drm_atomic_helper_commit_modeset_enables() and
+	 * drm_atomic_helper_commit_modeset_disables() cannot be used here, as
+	 * they enable the crtc before bridges' pre-enable, and disable the crtc
+	 * after bridges' post-disable.
+	 *
+	 * Open code the functions here and first call the bridges' pre-enables,
+	 * then crtc enable, then bridges' post-enable (and vice versa for
+	 * disable).
+	 */
+
+	drm_atomic_helper_commit_encoder_bridge_disable(ddev, old_state);
+	drm_atomic_helper_commit_crtc_disable(ddev, old_state);
+	drm_atomic_helper_commit_encoder_bridge_post_disable(ddev, old_state);
+
+	drm_atomic_helper_update_legacy_modeset_state(ddev, old_state);
+	drm_atomic_helper_calc_timestamping_constants(old_state);
+	drm_atomic_helper_commit_crtc_set_mode(ddev, old_state);
+
+	drm_atomic_helper_commit_planes(ddev, old_state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+
+	drm_atomic_helper_commit_encoder_bridge_pre_enable(ddev, old_state);
+	drm_atomic_helper_commit_crtc_enable(ddev, old_state);
+	drm_atomic_helper_commit_encoder_bridge_enable(ddev, old_state);
+	drm_atomic_helper_commit_writebacks(ddev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(ddev, old_state);

-- 
2.43.0


