Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B9DC369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 04:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8Ze0YrAsRvM56Guf/YtrV37Q0EOqSVlsBXfjoOyn44=; b=YIlorjbANgemfXQW2aunbBMqgV
	bem/QwA+ULtP/MHrRteIfcu62Kemf7F55ZNYdb8jJkP7cOYVQS8B+szRmXp+PlzjDYebmpybbit72
	qrToxfBJ6KJWR16zldQ43n3mWyzouy4rnScPQFIkllBhxUQ3VreGVq8weLpFUYI0tg4hWbyU3hOap
	docqDjrLgZOEsFE/Isuat482yx2T+J3JHSqHsH2yekGNMz5X685I6f5rs8MFsDD5QrI0jJbFLiYVE
	/W1lwcakz2fHJXqZui3zG4g9s+/ycf+qMsO7n90inLkLok09FW4uGPFmiLwz2P+eh8qI7RQPaixzM
	Iq6aYbtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Gme-0000000BfqG-01Lr;
	Thu, 17 Apr 2025 04:23:28 +0000
Received: from p-west1-cluster1-host6-snip6-8.eps.apple.com ([2a01:b747:3003:200::3d] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Gkn-0000000BfiE-2Gla
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 04:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
	bh=s8Ze0YrAsRvM56Guf/YtrV37Q0EOqSVlsBXfjoOyn44=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=vhp8GUSLBS9mDgmUKnWpMptHb4zydL8N8Q+yPOxVFS09PTXCud15z3gPBzO3dX0tR
	 D4wVQlPUv8ekGnXXgWTPArmYE6P2Y6kszaQHor1oci2Z/C9hnySBVEzGfLk3hBNe8q
	 AC/QsW4+2F4JhMYw+Eu6KJIeJMpHTfz0x62ti+hy4zjPqqwxNXEXVpiReEFhK15o4j
	 FkDWrllt0iUyfxzUfxKthOgXrLhnmgvdJb0pxbfuuzh5af/kGWDmqem406WC+lW6rJ
	 GNjjuiW/KPBzFldVR55+nCT0DHzALxy5khBU+U60TmdYsBtoB0PkifETVNBABr2GmB
	 EmaixC3zjIU5Q==
Received: from localhost (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id CF1A418000AF;
	Thu, 17 Apr 2025 04:21:18 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Konstantin Shabanov <mail@etehtsea.me>,
	Daniel Stone <daniel@fooishbar.org>,
	Andy Yan <andyshrk@163.com>,
	Dan Callaghan <djc@djc.id.au>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drm/rockchip: Disable AFBC for res >2560 on rk3399
Date: Thu, 17 Apr 2025 04:20:08 +0000
Message-ID: <20250417042008.28536-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250414095332.9674-1-mail@etehtsea.me>
References: <20250414095332.9674-1-mail@etehtsea.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MXRK0RV78ZYYop4SgACsYfnc7XchLLpL
X-Proofpoint-ORIG-GUID: MXRK0RV78ZYYop4SgACsYfnc7XchLLpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1030 spamscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504170032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_212133_615363_C98C3A95 
X-CRM114-Status: GOOD (  13.59  )
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

As it isn't supported by hardware. At least, RK3399 doesn't support
it. From the datasheet[1]
("1.2.10 Video IN/OUT", "Display Interface", p. 17):

  Support AFBC function co-operation with GPU
    * support 2560x1600 UI

Manually tested on RockPro64 (rk3399):
- ARM_AFBC modifier is used for 1920x1080
- DRM_FORMAT_MOD_LINEAR modifier us used for 3840x2160
- No noise on the screen when sway is running in 4k
- Dynamic resolution switching works correctly in sway

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
Cc: Daniel Stone <daniel@fooishbar.org>
Cc: Andy Yan <andyshrk@163.com>
Reported-by: Dan Callaghan <djc@djc.id.au>
Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/7968

[1]: https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399_Datasheet_V2.1-20200323.pdf
---
V2 -> V3: Run check only on rk3399
V1 -> V2: Move the check to the fb_create callback

Hi Andy and Daniel!
Thank you for the review!

Best wishes,
Konstantin

 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index dcc1f07632c3..6ca757f80a30 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -5,6 +5,7 @@
  */

 #include <linux/kernel.h>
+#include <linux/of.h>

 #include <drm/drm.h>
 #include <drm/drm_atomic.h>
@@ -17,6 +18,9 @@
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_fb.h"
 #include "rockchip_drm_gem.h"
+#include "rockchip_drm_vop.h"
+
+#define RK3399_AFBC_MAX_WIDTH		2560

 static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
 	.destroy       = drm_gem_fb_destroy,
@@ -52,6 +56,15 @@ rockchip_fb_create(struct drm_device *dev, struct drm_file *file,
 	}

 	if (drm_is_afbc(mode_cmd->modifier[0])) {
+		if (of_machine_is_compatible("rockchip,rk3399")) {
+			if (mode_cmd->width > RK3399_AFBC_MAX_WIDTH) {
+				DRM_DEBUG_KMS("AFBC is not supported for the width %d (max %d)\n",
+					      mode_cmd->width,
+					      RK3399_AFBC_MAX_WIDTH);
+				return ERR_PTR(-EINVAL);
+			};
+		}
+
 		int ret, i;

 		ret = drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb);

base-commit: 4890d68db651562ea80250f2c93205a5c0327a6a
--
2.48.1

