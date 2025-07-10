Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6B8C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 06:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFDyMbCkO2ZwbHpRqQKoKj9ZE4qcw7HW3UuqnlBlvfI=; b=lz5p3EohDP8DYLLmeoInYFs6/d
	pHb/hmn+mT7jKNZ9LtKwAMBKHes7Cjr6b0mp6FSKDItKVkTCdlA6x6KYQLsyD0DZ2cLjdQqzMNGnB
	pPMFibkgEWC4ZrsgYCdVURD6LvMneBMT7UV8C6GTdENvl7tjGh+wxrWyy9wPRSEbTclSfMCQPWAQ3
	VH+dM93OBmmBYphekLIGnwmKtZCPAxN5GbTh1AgPBMlCeX9qbrIxOp4koh2MEx2BV9uUQ0zW7hoPy
	3tL9SCYZ46BJvApH0wu2FOwcke5EN3jvSiK/xE9mVFoNlDXdwU9n4y4TFr4fLgDhYpUabDd+SLhBR
	sgYbcyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7Vc-0000000DsxH-3GYX;
	Fri, 11 Jul 2025 06:45:24 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7Mx-0000000Drf1-0SWQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 06:36:28 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250711063625epoutp019a642052e5dcb318284d8deb84b09529~RHvkonA2m0226502265epoutp01t
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 06:36:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250711063625epoutp019a642052e5dcb318284d8deb84b09529~RHvkonA2m0226502265epoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752215785;
	bh=GFDyMbCkO2ZwbHpRqQKoKj9ZE4qcw7HW3UuqnlBlvfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MeRlB3yb1Bbfqs555VrbWIvza6o8vxQFUQTIuazCHXsZWUBilkMpFwATvqgZFCZPT
	 GvOMQbJHclpxJmjVNrBxfG2NgjO4k/1XM+XLPXugi6snOMB+nuE+4cdjPJK8gC/DsJ
	 +dJfY9JCD7ROK2t5HC9Cu+9yBHs/+wsCMfg8V2yw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250711063624epcas5p3398f1d9b43f4dd34f41b8367e7cc6607~RHvj82xRm0433604336epcas5p3-;
	Fri, 11 Jul 2025 06:36:24 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.176]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bdhnL5YzVz3hhTM; Fri, 11 Jul
	2025 06:36:22 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250710082538epcas5p2556f80b4193a046262808ae7742675be~Q1lpZdY_s0977409774epcas5p2X;
	Thu, 10 Jul 2025 08:25:38 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082536epsmtip12dd8cd863df7974d872c656c4082f2fa~Q1ln5BXAh0693006930epsmtip12;
	Thu, 10 Jul 2025 08:25:36 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v2 3/3] arm64: dts: exynosautov9: add RTC DT node
Date: Thu, 10 Jul 2025 14:04:34 +0530
Message-Id: <20250710083434.1821671-4-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710083434.1821671-1-dev.tailor@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710082538epcas5p2556f80b4193a046262808ae7742675be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082538epcas5p2556f80b4193a046262808ae7742675be
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082538epcas5p2556f80b4193a046262808ae7742675be@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_233627_458703_F2D1D116 
X-CRM114-Status: GOOD (  14.84  )
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

Add DT node for on-chip RTC for ExynosAutov9

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts |  4 ++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi     | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
index de2c1de51a76..5f5167571f7a 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
+++ b/arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
@@ -106,6 +106,10 @@ &pwm {
 	status = "okay";
 };
 
+&rtc {
+	status = "okay";
+};
+
 &serial_0 {
 	pinctrl-0 = <&uart0_bus_dual>;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 66628cb32776..afa6b258153c 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -1633,6 +1633,16 @@ pwm: pwm@103f0000 {
 			clock-names = "timers";
 			status = "disabled";
 		};
+
+		rtc: rtc@10540000 {
+			compatible = "samsung,exynosautov9-rtc";
+			reg = <0x10540000 0x100>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&xtcxo>;
+			clock-names = "rtc";
+			status = "disabled";
+		};
 	};
 };
 
-- 
2.34.1


