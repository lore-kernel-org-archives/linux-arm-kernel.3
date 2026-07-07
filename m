Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4F1C44506
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIbqy13pLdQp9hThVjpx/QgDX/Sny7F5ndXxNwOzYTM=; b=GWgWJysyr4W08eV/YCRTWB5tq3
	LYlUbpuVTKtRMDi0UNA8uVvDjw3ilHuZNhHNthdFIeVFJwFM0NlZAiEVd5kgPTotz8eZO0FLs2eld
	z+MXJ+PiGxPvq+qJBPwFn5U+aNc3aFgT4tgEKl4DPQ8QBqKCASUZRnA3Ibc4glaC0BS1TCnyieuCq
	vz8uA2dCrKa20UpJLr4w40pbpKx27koghXfFvvhhMrf+aypEZCGTrHcAlm59471IWzIFS25GLVEaB
	zyyq3azSU3H3aXa+bdlxYFKC4XWylSt+SC+P/Uo4OeoYdEBCfzNK2qTt1mI6sUFvrjLQRiLpB6ayw
	kMH+E8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SO-0000000EfRz-3xH3;
	Tue, 07 Jul 2026 09:51:12 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh2SH-0000000EfLT-1ziN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 09:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZIbqy13pLdQp9hThVjpx/QgDX/Sny7F5ndXxNwOzYTM=; b=D7rApP3BpK6FlX+DrOI5XdkSuj
	LiZt9CZEYbGzZ//UM9Br7YKajA1dDdBOnuyAo+AMT6QPEW8eXByrRxF+paWNDvewdlCWo6lmGEdkU
	hqHG+HYk96HP08CRKSlPUakpWsR3cotAM0zyy64cydil3tUKyGxdcf+4C2Kn1YXEyJwYwvCxhRdzB
	xurTq/99x/3qQlyrMvoW5BEV9o1IEbBusFrR/OMCJqJLIWnPT8pF21JrYyoaiKkQs+UZoPoziXDZn
	eWQht6moFG/7rkSBj56NDH7Uv7VwXoD0CWZWvb8bPk8iA+M+q3URpF2XAe6Vi2Q5LlErDjlfMj0YO
	it5PUm3g==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SF-000PX2-2C;
	Tue, 07 Jul 2026 11:51:03 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh2SF-000Ck1-0C;
	Tue, 07 Jul 2026 11:51:03 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 8/8] arm64: dts: fsl-lx2160a: Add vcc-supply for SPI-NOR flashes
Date: Tue,  7 Jul 2026 11:50:55 +0200
Message-ID: <20260707095057.1745867-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
References: <20260707095057.1745867-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_025105_518978_BA68409D 
X-CRM114-Status: UNSURE (   9.18  )
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

Both NOR flashes are powered by 1V8 power rail.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
index d64879ee5e54a..b1fa9de0011fc 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-tqmlx2160a.dtsi
@@ -29,6 +29,14 @@ aliases {
 		ethernet17 = &dpmac18;
 	};
 
+	reg_vcc1v8: regulator-vcc1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "OVDD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
 	reg_vcc3v3: regulator-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC3V3";
@@ -65,6 +73,7 @@ flash0: flash@0 {
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vcc1v8>;
 
 		partitions {
 			compatible = "fixed-partitions";
@@ -81,6 +90,7 @@ flash1: flash@1 {
 		spi-max-frequency = <10000000>;
 		spi-rx-bus-width = <1>;
 		spi-tx-bus-width = <1>;
+		vcc-supply = <&reg_vcc1v8>;
 	};
 };
 
-- 
2.54.0


