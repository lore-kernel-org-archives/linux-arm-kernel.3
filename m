Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4219510987AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXwegkkC2NsAu3loi2zmZXBqvHFGUmGmMlDQWd109sI=; b=AMnWKXoa7M75DS740xp1YURaCu
	AKKHJ+dJnsTKR3SiT8UsYK/4JuMziBysTNo8Be7O5o50BXVHoSmGmg4OZAtiW7pn2Yhy9Vw0zAu5K
	V4BJg1u7TLAGjsA6FzgKu5ihKc08aYhQkU1zV3Q0PRYKXA71l79mF6o4HFVO99Zk1XdXao8M8Bfk6
	Mj1h6UWfvfS3mUTTKRL9K7ysHMdQM+BcLgAJoWfSyCfvOcb5eJ2wx6hx7B0k8YERhVFmtVdD0KCdT
	MqgqmI54ws5l5Ju2dkUvVavuOym4Mvcbj1bnqURw/z9F1ipFRsbYmGax7Wb2Ght8s08By1z2Aq4vE
	zm8HiS0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chL-0000000D7jL-4788;
	Fri, 20 Mar 2026 16:27:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3chH-0000000D7gK-26Zv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3041243253;
	Fri, 20 Mar 2026 16:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878CAC4CEF7;
	Fri, 20 Mar 2026 16:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774024059;
	bh=n4LHo+A3sGmgVx5XTgxskitpmhWZc2WFNui06B/31zE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GGrjLJndjxsZX/x+aJ0oaVTO4nTdlgT9wZZTHsVp2XLsJsx3RoxNOZChyF7RMbD0b
	 1HtspmxvV3b4e50CJg1v4sZgvMy8xjKT0RfjTReFiBVJNSw2RuJIGR0zW3qCo/hSdX
	 QyY3ipfNcOhbTeVPCVWD8MhVsEfGF83iVUjpnu/qaoSkrC85n1zr3GTltrDO257OKg
	 34JfRXhLPDaxCnARYXKYAPZh13DI99sT0U1GV2WYOTtkh8urYnQd/WSmbCL+TM6Pyn
	 yV1gQD8z4QiZoPwMLSUEqGxoaDCD4vT3sJcMhKN/HPIY6wnghSI3txCIiAIdC9bNdn
	 iF5pfcEj3aW6w==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 20 Mar 2026 17:27:11 +0100
Subject: [PATCH v2 04/20] drm/colorop: Rename __drm_colorop_state_reset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-drm-mode-config-init-v2-4-c63f1134e76c@kernel.org>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
In-Reply-To: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
 Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Alex Hung <alex.hung@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298; i=mripard@kernel.org;
 h=from:subject:message-id; bh=n4LHo+A3sGmgVx5XTgxskitpmhWZc2WFNui06B/31zE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl7S1M/7ZpcevxNoYiS0MM966LT+t91K/3scX8juG1Ha
 5PMAv5HHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiK58y1rs3FmS827toya6i
 7AddXRI+djbMbSK+zNf4MrfnSj5ie/1ehoO1TXslr4p7UHnphYW3GRv+2wcdjth22e/bz4JuGdt
 P1tO65c/4V1jcWH+1efO1SfvdZO+mnGUp7Qj+P+O8RUhnjxQA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_092739_594827_DF05BCCC 
X-CRM114-Status: GOOD (  12.06  )
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

__drm_colorop_state_reset() is used to initialize a newly allocated
drm_colorop_state, and is being typically called by drm_colorop_reset().

Since we want to consolidate DRM objects state allocation around the
atomic_create_state callback that will only allocate and initialize a
new drm_colorop_state instance, we will need to call
__drm_colorop_state_reset() from both the reset and atomic_create paths.

To avoid any confusion, we can thus rename __drm_colorop_state_reset()
to __drm_colorop_state_init().

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_colorop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 373cd0ddb8fd4478874509ed12c95451c1f66203..6a26b83b260e8d8e83c703ecde490a7a8740ebfb 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -498,19 +498,19 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
 	__drm_atomic_helper_colorop_destroy_state(state);
 	kfree(state);
 }
 
 /**
- * __drm_colorop_state_reset - resets colorop state to default values
+ * __drm_colorop_state_init - Initializes colorop state to default values
  * @colorop_state: atomic colorop state, must not be NULL
  * @colorop: colorop object, must not be NULL
  *
  * Initializes the newly allocated @colorop_state with default
  * values. This is useful for drivers that subclass the colorop state.
  */
-static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
-				      struct drm_colorop *colorop)
+static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
+				     struct drm_colorop *colorop)
 {
 	u64 val;
 
 	colorop_state->colorop = colorop;
 	colorop_state->bypass = true;
@@ -537,11 +537,11 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
  */
 static void __drm_colorop_reset(struct drm_colorop *colorop,
 				struct drm_colorop_state *colorop_state)
 {
 	if (colorop_state)
-		__drm_colorop_state_reset(colorop_state, colorop);
+		__drm_colorop_state_init(colorop_state, colorop);
 
 	colorop->state = colorop_state;
 }
 
 void drm_colorop_reset(struct drm_colorop *colorop)

-- 
2.53.0


