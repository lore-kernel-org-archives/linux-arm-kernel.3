Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B05E77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpOa8HoprryX6l0PB2oieZlmFjQEb/tFrwNnpfDxsbo=; b=WAmjmMWr+iN9XdZmdh8CtzVxuY
	z4LihXKQ4VNqwnESueee1geqAqwht0KpJZXp7C7kCojp2UGYncb0P+VmJ3ul8iSahhD/m/CleZ9rN
	6yA46vG9qGJm6npgg8BnHqONKN4MP0moDwFjVtDfihrG38j+EN2Nv9oTk10yeeCitBnP4hR4fS2Or
	1Z/uuw3Ba1bHQZG/u0SKGZMQoFPOz69QOc0aLFPIg1j7vsJ6bkscLE38RcMyHh+mH5NtB3jkkEb9s
	jOQnAQQqQu5+10Dmeg3Vb3fona8xoefWEnQ5FU5UO1qAgyEKxpyc4CAzqIbjp/r0Zbv9CcnSz8ucl
	gfvC6DCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6kC-00000004Jxo-3vSG;
	Tue, 07 Jan 2025 10:23:28 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6E0-00000004DJ2-3WLS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736243412; x=1767779412;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KpOa8HoprryX6l0PB2oieZlmFjQEb/tFrwNnpfDxsbo=;
  b=hJXGoe1gwJHk/SFA5Ug4V+IuQLB/0esdZx67x6AQCz4g3SO8H0vQhdSm
   TO/k1tSmFyee/AemGPHrH36Ed2f1MYBUE8WQ2PsEnB43z9+OAWN7EvjOq
   Luzz7jVSqlYnzU3Ri8eHoUZOJd4cPpJzRXdEZ1nl1LDlvpUK7wQBEaBug
   4z8WkQwALcChEXjl/1dWrW+HMwuiVIisgziKXW1NedDOpyL/GwGPo8Dnx
   rfE/eto+fSOb7I6qaZR4ID3SIa/dWhu7OC3L5ppcRg68G0IMg/EG4VbPS
   HNBkJDsgZQ5XL6SDhtyU82TYKKq0GOZWZQwcCeb2hzOkoKRHk1Pd0VxGG
   A==;
X-CSE-ConnectionGUID: W/xrAnC8RkSNziKHLuX1cA==
X-CSE-MsgGUID: vaqF99PvRTWyofVWk/MsKQ==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40889019"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 10:50:10 +0100
X-CheckPoint: {677CF8D2-34-301A2255-F8907925}
X-MAIL-CPID: 4EBEBB08F58DDC3AE9E882BAB25DBD24_3
X-Control-Analysis: str=0001.0A682F26.677CF8D3.0031,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47717163CCE;
	Tue,  7 Jan 2025 10:50:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736243406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KpOa8HoprryX6l0PB2oieZlmFjQEb/tFrwNnpfDxsbo=;
	b=Wi47E+Rc9PTZCxjwj/rCLJqFXyDN5NtYNeDYY5biKfe0oJzJCkQeIQa7PD4JKriBAh/oP9
	z35fR7ZDJkeVj7MhODE4YN1FoPGspbM48OA8EsHQ0tcLtW7gF3g0h5kyimAgF8Men8lL8+
	grBB67wugEMwPY/lJFTW/2pLVtxOEESmkeLH41piBuGAYFClZureKEWxAmtwrS+0MlmikD
	lVF/OJvQd7tgehTzAW1UBZYTMQ2tgZIIt/De6zJgyYAZP6hZW0/bM68PkikLuCoq4ypNWh
	vgQzeJ/qH8pxDux3+kYPEczkhyIfgWGRO0K6o2ho2EoQN8M6GRYV1nSPfr51Tg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: dts: imx7s: Move csi-mux to below root
Date: Tue,  7 Jan 2025 10:49:41 +0100
Message-Id: <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_015013_185527_5978CDFD 
X-CRM114-Status: GOOD (  11.82  )
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

fsl,imx-iomuxc-gpr.yaml only contains the mux-controller but the actual
video-mux is not part of it. So move it below root node.
Fixes the dtbs_check warning:
arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: iomuxc-gpr@30340000: 'csi-mux' does not match any of the regexes: 'pinctrl-[0-9]+'
  from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml#

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi | 56 ++++++++++++++--------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
index 22dd72499ef27..2629968001a74 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7s.dtsi
@@ -176,6 +176,34 @@ timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	video_mux: csi-mux {
+		compatible = "video-mux";
+		mux-controls = <&mux 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csi_mux_from_mipi_vc0: endpoint {
+				remote-endpoint = <&mipi_vc0_to_csi_mux>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
+			csi_mux_to_csi: endpoint {
+				remote-endpoint = <&csi_from_csi_mux>;
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -529,34 +557,6 @@ mux: mux-controller {
 					#mux-control-cells = <1>;
 					mux-reg-masks = <0x14 0x00000010>;
 				};
-
-				video_mux: csi-mux {
-					compatible = "video-mux";
-					mux-controls = <&mux 0>;
-					#address-cells = <1>;
-					#size-cells = <0>;
-					status = "disabled";
-
-					port@0 {
-						reg = <0>;
-					};
-
-					port@1 {
-						reg = <1>;
-
-						csi_mux_from_mipi_vc0: endpoint {
-							remote-endpoint = <&mipi_vc0_to_csi_mux>;
-						};
-					};
-
-					port@2 {
-						reg = <2>;
-
-						csi_mux_to_csi: endpoint {
-							remote-endpoint = <&csi_from_csi_mux>;
-						};
-					};
-				};
 			};
 
 			ocotp: efuse@30350000 {
-- 
2.34.1


