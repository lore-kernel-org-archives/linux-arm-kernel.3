Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E04C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 04:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hhp6OMq7QEiuEHCE9JTlQzy04Sjlh7bKraEQa8mkuMs=; b=k/yIG8Omz8vjqDN642V/dChmOV
	ggyBmIoDLY9MEQNiEtPcZwpWeFrpUt2S7j65ILVU09mdUXhbDpxHQDE4BLHRB8zVD/VjqQBMtmaOf
	xaU9vZisafyfzwUixsS3p4OwwfdGgSIPqbwfc+iMCvglGZVGf8Qq2eP0BHHE1wsYRvQtbBDFaE4+T
	20a1+gsFuYbBoFjCM1y4X6OMlhR9OD5Biz/aRE3hR8qup37Xl8oSXwWlq4Qx2JUHy006PxM8TVZYG
	lU1sqkAMzv/X8ygaptIt5KKTLVWeQaWfOZgsHS8uN77rsvtiR15jP1+GAyLnJbRCmrX95wLhE60aI
	gBwcorAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpg9k-00000006wXS-1WAC;
	Wed, 05 Mar 2025 04:14:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpf6a-00000006rX9-0JGY;
	Wed, 05 Mar 2025 03:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Hhp6OMq7QEiuEHCE9JTlQzy04Sjlh7bKraEQa8mkuMs=; b=C0+vkQsKR7pWRORhTTKiiwGbop
	r0UnCbRFsADmhtySfm9BAGuNxbzLm59QlqDF7MEt47lHKPMbH0wceSaj5xXux9thgmya0TvkoQa/L
	1Fw1vo7hKJVoOHWj9JlQakBXfjvM9Q9TBQGBuKoKr2r2m89OH4u6Xr5AxvQIMbPNi4msxGSbHINTe
	Qm6ejX+6BAHQ+IztGoozfc7lZlOpr5fWFrRp74n78prg2s5BY9a7+t2J33//MelVxA8sOLFU+D/eC
	o88nGdDTb9oenI7CDjalugafRqalVz47Y/cdXD8vezyPbjF5b0TTDix/bznzJ1REZKIE56/GPXi3b
	e1yM1v5w==;
Received: from m16.mail.163.com ([220.197.31.2])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpf6W-00000000Kjs-0K2S;
	Wed, 05 Mar 2025 03:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Hhp6O
	Mq7QEiuEHCE9JTlQzy04Sjlh7bKraEQa8mkuMs=; b=RJBxt7FUWocvfgEoQ2d6a
	SdNr+Ji9Fxpb3xA7zrrLAShod0mLoKRU0bB0lEHIqM0Yd0Ae8Wn9oTmz6rv/Tkv2
	KcK0lD5FfYuUap8PbhzhHg1wrmXE68wW8yGmKfxKv31bj5qXLAPqjbNcDoEQqr6y
	TMdBEi+lOu6Xb5BhxsnYdQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wCXiC4yvMdnOWxcQQ--.60442S2;
	Wed, 05 Mar 2025 10:51:33 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: detlev.casanova@collabora.com,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	cl@rock-chips.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] arm64: dts: rockchip: Enable hdmi out display for rk3576-evb-v10
Date: Wed,  5 Mar 2025 10:51:11 +0800
Message-ID: <20250305025128.479245-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXiC4yvMdnOWxcQQ--.60442S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4fGr1kArWxArWkKr1ftFb_yoW8Ww4Up3
	ZrurZxGFZ3WrW2qwnIyF10qFn8tws5AFZxAr17XFy3tr4agas3Kw1fGrn5Z3W5AFW7Z3y3
	uF1kJas09r4qqr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBMHXmfHucNUCgAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_030728_634209_B1CE2B60 
X-CRM114-Status: UNSURE (   8.97  )
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

Enable vop and hdmi on rk3576 evb1, so we can get a display output
on this board now.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 .../boot/dts/rockchip/rk3576-evb1-v10.dts     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 318e13d2ea55..52ea6917b7de 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
 #include "rk3576.dtsi"
 
 / {
@@ -58,6 +59,17 @@ button-vol-up {
 		};
 	};
 
+	hdmi-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
+
 	leds: leds {
 		compatible = "gpio-leds";
 
@@ -271,6 +283,26 @@ &eth1m0_rgmii_bus
 	status = "okay";
 };
 
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_in {
+	hdmi_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi>;
+	};
+};
+
+&hdmi_out {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&hdptxphy {
+	status = "okay";
+};
+
 &i2c1 {
 	status = "okay";
 
@@ -734,3 +766,18 @@ &usb_drd1_dwc3 {
 	dr_mode = "host";
 	status = "okay";
 };
+
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vp0 {
+	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi_in_vp0>;
+	};
+};
-- 
2.34.1


