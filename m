Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80559C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHiB1M85VGtsR/nshHD2x3rEN5vUZAWnBNyMS8ssk/k=; b=G5LEADYUEKuNexhDGDx9VLWbZ+
	u6Q9JC8Y9mwdtnNrZqC6uOZxsHpjclYSxnv30nkw2yCOSjHOGmp89FXBuPqL1ns3+PL4ds9i5sVBg
	SiV7bO02W/tEe/Q8Vp/OaBEMin2QpEuV7m2rLkjd7Efssee2BYhMdRU1Vy63yFog6Wz5Ee2RPAxye
	XyqJSIEBoc9+lh+9AArC3R89G1rsQRNv0SQJIUd7CtwA2ooRlsMfDLF6LC5GDFCoZBzqHvwTRhM0p
	oLokEx3gwXR3JOQZgjmBbFJ6OnqqbXlLNDRx24RkttPszLBc/Ojn1jIwWq/hD5SRY/yyIWjKQm2so
	1uRfDX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzUN-0000000988e-3BTN;
	Mon, 19 May 2025 12:21:04 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGzOy-0000000970S-3d1D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 12:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jHiB1M85VGtsR/nshHD2x3rEN5vUZAWnBNyMS8ssk/k=; b=CO4I0v
	3Sr1NVhsYy+ZtuERwgeF4Uph04r7ihtSHRLsVuSv+HXHx2bwRuaaAQF03otTtChe
	4U3/0orXT7LsGE22NfVvuqyarmeMUFpFzH6+jpjhsgi34b71cocn7Z6UnNWh97Uu
	omEvoIq5nS3Kmd0jwMEuL810b1WcVOWQCCPtOKH93KdWCXMaBuBr77kie5Ud+dnb
	OgyiU5ij+leX+pLnMt9JAm9b+1hstq5n+ZtxZ1r9PbFyLhMZk11uYgE1JVS5/VD6
	oEK5wTTxJT+FsO+dgr8/stE/pu5I9Y14fWurTH5sOKbOaFl57VYzG5GWX9SPUnlx
	trybxFdbkZgNN60A==
Received: (qmail 2475066 invoked from network); 19 May 2025 14:15:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 14:15:22 +0200
X-UD-Smtp-Session: l3s3148p1@qBMJFnw1DppZz6+V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO based I2C busses
Date: Mon, 19 May 2025 14:15:01 +0200
Message-ID: <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_051529_179770_88A8B858 
X-CRM114-Status: GOOD (  10.76  )
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

There shall not be a '-' before the number.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 8f02de8480b6..197de398dd9b 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -85,7 +85,7 @@ homepage-key {
 		};
 	};
 
-	i2c_max98504: i2c-gpio-0 {
+	i2c_max98504: i2c-gpio0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&gpd0 1 GPIO_ACTIVE_HIGH>;
 		scl-gpios = <&gpd0 0 GPIO_ACTIVE_HIGH>;
-- 
2.47.2


