Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D6ECCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JF1Khuy4nqLiE2y1n9lovRhx5obbKE7xwKO+d5/rlWI=; b=YLQ1p7xJ6X4wS2M2jNq/DdqiP+
	4gyr0RZQeXceuZdFGJsvBO1YDAZVn0O1UylaD5FJVwwnqZBF51UgH7HNYbJRnmxORfAi3Fhd9nvLW
	ORwxc9prIovgTLpKSnH3lzbAnoT5lzOvhSkANCfyFIrQYoJJWZ/V/cqCAQnVsZesvHK+6prVcpTSj
	hPdIrAUmLSSt06BRVElkYzBpDsy3t9iFeRx1vHL/EVog8GVvXXp8nctBbEwRrxW2epWaYIDROLOHZ
	vdewnrKMoZKelye/4XvcI6OiuYLHIiUtX/CaQ31T26vmIwh4pkKl9pGx9xGMzz863BT/tkIPOPhuC
	SL5UUHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECq-0000000HUGV-45S0;
	Tue, 21 Oct 2025 15:23:25 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBECh-0000000HU2t-2GEv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 15:23:16 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b6d262c8528so132691066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761060193; x=1761664993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF1Khuy4nqLiE2y1n9lovRhx5obbKE7xwKO+d5/rlWI=;
        b=TpSP7IjyPAg7NZtWy0iygaJYcJGkOGH5v3v+EC3fv13r3NIuxkk71cztVHfTlWnlzY
         tComy9ct79KLnHy9zR5i9w3LEqTEmaxvI0l0DTvqaBIK2LqWBtKitHxUKr5rSNRau8rG
         uqGwNmVh34vAuK0w7RGMb4eLbkqeFNc8kbJmMJswC9WbroblB9qxjIXwkcgnlyV2hxdI
         N5wZC8DQjSJTsA68e4NHgqJzPzAWznuRjpk3QYSwTb+jC4Dl4glufQDnY7iosyaSB4VT
         FNpar0A7DU2oi/gNLh3Ma19E1j8funtkKj8QX4AdAejufIAf7r3ITdqKgM/sa4goKTbh
         A8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060193; x=1761664993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF1Khuy4nqLiE2y1n9lovRhx5obbKE7xwKO+d5/rlWI=;
        b=nt9wagjktDyZVqMQSZ8BrYiNZThcIoJShQQqkh8c+UI8bVdQszUHIiKKKikmy1VP8w
         /OamMpWbM09s/VReReqH8RDyvzAlq1O8QghKliDsdJq/CD+WC8AsLPn/RzC9YBZJDkWI
         Cj8x9tYBaKyq+ouvEvX5htGq1U1KA6/oNUsBnj55EM7LcjPz425h7dDMzOLs8Es8v91/
         cXYTHieTH2FGMUHrXTuSIzpbOFDHEv+HrD3K8EfiBz6ozu0skMyf5qS4o/BtrJU8AxPQ
         qCb6mfVpcq2J1E7oPvzTvuonTvIFS5iUzXuHfBZjb2r7AQhIQZGMTkKhQqqrZp0hv3ZI
         9SQA==
X-Forwarded-Encrypted: i=1; AJvYcCWhrrQ9LIuv1qvQ7J4G6jcpneBO0edlL3ZJ6L1Jyx38bJGj5nKheAujJdraBufQ+BjLiy3HhVwKoKjWc+Crjo4S@lists.infradead.org
X-Gm-Message-State: AOJu0YyChcml+latxiojPY05UPYygbRr+yrBuVkHL4PLYUbFda1BgnEm
	YH4r7B4xTnHhuGlLHY+VNCjv42crB6HWm0QksAp686XLSxppms9sesxP
X-Gm-Gg: ASbGncuEMbPZ6jLpl6Jk50Xi21Pg79H+k7X221XlYziyqyUUPBXi6vVmoTwqe0SJg5o
	2Y1dRc2nQqH4bdr0vRml+L5w9wfX2MRsQ2oLoZPHxQbDqUTeV4yZ2whUDT6wgO64M6nPyae3AOj
	O5iSot8Hyn0zIgZp4IAJmoOnYrS4kC5zWxRcS2tT5//2huocE7AFFoqc/5o7aKwwKJOWlS3oiPk
	MfUzZuEnB+J9GbgFTaAuFHBjsHfKO5usDo6gOcXteKelV7VdxyccLe2aPjJLqA3koOtCACzleTs
	mA5YO/AEYICed2cl3nuTRBvs3YDfR/1EQ1utWSqlCIWTc7bADH09mPLazJKt1SoOGubdSlFhN6X
	Ho45Wctp4sMpquHDP6LUGZXS+aWJAaN1lL6u+foJEIyWJF1wKgD0ItyQxgNjeBthqfDU1GfNZ8k
	YNU4d2zMcszORFfoOshRiAB23oCoLyr62rdZc0fQ==
X-Google-Smtp-Source: AGHT+IG8ZMx/3IH1gWXA/kMHWe4Ced895g7GfNQEjLkqqPoqoeKq+HY9fH6rztVBxeqVkVrZOdbVkg==
X-Received: by 2002:a17:906:794e:b0:ad5:d597:561e with SMTP id a640c23a62f3a-b6475708a50mr2149204266b.56.1761060193479;
        Tue, 21 Oct 2025 08:23:13 -0700 (PDT)
Received: from tearch (pc142.ds2-s.us.edu.pl. [155.158.56.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8581780sm1082737866b.31.2025.10.21.08.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:23:13 -0700 (PDT)
From: muhammed.efecetin.67@gmail.com
X-Google-Original-From: muhammed.efecetin67@gmail.com
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	heiko@sntech.de,
	neil.armstrong@linaro.org,
	lee@kernel.org,
	rafael@kernel.org,
	efectn@protonmail.com,
	daniel.lezcano@linaro.org
Subject: [PATCH v3 5/5] arm64: dts: rockchip: add Khadas MCU and fan control nodes
Date: Tue, 21 Oct 2025 17:22:45 +0200
Message-ID: <611deaaa0e408eb042db7faf215b85370569edeb.1761059314.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <cover.1761059314.git.efectn@protonmail.com>
References: <cover.1761059314.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_082315_610235_9006974C 
X-CRM114-Status: GOOD (  10.87  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add Khadas MCU fan control to Khadas Edge 2 with 4 fan control levels.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 .../dts/rockchip/rk3588s-khadas-edge2.dts     | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 2c22abaf40a82..ed5168d50e182 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -271,12 +271,70 @@ hym8563: rtc@51 {
 		clock-output-names = "hym8563";
 		wakeup-source;
 	};
+
+	khadas_mcu: system-controller@18 {
+		compatible = "khadas,mcu-edge2";
+		reg = <0x18>;
+		#cooling-cells = <2>;
+	};
 };
 
 &i2s5_8ch {
 	status = "okay";
 };
 
+&package_thermal {
+	polling-delay = <2000>;
+
+	trips {
+		package_fan0: package-fan0 {
+			temperature = <50000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			temperature = <60000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+
+		package_fan2: package-fan2 {
+			temperature = <65000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+
+		package_fan3: package-fan3 {
+			temperature = <75000>;
+			hysteresis = <5000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&khadas_mcu THERMAL_NO_LIMIT 50>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&khadas_mcu 50 72>;
+		};
+
+		map2 {
+			trip = <&package_fan2>;
+			cooling-device = <&khadas_mcu 72 100>;
+		};
+
+		map3 {
+			trip = <&package_fan3>;
+			cooling-device = <&khadas_mcu 100 THERMAL_NO_LIMIT>;
+		};
+	};
+};
+
 &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };
-- 
2.51.1.dirty


