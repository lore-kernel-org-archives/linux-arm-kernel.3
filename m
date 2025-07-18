Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83596C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 06:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSFFPUD/qWfzfiLjVHrEGF4oSBguPRgle0bRPJlq2Zk=; b=X3OXra+7NymkUgtCs+1ytr9Qax
	P7yLeivqRvF4dIgEzXQ5qZkNcXC5ZC45M3WfxB2H1UKEeaPR5g7cKfwP8NYjmZixs9JrdJzgjakQa
	/YKTZEdDyh3/RYEPnh15rc2MCcLrbEebc1wQxE5F1VRaz/lKtW2JSMKsFk+L+8mreXbeJuUymHcWb
	ISriUHe8z6ArC4OM47zAqc/WxVtuN5rWeeYyqxlDTEd/OrbsZD/RL4gxk1vCtDa+CxK8jjbpTITGY
	sEIenszq5WkTQZ4wqzT2h7NPUKEQYlyDftrk2mxV4U3lZgALhnBIybFHLcDd0lrSwvFRcPGFIHsw0
	WSqMUQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucexs-0000000BohB-3QEu;
	Fri, 18 Jul 2025 06:53:05 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucemm-0000000BnPs-1UhD;
	Fri, 18 Jul 2025 06:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=rS
	FFPUD/qWfzfiLjVHrEGF4oSBguPRgle0bRPJlq2Zk=; b=nU/FIJyISJGBOgiBCr
	hdd1/XC1VbKGG5SN561BzEKy5s8ppxS3JzDPgbNKxkyM1Z9Xo5KHIK3Cp4ao6ci+
	iJJdeulgXFTdliEEG+Sv/0h+VGrE4Z8k3ZjNdW1jjlbChfKU9bopOSU8WRRtI8VV
	fBHbWI7cvmr+Z/37pRPC6F8LA=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wCHvgSR7HloFskiFg--.22270S3;
	Fri, 18 Jul 2025 14:41:27 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 2/2] drm/rockchip: vop2: Only wait for changed layer cfg done when there is pending cfgdone bits
Date: Fri, 18 Jul 2025 14:41:14 +0800
Message-ID: <20250718064120.8811-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250718064120.8811-1-andyshrk@163.com>
References: <20250718064120.8811-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHvgSR7HloFskiFg--.22270S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw15Zr15Ar4UXr13Aw47urg_yoW8Zw4Upa
	15CF42gas7GrWYv34vyF4kZrWay3ZrAF4xXws7Kw1xArWrtr1DG39xurn5Ar15JFn7uFWY
	yrWDXF98uFWjqaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jc189UUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgSOXmh56BWTowABsb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_234136_749371_FE53D531 
X-CRM114-Status: GOOD (  12.15  )
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

The write of cfgdone bits always done at .atomic_flush.
When userspace makes plane zpos changes of two crtc within one commit,
at the .atomic_begin stage, crtcN will never receive the "layer change
cfg done" event of crtcM because crtcM has not yet written "cfgdone".
So only wait when there is pending cfgdone bits to avoid long timeout.

Fixes: 3e89a8c68354 ("drm/rockchip: vop2: Fix the update of LAYER/PORT select registers when there are multi display output on rk3588/rk3568")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index d712c5b6b50e3..02d93190e9850 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2106,6 +2106,7 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	u8 layer_sel_id;
 	unsigned int ofs;
 	u32 ovl_ctrl;
+	u32 cfg_done;
 	int i;
 	struct vop2_video_port *vp0 = &vop2->vps[0];
 	struct vop2_video_port *vp1 = &vop2->vps[1];
@@ -2260,8 +2261,16 @@ static void rk3568_vop2_setup_layer_mixer(struct vop2_video_port *vp)
 		rk3568_vop2_wait_for_port_mux_done(vop2);
 	}
 
-	if (layer_sel != old_layer_sel && atv_layer_sel != old_layer_sel)
-		rk3568_vop2_wait_for_layer_cfg_done(vop2, vop2->old_layer_sel);
+	if (layer_sel != old_layer_sel && atv_layer_sel != old_layer_sel) {
+		cfg_done = vop2_readl(vop2, RK3568_REG_CFG_DONE);
+		cfg_done &= (BIT(vop2->data->nr_vps) - 1);
+		cfg_done &= ~BIT(vp->id);
+		/*
+		 * Changes of other VPs' overlays have not taken effect
+		 */
+		if (cfg_done)
+			rk3568_vop2_wait_for_layer_cfg_done(vop2, vop2->old_layer_sel);
+	}
 
 	vop2_writel(vop2, RK3568_OVL_LAYER_SEL, layer_sel);
 	mutex_unlock(&vop2->ovl_lock);
-- 
2.43.0


