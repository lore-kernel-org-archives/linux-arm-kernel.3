Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE419CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 03:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtbpD+/WiKl2LkSv9CHaFlhLEFCwiHOjk0JUa3wHC7M=; b=N8bAGmM00o0lcVUBrIIqFqBX40
	3ZlXNvciLkgJaOqEKs0U/Mf7Vx4IZrlhwjpTZIv01rRmMPJfA7Qz0LaKBkYY1VhncBxqWZnU9QPU0
	WNtjs/0JgSuK4rUT6gxrgXlBa+SN1b9x2JsLNNyHs56crpN14aeIvu2Bmf+GUjFIMIkzkTzR+/Bmi
	lZeWrpKuixCNs43oTVnr3oc8uNdLAA1ZrV5933n/PTvXLab65+c/zG9EMd05+wOnns39nYov3UdCY
	P+caUjXK08LFUI+vo5VUF97EDfQc+vjtNlTClNyj2f1BDDPSQXS+uU1hJxcXrxjI2YfaFZwf0OOWD
	fC10846g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18j-00000005Kxg-0RIF;
	Fri, 09 Oct 2026 03:19:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF18f-00000005Kty-1d1G
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 03:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GtbpD+/WiKl2LkSv9CHaFlhLEFCwiHOjk0JUa3wHC7M=; b=dZCpbWUfJRf9pPIzt+xj350YYE
	RN8IVuZI2jdcUigH9u6PwQQ46qYfky/rHOGn9arQvKmCorw7edrhwWgGKp4x4kbgG0CcncHFAt1Ws
	BESENYq2U6qNHKLNg55loQWn929PPq995L8TfxESdeal3IbMQ1htbMAShc6SXjLT6lOKabkGJyN2L
	KlnHNAPrCLfhAhMyyFxfjeyLcvquEGO2lZu3O7UDnSMaXea5+sd/fqExRJOvqOnq2hS2Dx1popMHx
	q2NeowzItS6dnJIqkzadc5BrO4R1et2T2i/FNh6qUhl1sUVIDBw2zAC6nAf/BXqQ27jrBMoOZKJnr
	YiuqgnTA==;
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF18Z-0000000Aqpa-0XEj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 03:19:16 +0000
X-QQ-mid: zesmtpip2t1791515854tbee33f08
X-QQ-Originating-IP: mZmBNt09oCAyCIS5AV787bFxJ0kbiYhVbHb5G7CrF0Q=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2693331085856337013
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:00 +0800
Subject: [PATCH v2 08/20] drm/msm/dp: Track PHY power ownership
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-8-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3920; i=sophon@radxa.com;
 h=from:subject:message-id; bh=CNhp1n10ypP2UBsGrSZeyY/HNqkOHXcwJsO9tkT9xVU=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlbeqS/ZnDDnWF/U+29GT/7FLYzmbz/4Yf+yRf7K7
 8x0Ku02dpSwMIhxMciKKbIoxDPMZa/MvfZUrFQPZg4rE8gQBi5OAZhIXAjDdw++CSzK5t8Fc09y
 MBTHR7eYPBU+t3v+60ThgAXl000LGf5ZBObGrWxJP7z+9O+Wb3/3iiXMTXdp0mTSu6a59q9hw3p
 GAA==
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: N+v2p8NjVRtQWo7+u09DgiQQ5PTb3wmvOZnk0vbZqkQbv0qOdNm4FpuH
	4lpiC01Deks0N1v0WkYnONXCBdDFDTaappX2+wjRHME1C4Uea7pnEWQBpbZ0ko/y/hNWbkR
	swyqA3ym/23neQPoX+1eAktaOiMgr3B/UjdnCnX/Bvb4BzVOuWgCBvGRhyIa6lMKNXEWQ9i
	7zKVPTGdnnty7RYV/ZiwhA2s3QIjKJJpDKfMlW4Z/yiUXYbMBbP87wO9YOXNzzX90uGsVUy
	OecBftq0LDfBW0AHV35skxQhqKrNttVsdu1kG/PXRgeHKKRzWkzCBa7TcKWz9PmyQo5qqJR
	QX44UB6Z7lOhNOHBtYMR3hzXSzbBQLumRxo3mEnj17h2ogSeL6x3BJuaTMs+j1lcUvKo1wK
	+fyRgd2VtAqq4Votv6U5FoHmaEDGFt3gSI2QHvHRbAbU9J0nuXrvuuVCcvaOYMdUcrzbRF2
	k9S+F0J1+ZmNVy7UB/c10BfjnMwe2HlKH/O8a7BQStNtt1w96GZzcDusw/sZ++BkuQ5rtFX
	WfQ+f44NXWpXUnlrPcXHP3xQH1Dz/lU3AaftUoAC3+Pi+i0Vx7yaaNqOGxmCOcqEzTYTjAg
	mNHTFKF3tJHra2CX/1QYhAMZDr48SlUrHtjzFyM+1o61Vb1PTYFFziXdDX4y27W5beVAivz
	NXQekAsyZaOnUVL0YZobMCIObTD1GRkpZ/Yl7hzUyOO8teCZjHVbhrKdNsLiNXFxcjIyK5I
	kzj1QK+ZATHO+BhqHFF1AbvpEnH8je9o85ziQqqKYxzwqL9rZvp5QLzcHv4hKV7HhCS7RhA
	sGa9XvkY57h2zk44N8iMBzFoRh/B49MA4dEJ8CNg4d4/W9xfW5ehOzNsXMhusqdh2Al+6vw
	vH9kCAvRSsBJjQQjXFRvzXfQAC+SrDHAum6z57ZhloEBfFCGRKWT1h6cj1ddv6AsXmSjVMH
	Y0+n7PYkTtfCq4wZd0tdjQlQFmChid3Xkp9OJEfLAJgs4XKR3y3h3ah+Up1wR/Bj7UT72G+
	/AOLM8CYT6cKXpVHEbLG+JPpRMsVbiBHxzoJJBqDS3RW6VrJFDF/Gp7d4jKf8YW4JPNYjXn
	A==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_041914_721329_D759AFF0 
X-CRM114-Status: GOOD (  15.06  )
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

Mainlink restart and PHY test paths can power down the PHY before a later
cleanup attempts to release it again. The PHY core counts each power-off
call, so cleanup without an owned reference can underflow that count and
prevent a subsequent enable from calling the hardware power-on operation.

Record successful PHY power acquisition in the controller and route all
power-off paths through an ownership check. Keep the reference recorded
when power-off fails and avoid acquiring a second reference while it is
still held. Also skip releasing link clocks that are already disabled.

The preceding stream serialization change protects these ownership
checks against HPD PHY tests and link maintenance. Error propagation is
left to the subsequent stream enable rollback change.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 59070f399e2d..f005421630c6 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -136,6 +136,7 @@ struct msm_dp_ctrl_private {
 
 	u32 hw_revision;
 
+	bool phy_powered;
 	bool core_clks_on;
 	bool link_clks_on;
 	bool stream_clks_on;
@@ -1813,6 +1814,9 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
+	if (!ctrl->link_clks_on)
+		return;
+
 	clk_bulk_disable_unprepare(ctrl->num_link_clks, ctrl->link_clks);
 
 	ctrl->link_clks_on = false;
@@ -1824,6 +1828,23 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 		   str_on_off(ctrl->core_clks_on));
 }
 
+static int msm_dp_ctrl_phy_power_off(struct msm_dp_ctrl_private *ctrl)
+{
+	int ret;
+
+	if (!ctrl->phy_powered)
+		return 0;
+
+	ret = phy_power_off(ctrl->phy);
+	if (ret) {
+		DRM_ERROR("Failed to power off PHY: %d\n", ret);
+		return ret;
+	}
+
+	ctrl->phy_powered = false;
+	return 0;
+}
+
 static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
 					      struct msm_dp_panel *panel)
 {
@@ -1836,7 +1857,11 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl,
 	ctrl->phy_opts.dp.ssc = drm_dp_max_downspread(dpcd);
 
 	phy_configure(phy, &ctrl->phy_opts);
-	phy_power_on(phy);
+	if (!ctrl->phy_powered) {
+		ret = phy_power_on(phy);
+		if (!ret)
+			ctrl->phy_powered = true;
+	}
 
 	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
 	ret = msm_dp_ctrl_link_clk_enable(&ctrl->msm_dp_ctrl);
@@ -1996,7 +2021,7 @@ static int msm_dp_ctrl_reinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
 	 */
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
-	phy_power_off(phy);
+	msm_dp_ctrl_phy_power_off(ctrl);
 	/* hw recommended delay before re-enabling clocks */
 	msleep(20);
 
@@ -2022,7 +2047,7 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl,
 
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
-	phy_power_off(phy);
+	msm_dp_ctrl_phy_power_off(ctrl);
 
 	/* aux channel down, reinit phy */
 	phy_exit(phy);
@@ -2643,10 +2668,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 			  struct msm_dp_panel *panel)
 {
 	struct msm_dp_ctrl_private *ctrl;
-	struct phy *phy;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	phy = ctrl->phy;
 
 	msm_dp_panel_disable_vsc_sdp(panel);
 
@@ -2656,7 +2679,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
 
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 
-	phy_power_off(phy);
+	msm_dp_ctrl_phy_power_off(ctrl);
 }
 
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,

-- 
2.56.0


