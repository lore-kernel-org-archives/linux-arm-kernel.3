Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF0CC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vX1nStTTyA2W3EtaX3VYwa1Dfg3sYgIY5n0SdMP1A9E=; b=vJLm+izDbtsIT6UuPJYaw5DCod
	cUyG1TM3gECiDbatdhmLz3fjTMQ4i46j8+4L9wwamqb1P3QNHhyhJ7D2FGY1NofCVc7jXNgU0PEPV
	yOB6u3kfUIhDlo8yy/k1Me7a7sL9EyRmd8n35oTfauU1LHAq7jjZyqk/6UPexbwGy6eGAKoWsVktD
	5opPi1mPiqDiFpF06Khx9vESQLiLsANxawvTjyOX3unUaSFZP3eb8ZUmUsL2UbZbQQruu7HzdYnzs
	lKvAsqPqO7ezJGah2rjzFJgO7Dsg8mRVmj4htoMnGMTLV4rd72tYoMKSqlBSVkRnR4mYUcDCVrV2v
	K+P3jLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0EPY-00000007ypy-40k4;
	Thu, 03 Apr 2025 06:50:48 +0000
Received: from qs51p00im-qukt01071901.me.com ([17.57.155.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ENn-00000007yTn-0mka
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 06:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
	bh=vX1nStTTyA2W3EtaX3VYwa1Dfg3sYgIY5n0SdMP1A9E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=WNBc/xzqW6hc1w1xvZmvNkALMThcoORtpqWzc7S6k7HpLwRWJ7z0ZwCosnW2DI84q
	 WNlBe//viYmPWvRelVykEW34qz7BL8uEXH8iwMXxGT8xWjXc3biR0LqjTI0S7Tr46+
	 qmsAYrIEQkBImg0HFe2zGG18uVPPPwAMstTBZGP30uABvJC+33/NoP6jAjcAcBeHCZ
	 cZccEECTodC9jTwSognP9wksu5sSbQFh1KaeEJgof1JDJkSWNGPbJjaoFti9h55x61
	 GIGpDRkit07NAIRTsNEOZQnjiSoWE+e0ovF+v+6mg4GtnHehGwRyPzDHPs8H19eFk+
	 JVrHi/7I9YRwg==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01071901.me.com (Postfix) with ESMTPSA id DC75962801F9;
	Thu,  3 Apr 2025 06:48:50 +0000 (UTC)
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
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] (drm/rockchip): Consistently use rk3399 registers consts
Date: Thu,  3 Apr 2025 06:47:39 +0000
Message-ID: <20250403064740.4016-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F5HyCAe8Rgl6mAQE-0KnVlkmIu4GVdCO
X-Proofpoint-ORIG-GUID: F5HyCAe8Rgl6mAQE-0KnVlkmIu4GVdCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_02,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=386
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 clxscore=1030 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503100000 definitions=main-2504030033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_234859_346289_3A616496 
X-CRM114-Status: UNSURE (   9.48  )
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

As rk3399 has its own registers definitions, update related structs to
use them.
There are no changes in behaviour as updated constants values are the
 for rk3288/rk3368/rk3399 chips.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
---
Apologies for resend. The first email hadn't reached the mailing list for some reason.

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 94 ++++++++++-----------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 4e2099d86517..d1f788763318 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -906,21 +906,21 @@ static const struct vop_data rk3366_vop = {

 static const struct vop_output rk3399_output = {
 	.dp_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 19),
-	.rgb_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 19),
-	.hdmi_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 23),
-	.edp_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 27),
-	.mipi_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 31),
+	.rgb_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 19),
+	.hdmi_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 23),
+	.edp_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 27),
+	.mipi_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 31),
 	.dp_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 16),
-	.rgb_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 16),
-	.hdmi_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 20),
-	.edp_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 24),
-	.mipi_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 28),
+	.rgb_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 16),
+	.hdmi_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 20),
+	.edp_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 24),
+	.mipi_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 28),
 	.dp_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 11),
-	.rgb_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 12),
-	.hdmi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 13),
-	.edp_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 14),
-	.mipi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 15),
-	.mipi_dual_channel_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 3),
+	.rgb_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 12),
+	.hdmi_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 13),
+	.edp_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 14),
+	.mipi_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 15),
+	.mipi_dual_channel_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 3),
 };

 static const struct vop_common rk3399_common = {
@@ -975,23 +975,23 @@ static const struct vop_win_phy rk3399_win0_data = {
 	.data_formats = formats_win_full_10,
 	.nformats = ARRAY_SIZE(formats_win_full_10),
 	.format_modifiers = format_modifiers_win_full_afbc,
-	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
-	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
-	.fmt_10 = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
-	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
-	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
-	.x_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
-	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
-	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
-	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
-	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
-	.yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
-	.uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
-	.yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
-	.uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
-	.src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
-	.dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
-	.channel = VOP_REG(RK3288_WIN0_CTRL2, 0xff, 0),
+	.enable = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3399_WIN0_CTRL0, 0x7, 1),
+	.fmt_10 = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 4),
+	.rb_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 15),
+	.x_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 21),
+	.y_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 22),
+	.act_info = VOP_REG(RK3399_WIN0_ACT_INFO, 0x1fff1fff, 0),
+	.dsp_info = VOP_REG(RK3399_WIN0_DSP_INFO, 0x0fff0fff, 0),
+	.dsp_st = VOP_REG(RK3399_WIN0_DSP_ST, 0x1fff1fff, 0),
+	.yrgb_mst = VOP_REG(RK3399_WIN0_YRGB_MST, 0xffffffff, 0),
+	.uv_mst = VOP_REG(RK3399_WIN0_CBR_MST, 0xffffffff, 0),
+	.yrgb_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 0),
+	.uv_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 16),
+	.src_alpha_ctl = VOP_REG(RK3399_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
+	.dst_alpha_ctl = VOP_REG(RK3399_WIN0_DST_ALPHA_CTRL, 0xff, 0),
+	.channel = VOP_REG(RK3399_WIN0_CTRL2, 0xff, 0),
 };

 static const struct vop_win_phy rk3399_win1_data = {
@@ -999,23 +999,23 @@ static const struct vop_win_phy rk3399_win1_data = {
 	.data_formats = formats_win_full_10,
 	.nformats = ARRAY_SIZE(formats_win_full_10),
 	.format_modifiers = format_modifiers_win_full,
-	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
-	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
-	.fmt_10 = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
-	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
-	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
-	.x_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
-	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
-	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
-	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
-	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
-	.yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
-	.uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
-	.yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
-	.uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
-	.src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
-	.dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
-	.channel = VOP_REG(RK3288_WIN0_CTRL2, 0xff, 0),
+	.enable = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3399_WIN0_CTRL0, 0x7, 1),
+	.fmt_10 = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 4),
+	.rb_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 15),
+	.x_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 21),
+	.y_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 22),
+	.act_info = VOP_REG(RK3399_WIN0_ACT_INFO, 0x1fff1fff, 0),
+	.dsp_info = VOP_REG(RK3399_WIN0_DSP_INFO, 0x0fff0fff, 0),
+	.dsp_st = VOP_REG(RK3399_WIN0_DSP_ST, 0x1fff1fff, 0),
+	.yrgb_mst = VOP_REG(RK3399_WIN0_YRGB_MST, 0xffffffff, 0),
+	.uv_mst = VOP_REG(RK3399_WIN0_CBR_MST, 0xffffffff, 0),
+	.yrgb_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 0),
+	.uv_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 16),
+	.src_alpha_ctl = VOP_REG(RK3399_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
+	.dst_alpha_ctl = VOP_REG(RK3399_WIN0_DST_ALPHA_CTRL, 0xff, 0),
+	.channel = VOP_REG(RK3399_WIN0_CTRL2, 0xff, 0),
 };

 /*

base-commit: 6b60c282330c46954be9ae1d33cd5c7e5acb315c
--
2.48.1

