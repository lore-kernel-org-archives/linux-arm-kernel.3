Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983FDC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czcE1upRv+234YpVuJ0ZCJTtoKOm89PzNy4v3r/NFZE=; b=BUGv48uxHgxxAnUttSZqN/2YtM
	+WOTtCLNMUygCrDHot5l6E0kzjPRFQ5dMExQ/ZBLL8fH8aC67A4gkRfjMfh9JmqvdkJvsHFeDUtYA
	QTSCfCofRofy+sODXq8oVGgciF7KQx9BECMQz06j953H5EiJ27ZlYTOT5S4YmnwAgK1V7cU3PkK6L
	CUIMrobYg/ip3CPgUG3XYO77teZ9yLxp2GzlieiGfrxhpRTWX46r2OexZ/ucVCIVEZoWFBccWs2XE
	EN+/FjjvKDUr+RsvWWS3Fmwx32tkOvaWcoLTsihFTDMpxsM00cK9yLt217lLc96Q5fPSgUaU0VvQO
	K883YOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSOo-00000006huh-2IEz;
	Tue, 17 Jun 2025 09:14:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSI3-00000006gxa-1bMx;
	Tue, 17 Jun 2025 09:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=czcE1upRv+234YpVuJ0ZCJTtoKOm89PzNy4v3r/NFZE=; b=MA0VxrSAWaH0yvxoD4OcCvz/Oe
	Q0uOdoAgXLbCHsXaG+0+24qYb7KJCSpFAWCK2nNh8DvA8I04hDxdhX8j/xea5/4tqX9UHUwuc6Gve
	W9et28yqVmNyFiESGB2OMsmuFtY7A4JJLEJJw4CpTtj9pTochsQCLaF6QTSel6mFnZDArmNn1xfx2
	h1+uyfPm8q3qVxo4zgWMVUlA2E7vXLD7mlqOsm2v6Krw7cVm4x3t+YzWsP3XYc5HheioKbjErrufW
	2/yRndMvxStPfaZxFuYoqitqa62RP/XiEz993pUd24LtQFlWyECVPGDFMO5IygOeWNy2jKAAHLqkw
	PyNxnIKA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSI0-00000003kjm-3zKY;
	Tue, 17 Jun 2025 09:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6574D5C63D2;
	Tue, 17 Jun 2025 09:05:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 701B1C4CEF6;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750151247;
	bh=yepbeMaLbeFrf0k5ysXWpuKbuvZ7XHeHzfq2HuS7a4M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QNHgDxh5HOEE0cpViNxl4/KsDAEqHUWNtltpPz4qNJ43oaOrKzrfEBC1ePCYPqi6N
	 4fzsPTyCWcK9I1xPBmLHQ6bayYH2AGrVnZ/MYMWNj8PZoq0yrsZ4HosBWQ7i0YgpuB
	 1BpMnFwm5FPvFZvCjbILKhiDL175t4C1sWmBAbd11aWU4mfqrrBHORzHQYtcyOFJAB
	 zpsrh+YZXOcwklz3XthHfU8oeQD4HWc6ZV+HjzhjXy3hbxhAvU+GvWw4Ndh548txlV
	 LYuv4lvRXx1pV3JhHdS81N6mVbybCe7DlQd3Xi56wbrmn5bIJBTiqajZVQtapCvSl6
	 lh4dT00brhEBQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F74C71155;
	Tue, 17 Jun 2025 09:07:27 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Jun 2025 10:54:44 +0200
Subject: [PATCH 3/5] phy: rockchip: phy-rockchip-inno-csidphy: allow writes
 to grf register 0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rk3588-csi-dphy-v1-3-84eb3b2a736c@collabora.com>
References: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
In-Reply-To: <20250616-rk3588-csi-dphy-v1-0-84eb3b2a736c@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750150493; l=1581;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=aJtpf6aQN4QLph0ogcfZ1mD08/jLTu4SOK+/3Mu671g=;
 b=drrf3+HeksVsYIPQ4fnsIhnaijJd8eMomUwXxWI2N4VbIJ2R95gmKEtFtWU8P6IjdaGMzoQxK
 W/+iCOohunKB6elFsuV74lb0DK+H3IULwG7/AvOkAxwHuw1DZoC7vPN
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_100733_425807_A6C6AE0F 
X-CRM114-Status: GOOD (  12.71  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The driver for the Rockchip MIPI CSI-2 DPHY uses GRF register offset
value 0 to sort out undefined registers. However, the RK3588 CSIDPHY GRF
this offset is perfectly fine (in fact, register 0 is the only one in
this register y
file).
Introduce a boolean variable to indicate valid registers and allow writes
to register 0.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index 2ab99e1d47eb..75533d071025 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -87,10 +87,11 @@ struct dphy_reg {
 	u32 offset;
 	u32 mask;
 	u32 shift;
+	u8 valid;
 };
 
 #define PHY_REG(_offset, _width, _shift) \
-	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, }
+	{ .offset = _offset, .mask = BIT(_width) - 1, .shift = _shift, .valid = 1, }
 
 static const struct dphy_reg rk1808_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK1808_GRF_PD_VI_CON_OFFSET, 4, 0),
@@ -145,7 +146,7 @@ static inline void write_grf_reg(struct rockchip_inno_csidphy *priv,
 	const struct dphy_drv_data *drv_data = priv->drv_data;
 	const struct dphy_reg *reg = &drv_data->grf_regs[index];
 
-	if (reg->offset)
+	if (reg->valid)
 		regmap_write(priv->grf, reg->offset,
 			     HIWORD_UPDATE(value, reg->mask, reg->shift));
 }

-- 
2.39.5



