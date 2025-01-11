Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2680DE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 11:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpClkZEI5D6kO/kYiTNkj5YjM1oJMKfFedcu1QFFa5U=; b=fXmUnfQyvn9DVDPevzLy3koTga
	lAfAKBv7JiFPqQkzBRBsT4Jkkwn2iRAE26PVkqamGStLIef/R+qSr7ec9JoNX7kRczqmJR2CafyEg
	1wz9eF9Ed+YFSyVNrDNobBuCr2iALSXcVUBPTFtTvmXUhg3rCcXNoFqnjVGt/oe9zv320EcBAePWJ
	2HdG4oneJ5uWlr5H57TJXtZPAMSMgNT34d9So/1xHMavwwTU/msbAn9YQS+JI293WGrDbPri7QevF
	DcOwi2cIXqibfIQKU5N8I5WCd/z1H1/BShm+swPRfPA4rL5I4dLdAimwvGRG/DJ+T8PPd1dfwdN3b
	2yd/wFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWZis-00000000hOq-1yO5;
	Sat, 11 Jan 2025 11:32:10 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWZe8-00000000gLs-1AxH;
	Sat, 11 Jan 2025 11:27:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=wpClk
	ZEI5D6kO/kYiTNkj5YjM1oJMKfFedcu1QFFa5U=; b=J9seELlFYSyClkSjE+jI2
	Gb6jAvIbClPtYR+parPa+okw0QPDcOPf7ekWLuETrUNuGR9oIoZMI8BWN8H4Qzut
	5moK1H12JkNmkxHII3Eppci7XtI1vG0QVh65wAXGwrnQ6o/Njud4HQETwazRXPxS
	nTWfaoZ8N52AV5Jx74+z1o=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDn36JYVYJnnIeyFQ--.42561S8;
	Sat, 11 Jan 2025 19:26:32 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	daniel@fooishbar.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v11 06/11] drm/rockchip: vop2: Introduce vop hardware version
Date: Sat, 11 Jan 2025 19:26:04 +0800
Message-ID: <20250111112614.432247-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250111112614.432247-1-andyshrk@163.com>
References: <20250111112614.432247-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDn36JYVYJnnIeyFQ--.42561S8
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xry3tF47Cry8WF4fWF1xXwb_yoWxKw1xpF
	W7Aay5WrWxGa1qgw4kJay3ZF43twn2yay7JanrGw13t3sxKr9rGan0qF1ayFZ8tr92kr4j
	yFs7ArW5WF4jyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOSdgUUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hbRXmeCTmhuCAAAsu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_032716_724019_78964FB3 
X-CRM114-Status: GOOD (  18.68  )
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

From: Andy Yan <andy.yan@rock-chips.com>

There is a version number hardcoded in the VOP VERSION_INFO
register, and the version number increments sequentially based
on the production order of the SOC.

So using this version number to distinguish different VOP features
will simplify the code.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Michael Riesch <michael.riesch@wolfvision.net> # on RK3568
Tested-by: Detlev Casanova <detlev.casanova@collabora.com>

---

(no changes since v6)

Changes in v6:
- Add a blank line after hardware version check code

Changes in v3:
- Add comments for why we should treat rk3566 with special care.
- Add hardware version check

Changes in v2:
- Introduce vop hardware version

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 26 ++++++++++++++------
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 11 +++++++++
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c |  3 +++
 3 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 29a81ff152f3..a1a0383713b5 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -354,7 +354,7 @@ static bool vop2_output_uv_swap(u32 bus_format, u32 output_mode)
 
 static bool vop2_output_rg_swap(struct vop2 *vop2, u32 bus_format)
 {
-	if (vop2->data->soc_id == 3588) {
+	if (vop2->version == VOP_VERSION_RK3588) {
 		if (bus_format == MEDIA_BUS_FMT_YUV8_1X24 ||
 		    bus_format == MEDIA_BUS_FMT_YUV10_1X30)
 			return true;
@@ -407,7 +407,7 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 	if (modifier == DRM_FORMAT_MOD_INVALID)
 		return false;
 
-	if (vop2->data->soc_id == 3568 || vop2->data->soc_id == 3566) {
+	if (vop2->version == VOP_VERSION_RK3568) {
 		if (vop2_cluster_window(win)) {
 			if (modifier == DRM_FORMAT_MOD_LINEAR) {
 				drm_dbg_kms(vop2->drm,
@@ -418,7 +418,7 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 	}
 
 	if (format == DRM_FORMAT_XRGB2101010 || format == DRM_FORMAT_XBGR2101010) {
-		if (vop2->data->soc_id == 3588) {
+		if (vop2->version == VOP_VERSION_RK3588) {
 			if (!rockchip_afbc(plane, modifier)) {
 				drm_dbg_kms(vop2->drm, "Only support 32 bpp format with afbc\n");
 				return false;
@@ -817,6 +817,7 @@ static void rk3588_vop2_power_domain_enable_all(struct vop2 *vop2)
 static void vop2_enable(struct vop2 *vop2)
 {
 	int ret;
+	u32 version;
 
 	ret = pm_runtime_resume_and_get(vop2->dev);
 	if (ret < 0) {
@@ -836,10 +837,20 @@ static void vop2_enable(struct vop2 *vop2)
 		return;
 	}
 
+	version = vop2_readl(vop2, RK3568_VERSION_INFO);
+	if (version != vop2->version) {
+		drm_err(vop2->drm, "Hardware version(0x%08x) mismatch\n", version);
+		return;
+	}
+
+	/*
+	 * rk3566 share the same vop version with rk3568, so
+	 * wen need to use soc_id for identification here.
+	 */
 	if (vop2->data->soc_id == 3566)
 		vop2_writel(vop2, RK3568_OTP_WIN_EN, 1);
 
-	if (vop2->data->soc_id == 3588)
+	if (vop2->version == VOP_VERSION_RK3588)
 		rk3588_vop2_power_domain_enable_all(vop2);
 
 	vop2_writel(vop2, RK3568_REG_CFG_DONE, RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);
@@ -920,7 +931,7 @@ static void vop2_vp_dsp_lut_update_enable(struct vop2_video_port *vp)
 
 static inline bool vop2_supports_seamless_gamma_lut_update(struct vop2 *vop2)
 {
-	return (vop2->data->soc_id != 3566 && vop2->data->soc_id != 3568);
+	return vop2->version != VOP_VERSION_RK3568;
 }
 
 static bool vop2_gamma_lut_in_use(struct vop2 *vop2, struct vop2_video_port *vp)
@@ -1259,7 +1270,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		&fb->format->format,
 		afbc_en ? "AFBC" : "", &yrgb_mst);
 
-	if (vop2->data->soc_id > 3568) {
+	if (vop2->version > VOP_VERSION_RK3568) {
 		vop2_win_write(win, VOP2_WIN_AXI_BUS_ID, win->data->axi_bus_id);
 		vop2_win_write(win, VOP2_WIN_AXI_YRGB_R_ID, win->data->axi_yrgb_r_id);
 		vop2_win_write(win, VOP2_WIN_AXI_UV_R_ID, win->data->axi_uv_r_id);
@@ -1319,7 +1330,7 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		 * this bit is gating disable, we should write 1 to
 		 * disable gating when enable afbc.
 		 */
-		if (vop2->data->soc_id == 3566 || vop2->data->soc_id == 3568)
+		if (vop2->version == VOP_VERSION_RK3568)
 			vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 0);
 		else
 			vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 1);
@@ -2498,6 +2509,7 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 	vop2->dev = dev;
 	vop2->data = vop2_data;
 	vop2->ops = vop2_data->ops;
+	vop2->version = vop2_data->version;
 	vop2->drm = drm;
 
 	dev_set_drvdata(dev, vop2);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 37cdf0ed9455..485462749121 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -13,6 +13,15 @@
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
 
+#define VOP2_VERSION(major, minor, build)	((major) << 24 | (minor) << 16 | (build))
+
+/* The new SOC VOP version is bigger than the old */
+#define VOP_VERSION_RK3568	VOP2_VERSION(0x40, 0x15, 0x8023)
+#define VOP_VERSION_RK3588	VOP2_VERSION(0x40, 0x17, 0x6786)
+#define VOP_VERSION_RK3528	VOP2_VERSION(0x50, 0x17, 0x1263)
+#define VOP_VERSION_RK3562	VOP2_VERSION(0x50, 0x17, 0x4350)
+#define VOP_VERSION_RK3576	VOP2_VERSION(0x50, 0x19, 0x9765)
+
 #define VOP2_VP_FEATURE_OUTPUT_10BIT        BIT(0)
 
 #define VOP2_FEATURE_HAS_SYS_GRF	BIT(0)
@@ -242,6 +251,7 @@ struct vop2_ops {
 struct vop2_data {
 	u8 nr_vps;
 	u64 feature;
+	u32 version;
 	const struct vop2_ops *ops;
 	const struct vop2_win_data *win;
 	const struct vop2_video_port_data *vp;
@@ -259,6 +269,7 @@ struct vop2_data {
 };
 
 struct vop2 {
+	u32 version;
 	struct device *dev;
 	struct drm_device *drm;
 	struct vop2_video_port vps[ROCKCHIP_MAX_CRTC];
diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 8160f76de995..248b9e6729e9 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1627,6 +1627,7 @@ static const struct vop2_ops rk3588_vop_ops = {
 };
 
 static const struct vop2_data rk3566_vop = {
+	.version = VOP_VERSION_RK3568,
 	.feature = VOP2_FEATURE_HAS_SYS_GRF,
 	.nr_vps = 3,
 	.max_input = { 4096, 2304 },
@@ -1645,6 +1646,7 @@ static const struct vop2_data rk3566_vop = {
 };
 
 static const struct vop2_data rk3568_vop = {
+	.version = VOP_VERSION_RK3568,
 	.feature = VOP2_FEATURE_HAS_SYS_GRF,
 	.nr_vps = 3,
 	.max_input = { 4096, 2304 },
@@ -1663,6 +1665,7 @@ static const struct vop2_data rk3568_vop = {
 };
 
 static const struct vop2_data rk3588_vop = {
+	.version = VOP_VERSION_RK3588,
 	.feature = VOP2_FEATURE_HAS_SYS_GRF | VOP2_FEATURE_HAS_VO1_GRF |
 		   VOP2_FEATURE_HAS_VOP_GRF | VOP2_FEATURE_HAS_SYS_PMU,
 	.nr_vps = 4,
-- 
2.34.1


