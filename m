Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFECCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lfieJ/EGL73t6zCSw5MfpEMZTviCbjtrDbmqYNxjp8=; b=Efwe4zNKifdZLAiqb8vzvoCeS+
	aYZ8C5srpSVMx625NIHRFRsF5lQblQUqRkpphNRL+G43WpJPOQG1GWdKG1WauYx+o4fJFHQe3MYGn
	xj1EOnOItPT3zkp/CFrCbV28MbgbcGkw9dzIpZ27wDVx82YSNwMXPG3UUlBEpYsYcHkg9uMc9FNdd
	BtUh9IM9NOi1QdQAXCNTUvYiGccwy4FuXS6WfDiK78r0pvo1DSRFJgiSjJWtP9xCxQ2O9urSxSATC
	39yFq5MJOMTq1unZnSMvwNLD9qWqk0RZ1EvlBuMhjEVQY0oRRYwLrs10EukDv6eumsShU0E0tHJa5
	J6yQUKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3np-0000000GisR-3ng1;
	Mon, 18 May 2026 19:39:01 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3nn-0000000Gioq-1lpl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133134; bh=7lfieJ/EGL73t6zCSw5MfpEMZTviCbjtrDbmqYNxjp8=;
 b=NOgkpLSeMGX+2J6hTpZCSBu7k9mZEhy1FmkgvYeHMazqVtJl/hDTeSM5MG61u9sH1cncmD3H9
 Mju0uT3BRWyX7owkeBUay9lYthRvHTLj5NRBSPIp5LHobguYjARs0pGAaMfyjNTh4xiy7OdYyZ6
 bd6DyvclBfqd/eSdBPf1c/l8bgKofQ+wplV8inxFvDdTOabXHHIy/CjNhVQCNUWBfSkoKs164JK
 9R/3hBKUCGxvCPDB7m33es2NJOltTB2NrGPpwvFynN3tkoFYGk3XahdDH1L/fAJ57WJR+o4LECk
 /MaOhDW8LIZ5pmqWvEHqfOImmrLngKn2ZcSKF/TCL6uA==
X-Forward-Email-ID: 6a0b6ab0486b4b38b826fa77
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 08/11] drm/rockchip: dw_hdmi: Set output_port for RK3568/RK3566
Date: Mon, 18 May 2026 19:37:42 +0000
Message-ID: <20260518193748.2482823-9-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518193748.2482823-1-jonas@kwiboo.se>
References: <20260518193748.2482823-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_123859_468866_70B758E8 
X-CRM114-Status: UNSURE (   8.62  )
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

All in-tree RK3568/RK3566 device trees using HDMI also include the
required hdmi-connector node at port@1 since their introduction.

Define the output_port for RK3568 so that dw-hdmi bridge driver can pick
up the display-connector bridge once the dw-hdmi connector is replaced
with a bridge connector in a future change.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: No change
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 02ee606c648e..6c4923b9b659 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -459,6 +459,7 @@ static const struct dw_hdmi_plat_data rk3568_hdmi_drv_data = {
 	.phy_config = rockchip_phy_config,
 	.phy_data = &rk3568_chip_data,
 	.use_drm_infoframe = true,
+	.output_port = 1,
 };
 
 static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
-- 
2.54.0


