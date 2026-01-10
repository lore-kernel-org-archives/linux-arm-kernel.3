Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC99D25020
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 20:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZp/4UqxgVJEKQTMowPFSKPPKs3A6A+N3Xt0eLrI87c=; b=bHZ2mb920YF0tO5B5Jrm1l9FeY
	GNZ4PUajGdsJtEqL08WueWg6Y/3lILTffKkhIr+lckjwBMQwT+vg5ElnhfvMJbixoI7yRrTKh+nms
	aVjxSMppxnJnmo80OqBFUK7ceaOoTpA887+v/v9zGx4bOU0gfOapORm9hSoyYkiYOuviJCP06XdkK
	gJNKqvps5QZ846a80joImoaYmOEBf6VZhPA4VToAM5xeZBEIRZzFIJMyiq0K1dFJCs0jt6eRanMr7
	I71qexbzt9u0STnmzgSu4pFeAewkD7plyKbW0fF3FO8FYzbTdV48SNiYtvezjOo5keqxblzBnLJBl
	Z67bnQ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCi-00000003egk-3B2N;
	Sat, 10 Jan 2026 20:04:56 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vefCe-00000003ecY-13lu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 20:04:53 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b728a43e410so954675866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 12:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1768075490; x=1768680290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZp/4UqxgVJEKQTMowPFSKPPKs3A6A+N3Xt0eLrI87c=;
        b=jRv9Q6EERZ+/hrJOBnN1HFaWoiuHoW586Q1RlsvH59z0cujWyOgqCA4aozOtNt5i4A
         Noz0re8FS6BDhGFD/qhxBktcqmkUvDkA8/qkaAK0u858REXjSM0QiMzBKcdTHZ+qbGeU
         yhpOKL28p+2lFNX4KhGsG3spklFOYujfnzLH/Y14+oLPdkI9/sJq+aEKYgefhUC1VumG
         ulj0bDQD6wz7z294LzS5EthWk5GERVU0gUgXoUXxyjCFfloYtn9eO+udMwDIh6O9plQu
         IiTB3ke3wAxQ6HRmLY6UePkgjFfO8hJBzUW2JKnVmzVam1HAVxtn+hBCp/TWhpj82eH5
         6AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768075490; x=1768680290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZp/4UqxgVJEKQTMowPFSKPPKs3A6A+N3Xt0eLrI87c=;
        b=gHgQvsgT7TD7JUyVUlmsZo4YSUJMFeQiP+EnHKUCVmc4ICrHjPpjzXBRz1ulhn9TnV
         vfQv1tPJAWsyz6u8pjgJCJjGAQvLLTw06ljXsniw1KmkPt6GZ1GRF6jPyvW9RaNkmZT4
         UDVRMGToesQL48ooPPvBEfpMBjujtDywiFdBKl7ElWUC4kCNgoYM+cvHHBH4y33UJ6ux
         x5opHYuxbdssEIP9CoMyjqI7yBNtah5qiWYUqUAxu8XjevmLF06zgLy6aWw31TS0ojOR
         Xbmv+roTeHXmbnyDwfxRG4lhD6hvr8WQFbzxlazjhdqiYgQazcVrAxYsA44BuazmBCLi
         KC7Q==
X-Gm-Message-State: AOJu0YzjL3UHEqzbZAd23k6sLQjffmMLmrFawryGXGzibJE7WvbXG8ab
	sBZRKIpXZ5cbrlNOk/ys9RBYbWcNXbuDXZxKUDqn1oGbR2aDZM48Yll5
X-Gm-Gg: AY/fxX64yslNsNOH46RkgcHn6ahp85C22kVo5oM2bj6ocaQFM85k+hWrBTweQDdN9Rm
	HWOP9eGL5vZftx0jqqg4mUpuhJpmSMk3mItmVj0JMXg+p8UCWvmIP8qNMW6NPe53Wgq6pSniOIS
	tiJNZafUno9x/IU2Q4sJH4R8nay0AdQ4TIMQIEVOYtAqVZkIDWBECvHKYUJwavWVqLr/LtOw/XE
	igzP1lx4GioKk/8+30MSvsHBWVo7y63mUTxjsnO6AzEexwP2YfP18Jc8cmhwYcDH0DH4nMD86Th
	zw53gRcUkI0seMj4/58xKZxPzNaaYWeZrckSWSzJzxAs0+kKfnekWrLV8Oj4a6mE6ScltQ3Q4Q+
	C7P7Yzfif8RNaf+b05U7sChB2rwDlbBsWWacDuDWQPZCrolFc8I/UyrDd6YM+MfZm8gLT+pEjG+
	ZR4NOmrh898Azpfx2qqZXYOx11TGfTGB3ooUCzk6W7usQYDBrzwyqWmaAtvTu7MmYDBGCh+rTfB
	2ung0JavZvYpn3Oc95B4Fs30RIFZR1980ccIzbgDiY=
X-Google-Smtp-Source: AGHT+IGvuE3mHQEPZbwg7WpapEXPLdH/efnHZhaaOVZWj4l0e/xQBTMgKbiWHc1unEZSi4FRGpH6qw==
X-Received: by 2002:a17:907:7283:b0:b83:1327:5f88 with SMTP id a640c23a62f3a-b84451da312mr1328889366b.16.1768075489920;
        Sat, 10 Jan 2026 12:04:49 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-af95-6f00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:af95:6f00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b842a56c552sm1483591066b.68.2026.01.10.12.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 12:04:49 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	adrian.larumbe@collabora.com,
	steven.price@arm.com,
	boris.brezillon@collabora.com,
	robh@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/3] arm64: dts: amlogic: S4: Add the Mali-G31 GPU
Date: Sat, 10 Jan 2026 21:04:26 +0100
Message-ID: <20260110200426.1461575-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
References: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_120452_305443_BAC6F24D 
X-CRM114-Status: GOOD (  13.56  )
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

The vendor BSP indicates that the Mali-G31 GPU on Meson S4 SoCs is
similar to the setup on G12A SoCs. The OPP table and resets are the
same, but the clocks (G12A only has one, S4 has two) and interrupt
numbers are different.

Describe the Mali-G31 GPU with it's resources and enable it by default
since all frequencies are using the same voltage (as the GPU is supplied
by VDDEE changes to the VDDEE voltage are not needed at runtime).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 49 +++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 9d99ed2994df..efd3dda7d2c1 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -66,6 +66,39 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	gpu_opp_table: opp-table-gpu {
+		compatible = "operating-points-v2";
+
+		opp-124999998 {
+			opp-hz = /bits/ 64 <124999998>;
+			opp-microvolt = <800000>;
+		};
+		opp-249999996 {
+			opp-hz = /bits/ 64 <249999996>;
+			opp-microvolt = <800000>;
+		};
+		opp-285714281 {
+			opp-hz = /bits/ 64 <285714281>;
+			opp-microvolt = <800000>;
+		};
+		opp-399999994 {
+			opp-hz = /bits/ 64 <399999994>;
+			opp-microvolt = <800000>;
+		};
+		opp-499999992 {
+			opp-hz = /bits/ 64 <499999992>;
+			opp-microvolt = <800000>;
+		};
+		opp-666666656 {
+			opp-hz = /bits/ 64 <666666656>;
+			opp-microvolt = <800000>;
+		};
+		opp-799999988 {
+			opp-hz = /bits/ 64 <799999988>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -783,6 +816,22 @@ ir: ir@84040 {
 				status = "disabled";
 			};
 
+			gpu: gpu@400000 {
+				compatible = "amlogic,meson-s4-mali", "arm,mali-bifrost";
+				reg = <0x00 0xfe400000 0x00 0x40000>;
+				interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "job", "mmu", "gpu";
+				clocks = <&clkc_periphs CLKID_MALI_SEL>,
+					 <&clkc_periphs CLKID_MALI>;
+				clock-names = "gpu", "bus";
+				resets = <&reset RESET_MALI>,
+					 <&reset RESET_MALI_APB>;
+				operating-points-v2 = <&gpu_opp_table>;
+				#cooling-cells = <2>;
+			};
+
 			hwrng: rng@440788 {
 				compatible = "amlogic,meson-s4-rng";
 				reg = <0x0 0x440788 0x0 0x0c>;
-- 
2.52.0


