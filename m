Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C60CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GokYqYG+lmT2oxJ+O2O4SIepQEUsvS6Oqvc1Ps5nstE=; b=VIqHUkOoMNsgVjAa6Uo49DujEL
	xQeVbZUcWy9OgDQr7JM7NgQyAfMIcxe0xcmVjNG277saAA25B1UbhIo956wFGZA8xaKtZK6sanbOt
	UYAesXQaMq7tNGMla4O/vXY2kB3MYgWVDiXi+XPMb57xSWQI0TTIcYVYPv+A7BhUsFpG/6Lj/bg+E
	JQMJxeY12g4iyqG/bXldhcb8jT4gWPTdi1rZZ7CgZGZQ+oI0SiPVJogwUUsgABwiRqZqjeF37Up3c
	CzGDpOiwRFo39gn8BaPETNhuvpMxV/Ahsfct+aSCflpmTgS8SqKZYevJxruEpuFGT/+DUd/YqA6Kw
	h1m+1rgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usKAA-00000007pxo-2AGa;
	Sat, 30 Aug 2025 11:54:30 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usK7R-00000007pqn-1Xcr;
	Sat, 30 Aug 2025 11:51:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3cbb3ff70a0so1779730f8f.2;
        Sat, 30 Aug 2025 04:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756554699; x=1757159499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GokYqYG+lmT2oxJ+O2O4SIepQEUsvS6Oqvc1Ps5nstE=;
        b=Imk7RHZznvnV2+nuY/X+Hst8A/IGzSmADayxEnr5N6ZyS7TnPtSGd+qv2t90OrxD7/
         KNtm0QffEYyl+t4njYGPC8biO8c9mTNeD6ImMtw3w/rcXtL/z/eEtZZHL2HxtquSjDRr
         TQIMN2z9riC2LohPDaJDhWgGSH8CTljvGwrx6wSZ13ql7fbkz9LqtbwLgs2LD6OAFCMK
         8t61t0iIRldASo5TiJbJ8wMS83h03yhhcBkWvGSGFHHJi3/79wruFQvIHbpGvKjpAP9I
         g8v435QD3XuJM9w/d0DK8UKZvVNXNw6V4MmWwMwmakoKGIbPNRuIyEwbsBYIWhn8g3l+
         Ij5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756554699; x=1757159499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GokYqYG+lmT2oxJ+O2O4SIepQEUsvS6Oqvc1Ps5nstE=;
        b=kV9OXWfwR3wBQfBrBmDjYSsSnlbcb5J6OGlGKNj/f0s1a5S1jhdxqginEf97cIR+B6
         4PaG0GLhskX+Dcm+/APzpXkTr0Xs82giA1n6NGIQE9372uL7QdZ91DIKDkYFBpHw5nxd
         /kQJWsmZQA2deaBpKjQeII9gQzXV5ftuHLcJf+ZCMmmSgXCF/8qdjRQwAA0X3oqVhIEw
         AmfPiwVXwyo3Xnru84M5RDpg6dFt3QdkXKEZlgLd1wQ86bU9TJxwvz6En88oe4Ymtgf/
         1yafxvhFcFvEQr/aqp8RlYbM4aZRIvdxbXMAnYsQFcyOZY3KHBvHZWCx8guiWGCMu9UE
         7b1w==
X-Forwarded-Encrypted: i=1; AJvYcCVc3YZRFwyuljGAoGyg3ZRg6cAyk3AfhBU/TNNCmKoGLMt4q9EMxVeAewK3XzIpdGvw4KiWAf4szDuxQiK/0fr6@lists.infradead.org, AJvYcCXSPPjY2ngYXpF/WilzUvU0AR82WpXOagbvLCqWthOEl6MNhdE0MyNrM6X23GNWiS6PcAtmibEt9OxlQfDH6Ak=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+b8eAZf0qk2hrB1yxJqmFxqT7wVwT8B0Fb2qiD7BzMwIUpQEf
	xstpvY1ijed8pLToJ/JYEtR8M0IXYjyq289LI3y4vW3bGvR19miSSVTo
X-Gm-Gg: ASbGnctPY63TGpbzmubMkJK25otSlT1bihxavbvwA1Bh2Q2E7f6ovfW2dL0phNUnkfR
	n1Z8mhcwvRL5Z4O6+9f0NSe++s6mDiVCKakK9d6pKRbg4Ep/pqP1ByMVMotfAOZXVhe5lNTbWBT
	jhnCKawtgxeMhaXumSHW4rjxRa9HwefHo/cyppcY9FrGfp+4BbE00Xq4ZaTtV6zILtQleKRZxsg
	OrzBrjwZmFyrEN4FUy8L7vWB5YOwxji3ZwK0ESH6dkkO5ZOnjxU8JJqvCi5+1XCoafd6isgVBOJ
	if4QDPDiq4Prk5MROAxIeg/LKqFzpUMtm5cpoRyNxTHLFdrViIl6zAKHqrCrbqx39+s6e7nTZxX
	dlJvbYCjzvgUdPqG0IkNF821AoeucFYCyut8Hwg==
X-Google-Smtp-Source: AGHT+IHyb14KPLvEBP1uzF4N+Mv+SwihHqssUNY/21QMVDEC/beh+sytji1kJH6KwbNaJwZlIJr5gg==
X-Received: by 2002:a5d:5d10:0:b0:3d0:ebf6:90d2 with SMTP id ffacd0b85a97d-3d1e01d5561mr910309f8f.43.1756554699143;
        Sat, 30 Aug 2025 04:51:39 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b732671b7sm68161555e9.3.2025.08.30.04.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 04:51:38 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alex Bee <knaerzche@gmail.com>
Subject: [PATCH 1/2] arm64: dts: rockchip: add GPU powerdomain, opps, and cooling to rk3328
Date: Sat, 30 Aug 2025 11:51:34 +0000
Message-Id: <20250830115135.3549305-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_045141_413129_18942FBE 
X-CRM114-Status: GOOD (  12.79  )
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

From: Alex Bee <knaerzche@gmail.com>

Add GPU powerdomain, opp-table, and cooling map nodes for the Mali
GPU on the RK3328 SoC. Opp-table frequencies are sourced from the
Rockchip Linux v4.4 vendor kernel while voltages have been derived
from practical use and support work: keeping voltage above 1075mV
and disabling the 500MHz opp-point avoids instability and crashes.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
These changes have been in-use with Armbian and LibreELEC for many
years without issue. Investigations into crashing (esp. with rkvdec
running) have led to voltage tweaks and dropping 500MHz. Changes
cannot be justified in technical detail, but are field proven over
a large number of users, boards, and cheap power supplies.

 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 +++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 7d992c3c01ce..b99c78ecc4a9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -331,6 +331,11 @@ power: power-controller {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			power-domain@RK3328_PD_GPU {
+				reg = <RK3328_PD_GPU>;
+				clocks = <&cru ACLK_GPU>;
+				#power-domain-cells = <0>;
+			};
 			power-domain@RK3328_PD_HEVC {
 				reg = <RK3328_PD_HEVC>;
 				clocks = <&cru SCLK_VENC_CORE>;
@@ -570,9 +575,13 @@ map0 {
 							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 					contribution = <4096>;
 				};
+				map1 {
+					trip = <&target>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <4096>;
+				};
 			};
 		};
-
 	};
 
 	tsadc: tsadc@ff250000 {
@@ -651,7 +660,35 @@ gpu: gpu@ff300000 {
 				  "ppmmu1";
 		clocks = <&cru ACLK_GPU>, <&cru ACLK_GPU>;
 		clock-names = "bus", "core";
+		operating-points-v2 = <&gpu_opp_table>;
+		power-domains = <&power RK3328_PD_GPU>;
 		resets = <&cru SRST_GPU_A>;
+		#cooling-cells = <2>;
+	};
+
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1075000>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-microvolt = <1075000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1075000>;
+		};
+
+		opp-500000000 {
+			/* causes stability issues */
+			opp-hz = /bits/ 64 <500000000>;
+			opp-microvolt = <1150000>;
+			status = "disabled";
+		};
 	};
 
 	h265e_mmu: iommu@ff330200 {
-- 
2.34.1


