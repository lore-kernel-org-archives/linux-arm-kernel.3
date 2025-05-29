Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC099C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCzfbZekv4htNUijIC+SbkqBGyLEFOMaleFjXJEgatk=; b=ieB2spGGnvMTTY2cOwomPCahRG
	TaSKoC7HxCxlx40PPJio1/L5kkZA0+wToK7duBAqQDnWICpWUcgjT6VL6SQnjz/oNpNBJDTE7tDun
	SIS3Mq8Gw/rkToUp9nZ2F494PrHteZkkjZFMl0wki940ugQftPqQOFlTvRPE44LzARPxqRAXTLUPu
	Uev/SxVWg4Q0YcqfpIILEB6Els21NhbDJGMjwi+w/YkPU5KafeFSwc7ed5P4em0wRCQWibT65AMSR
	aidZSIMDfNhR5LHtGqaffAdG/4Capq6UvmvopkA0w+v5y24jZ0hbySHOwGsZVKpQRBXpMj4gsYk34
	ScN3Yypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKezS-0000000G2mV-3BOE;
	Thu, 29 May 2025 15:16:18 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdq3-0000000FvzR-0zlG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:02:32 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250529140227epoutp04763dd4ce8ded5e3c598a06d4c074d43f~EBFunsBHc2061820618epoutp04z
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 14:02:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250529140227epoutp04763dd4ce8ded5e3c598a06d4c074d43f~EBFunsBHc2061820618epoutp04z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748527347;
	bh=gCzfbZekv4htNUijIC+SbkqBGyLEFOMaleFjXJEgatk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pQRhGPFoL+9I1NyzEAuNZMzXCCh+59SIW5X+Soj1sPdR/Kb+oC4OO89NDIUAXx9bt
	 ojZh0s28UbNv4XP9xM/04xKAnL/ldctCENwxlKRiDy4xIWis8EmNPd5yA4pd9TafW8
	 I91Y5viLqoNBVZxeYBKmIKzR9XDaX8GgZuZM31Pk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250529140226epcas5p25bdafdf609607873ca08557b6ad3a85f~EBFt-QyMW1140911409epcas5p2c;
	Thu, 29 May 2025 14:02:26 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.175]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4b7Sjr3GW2z2SSKX; Thu, 29 May
	2025 14:02:24 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250529111718epcas5p4572d6aa7ae959b585b658d5a94f2b4ef~D_1iJ4i-t0282202822epcas5p4D;
	Thu, 29 May 2025 11:17:18 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250529111718epsmtrp1257cc470d2823aa85b322766527d6595~D_1iJE18d1149011490epsmtrp1p;
	Thu, 29 May 2025 11:17:18 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-35-6838423d6874
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	8D.D0.19478.D3248386; Thu, 29 May 2025 20:17:17 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250529111715epsmtip16ae03b6cb035bd17825b1eb64d85c26c~D_1fb-zLZ2103321033epsmtip1G;
	Thu, 29 May 2025 11:17:14 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	chandan.vn@samsung.com, karthik.sun@samsung.com, dev.tailor@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v3 4/4] arm64: dts: exynosautov920: add CMU_HSI2 clock DT
 nodes
Date: Thu, 29 May 2025 16:56:40 +0530
Message-Id: <20250529112640.1646740-5-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529112640.1646740-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeLIzCtJLcpLzFFi42LZdlhJTtfWySLDYOMxK4sH87axWUz4EmGx
	Zu85JovrX56zWtzbsYzdYv6Rc6wWjTPeMFmcP7+B3WLT42usFh977rFaXN41h81ixvl9TBYX
	T7laHFsgZvF95R1GiyNnXjBb/N+zg93i8Jt2Vot/1zayWEw+vpbVomnZeiYHUY/3N1rZPXbO
	usvusWlVJ5vH5iX1Hn1bVjF6fN4kF8AWxWWTkpqTWZZapG+XwJWxf3InW8EDzoqrvVvYGxjf
	sncxcnJICJhIvGltY+5i5OIQEtjOKHFi12dmiISExL7/vxkhbGGJlf+es0MUvWWUaO7fD5Zg
	E9CSuLL9HRtIQkSgi0ni3L9XLCAOs8BOJom2x9vAdggL+Ess/vIKbCyLgKrEre2P2EBsXgFr
	iS+XN7JBrJCX2H/wLFgNp4CNxN2bz1lAbCGgmo/bzzBD1AtKnJz5BCzODFTfvHU28wRGgVlI
	UrOQpBYwMq1iFE0tKM5Nz00uMNQrTswtLs1L10vOz93ECI4wraAdjMvW/9U7xMjEwXiIUYKD
	WUmEt8neLEOINyWxsiq1KD++qDQntfgQozQHi5I4r3JOZ4qQQHpiSWp2ampBahFMlomDU6qB
	idvibYjTjh3t77kylfP2Bt03DHy/lcnuflfZzI6fJV6Pftw7LKM2qzA+a8Nke72v5z/9nTd1
	u+DuQzdO7jd5YNB9WlAxd/7iz1OcfhdHMh2w8A3am/Vzts8u4/bc1WnPTDIOWcn+ivy9VVVp
	s/xtFRWV2X/v+uelL38i+UfFLUrhRl5Mw926w1V712uGzn+Wt3lZ9C3PD1M6TsfdXlF2+s7H
	7KvX3m2QUZZvTp6cqFQ89X/RJls//8SLHim80dsuVLP8O6GhFtuknO45qXrpPsO5cpdUr/V6
	7+3QnM7y6hzDGaW7zb+aLcNeeqQdSEiVWv8vqDrMPkj6icty1ZNfeVf01Ur+WPmn1MTU7IRH
	gRJLcUaioRZzUXEiAAc6exQfAwAA
X-CMS-MailID: 20250529111718epcas5p4572d6aa7ae959b585b658d5a94f2b4ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111718epcas5p4572d6aa7ae959b585b658d5a94f2b4ef
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111718epcas5p4572d6aa7ae959b585b658d5a94f2b4ef@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_070231_706197_FE784DC7 
X-CRM114-Status: GOOD (  13.00  )
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

Add required dt node for CMU_HSI2 block, which
provides clocks to ufs and ethernet IPs

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
index 2cb8041c8a9f..7890373f5da0 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
@@ -1048,6 +1048,23 @@ pinctrl_hsi1: pinctrl@16450000 {
 			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		cmu_hsi2: clock-controller@16b00000 {
+			compatible = "samsung,exynosautov920-cmu-hsi2";
+			reg = <0x16b00000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&xtcxo>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_NOC_UFS>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_UFS_EMBD>,
+				 <&cmu_top DOUT_CLKCMU_HSI2_ETHERNET>;
+			clock-names = "oscclk",
+				      "noc",
+				      "ufs",
+				      "embd",
+				      "ethernet";
+		};
+
 		pinctrl_hsi2: pinctrl@16c10000 {
 			compatible = "samsung,exynosautov920-pinctrl";
 			reg = <0x16c10000 0x10000>;
-- 
2.34.1


