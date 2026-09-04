Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248F5C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/t7wxFBsuNgANZ3txwtSGvXS0Fyj90ixWLfFCZVhFw=; b=gVOzXpTr8T5esrGxkRx8cuCAJs
	rEI2uhXBsIVBXPoHkOyGN8w17bk2wze3Uc9wPQX3ku9Bicgn4nnhbW1ztjHuKJN7l0XKdcZyP1Rja
	yjqqjiYXD9+/oxVy6V+9YMAmhZZnEMQ+tl9spv5T6d2gQESZHRqDGCqEsMDvz1gu5Pg2demlkkJ9E
	tSDsmIEVfzHvHSQV9VSqtlAxg/gpgrCHGAZPRXTCwaSCJkAxS9ymY4szWjAnSWxw57nz0Y0yFFG5g
	ti5EdmalnQGsVxQCL9pSbk+faSYhPfd6WOKyvW5Jwl2nDi+CcGBGdcxH4gasssOdPTwvK4eEyDwmA
	/0vyM5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tfo-000000026nD-42YK;
	Fri, 04 Sep 2026 13:09:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tfl-000000026hg-19DQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:09:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4954c08a7c8so815405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 06:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788527375; x=1789132175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E/t7wxFBsuNgANZ3txwtSGvXS0Fyj90ixWLfFCZVhFw=;
        b=b1w2K7r5geNnJ5qf3BGQWPBOsdvEAHjhM/9u722KDgG1FFLSAzs5hM/PjSLboTlQDW
         VrjdmW4QA9awmLD7J7VyEKrsG0Nn8KrApCr5pNF/GBRmf+/VR9Tp5zXBZcGdvGzs5C41
         VJ7TuzF0fER68Lkf3y3tkJ23zG4HEGT/vlJ+6lXdqSSlE6j3jI8q4Y9AqoMqM2Af+I2b
         Bxb935bMU8lKD99J5F4Mx+GvzJdujPc/Cvyr9eZCThuK8RB3F36agcn0b6JDBZnEtU9H
         3mNRmI4mfaj7wLDmpTIvxAmMpe/k8ulwqgVk2MdhyTbzxkX/RHgUGYpNaY3EBdEsjIbR
         h9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527375; x=1789132175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E/t7wxFBsuNgANZ3txwtSGvXS0Fyj90ixWLfFCZVhFw=;
        b=TSlP4b3GIFicRzc7PzQbJU/fABXwDSX8lsbpysvCgmNLbweOZJvyGgLS+XoQewxjSR
         O2quonjAWcaUcedk34+dhiflB2fo9KxNs+7oWpleCZWMKk/RI0HCwD77XiRl5r4ZwT/M
         XOXGRwXZof9LJrbjqd8CAtmXJrJ+N6n+fOAgzACSx8yY77SXTZ+SucNcGB5Xy5J1WIrV
         GyM/bZ5mKa5rTCsrSwUmhxOLVICUMyCaKa4F36eA4dcYGmYDAGgFK7+7zXmiBfUsh/hB
         MYQlVYD6L2537JBXhk45ZuM0wLCnsnI679UdLkJfmnhpRhmfiohbFjn7YKpCn3oXxP19
         1dSA==
X-Forwarded-Encrypted: i=1; AKwUvBy1766rZ61GTiZoFUCulZSEcas8Dd2nTTKFaw8IixQqqtPKqHP/mGNjaE/iHEFnlaOZcI5KjFImC8S2cy6irwwr@lists.infradead.org
X-Gm-Message-State: AFuF++nhIQUDSOaKurqGlTHA9MPrRQmb2aNsQV0+PyOOhAD6/Y8nAypf
	9Bo1WmoUgagbbP2n/myEPIvHESrEFy+qnkCHBTFTizPO+7K6WlEozl9J
X-Gm-Gg: AYBFou1br1qUYhiIQ9oTZ3Bc8OfDOSmPvIjOLUb1G+1SWr5uLAIjZ9CYkoUubz+WExu
	6XKqF89AXqu3YodPBVnHfSiYBzqObsvs3EkZTfXkXx4M2uMno51GjGiI16+dKB1Wl/GqceaJ7MW
	hgJAKafKRUdxEdiQDeYthHrk7548ZHrXQtz6kvyeV8N9uUsKxxga8w1dhefyCgDZmByAvfISxqE
	eIYfVvitFvD32UliLt+ceL6QJw/+Wx1vurBKOaOkYYrn97OeV20V75lwaiZx2pO3CdU2l8mPpsb
	y2auCc3xk5kQBcebpRb+A6JX5cInQoafz0mv2SIar2gbUSMwseJceJwhIrbJyVphyMqeyuvbsuP
	UJOPyaXNQkC3CxGWj1Xc6HV9RX5YWMAQ2C3wOjdd+oEn2+zZNCEki/ZUkr7rsYFOD0niCB7Zz19
	wF5qombCurfX2bIkCTgahYsQVKMPtQjYnJXI8GD62TdjYOem1itIr7QsvMoZw7aT12DW4QxJv3L
	vuQ23sfRF0cPkgL9w9boRWX0Ki+dL97YkQRMfq66dk8+7q/URS8AKxshj5UAaYBcoiM
X-Received: by 2002:a05:600c:1c24:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49cf7f4d9b7mr51876155e9.0.1788527375338;
        Fri, 04 Sep 2026 06:09:35 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B871500CB6EF488A18F9C42.dsl.pool.telekom.hu. [2001:4c4e:1b87:1500:cb6e:f488:a18f:9c42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce554d52esm135575435e9.3.2026.09.04.06.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:09:35 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Jonas Karlman <jonas@kwiboo.se>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 7/7] arm64: dts: rockchip: rk3588: add passive cooling to the NPU thermal zone
Date: Fri,  4 Sep 2026 15:08:58 +0200
Message-ID: <20260904130858.27803-8-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260904130858.27803-1-royalnet026@gmail.com>
References: <20260904130858.27803-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_060937_345475_C175FAFB 
X-CRM114-Status: GOOD (  16.58  )
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

The NPU zone has had only a critical trip at 115 degrees, which is a
shutdown and not a cooling policy. Now that the NPU can be throttled by
capping its clock, give the zone a passive trip and a cooling map, in the
same shape and at the same temperatures as the GPU zone right above it:
85 degrees with 2 degrees of hysteresis, and a 100 ms passive polling
delay.

The #cooling-cells property goes on rknn_core_0, the core that carries the
shared clock and the OPP table. The other two cores have no clock of their
own and cannot be throttled independently of it.

The cooling map is inert until the driver registers a cooling device:
thermal_of_should_bind() only resolves a map entry once a matching cdev
appears, so this patch on its own changes nothing but the trip point.

The thermal path itself has not been exercised on the board this was
written on. Reaching 85 degrees on an NPU workload with the fan curve here
has not been possible, so what is verified is that the zone parses and
binds, not that throttling engages at temperature.

Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
Assisted-by: LLM checkpatch dtbs_check
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 376ad04e07869..c3d22b08f415b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1162,6 +1162,7 @@ rknn_core_0: npu@fdab0000 {
 		clock-names = "aclk", "hclk", "npu", "pclk";
 		assigned-clocks = <&scmi_clk SCMI_CLK_NPU>;
 		assigned-clock-rates = <200000000>;
+		#cooling-cells = <2>;
 		resets = <&cru SRST_A_RKNN0>, <&cru SRST_H_RKNN0>;
 		reset-names = "srst_a", "srst_h";
 		power-domains = <&power RK3588_PD_NPUTOP>;
@@ -3212,17 +3213,31 @@ map0 {
 		};
 
 		npu_thermal: npu-thermal {
-			polling-delay-passive = <0>;
+			polling-delay-passive = <100>;
 			polling-delay = <0>;
 			thermal-sensors = <&tsadc 6>;
 
 			trips {
+				npu_alert: npu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
 				npu_crit: npu-crit {
 					temperature = <115000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&npu_alert>;
+					cooling-device =
+						<&rknn_core_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 	};
 
-- 
2.43.0


