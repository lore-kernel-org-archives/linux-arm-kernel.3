Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B90C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTB3v+x8w/FUL8jly8m0hmcJty/2pFiwNyr1NhvSBfc=; b=fUIgF9jrAMxePDufSs1bxtdd2T
	xA4wMbVeMNzb5wiZ3h1FScDOG5CfPQ16L5Mhh86u+2EzKLbG7Aqz508K22h6nA6N7zFIHL8Uc2+QS
	3TJPhKhnKvs5yozRhEkLvX8Hu7WnMZrW/mw6NVPwE+v0SMxdsw1VL7zMOi4r8yCWIc2k0N5SVNcRw
	qkDRgmzGlKN5EkU+oG22on+LHOK+gBQMpPRTxq2BRIGtKYaIj6hjaqp4qI0CmJRW1cIv3eHxw5EP6
	00YXitEsQ0YeDO1shUYT4sSLrjvMO/nD0OVpwT0EO0IV9B9Fv8F9n6aa1cRu+rY5LuVFhQQsbr4jH
	q7ZmYYBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzow-00000008C4I-3bvZ;
	Mon, 05 May 2025 17:41:38 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzb5-000000088vo-25Jj;
	Mon, 05 May 2025 17:27:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1746466026; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ol31He9KAL0nNR6mrsX3AZ2MxA+Wl9fmVjaFdtr2X6b3p9kZUUcUnli2/A3VKUwvOGnjajwEloSZlxLpNSbYrmC9QTczIDf/CG+MnFvle1K7VU/iRvTjwNtCqoDA+aUvSGCRceC14q6ralKJPTLFJTFFjK0MqtX/SKIwA9zjNAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746466026; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JTB3v+x8w/FUL8jly8m0hmcJty/2pFiwNyr1NhvSBfc=; 
	b=SootE5B4uevjjwWtjMCOr4q0r9dxYEN9jcsG5xg7FmBNfA0T/b08f+gDKR4Zd5dCsLf/mgicaXxHu7oiTGeJo4ae/nYirpALLvNYjiLpFmrRXnsDaSGnz9bTwTrdCwp2BDoM9a/Fmr4ypERR+4oxoKCgD/YhzKJhHUtbp5jKv/8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746466026;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=JTB3v+x8w/FUL8jly8m0hmcJty/2pFiwNyr1NhvSBfc=;
	b=NVgBDJD4k+kVVdTnSKAaohwAkP3qAaSP3SplomwfKDGHL/giP/YqllFtRQlCk+95
	M1cae3oN7CIMuPqtvKBjBWsl1/99RVIL1yHVaGNWPxRqX4dR9m3bFxeZAc2vmKIpI62
	/NikEepQk1v2b+rq6pPeGRKWwT2sEtzF4758WSlw=
Received: by mx.zohomail.com with SMTPS id 1746466025536483.6514707684531;
	Mon, 5 May 2025 10:27:05 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 05 May 2025 19:26:38 +0200
Subject: [PATCH v2 3/5] phy: rockchip: usbdp: reset USB3 and reinit on
 orientation switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-rk3576-sige5-usb-v2-3-d5ba4305f3be@collabora.com>
References: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
In-Reply-To: <20250505-rk3576-sige5-usb-v2-0-d5ba4305f3be@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 kernel@collabora.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_102719_601048_9C977176 
X-CRM114-Status: GOOD (  22.13  )
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

Until now, super speed on Type-C only worked in one orientation. This is
because on an orientation switch, the UDPHY was never reinitialised.

Heiko presented a patch to do this[1], but there were concerns over the
correctness of it[2]. Experimentally using Heiko's patch on RK3576 did
make me run into issues, though they seemed to be related to the
orientation switch actually happening while a clock driving a GRF
register was disabled.

The key issue is that the hardware wants the USB 3 controller to be held
in reset while the PHY is being reconfigured, otherwise we may run into
hard-to-catch race conditions.

Either way, this patch implements the required ordering in a somewhat
unpleasant way: we get the USB 3 controller from the DT, and use runtime
power management to forcibly suspend it while the UDPHY is being
reconfigured, and then forcibly resume it later. As an added pain in the
rear, the suspend/resume of the USB 3 controller also tries fiddling
with the USB 3 PHY part of the UDPHY, which means we introduce an atomic
flag to skip suspending/resuming the UDPHY if we're resetting the USB 3
controller. We may just need to skip trying to acquire the mutex again,
but both ways work for me in practice.

This solution may in fact be complete rubbish, but it works to get USB 3
Super Speed working in both cable orientations on my board.

Link: https://lore.kernel.org/all/20250226103810.3746018-3-heiko@sntech.de/ [1]
Link: https://lore.kernel.org/linux-rockchip/h57ok2hw6os7bcafqkrqknfvm7hnu25m2oe54qmrsuzdwqlos3@m4och2fcdm7s/ [2]
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 54 +++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fff54900feea601c8fe6bf4c7123dfebc5661a15..5cd6bbc367f69bca15c2a94a07e72f850b381ae3 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -200,6 +200,10 @@ struct rk_udphy {
 	/* PHY devices */
 	struct phy *phy_dp;
 	struct phy *phy_u3;
+
+	/* USB 3 controller device */
+	struct device *ctrl_u3;
+	atomic_t ctrl_resetting;
 };
 
 static const struct rk_udphy_dp_tx_drv_ctrl rk3588_dp_tx_drv_ctrl_rbr_hbr[4][4] = {
@@ -1255,6 +1259,9 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 	int ret = 0;
 
+	if (atomic_read(&udphy->ctrl_resetting))
+		return 0;
+
 	mutex_lock(&udphy->mutex);
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
@@ -1273,6 +1280,9 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
+	if (atomic_read(&udphy->ctrl_resetting))
+		return 0;
+
 	mutex_lock(&udphy->mutex);
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
@@ -1401,10 +1411,31 @@ static struct phy *rk_udphy_phy_xlate(struct device *dev, const struct of_phandl
 	return ERR_PTR(-EINVAL);
 }
 
+static struct device_node *rk_udphy_to_controller(struct rk_udphy *udphy)
+{
+	struct device_node *np;
+
+	for_each_node_with_property(np, "phys") {
+		struct of_phandle_iterator it;
+		int ret;
+
+		of_for_each_phandle(&it, ret, np, "phys", NULL, 0) {
+			if (it.node != udphy->dev->of_node)
+				continue;
+
+			of_node_put(it.node);
+			return np;
+		}
+	}
+
+	return NULL;
+}
+
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 				 enum typec_orientation orien)
 {
 	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
+	int ret;
 
 	mutex_lock(&udphy->mutex);
 
@@ -1420,6 +1451,18 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
 	rk_udphy_set_typec_default_mapping(udphy);
 	rk_udphy_usb_bvalid_enable(udphy, true);
 
+	if (udphy->status != UDPHY_MODE_NONE && udphy->ctrl_u3) {
+		atomic_set(&udphy->ctrl_resetting, 1);
+		pm_runtime_force_suspend(udphy->ctrl_u3);
+
+		ret = rk_udphy_setup(udphy);
+		if (!ret)
+			clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
+
+		pm_runtime_force_resume(udphy->ctrl_u3);
+		atomic_set(&udphy->ctrl_resetting, 0);
+	}
+
 unlock_ret:
 	mutex_unlock(&udphy->mutex);
 	return 0;
@@ -1430,12 +1473,22 @@ static void rk_udphy_orien_switch_unregister(void *data)
 	struct rk_udphy *udphy = data;
 
 	typec_switch_unregister(udphy->sw);
+	put_device(udphy->ctrl_u3);
 }
 
 static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
 {
+	struct device_node *ctrl = rk_udphy_to_controller(udphy);
 	struct typec_switch_desc sw_desc = { };
 
+	if (ctrl) {
+		udphy->ctrl_u3 = bus_find_device_by_of_node(udphy->dev->bus, ctrl);
+		of_node_put(ctrl);
+	}
+
+	if (!udphy->ctrl_u3)
+		dev_info(udphy->dev, "couldn't find this PHY's USB3 controller\n");
+
 	sw_desc.drvdata = udphy;
 	sw_desc.fwnode = dev_fwnode(udphy->dev);
 	sw_desc.set = rk_udphy_orien_sw_set;
@@ -1499,6 +1552,7 @@ static int rk_udphy_probe(struct platform_device *pdev)
 		return ret;
 
 	mutex_init(&udphy->mutex);
+	atomic_set(&udphy->ctrl_resetting, 0);
 	platform_set_drvdata(pdev, udphy);
 
 	if (device_property_present(dev, "orientation-switch")) {

-- 
2.49.0


