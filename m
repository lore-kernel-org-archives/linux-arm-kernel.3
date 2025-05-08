Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1252DC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dsd8S2I4WuczphIZGTjijWy3hBW40UbTKCKrAcQUosQ=; b=hDntl/d1zDp5OuVv7KoK+t+Iv4
	UW24Yqwc8yWv2rSZAxMS8hh7qMaHjnEl32T3i8pA6PgBAJkns5rV5vuLXSzvuH/J1IF2LDS9zkKqy
	8T4zhqyMtL81w20365ORl8LjXrbdfb82cfzMLVBldxyCASoi0VPYOMH2zdTAHTSxbA/q19MlVz1/V
	9k6krKLivMWaufFPzfa76QizIiDwQFb9ToSJiBCmHbHrOgkO7JIjwTfzLIj9iqd2VXno0xwm7vcdn
	7Iu6/iE87IypDK/tLGdvJDtuIyWc7EWdN/o18Kpv/DPuPV8VPCvqBtsTdCShmbrR8V6VZZnMuXb3H
	+K71mVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyMi-00000000Mb7-3jnJ;
	Thu, 08 May 2025 10:20:32 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyKl-00000000MOr-1rqw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:18:33 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id BE8EC240101
	for <linux-arm-kernel@lists.infradead.org>; Thu,  8 May 2025 12:18:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
	t=1746699507; bh=4+5xC11//k7SELncU7TsWsMFz+BlhXNj6YltonqzUPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ZTcCSJgJMCUUqvDGi/K6oDtKDCpLqfmTALVkpcurtmF/2J74Ouy5TIzRHAprAGO/L
	 5dUR2VXlPD1/sEQULYZ+fdQYVW+mTwuhbyZruuiqvDQCPYVGKbZF4VGvaZspZ7E6lQ
	 9+pjP4jpFREBKvIUyABmiLvBWGKylEuXI+jEaOwx+AuBxKbwtQT+26iUUEAEJeiJqv
	 sU7lkN79bQa+pO+PIH7ZSPhoFqEjqAsuupwcu858TuiqzG+xvGLkbt8t1EJcbrWwm4
	 6DO5HdyRAavRq4Q2fV9B/7nwwpm74S1WuSZlMAP4Z2l2l69rGGBKOvHorxZXdHZYnP
	 dkNLKJCAWrVAA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZtSl427Mcz6trs;
	Thu,  8 May 2025 12:18:24 +0200 (CEST)
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Subject: [PATCH] arm64: dts: imx8mp: Enable gpu passive throttling
Date: Thu,  8 May 2025 10:18:02 +0000
Message-Id: <20250508101802.489712-1-martink@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_031831_762430_0852E621 
X-CRM114-Status: UNSURE (   9.88  )
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

Hook up the gpu as a passive cooling device to the thermal zones' alert
trip point just like the cpu.

The gpu here consists of 3D GPU, 2D GPU and NPU.

One way to test would be to set one "alert" trip point low enough
and watch the cooling device state increase:

echo 10000 > /sys/class/thermal/thermal_zone0/trip_point_0_temp
watch cat /sys/class/thermal/cooling_device*/cur_state

And of course set the trip point back to its original value and watch
the cooling device states jump to 0 again.

Signed-off-by: Martin Kepplinger-Novaković <martink@posteo.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 50a07c56faffc..dea9342d071c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -320,7 +320,10 @@ map0 {
 						<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -350,7 +353,10 @@ map0 {
 						<&A53_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&A53_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&A53_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 				};
 			};
 		};
@@ -2229,6 +2235,7 @@ gpu3d: gpu@38000000 {
 				 <&clk IMX8MP_CLK_GPU_ROOT>,
 				 <&clk IMX8MP_CLK_GPU_AHB>;
 			clock-names = "core", "shader", "bus", "reg";
+			#cooling-cells = <2>;
 			assigned-clocks = <&clk IMX8MP_CLK_GPU3D_CORE>,
 					  <&clk IMX8MP_CLK_GPU3D_SHADER_CORE>;
 			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
@@ -2245,6 +2252,7 @@ gpu2d: gpu@38008000 {
 				 <&clk IMX8MP_CLK_GPU_ROOT>,
 				 <&clk IMX8MP_CLK_GPU_AHB>;
 			clock-names = "core", "bus", "reg";
+			#cooling-cells = <2>;
 			assigned-clocks = <&clk IMX8MP_CLK_GPU2D_CORE>;
 			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
 			assigned-clock-rates = <1000000000>;
@@ -2302,6 +2310,7 @@ npu: npu@38500000 {
 				 <&clk IMX8MP_CLK_ML_AXI>,
 				 <&clk IMX8MP_CLK_ML_AHB>;
 			clock-names = "core", "shader", "bus", "reg";
+			#cooling-cells = <2>;
 			power-domains = <&pgc_mlmix>;
 		};
 
-- 
2.39.5


