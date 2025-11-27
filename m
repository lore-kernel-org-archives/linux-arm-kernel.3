Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D3D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:CC:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yb36xAodD5X+V0YdcWw6D1tyh3fN8c2aGFyosNCj9Ls=; b=b5BTCcZ3mw5gtmtdr1l8smQD3z
	XdDWie6yCWhBI+HVe80irXoc/A0kQ2Va0guk4b8AvMpLFAcXjzeO6QgE9Y2R5Vwi69buXigunZTp6
	AkArDoCwRxtM8IVRy+brQvPUtUCaoGOW5ynvuFkfd7AAWI7B+LatmIr9qVnaQnhKPAEj1UMrvrig6
	CfjitTrjkVrK5CGSxuVreJiStsQgCHn7zDWuYnbbDxrmmGxc8vgo24V0T7aWwn3qIwFkL40lQLxNA
	8vtDilBMM5BlMOxHVtD+ckdACL6VVpPGpa2+ZEwMeODqa1hEevfXs+IQ412Azo1hMk/Fz8sSGAwyw
	y4B14Wmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdEO-0000000Gngy-2cSe;
	Thu, 27 Nov 2025 14:44:24 +0000
Received: from mx01.omp.ru ([90.154.21.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdEJ-0000000GnfY-2nxs;
	Thu, 27 Nov 2025 14:44:22 +0000
Received: from [192.168.2.104] (213.87.138.55) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 27 Nov
 2025 17:43:56 +0300
Message-ID: <8753beda-f74c-41b5-b9ad-823fdf227215@omp.ru>
Date: Thu, 27 Nov 2025 17:43:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH] drm/rockchip: vop: avoid division by 0 in scl_cal_scale*()
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
	<heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-rockchip@lists.infradead.org>
CC: Mark Yao <markyao0591@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	Karina Yankevich <k.yankevich@omp.ru>, <lvc-project@linuxtesting.org>
Content-Language: en-US
Organization: Open Mobile Platform
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [213.87.138.55]
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 11/27/2025 14:27:21
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 198483 [Nov 27 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 81 0.3.81
 2adfceff315e7344370a427642ad41a4cfd99e1f
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1
X-KSE-AntiSpam-Info: {Tracking_ip_hunter}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 213.87.138.55
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/27/2025 14:30:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 11/27/2025 9:47:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_064419_715077_E3416077 
X-CRM114-Status: UNSURE (   8.88  )
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

In scl_cal_scale*(), if the dst parameter equals 1, then division by 0
will happen. We'll have to add a check for the destination rectangle's
width/height being < 2 in vop_plane_atomic_check(), just like the VOP2
driver has to check for the width/height being < 4...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 4c156c21c794 ("drm/rockchip: vop: support plane scale")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: stable@vger.kernel.org

---
The patch is against the drm-misc-fixes branch of the DRM kernel.git repo
on gitlab.freedesktop.org.  It replaces [1] for which I've got no neither
feedback nor testing...

[1] https://lore.kernel.org/all/40da59f8-10e9-49b0-9f25-1474067625f6@omp.ru/

 drivers/gpu/drm/rockchip/rockchip_drm_vop.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

Index: kernel/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
===================================================================
--- kernel.orig/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ kernel/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -817,6 +817,7 @@ static int vop_plane_atomic_check(struct
 	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct vop_win *vop_win = to_vop_win(plane);
 	const struct vop_win_data *win = vop_win->data;
+	struct drm_rect *dest = &new_plane_state->dst;
 	int ret;
 	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) :
 					DRM_PLANE_NO_SCALING;
@@ -844,6 +845,16 @@ static int vop_plane_atomic_check(struct
 	if (ret < 0)
 		return ret;
 
+	if (win->phy->scl) {
+		/* Disallow width/height < 2 to avoid division by 0. */
+		if (drm_rect_width(dest) < 2 || drm_rect_height(dest) < 2) {
+			DRM_DEBUG_KMS("Invalid dest size: %dx%d, min size is 2x2\n",
+				      drm_rect_width(dest), drm_rect_height(dest));
+			new_plane_state->visible = false;
+			return 0;
+		}
+	}
+
 	/*
 	 * Src.x1 can be odd when do clip, but yuv plane start point
 	 * need align with 2 pixel.

