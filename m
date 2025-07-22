Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16149C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VY1KO4QAZzZFGNRNm4f5tC1BzdVHx6jlB4mstLlz1o=; b=yZ1ohG9ozrVs7UEeRWG6VAgZYs
	c+ffqRc7meBw89EKakqNC7qVUIPWqI9pLwke1ZNzOW6yWnHtX93bDjYDCKOtZ1uhGhbhJmRlbSe6+
	7P/VRZxPNckypqfsh4LpKDRyPTEkcTnZF0Z9vHei82hix0ynOc247yW1XJy5LIE6pjJTVS1gJp19k
	rK0ru+j1x/wozVbSupiSPNYnMGHUGAnfI1Dcqgd16QtDPalT90iRrmO6bryhIGPTzUK1LgSAJen37
	+/YRqWbUL8HIJ3NbOr/xWNw9RzvYoBZj+RxjIENM5YQdG7728tmMh2k4/F7wf72ZwjJnDMRZNTAj0
	bJRqinyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDPg-00000002bPH-326z;
	Tue, 22 Jul 2025 13:52:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueCHJ-00000002SNQ-1nCB;
	Tue, 22 Jul 2025 12:39:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so2664644f8f.0;
        Tue, 22 Jul 2025 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753187968; x=1753792768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VY1KO4QAZzZFGNRNm4f5tC1BzdVHx6jlB4mstLlz1o=;
        b=QF5drQkfuJE9KuWfv80Dc/fd2xZO9/DoO8dDQLV/s57EfYQzmwnRrJ4d+0XJAalFOZ
         sm0Jx9qo4vSKwZAsW3F5+qBJ5Qgbo+MJnDMHyOE08iuRjpwncgK//O/LT1bm9cBaw3ph
         cWjPmhZF/tCJrMWFwyb+42cbGkWIFxfVFNs9qCj1p0sDd1LuWeEWNU9EVK0q6EEPN6Rj
         JG67oxSknqR3Qn+NZcIrVWelQGpbEKFpdcBMZJMtEAtAw4f3F2BNmo+Jw5m77Bu4E4Pw
         PS79zTYgiPXZ7ctaLJp6kO8CNGkTh8W+3POyKSqHGX9yYOYTCzyyy73xKCBMuMrp6Pii
         Rj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187968; x=1753792768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VY1KO4QAZzZFGNRNm4f5tC1BzdVHx6jlB4mstLlz1o=;
        b=LNoUigwg0aPGEc7cEOKNaehAX+ROei0orzV/bYqLXs9EhYY6Lj/RWplJoRusnsiW8g
         vnx1DVwdQZPmOFNuIWf+cZp1cTzbGQknKniikhaWSge2rOhhpyNqn4LOkQFjlZwv735r
         8edbgnZYGWrMln7NWKQNFPYbzOC9dJvASNorENYo5/lGthBtun5So3/InkbZW994LuLZ
         lIIVDX/oGxTU4iFWglPTc3gejXg0y7+S9PVGSIhzycEhW2xSPnwWWre8sChNF0HTIx3Z
         EE5Fvuy/DFl0xUWLOa9bnEzCxkrHfZjZ0OsfsfhvID0/j/KWydCpcJbuKEqkpeOKv9k5
         HUEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4DcyXphJp3KtTEdWj709yukSHIhdu3utGTo4pgy4KBZIvKXQfL9+VCY3VXJbJiaH7meYD37h22By0G5avY39X@lists.infradead.org
X-Gm-Message-State: AOJu0YwY2B3Fpq81Svvm1vg+0jMjIa542BCzeC1SMeKUKw10v0SIC0DZ
	+TUAmrA7fib0Zr787ECOtpY1kzICHioNES4225pkKMmtY2tgt58bb7guKEtKjyL40/+E4Q==
X-Gm-Gg: ASbGncuLFXkDnnf7cMK+IjnFRVpS27uTBivM59FH7f/HW52jPp7vlMip3LWAICdImG9
	l/ssLvu7ip4IeV6qtnczsoNcNQndjFlaVA0AgMxWevDt47qQuMQMcD0wDjOTvFjJMvR2ptivgLc
	qnLbehakhOvXel7bUAb7AevJ23zECqPenMfZG9tX0nv5EqLnHWY+hqrsoxmvsOKCbiFBmLv/YIQ
	mGMsZv6TaTp7iRD0NkG1IZzi8Fd3J+uFl0DHVCA3B4PSGXhuA2SQQu3ZmzrNJ0qJf6m1EKR2phb
	YHb7cdTtaooCQEV9bsx8oGwGtzWvGgCnB2GiUsZ8JIKfaSkIWcH0s9SNuzUhIxfOf995d0r6JR+
	wsjVPIBkNVBq5r2yDPpvr3xV57pk=
X-Google-Smtp-Source: AGHT+IGsyl5w75I2qFaIzkSqXqTnjmKpHDiAq/bQSwW3RqWK1nxdztJM9kKX9bkY9kK7dSxs0XmxjA==
X-Received: by 2002:a05:6000:1a85:b0:3b5:e6f3:ac9b with SMTP id ffacd0b85a97d-3b60e4c47fdmr20541975f8f.5.1753187967431;
        Tue, 22 Jul 2025 05:39:27 -0700 (PDT)
Received: from tearch ([46.104.48.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48c40sm13525197f8f.58.2025.07.22.05.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:39:26 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: rockchip: add Khadas MCU and fan control nodes
Date: Tue, 22 Jul 2025 15:38:15 +0300
Message-ID: <1e4a191ff94098a5b086a83d14b37944351242ab.1753179491.git.efectn@protonmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753179491.git.efectn@protonmail.com>
References: <cover.1753179491.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_053929_471745_4CC302E4 
X-CRM114-Status: UNSURE (   9.55  )
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

From: Muhammed Efe Cetin <efectn@protonmail.com>

Add Khadas MCU fan control to Khadas Edge 2 with 4 fan control levels.

Signed-off-by: Muhammed Efe Cetin <efectn@protonmail.com>
---
 .../dts/rockchip/rk3588s-khadas-edge2.dts     | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 2c22abaf4..b51b64732 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -271,12 +271,70 @@ hym8563: rtc@51 {
 		clock-output-names = "hym8563";
 		wakeup-source;
 	};
+
+	khadas_mcu: system-controller@18 {
+		compatible = "khadas,mcu-v2";
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
2.50.1


