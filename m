Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0321C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 15:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpHunI4Q5945yEc9hYc94Izz4fWB9Fia9hDC3kt/MFA=; b=hnpwWnM0+2QVBFLH8Lu0/qCE+8
	CRiM8bPd4+yMBzl/hzGSbSBdyGLWZTKP+fgFaGkDAEA/SbfSRnsDL53Zp9HI1Tc+YLSfZTnROhz7d
	JhZiZjaTm4himeWeD2j1IGPEeiiTgCtqgsfiqhbGBJUq4iU+C7LKtThYU5g2I7sYRdsDxT9Egcpz6
	jEzWl9QMxIu45Vwm+AlNZ8XLxlIEhmatn9aqfzsEyAt5Bplh4YVUSlkNXdDGAiYaXkwJHoQGho6/W
	seJegrdYT7X01N04QtHk9xm7YnLjYCy97uIArharaUOCKuKFXYmBrkX5obRjcLPbfyhUk2yMCmc/D
	omsKKUZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVX5l-0000000GvnZ-0VOX;
	Sat, 28 Jun 2025 15:03:45 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVWs1-0000000Gu2C-0qBI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 14:49:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751122171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TpHunI4Q5945yEc9hYc94Izz4fWB9Fia9hDC3kt/MFA=;
	b=OPH9awXXHy0qHBPky613yy557pwSFvvRjvIeVVoQ077ijb6IzrOAtqGUuV3P3Oo4SzZuJH
	24FJlLvBY06I57jnFa5hBHGAkm4Bt0UX3c00PqGNzR+tm7Hw6/KHV8IBq97mQSNDI3PJ+y
	4wGm1PdWhfnvfr+imV9e2gMdIKPAOOZm8+oPK0g74U/NyaHfBP/gstr7gNYn2nqZ2y0rhy
	LhhIyaqE8fRAbXcJqCgP+/JaOnff7vQKE1zv6TCN6m2oMqAHF2XLemjDdI6WuICEG8fYcx
	wMxP90BlPrjRwS/Ec879dRb9/edF9RHDnm3hP2PWr6auf0pwT8Uz0PnVu0AtjA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v2 06/10] arm64: dts: rockchip: Simplify mipi_out endpoint on rk3399 RP64 dtso
Date: Sat, 28 Jun 2025 16:32:40 +0200
Message-ID: <20250628144915.839338-7-didi.debian@cknow.org>
In-Reply-To: <20250628144915.839338-1-didi.debian@cknow.org>
References: <20250628144915.839338-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_074933_420447_5E921FE8 
X-CRM114-Status: UNSURE (   9.27  )
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

The only thing actually added here is a single endpoint on mipi_out,
which is already defined in rk3399-base.dtsi, so it's simpler to just
reference that phandle, which allows the removal of several properties.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../dts/rockchip/rk3399-rockpro64-screen.dtso | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
index a26c8e05c13b..77973ae870b6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso
@@ -52,19 +52,6 @@ &mipi_dsi {
 	#size-cells = <0>;
 	status = "okay";
 
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		mipi_out: port@1 {
-			reg = <1>;
-
-			mipi_out_panel: endpoint {
-				remote-endpoint = <&mipi_in_panel>;
-			};
-		};
-	};
-
 	mipi_panel: panel@0 {
 		compatible = "feiyang,fy07024di26a30d";
 		reg = <0>;
@@ -80,6 +67,12 @@ mipi_in_panel: endpoint {
 	};
 };
 
+&mipi_out {
+	mipi_out_panel: endpoint {
+		remote-endpoint = <&mipi_in_panel>;
+	};
+}
+
 &pwm0 {
 	status = "okay";
 };
-- 
2.50.0


