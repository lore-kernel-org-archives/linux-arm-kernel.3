Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52088D39410
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BoXlgipnNG+DuSePjmrCMzbqdgrmzoaZUj/nX6RrCU=; b=qq5Q+CxxDiCUOzW8Ix8EB9YbxH
	GWhCBFAF08aSR+yyXq/KkHiXkiPvELU7BuoaIQ1TUvVZRqwpUkr1BkddtwsaAep0RhLw7xzxFuM4l
	VjIxij4p1tYu1Q8HedobO8hYX4kMUh0hpU0NubTaPQgqp8DzMROleeN3jI7XGMzKeUMnOU49bewaI
	ALLTLGtAh4xx7MrMfqU2tAhZBuQvJpP5qRw27oyP90c4ZFI/Q+RtIh+Q7NN+65JjTmyuyt7YBqckw
	iMqfF2M9V3TA86nSnEjlIgkGaH3Jz4oG5e9ftjeFA/KTikm5csEEc3KJKYdeGD6vCHlt4VKLXkPQe
	/0NpvYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjV-0000000HSgk-3M6m;
	Thu, 02 Apr 2026 10:57:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjU-0000000HSeE-2d0g
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 10:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+BoXlgipnNG+DuSePjmrCMzbqdgrmzoaZUj/nX6RrCU=; b=PLwNciwETSzAPN4pjoIh6s9FnG
	MI8pO4RI3C0Yh28clRCgb8p0vVK5xjefW7HZ8VO4YFUfCM3BBTA2Z8KptoOOfYQIlqJ1iMZuvzJxx
	WUoK65UGP2W84rUsHZFoqrKgNzUXKa7MkhtZQTLf0JBfP2y9W1ug4sCuKzvZdciMDGfVL1bIE0fVJ
	f60rvJ2fB0mv6t2w9pvrUIYK9yCQXmhP6aKKK1SGla8dLmLqlMIeqYwKLqjnwYhbeU9DAwE4bNn7F
	iLEckIIsEsMwzh8MxqfVFLD7TH8Yf2fJzkQLXmRLj4sRoYMk8GEiPY6aupUHCUPaWLC0gQVJJQq4k
	e87Mx4+A==;
Received: from cp2.siel.si ([46.19.12.180])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjQ-0000000CADl-2IQw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+BoXlgipnNG+DuSePjmrCMzbqdgrmzoaZUj/nX6RrCU=; b=V0CLWWY/sLKZOW2STEH4RHVwE5
	lJ6E+w2HmPYIM1EE63oh4TJY8ytqInDyDJQUSRz7tCH4PC4p8+97rtCDGi6YU4lrzNcXI4eUCFHTG
	nthOkKpkN4rgKQzG7FIHX3BZyfR2eVX4W72Q2r02PFnn3oZAHo1lil+oRmWICWezomRWpXTgiTnye
	TlvSbl/iVm+2ato1WcY75+2qn7PiJyNeF7umexTr/E8noK42Buq6hVCqQ0AXJVynkSNvQ0cvWveZg
	avFwqOnUemws9/jGto7K/UyUOejlkabJjyM1becDskHnwbV1huaUGKll/zCAMpXNemkzWMy5eZL5/
	ni9TaIOg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52086 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Fig-00000009fYO-3jLJ;
	Thu, 02 Apr 2026 12:56:14 +0200
From: Florijan Plohl <florijan.plohl@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 4/5] arm64: dts: freescale: imx93-phyboard-nash: Add gpio-line-names
Date: Thu,  2 Apr 2026 12:56:12 +0200
Message-ID: <20260402105613.1303871-4-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402105613.1303871-1-florijan.plohl@norik.com>
References: <20260402105613.1303871-1-florijan.plohl@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_115700_735346_D0B7E481 
X-CRM114-Status: UNSURE (   4.58  )
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

Add gpio-line-names for GPIOs with a defined board-level
function on the PHYTEC phyBOARD-Nash-i.MX93.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../dts/freescale/imx93-phyboard-nash.dts     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
index eac389ed30f3..b82192f25498 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
@@ -141,6 +141,37 @@ &flexcan1 {
 	status = "okay";
 };
 
+&gpio1 {
+	gpio-line-names = "", "USER_LED", "I2C2_SCL", "I2C2_SDA";
+};
+
+&gpio2 {
+	gpio-line-names = "SPI6_CS0", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "TPM_nIRQ", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "I2C3_SDA", "I2C3_SCL";
+};
+
+&gpio3 {
+	gpio-line-names = "SD2_nCD", "", "", "", "",
+			  "", "", "SD2_nRESET", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "nENET1_INT";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "nCAN_EN", "", "", "",
+			  "", "", "", "RESET_PHY", "",
+			  "", "RTC_nINT", "PMIC_IRQ_B";
+};
+
 /* I2C2 */
 &lpi2c2 {
 	clock-frequency = <400000>;
-- 
2.43.0


