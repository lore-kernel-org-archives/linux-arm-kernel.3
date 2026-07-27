Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6D4C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 17:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bLAfO4vgeRYgxOeRuUb0Ab16fkzdVk0WYV86aUUze8s=; b=xBzn2nt555m2EYemybhB0WBEO0
	YUYTxUcMlJ5sJsenea5SKEccyEsB/EhY5oKOYXfvZa6Zt7kpxvKp2PWjR6BV/8TJY97wG/pRG0YH6
	meOhMKg9yhjJ7MzQC95ugv26MHZzWmoAsWS6ZZvi5e/d65ANQ/G9sSGu7s2d4D4fkAGhuPJFtsR9S
	VPMZ9JhUigQBF474a939f4ooI3Qlvj3bujmcsuJm1bUv1wTnobVkpHr5la9Lgu/PoZ8pHX2z7CKsL
	MIJE3i5NVCkXQfx5ZklXGLDy7Dk1J+zg6gYcAVbl+EBixtFeZDDrXLE4a/IjgbHyWKH61FFXC0Ebt
	Yt8rcq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPJO-00000003XeX-02ci;
	Mon, 27 Jul 2026 17:40:22 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woPJL-00000003Xds-2uH2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 17:40:20 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8485ef63b68so3051740b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 10:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785174018; x=1785778818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLAfO4vgeRYgxOeRuUb0Ab16fkzdVk0WYV86aUUze8s=;
        b=T8m3NGUHAWZHpCPTJkF8L8a67KPTUX4dA1uW29e2GeVv3OxQBydn4m27aj5Nyhu08a
         qUwicpYeCb3KMeqmhTqdWwk637E4M/064GDCa0P4kMW6s7jCTbrItx0ZE1a2YxA+45NE
         iEaDLzfqWDjM21e0LnngfJRHIy0sMSWzvtnMx+8iO9IKXrGLoQkLlQglCof+yRmTXaN9
         PAgYlTPvVgJ/xJ442aX27FfZl7bmGnpnuVRAOwDBB9i+Pgx1Af72KCBMPXVVQxfR+rhB
         5SlbrtjXoCl5HBimQylyud/HiwOGxX2Cp+5hHTS+BBk4g+WTvwETKT/BwxQ/2QApP3A5
         aK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785174018; x=1785778818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLAfO4vgeRYgxOeRuUb0Ab16fkzdVk0WYV86aUUze8s=;
        b=JjUtkn1V3HsbokV0PRyKIwSDOqeC2Q0DKGjvAQWDKgyeHwNJU7eP521i+LMGdslb/H
         4yxuBCo7TAQP2X59SszDxafWu21/24sHZdAlgQjE5yCjQQS2JmbmwmQcI7faLkNaroOT
         mSayGxXRIbfCPqHcxOl3YwTaZ142/jhW4XIOzLuni71hq2axNlqZ8i83mKAdHsykk9Or
         GHnDA8YwIWN7y/8DtoMXEKlCaqp5K2VRebkdUFIy8KulbG/LuJBxozTNYIAtezda5bvQ
         mBP0uQtjwp8lbK3lzgAxeV7TPzQB+O8UETmtyKYbRTq5eayCw5enrYuT8XkMuTDvbymf
         eEQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfajhzBFfbZ6z8XkgzFJ4w4ArahBXoD57cyGz0VqW/A9VC9KbgGHcAnOTuBtisqKB0p/mlY6xvZL8H/pboZeBm@lists.infradead.org
X-Gm-Message-State: AOJu0YxxJ4fr2/UlAXDxlw/E4ZstBGBANczAeNRM/t+330ZlvKDrNRVs
	NGk0OKBu/odkSliOElWSgTehpe6Dv/5DIc7+Xkmd7Gaes2CeiyPyjSRD
X-Gm-Gg: AR+sD10uVRJt2AH2lumMVehbQGBm7ArquELMOnjuGENZKY2Lwhbehzrei1tWW8j+/sA
	ea2ywWeClA3+KQ6ABeiN6KnPjc4yNK4E8KB4kNTeAAQOARHszvOR1GsF8HSTzhtjk+isbWfwROE
	qa0olBznvQoKFndl9l7FIwZfx1knfvVxU+qZEmdqorDTxQvxlzd7M6UZFo55MSay7CHbezPPDsk
	E0D8Zr3xa91N2Oi1iSs8qn/otVJJXjQ50lBTm6hwGeFiLkTwHlvMxEW8MeuoKBLAKGPGWBFW1wS
	4ue2XRInJKxS32Kxp3rD8PESfDalHAboFsgwBt0ZgJOD+VE72222vS+9Q6QDf8mLIdH1BAt1vTw
	sWSfubQu9S4pR7+AzqBqERa+GdZRDIDF9m4Pkwnc+/RDfcrgLd6urNa6hgngjEeEYKou5G2FvKq
	D5mWZhqy7CHjcjV9rbuP/59zyPl4Uely4Z7Ud4iv6Vpst8fNhYPWc=
X-Received: by 2002:a05:6300:193:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c6c8016bb2mr582045637.42.1785174018200;
        Mon, 27 Jul 2026 10:40:18 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:60b4:21e4:da15:d321:6b72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm33850735eec.10.2026.07.27.10.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:40:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Add CSI-2 bus type to ROCK 5B+ camera overlays
Date: Mon, 27 Jul 2026 14:40:07 -0300
Message-ID: <20260727174007.2581714-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_104019_725812_A3FEFA2B 
X-CRM114-Status: GOOD (  11.48  )
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

The Rockchip RK3568 MIPI CSI-2 receiver binding requires the bus-type
property in its input endpoint.

Specify that the Radxa CAM4K modules connected to CSI2 and CSI4 use a
MIPI CSI-2 D-PHY bus. This fixes the following dtbs_check warning:

endpoint: 'bus-type' is a required property

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso | 2 ++
 .../boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
index ee9ecf68a886..5c7fb960b099 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -80,6 +81,7 @@ &csi2 {
 
 &csi2_in {
 	csi2_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
 		data-lanes = <1 2 3 4>;
 		link-frequencies = /bits/ 64 <445500000>;
 		remote-endpoint = <&imx415_output>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
index 8a4cf3fdbf8e..1ee9036b9095 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/clock/rockchip,rk3588-cru.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 
 &{/} {
@@ -80,6 +81,7 @@ &csi4 {
 
 &csi4_in {
 	csi4_input: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
 		data-lanes = <1 2 3 4>;
 		link-frequencies = /bits/ 64 <445500000>;
 		remote-endpoint = <&cam1_imx415_output>;
-- 
2.43.0


