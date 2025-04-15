Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D939C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 05:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGrROaSrBXYRB1dmcPxF56XSth/r17WuVdpJ74iwQck=; b=V6uCef6IxnIcYOORzA7aZ+J6/e
	z+QkRmuPfN9DKWYpXUjlGu8Oz6f1kDBtJIm55tbAbCWeXmcPwJRH4RP+Wu91INfrW6PgQn9okc6Zm
	esbPbnC7LtmJ1Po8w+XOtkDEcD7Awn6WOiWIQk0XYfsATONV7GqALnAkezFVn4lyfthGFvAhoosWN
	i0ePmhUg9S4Ukqeq4RWOS5ckGLKx9GIjDSODn9J5pWFawzoGuDSig+LlsPc5dXkYAvb+yA4i8Jfn0
	e8lHdzvJKCy/cbUdpZOgXSJTJ6dbVcrlTGPx/SIbCBgOpFvZBCMxgjdTCxnkzdwqzEFwaI9H88m7P
	1M47B0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Yqb-00000004YUV-1k7V;
	Tue, 15 Apr 2025 05:28:37 +0000
Received: from mail-m49212.qiye.163.com ([45.254.49.212])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4YP8-00000004VQq-2IjY;
	Tue, 15 Apr 2025 05:00:17 +0000
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e63de97;
	Tue, 15 Apr 2025 13:00:09 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Frank Wang <frank.wang@rock-chips.com>,
	William Wu <william.wu@rock-chips.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] phy: rockchip: inno-usb2: Add usb2 phy support for rk3562
Date: Tue, 15 Apr 2025 13:00:05 +0800
Message-Id: <20250415050005.52773-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415050005.52773-1-kever.yang@rock-chips.com>
References: <20250415050005.52773-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQxpCVh4YSENOT0hLHR1NGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9637d1ab3503afkunm11e63de97
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OUk6OTo4NDJKSxpOIREWAz5R
	NTBPCglVSlVKTE9PTUJISUpKTUhCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQU9PSk83Bg++
DKIM-Signature: a=rsa-sha256;
	b=aAyRDzXd98kHFyHdYIBreH4V9Y9zmQAZycJmhnGKZHZaBPTEofM9DaFS1ly95IOTZejBw/gxk93op45bHRJ5essmddxB3p0T7mbJHMNgqtU00xf4HZaaF5HquK9fAwVbmFF0EWdBbMVTaVWbgJY91y78iqC4mOXk5TP9/bKsGr8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dGrROaSrBXYRB1dmcPxF56XSth/r17WuVdpJ74iwQck=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_220015_155756_DEFD3018 
X-CRM114-Status: GOOD (  10.37  )
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

From: Frank Wang <frank.wang@rock-chips.com>

RK3652 has one USB2.0 PHY with two ports, the OTG port support OTG
and BC1.2, the SoC provide USB GRF and APB to access the registers.

This adds vbus detection function control and make the below tuning
to enhance the usb2-phy SQ for RK3562 SoC.
 - enable pre-emphasis during non-chirp phase
 - set HS eye height to 425mv

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
Signed-off-by: William Wu <william.wu@rock-chips.com>
Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v2:
- Update the commit msg and collect review tag;

 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index b5e6a864deeb..ada1f02601ef 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -1892,6 +1892,54 @@ static const struct rockchip_usb2phy_cfg rk3399_phy_cfgs[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_usb2phy_cfg rk3562_phy_cfgs[] = {
+	{
+		.reg = 0xff740000,
+		.num_ports	= 2,
+		.clkout_ctl	= { 0x0108, 4, 4, 1, 0 },
+		.port_cfgs	= {
+			[USB2PHY_PORT_OTG] = {
+				.phy_sus	= { 0x0100, 8, 0, 0, 0x1d1 },
+				.bvalid_det_en	= { 0x0110, 2, 2, 0, 1 },
+				.bvalid_det_st	= { 0x0114, 2, 2, 0, 1 },
+				.bvalid_det_clr = { 0x0118, 2, 2, 0, 1 },
+				.idfall_det_en	= { 0x0110, 5, 5, 0, 1 },
+				.idfall_det_st	= { 0x0114, 5, 5, 0, 1 },
+				.idfall_det_clr = { 0x0118, 5, 5, 0, 1 },
+				.idrise_det_en	= { 0x0110, 4, 4, 0, 1 },
+				.idrise_det_st	= { 0x0114, 4, 4, 0, 1 },
+				.idrise_det_clr = { 0x0118, 4, 4, 0, 1 },
+				.ls_det_en	= { 0x0110, 0, 0, 0, 1 },
+				.ls_det_st	= { 0x0114, 0, 0, 0, 1 },
+				.ls_det_clr	= { 0x0118, 0, 0, 0, 1 },
+				.utmi_avalid	= { 0x0120, 10, 10, 0, 1 },
+				.utmi_bvalid	= { 0x0120, 9, 9, 0, 1 },
+				.utmi_ls	= { 0x0120, 5, 4, 0, 1 },
+			},
+			[USB2PHY_PORT_HOST] = {
+				.phy_sus	= { 0x0104, 8, 0, 0x1d2, 0x1d1 },
+				.ls_det_en	= { 0x0110, 1, 1, 0, 1 },
+				.ls_det_st	= { 0x0114, 1, 1, 0, 1 },
+				.ls_det_clr	= { 0x0118, 1, 1, 0, 1 },
+				.utmi_ls	= { 0x0120, 17, 16, 0, 1 },
+				.utmi_hstdet	= { 0x0120, 19, 19, 0, 1 }
+			}
+		},
+		.chg_det = {
+			.cp_det		= { 0x0120, 24, 24, 0, 1 },
+			.dcp_det	= { 0x0120, 23, 23, 0, 1 },
+			.dp_det		= { 0x0120, 25, 25, 0, 1 },
+			.idm_sink_en	= { 0x0108, 8, 8, 0, 1 },
+			.idp_sink_en	= { 0x0108, 7, 7, 0, 1 },
+			.idp_src_en	= { 0x0108, 9, 9, 0, 1 },
+			.rdm_pdwn_en	= { 0x0108, 10, 10, 0, 1 },
+			.vdm_src_en	= { 0x0108, 12, 12, 0, 1 },
+			.vdp_src_en	= { 0x0108, 11, 11, 0, 1 },
+		},
+	},
+	{ /* sentinel */ }
+};
+
 static const struct rockchip_usb2phy_cfg rk3568_phy_cfgs[] = {
 	{
 		.reg = 0xfe8a0000,
@@ -2210,6 +2258,7 @@ static const struct of_device_id rockchip_usb2phy_dt_match[] = {
 	{ .compatible = "rockchip,rk3328-usb2phy", .data = &rk3328_phy_cfgs },
 	{ .compatible = "rockchip,rk3366-usb2phy", .data = &rk3366_phy_cfgs },
 	{ .compatible = "rockchip,rk3399-usb2phy", .data = &rk3399_phy_cfgs },
+	{ .compatible = "rockchip,rk3562-usb2phy", .data = &rk3562_phy_cfgs },
 	{ .compatible = "rockchip,rk3568-usb2phy", .data = &rk3568_phy_cfgs },
 	{ .compatible = "rockchip,rk3576-usb2phy", .data = &rk3576_phy_cfgs },
 	{ .compatible = "rockchip,rk3588-usb2phy", .data = &rk3588_phy_cfgs },
-- 
2.25.1


