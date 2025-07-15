Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AC7C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 06:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwt+/5yN9eHNa8k62uiqoUjCvkUIIM6ihaRXsqxOjj4=; b=LgHwtsg+i0Z8HEKbSDgF3ZkcL6
	h/UjkUhPxcilMyIKCLDNEIEcXyeAp2zhdP0XDZkevSzZrOlGJQLUF7UONGEfQGsidIGyOzj4lSwV7
	/Mgm9lmdoGsTJmQEgeU7B/CavzTOUoUJrmL9GeByB3X14QwoRlo8Rgb2uI445+CBcqqfnxkYM/3ns
	fMOVNfuZgtIFXGkSfBT7NXsUJC6bE0qRYKNtzzT7xBBT3XgnwwONVREv8R0jU3wFo7m1EczAPZk/L
	uuUW4xwXUdi9IhpS7uCslIxikf6VBZBRghJIpm561n+qhkLu4H3OZ9g0a0cGLY5FOiD80sMmEwHAY
	NAmbLouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYor-00000004Aby-2txN;
	Tue, 15 Jul 2025 06:07:13 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYhN-000000049ci-0yFa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 05:59:30 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 6EAF4240101
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 07:59:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1752559164; bh=xwt+/5yN9eHNa8k62uiqoUjCvkUIIM6ihaRXsqxOjj4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=pR2oBFDoHyI44taRP3tCTyn8HSfyohptVLFF6NYGJg/0XEjWh+VPSP2bLttYa/xdf
	 PFfQ0JDP7fxWA5ZrzDr7oei++mqkbJr2cZwbi2748QkvURH+0seD9ZYY85qk9ZMvs9
	 D8jMrFpXm0Z3UEP0XoPjJfruOWe8Bey1njZNw68PEvNou+jKH7QnqJWbxx7eW0gvD2
	 blobCjz+k3D0bh5U73yN9bDakSQjR7fDWa9l4/Bw/tOL7tdmI0tZyTAs38dEF1Qyz5
	 AK9zu3QrGURH7NmEeIiOQ/8ieYUuRGMqxDQ1gTMzpf3ufTGjZx47uu3hFv8bZOv46G
	 36RuMP713pt/A==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bh7mp5MKzz9rxG;
	Tue, 15 Jul 2025 07:59:22 +0200 (CEST)
From: Martin Kepplinger <martink@posteo.de>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Kepplinger <martink@posteo.de>
Subject: [PATCH 2/2] arm64: dts: imx8mp: add cpuidle cooling device to the alert trip point
Date: Tue, 15 Jul 2025 05:59:23 +0000
Message-Id: <20250715055903.1806961-2-martink@posteo.de>
In-Reply-To: <20250715055903.1806961-1-martink@posteo.de>
References: <20250715055903.1806961-1-martink@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_225929_434334_30CF20CE 
X-CRM114-Status: GOOD (  10.78  )
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

Idle-inject up to 50% of all cpu's time in order to help cpufreq
to keep the temperature below the trip points.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---

hi Shawn and all,

50% is of course random, but this is an emergency situation already
so it might not be the most critical value to find a consensus for.

SoCs rarely describe and enable the idle-inject mechanism. IMO it is
desired if only in order to have an example of it merged.

thanks,

                               martin



 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 66e1a27d6eed9..6c1d7ca2de21d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -343,7 +343,11 @@ map0 {
 						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu0_therm 0 50>,
+						<&cpu1_therm 0 50>,
+						<&cpu2_therm 0 50>,
+						<&cpu3_therm 0 50>;
 				};
 			};
 		};
@@ -376,7 +380,11 @@ map0 {
 						<&A53_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu3d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
 						<&gpu2d THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
-						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+						<&npu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu0_therm 0 50>,
+						<&cpu1_therm 0 50>,
+						<&cpu2_therm 0 50>,
+						<&cpu3_therm 0 50>;
 				};
 			};
 		};
-- 
2.39.5


