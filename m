Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6E2CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 02:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=; b=AvJ1deqLfK/ka+FSF1qlW2S/KZ
	A74inuJpItaf3wEZXq8KVjsP0udbqMLv+vixTqipMvXmChxLW1+rLs1Kp2viq60GFOa4GrmqzUEDu
	NYuqJtnvhr190ApP/BSFbD+9bUDIzbU1luLu4gf75Dvb2mh+xC8GxXQsfgorw7e2evZd8GqKkHk5l
	gATqMUGpZVWcwyiFOB6f3RGK3jTrNNqRt+/xb/mF8Opkoq2f8qN+r7GZrKXCeTvvo7m2ehvIKNlu3
	jC3E75lAmK7Z/sXkCZPtZHiTPKAxped3OJarAHqmPt0ZOHWYReQLYORVn59yxlXc6QouD8wzLzqZk
	zgEL8FVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGmS-0000000C4w1-2fAL;
	Mon, 11 May 2026 02:54:04 +0000
Received: from mail-vk1-xa61.google.com ([2607:f8b0:4864:20::a61])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMGmN-0000000C4sZ-47Nq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 02:54:01 +0000
Received: by mail-vk1-xa61.google.com with SMTP id 71dfb90a1353d-5637886c92aso1761730e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 May 2026 19:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1778468039; x=1779072839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=;
        b=PsQyFLEsWgacGGFHyioZxNx+8ZD7BoyoqDANfLQf3ajUT+qZL9IdShiZM2sv+7vvHI
         pv+xFySucMT66s3/gBP+jJglS+5IYKO/QdqEow64yWV9NXcb/Noht5MvrL3u4RpEJbqE
         GPwbd89oFW4/aF403CFNQdYmV/kkSK8cTbCpbljtvsE2WBMOkh3Nde7VWmtVNLWKe7Xg
         WdQs18P4vVbKMbdinpPHyr833q+1lB01ihXgFdHoZ6iBbYFH6vY4x6xtKFnOV/Wu6rpB
         0jMq/sAWkn110+8u7XdU/yk00dFuNiul4TCbQWwiu6kh+T1Bs1HqY5CD7cY+jRaZ3Bdu
         y7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778468039; x=1779072839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hI3It/TBwNAH4is3Y19ZdHuT8VgKHisEZqEHUOa55pA=;
        b=YYWiOMryx++27/K0AdlXlgDawLEloFtq6fvNystYd9Xw+xblPWtxreqK8+tkHinIVj
         Py3r7/49kM6pAqsRcNbv2TTcU1weU7IB0AmJ+eC2Fox+nm+lGbSPrZF/Vt4AjjeMTGvk
         JgGVBhRtvViQeKDjhMnuFyfrput/6wl2Ubm8mFqqa5281bLEMVl6UBcCXAoXORqp4u7B
         7HLzy8IeSY9GSfRQjNp+/UpVPHlnSFZbnPjuBWxXFmlLN2Q56PKUJp4xypuoLLE2rgzf
         EC2kt1MDLkSrEsIdSxTDGaC/+9opj7AngeDzmlybvcmphx+ePDWTVNDKRwMrtu0UEv35
         gd4w==
X-Forwarded-Encrypted: i=1; AFNElJ90mHUBz7MizdTMZ3fCelY4JUk2KO3EjcaACZ4Ir5bC5DW86LRfv96Q06j33LALeuIYhPE5d9AvQioTpntdSn+R@lists.infradead.org
X-Gm-Message-State: AOJu0YyKkuGre4O1sb7Z9WQBXCV9Z+mWWfuRA1wi0zRCNSMwM6lExG8v
	jfH6fvB8H+udXsjF+PrZXXOyATm78YtuYkDfrSctt5u16GCjkKuChU02jFFvpJINIVaqm4g+pri
	GPg1K2Ldh88KpRGMAR/CuGHDbgZMe9r1CjN7/
X-Gm-Gg: Acq92OGti0VR3DBLC6lj5CqhDGu7SXZEJ91lCX/+Lg6tL2lz1HzlVj3+kofSZptquCL
	8p5fP0QtEjVCg1ic2UFP0bJe8y2o6wsHAe15p8O9876zX8rBlEyQ7P4RVC42KS3T/axBwKjU7Ul
	B1F7yov2pnwzH3f/fy7qXfBb5jqEAgs4OgQBVoKFYWII1FAEY7/kqRZ7bsDR0GSqz4nBFmKVYF8
	3P7QaK4zVcGaJwVhFKhsIyhreFogVqKKvrEnuS+nKsi/dQemNduMUnPkJi1jtWd24gsOWiDxgKs
	nD7kxOD3PEGecd+iMXsJE8QKu0/3JVtfAeM++usp4MFZ0J3QYDCDus7OBLvO9qGWMqekVPFfsIU
	rYnDdmI09igX9gzKssZbK9+8sgtnxek8m8Eu5Zo0POS1o
X-Received: by 2002:a05:6102:8551:10b0:631:26f6:701c with SMTP id ada2fe7eead31-63126f6ad99mr5986189137.31.1778468038687;
        Sun, 10 May 2026 19:53:58 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-6313ff6c191sm698744137.1.2026.05.10.19.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 19:53:58 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Alexey Charkov <alchark@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH v10 2/4] arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels to match schematic
Date: Sun, 10 May 2026 21:53:48 -0500
Message-ID: <20260511025352.106126-3-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511025352.106126-1-dennis@ausil.us>
References: <20260511025352.106126-1-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_195400_024413_ADA2C198 
X-CRM114-Status: UNSURE (   9.81  )
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

The Orange Pi 5, 5B and 5 Pro schematics label the RK806 PLDO outputs
using the pattern VCC_*_S0 / VCCA_*_S0 / VDDA_*_S0. Rename the base
dtsi regulator labels (and the es8388 supply references) to match:

  pldo-reg1: avcc_1v8_s0 -> vcc_1v8_s0
  pldo-reg2: vcc_1v8_s0  -> vcca_1v8_s0
  pldo-reg3: avdd_1v2_s0 -> vdda_1v2_s0
  pldo-reg4: vcc_3v3_s0  -> vcca_3v3_s0

Also update the saradc vref-supply reference to track the pldo-reg1
rename. No functional change.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..fd5c6a025cd1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -274,10 +274,10 @@ es8388: audio-codec@10 {
 		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x10>;
 		clocks = <&cru I2S1_8CH_MCLKOUT>;
-		AVDD-supply = <&vcc_3v3_s0>;
-		DVDD-supply = <&vcc_1v8_s0>;
-		HPVDD-supply = <&vcc_3v3_s0>;
-		PVDD-supply = <&vcc_3v3_s0>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcca_1v8_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcca_3v3_s0>;
 		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
@@ -441,7 +441,7 @@ &rknn_mmu_2 {
 };
 
 &saradc {
-	vref-supply = <&avcc_1v8_s0>;
+	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";
 };
 
@@ -666,8 +666,8 @@ regulator-state-mem {
 				};
 			};
 
-			avcc_1v8_s0: pldo-reg1 {
-				regulator-name = "avcc_1v8_s0";
+			vcc_1v8_s0: pldo-reg1 {
+				regulator-name = "vcc_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -678,8 +678,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_1v8_s0: pldo-reg2 {
-				regulator-name = "vcc_1v8_s0";
+			vcca_1v8_s0: pldo-reg2 {
+				regulator-name = "vcca_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -691,8 +691,8 @@ regulator-state-mem {
 				};
 			};
 
-			avdd_1v2_s0: pldo-reg3 {
-				regulator-name = "avdd_1v2_s0";
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-name = "vdda_1v2_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1200000>;
@@ -703,8 +703,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_3v3_s0: pldo-reg4 {
-				regulator-name = "vcc_3v3_s0";
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-name = "vcca_3v3_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <3300000>;
-- 
2.54.0


