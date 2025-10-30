Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FA6CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJM31IhVnkrhRCrb49g6ODItYSKCRzC2GROjcDOi1x0=; b=sJyGHbnBTWu3JdZxMHI9uPQCdx
	Se9U+rmU446lTC8OybSehndVxim+ubOivEqpG3ImhYZTsEhhVqugC2HFTYANBkSBStfGKreR0eOCw
	Mb+cUxkXEzYLU5dpUsaPslXW3MBPtFPeFqWRE7ulLoK4HhPwr1NmEk9uffkKQD0qQ3cUpPO+VqCtc
	/jyTUJpq1QxttoEOWdKOS/3LN8Lfe4cOvWZVCVD/S75Lv+jOtNVtpZUTOKVOKOQHD+UGGc9bHyKF7
	3w+JUlFRO0Z/Ok3VSTMVCN/O/tnH5eR/wFVlunT8LoMjVu2JFIul+EhhB3J9W2JHsj9KDPxiJ35zc
	h21S+t4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6u-000000049DP-0yQa;
	Thu, 30 Oct 2025 12:50:36 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vES6j-0000000494r-24bR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 12:50:26 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=dJM31IhVnkrhRCrb49g6ODItYSKCRzC2GROjcDOi1x0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1761828615;
 b=WzTkUIc/He2j1B6aD3kgPyHopMPwKhKynnYX6En+5f+wDY5pS8xWa5+dyA5FUoEie2MBeTEt
 dbVGwi3qS+ETkXI0PX1DcivGY01JDxIZ5FyVg8qc6+x7vGltck8GUzh/znUzcY3R65chN2A2CTn
 UDPqtkatyTiJgtpp99KcVpkTK/xoFIg7P0bk0Y14koUJ3UWGtE62D63e6fLi5MGDsn61PYUbH7C
 oWB+7wbCnKsa+dDK+aYmwoqOXYDXkOcqTd2DygOSuQJvYXHUaeb0iOhkGc3B6aFd2lrN6ldnv0v
 kRhdZZslcF86bgwq1Dha6xd7YqklsZEP1qZ2yRIu/7njw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1761828615;
 b=tPOwZ/XK509QKZlsbfuTlVGVUCmjLT31SUVXuD3Qlq/wa7BwsE4RxwK3e059ZmGWXbn8muk9
 ogLRxdDcRtQ/piCYdhfbmXm5JBQCGamiFoUCUvKYqFloQ+RvnlXmvk9EBW6hkeXlz6kuUAqwm2n
 dxDwfCzkzh/kCWD6QkjQbaGHfEwRMJs44LdlwUqbT16A0KF+8B3+BGtOrceQL773HN6YLjc7fIe
 bVK6lYwWYFjtpqqNVHU5vAHqUncRdeyvTaAuJeILSozA6Zr5AXMkvTVn5ZuOOExd8Kw7dsMz237
 aWNU4HhFYyoY7htjh7aGZJkPvM09yXbY6+RrApRdwDwvw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Thu, 30 Oct 2025 13:50:15 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9F4B6220D37;
	Thu, 30 Oct 2025 13:50:01 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/19] arm64: dts: imx95-tqma9596sa: update pcie config
Date: Thu, 30 Oct 2025 13:49:16 +0100
Message-ID: <20251030124936.1408152-10-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
References: <20251030124936.1408152-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4cy3qG2sY6z1kNh4N
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 0baac1aa37dfad4f2d55415cd4bd5fae
X-cloud-security: scantime:1.795
DKIM-Signature: a=rsa-sha256;
 bh=dJM31IhVnkrhRCrb49g6ODItYSKCRzC2GROjcDOi1x0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1761828615; v=1;
 b=IXun1WupD99c8HFoLkUmSH2xzBdi+YInoFHsuBOLaru91rYLwCfM3yKguHN0uU+2VN0XpxOk
 ixnM/hUONzOfbcrrO0wW0UrnxJXHqZf0ZC+uyKdfBU6fRZyx4z/c9+VHUoS31v11uUKe+PItK7B
 drKa6wk8BGYdH95GHyPd8Qqzt7hANKoZynUCQeS4Dc6nFhK2/0u0iBBUvyJ1zScdV6p1jewNOzD
 One8fLecE+g0qautferTW0vz6upvWtwGSjm1Wn8y8QR5u9rL0ek8sCv6ReKqU0uN4qFr8+gWPkp
 Sv3uiUd4q2TQtp7ZA6j0VgzHr1yfeIJKV/RUXDBdXMVHQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_055025_675110_A4366787 
X-CRM114-Status: GOOD (  10.04  )
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

Fix pcie clock config and switch from deprecated reset-gpio to
reset-gpios.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx95-tqma9596sa.dtsi   | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
index 832c753abcd75..36da8ff8d1835 100644
--- a/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
@@ -395,22 +395,24 @@ &pcie0 {
 	pinctrl-0 = <&pinctrl_pcie0>;
 	pinctrl-names = "default";
 	clocks = <&scmi_clk IMX95_CLK_HSIO>,
-		 <&pcieclk 1>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL>,
 		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-	reset-gpio = <&expander2 9 GPIO_ACTIVE_LOW>;
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+		 <&pcieclk 1>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+	reset-gpios = <&expander2 9 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
 	clocks = <&scmi_clk IMX95_CLK_HSIO>,
-		 <&pcieclk 0>,
+		 <&scmi_clk IMX95_CLK_HSIOPLL>,
 		 <&scmi_clk IMX95_CLK_HSIOPLL_VCO>,
-		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>;
-	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux";
-	reset-gpio = <&expander2 10 GPIO_ACTIVE_LOW>;
+		 <&scmi_clk IMX95_CLK_HSIOPCIEAUX>,
+		 <&pcieclk 0>;
+	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux", "ref";
+	reset-gpios = <&expander2 10 GPIO_ACTIVE_LOW>;
 };
 
 &sai3 {
-- 
2.43.0


