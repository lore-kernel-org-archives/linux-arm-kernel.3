Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FA9ECD9AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 01:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/XW2LDrF07MmdRlAaEu9X1m0f7azZC8MoM77XmYfbo=; b=igelnpkOZu/DvbRQJJqPIDWejs
	FO8FmbWUEohm9xYgQu09QYCD7YmiWwnwq4QLIO+htT8uKFVI+fdxeES5Yp9eHAvMIRQc91VSI+565
	hPIcorzcyCwNnGTJ2O2Mr1fvKOjrNQoz9ByPN3D/8b9KOMFjXiJ1ccSQPs6WurVgyl+wJnBGFnnos
	d0SLHuknBfepiGwLhLHQd4U/5IeVOOeZ3bz/zgY01tUOMQrEACSN0pRmzEcdHFQ6JDAM5LKPjuuxx
	gC/rifFb+9Qrx0P8WbIEYlnGFT1n9DGU6FJC9wjvgYB1pLU5pQWaXYo9Tmk6Hk/G1zokb8EehSJqn
	faRpIe/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAHy-0000000Agrj-3ptM;
	Fri, 06 Feb 2026 01:05:38 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voAHs-0000000AgnF-1JgC;
	Fri, 06 Feb 2026 01:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=m/
	XW2LDrF07MmdRlAaEu9X1m0f7azZC8MoM77XmYfbo=; b=Eu57EWPdOVOGn3S1S8
	RrgODHIUF7l58O6uDNJxVnm6a2bjQnmMaoqey+GQBGulXmbm48Iq0xBuIjtw9S9/
	Kzp6G4ArOu7T5cKEW2e8dEw69jn5wEqH0PV9z7AnaIXNjP4GMvXrBMW5/lcZqLAB
	fS1Giz50xXCUUT6yWO4e/FwRE=
Received: from ProDesk-480.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD3_+0XPoVpQ5VfQQ--.20291S6;
	Fri, 06 Feb 2026 09:04:33 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: alchark@gmail.com,
	andrzej.hajda@intel.com,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	airlied@gmail.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	nicolas.frattaroli@collabora.com,
	robh@kernel.org,
	rfoss@kernel.org,
	hjc@rock-chips.com,
	sebastian.reichel@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 4/5] drm/rockchip: dw_dp: Add DisplayPort support for rk3576
Date: Fri,  6 Feb 2026 09:04:14 +0800
Message-ID: <20260206010421.443605-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206010421.443605-1-andyshrk@163.com>
References: <20260206010421.443605-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSgvCgD3_+0XPoVpQ5VfQQ--.20291S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw48Jr4rAr43uw1fCr45Wrg_yoW8JFW3pa
	nrGryjqrWkWr4Yva4qyFWxuFsIk3ZrZay7Kr4UG343tws3KryfWryagw1UGr92q3W7ZF1a
	krsrW34UJa1a9rDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSoGQUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbC7QJTsWmFPiJt0AAA3A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_170532_725029_A2FADCC5 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The DisplayPort of the RK3576 is basically the same as that of the
RK3588, but it operates in dual-pixel mode and also support MST.

This patch only enable the SST output now.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 89d614d53596..dac3d202971e 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -142,10 +142,18 @@ static const struct dw_dp_plat_data rk3588_dp_plat_data = {
 	.pixel_mode = DW_DP_MP_QUAD_PIXEL,
 };
 
+static const struct dw_dp_plat_data rk3576_dp_plat_data = {
+	.max_link_rate = 810000,
+	.pixel_mode = DW_DP_MP_DUAL_PIXEL,
+};
+
 static const struct of_device_id dw_dp_of_match[] = {
 	{
 		.compatible = "rockchip,rk3588-dp",
 		.data = &rk3588_dp_plat_data,
+	}, {
+		.compatible = "rockchip,rk3576-dp",
+		.data = &rk3576_dp_plat_data,
 	},
 	{}
 };
-- 
2.43.0


