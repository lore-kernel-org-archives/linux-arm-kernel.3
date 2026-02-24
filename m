Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5823CE9B251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcfIUOlkxFeGb9htFIS/KCRXu5wCKzwM9bULN3oB7p0=; b=1sEwuMNdkROTZpKNvVU3GHwAbb
	5aOd+V6fYHdoyM3oEtUvRxL37XJ229+PWIpulrD0ISBkN5endMQEklVVDBROs1JCSVg/rK24GrKYA
	/HKDIN1hJAoBfJrC69wIFaT6AnAf+CEoUTS311PDujJKDZaJ2Q2xDsl+LWfgdCGDEVZZYE+gYjxuq
	cSzN/cswgFuwIoUsLrNmZgaJ11jD8M6GMduVfGdZ9bKjvmZXIhl9tf7PcEHD7g3In2B29y0zImTlZ
	DCwykkiYLuNM3oxmtkvYlyKsU0X5KSj1qXlep0VPxFgRH/r5cfdtSovWWCioguolrFQoQC/8gnPaE
	5OF9O8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8G-00000001tzL-1W9Z;
	Tue, 24 Feb 2026 10:59:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8C-00000001tu2-1Zz9;
	Tue, 24 Feb 2026 10:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DA181433D3;
	Tue, 24 Feb 2026 10:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3112DC19422;
	Tue, 24 Feb 2026 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930747;
	bh=OeeGzO/KLx6EJzG/Idd41Wc70LCXimdZNiuuzRbpSjI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dxqN42ndzCUcgvWhpr3TrtupaWCQk7L6IorkqhN9OLa9Hq0aQBzHBoO9gvonUs/1i
	 NJaSfEoEhBaE2IpDO2fipNYlp2gcjR3cLA+R4LxbPcg6iohOdVuhpjRtu3x4Ebq3f8
	 00sRTStAN2Kr9WVGYUjyV+5YkSEcMIr7F143IqsAlw0/w897+sXf8TrJhiRHgaGqEd
	 zQjylVFBKHTHst6Qrjxto35QOCYLDrlezdIhX01vjQvyijduVF5caxc8kJRWk0wnl0
	 Y6hNpsYP2fJDklesjNSr9lEoKAWnzpYfuzDL0tIplBJFpmIb7qBFSSgZAZIvlENhtn
	 qugB7+iGohFdQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:44 +0100
Subject: [PATCH 05/14] drm/bridge: adv7511: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-5-bebc76604ada@kernel.org>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
In-Reply-To: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574; i=mripard@kernel.org;
 h=from:subject:message-id; bh=OeeGzO/KLx6EJzG/Idd41Wc70LCXimdZNiuuzRbpSjI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW1Ku7GgLWsM/a+vcv5UCN8z2Wq1lnGcodM63SW0S8
 w8dudPtHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi76Yw1lkFTTHTe7zf3Dv8
 /x2t9IcMMz5aJR7c90vgc3X/7+jIEHELidmN2ot2fsrhOhR5/0xSKGPD6mM+D2r14zd9OXOe6aa
 9pdOqauF8tgL+l9LrHW7NMgr7uilq6q+VLb/v8tb5i83+33UAAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_025908_497341_97FEDF56 
X-CRM114-Status: GOOD (  13.15  )
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

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main different is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 1050bb62280bb4794f0b0ae01597269652c063d0..6bd76c1fb0071c8c9cd9c293b3a48a2b4487768e 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -226,11 +226,11 @@ static void adv7511_set_config_csc(struct adv7511 *adv7511,
 	} else {
 		config.csc_scaling_factor = ADV7511_CSC_SCALING_4;
 		config.csc_coefficents = adv7511_csc_ycbcr_to_rgb;
 
 		if ((connector->display_info.color_formats &
-		     DRM_COLOR_FORMAT_YCBCR422) &&
+		     BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422)) &&
 		    connector->display_info.is_hdmi) {
 			config.csc_enable = false;
 			output_format_422 = true;
 			output_format_ycbcr = true;
 		} else {

-- 
2.52.0


