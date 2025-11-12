Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0B1CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cAQkV4Rn8OyxFd/w7bQq0NVjuvpKHFncgfCz73Iu0H0=; b=rxyznIfWaHSOV60ekMhg06siXY
	hIvaM8cCeJryyTDpCyVd9P8z8m44DxLJhrQU1oNXWYHRgR9ClXA7kHIie8BoGk9exkWcLKKwXJtem
	CnnZDFccCX3s/tabDN0xwQTvj28OeG63D9oqp105mF0nZPmzef+Len9VgPlb8HfoT27JlLX0UGCze
	pRb0wiI9ohDtd9r0a/FTAHubwRlVTjxDOxvOtN/78x0QFumiscCwPBcYLzq7CpmCpamsDBvB+fuau
	QyZworLlEL35WYyC6QY/gx5uilH+z3lHaLKsKoaWOA7Nq0DEAYNCc1Teg6lsiuhrrblW2YZA/Hq+7
	MdQUwRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6ZX-00000008OYJ-2ohZ;
	Wed, 12 Nov 2025 08:51:23 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6ZV-00000008OXZ-215b;
	Wed, 12 Nov 2025 08:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cA
	QkV4Rn8OyxFd/w7bQq0NVjuvpKHFncgfCz73Iu0H0=; b=o2ongftMKwj7pU/vbU
	3hBq52DAkNgcOIpyHCe4EY8kSorZwUR3c9MAEjmmNrlNpKMuBpv+ejzZa6t8quH3
	hkxoJ5MOhBrLJmbW/RmatjuiZNz4BUzW1sDRNhidMEOc5nvsJrPwTPteKheJ38D5
	WvCmiigBIhLjCXjL1ASANFqw4=
Received: from ProDesk.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3P71SShRpSgG+DQ--.50080S2;
	Wed, 12 Nov 2025 16:50:30 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	diederik@cknow-tech.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Use OVL_LAYER_SEL configuration instead of use win_mask calculate used layers
Date: Wed, 12 Nov 2025 16:50:23 +0800
Message-ID: <20251112085024.2480111-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgD3P71SShRpSgG+DQ--.50080S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWF45Wry3WrWDKr13Zw4xZwb_yoW5Kw4fpa
	y5Zr15Kr4xXFs0qFs7JF48ur1Yyws7Aa17A393K3sFy34FgryqyrnFkrnIyry5CF9rKFy2
	yrWDK3yDCrsFkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jx_-PUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRcHZWkUSlf8WQAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_005121_889998_170A8A1A 
X-CRM114-Status: GOOD (  19.40  )
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

When there are multiple Video Ports, and only one of them is working
(for example, VP1 is working while VP0 is not), in this case, the
win_mask of VP0 is 0. However, we have already set the port mux for VP0
according to vp0->nlayers, and at the same time, in the OVL_LAYER_SEL
register, there are windows will also be assigned to layers which will
map to the inactive VPs. In this situation, vp0->win_mask is zero as it
now working, it is more reliable to calculate the used layers based on
the configuration of the OVL_LAYER_SEL register.

Note: as the configuration of OVL_LAYER_SEL is take effect when the
vsync is come, so we use the value backup in vop2->old_layer_sel instead
of read OVL_LAYER_SEL directly.

Fixes: 3e89a8c68354 ("drm/rockchip: vop2: Fix the update of LAYER/PORT select registers when there are multi display output on rk3588/rk3568")
Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Closes: https://bugs.kde.org/show_bug.cgi?id=511274
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 49 +++++++++++++++++---
 1 file changed, 42 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index d22ce11a4235..f3950e8476a7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1369,6 +1369,25 @@ static const struct vop2_regs_dump rk3588_regs_dump[] = {
 	},
 };
 
+/*
+ * phys_id is used to identify a main window(Cluster Win/Smart Win, not
+ * include the sub win of a cluster or the multi area) that can do overlay
+ * in main overlay stage.
+ */
+static struct vop2_win *vop2_find_win_by_phys_id(struct vop2 *vop2, uint8_t phys_id)
+{
+	struct vop2_win *win;
+	int i;
+
+	for (i = 0; i < vop2->data->win_size; i++) {
+		win = &vop2->win[i];
+		if (win->data->phys_id == phys_id)
+			return win;
+	}
+
+	return NULL;
+}
+
 static unsigned long rk3568_set_intf_mux(struct vop2_video_port *vp, int id, u32 polflags)
 {
 	struct vop2 *vop2 = vp->vop2;
@@ -1842,15 +1861,31 @@ static void vop2_parse_alpha(struct vop2_alpha_config *alpha_config,
 	alpha->dst_alpha_ctrl.bits.factor_mode = ALPHA_SRC_INVERSE;
 }
 
-static int vop2_find_start_mixer_id_for_vp(struct vop2 *vop2, u8 port_id)
+static int vop2_find_start_mixer_id_for_vp(struct vop2_video_port *vp)
 {
-	struct vop2_video_port *vp;
-	int used_layer = 0;
+	struct vop2 *vop2 = vp->vop2;
+	struct vop2_win *win;
+	u32 layer_sel = vop2->old_layer_sel;
+	u32 used_layer = 0;
+	unsigned long win_mask = vp->win_mask;
+	unsigned long phys_id;
+	bool match;
 	int i;
 
-	for (i = 0; i < port_id; i++) {
-		vp = &vop2->vps[i];
-		used_layer += hweight32(vp->win_mask);
+	for (i = 0; i < 31; i += 4) {
+		match = false;
+		for_each_set_bit(phys_id, &win_mask, ROCKCHIP_VOP2_ESMART3) {
+			win = vop2_find_win_by_phys_id(vop2, phys_id);
+			if (win->data->layer_sel_id[vp->id] == ((layer_sel >> i) & 0xf)) {
+				match = true;
+				break;
+			}
+		}
+
+		if (!match)
+			used_layer += 1;
+		else
+			break;
 	}
 
 	return used_layer;
@@ -1935,7 +1970,7 @@ static void vop2_setup_alpha(struct vop2_video_port *vp)
 	u32 dst_global_alpha = DRM_BLEND_ALPHA_OPAQUE;
 
 	if (vop2->version <= VOP_VERSION_RK3588)
-		mixer_id = vop2_find_start_mixer_id_for_vp(vop2, vp->id);
+		mixer_id = vop2_find_start_mixer_id_for_vp(vp);
 	else
 		mixer_id = 0;
 
-- 
2.43.0

base-commit: ded94ec6167e84195507237100f6278941e36fdd
branch: drm-misc-next-2025-1016


