Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5883C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nn1xUu8T7htvWtlrcfnf3CgZu7iBFZUrInzdEheFlw=; b=Ytikq5vifntRMb0dxZhFOCN03G
	+7C7tu8Zb97Ol6pKy84ZJxmRJp/pTDJgqHAEPimwglZbkqO6ATc9l0ZuTIf4AuEMDwzCKTzNyo4qK
	LPrFP78+67lOF53pWMmjZKlqxOJVuzGQSXs6tnrM23EQzNayR5sa2uoapKXLYuvYCz5a38ZQ5PVVg
	FMlQjmjwSefy9IHL0P0c6iBMdwzljNIeUYjoygdjD+W340j08/Ncq7iFuBBLs05zc31vqeW09eHhB
	dzvfOf3nVt7tZAvC1wcuC2DSvRfmvk+Th3Ngdfgc05OniBVSfHGZ8e8Rgop40URs1fQwUlEij8qH3
	lmt1D2dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmd-00000008dmU-15qr;
	Thu, 27 Feb 2025 19:42:59 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnip6-00000008LSG-2QmG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 18:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740681688; bh=3nn1xUu8T7htvWtlrcfnf3CgZu7iBFZUrInzdEheFlw=;
 b=fJNR3S8iXkAhWfq4vOEDVTLkgc+FvVFb3Y0mhCiNEDhG61uIZ/vWW3EmSLugH/yTkWIJXFLh1
 iXOiSQh+MbOJa/BylxDgEt2h1lAkNx4D/GwO2L3Cl/hZ5t4fwShPknnNDtq5uJcIZyaD5U/rtSX
 W0ALh5mvYeHOj9RRCv3+AVuPLxLnUaBv/KGVW5t+CmkabVr8YVGnneqBpqDkR0i3KAseOec+KFQ
 Rt24IVXNd8pOuKro/Ksa6E5OwAA2yE2eTM0SP3QdpMRyDfD0PlnbuHwJc0ffLeONF5uzoPiRYB+
 aaSSxBKllVLzuPruOKd9Ps1aP7o+VlxgiVO5qc9GNgmA==
X-Forward-Email-ID: 67c0b1d6bf572996e86214ae
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 3/4] arm64: dts: rockchip: Add SARADC node for RK3528
Date: Thu, 27 Feb 2025 18:40:52 +0000
Message-ID: <20250227184058.2964204-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250227184058.2964204-1-jonas@kwiboo.se>
References: <20250227184058.2964204-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_104128_709511_5CB7D0CB 
X-CRM114-Status: GOOD (  11.12  )
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

Add a device tree node for the SARADC controller used by RK3528.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 5b334690356a..0fb90f5c291c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/clock/rockchip,rk3528-cru.h>
+#include <dt-bindings/reset/rockchip,rk3528-cru.h>
 
 / {
 	compatible = "rockchip,rk3528";
@@ -251,5 +252,17 @@ uart7: serial@ffa28000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		saradc: adc@ffae0000 {
+			compatible = "rockchip,rk3528-saradc";
+			reg = <0x0 0xffae0000 0x0 0x10000>;
+			clocks = <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
+			clock-names = "saradc", "apb_pclk";
+			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&cru SRST_P_SARADC>;
+			reset-names = "saradc-apb";
+			#io-channel-cells = <1>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.48.1


